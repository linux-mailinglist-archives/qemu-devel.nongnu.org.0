Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F03CE398
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:21:24 +0200 (CEST)
Received: from localhost ([::1]:48092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5W1D-0007g3-GO
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1m5Vzf-0006iT-Vl
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:19:47 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:49938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1m5Vzb-000070-Kr
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1626711583; x=1627316383;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=I+YNLpq9MP/KKsomn2XC3HpQNTIwybAP6U54k+5vLIc=;
 b=fb6rRlG3KkUb2biA+xvWQFgeVA1sp75vthrLALTAUxefzP33V6j+KcSY
 9HYxuB2AdOzYAXwMNGCVXSWsI0xaCIcHhsh0ToKOWi2ptrBuwdkxTA2rZ
 UKsilR0kTdd0+p6fxiWI+xy7eAvc/o4dXMNpNd+TPAtkfVBvXFbN7Oskp o=;
Subject: RE: [PATCH 01/20] Hexagon HVX (target/hexagon) README
Thread-Topic: Re: [PATCH 01/20] Hexagon HVX (target/hexagon) README
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 16:19:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4EZl5rA3bIeAjTg5DW75I3XHguQ79ra+bq25+EfLIt0hRDrGYGwR6GgLHWYxfirCYobIbe+3piI2zCWsEq/MLlqP+a0DlfYWPAWbONgaHLkghB3di4Pp738AuZpt2orWP6sx2DyDJ2HLonGnoEkDVS601xv8YI+sOCT5Q3RBwB9MgN/kOjrFZIzl5YZDP7CprubJYOcndBStFawEOGriXK3UJ4lrAk9XTsL5yxWMaS83jEoywzHKT07G7JvQLAYJvXBzwnnIqLb67FyPgn4hKLE/YXnD3vSBx0YZPsRFseq222RGo85o74HqKFLs6JkudguYUL6b+jbt6FS3j6QDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+YNLpq9MP/KKsomn2XC3HpQNTIwybAP6U54k+5vLIc=;
 b=k9ILu7CJ8E/V/4gL4rrIgp4h97VkJfGTMuqTPQeC9ZHDBxLk8pTtLEnAjA/J74+wXlg+C1s/l0DwwQNLxP2YH2O4vISgyLD7G84Nf4Ge/t1lmVCrjYKR1lPOGIlHQjULTDh2lpKbe8ffCqIyEzHtEPr6gaFfhjrQkNRGwhqM/bmfaTwsrsa1u4Gg6g6xHtz7i/ZuaiLcnf9AI5XNfXtQkTLV9WHzegn8hLCL5SS2rxqUrygrz4jRCj3OMvRdLYAw2j8AcZ8wYgeqepzKus985/Lm+9ohZkvX1WpQbTTOjcmQIU5i9cmMPhDJKHwqAz5ID5rNBi8UNonKOnjV0N8ThQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5509.namprd02.prod.outlook.com (2603:10b6:a03:9e::31)
 by SJ0PR02MB7200.namprd02.prod.outlook.com (2603:10b6:a03:299::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 16:19:38 +0000
Received: from BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::2d8f:ae60:61a0:6605]) by BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::2d8f:ae60:61a0:6605%6]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 16:19:37 +0000
From: Sid Manning <sidneym@quicinc.com>
To: Brian Cain <bcain@quicinc.com>, Rob Landley <rob@landley.net>, Taylor
 Simpson <tsimpson@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Index: AQHXdvPZ2j6byfQBZUmKdat7iQarWKs/WakAgAouLoCAANFHgIAADADg
Date: Mon, 19 Jul 2021 16:19:37 +0000
Message-ID: <BYAPR02MB55091DE5B976956075B46FADBEE19@BYAPR02MB5509.namprd02.prod.outlook.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
 <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
 <SN6PR02MB42054B50C60ABA378256492DB8159@SN6PR02MB4205.namprd02.prod.outlook.com>
 <553c32e8-188c-5b2c-2f4a-a8cfd7b903a9@landley.net>
 <BN7PR02MB4194007550E66EBE877625A6B8E19@BN7PR02MB4194.namprd02.prod.outlook.com>
In-Reply-To: <BN7PR02MB4194007550E66EBE877625A6B8E19@BN7PR02MB4194.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: quicinc.com; dkim=none (message not signed)
 header.d=none;quicinc.com; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e1e3295-e1ca-4528-2737-08d94ad10135
x-ms-traffictypediagnostic: SJ0PR02MB7200:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB7200024725EB1002A6C9A60EBEE19@SJ0PR02MB7200.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J4MtXg8eXidMbW6Vi3uCw0U9H2ZNQypRgCOhsGYMPTL4ml0oPyhwuKWukstJbR2P+1eA8GnnFKWJcViD3diQOl10IPiI57PiV5wc2LrcxVrDXI5Mov9fTgsrKJtXDye0B2GAF1hYHMnGj+/Esl7KMXqghRx6OJkJzgbgn1cQgSd+0GJ2nRy2XU/9mlbjzzC3DhbTf3OSa1pZD+ZfSdunyGzPTO/DOy5XXLzeRPuuYWgCZxvPR0YVMVYE1usam5UoCeS3odCPM1zw8UKnj3cEgTcou+zmQQ0iJNN8vVeL0ItbV67MW/LWJN8+3DKqeMSPoiJ7Ds2Kf12KsSLNqyhATiW5YXvngZKB2Gwuz5GxlKngMf2hk9G9wPcPA1JP/72EmqyS9PndZt+pOJQSrxSSfhgQB2TBYtQP+JbUfzTyTj1ULwf9/S84VDtWH24hfiNP1q8l6zFr8DGGk6p0KrggXUqcBVv7MZoy1wtsJAOmvyuMSksQZxvcbQmo0TCc7gu5Bc+EWRUWyaT1AfTEQnnDcK/Q8Qnbtph4IxdqqDF6lGN+6D8wTnuvTbP0a8oC8DRQelBJANjptCRhRjTbKUWMkZc6aeOezuyoMbiZKEJkDifo+4v3DpYCahnyQp/qxSaIDHYyYl+IUXPn7YUftgSXOJkaVG6k8sG0oRzLFK28U+qROwjxyT838eu7gqLkGk0vrGW8+ToUYzIAvhU7lvmjCyoAiEEfLcsdboal0m3TTjCWPj2L2Q38X/jRAxXnuZ3Y/CWvJCNb6JxVI9x/mY1Tm+tv/do0I6s/MnduXQuhRw2PgHzA3kgHDWZL4tfvhA/lUICBUW13gnDtuE/63Vc2/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5509.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(52536014)(966005)(64756008)(122000001)(66556008)(8936002)(9686003)(66446008)(66946007)(55016002)(110136005)(7696005)(4326008)(508600001)(38100700002)(76116006)(316002)(53546011)(6506007)(33656002)(5660300002)(2906002)(186003)(83380400001)(26005)(86362001)(54906003)(8676002)(71200400001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2h0NldXVkwyNEJNM2FwdzdXNTYxY1hpVTBGMjlWNHcyNzlCbWNSTGZNNEJU?=
 =?utf-8?B?NzVQc3hCdEFndVVWc3kvRk1CZlZCRndJTzFJUlJjSDJVaUtLVXF2RGk2cEZ0?=
 =?utf-8?B?MlllL1B2dExYbmd4N3A0QytlWnlwQ2Jqd0kyc1R1NE1wWFlJc2dIZzRPNUJQ?=
 =?utf-8?B?TFROb01oWW9uRzkrYzBHWWU3SG1uenBJTkZVN0FCUjM0Q0M3bmR3d1VpcnZ6?=
 =?utf-8?B?amZlOEx0V2s5SUcyUng1T3haWk5udXYrOUh0VC9nR0N0bmc5UUV3MWpYTDVh?=
 =?utf-8?B?YkR3YTBDbFk5SlYzejVDTXN4MWpKWElGWEpCU2VsQkg3Z1M1dDh6ZEZqWTJu?=
 =?utf-8?B?ZmcxamR3QkgxbC92Q1p6YjFGRFd0UGFlSmNveURQOTRSNVlHTDdmcm8zbzc1?=
 =?utf-8?B?ZWVndGc0TmJsbnJlVHkyNjMwbkRoQy81eGJHNC9ZOFltcnZhZ0pLZkNISVNV?=
 =?utf-8?B?bkhYQ2l2dDV4VERSRjJzSG1WbnY1RDBYOGg0Nnlva2d6NXoxalhLdWJwR3VR?=
 =?utf-8?B?c1ZKc2labGFrRDJ6MUtEb0paYmpGUVlYb29scXhML0ErUWRSOHU5T3lHYUhn?=
 =?utf-8?B?QUhYc3pldGZLaDUrSXJid2ZjZjI1c1hybkJCaVBHUkpWTHpuSFA4c2k3NlBk?=
 =?utf-8?B?SkRwNk91b1hOSG9rWHBzN1BUeThiSXJmMG1kaGVKbmU0cnZvNGJHOHFUL0NE?=
 =?utf-8?B?Y0o5M2hYK2ZCMGZidERNNGdGOTNlWnBDSXg5QzUzMDAvWmJnYkI5OGdVbS9w?=
 =?utf-8?B?SHc4L24xcnFPcURONjNuQWtsUUNxQ0g5SlZzenluVFNNS3p1SlJIM1pxSkN2?=
 =?utf-8?B?bzE4QmtyVEZtUEhHdVhIYk9xK3Y1c1Q2VE9NV3F2aHptR1Z1bHlwelNFb2VM?=
 =?utf-8?B?Y1VVc1l0Qnhwd3NjTmxXMGhkV0RSWnQwbmt1NUg0SnFOcVZtcytaRE5Ea0Er?=
 =?utf-8?B?SHpZNG1QaDZjeGJzcTN1aGl6bk9NNjlvRzZodEpMdWJsOFFRd0J0Y245bnRQ?=
 =?utf-8?B?bG4ydFJqMjBrQWRwOVVlQit3cW1jUVVYTzd4RFZSbFBScTJDQjIvS2xQbjB0?=
 =?utf-8?B?MGF4UGVqeG9SMHNVT0d5VVZDV0ZIUTloMzhQWU9MTnFSbFZQNkt3SnRTODhk?=
 =?utf-8?B?bGZ4UVhjRUlTblR5VWowNlVoMHBGdndPUU9USnRtVTBrcXNpWUlUdkJ2eTNw?=
 =?utf-8?B?aUI2ek1LS2YyVW5BU1pXZ291UnlWYzVYQjh6K1BxdEdEWDlOTjZ4NTYxUmFz?=
 =?utf-8?B?dXRvWmRLUHU1OW9CMk1GUVZtVTM2MVYrWnUyVUlnU3RnWjJZejJiTmlibmtp?=
 =?utf-8?B?T29TMlJVTWZCeVZ2WFlnQnRzMWZSK2xSNjRjN0l3M2dNaWdFVVZEOHlVM0RN?=
 =?utf-8?B?cXpCV1l6VW9SSmh0cENXcWdLRTVrS2Nvbk9rQXJPRVNhZHRxWGNEZFV3OU9I?=
 =?utf-8?B?bmxUSXUraG83c3VuL1NTRnZOdHpMY0hrYnViNnJQZXowY3Juc0Z3YVVudk0z?=
 =?utf-8?B?Ny83RWU2aHI2bVk5UWJ6MjMwNjhLdkIyeGtpc0JkaWQ2V3hlem44SUI5Sy9K?=
 =?utf-8?B?YUw2cWZEM2F6c2U2TGdxRzFjcWhDSGtzUGdRY0JFSThNT0hSZ3NZZHBTSlBB?=
 =?utf-8?B?WVlVTWtzaUhDUE9zQTUzdFpCQTFjZVRsdi9LRzBtSDVHMzEwMzQ1ZlhVaVRO?=
 =?utf-8?B?SVc4NWpKdUJ2b2VPTzdJc0xwSXFIRjNJWXRmbS9mdVd4TlkzZHVxeERtMllQ?=
 =?utf-8?Q?7QChzD0deqtTS2rLK7CGrfzQX6Rd4mfX8OjVQ7C?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5509.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1e3295-e1ca-4528-2737-08d94ad10135
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 16:19:37.5418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aaTApd1ua0SzK/0FKvHrvYNNiOtqwuYdFXAlUeeN17Ds9aScciCbGmF2/qcMgaQvqoNrqe5z4vTCp7RMUiFWhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7200
Received-SPF: pass client-ip=216.71.142.165; envelope-from=sidneym@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJpYW4gQ2FpbiA8YmNh
aW5AcXVpY2luYy5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVseSAxOSwgMjAyMSA4OjQwIEFNDQo+
IFRvOiBSb2IgTGFuZGxleSA8cm9iQGxhbmRsZXkubmV0PjsgVGF5bG9yIFNpbXBzb24NCj4gPHRz
aW1wc29uQHF1aWNpbmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBTaWQgTWFubmluZw0K
PiA8c2lkbmV5bUBxdWljaW5jLmNvbT4NCj4gQ2M6IGFsZUByZXYubmc7IHBldGVyLm1heWRlbGxA
bGluYXJvLm9yZzsgcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsNCj4gcGhpbG1kQHJlZGhh
dC5jb20NCj4gU3ViamVjdDogUkU6IFtFWFRdIFJlOiBbUEFUQ0ggMDEvMjBdIEhleGFnb24gSFZY
ICh0YXJnZXQvaGV4YWdvbikNCj4gUkVBRE1FDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBSb2IgTGFuZGxleSA8cm9iQGxhbmRsZXkubmV0Pg0K
PiAuLi4NCj4gPiBPbiA3LzEyLzIxIDg6NDIgQU0sIEJyaWFuIENhaW4gd3JvdGU6DQo+IC4uLg0K
PiA+ID4gYW5kIHRoZXJlJ3MgYWxzbyBhIGJpbmFyeSBoZXhhZ29uLWxpbnV4IGNyb3NzIHRvb2xj
aGFpbiB0aGF0IHdlDQo+ID4gPiBzaGFyZWQgZm9yIHVzZSBieSBrZXJuZWwgZGV2ZWxvcGVycy4g
IFRoZSBoZXhhZ29uIGxpbnV4IHRvb2xjaGFpbiBpcw0KPiA+ID4gYnVpbHQgb24gVWJ1bnR1IDE2
LjA0Lg0KPiA+DQo+ID4gV2hlcmUncyB0aGF0IG9uZT8NCj4gDQo+IGh0dHBzOi8vY29kZWxpbmFy
by5qZnJvZy5pby9hcnRpZmFjdG9yeS9jb2RlbGluYXJvLXFlbXUvMjAyMS0wNS0NCj4gMTIvY2xh
bmcrbGx2bS0xMi4wLjAtY3Jvc3MtaGV4YWdvbi11bmtub3duLWxpbnV4LW11c2wudGFyLnh6IC0N
Cj4gCS0gQnVpbHQgb24gVWJ1bnR1IDE2LjA0LCBzaW1pbGFyIGR5bmFtaWMgZGVwZW5kZW5jaWVz
IGFzDQo+IHJlbGVhc2VzLmxsdm0ub3JnIGJpbmFyaWVzDQo+IAktIE1hbmlmZXN0Og0KPiAJCS0g
bGx2bStjbGFuZyAxMi4wLjAgdGFnDQo+IAkJLSBMaW51eCA1LjYuMTgNCj4gCQktIGdpdGh1Yi5j
b20vcWVtdS9xZW11DQo+IDE1MTA2ZjdkYzMyOTBmZjMyNTQ2MTFmMjY1ODQ5YTMxNGE5M2ViMGUN
Cj4gCQktIGdpdGh1Yi5jb20vcXVpYy9tdXNsDQo+IGFmZjc0YjM5NWZiZjU5Y2Q3ZTkzYjM2OTE5
MDVhYTFhZjZjMDc3OGMNCj4gDQo+IA0KPiA+ID4gQnV0IHdoZW4gYnVpbGRpbmcgeW91ciB0b29s
Y2hhaW4sIG9taXR0aW5nIExMVk1fRU5BQkxFX0xMRCBzaG91bGQNCj4gPiA+IHdvcmsNCj4gPiBq
dXN0IGZpbmUuDQo+ID4NCj4gPiBJdCBkaWQsIHRoYW5rcy4NCj4gPg0KPiA+IE5vdyBJJ20gdHJ5
aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCBhbGwgdGhlIGV4dHJhIENGTEFHUyBhcmUgZm9yLg0KPiAN
Cj4gK1NpZCBmb3Igc29tZSBwZXJzcGVjdGl2ZSBvbiB0aGUgcmF0aW9uYWxlIG9mIHRoZXNlIGZs
YWdzLiAgU29tZSBvZiB0aGVzZQ0KPiBmbGFncyBtYXkgYmUgd29ya2Fyb3VuZHMgZm9yIHRvb2xj
aGFpbiBpc3N1ZXMuDQo+IA0KPiA+IFRoZSBjbGFuZ19ydCBidWlsZCBoYXMgQ01BS0VfQVNNX0ZM
QUdTPSItRzAgLW1sb25nLWNhbGxzIC1mbm8tcGljDQo+ID4gLS10YXJnZXQ9aGV4YWdvbi11bmtu
b3duLWxpbnV4LW11c2wiIHdoaWNoDQo+ID4gaHR0cHM6Ly9jbGFuZy5sbHZtLm9yZy9kb2NzL0Ns
YW5nQ29tbWFuZExpbmVSZWZlcmVuY2UuaHRtbCBkZWZpbmVzIGFzOg0KPiA+DQo+ID4gLUc8c2l6
ZT4NCj4gPiAgIFB1dCBvYmplY3RzIG9mIGF0IG1vc3QgPHNpemU+IGJ5dGVzIGludG8gc21hbGwg
ZGF0YSBzZWN0aW9uIChNSVBTIC8NCj4gPiBIZXhhZ29uKQ0KPiA+DQo+ID4gLW1sb25nLWNhbGxz
DQo+ID4gICBHZW5lcmF0ZSBicmFuY2hlcyB3aXRoIGV4dGVuZGVkIGFkZHJlc3NhYmlsaXR5LCB1
c3VhbGx5IHZpYSBpbmRpcmVjdA0KPiBqdW1wcy4NCj4gPg0KPiA+IEkgZG9uJ3QgdW5kZXJzdGFu
ZCB3aHkgeW91ciBsaWJjYyBidWlsZCBuZWVkcyBuby1waWM/IChBcmUgd2Ugb25seQ0KPiA+IGJ1
aWxkaW5nIGEgc3RhdGljIGxpYmdjYy5hIGluc3RlYWQgb2YgYSBkeW5hbWljIG9uZT8gSSdtIGZp
bmUgd2l0aA0KPiA+IHRoYXQgaWYgc28sIGJ1dCB0aGlzIG5lZWRzIHRvIGJlIHNwZWNpZmllZCBp
biB0aGUgTUFLRV9BU01fRkxBR1Mgd2h5PykNCj4gPg0KPiA+IFdoeSBpcyBpdCBzYXlpbmcgLS10
YXJnZXQ9aGV4YWdvbi1yYW5kb20tbm9uc2Vuc2UtbXVzbCB0byBhIHRvb2xjaGFpbg0KPiA+IHdl
IGJ1aWx0IHdpdGggZXhhY3RseSBvbmUgdGFyZ2V0IHR5cGU/IEhvdyBkb2VzIGl0IE5PVCBkZWZh
dWx0IHRvDQo+IGhleGFnb24/DQo+ID4gKElzIHRoaXMgcmVsYXRlZCB0byB0aGUgYnVpbGQgd3Jp
dGluZyBhIGhleGFnb24tcG90YXRvLWJhbmFuYS1tdXNsLmNmZw0KPiA+IGZpbGUgaW4gdGhlIGJp
biBkaXJlY3RvcnksIG1lYW5pbmcgdGhlIGNvbmZpZyBmaWxlIGlzIGluIHRoZSAkUEFUSD8NCj4g
PiBEb2VzIGNsYW5nIG9ubHkgbG9vayBmb3IgaXQgaW4gdGhlIHNhbWUgZGlyZWN0b3J5IHRoZSBj
bGFuZyBleGVjdXRhYmxlDQo+ID4gbGl2ZXMgaW4/KQ0KPiA+DQo+ID4gQW5kIHdoaWxlIHdlJ3Jl
IGF0IGl0LCB0aGUgQ09OVEVOVFMgb2YgaGV4YWdvbi1ncmF0dWl0b3VzLWdudS1mb3JtYXQuY2Zn
DQo+IGlzOg0KPiA+DQo+ID4gY2F0IDw8RU9GID4gaGV4YWdvbi11bmtub3duLWxpbnV4LW11c2wu
Y2ZnDQo+ID4gLUcwIC0tc3lzcm9vdD0ke0hFWF9TWVNST09UfQ0KPiA+IEVPRg0KPiA+DQo+ID4g
V2hpY2ggaXMgQUxSRUFEWSBzYXlpbmcgLUcwPyAoV2h5IGRvZXMgaXQgd2FudCB0byBkbyB0aGF0
IGdsb2JhbGx5Pw0KPiA+IFNvbWUgc29ydCBvZiBidWcgd29ya2Fyb3VuZD8pIFNvIHdoeSBkbyB3
ZSBzcGVjaWZ5IGl0IGFnYWluIGhlcmU/DQo+ID4NCj4gPiBOZXh0IHVwIGJ1aWxkX211c2xfaGVh
ZGVycyBkb2VzIENST1NTX0NGTEFHUz0iLUcwIC1PMCAtbXY2NQ0KPiA+IC1mbm8tYnVpbHRpbiAt
Zm5vLXJvdW5kaW5nLW1hdGggLS10YXJnZXQ9aGV4YWdvbi11bmtub3duLWxpbnV4LW11c2wiDQo+
IHdoaWNoOg0KDQpJIGFncmVlIEcwIGlzIG92ZXJwbGF5ZWQgaGVyZS4gIEcwIGlzIHRoZSBpbXBs
aWVkIGRlZmF1bHQgb24gTGludXguICBPbiBvY2Nhc2lvbiB3ZSB1c2UgYSBkaWZmZXJlbnQgY29u
ZmlndXJhdGlvbiBvZiBjbGFuZyB3aGVyZSBzbWFsbCBkYXRhIChHOCkgaXMgdGhlIGRlZmF1bHQg
c28gRzAgaXMgc3BlY2lmaWVkLg0KDQoNCj4gPg0KPiA+IC1PMA0KPiA+ICAgZGlzYWJsZSBtb3N0
IG9mIHRoZSBvcHRpbWl6ZXINCg0KVGhpcyBzaG91bGQgYmUgY2hhbmdlZC4gIFRoaXMgd2FzIGFk
ZGVkIHNvIEkgY291bGQgZmFjdG9yIG91dCBjbGFuZydzIGZsb2F0aW5nIHBvaW50IG9wdGltaXph
dGlvbnMuICBUaGVzZSBvcHRpbWl6YXRpb25zIGNhdXNlZCBtdXNsLWxpYmMgdGVzdHN1aXRlIHRv
IGZhaWwgc29tZSBmbG9hdGluZyBwb2ludCBhY2N1cmFjeSB0ZXN0cy4gIEkga25vdyBhdCBsZWFz
dCBzb21lIG9mIHRob3NlIGlzc3VlcyBoYXZlIG5vdyBiZWVuIHJlc29sdmVkLg0KDQo+ID4NCj4g
PiAtbXY2NQ0KPiA+ICAgLW10dW5lIGZvciBhIHNwZWNpZmljIGhleGFnb24gZ2VuZXJhdGlvbi4N
Cj4gPiAgIChXaHk/IERvZXMgcWVtdSBvbmx5IHN1cHBvcnQgdGhhdCBidXQgbm90IG5ld2VyPykN
ClBhc3NpbmcgLW12WFggaXQgaXMgbm93IHJlY29tbWVuZGVkIHByYWN0aWNlLiAgQSBmZXcgeWVh
cnMgYWdvIHRoZSBkZWZhdWx0IGFyY2ggc2VsZWN0ZWQgY2hhbmdlZCBmcm9tIHRoZSBvbGRlc3Qg
c3VwcG9ydCBhcmNoIHRvIHRoZSBuZXdlc3QgYXJjaC4gIFFFTVUgc3VwcG9ydHMgbGF0ZXIgYXJj
aGl0ZWN0dXJlcy4NCg0KPiA+DQo+ID4gLWZuby1idWlsdGluDQo+ID4gICBtdXNsJ3MgLi9jb25m
aWd1cmUgYWxyZWFkeSBwcm9iZXMgZm9yIHRoaXMgYW5kIHdpbGwgYWRkIGl0IGlmDQo+ID4gICB0
aGUgY29tcGlsZXIgc3VwcG9ydHMgaXQuDQpJIGRpZCBub3Qga25vdyB0aGlzLCB3ZSBjYW4gZ2V0
IHJpZCBvZiAtZm5vLWJ1aWx0aW4gaWYgdGhlIGRyaXZlciBpcyBtZWV0aW5nIG11c2wncyBleHBl
Y3RhdGlvbnMuDQoNCg0KPiA+DQo+ID4gLWZuby1yb3VuZGluZy1tYXRoDQo+ID4gICB0aGUgZG9j
cyBNRU5USU9OIHRoaXMsIGJ1dCBkbyBub3QgZXhwbGFpbiBpdC4NCg0KVGhpcyB3YXMgd29ya2Fy
b3VuZCBhbmQgaXMgbm8gbG9uZ2VyIG5lZWRlZC4gIElJUkMgY2xhbmcgd2FzIGFzc2VydGluZyB3
aGlsZSBidWlsZGluZyBtdXNsLg0KDQo+ID4NCj4gPiBBbmQgYWdhaW4gd2l0aCB0aGUgLUcwLg0K
PiA+DQo+ID4gVGhlc2UgZmxhZ3MgcHJvYmFibHkgYXJlbid0IG5lZWRlZCBfaGVyZV8gYmVjYXVz
ZSB0aGlzIGlzIGp1c3QgdGhlDQo+ID4gaGVhZGVycyBpbnN0YWxsICh3aGljaCBpcyBiYXNpY2Fs
bHkgYSBjcCAtYSBpc24ndCBpdD8pLiBUaGlzIGxvb2tzDQo+ID4gbGlrZSBpdCdzIGNvcGllZCB2
ZXJiYXRpbSBmcm9tIHRoZSBtdXNsIGxpYnJhcnkgYnVpbGQuIEJ1dCB0aGF0DQo+ID4gbGlicmFy
eSBidWlsZCBoYXBwZW5zIGluIGEgYml0LCBzbyByZWxldmFudC1pc2ggSSBndWVzcy4uLg0KPiA+
DQo+ID4gKEFsc28sIHdoeSBkb2VzIGJ1aWxkaW5nIGxpYnJ0LWJ1dC1ub3QtcmVhbGx5IG5lZWQg
dGhlIGxpYmMgaGVhZGVycz8NCj4gPiBUaGUgbGliZ2NjIGJ1aWxkIEVYUExJQ0lUTFkgZG9lcyBu
b3QgcmVxdWlyZSB0aGF0LCBiZWNhdXNlIG90aGVyd2lzZQ0KPiA+IHlvdSBoYXZlIHRoaXMga2lu
ZCBvZiBCUyBjaXJjdWxhciBkZXBlbmRlbmN5LiBBbHNvLCBob3cgZG8geW91IEVWRVINCj4gPiBi
dWlsZCBhIGJhcmUgbWV0YWwgRUxGIHRvb2xjaGFpbiB3aXRoIHRoYXQgZGVwZW5kZW5jeSBpbiB0
aGVyZT8pDQoNCkdldHRpbmcgY21ha2UgdG8gYWdyZWUgdG8gYnVpbGQgY29tcGlsZXItcnQgbWln
aHQgYmUgYmV0dGVyIG5vdy4NCg0KDQo+ID4NCj4gPiBOZXh0IHVwIGJ1aWxkX2tlcm5lbF9oZWFk
ZXJzIGhhcyBLQlVJTERfQ0ZMQUdTX0tFUk5FTD0iLW1sb25nLQ0KPiBjYWxscyINCj4gPiB3aGlj
aA0KPiA+IGFnYWluLCBBKSB3aHkgZG9lcyB0aGUgY29tcGlsZXIgbm90IGRvIGJ5IGRlZmF1bHQs
IEIpIGNhbid0IGJlIG5lZWRlZA0KPiA+IGhlcmUgYmVjYXVzZSB5b3UgZG9uJ3QgZXZlbiBoYXZl
IHRvIHNwZWNpZnkgYSBjcm9zcyBjb21waWxlciB3aGVuDQo+ID4gZG9pbmcgaGVhZGVyc19pbnN0
YWxsLiAoSSBqdXN0IGNvbmZpcm1lZCB0aGlzIGJ5IGRpZmZpbmcgaW5zdGFsbHMgd2l0aA0KPiA+
IGFuIHdpdGhvdXQgYSBjcm9zcyBjb21waWxlciBzcGVjaWZpZWQ6IHRoZXkgd2VyZSBpZGVudGlj
YWwuIEkNCj4gPiByZW1lbWJlcmVkIHRoaXMgZnJvbQ0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS90
b3J2YWxkcy9saW51eC9jb21taXQvZTBlMmZhNGI1MTVjIGJ1dCBjaGVja2VkDQo+ID4gYWdhaW4g
dG8gYmUNCj4gPiBzdXJlLikgUHJlc3VtYWJseSB0aGlzIGlzIG1vcmUgInNoYXJlZCB3aXRoIGZ1
bGwga2VybmVsIGJ1aWxkIi4NCg0KLW1sb25nLWNhbGxzIGFyZSBub3QgbmVlZGVkIGZvciBoZWFk
ZXIgaW5zdGFsbC4gIC1tbG9uZy1jYWxscyBhcmUgbmVlZGVkIHdoZW4gYnVpbGRpbmcgdGhlIGtl
cm5lbCBzb3VyY2UuICBJZiB0aGlzIGlzIHJlbW92ZWQgdGhlIGxpbmsgc3RlcCBtYXkgZmFpbCB3
aXRoIGEgcmVsb2NhdGlvbiBvdmVyZmxvdyBkZXBlbmRpbmcgb24gdGhlIHZlcnNpb24gb2YgdGhl
IGtlcm5lbCBzb3VyY2UgeW91IGFyZSBidWlsZGluZy4NCg0KDQo+ID4NCj4gPiBBbmQgdGhlbiBi
dWlsZF9tdXNsLCBjb3ZlcmVkIGFib3ZlIHVuZGVyIHRoZSBoZWFkZXJzIGJ1aWxkOiBsb3RzYQ0K
PiA+IGZsYWdzLCBub3Qgc3VyZSB3aHkuDQo+ID4NCj4gPiA+IC1Ccmlhbg0KPiA+ID4NCj4gPg0K
PiA+IFJvYg0KPiA+DQo+ID4gUC5TLiBJdCB0b29rIG1lIGEgd2hpbGUgdG8gZmlndXJlIG91dCB0
aGF0IGNsYW5nX3J0IGlzIE5PVCBsaWJydC5hLCBJDQo+ID4gdGhpbmsgaXQncyB0aGVpciBsaWJn
Y2M/IEVzcGVjaWFsbHkgY29uZnVzaW5nIHNpbmNlIGxpYnJ0LmEgaGFzDQo+ID4gZXhpc3RlZCBm
b3IgZGVjYWRlcyBhbmQgd2FzIG9uIHNvbGFyaXMgYmVmb3JlIGl0IHdhcyBvbiBsaW51eCwgYW5k
IHRoZQ0KPiA+IE9CVklPVVMgbmFtZSBpcyBsaWJjYyB0aGUgc2FtZSB3YXkgImNjIiBpcyB0aGUg
Z2VuZXJpYyBjb21waWxlciBuYW1lDQo+IGluc3RlYWQgb2YgImdjYyIuDQo+ID4gKEluIGZhY3Qg
dGhhdCB3YXMgdGhlIHBvc2l4IGNvbXBpbGVyIG5hbWUgdW50aWwgdGhleSBkZWNpZGVkIHRvDQo+
ID4gcmVwbGFjZSBpdCB3aXRoICJjOTkiIGFuZCBldmVyeWJvZHkgaWdub3JlZCB0aGVtIHRoZSB3
YXkgdGFyLT5wYXggd2FzDQo+ID4gaWdub3JlZCwgbGFyZ2VseSBiZWNhdXNlIG1ha2UncyAkQ0Mg
ZGVmYXVsdHMgdG8gImNjIiBzbyBpdCBKdXN0IFdvcmtzLA0KPiA+IGFuZCB5ZXMgdGhlIGNyb3Nz
IGNvbXBpbGVyIHNob3VsZCBoYXZlIHRoYXQgbmFtZSBidXQgdGhlIHByZXBhY2thZ2VkDQo+ID4g
Y2xhbmcgdGFyYmFsbCBhYm92ZSBkb2VzIG5vdC4gKnNocnVnKiBJIGZpeCB0aGF0IHVwIHdoZW4g
bWFraW5nIG15DQo+ID4gcHJlZml4IHN5bWxpbmtzLiBUaGUgYW5kcm9pZCBOREsgZ3V5cyBhdCBs
ZWFzdCBoYXZlIHRoZSBleGN1c2Ugb2YNCj4gPiBzaGlwcGluZyBOSU5FIGRpZmZlcmVudCB4ODZf
NjQtbGludXgtYW5kcm9pZCotY2xhbmcgd2l0aCBBUEkgdmVyc2lvbg0KPiA+IG51bWJlcnMgYW5k
IHRodXMgbm90IHdhbnRpbmcgdG8gcGljayBhIGRlZmF1bHQgdG8gc2luZ2xlIG91dCwgc28gbGVh
dmUNCj4gPiBtYWtpbmcgdGhlIC1jYyBsaW5rIGFzIGFuIGV4ZXJjaXNlIGZvciB0aGUgcmVhZGVy
LiBJIGdpdmUgaW5zdHJ1Y3Rpb25zDQo+ID4gZm9yIGRvaW5nIHNvIG9uIHRoZSB0b3lib3ggY3Jv
c3MgY29tcGlsaW5nIHBhZ2UgSSBsaW5rZWQgYWJvdmUuIDopDQo=

