Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC27355866
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:46:52 +0200 (CEST)
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnul-0005L9-Nc
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTnss-0004lu-74
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:44:54 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:56734)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTnso-0000Ck-K0
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617723890; x=1649259890;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e0sjJ7OBgMXkS7NNhY3qFrJI6XBLaF0HBYAOxNSj+X8=;
 b=xTjQ0Xph7DlwQqBfvU+gtY9tfgGUwBJ0qHtKVEJtNxZLkWIynRwg/w0l
 /IqlfMwbfeV/B/Lz+wVnf7fWZlfjfqWWI3G79RunuXMQ6Thsd7KT1hzy6
 0HEEGjQIR7toErVE2/OlhdPMrbf+oeD+sRqqc67hGK1OI8sauJemmkKdr 8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Apr 2021 08:44:48 -0700
X-QCInternal: smtphost
Received: from nasanexm03d.na.qualcomm.com ([10.85.0.91])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 06 Apr 2021 08:44:48 -0700
Received: from nasanexm03e.na.qualcomm.com (10.85.0.48) by
 nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 08:44:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 6 Apr 2021 08:44:48 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4008.namprd02.prod.outlook.com (2603:10b6:a02:f0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 15:44:39 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 15:44:39 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
Thread-Topic: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
Thread-Index: AQHW/d3cMUb/GhKg1U2DIZ/7+BgFyKpTrq6AgFM0xYCAAKzggIAAYujg
Date: Tue, 6 Apr 2021 15:44:39 +0000
Message-ID: <BYAPR02MB488635155A96A54B5ACD6B26DE769@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-27-git-send-email-tsimpson@quicinc.com>
 <13a3eb3b-49e8-f62e-5222-e787911b69f8@amsat.org>
 <BYAPR02MB4886B81512579C4A88AA99D0DE779@BYAPR02MB4886.namprd02.prod.outlook.com>
 <87y2dvwych.fsf@linaro.org>
In-Reply-To: <87y2dvwych.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [2603:8080:2704:8f00:b0ec:f6d4:b80d:779d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf34ed91-7349-434f-4852-08d8f912e393
x-ms-traffictypediagnostic: BYAPR02MB4008:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4008966A2DEBD9AE55B7CAF5DE769@BYAPR02MB4008.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: od2UdX4P8DyQsDWg20rFtZpQk8+VTAGr4x9s9W9zajRMgKxhmK28+5MIYY3HmCZNpezPTBJsD2YWqYhkKuIwcwvaM8+K0zCMxwNkAbZk2CE6sY7rfGUS0yh3b/lC2AV+WfSQkCUKvQdy/U4XtzRofBft6bX5fnl3S4CYHrv2Ho3W2J0DezFof2hCiIrYmPzO/DFal49WH2c6/XgcWWbVUfdDH66pUL1c3UMAhA2jXRhPEycWM5ePBCkjGTyttdH2XOl0dvdSkC7RxM+w2Lgd12i8b0eyvdTgwftJvrxU0H2yM+IvkrMVjay0GAgHhCgXkoN70X9txGs8nyNtcNVI793IxLmAAL0YnxZTWfijSS5QXE6nkQtQ2x/GB782t0hXDdLuKTtgwoqyGneFMCPGWAj4enxIVhcZH+Aw4wG7Wf1sIgnKbYTVxTZ45VU6l+sxVUT+WP96ATd4r2c4OnEPBgOiu8Xgo1kEtAYNeVQ6Ffg909hYnejlT+S9SVgKF0BLxT69Tb2wkKQaQy//EbnaU+pA9vm8kE9kNmb5mzQVsMSKkhjBqb9VcD/v/ughzZIxLozLoSN/49/dzfdThGa68hen6lfrbb0CoKyIjPjCufir1+T/q6BrHY+AbAQ4bOMS9k5dqY3ORmEtuFEjnjtUjOOBQYFDQJ/PwbDPJkcLRkU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(4326008)(53546011)(8676002)(6916009)(76116006)(33656002)(71200400001)(8936002)(86362001)(38100700001)(2906002)(316002)(5660300002)(52536014)(54906003)(66476007)(66446008)(66556008)(66946007)(9686003)(83380400001)(186003)(7696005)(107886003)(55016002)(478600001)(6506007)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VzhwMU1FdlFqN1E0MVRZZG90clBXaHVXY1VNdzBzMWs3ZHVtMEVLWEtRempr?=
 =?utf-8?B?VWNzMnFCZzRWeVJaWXBEdUJ5YlRERkwvV29XdjZ6WFltdkNhdXdkZXBqREtW?=
 =?utf-8?B?K3RXNHpleXMyT1VYcFNsQ2NZemF1SVk0b3NvNkZQcHo1d0JFRC8yTHp4RXNh?=
 =?utf-8?B?TVI2Tjlsb1I4SkpLL2U4L1VmSlE3ZUt2MDRTMGVVelpKajd0MnBZQUZIMDlH?=
 =?utf-8?B?N0x4Y2dwQVhOOFdCUTZmdXRMc0VvMVNLMDhFWkpVOHQ4ckVuRlNxM1VHOWJC?=
 =?utf-8?B?R1BENmFlVWh6YUR1SUxLdy80TExsakpOQmNoOWw5NjVtUUM3TzRVSmxqSi85?=
 =?utf-8?B?NlkzYklvYlN0S25ib1BzNXNkMGhLMFVyZU9vc1hCZWJSUVJiZGxiWHIwNW92?=
 =?utf-8?B?bktiRzlqQ2phQ3d2UTlvZ3RoZU9zN2dEeDR5SnpSVUJXZlkrb1BoVVRncDhz?=
 =?utf-8?B?MFdMQzdoRVpmaDBvNFdEL3BNcmNocENsdjFOdlQ0R1NFMTBobXFmRjZoSEVu?=
 =?utf-8?B?ZVZic0doWkhlQ2VtWkVvSVBIVGE3ZFQ0SVZNRTVXZHVtVU5SeFd1L0FIL3Ry?=
 =?utf-8?B?STNleGh2WkU5LzJDcWxWaWFBNUFjU1RqSU4zQnZWTTBwT2VOVHdrTm5rL2dK?=
 =?utf-8?B?aEIyMWlHei9GOVQvT2ZJY1RWcC8zUjBNOFo5bTVrWlJDdmJuT3RvMWN6cEZm?=
 =?utf-8?B?UUk0K0ZwMVAwa1dIenQzdi9LU01UWDNVNG1KZ1NmZDdIdW90VlgvVjBRY3V3?=
 =?utf-8?B?RjRmZ3dlNXdVRytwNXh0REtLeS8yRkxIOEQ5Z1ZBK0lKZXRGaytzQzB4b3ho?=
 =?utf-8?B?Umoxb09Wdi9UZW1iUTNaanVRT3VxbjY3VTZ3UjhYbXQ0c1ZqdUdxUzNVcWxY?=
 =?utf-8?B?eWV5c1FkdFVubk84bC9WcTdGSHN1ZWZreURsTUtMcnArcTZ1UjJvY1FrbG5s?=
 =?utf-8?B?VmVqeVpUZmJaWS8ybFhaRTVCVXNkQnhtbWdzbUJLdmRpU1c3QjJJdzNQRFR6?=
 =?utf-8?B?cFVIUnVpQ3loTUpGMXNGaG1LcHYzVmJRVTJYYXpIUEE3eGZMWDFNL3A2TWs1?=
 =?utf-8?B?K0g3SWxXOVYydlk4c3BxcktuMXhJWGJSR3Qyc3RIRVFISktMSUtiRXlNdmpm?=
 =?utf-8?B?RWlQRm54RzV5ZTcrdzl2K3BUc3BVWWFUalhMNXh3VXBZYmFNUjBIK2JxeStD?=
 =?utf-8?B?d1RMSEJVLzNpZVEvd1JtL2lKU1F1QXkrdnRZUnpTb3JaZk9JRXI0QlE1QlBB?=
 =?utf-8?B?bTRpRS9VRFo5VS9rSmVLdGN4OWIrMVRuTmUvQTlUSVZJeHRZVk9QRzBodVlO?=
 =?utf-8?B?QjlFazR3NjV1bFdCc0Rza01IMDIrTk9jYlBvdE1jS1NwQzdsMERYeHl0SEpZ?=
 =?utf-8?B?bU9jVjM0MmxCMWI2NFVlT1pGQkdNY3pzdE1UeW1PQTV3ZldDSlFOYk9HT1hZ?=
 =?utf-8?B?UWZHb2FKUXZjMWVya3VkNXlMV0dGVldNM21jMmc0a0hvMDAzL1NmK2ptQWRt?=
 =?utf-8?B?MVhZaEpUUGpVVHdnb2FpSnBuQVp0MGIwdHZXZ2kzM2VhR1VTbGpzeEhwYWVJ?=
 =?utf-8?B?UmU4YkRXcDQvL2pmd2JXR0tEVTJTeG0rWXFkd2dkY0lNeTlzSHZwMmpYQmln?=
 =?utf-8?B?aEhQK09MMTl1VzF3YmgrVlB6bGlaUTQwTG9EYStIcUpoSTJUajB1VjdmQzJj?=
 =?utf-8?B?ZzVFcEQ2amc1Nk1ubGhHQWJrQmw1eFptT29DMFJadzBlRjVZUDdEL2lWUTkv?=
 =?utf-8?B?K1pVUFJsSnhlTzRndGRDWHkva0tWRmxQdVhEU0xMNllYbGFxc1BhdzFZRENK?=
 =?utf-8?B?OTgvU25iVzhHdmw3UWZpZU1tZ1YvaXpqVHA5OFltL2xvVTUvU2lhTzhpOHVN?=
 =?utf-8?Q?fOd/bCopWLTJr?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZrd7+P4jlNT/XggIzzImVHuheDSuSpMYY3Q+pKOYp04u5I5g3t72Xjbg93+zIUDpCbFkMtEEs62K63TvythFrU+rzrp04bbz3pUJInh7SzO0hc66TEpiSbsdr6PFYj+i2J8kcAZMPdJ8nKlmiYw4lhP0NOafqXszsKvRHeS3OF3FOmBaqUyulZfwqgn/5NXOTdQ5xvwsGjIMtOfjFqDys8PQW68o5TNQvrQ/TYsGz290DeHfWYmXriD3DtO2Q1/VF8lUxlDpFNlYjbv11/5otuQ2BEeOpSY4wchXdzYPwqT+C0Zq7IVEfvnm/nKstSSzNjDcMp+OkCQxa/Vz8Qsfg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGM/W4hovvrmkEhdCxC9Ka0w3AJOVfYnvJiZl4t75ek=;
 b=ECQ4ah0OxtPIZQVFY8kd82rhzhA4zuKrEdD0VE4PfA/UeEXYujGm/Q0D30c+92DGwoP/R7X+ZY4LdZRlkkNGy2eBwkQB1Tb4OydCOpNgetTi8j0CAtBSp5TrhOmEIp8+73C9Hp3NeHFqv66xLvPXrOig2+jUNHk5z1ihdLJUoJ3ntv5EMjzdFxPmVQfy1khGybRQE1BNxkPMy4VppJFdYleGdHsNb1195ITI3Xw+bj5Sgv/UmB6qs5bluxAMqLE0qhj36jqVE83jJwqv3F5d34DwHjjR4sThdG4syKNdwMkNt/DqEPo2pqcffqxmox7HOmRf2wLWTMCARtgFSJC6Kw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: cf34ed91-7349-434f-4852-08d8f912e393
x-ms-exchange-crosstenant-originalarrivaltime: 06 Apr 2021 15:44:39.4273 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: 5PRczlOFIUl5GOc57ZKt6z02hBymeDkPPD/iwFUbDEjkPpNNVe+1fa8BDEsfYA2ZpE9DKT8eIcoXWAPcGG/SCA==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4008
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCA2LCAyMDIxIDQ6
MjAgQU0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gQ2M6
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+OyBxZW11LWRldmVsQG5v
bmdudS5vcmc7DQo+IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7IGxhdXJlbnRAdml2aWVy
LmV1OyBhbGVAcmV2Lm5nOyBCcmlhbiBDYWluDQo+IDxiY2FpbkBxdWljaW5jLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2OCAyNi8zNV0gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFRDRyBn
ZW5lcmF0aW9uDQo+DQo+IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4gd3Jp
dGVzOg0KPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbGlwcGUubWF0aGlldS5kYXVkZUBnbWFpbC5jb20+IE9u
DQo+ID4+IEJlaGFsZiBPZiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqQ0KPiA+PiBTZW50OiBUaHVy
c2RheSwgRmVicnVhcnkgMTEsIDIwMjEgNjoyMyBQTQ0KPiA+PiBUbzogVGF5bG9yIFNpbXBzb24g
PHRzaW1wc29uQHF1aWNpbmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+ID4+IENjOiBy
aWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOyBhbGV4LmJlbm5lZUBsaW5hcm8ub3JnOw0KPiA+
PiBsYXVyZW50QHZpdmllci5ldTsgYWxlQHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2lu
Yy5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMjYvMzVdIEhleGFnb24gKHRhcmdl
dC9oZXhhZ29uKSBUQ0cgZ2VuZXJhdGlvbg0KPiA+Pg0KPiA+PiA+ICtzdGF0aWMgaW5saW5lIFRD
R3YgZ2VuX3JlYWRfcHJlZyhUQ0d2IHByZWQsIHVpbnQ4X3QgbnVtKQ0KPiA+PiA+ICt7DQo+ID4+
ID4gKyAgICB0Y2dfZ2VuX21vdl90bChwcmVkLCBoZXhfcHJlZFtudW1dKTsNCj4gPj4gPiArICAg
IHJldHVybiBwcmVkOw0KPiA+PiA+ICt9DQo+ID4+ID4gKw0KPiA+PiA+ICtzdGF0aWMgaW5saW5l
IHZvaWQgZ2VuX2xvZ19wcmVkaWNhdGVkX3JlZ193cml0ZShpbnQgcm51bSwgVENHdiB2YWwsIGlu
dCBzbG90KQ0KPiA+PiA+ICt7DQo+ID4+ID4gKyAgICBUQ0d2IG9uZSA9IHRjZ19jb25zdF90bCgx
KTsNCj4gPj4gPiArICAgIFRDR3YgemVybyA9IHRjZ19jb25zdF90bCgwKTsNCj4gPj4gPiArICAg
IFRDR3Ygc2xvdF9tYXNrID0gdGNnX3RlbXBfbmV3KCk7DQo+ID4+ID4gKw0KPiA+PiA+ICsgICAg
dGNnX2dlbl9hbmRpX3RsKHNsb3RfbWFzaywgaGV4X3Nsb3RfY2FuY2VsbGVkLCAxIDw8IHNsb3Qp
Ow0KPiA+PiA+ICsgICAgdGNnX2dlbl9tb3Zjb25kX3RsKFRDR19DT05EX0VRLCBoZXhfbmV3X3Zh
bHVlW3JudW1dLCBzbG90X21hc2ssIHplcm8sDQo+ID4+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHZhbCwgaGV4X25ld192YWx1ZVtybnVtXSk7DQo+ID4+ID4gKyNpZiBIRVhfREVCVUcN
Cj4gPj4NCj4gPj4gQ2FuIHlvdSBkZWNsYXJlIGFuICdib29sIGhleGFnb25fZGVidWdfZW5hYmxl
ZCh2b2lkKTsnIGV2ZW50dWFsbHkNCj4gPj4gaW5saW5lZCwgc28gd2UgY2FuIGdldCB0aGlzIGNv
ZGUgY29tcGlsZWQgKHRvIGF2b2lkIGJpdHJvdGluZykgdXNpbmcNCj4gPj4NCj4gPj4gICBpZiAo
aGV4YWdvbl9kZWJ1Z19lbmFibGVkKCkpIHsNCj4gPj4NCj4gPj4gPiArICAgIC8qIERvIHRoaXMg
c28gSEVMUEVSKGRlYnVnX2NvbW1pdF9lbmQpIHdpbGwga25vdyAqLw0KPiA+PiA+ICsgICAgdGNn
X2dlbl9tb3Zjb25kX3RsKFRDR19DT05EX0VRLCBoZXhfcmVnX3dyaXR0ZW5bcm51bV0sIHNsb3Rf
bWFzaywgemVybywNCj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAgICBvbmUsIGhleF9yZWdf
d3JpdHRlbltybnVtXSk7DQo+ID4+DQo+ID4+ICAgfQ0KPiA+Pg0KPiA+PiA+ICsjZW5kaWYNCj4g
Pg0KPiA+IERvIHdlIHJlYWxseSBuZWVkIGEgZnVuY3Rpb24/ICBXaHkgbm90IGNoYW5nZQ0KPiA+
DQo+ID4gI2lmIEhFWF9ERUJVRw0KPiA+ICAgICAuLi4NCj4gPiAjZW5kaWYNCj4gPg0KPiA+IHRv
DQo+ID4NCj4gPiBpZiAoSEVYX0RFQlVHKSB7DQo+ID4gICAgIC4uLg0KPiA+IH0NCj4NCj4gWW91
IGNhbiBnbyB0aGUgd2hvbGUgaG9nIGFuZCB3cmFwIGV2ZXJ5dGhpbmcgdXAgdG8gbWluaW1pc2Ug
dGhlIGNoYW5jZQ0KPiBvZiBmdW5jdGlvbmFsIGNoYW5nZXMgaW4geW91ciBkZWJ1ZyBsZWdzIGlu
IHRoZSBtYWluIGNvZGUsIGUuZy46DQo+DQo+ICAgI2RlZmluZSB0bGJfZGVidWcoZm10LCAuLi4p
IGRvIHsgXA0KPiAgICAgICBpZiAoREVCVUdfVExCX0xPR19HQVRFKSB7IFwNCj4gICAgICAgICAg
IHFlbXVfbG9nX21hc2soQ1BVX0xPR19NTVUsICIlczogIiBmbXQsIF9fZnVuY19fLCBcDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICMjIF9fVkFfQVJHU19fKTsgXA0KPiAgICAgICB9IGVsc2Ug
aWYgKERFQlVHX1RMQl9HQVRFKSB7IFwNCj4gICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiJXM6
ICIgZm10LCBfX2Z1bmNfXywgIyMgX19WQV9BUkdTX18pOyBcDQo+ICAgICAgIH0gXA0KPiAgIH0g
d2hpbGUgKDApDQo+DQo+IFRoZW4gYSBzdGF0ZW1lbnQgbGlrZToNCj4NCj4gICB0bGJfZGVidWco
Im1tdV9pZHg6MHglMDQiIFBSSXgxNiAiXG4iLCBhc2tlZCk7DQo+DQo+IGlzIHVuYW1iaWd1b3Vz
bHk6DQo+DQo+ICAgLSBvYnZpb3VzbHkgYSBkZWJ1ZyBzdGF0ZW1lbnQNCj4gICAtIGFsd2F5cyBj
b21waWxlZCwgaGVuY2Ugbm8gYml0IHJvdA0KPiAgIC0gb3B0aW1pc2VzIGF3YXkgd2hlbiBnYXRl
cyBhcmUgMA0KPiAgIC0gZG9lc24ndCBhY2NpZGVudGFsbHkgaW5jbHVkZSBjaGFuZ2VzIGluIGJl
aGF2aW91cg0KDQpUaGF0IGFwcHJvYWNoIHdvcmtzIGZpbmUgZm9yIGNvZGUgdGhhdCBwcmludHMg
dGhpbmdzIG91dC4gIEluIGZhY3QsIHdlIGhhdmUgSEVYX0RFQlVHX0xPRyBmb3IgdGhhdCBwdXJw
b3NlLiAgSSBjYW4gcmV3cml0ZSBpdCBhcyB5b3Ugc3VnZ2VzdCBzbyB0aGUgYXJncyBhbHdheXMg
Z2V0IGNvbXBpbGVkLg0KDQpJbiBhZGRpdGlvbiwgdGhlcmUgYXJlIGEgZG96ZW4gb3Igc28gcGxh
Y2VzIHdoZXJlIHdlIGVtaXQgYWRkaXRpb25hbCBUQ0cgY29kZSB3aGVuIEhFWF9ERUJVRyBpcyBz
ZXQuICBXZSBwcmludCB0aGUgcmVzdWx0cyBpbiBIRUxQRVIoZGVidWdfY29tbWl0X2VuZCkuICBJ
biB0aGUgZXhhbXBsZSBhYm92ZSwgd2Ugd291bGQgZW5kIHVwIHdpdGgNCg0KI2RlZmluZSBkZWJ1
Z19wcmVkaWNhdGVkX3JlZ193cml0ZShybnVtLCBzbG90X21hc2ssIHplcm8sIG9uZSkgXA0KICAg
IGRvIHsgXA0KICAgICAgICBpZiAoSEVYX0RFQlVHKSB7IFwNCiAgICAgICAgICAgIHRjZ19nZW5f
bW92Y29uZF90bChUQ0dfQ09ORF9FUSwgaGV4X3JlZ193cml0dGVuW3JudW1dLCBzbG90X21hc2ss
IHplcm8sIFwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG9uZSwgaGV4X3JlZ193cml0dGVuW3JudW1dKTsgXA0KICAgICAgICB9IFwNCiAgICB9IHdo
aWxlICgwKQ0KDQpJTU8sIHRoZSBpbnZvY2F0aW9uDQogICAgZGVidWdfcHJlZGljYXRlZF9yZWdf
d3JpdGUocm51bSwgc2xvdF9tYXNrLCB6ZXJvLCBvbmUpOw0Kd291bGQgYmUgaGFyZGVyIHRvIHJl
YWQgYmVjYXVzZSB5b3UgaGF2ZSB0byBsb29rIGF0IHR3byBwbGFjZXMgdG8gc2VlIHdoYXQgaXMg
Z29pbmcgb24uICBUaGVyZSB3b3VsZCBiZSBvbmx5IG9uZSBpbnZvY2F0aW9uLCBzbyBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gcHV0IHRoZSBpZiAoSEVYX0RFQlVHKSBpbiBwbGFjZS4NCg0KDQpUYXls
b3INCg0K

