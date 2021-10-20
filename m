Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8E14355FD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:40:29 +0200 (CEST)
Received: from localhost ([::1]:42996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKG4-00081U-4k
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3a-0002FD-0h
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:34 -0400
Received: from mail-eopbgr740135.outbound.protection.outlook.com
 ([40.107.74.135]:53168 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3Y-0006qY-En
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFQcbyrxMbuUmuxNe08O341jUuL4g2oeEsEMavU29zQ2fmOVg5uSFjVKTwuRi/1mi5PPGQnRtuhHfbQw8OllD3ujSI62EEEIVbVLcwNfRXSmpM0uUckqkAoa/lE5dOw1/9NRlUeoHOwlRCzb4z+9Blzh1tIm7ZmX6YNqbEFenVUnRuJsCl4PRAhvoIQv1cI7SrKaC9EKaAn/0tyw4ZMHkp5nYtcoczy+m6Zsrz1O237VwngsshUAKd+9ovnybX8Hf4qypI4L2XYXiygwQyIPqX/mB1fjVgX2fb1VA3DGTLaAw9t/17vuni+N/kfp8wuVRTMNxAVtZF1d+dsy6PLcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gj/khGLRuYTM3HNzGTrrzWzF7jtXSEHtlexmPxw6ZAo=;
 b=ocvJ7sycbDmxaw27x0yTBXiJkPsejenBxMxchyYZ3levxmmeLr58pw4iu4b6vbnW26BnDuCUAKQfn5Xl8KgeqjUpmygKdi3p0F/4Z64mPoTvl/ApqoDqsKuh8ra7YH+Q22MIpeFF5dkfryB97YPaHEa8vUASMZCEOV5hUOBKWp+Nm3IOpH8i0uxP1T4mnnCgNnRN0qIzeKL2aNkY7lot+MYk6azdo4mz5n4P1WzIISo36cbKrqCYOCMtuTtekemiEAlOSEKaAplZyT8uOU/Iq4Mg1dP9+ontq1Pi89XqKWRWdTjAzf719Ni938CRXhuR06NmRTC4CBP1hsz9bQWqyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gj/khGLRuYTM3HNzGTrrzWzF7jtXSEHtlexmPxw6ZAo=;
 b=aon0Vqn5W6cIVlPuL06l7GFo1J5utIlNm+4U96Mph/ncce3rNlVD/dgU5joPC0dcpSqL1QXCbUlZqxRzSUqb+8RjFQdfpzCXNIcvyGlGh7K/N0QjXq1W48aFzegH1WjtdvLa3vLY1hNUedR1jYNDdvMHn6V1YHf9oD4E5UQIT5cFRCLHY03W23xeDMbSIPuBy+ztEQ8Z9libmubUY7fEUnPc6OJNxJeLqUc/7mgFNjcYMKl+GftcaGNiuW8Matvj/Le7bIrWg4NlaMGGElDMIh5P7wmTrECRMkUMhjQYBqoIBsAEuj9utYx+1lpXqd2lZtcMKYsNoBYcb+8kuXk7Jw==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:27:14 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:14 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 07/48] tcg/optimize: Split out copy_propagate
Thread-Topic: [PATCH v2 07/48] tcg/optimize: Split out copy_propagate
Thread-Index: AQHXu7Y1DpPap8p/1kSSQoaodQ9hXavchZVg
Date: Wed, 20 Oct 2021 22:27:14 +0000
Message-ID: <CPXPR80MB5224E18D741BC8181A7BCEE7DABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-8-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-8-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 234cf9f2-bee9-4457-f573-08d99418c47b
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB4482402189B880157ADE0BB2DABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j0CTSxk2U3GyKcuIfb0L5LsZIdtc5GzUxHb315Ii5Ab03KWzpJQrhbE81DhMltUZJ1bR2PosQwEO07IKwj/Fv75kSD4WpO8BEcInnI36NA+42Cs4TOZiLW/t6/kjx84NMbmgCO3Ou3LaBZP5TZcg/33UzpC947TOQ78DN6doz0NuG6cbr0/18KlpI/T+dIY3k+CpC/bJbCGlc0Pzt+4/BPHEeWuSRXIz/YiANc4Ki3ALlHndES4l2wUG1U15wlJdJAcYUv8fHpMZogqqPPxaSLVW/9jcYsJc91VWVlgsogdYPWxiUMtK2a1B3uaf39l6j35+6P5tQS3Z6K/nvPzOG6xlFCYmIuXQGRGz50ofskxznACoig4i9rE0e8eXuD8o+dV6yXsT8TKReYnShmbnOb6JXgGNHkd0KgKY5bAiCUEn4byfTuHW9t4bLP4EiGA3ZioMz/AcYZs+K/kGuGfTCt99aQ4t8Bn61+3j7wUyQ8Bpm6yVKvQWY4BovRnP4eiqsrAvIb1rBdbUzN9nJN6sUwiZN9yWF7mkUIPqbODAHZ4RJdl61U/6p50LCk/r7GvteIfodWYqp4iPpwBmYaMFrcIC6oDnaDbBdswTvmLJt2TxQWzMlOabwY/FEnZ4zU/cQG+ESvyJXpzf+Lxy4CpscI4CSE8UccwVZgt574Ev8FzuBtLNhvJjaXoXMgdyKKw75ewoYC/6ayXm7I0Z36Skoadz2lpaijFVzylXysOrhoaKyMInJNBD8ARANZdMxu+SbrcZWfhV6Np+xAzVzPimdkdXGCtoH+/x0dxIuJSCd/8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(4326008)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnhTNjhIR3FwUjlUeEhjUmMweFhoNXBpUjFYSFpVa0R4bXlrS2tJM2RzZVc2?=
 =?utf-8?B?NEY3dmNCYlF6NDdlQlBseU9JU0piUE5SUVJaVjNWUmdUcUE0MnNHT20yMWw3?=
 =?utf-8?B?V1ZXR1RrazQzVENiMDlGZk9FNmt5NldhZDVVcXI0aXRmK20waStZTld5dllN?=
 =?utf-8?B?NGVoM0FGem04TUlLay96S2laV1M5NEpNQ28zVjlIbjE0LzhsQzRXenE5ZkJx?=
 =?utf-8?B?UnpxQlEwWElQK1EzSDZJdGc2L3IvTFFLTndrMkNZb1dNblBXNmZQRlYyOWVG?=
 =?utf-8?B?Vld3SlAydUFreFUzRkpjTURGeVdRdTJBTkt6TzJaZVZyekdWZGQrelpFRWpi?=
 =?utf-8?B?SmczU0VzQWFOQnJFTklpTUZjd3RLckdKN2tyRzEyamN5L1IxeFJSdzhZQndK?=
 =?utf-8?B?aEZzNVQ3Wjltb3RTeXdTOXk0ZWViVlJ5VnA3UnAvMHhORk9yZnZnTmxxcXk5?=
 =?utf-8?B?UGZBMkhFV2lUY0IzUGdvYjRmZ2JPNE9nMjBidHM4UDJxakNzK1FRVWVxdmpy?=
 =?utf-8?B?WWZlcWZsdVllVVIwWHZsN1RYRDFBbnFKTzdOdWpTaVRrcWp4Tm8reU9mVGtD?=
 =?utf-8?B?M25Tb2crbFlhQ2JhZnh4ck8yRFR3MzdLUXlqL3pONi9ITWJiUVZLemNnWG51?=
 =?utf-8?B?bGhEeHJUKy9oQlp0UkhhWHpaaXg0L0VQZ3hITFdmbmRIS0wvOStLSGxCZjVv?=
 =?utf-8?B?ck1yZ0dYUmgrTm83S3gvVWYrbHRBaE42ZDk0T0RmSGNxUlY2aXNIaGdsSUE1?=
 =?utf-8?B?Y3pwMGMwcW9uT1NGbjVQaVVpRktBS0d4WHhrYWNZRjNQS1RSQW1jOEZ1Q3pv?=
 =?utf-8?B?bEIwSmFneWJ5d2VqNUtNN1BHRFg1VFpxRklHVDUvRkJDUXV2YjNHUUUvQWZF?=
 =?utf-8?B?YVArSVhkWTNza2lpZmdXQmt6cU1IekVHYmtNd1VIdVYzMzRiamdzY2dTSHhh?=
 =?utf-8?B?MWI0cE1mbDlISi9KN1JnZFdwR3J2ZUVYZmVBaHE0aExpS1BmQkhqelJvMGM2?=
 =?utf-8?B?L1RQNU9uYXoyQXJZMmpXaU9lVGV6R1E2TDk2VDBPQ1pQcHBBQXp2YjdGT1pG?=
 =?utf-8?B?SHFod2d2YlZKeC9kMGxIZEFBNkwzOFBON0Q3Y05HWlUyRzZNaDZlYlFRU1RR?=
 =?utf-8?B?R1laSGdVMUtBL0hwZDQ2NU9DV0dvbGxYeDhITUY0WXBYV01oUmVzSlVvNlRm?=
 =?utf-8?B?TTRUOWErZW84QTA1eVMwdXdpQVlRT0ZMaXVsZ2xxQ1c5Sm5Sa0FndENrM0tD?=
 =?utf-8?B?VkltbUVWL2RCOHo1WUU2UURvWWs2WC96dnJIZHVtaEZUeWpDZktYSW5XMkpw?=
 =?utf-8?B?MlpHdVM5bXBibDZ3SEpHaksrazhpOVl5VUhCOStrZm9hSm1mNDN0azA5N2tn?=
 =?utf-8?B?MExQQ1RESlF5MkR2WU1ranpkVmNJMEVSUGpmLzRMVm5rZVZ6dGc4RUNHdk8w?=
 =?utf-8?B?cVhhVjJPaXFVT2RjalhPN29UTnk1T2N0emZ2U2tKT0FGT0pWRGgvdHZTTFpr?=
 =?utf-8?B?THVYSzJ2QXFPcGVDUW9MM0hRK09QT3AveEUwQU9IKzM4aVg2aVlqN2NhVloy?=
 =?utf-8?B?cWZuLzlXbnpzUEdZb0JDRXp1UnMzb3NKK1plSFpyUXFCUUIwVVVZandRTnZx?=
 =?utf-8?B?MUllRmlyNTdoZHJSaWwvWjJzWCsxbnd3VndPREh6ZWh6N1BYM21aemJGQ0hX?=
 =?utf-8?B?RHVDNFI0S2oxSW1pVk5RSkc4TXdRcDlpeGZ2QmJHVHZRNFNmS0c3S3J5Y1JN?=
 =?utf-8?Q?n+ecwvbYiDBNXC+gvzuD8AuMK1xSIdNK10vWlFX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234cf9f2-bee9-4457-f573-08d99418c47b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:14.4790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.135;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IENvbnRpbnVlIHNwbGl0dGluZyB0Y2dfb3B0aW1pemUuDQo+IA0KPiBSZXZpZXdlZC1ieTogUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4NCj4gU2lnbmVkLW9mZi1ieTog
UmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IC0tLQ0K
PiAgdGNnL29wdGltaXplLmMgfCAyMiArKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQtYnk6
IEx1aXMgUGlyZXMgPGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0KDQotLQ0KTHVpcyBQaXJl
cw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFp
bWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

