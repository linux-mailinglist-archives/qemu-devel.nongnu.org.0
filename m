Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81BC33A219
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 01:43:30 +0100 (CET)
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLEqv-0008SJ-F3
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 19:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLEoc-00079D-9u
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 19:41:06 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:53689)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLEoY-0004nj-IL
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 19:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615682462; x=1647218462;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FLSuy34y8sjIJBHRjFkf3AmrG+s2SwimRfp6w9ztUBg=;
 b=kOFb6AP7yMlTjbX+zxBCs1ZSvP+SANEeB89DF60E1YA9M6y0SN02no0W
 IxkKtVhouoyQit/L422Sj2tBx1n+6hKCsCAKPOgOkfF+BbOpZIMvL03dn
 pMLpl72G0rAexdDQEeebeTqqFHPVnm3tcfNTt6wYthOml4LII4+2BIWg3 Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Mar 2021 16:41:00 -0800
X-QCInternal: smtphost
Received: from nasanexm03h.na.qualcomm.com ([10.85.0.50])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 13 Mar 2021 16:41:00 -0800
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 nasanexm03h.na.qualcomm.com (10.85.0.50) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Mar 2021 16:41:00 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sat, 13 Mar 2021 16:41:00 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4263.namprd02.prod.outlook.com (2603:10b6:a03:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 00:40:58 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 00:40:58 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 29/35] Hexagon (target/hexagon) translation
Thread-Topic: [PATCH v8 29/35] Hexagon (target/hexagon) translation
Thread-Index: AQHW/d3GDdLGZmOd1UesCq0DZKzEA6pYcSAAgCbAjEA=
Date: Sun, 14 Mar 2021 00:40:58 +0000
Message-ID: <BYAPR02MB4886C193F014511DDCCDC7EADE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-30-git-send-email-tsimpson@quicinc.com>
 <152e99c9-675a-1fc8-c44c-e80d5af8ce70@linaro.org>
In-Reply-To: <152e99c9-675a-1fc8-c44c-e80d5af8ce70@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0ae7556-990b-4d3e-c80a-08d8e681d5d6
x-ms-traffictypediagnostic: BYAPR02MB4263:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB426386C847087D1C06FDF2ACDE6D9@BYAPR02MB4263.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7sCgzZiACJrkVoy1akckbQ49pMQhWkjOQ/PAPyxaSDy0bDiYoEjPc66zomSV3Uw2YA1eWAJMb/3LdT1mv3d978Iv36tQd0wRqs+4QDiDQxvkN/I29LhuCCKLuLey/94FoJlk65qtsXBMMjjOJ6l7LpaminA7+ZFbW6pZhDVjRiIdc6TaCgbfzLm9MqBYAUu27w6hFEXAXXz8rCUK9RX8A2mSw92XC8AfCa+NmF6bVVqAmWRfj65apt6x265LizXrEXRxhyFyscstM2Rt/Qsk3aZalHwZ2yGoGWnFlQdvuV2toxICnggRa1CzGCy32/BZGytvCt4z4YQ64wdIHx5auw6XAKj9Kn5v1Dk5Pf82GF3ZkVXKLZFIiGAyajOv+zsjyjNWl4gvuxQnWvOFgJBRuQC7jzrjqE/ITdKLkGslVrahNSAjWzhL/OoCHFgf3O4sB5deVzdCDdy3LegUMI7KS2oTj3WXBsA1tTEY+emJtUGufUWfY2CZCOqOacH7ed7PpHvqCTTLXw9qa1JhCKVZZtq6peUBLhbsEW4L1hsBBNwZ9fsY3VwtGapSUD8IPtwv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(396003)(376002)(136003)(76116006)(52536014)(55016002)(4326008)(64756008)(66476007)(478600001)(9686003)(66946007)(66446008)(8676002)(316002)(8936002)(66556008)(54906003)(26005)(83380400001)(71200400001)(5660300002)(86362001)(6506007)(53546011)(7696005)(33656002)(186003)(110136005)(2906002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VEJudXBrenJ2bnlFTGtaV01kZS9yc3d5a05Sa2NkRng5SXJUQS9lSXpFV05Q?=
 =?utf-8?B?akg3Y2o0eW16b2lydHRWWG9wckZYbGUzdjJDNytzT3dObXFjT2p1WEd6OFZl?=
 =?utf-8?B?ZWkrR1dBRVU5ZjBwa3pMcXlseHdkUEJhRDlQY2pLTnlESWQ1RDJOY1VLcDhO?=
 =?utf-8?B?ZDFycTdadW5WQ2VLczJzNWhBb2N5eEJCbGkvNmZZWTA2OGM2SzRTenFYYXU1?=
 =?utf-8?B?WGpCMjFMN2s1Rk9ZWisxeHRJbGhKWU5TSXQ5dW5TM0R5TTJJWXBnWWVOaTJq?=
 =?utf-8?B?MXhHTVRheEFiK29ZRXA1aTF6TnFQU2lFUVY4QTdweENjUWJ4bUpiK2xaQ2ZG?=
 =?utf-8?B?dnlKUThldC9QUEhBaG1qZ0pDK2F0di9NLzFoRlE2KzZVRlpheW0xL2hJcGdh?=
 =?utf-8?B?VS9qN2xhVWdJbTRITzc3T1I3L1QySW0zcjQzRUVIeEFiZVBLUzBjYnJIOGZC?=
 =?utf-8?B?TGpaUFcyUTNZT1V4Z1U0aHBxL3NjSHZ3WERoOHRlQ1BTaENEY0pBN1VSaTR6?=
 =?utf-8?B?OUt2Zm1LQUZSS1NmRGo2cVRsTHNEK2VOSDd5SXJFbGVEQzh2eTlNOGZZMC9k?=
 =?utf-8?B?MmJxbGQ3b0dYTTgzSkZ2WXRSR3ovUVFMUklOVDA2STl3em9WNkJBenJQcEhX?=
 =?utf-8?B?WTE0Zkl6U0ZYSDM3M0VKLy9NMGJ1OHkxRlkrUzhEU2EwSzFZUTRLMWVDY3Ux?=
 =?utf-8?B?bzE5aVFlTVJXb2VGQm1FRGRpSFFSTVkxRkxkWDYrZkdITTBJVVlxQ1BnV2lt?=
 =?utf-8?B?WkdzTFN6OE5GTk5tSDZzY0xuemhDZktMUGc1SVQrdzdTcDF4NHk0S0RBdzRO?=
 =?utf-8?B?RE52MTFIS1hEcG9CcG03TzVpZGtWaFJicnBWNlZOT1hHbFJqeHM4YU1MdkxZ?=
 =?utf-8?B?MGJORlBiVDlqY2oxM2pyczlWTmFteGN2VXJBUlQ1Q2R3THljNjZ2d1lJaFlC?=
 =?utf-8?B?QVpYeUhWQktYNTdNRitLcS9QcFZDWnp5YmVOZ3RIcmJnWlRpeHJNY2FCQ0dV?=
 =?utf-8?B?VnJCSFlRT3p6dCtSN0I1cVdudndhZmFpU3JlOHZBL1ZZU2x1N21nandPR0V3?=
 =?utf-8?B?V3VmMGJmNW83cTZ4N1pTZjN1a2U3SkQ5cTlaTFBlR2RVdi9CeWZieVRNMDBp?=
 =?utf-8?B?SGNrUGNZejFNL05EYUhWTVE3cE9NQkJZemNEcWliS3hpYVdaRTAreEJzMEU4?=
 =?utf-8?B?bDBGSWk2cTJONCtwNyt4VXhwRkFYZGpYZEQ3OWZaYUVmTUY2V01wUnhWY3dn?=
 =?utf-8?B?T1RaRVl0VVJocmtQTjdseHp1Yk40VTdHWWpHRDhrVW1hZE5zZ2lHZzZVY0dV?=
 =?utf-8?B?VHJoVVUxWWROa2kzcUpJSzY0ZnljMnFmTlJNUWN1RFJCdHJGa1pscU11azJT?=
 =?utf-8?B?TFBHaUd1eWdiMnRxQUROUTlwaVpGN0tEWFpObHFPbzdWWkU0enBybDR6aVRD?=
 =?utf-8?B?ZzNSY3RjTHBvd0wxOVhpZGgxQUNnMFFmcm91U0F4YzdXb2V2bGRBQ2kzTWc5?=
 =?utf-8?B?eWUzL2xZa2pWNm1HckhhMUNZdHRVT3JWcUdENEc2YnhOUVdXcEJwWHpGTkhL?=
 =?utf-8?B?b2RULzlLNlpiOFVSQ082TmdJdkxybVNRY2hnY0pMckU0V0Q3Y1RNYXFPd09t?=
 =?utf-8?B?RkF4anVpRE9icXd0bEN2VG5tajMvdTYzYndpVWRKRjZzQVNoR2JxOXl5K09H?=
 =?utf-8?B?azErZW5HcmF3bGYwSEhOVWJ1b1VUWGZmNXRDUno3b0ZPMnhxZy9qSWRad2dD?=
 =?utf-8?Q?KIiYF6POoRnfBjSiCWIMMxamLzcSjd2UKqecwOh?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNWTy2UduDoaldLbZgKgWMskiVZG6IxbZ5pDVytdhq2x/VC8TrG6nu6dwU+o8bKnJGdolumu5lgyUevjbwhXGvXxx9J1Ejhs0e9W666DDWwji80CwrqrfvFN66fFZdHv58anu2LCIjTEjaxteNVJF/n1Fi8tezX3hkPGz8iB4ZbTDzGOOU9Z/Zciz8c/bwn2TaZwRmkoRGS76bpmYgYwpHpabsJw13SALqWp3VGBjKR+gwEnqwi50DsXZND9y50raBRMXIjFISxh39oUHqz2dc5kdvZIeJ6GgtYBpHSJwIsL3p7dg5ZfSDD1Dip+IEu+aihFsNLnDAjdAOCLXmbWMw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8plvwHMbKbHTReH8/OVG8OI/ztUB6JiBoRjSeh9tsgQ=;
 b=JaKAJB8fJhB07VqF3FRApnzdlpWVmj0ic66+ClF+2mKZHwZ5hEVNexFi+bdPn7Z40K/tv/khkYP1DFJRPvDcGorGGa5QJM8qjml0mcB5ekSY6Tvm+ElaTITlbCc+fVTDv3BOfRwjMpQDTvI6CHhFtih3T9SiCl2LYClnORucLaxvqoWpiNqezu4jPYPqKR3UGzC2XODibl20800MhuuBcOCgO1KNQwT2UCkFZVjY4ssL7pdrAK60RlWRrLcrPjuf4Zs3LK7lkLjeaWvuCFmF1BXFHC6KQjjpCBvV2Kx6mknILSI4DEiLtviRPqDNpgTijwE1TxC7hyxgWrK7nvTuVw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: e0ae7556-990b-4d3e-c80a-08d8e681d5d6
x-ms-exchange-crosstenant-originalarrivaltime: 14 Mar 2021 00:40:58.3179 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: waz2tNDrIjPOp++za8KDsOFDVRZGg8zA0XR1kGWbwAc83c3CHxe8bUkdsY+Vb4hwjU9rJTM1SweAxyyCbbz5pg==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4263
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgRmVicnVh
cnkgMTQsIDIwMjEgNzowNCBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+IGFsZUByZXYubmc7
IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4
IDI5LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgdHJhbnNsYXRpb24NCj4NCj4gT24gMi83
LzIxIDk6NDYgUE0sIFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+ICtzdGF0aWMgaW5saW5lIHZv
aWQgY3R4X2xvZ19yZWdfd3JpdGUoRGlzYXNDb250ZXh0ICpjdHgsIGludCBybnVtKQ0KPg0KPiBE
cm9wIHRoZSBpbmxpbmUgbWFya3VwIHRocm91Z2hvdXQuDQoNCkkgY2FuIGdvIHRocm91Z2ggdGhl
IGNvZGUgYW5kIHJlbW92ZSB1bm5lY2Vzc2FyeSBpbmxpbmUncy4gIEhvd2V2ZXIsIHRoZXNlIHBh
cnRpY3VsYXIgaW5saW5lJ3MgYXJlIG5lZWRlZCBiZWNhdXNlIHRoaXMgaXMgYSBoZWFkZXIgZmls
ZS4gIElmIHdlIHJlbW92ZSB0aGUgaW5saW5lIGFuZCB0aGUgaGVhZGVyIGdldHMgaW5jbHVkZWQg
aW4gYSAuYyBmaWxlIHRoYXQgZG9lc24ndCB1c2UgdGhlIGZ1bmN0aW9uLCB3ZSBnZXQgYSAiZGVm
aW5lZCBidXQgbm90IHVzZWQiIGVycm9yLiAgQWxzbywgd2UgbmVlZCB0byBrZWVwIHRoZSBpbmxp
bmUncyBpbiBnZW5wdHIuYyB0byBhdm9pZCB0aGUgc2FtZSBlcnJvciB3aGVuIHdlIHN3aXRjaCBh
biBpbnN0cnVjdGlvbiBiZXR3ZWVuIHRoZSBmR0VOX1RDRyBhbmQgaGVscGVyIGltcGxlbWVudGF0
aW9ucyAoYW5kIHRoZSBpZGVmLXBhcnNlciBpbiB0aGUgZnV0dXJlKS4gIEFsc28sIHRoZXJlIGlz
IG9uZSBmdW5jdGlvbiB0aGF0IG5lZWRzIHRvIGJlIGlubGluZSBmb3IgcGVyZm9ybWFuY2UgcmVh
c29ucy4gIEknbGwgYWRkIGEgY29tbWVudCBmb3IgdGhhdCBvbmUuDQoNCj4gPiArICAgICAgICB3
b3Jkc1tud29yZHNdID0gY3B1X2xkbF9jb2RlKGVudiwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjdHgtPmJhc2UucGNfbmV4dCArIG53b3JkcyAqIHNpemVvZih1aW50MzJf
dCkpOw0KPg0KPiB0cmFuc2xhdGVfbGRsLCBzbyB0aGF0IGEgcGx1Z2luIGhhcyBhY2Nlc3MgdG8g
dGhlIHBhY2tldCBkYXRhLiAgKE5vdGUgdGhhdA0KPiBwa3RfY3Jvc3Nlc19wYWdlIGlzIGZpbmUs
IGJlY2F1c2UgdGhhdCdzIHJlYWQtYWhlYWQsIG5vdCByZWFkcyBmb3IgdGhlDQo+IGN1cnJlbnQN
Cj4gcGFja2V0LikNCg0KT0sNCg0KPg0KPiBGb2xkIHRoaXMgdG8gYSBzaW1wbGUgZnVuY3Rpb24g
Y2FsbDoNCj4NCj4gc3RhdGljIHZvaWQgZ2VuX2NoZWNrX3N0b3JlX3dpZHRoKC4uLikNCj4gew0K
PiAgICAgaWYgKEhFWF9ERUJVRykgew0KPiAgICAgICAgLi4uLg0KPiAgICAgfQ0KPiB9DQoNCk9L
DQoNCj4gPiArI2lmIEhFWF9ERUJVRw0KPiA+ICsgICAgICAgIC8qIFdoZW4gZGVidWdnaW5nLCBv
bmx5IHB1dCBvbmUgcGFja2V0IHBlciBUQiAqLw0KPiA+ICsgICAgICAgIGN0eC0+YmFzZS5pc19q
bXAgPSBESVNBU19UT09fTUFOWTsNCj4gPiArI2VuZGlmDQo+DQo+IFdoeT8gIFlvdSBjYW4gYWx3
YXlzIGFkZCAtc2luZ2xlc3RlcCB0byB0aGUgY29tbWFuZC1saW5lLg0KDQpPSw0KDQo+ID4gKyAg
ICBjYXNlIERJU0FTX05PUkVUVVJOOg0KPiA+ICsgICAgICAgIGdlbl9leGVjX2NvdW50ZXJzKGN0
eCk7DQo+ID4gKyAgICAgICAgdGNnX2dlbl9tb3ZfdGwoaGV4X2dwcltIRVhfUkVHX1BDXSwgaGV4
X25leHRfUEMpOw0KPiA+ICsgICAgICAgIGlmIChjdHgtPmJhc2Uuc2luZ2xlc3RlcF9lbmFibGVk
KSB7DQo+ID4gKyAgICAgICAgICAgIGdlbl9leGNlcHRpb25fZGVidWcoKTsNCj4gPiArICAgICAg
ICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICB0Y2dfZ2VuX2V4aXRfdGIoTlVMTCwgMCk7DQo+
ID4gKyAgICAgICAgfQ0KPg0KPiBESVNBU19OT1JFVFVSTiBzYXlzIHRoYXQgd2UgaGF2ZSAqYWxy
ZWFkeSogZXhpdGVkIHRoZSBUQi4gIE5vbmUgb2YgdGhlDQo+IGNvZGUgeW91DQo+IGVtaXQgaGVy
ZSB3aWxsIGJlIHJlYWNoYWJsZS4NCg0KSXNuJ3QgdGhpcyBjYWxsZWQgYmVmb3JlIHRoZSBUQiBl
bmRzPyAgSGVyZSdzIHRoZSBjb2RlIGluIHRyYW5zbGF0b3IuYw0KICAgIC8qIEVtaXQgY29kZSB0
byBleGl0IHRoZSBUQiwgYXMgaW5kaWNhdGVkIGJ5IGRiLT5pc19qbXAuICAqLw0KICAgIG9wcy0+
dGJfc3RvcChkYiwgY3B1KTsNCiAgICBnZW5fdGJfZW5kKGRiLT50YiwgZGItPm51bV9pbnNucyAt
IGJwX2luc24pOw0KDQoNClRoYW5rcywNClRheWxvcg0K

