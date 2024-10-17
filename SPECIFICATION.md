# domain-group


## PART 1 - CODING!

Please have this code ready to run on your machine at the time of our interview. You will be asked to
walk us through your solution.

Real Estate agencies have a few different ways of advertising their properties with Domain. One of
them is to send us an XML file with the property details. In this scenario, we will assume we have to
match the properties they are sending with properties already present in our database. This will be
used to determine if a property needs to be created or updated (we actually have other information
in the XML file to determine this, but let’s assume it’s not there for this exercise).
We perform some clean-up on the agency’s data before importing it, meaning that we can’t just
match the data “as-is”.

Let’s assume we have 3 agencies using this system (we may extend to more in the future), each with
different property matching rules:

* **Only The Best Real Estate! (AgencyCode: OTBRE)**

  Only The Best Real Estate! use a lot of punctuation in their property names and addresses.
  A property is a match if both the property name and address match when punctuation is
  excluded.

  For example, the property "*Super*-High! APARTMENTS (Sydney)" located at "32 Sir
  John-Young Crescent, Sydney, NSW." would be a match for a property called "Super High
  Apartments, Sydney" located at "32 Sir John Young Crescent, Sydney NSW".

* **Location Real Estate (AgencyCode: LRE)**

  Location Real Estate is not good at locating properties, and as a result their properties will
  often appear to be up to 200 metres away from the actual location when placed on a
  map.

  A property is a match if the agency code is the same and the property is within 200 metres or
  less of the actual property location. For the sake of simplicity, assume that 1 degree of
  latitude or longitude is equal to 111km.

* **Contrary Real Estate (AgencyCode: CRE)**

  Contrary Real Estate likes to have their property names backwards. A property is considered
  a match if the names match when the words in the name of the property are reversed.

  For example, a property with the name "Apartments Summit The" is a match for a
  property with the name "The Summit Apartments".


### Instructions
Given the following class:

```ruby
class Property
  attr_accessor :address, :agency_code, :name, :latitude, :longitude

  # @param [String] address
  # @param [String] agency_code
  # @param [String] name
  # @param [Float] latitude
  # @param [Float] longitude
  def initialise(address, agency_code, name, latitude, longitude)
    @address = address
    @agency_code = agency_code
    @name = name
    @latitude = latitude
    @longitude = longitude
  end
end
```

Implement the following interface to determine whether a particular property from any of the
agencies’ inventory is a match for a property from our inventory:

```ruby
class PropertyMatcher
  # @param [Property] agency_property
  # @param [Property] database_property
  # @return [Boolean]
  def self.is_match(agency_property, database_property)
  end
end
```


## PART 2 - DESIGN

Submit a sketch of a system architecture for a complex web application. There are no specific
requirements for this task–simply sketch your preferred architecture, with a brief description of each
layer/component and its responsibility within the architecture.

We will use this as the basis of a discussion around solution design & architecture.
