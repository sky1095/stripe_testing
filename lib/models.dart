// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromMap(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toMap());

class Customer {
    String id;
    String object;
    int created;
    dynamic defaultSource;
    dynamic description;
    String email;
    bool livemode;
    CustomerShipping shipping;
    Sources sources;

    Customer({
        this.id,
        this.object,
        this.created,
        this.defaultSource,
        this.description,
        this.email,
        this.livemode,
        this.shipping,
        this.sources,
    });

    factory Customer.fromMap(Map<String, dynamic> json) => Customer(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        defaultSource: json["default_source"],
        description: json["description"],
        email: json["email"],
        livemode: json["livemode"],
        shipping: CustomerShipping.fromMap(json["shipping"]),
        sources: Sources.fromMap(json["sources"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "object": object,
        "created": created,
        "default_source": defaultSource,
        "description": description,
        "email": email,
        "livemode": livemode,
        "shipping": shipping.toMap(),
        "sources": sources.toMap(),
    };
}

class CustomerShipping {
    Address address;
    String name;
    String phone;

    CustomerShipping({
        this.address,
        this.name,
        this.phone,
    });

    factory CustomerShipping.fromMap(Map<String, dynamic> json) => CustomerShipping(
        address: Address.fromMap(json["address"]),
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toMap() => {
        "address": address.toMap(),
        "name": name,
        "phone": phone,
    };
}

class Sources {
    String object;
    List<dynamic> data;
    bool hasMore;
    int totalCount;
    String url;

    Sources({
        this.object,
        this.data,
        this.hasMore,
        this.totalCount,
        this.url,
    });

    factory Sources.fromMap(Map<String, dynamic> json) => Sources(
        object: json["object"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        hasMore: json["has_more"],
        totalCount: json["total_count"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "object": object,
        "data": List<dynamic>.from(data.map((x) => x)),
        "has_more": hasMore,
        "total_count": totalCount,
        "url": url,
    };
}

class BillingDetails {
    Address address;
    String email;
    String name;
    String phone;

    BillingDetails({
        this.address,
        this.email,
        this.name,
        this.phone,
    });

    factory BillingDetails.fromMap(Map<String, dynamic> json) => BillingDetails(
        address: Address.fromMap(json["address"]),
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toMap() => {
        "address": address.toMap(),
        "email": email,
        "name": name,
        "phone": phone,
    };
}

class Card {
    String brand;
    Checks checks;
    String country;
    int expMonth;
    int expYear;
    String funding;
    String generatedFrom;
    String last4;
    ThreeDSecureUsage threeDSecureUsage;
    dynamic wallet;

    Card({
        this.brand,
        this.checks,
        this.country,
        this.expMonth,
        this.expYear,
        this.funding,
        this.generatedFrom,
        this.last4,
        this.threeDSecureUsage,
        this.wallet,
    });

    factory Card.fromMap(Map<String, dynamic> json) => Card(
        brand: json["brand"],
        checks: Checks.fromMap(json["checks"]),
        country: json["country"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        funding: json["funding"],
        generatedFrom: json["generated_from"],
        last4: json["last4"],
        threeDSecureUsage: ThreeDSecureUsage.fromMap(json["three_d_secure_usage"]),
        wallet: json["wallet"],
    );

    Map<String, dynamic> toMap() => {
        "brand": brand,
        "checks": checks.toMap(),
        "country": country,
        "exp_month": expMonth,
        "exp_year": expYear,
        "funding": funding,
        "generated_from": generatedFrom,
        "last4": last4,
        "three_d_secure_usage": threeDSecureUsage.toMap(),
        "wallet": wallet,
    };
}

class Checks {
    String addressLine1Check;
    String addressPostalCodeCheck;
    String cvcCheck;

    Checks({
        this.addressLine1Check,
        this.addressPostalCodeCheck,
        this.cvcCheck,
    });

    factory Checks.fromMap(Map<String, dynamic> json) => Checks(
        addressLine1Check: json["address_line1_check"],
        addressPostalCodeCheck: json["address_postal_code_check"],
        cvcCheck: json["cvc_check"],
    );

    Map<String, dynamic> toMap() => {
        "address_line1_check": addressLine1Check,
        "address_postal_code_check": addressPostalCodeCheck,
        "cvc_check": cvcCheck,
    };
}

class ThreeDSecureUsage {
    bool supported;

    ThreeDSecureUsage({
        this.supported,
    });

    factory ThreeDSecureUsage.fromMap(Map<String, dynamic> json) => ThreeDSecureUsage(
        supported: json["supported"],
    );

    Map<String, dynamic> toMap() => {
        "supported": supported,
    };
}

class Metadata {
    Metadata();

    factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
    );

    Map<String, dynamic> toMap() => {
    };
}

// To parse this JSON data, do
//
//     final paymentIntent = paymentIntentFromJson(jsonString);

PaymentIntent paymentIntentFromJson(String str) => PaymentIntent.fromMap(json.decode(str));

String paymentIntentToJson(PaymentIntent data) => json.encode(data.toMap());

class PaymentIntent {
    String id;
    String object;
    int amount;
    int amountCapturable;
    int amountReceived;
    dynamic application;
    dynamic applicationFeeAmount;
    dynamic canceledAt;
    dynamic cancellationReason;
    String captureMethod;
    Charges charges;
    String clientSecret;
    String confirmationMethod;
    int created;
    String currency;
    String customer;
    dynamic description;
    dynamic invoice;
    dynamic lastPaymentError;
    bool livemode;
    List<dynamic> metadata;
    dynamic nextAction;
    dynamic onBehalfOf;
    String paymentMethod;
    PaymentMethodOptions paymentMethodOptions;
    List<String> paymentMethodTypes;
    dynamic receiptEmail;
    dynamic review;
    dynamic setupFutureUsage;
    dynamic shipping;
    dynamic source;
    dynamic statementDescriptor;
    dynamic statementDescriptorSuffix;
    String status;
    dynamic transferData;
    dynamic transferGroup;

    PaymentIntent({
        this.id,
        this.object,
        this.amount,
        this.amountCapturable,
        this.amountReceived,
        this.application,
        this.applicationFeeAmount,
        this.canceledAt,
        this.cancellationReason,
        this.captureMethod,
        this.charges,
        this.clientSecret,
        this.confirmationMethod,
        this.created,
        this.currency,
        this.customer,
        this.description,
        this.invoice,
        this.lastPaymentError,
        this.livemode,
        this.metadata,
        this.nextAction,
        this.onBehalfOf,
        this.paymentMethod,
        this.paymentMethodOptions,
        this.paymentMethodTypes,
        this.receiptEmail,
        this.review,
        this.setupFutureUsage,
        this.shipping,
        this.source,
        this.statementDescriptor,
        this.statementDescriptorSuffix,
        this.status,
        this.transferData,
        this.transferGroup,
    });

    factory PaymentIntent.fromMap(Map<String, dynamic> json) => PaymentIntent(
        id: json["id"],
        object: json["object"],
        amount: json["amount"],
        amountCapturable: json["amount_capturable"],
        amountReceived: json["amount_received"],
        application: json["application"],
        applicationFeeAmount: json["application_fee_amount"],
        canceledAt: json["canceled_at"],
        cancellationReason: json["cancellation_reason"],
        captureMethod: json["capture_method"],
        charges: Charges.fromMap(json["charges"]),
        clientSecret: json["client_secret"],
        confirmationMethod: json["confirmation_method"],
        created: json["created"],
        currency: json["currency"],
        customer: json["customer"],
        description: json["description"],
        invoice: json["invoice"],
        lastPaymentError: json["last_payment_error"],
        livemode: json["livemode"],
        metadata: List<dynamic>.from(json["metadata"].map((x) => x)),
        nextAction: json["next_action"],
        onBehalfOf: json["on_behalf_of"],
        paymentMethod: json["payment_method"],
        paymentMethodOptions: PaymentMethodOptions.fromMap(json["payment_method_options"]),
        paymentMethodTypes: List<String>.from(json["payment_method_types"].map((x) => x)),
        receiptEmail: json["receipt_email"],
        review: json["review"],
        setupFutureUsage: json["setup_future_usage"],
        shipping: json["shipping"],
        source: json["source"],
        statementDescriptor: json["statement_descriptor"],
        statementDescriptorSuffix: json["statement_descriptor_suffix"],
        status: json["status"],
        transferData: json["transfer_data"],
        transferGroup: json["transfer_group"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "object": object,
        "amount": amount,
        "amount_capturable": amountCapturable,
        "amount_received": amountReceived,
        "application": application,
        "application_fee_amount": applicationFeeAmount,
        "canceled_at": canceledAt,
        "cancellation_reason": cancellationReason,
        "capture_method": captureMethod,
        "charges": charges.toMap(),
        "client_secret": clientSecret,
        "confirmation_method": confirmationMethod,
        "created": created,
        "currency": currency,
        "customer": customer,
        "description": description,
        "invoice": invoice,
        "last_payment_error": lastPaymentError,
        "livemode": livemode,
        "metadata": List<dynamic>.from(metadata.map((x) => x)),
        "next_action": nextAction,
        "on_behalf_of": onBehalfOf,
        "payment_method": paymentMethod,
        "payment_method_options": paymentMethodOptions.toMap(),
        "payment_method_types": List<dynamic>.from(paymentMethodTypes.map((x) => x)),
        "receipt_email": receiptEmail,
        "review": review,
        "setup_future_usage": setupFutureUsage,
        "shipping": shipping,
        "source": source,
        "statement_descriptor": statementDescriptor,
        "statement_descriptor_suffix": statementDescriptorSuffix,
        "status": status,
        "transfer_data": transferData,
        "transfer_group": transferGroup,
    };
}

class Datum {
    String id;
    String object;
    int amount;
    int amountRefunded;
    dynamic application;
    dynamic applicationFee;
    dynamic applicationFeeAmount;
    String balanceTransaction;
    PaymentIntentBillingDetails billingDetails;
    bool captured;
    int created;
    String currency;
    String customer;
    dynamic description;
    dynamic destination;
    dynamic dispute;
    bool disputed;
    dynamic failureCode;
    dynamic failureMessage;
    List<dynamic> fraudDetails;
    dynamic invoice;
    bool livemode;
    List<dynamic> metadata;
    dynamic onBehalfOf;
    dynamic order;
    Outcome outcome;
    bool paid;
    String paymentIntent;
    String paymentMethod;
    PaymentMethodDetails paymentMethodDetails;
    dynamic receiptEmail;
    dynamic receiptNumber;
    String receiptUrl;
    bool refunded;
    Charges refunds;
    dynamic review;
    dynamic shipping;
    dynamic source;
    dynamic sourceTransfer;
    dynamic statementDescriptor;
    dynamic statementDescriptorSuffix;
    String status;
    dynamic transferData;
    dynamic transferGroup;

    Datum({
        this.id,
        this.object,
        this.amount,
        this.amountRefunded,
        this.application,
        this.applicationFee,
        this.applicationFeeAmount,
        this.balanceTransaction,
        this.billingDetails,
        this.captured,
        this.created,
        this.currency,
        this.customer,
        this.description,
        this.destination,
        this.dispute,
        this.disputed,
        this.failureCode,
        this.failureMessage,
        this.fraudDetails,
        this.invoice,
        this.livemode,
        this.metadata,
        this.onBehalfOf,
        this.order,
        this.outcome,
        this.paid,
        this.paymentIntent,
        this.paymentMethod,
        this.paymentMethodDetails,
        this.receiptEmail,
        this.receiptNumber,
        this.receiptUrl,
        this.refunded,
        this.refunds,
        this.review,
        this.shipping,
        this.source,
        this.sourceTransfer,
        this.statementDescriptor,
        this.statementDescriptorSuffix,
        this.status,
        this.transferData,
        this.transferGroup,
    });

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        object: json["object"],
        amount: json["amount"],
        amountRefunded: json["amount_refunded"],
        application: json["application"],
        applicationFee: json["application_fee"],
        applicationFeeAmount: json["application_fee_amount"],
        balanceTransaction: json["balance_transaction"],
        billingDetails: PaymentIntentBillingDetails.fromMap(json["billing_details"]),
        captured: json["captured"],
        created: json["created"],
        currency: json["currency"],
        customer: json["customer"],
        description: json["description"],
        destination: json["destination"],
        dispute: json["dispute"],
        disputed: json["disputed"],
        failureCode: json["failure_code"],
        failureMessage: json["failure_message"],
        fraudDetails: List<dynamic>.from(json["fraud_details"].map((x) => x)),
        invoice: json["invoice"],
        livemode: json["livemode"],
        metadata: List<dynamic>.from(json["metadata"].map((x) => x)),
        onBehalfOf: json["on_behalf_of"],
        order: json["order"],
        outcome: Outcome.fromMap(json["outcome"]),
        paid: json["paid"],
        paymentIntent: json["payment_intent"],
        paymentMethod: json["payment_method"],
        paymentMethodDetails: PaymentMethodDetails.fromMap(json["payment_method_details"]),
        receiptEmail: json["receipt_email"],
        receiptNumber: json["receipt_number"],
        receiptUrl: json["receipt_url"],
        refunded: json["refunded"],
        refunds: Charges.fromMap(json["refunds"]),
        review: json["review"],
        shipping: json["shipping"],
        source: json["source"],
        sourceTransfer: json["source_transfer"],
        statementDescriptor: json["statement_descriptor"],
        statementDescriptorSuffix: json["statement_descriptor_suffix"],
        status: json["status"],
        transferData: json["transfer_data"],
        transferGroup: json["transfer_group"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "object": object,
        "amount": amount,
        "amount_refunded": amountRefunded,
        "application": application,
        "application_fee": applicationFee,
        "application_fee_amount": applicationFeeAmount,
        "balance_transaction": balanceTransaction,
        "billing_details": billingDetails.toMap(),
        "captured": captured,
        "created": created,
        "currency": currency,
        "customer": customer,
        "description": description,
        "destination": destination,
        "dispute": dispute,
        "disputed": disputed,
        "failure_code": failureCode,
        "failure_message": failureMessage,
        "fraud_details": List<dynamic>.from(fraudDetails.map((x) => x)),
        "invoice": invoice,
        "livemode": livemode,
        "metadata": List<dynamic>.from(metadata.map((x) => x)),
        "on_behalf_of": onBehalfOf,
        "order": order,
        "outcome": outcome.toMap(),
        "paid": paid,
        "payment_intent": paymentIntent,
        "payment_method": paymentMethod,
        "payment_method_details": paymentMethodDetails.toMap(),
        "receipt_email": receiptEmail,
        "receipt_number": receiptNumber,
        "receipt_url": receiptUrl,
        "refunded": refunded,
        "refunds": refunds.toMap(),
        "review": review,
        "shipping": shipping,
        "source": source,
        "source_transfer": sourceTransfer,
        "statement_descriptor": statementDescriptor,
        "statement_descriptor_suffix": statementDescriptorSuffix,
        "status": status,
        "transfer_data": transferData,
        "transfer_group": transferGroup,
    };
}

class Charges {
    String object;
    List<Datum> data;
    bool hasMore;
    int totalCount;
    String url;

    Charges({
        this.object,
        this.data,
        this.hasMore,
        this.totalCount,
        this.url,
    });

    factory Charges.fromMap(Map<String, dynamic> json) => Charges(
        object: json["object"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        hasMore: json["has_more"],
        totalCount: json["total_count"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "object": object,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "has_more": hasMore,
        "total_count": totalCount,
        "url": url,
    };
}

class PaymentIntentBillingDetails {
    Address address;
    dynamic email;
    String name;
    dynamic phone;

    PaymentIntentBillingDetails({
        this.address,
        this.email,
        this.name,
        this.phone,
    });

    factory PaymentIntentBillingDetails.fromMap(Map<String, dynamic> json) => PaymentIntentBillingDetails(
        address: Address.fromMap(json["address"]),
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toMap() => {
        "address": address.toMap(),
        "email": email,
        "name": name,
        "phone": phone,
    };
}

class Outcome {
    String networkStatus;
    dynamic reason;
    String riskLevel;
    int riskScore;
    String sellerMessage;
    String type;

    Outcome({
        this.networkStatus,
        this.reason,
        this.riskLevel,
        this.riskScore,
        this.sellerMessage,
        this.type,
    });

    factory Outcome.fromMap(Map<String, dynamic> json) => Outcome(
        networkStatus: json["network_status"],
        reason: json["reason"],
        riskLevel: json["risk_level"],
        riskScore: json["risk_score"],
        sellerMessage: json["seller_message"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "network_status": networkStatus,
        "reason": reason,
        "risk_level": riskLevel,
        "risk_score": riskScore,
        "seller_message": sellerMessage,
        "type": type,
    };
}

class PaymentMethodDetails {
    PaymentMethodDetailsCard card;
    String type;

    PaymentMethodDetails({
        this.card,
        this.type,
    });

    factory PaymentMethodDetails.fromMap(Map<String, dynamic> json) => PaymentMethodDetails(
        card: PaymentMethodDetailsCard.fromMap(json["card"]),
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "card": card.toMap(),
        "type": type,
    };
}

class PaymentMethodDetailsCard {
    String brand;
    Checks checks;
    String country;
    int expMonth;
    int expYear;
    String fingerprint;
    String funding;
    dynamic installments;
    String last4;
    String network;
    dynamic threeDSecure;
    dynamic wallet;

    PaymentMethodDetailsCard({
        this.brand,
        this.checks,
        this.country,
        this.expMonth,
        this.expYear,
        this.fingerprint,
        this.funding,
        this.installments,
        this.last4,
        this.network,
        this.threeDSecure,
        this.wallet,
    });

    factory PaymentMethodDetailsCard.fromMap(Map<String, dynamic> json) => PaymentMethodDetailsCard(
        brand: json["brand"],
        checks: Checks.fromMap(json["checks"]),
        country: json["country"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        fingerprint: json["fingerprint"],
        funding: json["funding"],
        installments: json["installments"],
        last4: json["last4"],
        network: json["network"],
        threeDSecure: json["three_d_secure"],
        wallet: json["wallet"],
    );

    Map<String, dynamic> toMap() => {
        "brand": brand,
        "checks": checks.toMap(),
        "country": country,
        "exp_month": expMonth,
        "exp_year": expYear,
        "fingerprint": fingerprint,
        "funding": funding,
        "installments": installments,
        "last4": last4,
        "network": network,
        "three_d_secure": threeDSecure,
        "wallet": wallet,
    };
}

class PaymentMethodOptions {
    PaymentMethodOptionsCard card;

    PaymentMethodOptions({
        this.card,
    });

    factory PaymentMethodOptions.fromMap(Map<String, dynamic> json) => PaymentMethodOptions(
        card: PaymentMethodOptionsCard.fromMap(json["card"]),
    );

    Map<String, dynamic> toMap() => {
        "card": card.toMap(),
    };
}

class PaymentMethodOptionsCard {
    dynamic installments;
    String requestThreeDSecure;

    PaymentMethodOptionsCard({
        this.installments,
        this.requestThreeDSecure,
    });

    factory PaymentMethodOptionsCard.fromMap(Map<String, dynamic> json) => PaymentMethodOptionsCard(
        installments: json["installments"],
        requestThreeDSecure: json["request_three_d_secure"],
    );

    Map<String, dynamic> toMap() => {
        "installments": installments,
        "request_three_d_secure": requestThreeDSecure,
    };
}

// To parse this JSON data, do
//
//     final paymentMethods = paymentMethodsFromJson(jsonString);

PaymentMethods paymentMethodsFromJson(String str) => PaymentMethods.fromMap(json.decode(str));

String paymentMethodsToJson(PaymentMethods data) => json.encode(data.toMap());

class PaymentMethods {
    String object;
    String url;
    bool hasMore;
    List<PaymentMethodsDatum> data;

    PaymentMethods({
        this.object,
        this.url,
        this.hasMore,
        this.data,
    });

    factory PaymentMethods.fromMap(Map<String, dynamic> json) => PaymentMethods(
        object: json["object"],
        url: json["url"],
        hasMore: json["has_more"],
        data: List<PaymentMethodsDatum>.from(json["data"].map((x) => PaymentMethodsDatum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "object": object,
        "url": url,
        "has_more": hasMore,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class PaymentMethodsDatum {
    String id;
    String object;
    BillingDetails billingDetails;
    Card card;
    int created;
    dynamic customer;
    bool livemode;
    Metadata metadata;
    String type;

    PaymentMethodsDatum({
        this.id,
        this.object,
        this.billingDetails,
        this.card,
        this.created,
        this.customer,
        this.livemode,
        this.metadata,
        this.type,
    });

    factory PaymentMethodsDatum.fromMap(Map<String, dynamic> json) => PaymentMethodsDatum(
        id: json["id"],
        object: json["object"],
        billingDetails: BillingDetails.fromMap(json["billing_details"]),
        card: Card.fromMap(json["card"]),
        created: json["created"],
        customer: json["customer"],
        livemode: json["livemode"],
        metadata: Metadata.fromMap(json["metadata"]),
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "object": object,
        "billing_details": billingDetails.toMap(),
        "card": card.toMap(),
        "created": created,
        "customer": customer,
        "livemode": livemode,
        "metadata": metadata.toMap(),
        "type": type,
    };
}

class Address {
    dynamic city;
    dynamic country;
    dynamic line1;
    dynamic line2;
    dynamic postalCode;
    dynamic state;

    Address({
        this.city,
        this.country,
        this.line1,
        this.line2,
        this.postalCode,
        this.state,
    });

    factory Address.fromMap(Map<String, dynamic> json) => Address(
        city: json["city"],
        country: json["country"],
        line1: json["line1"],
        line2: json["line2"],
        postalCode: json["postal_code"],
        state: json["state"],
    );

    Map<String, dynamic> toMap() => {
        "city": city,
        "country": country,
        "line1": line1,
        "line2": line2,
        "postal_code": postalCode,
        "state": state,
    };
}

class PaymentMethodsCard {
    String brand;
    Checks checks;
    String country;
    int expMonth;
    int expYear;
    String fingerprint;
    String funding;
    dynamic generatedFrom;
    String last4;
    ThreeDSecureUsage threeDSecureUsage;
    dynamic wallet;

    PaymentMethodsCard({
        this.brand,
        this.checks,
        this.country,
        this.expMonth,
        this.expYear,
        this.fingerprint,
        this.funding,
        this.generatedFrom,
        this.last4,
        this.threeDSecureUsage,
        this.wallet,
    });

    factory PaymentMethodsCard.fromMap(Map<String, dynamic> json) => PaymentMethodsCard(
        brand: json["brand"],
        checks: Checks.fromMap(json["checks"]),
        country: json["country"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        fingerprint: json["fingerprint"],
        funding: json["funding"],
        generatedFrom: json["generated_from"],
        last4: json["last4"],
        threeDSecureUsage: ThreeDSecureUsage.fromMap(json["three_d_secure_usage"]),
        wallet: json["wallet"],
    );

    Map<String, dynamic> toMap() => {
        "brand": brand,
        "checks": checks.toMap(),
        "country": country,
        "exp_month": expMonth,
        "exp_year": expYear,
        "fingerprint": fingerprint,
        "funding": funding,
        "generated_from": generatedFrom,
        "last4": last4,
        "three_d_secure_usage": threeDSecureUsage.toMap(),
        "wallet": wallet,
    };
}
