# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Analytics
    module Data
      module V1alpha
        # A contiguous set of days: startDate, startDate + 1, ..., endDate. Requests
        # are allowed up to 4 date ranges, and the union of the ranges can cover up to
        # 1 year.
        # @!attribute [rw] start_date
        #   @return [::String]
        #     The inclusive start date for the query in the format `YYYY-MM-DD`. Cannot
        #     be after `end_date`. The format `NdaysAgo`, `yesterday`, or `today` is also
        #     accepted, and in that case, the date is inferred based on the property's
        #     reporting time zone.
        # @!attribute [rw] end_date
        #   @return [::String]
        #     The inclusive end date for the query in the format `YYYY-MM-DD`. Cannot
        #     be before `start_date`. The format `NdaysAgo`, `yesterday`, or `today` is
        #     also accepted, and in that case, the date is inferred based on the
        #     property's reporting time zone.
        # @!attribute [rw] name
        #   @return [::String]
        #     Assigns a name to this date range. The dimension `dateRange` is valued to
        #     this name in a report response. If set, cannot begin with `date_range_` or
        #     `RESERVED_`. If not set, date ranges are named by their zero based index in
        #     the request: `date_range_0`, `date_range_1`, etc.
        class DateRange
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # The unique identifier of the property whose events are tracked.
        # @!attribute [rw] property_id
        #   @return [::String]
        #     A Google Analytics App + Web property id.
        class Entity
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Dimensions are attributes of your data. For example, the dimension City
        # indicates the city, for example, "Paris" or "New York", from which an event
        # originates. Requests are allowed up to 8 dimensions.
        # @!attribute [rw] name
        #   @return [::String]
        #     The name of the dimension.
        # @!attribute [rw] dimension_expression
        #   @return [::Google::Analytics::Data::V1alpha::DimensionExpression]
        #     One dimension can be the result of an expression of multiple dimensions.
        #     For example, dimension "country, city": concatenate(country, ", ", city).
        class Dimension
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Used to express a dimension which is the result of a formula of multiple
        # dimensions. Example usages:
        # 1) lower_case(dimension)
        # 2) concatenate(dimension1, symbol, dimension2).
        # @!attribute [rw] lower_case
        #   @return [::Google::Analytics::Data::V1alpha::DimensionExpression::CaseExpression]
        #     Used to convert a dimension value to lower case.
        # @!attribute [rw] upper_case
        #   @return [::Google::Analytics::Data::V1alpha::DimensionExpression::CaseExpression]
        #     Used to convert a dimension value to upper case.
        # @!attribute [rw] concatenate
        #   @return [::Google::Analytics::Data::V1alpha::DimensionExpression::ConcatenateExpression]
        #     Used to combine dimension values to a single dimension.
        #     For example, dimension "country, city": concatenate(country, ", ", city).
        class DimensionExpression
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Used to convert a dimension value to a single case.
          # @!attribute [rw] dimension_name
          #   @return [::String]
          #     Name of a dimension. The name must refer back to a name in dimensions
          #     field of the request.
          class CaseExpression
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Used to combine dimension values to a single dimension.
          # @!attribute [rw] dimension_names
          #   @return [::Array<::String>]
          #     Names of dimensions. The names must refer back to names in the dimensions
          #     field of the request.
          # @!attribute [rw] delimiter
          #   @return [::String]
          #     The delimiter placed between dimension names.
          #
          #     Delimiters are often single characters such as "|" or "," but can be
          #     longer strings. If a dimension value contains the delimiter, both will be
          #     present in response with no distinction. For example if dimension 1 value
          #     = "US,FR", dimension 2 value = "JP", and delimiter = ",", then the
          #     response will contain "US,FR,JP".
          class ConcatenateExpression
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # The quantitative measurements of a report. For example, the metric eventCount
        # is the total number of events. Requests are allowed up to 10 metrics.
        # @!attribute [rw] name
        #   @return [::String]
        #     The name of the metric.
        # @!attribute [rw] expression
        #   @return [::String]
        #     A mathematical expression for derived metrics. For example, the metric
        #     Event count per user is eventCount/totalUsers.
        # @!attribute [rw] invisible
        #   @return [::Boolean]
        #     Indicates if a metric is invisible.
        #     If a metric is invisible, the metric is not in the response, but can be
        #     used in filters, order_bys or being referred to in a metric expression.
        class Metric
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # To express dimension or metric filters.
        # The fields in the same FilterExpression need to be either all dimensions or
        # all metrics.
        # @!attribute [rw] and_group
        #   @return [::Google::Analytics::Data::V1alpha::FilterExpressionList]
        #     The FilterExpressions in and_group have an AND relationship.
        # @!attribute [rw] or_group
        #   @return [::Google::Analytics::Data::V1alpha::FilterExpressionList]
        #     The FilterExpressions in or_group have an OR relationship.
        # @!attribute [rw] not_expression
        #   @return [::Google::Analytics::Data::V1alpha::FilterExpression]
        #     The FilterExpression is NOT of not_expression.
        # @!attribute [rw] filter
        #   @return [::Google::Analytics::Data::V1alpha::Filter]
        #     A primitive filter.
        #     All fields in filter in same FilterExpression needs to be either all
        #     dimensions or metrics.
        class FilterExpression
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # A list of filter expressions.
        # @!attribute [rw] expressions
        #   @return [::Array<::Google::Analytics::Data::V1alpha::FilterExpression>]
        #     A list of filter expressions.
        class FilterExpressionList
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # An expression to filter dimension or metric values.
        # @!attribute [rw] field_name
        #   @return [::String]
        #     The dimension name or metric name. Must be a name defined in dimensions
        #     or metrics.
        # @!attribute [rw] null_filter
        #   @return [::Boolean]
        #     A filter for null values.
        # @!attribute [rw] string_filter
        #   @return [::Google::Analytics::Data::V1alpha::Filter::StringFilter]
        #     Strings related filter.
        # @!attribute [rw] in_list_filter
        #   @return [::Google::Analytics::Data::V1alpha::Filter::InListFilter]
        #     A filter for in list values.
        # @!attribute [rw] numeric_filter
        #   @return [::Google::Analytics::Data::V1alpha::Filter::NumericFilter]
        #     A filter for numeric or date values.
        # @!attribute [rw] between_filter
        #   @return [::Google::Analytics::Data::V1alpha::Filter::BetweenFilter]
        #     A filter for two values.
        class Filter
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # The filter for string
          # @!attribute [rw] match_type
          #   @return [::Google::Analytics::Data::V1alpha::Filter::StringFilter::MatchType]
          #     The match type for this filter.
          # @!attribute [rw] value
          #   @return [::String]
          #     The string value used for the matching.
          # @!attribute [rw] case_sensitive
          #   @return [::Boolean]
          #     If true, the string value is case sensitive.
          class StringFilter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # The match type of a string filter
            module MatchType
              # Unspecified
              MATCH_TYPE_UNSPECIFIED = 0

              # Exact match of the string value.
              EXACT = 1

              # Begins with the string value.
              BEGINS_WITH = 2

              # Ends with the string value.
              ENDS_WITH = 3

              # Contains the string value.
              CONTAINS = 4

              # Full regular expression match with the string value.
              FULL_REGEXP = 5

              # Partial regular expression match with the string value.
              PARTIAL_REGEXP = 6
            end
          end

          # The result needs to be in a list of string values.
          # @!attribute [rw] values
          #   @return [::Array<::String>]
          #     The list of string values.
          #     Must be non-empty.
          # @!attribute [rw] case_sensitive
          #   @return [::Boolean]
          #     If true, the string value is case sensitive.
          class InListFilter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Filters for numeric or date values.
          # @!attribute [rw] operation
          #   @return [::Google::Analytics::Data::V1alpha::Filter::NumericFilter::Operation]
          #     The operation type for this filter.
          # @!attribute [rw] value
          #   @return [::Google::Analytics::Data::V1alpha::NumericValue]
          #     A numeric value or a date value.
          class NumericFilter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # The operation applied to a numeric filter
            module Operation
              # Unspecified.
              OPERATION_UNSPECIFIED = 0

              # Equal
              EQUAL = 1

              # Less than
              LESS_THAN = 2

              # Less than or equal
              LESS_THAN_OR_EQUAL = 3

              # Greater than
              GREATER_THAN = 4

              # Greater than or equal
              GREATER_THAN_OR_EQUAL = 5
            end
          end

          # To express that the result needs to be between two numbers (inclusive).
          # @!attribute [rw] from_value
          #   @return [::Google::Analytics::Data::V1alpha::NumericValue]
          #     Begins with this number.
          # @!attribute [rw] to_value
          #   @return [::Google::Analytics::Data::V1alpha::NumericValue]
          #     Ends with this number.
          class BetweenFilter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # The sort options.
        # @!attribute [rw] metric
        #   @return [::Google::Analytics::Data::V1alpha::OrderBy::MetricOrderBy]
        #     Sorts results by a metric's values.
        # @!attribute [rw] dimension
        #   @return [::Google::Analytics::Data::V1alpha::OrderBy::DimensionOrderBy]
        #     Sorts results by a dimension's values.
        # @!attribute [rw] pivot
        #   @return [::Google::Analytics::Data::V1alpha::OrderBy::PivotOrderBy]
        #     Sorts results by a metric's values within a pivot column group.
        # @!attribute [rw] desc
        #   @return [::Boolean]
        #     If true, sorts by descending order.
        class OrderBy
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Sorts by metric values.
          # @!attribute [rw] metric_name
          #   @return [::String]
          #     A metric name in the request to order by.
          class MetricOrderBy
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Sorts by dimension values.
          # @!attribute [rw] dimension_name
          #   @return [::String]
          #     A dimension name in the request to order by.
          # @!attribute [rw] order_type
          #   @return [::Google::Analytics::Data::V1alpha::OrderBy::DimensionOrderBy::OrderType]
          #     Controls the rule for dimension value ordering.
          class DimensionOrderBy
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Rule to order the string dimension values by.
            module OrderType
              # Unspecified.
              ORDER_TYPE_UNSPECIFIED = 0

              # Alphanumeric sort by Unicode code point. For example, "2" < "A" < "X" <
              # "b" < "z".
              ALPHANUMERIC = 1

              # Case insensitive alphanumeric sort by lower case Unicode code point.
              # For example, "2" < "A" < "b" < "X" < "z".
              CASE_INSENSITIVE_ALPHANUMERIC = 2

              # Dimension values are converted to numbers before sorting. For example
              # in NUMERIC sort, "25" < "100", and in `ALPHANUMERIC` sort, "100" <
              # "25". Non-numeric dimension values all have equal ordering value below
              # all numeric values.
              NUMERIC = 3
            end
          end

          # Sorts by a pivot column group.
          # @!attribute [rw] metric_name
          #   @return [::String]
          #     In the response to order by, order rows by this column. Must be a metric
          #     name from the request.
          # @!attribute [rw] pivot_selections
          #   @return [::Array<::Google::Analytics::Data::V1alpha::OrderBy::PivotOrderBy::PivotSelection>]
          #     Used to select a dimension name and value pivot. If multiple pivot
          #     selections are given, the sort occurs on rows where all pivot selection
          #     dimension name and value pairs match the row's dimension name and value
          #     pair.
          class PivotOrderBy
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # A pair of dimension names and values. Rows with this dimension pivot pair
            # are ordered by the metric's value.
            #
            # For example if pivots = \\{\\{"browser", "Chrome"}} and
            # metric_name = "Sessions",
            # then the rows will be sorted based on Sessions in Chrome.
            #
            #     ---------|----------|----------------|----------|----------------
            #              |  Chrome  |    Chrome      |  Safari  |     Safari
            #     ---------|----------|----------------|----------|----------------
            #      Country | Sessions | Pages/Sessions | Sessions | Pages/Sessions
            #     ---------|----------|----------------|----------|----------------
            #         US   |    2     |       2        |     3    |        1
            #     ---------|----------|----------------|----------|----------------
            #       Canada |    3     |       1        |     4    |        1
            #     ---------|----------|----------------|----------|----------------
            # @!attribute [rw] dimension_name
            #   @return [::String]
            #     Must be a dimension name from the request.
            # @!attribute [rw] dimension_value
            #   @return [::String]
            #     Order by only when the named dimension is this value.
            class PivotSelection
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end
          end
        end

        # Describes the visible dimension columns and rows in the report response.
        # @!attribute [rw] field_names
        #   @return [::Array<::String>]
        #     Dimension names for visible columns in the report response. Including
        #     "dateRange" produces a date range column; for each row in the response,
        #     dimension values in the date range column will indicate the corresponding
        #     date range from the request.
        # @!attribute [rw] order_bys
        #   @return [::Array<::Google::Analytics::Data::V1alpha::OrderBy>]
        #     Specifies how dimensions are ordered in the pivot. In the first Pivot, the
        #     OrderBys determine Row and PivotDimensionHeader ordering; in subsequent
        #     Pivots, the OrderBys determine only PivotDimensionHeader ordering.
        #     Dimensions specified in these OrderBys must be a subset of
        #     Pivot.field_names.
        # @!attribute [rw] offset
        #   @return [::Integer]
        #     The row count of the start row. The first row is counted as row 0.
        # @!attribute [rw] limit
        #   @return [::Integer]
        #     The number of rows to return in this pivot. If unspecified, 10 rows are
        #     returned. If -1, all rows are returned.
        # @!attribute [rw] metric_aggregations
        #   @return [::Array<::Google::Analytics::Data::V1alpha::MetricAggregation>]
        #     Aggregate the metrics by dimensions in this pivot using the specified
        #     metric_aggregations.
        class Pivot
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Specification for a cohort report.
        # @!attribute [rw] cohorts
        #   @return [::Array<::Google::Analytics::Data::V1alpha::Cohort>]
        #     The definition for the cohorts.
        # @!attribute [rw] cohorts_range
        #   @return [::Google::Analytics::Data::V1alpha::CohortsRange]
        #     The data ranges of cohorts.
        # @!attribute [rw] cohort_report_settings
        #   @return [::Google::Analytics::Data::V1alpha::CohortReportSettings]
        #     Settings of a cohort report.
        class CohortSpec
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Defines a cohort. A cohort is a group of users who share a common
        # characteristic. For example, all users with the same acquisition date
        # belong to the same cohort.
        # @!attribute [rw] name
        #   @return [::String]
        #     Assigns a name to this cohort. The dimension `cohort` is valued to this
        #     name in a report response. If set, cannot begin with `cohort_` or
        #     `RESERVED_`. If not set, cohorts are named by their zero based index
        #     `cohort_0`, `cohort_1`, etc.
        # @!attribute [rw] dimension
        #   @return [::String]
        #     The dimension used by cohort. Only supports `firstTouchDate` for retention
        #     report.
        # @!attribute [rw] date_range
        #   @return [::Google::Analytics::Data::V1alpha::DateRange]
        #     The cohort selects users whose first visit date is between start date
        #     and end date defined in the `dateRange`. In a cohort request, this
        #     `dateRange` is required and the `dateRanges` in the `RunReportRequest` or
        #     `RunPivotReportRequest` must be unspecified.
        #
        #     The date range should be aligned with the cohort's granularity. If
        #     CohortsRange uses daily granularity, the date range can be aligned to any
        #     day. If CohortsRange uses weekly granularity, the date range should be
        #     aligned to the week boundary, starting at Sunday and ending Saturday. If
        #     CohortsRange uses monthly granularity, the date range should be aligned to
        #     the month, starting at the first and ending on the last day of the month.
        class Cohort
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Settings of a cohort report.
        # @!attribute [rw] accumulate
        #   @return [::Boolean]
        #     If true, accumulates the result from first visit day to the end day. Not
        #     supported in `RunReportRequest`.
        class CohortReportSettings
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Describes date range for a cohort report.
        # @!attribute [rw] granularity
        #   @return [::Google::Analytics::Data::V1alpha::CohortsRange::Granularity]
        #     Reporting date range for each cohort is calculated based on these three
        #     fields.
        # @!attribute [rw] start_offset
        #   @return [::Integer]
        #     For daily cohorts, this will be the start day offset.
        #     For weekly cohorts, this will be the week offset.
        # @!attribute [rw] end_offset
        #   @return [::Integer]
        #     For daily cohorts, this will be the end day offset.
        #     For weekly cohorts, this will be the week offset.
        class CohortsRange
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Reporting granularity for the cohorts.
          module Granularity
            # Unspecified.
            GRANULARITY_UNSPECIFIED = 0

            # Daily
            DAILY = 1

            # Weekly
            WEEKLY = 2

            # Monthly
            MONTHLY = 3
          end
        end

        # Response's metadata carrying additional information about the report content.
        # @!attribute [rw] data_loss_from_other_row
        #   @return [::Boolean]
        #     If true, indicates some buckets of dimension combinations are rolled into
        #     "(other)" row. This can happen for high cardinality reports.
        class ResponseMetaData
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Describes a dimension column in the report. Dimensions requested in a report
        # produce column entries within rows and DimensionHeaders. However, dimensions
        # used exclusively within filters or expressions do not produce columns in a
        # report; correspondingly, those dimensions do not produce headers.
        # @!attribute [rw] name
        #   @return [::String]
        #     The dimension's name.
        class DimensionHeader
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Describes a metric column in the report. Visible metrics requested in a
        # report produce column entries within rows and MetricHeaders. However,
        # metrics used exclusively within filters or expressions do not produce columns
        # in a report; correspondingly, those metrics do not produce headers.
        # @!attribute [rw] name
        #   @return [::String]
        #     The metric's name.
        # @!attribute [rw] type
        #   @return [::Google::Analytics::Data::V1alpha::MetricType]
        #     The metric's data type.
        class MetricHeader
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Dimensions' values in a single pivot.
        # @!attribute [rw] pivot_dimension_headers
        #   @return [::Array<::Google::Analytics::Data::V1alpha::PivotDimensionHeader>]
        #     The size is the same as the cardinality of the corresponding dimension
        #     combinations.
        # @!attribute [rw] row_count
        #   @return [::Integer]
        #     The cardinality of the pivot as if offset = 0 and limit = -1.
        class PivotHeader
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Summarizes dimension values from a row for this pivot.
        # @!attribute [rw] dimension_values
        #   @return [::Array<::Google::Analytics::Data::V1alpha::DimensionValue>]
        #     Values of multiple dimensions in a pivot.
        class PivotDimensionHeader
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Report data for each row.
        # For example if RunReportRequest contains:
        #
        # ```none
        # dimensions {
        #   name: "eventName"
        # }
        # dimensions {
        #   name: "countryId"
        # }
        # metrics {
        #   name: "eventCount"
        # }
        # ```
        #
        # One row with 'in_app_purchase' as the eventName, 'us' as the countryId, and
        # 15 as the eventCount, would be:
        #
        # ```none
        # dimension_values {
        #   name: 'in_app_purchase'
        #   name: 'us'
        # }
        # metric_values {
        #   int64_value: 15
        # }
        # ```
        # @!attribute [rw] dimension_values
        #   @return [::Array<::Google::Analytics::Data::V1alpha::DimensionValue>]
        #     List of requested dimension values. In a PivotReport, dimension_values
        #     are only listed for dimensions included in a pivot.
        # @!attribute [rw] metric_values
        #   @return [::Array<::Google::Analytics::Data::V1alpha::MetricValue>]
        #     List of requested visible metric values.
        class Row
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # The value of a dimension.
        # @!attribute [rw] value
        #   @return [::String]
        #     Value as a string if the dimension type is a string.
        class DimensionValue
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # The value of a metric.
        # @!attribute [rw] value
        #   @return [::String]
        #     Measurement value. See MetricHeader for type.
        class MetricValue
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # To represent a number.
        # @!attribute [rw] int64_value
        #   @return [::Integer]
        #     Integer value
        # @!attribute [rw] double_value
        #   @return [::Float]
        #     Double value
        class NumericValue
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Current state of all quotas for this Analytics Property. If any quota for a
        # property is exhausted, all requests to that property will return Resource
        # Exhausted errors.
        # @!attribute [rw] tokens_per_day
        #   @return [::Google::Analytics::Data::V1alpha::QuotaStatus]
        #     Analytics Properties can use up to 25,000 tokens per day. Most requests
        #     consume fewer than 10 tokens.
        # @!attribute [rw] tokens_per_hour
        #   @return [::Google::Analytics::Data::V1alpha::QuotaStatus]
        #     Analytics Properties can use up to 5,000 tokens per day. An API request
        #     consumes a single number of tokens, and that number is deducted from both
        #     the hourly and daily quotas.
        # @!attribute [rw] concurrent_requests
        #   @return [::Google::Analytics::Data::V1alpha::QuotaStatus]
        #     Analytics Properties can send up to 10 concurrent requests.
        # @!attribute [rw] server_errors_per_project_per_hour
        #   @return [::Google::Analytics::Data::V1alpha::QuotaStatus]
        #     Analytics Properties and cloud project pairs can have up to 10
        #     server errors per hour.
        class PropertyQuota
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Current state for a particular quota group.
        # @!attribute [rw] consumed
        #   @return [::Integer]
        #     Quota consumed by this request.
        # @!attribute [rw] remaining
        #   @return [::Integer]
        #     Quota remaining after this request.
        class QuotaStatus
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Explains a dimension.
        # @!attribute [rw] api_name
        #   @return [::String]
        #     This dimension's name. Useable in [Dimension](#Dimension)'s `name`. For
        #     example, `eventName`.
        # @!attribute [rw] ui_name
        #   @return [::String]
        #     This dimension's name within the Google Analytics user interface. For
        #     example, `Event name`.
        # @!attribute [rw] description
        #   @return [::String]
        #     Description of how this dimension is used and calculated.
        # @!attribute [rw] deprecated_api_names
        #   @return [::Array<::String>]
        #     Still usable but deprecated names for this dimension. If populated, this
        #     dimension is available by either `apiName` or one of `deprecatedApiNames`
        #     for a period of time. After the deprecation period, the dimension will be
        #     available only by `apiName`.
        class DimensionMetadata
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Explains a metric.
        # @!attribute [rw] api_name
        #   @return [::String]
        #     A metric name. Useable in [Metric](#Metric)'s `name`. For example,
        #     `eventCount`.
        # @!attribute [rw] ui_name
        #   @return [::String]
        #     This metric's name within the Google Analytics user interface. For example,
        #     `Event count`.
        # @!attribute [rw] description
        #   @return [::String]
        #     Description of how this metric is used and calculated.
        # @!attribute [rw] deprecated_api_names
        #   @return [::Array<::String>]
        #     Still usable but deprecated names for this metric. If populated, this
        #     metric is available by either `apiName` or one of `deprecatedApiNames`
        #     for a period of time. After the deprecation period, the metric will be
        #     available only by `apiName`.
        # @!attribute [rw] type
        #   @return [::Google::Analytics::Data::V1alpha::MetricType]
        #     The type of this metric.
        # @!attribute [rw] expression
        #   @return [::String]
        #     The mathematical expression for this derived metric. Can be used in
        #     [Metric](#Metric)'s `expression` field for equivalent reports. Most metrics
        #     are not expressions, and for non-expressions, this field is empty.
        class MetricMetadata
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Represents aggregation of metrics.
        module MetricAggregation
          # Unspecified operator.
          METRIC_AGGREGATION_UNSPECIFIED = 0

          # SUM operator.
          TOTAL = 1

          # Minimum operator.
          MINIMUM = 5

          # Maximum operator.
          MAXIMUM = 6

          # Count operator.
          COUNT = 4
        end

        # A metric's value type.
        module MetricType
          # Unspecified type.
          METRIC_TYPE_UNSPECIFIED = 0

          # Integer type.
          TYPE_INTEGER = 1

          # Floating point type.
          TYPE_FLOAT = 2

          # A duration of seconds; a special floating point type.
          TYPE_SECONDS = 4

          # An amount of money; a special floating point type.
          TYPE_CURRENCY = 9
        end
      end
    end
  end
end