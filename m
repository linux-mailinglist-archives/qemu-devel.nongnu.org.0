Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1E131D1CF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 22:01:21 +0100 (CET)
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC7TD-0008BL-6f
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 16:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lC7RV-0007dK-0P
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 15:59:33 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:6205)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lC7RS-0000a0-Ji
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 15:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1613509170; x=1645045170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fip5dOx+UHnrV4l8I6WDdlWackSa7N+C0XAKj933zkM=;
 b=zG/Fuh+bX4aszTN+1jwOmOn49AIzJ+e1YrrRTFkwDyZvRy8OZJ+TOJXn
 IpZXeJy/7qMcswKecMLpqQ+sFuSYxGsNSEHDHceFMpdEWob3/eTs47nyK
 Ukd9hyUHptGvx13uvwf9kYIO9DVNyfK5BznX9TFW7QYRD/tcIEKIxXFAe 8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Feb 2021 12:59:23 -0800
X-QCInternal: smtphost
Received: from nasanexm03c.na.qualcomm.com ([10.85.0.106])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 16 Feb 2021 12:59:22 -0800
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Feb 2021 12:59:21 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 16 Feb 2021 12:59:21 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6786.namprd02.prod.outlook.com (2603:10b6:a03:210::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 20:59:20 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3846.026; Tue, 16 Feb 2021
 20:59:20 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 00/35] Hexagon patch series
Thread-Topic: [PATCH v8 00/35] Hexagon patch series
Thread-Index: AQHW/d3JrkS53GLWX0WtnWhCoqgGz6pYdoQAgALUbfA=
Date: Tue, 16 Feb 2021 20:59:19 +0000
Message-ID: <BYAPR02MB48861D2450B42859C77DC86DDE879@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <27b85311-3161-eebd-8e00-95ac87f7376d@linaro.org>
In-Reply-To: <27b85311-3161-eebd-8e00-95ac87f7376d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [174.197.10.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa180b58-b047-411f-b952-08d8d2bdbaf6
x-ms-traffictypediagnostic: BY5PR02MB6786:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB678615552FCD4052A491632ADE879@BY5PR02MB6786.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aD8gsWN4b0/28gG+Y5r5qiXuswec9OUG8jLVbrG3W1qSP1gLn3kfJZPpLO81PD7ird8uIPXmNVlzK5IGhxgAWjj1CI/kD4QQZJ5j1J8nF6ie7Y129DLVWF1gt9SEFOTq+YnUOTEFvKEynuAOfdzXB1q5xGGvnO6+Br+BT7Y6SSGUHTE9VSxDjNR8WBMAJ66dRQbFlLfcjvwgacQ8rMNRQQM8UzLxfOHHOCp46AECUZd1AhKyJS4tVrm/040XXr5EIg8g1wKkX1DI4BviqLjXXaqWYxWtN/OJpjik+3pfsGoQV36PK37tZtI47j485ge5L1XKGRsTaII8Ht8PK6/SEaEG56Q6WSMBd6gNfIeDgOqEeTdtiStnaJ/BwHY9pF2buA+pB23wkxvdFDTxSN65agSZYfuNutuR1Vm0UHZXqy/szYpSwIv0gfzN9QvbvMn3d7Ez5ogFd1kpY/NZ0MNZaf1gMDGjb733BCyrwgOE/Fjs0G0IRrPZcjO2Isev079Fw7r4LLIhT09cDWiX9lNoArvupiPRwnvsTkaPwMtzhoOent2j+ShRVcNRUHCR3OeZ7KVZrKWiss9ijCl5AEFjWLFcy4YYzcKlldTqELZp/fw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(66446008)(66946007)(7696005)(55016002)(86362001)(66476007)(966005)(9686003)(4326008)(33656002)(316002)(66556008)(52536014)(53546011)(76116006)(64756008)(186003)(26005)(71200400001)(8676002)(110136005)(2906002)(54906003)(6506007)(8936002)(478600001)(83380400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dFJaMC9DNDlEU1NJVnQyQ3VZTXNON01QRjhaQ2ZtY0hvMDVaZDBBT2ZlYlk5?=
 =?utf-8?B?aUV1MUgrMFU1dkhaVmk3SGZuYW1NckkrZ3M0SEQ0Snk0Q3JWNEVBU1ZScmgx?=
 =?utf-8?B?MXZFRTZZS1cwZzJsSEZNYlV0ZUdML1BhdW9NblNVVkFIWmF3MEt0Yng2d1pF?=
 =?utf-8?B?TmVxTHNISis1b3dYK09GNFFOM1h1d0JSUTdkd3NsSVE0aXY0SDQ1TXRSUlpv?=
 =?utf-8?B?Uy9UMjE5dCtzckgwb25LdGxHVzgwMjJkZ2pxbUxhQjBDRkp0cU5PVzVrVHQ1?=
 =?utf-8?B?ZjNrdkoweEJ2Mlo5eGdOZUNFTCtzLzhsaXNtcFpFREVUWDRyc2UvSlVFOFdC?=
 =?utf-8?B?d3g2Zm1Rb054T2FkaFdKYTRSb0RKVVE4NFdseUJLR05SajI2ZURYV2JCclpY?=
 =?utf-8?B?d0F1NTZSK2RzVGx4bk9EaU1WQlpaN1Rta2hRempRTnJ2YUZuT2VGWUZqdGha?=
 =?utf-8?B?TldjVER1Z2IwM0NXbWp5NzRXd3h2c3hpQUFLckJPS3NWWHptUWxaMkwxTmNy?=
 =?utf-8?B?SWtManpKbUx6ZmNaSm1pMU5JTnNwRTBZcWttbmlTL093dGJWVGhsczlCMmdK?=
 =?utf-8?B?b2dNUmpvSUZGL29IbWN1ZjNCMVNMVXRvT3NrVmhQeDRQcFBmT1cwbFF5SXdC?=
 =?utf-8?B?Y3cwVVJnc0ppMXh4RE5qV0RLNklGTFg5NldsUm9HZnhUVGtMaXpJZnpLRXEv?=
 =?utf-8?B?ZlJUK2VXbDdSbWRMd0F1Ri9nQ000Ylc5RnlLVzcxcndjZGJvTS9QZWJUQmlN?=
 =?utf-8?B?V1ZaM0Z1TUN3VHljSzB5MkdQRytZVTVsUWhDSWZERWM3KzI2YXBJb09KekFX?=
 =?utf-8?B?Zm4yTVVVR0c2dStzR1VwZjN3aWVHYnV0L3p1VUtmTi9qa1o1aHVvRW5jUkly?=
 =?utf-8?B?VElGSzN3aHpaMmxCa1U0cUM2eWtFNGpIbVozY1Qxb2NVKytkaTh2OENHSDNU?=
 =?utf-8?B?VVVjOEdxc1Y2VkF2UC9qSnFuVTl0ajJack4yem1iVkFaQ3BJa21lSnhCMW5N?=
 =?utf-8?B?enY1eE9sUXF2UFBFN2c1Ukh2cldCcWVXRXhjYXRLNngwOUxnUVd1WWU3UTVC?=
 =?utf-8?B?WXE0UUVJVmlzU3ZOK1hHV3NDbFA4ZFJsaTFUQzJJZ0NQbUxxSENldnZERno1?=
 =?utf-8?B?cFNkWFNpNDJmbm1SaXVwdnlwU29iWGEyRGdLRU4xS21iYmZRM1l3Y0hCYVFE?=
 =?utf-8?B?RTN4S2ZLYW1DZjlweFNmNmp5K1JQVTc0b09XLzdKWU1uZFF4NDl5d3JXWjhN?=
 =?utf-8?B?OWpiYjhpc250d3hJZGFrVmFIVzl4KzhNd3lLSDZ4bDFmTUZBMjF6eEVvbzBt?=
 =?utf-8?B?NXo2b0JzZnR1TzhrSThidVhnYlV1V1V4UW5SQmw3alFMNG05RGhPSjhrRVM1?=
 =?utf-8?B?ZzlpQUFGc0VXZys5TWQxa0l2Zm9NbmZsNVNGRzdKYzNTWGFoSzJpTEVtajhh?=
 =?utf-8?B?bllEbUV6N2pKMEdVeUttU0MrMnZRNGQ2QmJKcE1VVVJ5NDR6OFNnbS9kc2xz?=
 =?utf-8?B?V01JbFZGYnl1Sm1kaTMvalkzT204dUwxSUowSVRka04vbk1FNlQ3NkFPcWEv?=
 =?utf-8?B?Ujl4T3c2RDc3S0J4aWh3T05WYnltRE9peXM2TlV0elVVZTQ1bjhvRXdUdjZm?=
 =?utf-8?B?VGwyN2t6bUYxZTd1SHJhR3pIdGdnaTlKMnJWOG51eW1rQ2VuWTc2WG9FVmFF?=
 =?utf-8?B?QXE1dTVwcS9UZkxKczV5S2FxUTVCeUpPL2txZi8vTkhuejdJVmtURmVjSzJM?=
 =?utf-8?Q?jboLpqP34nQ2ypdy7KtlXJAUhDRZ16pXxuVKs8I?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ukqi2RSbW6NJl84baeNpnNBzpy12Ps69mlTCjkZFB74oN4ENyDL5iIqctJLJ8OY4uEPQrII8AcRLQhthdysy5hKBRBTPIbmLAWx28uII/KhFBC31ZAjlpAm7hxWlRpEpbECawEgoXDEWSBjhqOBNQ4uapiKruDmOtz/jF0pJ93Fjn1q9z2QA5KqbhWAC4n9Ch3if0VZD2VlGNFoT/Vs1z7Fc3GclRCwI0bxeGVNUZ9xWdb9TQ8YakKwaytEA6jk6a1PMTeIP7mTmNYcYYS/qy2A/WkDQcoLGPN/ydem+RMPL5IJMovwFYrmLetShvSAGvTsnXRP8lgXOBrYPhJSSRA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk53QjXgvzH2jEMSvx54vb+LhGVdZGHZEVvjCCgGSA4=;
 b=Uo2F1tdwYI1nmRIxcyq3Ygj+I6fbMLzdG6KqPS30oKNBpT2MFqmu/UUOKumxyi35mzgYKELTv4k9htxKYzaqUEjObvxovFiqBxVBakSp3giCWjQU0/hA/vGxRV9LBeuYFyAcyvKfE4L+UvVPppGJEarMyyx6R19i1o+rXzBwU8Z6NHgS6HKwBJuE2nm+nFMc8Oz/2qswgv2S8z71W322hO/HtfQpA/1FMU89R4iGdJpj/rCK2CvN7I7WFbBMAwM5kg8ONMHMLlp5TrtyUOjc0TfqBKxKgfBKfYUVnitDnm0S1mgMU4o/URFQ4OhVa95AYcG0Z6OMRmWWnIhTIUDivg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk53QjXgvzH2jEMSvx54vb+LhGVdZGHZEVvjCCgGSA4=;
 b=lbdbtDnsGdwBgvS4IdHzvNMlFxOwtQuvDGCorWMRHx42+QaIGngjMxsxDrcLDai8hyM1yWOOgj0+lLdKd9ZEUk6CDSSjJYLBALWDi/UmUeEGY7IoQVI6kkokU1BxVa2QqWbRN2dlO8Ho9VP7CEQMz8t/fEqNqcjSy8VEh0KZxMQ=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: fa180b58-b047-411f-b952-08d8d2bdbaf6
x-ms-exchange-crosstenant-originalarrivaltime: 16 Feb 2021 20:59:19.8539 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: EDsildeYGFbBY/UnrO6mKBEJbsLNIWHtqBpKTh61O7XxxZwTJij/rS4a0UIWPrVhgT30bYmOFUiYw/z7wIQxzw==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6786
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "ale@rev.ng" <ale@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 Brian Cain <bcain@quicinc.com>, "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgRmVicnVh
cnkgMTQsIDIwMjEgNzoyMyBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+IGFsZUByZXYubmc7
IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPjsgUGV0ZXIgTWF5ZGVsbA0KPiA8cGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDAwLzM1XSBIZXhh
Z29uIHBhdGNoIHNlcmllcw0KPg0KPiBPbiAyLzcvMjEgOTo0NSBQTSwgVGF5bG9yIFNpbXBzb24g
d3JvdGU6DQo+ID4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgSGV4YWdvbiBwcm9j
ZXNzb3Igd2l0aCBMaW51eCB1c2VyIHN1cHBvcnQNCj4gPg0KPiA+IFNlZSBwYXRjaCAwMiBIZXhh
Z29uIFJFQURNRSBmb3IgZGV0YWlsZWQgaW5mb3JtYXRpb24uDQo+ID4NCj4gPiBUaGlzIHNlcmll
cyBhc3N1bWVzIGludDEyOF9vcigpIGlzIGltcGxlbWVudGVkLg0KPiA+IGh0dHBzOi8vbGlzdHMu
bm9uZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIwLTEwL21zZzA2MDA0Lmh0bWwN
Cj4gPg0KDQpXaGF0J3MgdGhlIHN0YXR1cyBvZiB0aGlzIHBhdGNoPyAgQ291bGQgeW91IGdvIGFo
ZWFkIGFuZCBtZXJnZSBpdCBhaGVhZCBvZiB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzIHRoYXQgaXQn
cyBpbj8NCg0KPiA+DQo+ID4gT25jZSB0aGUgc2VyaWVzIGlzIGFwcGxpZWQsIHRoZSBIZXhhZ29u
IHBvcnQgd2lsbCBwYXNzICJtYWtlIGNoZWNrLXRjZyIuDQo+ID4gVGhlIHNlcmllcyBhbHNvIGlu
Y2x1ZGVzIEhleGFnb24tc3BlY2lmaWMgdGVzdHMgaW4gdGNnL3Rlc3RzL2hleGFnb24uDQo+ID4N
Cj4gPiBUaGUgZmluYWwgcGF0Y2ggaW4gdGhlIHNlcmllcyBhZGQgZG9ja2VyIHN1cHBvcnQuICBU
aGFua3MgdG8gQWxlc3NhbmRybw0KPiA+IERpIEZlZGVyaWNvIDxhbGVAcmV2Lm5nPiBhbmQgQnJp
YW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+IGZvciBtYWtpbmcNCj4gdGhpcw0KPiA+IGhhcHBl
bi4gIFRoZSBkZWZhdWx0IGNvbnRhaW5lciAoZGViaWFuLWhleGFnb24tY3Jvc3MpIHVzZXMgYSB0
b29sY2hhaW4NCj4gYnVpbHQNCj4gPiBieSByZXYubmcuICBBbHRlcm5hdGl2ZWx5LCB0aGVyZSBp
cyBhIGNvbnRhaW5lciB0aGF0IHdpbGwgYnVpbGQgdGhlIHRvb2xjaGFpbg0KPiA+IGxvY2FsbHkg
KGRlYmlhbi1oZXhhZ29uLWNyb3NzLWJ1aWxkLWxvY2FsKS4NCj4NCj4gUmlnaHQuICBUaGlzIGlz
IGluIHJlYWxseSBnb29kIHNoYXBlLg0KPg0KPiBJJ3ZlIGNvbXBsZXRlZCByZXZpZXcgb2YgdGhp
cyByb3VuZCwgYW5kIHRoZXJlIGFyZSBzb21lIG5pdHMuICBCdXQgdGhleSdyZQ0KPiBtaW5vciBl
bm91Z2ggdGhhdCBJIHdvdWxkbid0IGV2ZW4gbWluZCB0aGVtIGJlaW5nIGFkZHJlc3NlZCB2aWEg
dGhlDQo+IG5vcm1hbA0KPiBkZXZlbG9wbWVudCBwcm9jZXNzLiAgSS5lLiBJJ2QgYmUga2VlbiB0
byBub3QgbG9vayB0aHJvdWdoIHRoYXQgZGlmZnN0YXQgYWdhaW4uDQo+ICA7LSkNCg0KVGhhbmtz
IFJpY2hhcmQhISAgV2UncmUgaGF2aW5nIHVucHJlY2VkZW50ZWQgd2ludGVyIHdlYXRoZXIgaW4g
QXVzdGluLCBzbyBJJ2xsIGFkZHJlc3MgeW91ciBsYXRlc3QgZmVlZGJhY2sgb25jZSBvdXIgZGF0
YWNlbnRlciByZWNvdmVycyBmcm9tIGEgcG93ZXIgb3V0YWdlLg0KDQo+DQo+IEFueSBvYmplY3Rp
b25zIGZyb20gYW55b25lIGVsc2Ugb24gdGhhdD8NCj4NCj4gSSBkb24ndCBzdXBwb3NlIHlvdSBh
bmQgUGV0ZXIgTWF5ZGVsbCBzaWduZWQgZ3BnIGtleXMgd2hlbiB3ZSBhbGwgbWV0IGluDQo+IEx5
b24/DQoNCk5vcGUuICBQZXRlciwgcGxlYXNlIGFkdmlzZQ0K

