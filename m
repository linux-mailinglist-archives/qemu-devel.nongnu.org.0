Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5C8355E45
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 23:56:56 +0200 (CEST)
Received: from localhost ([::1]:34098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTtgs-0004rK-V8
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 17:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTtg2-0004RJ-9V
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:56:02 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:13467)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTtg0-0007vo-6y
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617746160; x=1649282160;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2onqIDDtkz0ueq4l30fglzWhykcZBrDv1AFhEMuop+I=;
 b=XOQ9rxs5ghqWmR9UZfyT41BOPZRlevk8fRLNdjJQx11r7xQYCDXLEwLX
 ZvwgIVmosgK89UfRikuthDtBxJYQqRu5Z8buKfO1l21wwxx5sZmll9JI0
 qywi0IN8FGlw2bc7AX6oY8aC2Q7CXw79zQRZ6ImTvDMZvXNSOBFnZ4o/W g=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Apr 2021 14:55:58 -0700
X-QCInternal: smtphost
Received: from nasanexm03f.na.qualcomm.com ([10.85.0.47])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 06 Apr 2021 14:55:57 -0700
Received: from nasanexm03f.na.qualcomm.com (10.85.0.47) by
 nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 14:55:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 6 Apr 2021 14:55:56 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7184.namprd02.prod.outlook.com (2603:10b6:a03:295::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 21:55:56 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 21:55:55 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 12/21] Hexagon (target/hexagon) add F2_sfrecipa
 instruction
Thread-Topic: [PATCH v2 12/21] Hexagon (target/hexagon) add F2_sfrecipa
 instruction
Thread-Index: AQHXJqqe5qATBZaW/E6Prby8vKfUq6qn/nmAgAASAcA=
Date: Tue, 6 Apr 2021 21:55:55 +0000
Message-ID: <BYAPR02MB48869FD9CE8F128EC50F668EDE769@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-13-git-send-email-tsimpson@quicinc.com>
 <13945cfa-a211-8d4d-df64-3df7b8304b04@linaro.org>
In-Reply-To: <13945cfa-a211-8d4d-df64-3df7b8304b04@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6efa70f-f82b-485c-7db7-08d8f946c157
x-ms-traffictypediagnostic: SJ0PR02MB7184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB7184E15A52E138FEA5045AB0DE769@SJ0PR02MB7184.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PygICBNkQu8HB2kOcpUNADzt30z0GZXAwsY44Y4VC3ORcepERiRtCGAKtrjgkqO8Xeh63B61AB8C6zwb2+QCB+VArCW8J9xvfumqDh2oe/FWcwIrWiwqeuq+a4q/+92A4tcyEYVzxMovo2UbX73ndvez73IRmDwhU27EKC8XcD9VO4vYCwQIsPycAbSHz0wW3RpNcKg6zkW4swdWKBsItJuTu3Vc62+FeW3B+rq8yV9avtaHcCJiokn1AVAvESujBO0hFWmJOkATcKkMhN+6LoEGmFc4yUHokf6xjWh3QnFuHxfDjVcYMHprumXy2P1YipmoKLuay4FhiF0Y5ijwaFYY1n9L1ZjmHUZlUa7X25Kxr4GU8kIhySGo4H0cwBkoJH0xdfmbrdRG/y6r4UCnBxonHvEeIYzOx2bfs5BgxAKMeaV2dAoF6/FnMKmcR10XKBQHeSJ01szHYioFlIGGJF6s5NDj3bB6k+RFi0lFBI1+Yq+EXiCjN96MEZYHhr+xs7EA7KU0hRQHwq9dWgGJsCAQff7fJGzcT4Cyej0XsijbC8GOiNI9Kmm/wv/gX6byWCDJgzeePQUpRONWGupGbxFfnU5kq1D6mfVIwpw5XyrNtvLlOjCr7HmND5i3FONjOMp/39Gxu/guXnapWF5DQ9pBLO03js9Ps3aaHmUw+Mk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(6506007)(478600001)(54906003)(64756008)(66476007)(66556008)(8936002)(55016002)(5660300002)(7696005)(66946007)(83380400001)(9686003)(76116006)(86362001)(52536014)(8676002)(26005)(53546011)(186003)(2906002)(38100700001)(33656002)(110136005)(316002)(4326008)(66446008)(71200400001)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?c3NBUHZ1M3BOUHNXRU00cEgwYTRGMGlsZHJnWUtJYTRuMXphWlIrTXBiQjk3?=
 =?utf-8?B?eEFic1piWUFXNzE2cmluZ3ZPdFBlc21ld1dWVEY1SW82S1JSLytRU3RUNTRM?=
 =?utf-8?B?bHBKWCsyS2lvcnRtQ2lZRXNSVmdvMzhXbFc4RWRuajcwc3VsejVNNzlCblJR?=
 =?utf-8?B?STYxSElvZ2l6OW5JYmNINkwxNmpHWlhpcU81QzJ0bjVUN25nRG5GNWVUTXZC?=
 =?utf-8?B?M0JtMEpKWFlyR2hIOHZKOFhjY2QzNTJpenlFeW96NW9GL2piaGd0dm5IdGlG?=
 =?utf-8?B?d1c5TnBpOVRwWEhiREdPMEQ4dTJOV3RLNVJsTkdhSVMxcnJ0WGpHNTgzNWJj?=
 =?utf-8?B?UGhSTEl1MlE2Z1pFNzNpSDFuNkRTWnZaYWJmRWxKTlNmS2NXeGxZQlUvdTA5?=
 =?utf-8?B?YmZKc3cwbHc2Rjd3b2Y1QzliWEJlVTVVOEthaFNkUmppbWNHNVdLQkwraHR1?=
 =?utf-8?B?a05aTENNMDY2T2ZuV0JBUGU3NGpaZ2ZYalBwcTFIZ2FiNVpFQXVXeGFQdjBZ?=
 =?utf-8?B?RVU3NlVkUVQ0WWlCRzU0cldxY1dFd0F4RTlDMSs2dzFTdVNGSkc4UDZOUThC?=
 =?utf-8?B?RHZ5ZnpaY3VWYy9ueHB5UXRBamE5THFNZ1RmWmdVcTgrckVQMDF4UnkyNGpv?=
 =?utf-8?B?cTA3UFBJQ0IwejhWVjgrUlkzWXd0Wm0zSFVoZkNGNXJ2YUlRT29VWDFKNW02?=
 =?utf-8?B?Tm1hRDV3S2h3SUkxdThPeThoL2lxMkhOVEh5MkVNaFBvN1NvVGRjQ2VUNSti?=
 =?utf-8?B?a2hBYzdMeTJ4WWxtdzhzUEJJYTlFK0hEOTNRY1o2SmprZWJYY3BYc0VUaFl1?=
 =?utf-8?B?ejh5Z3NCbE1yOU5XU3NoWjM0TmdsK2dvU2lKVXJVVDFmOWxubnZLU3gwWUhU?=
 =?utf-8?B?T1FmMmdkU28xZUpERm9mblZkUHlWcURwd0FvL2xTSjB5UGNaVWhrM3A5dWxq?=
 =?utf-8?B?dDN0UG94WWlrTDRmM3l6eDFwTzVaU3pLbFJtcE5lakFLakpSTWNaSTBIb0Jo?=
 =?utf-8?B?aWtTRzdRWnZSdG8yWDZzY1ltWVJEWkF6U0NtdmhIemQrQ0JiL0xRaHE1OHRC?=
 =?utf-8?B?aVB1UnlRdGpSYmxQMG9JOW40NUhNVnFnRlhZQ3FZSnVEeVMxcS9ZdWFTelJP?=
 =?utf-8?B?aTJrZUFRNmN2Sy9WSDNxaXIvMk9qQWl4U0VlZVRibGpvVHEzNlQ3cGxwKzl2?=
 =?utf-8?B?OFI5SkxNR0puOURKVjF4bDVLL2xYaWJRRzFRaS9KVjh6LzZaNklTRnlJTlkr?=
 =?utf-8?B?bjVJWFFJcnZVbzdDMXhTbkp5MGkwdWRsTFJkNHJlYTFLUkl1WjE0NWxJa1VO?=
 =?utf-8?B?clJlZ2toWDc3OVI3ejJ4bVp5SVFyRFlJcythZ0t0N2lpRS9XWkR6SXBNNXBS?=
 =?utf-8?B?b2hhc3FiVDBrNjBaOFFjWnlKcE1VSXQrbkFoSmhSM2FONk5XMUVKeXNEQWt2?=
 =?utf-8?B?VDhURkRBWE8rcllTdFEvMmlUQXJKV3p2SHg1RFhPTHpnWWFGSGxWSytURDZi?=
 =?utf-8?B?RUNEYjV6NFVLS1JtSXkwclVwakUveGtWNCtuOXFIdWd5Z2IvblNHV05xdldT?=
 =?utf-8?B?a3MwRkxGZnc5dlhDa3VZaWo2enNoRTh4Yy8raUV5SjdrblZqZDJveVBFSG85?=
 =?utf-8?B?UDI2VlFvTXl3QnZMYnFPY2tXZkZnYWJHS3lLOFk2bXFsc1YwQk9IY3ZETzc1?=
 =?utf-8?B?RDFmOEE2MFVRS0FKSXhFeFdiQlVJQjRKUGFRcFFPVFFqYzF1N1Exc29PQ0ds?=
 =?utf-8?Q?/qmzbn4lxRC3ckJaZM7CqCejI0PPXrPS9gQrsk2?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKZqgUKz/DUmpXVfRpiBxeiq2U2sPjEKnury62oT0a2FdsbuGncB3rKMrNCaoAFT/ZVCBFKpsgo4+cZ+Vn2VqILjv+rZ+3WP5wM+CbZ5tHiR5lcWXLqnWmCkYluUIDr9sc2o1RLkGLcW4CB83wip5hizMxIaKcrZqy6eDA8mjT2y2zE/uIJhxRn3+ZM5AEYczR3EMeV16RaU0sx060985FFKYjWoFBy4RipOFRqpSeuZiiZyA/I93c9aJRFi/rEyu6PtAJsJdBFH6zOxxhlIRrLslbJ4IW3QwJ0VJ95Vo60pmUCaAxkyOUtjEVfBQnuZu0H0T5GupVmmEkGeERiraw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UrxCX1TwdvgzYueiAh++6vV8t6OXiL5NyL9SRTJSgw=;
 b=UmKx1NtjWyuRTxMqbO076U0HsW8hAezpgte04r4TFw7hOrojyf0FaV4M2gnJn5OXTdPdmTL8gYsShgQIYEyliHGiU6Q60yoOGIaDIZsEFd+YxFgMIitq0Z/lkaGJLTFoD1mHNkuCIBiBqij+nMG9kMhjoCpvgmMU9qqJI1QMHMly1PNqsOZ1D2G/ZxXj+vpic28Z1DYIKwsLZcPUKgX35WWUjyQVdhPyad54WCw/1NnR9vrhriuXD7tlOknhKLqOaBe4uXOrFMtaHEBmYsC4Whw6nipdMiJd73t9bSYW+mQOURDq6PYhjeLWfWPhMJ/0eXjAZ+lcSEV7n9bpfHRrKQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: d6efa70f-f82b-485c-7db7-08d8f946c157
x-ms-exchange-crosstenant-originalarrivaltime: 06 Apr 2021 21:55:55.8459 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: 5sEQaYR/qJoFCBVfasLO/5nB+ScheiYutLrEi7IQuYpjR/VC+fyDVg6wiTY7oqPt1uQF+CvB/Vi0tCxdZoDs8w==
x-ms-exchange-transport-crosstenantheadersstamped: SJ0PR02MB7184
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCA2
LCAyMDIxIDM6NDYgUE0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNv
bT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcGhpbG1kQHJlZGhhdC5jb207IGFsZUBy
ZXYubmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDEyLzIxXSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgYWRkIEYyX3NmcmVjaXBhDQo+
IGluc3RydWN0aW9uDQo+DQo+IE9uIDMvMzEvMjEgODo1MyBQTSwgVGF5bG9yIFNpbXBzb24gd3Jv
dGU6DQo+ID4gK2ludCBhcmNoX3JlY2lwX2xvb2t1cChpbnQgaW5kZXgpDQo+ID4gK3sNCj4gPiAr
ICAgIGluZGV4ICY9IDB4N2Y7DQo+ID4gKyAgICBjb25zdCB1aW50OF90IHJvdW5kcm9tWzEyOF0g
PSB7DQo+ID4gKyAgICAgICAgMHgwZmUsIDB4MGZhLCAweDBmNiwgMHgwZjIsIDB4MGVmLCAweDBl
YiwgMHgwZTcsIDB4MGU0LA0KPiA+ICsgICAgICAgIDB4MGUwLCAweDBkZCwgMHgwZDksIDB4MGQ2
LCAweDBkMiwgMHgwY2YsIDB4MGNjLCAweDBjOSwNCj4gPiArICAgICAgICAweDBjNiwgMHgwYzIs
IDB4MGJmLCAweDBiYywgMHgwYjksIDB4MGI2LCAweDBiMywgMHgwYjEsDQo+ID4gKyAgICAgICAg
MHgwYWUsIDB4MGFiLCAweDBhOCwgMHgwYTUsIDB4MGEzLCAweDBhMCwgMHgwOWQsIDB4MDliLA0K
PiA+ICsgICAgICAgIDB4MDk4LCAweDA5NiwgMHgwOTMsIDB4MDkxLCAweDA4ZSwgMHgwOGMsIDB4
MDhhLCAweDA4NywNCj4gPiArICAgICAgICAweDA4NSwgMHgwODMsIDB4MDgwLCAweDA3ZSwgMHgw
N2MsIDB4MDdhLCAweDA3OCwgMHgwNzUsDQo+ID4gKyAgICAgICAgMHgwNzMsIDB4MDcxLCAweDA2
ZiwgMHgwNmQsIDB4MDZiLCAweDA2OSwgMHgwNjcsIDB4MDY1LA0KPiA+ICsgICAgICAgIDB4MDYz
LCAweDA2MSwgMHgwNWYsIDB4MDVlLCAweDA1YywgMHgwNWEsIDB4MDU4LCAweDA1NiwNCj4gPiAr
ICAgICAgICAweDA1NCwgMHgwNTMsIDB4MDUxLCAweDA0ZiwgMHgwNGUsIDB4MDRjLCAweDA0YSwg
MHgwNDksDQo+ID4gKyAgICAgICAgMHgwNDcsIDB4MDQ1LCAweDA0NCwgMHgwNDIsIDB4MDQwLCAw
eDAzZiwgMHgwM2QsIDB4MDNjLA0KPiA+ICsgICAgICAgIDB4MDNhLCAweDAzOSwgMHgwMzcsIDB4
MDM2LCAweDAzNCwgMHgwMzMsIDB4MDMyLCAweDAzMCwNCj4gPiArICAgICAgICAweDAyZiwgMHgw
MmQsIDB4MDJjLCAweDAyYiwgMHgwMjksIDB4MDI4LCAweDAyNywgMHgwMjUsDQo+ID4gKyAgICAg
ICAgMHgwMjQsIDB4MDIzLCAweDAyMSwgMHgwMjAsIDB4MDFmLCAweDAxZSwgMHgwMWMsIDB4MDFi
LA0KPiA+ICsgICAgICAgIDB4MDFhLCAweDAxOSwgMHgwMTcsIDB4MDE2LCAweDAxNSwgMHgwMTQs
IDB4MDEzLCAweDAxMiwNCj4gPiArICAgICAgICAweDAxMSwgMHgwMGYsIDB4MDBlLCAweDAwZCwg
MHgwMGMsIDB4MDBiLCAweDAwYSwgMHgwMDksDQo+ID4gKyAgICAgICAgMHgwMDgsIDB4MDA3LCAw
eDAwNiwgMHgwMDUsIDB4MDA0LCAweDAwMywgMHgwMDIsIDB4MDAwLA0KPiA+ICsgICAgfTsNCj4g
PiArICAgIHJldHVybiByb3VuZHJvbVtpbmRleF07DQo+IC4uLg0KPiA+ICsgICAgaWYgKGFyY2hf
c2ZfcmVjaXBfY29tbW9uKCZSc1YsICZSdFYsICZSZFYsICZhZGp1c3QsICZlbnYtDQo+ID5mcF9z
dGF0dXMpKSB7DQo+ID4gKyAgICAgICAgUGVWID0gYWRqdXN0Ow0KPiA+ICsgICAgICAgIGlkeCA9
IChSdFYgPj4gMTYpICYgMHg3ZjsNCj4gPiArICAgICAgICBtYW50ID0gKGFyY2hfcmVjaXBfbG9v
a3VwKGlkeCkgPDwgMTUpIHwgMTsNCj4NCj4gV2h5IG5vdCBqdXN0IGV4cG9ydCB0aGUgdGFibGUg
YW5kIG5vdCB0aGUgZnVuY3Rpb24/DQo+IFlvdSdyZSBhbHJlYWR5IG1hc2tpbmcgdGhlIGluZGV4
IGF0IHRoZSBzaW5nbGUgdXNlLg0KDQpJJ2xsIGRvIHRoYXQgZm9yIGJvdGguICBJIGFzc3VtZSB5
b3UgYXJlIHN0aWxsIE9LIGdpdmluZyB5b3VyIFJldmlld2VkLWJ5IGZyb20gdGhlIHByZXZpb3Vz
IHR3byBlbWFpbHMuDQoNClRoYW5rcywNClRheWxvcg0KDQo=

