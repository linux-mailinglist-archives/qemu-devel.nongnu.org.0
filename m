Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C260A3991A8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:28:45 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loUfc-0001vK-9f
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1loUcs-0000aX-6g; Wed, 02 Jun 2021 13:25:54 -0400
Received: from mail-sn1anam02on2108.outbound.protection.outlook.com
 ([40.107.96.108]:37446 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1loUco-0002Kb-6f; Wed, 02 Jun 2021 13:25:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmNa6bTNY0IuPnhdwtm1f9mLVP5643W0ADR+3mvA+Bc0fbvyCi7IsMy2a4nFjZw33IhV2WCWYRIeeFBY7f0k4tUNWogvY78+CQToS6x5xujksi6hoK3mIo8DcYHHLQeDCPzmIepiU1hgGfOdjplS0YbAgAZc6nwBk5NPkdlG2X7/Dpd4mLjVMuCOrCu2WpU4UkusRLyQ5lnSMYNzyAJK3LOEH1rO30cEsM06FCF7bAYy35mZezO5zaXP0ec+zj4oWQEMw/gwYzh4Zo0NYhZbF7ny1Cj5io/A2tVCEKvH0wECPlugJ1utrKkchVzowHB7Bu/ntxV6lE8rx9t7FL57bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUPl2k5omDP+RI337j/aTnHUgm0DjEQa59lihXTZk2k=;
 b=c049eRpQWN3tA1gOT1idxO2S/Hjch5kGMul1ms2I2+j6B/HpV6X1jg5iVirnMOe/mly6U+Y6qKxuJvcTPL57Sno+SmWL3y0Efs6gYUeuUR44Ixhqxkg/9gWQh4R8JVmBn6WKYQuPL40JX90Hjh4TXym6v2W4CyR3kXYygTuhTO+RVjnAwVjqy3fFdYVhJJ1yyxpmZwdb/cItWUkFbRj1jB+St9llRUhU9N4/xpgIz5dPshoyWX3x0F3CR30+JpCKB6XEIulK+xWdrgoy0NpIZiuHyokYZStWVMDqQjQgK6doI9sG0AnVLmtZRLfBJI/Z53Q3UKkxCWJ88s8IljKKGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUPl2k5omDP+RI337j/aTnHUgm0DjEQa59lihXTZk2k=;
 b=cifcJ8t0bC/9xiyQwCPi34xKH+YzMGrj9tCei8muF6VHsft2BCyX06WC+C9ZdZO/ECp62IGt8yvgoABDmKIBJtEh6NjsEqdEGWj5GAHkf7N8HwECKZJ6Qn7Pr+g05QnjPkEvPO0Uwp4D1pr6nC2dGCdedfOPesPKu07F71HAGRo/XBCgI6Od3ajr9IZXUQefNptNMix7bmpgX07/0pyu1HVV+SS99DIkMXVAAFZGtpwa5E0Ss9S5IW/2MMSrJknFNWPiFNbcRwiV2D/zY/idSXFF4ZQICojzEqgBMwyZ39FAtlo2mKXX4Chtx27BmgMgm9h6g5teIJmk+t8JyZongA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CPXPR80MB5191.lamprd80.prod.outlook.com (2603:10d6:103:12::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Wed, 2 Jun
 2021 17:25:45 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 17:25:45 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/3] misc: Fix "havn't" typo
Thread-Topic: [PATCH 1/3] misc: Fix "havn't" typo
Thread-Index: AQHXV9Hxg9eED5lYnEqHtMD1uCYXiKsA+CZw
Date: Wed, 2 Jun 2021 17:25:45 +0000
Message-ID: <CP2PR80MB3668A422060CEA5B25ABE451DA3D9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210602170759.2500248-1-f4bug@amsat.org>
 <20210602170759.2500248-2-f4bug@amsat.org>
In-Reply-To: <20210602170759.2500248-2-f4bug@amsat.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [177.9.76.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1bb851f-c382-4881-9c4b-08d925eb74ee
x-ms-traffictypediagnostic: CPXPR80MB5191:
x-microsoft-antispam-prvs: <CPXPR80MB5191ECC739C1850FF26697EEDA3D9@CPXPR80MB5191.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tC5xKu6IjA2jQaaQRdH7JnWm3RLUqga7Rb6Ix7aelIF+f+I39Q8uLl1KUNryU/SUEu+e/rJFhdYrSAI7zKUBUxNFf/EkdQH5Lq8tsgdl7eVXtO4oC3M8jGbCGuvJjITu+RcbLmDSkeMEP4k/mr1ulv2kkOMNOB/pfJq/nrakGDBnBnaNLqqLpISV2x6D+lFZvRcBIVnBmhSXnuARnYxoq+5jxL453BU/NdqLSxA7x9B3xagkhJdXI7Flk4saVarSX3uEEIVvg0SHQpkv+AKO1Y6MgD8nvT2SU75oPNdYiL3AQqX76trZktbkq4UdhJBpRPGj5Tc1jtWB53y1hofu0QVuqtk6KiLygDGxCf5+7+3MaPUVDBo5glow/Mq8VJEIxNgVRBMmm5+O30WyHm3th1iIhdhkIk7wBbSRj74D3eFDrFFxLSC0wjZx+msJeqrJJ8yfhApsj+WWNeiM9MMMUTPwKkS2DPvKK54ZjkiA4//H2nbocIMg+M9RUrp687k1F4QJqUB1HD6Jsr5tdnY7915xcKKkMGEdHJBumrZd8CKk+kLVVSvuaJLstVXRmh4mU1GlDlod1z3sPTcpjgMEgU1fKx3LVNyV8+C7ZCzqGeaewWjlP06BSuIPbPKvaEEJnY6NDfe2S4n9NW4bwZv7mUg8aRrqVzR2jDul3Yn2h4eG+kkDTkT6RFcjM0ZvtvYQYZMSzzClLPG1YlyijNYKW09oDC7WuyT3UV3iIf2rRqo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(396003)(366004)(39840400004)(346002)(186003)(7696005)(316002)(4326008)(6506007)(86362001)(7416002)(26005)(33656002)(8936002)(8676002)(110136005)(54906003)(83380400001)(478600001)(52536014)(55016002)(9686003)(5660300002)(122000001)(38100700002)(66476007)(64756008)(2906002)(66946007)(71200400001)(66556008)(66446008)(4744005)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?V3BCV2NCNW9JUDgzTVdmeXFremhGN3ozcXFtbklQaS9yeDh3QzJKVDU2TitY?=
 =?utf-8?B?QkZjY3lDRTlOVWJxSDlZSHhUSHZySlZvQXVrOVEraTI1ZW9LdFF5UmREdGwy?=
 =?utf-8?B?RmdwcTFJYkNuRmowWXd3Tmd2ZHY1cmttek5Jckd5YzhpWFVxa3ZYdFZJNXFM?=
 =?utf-8?B?TFFzM1FmcjdtT1FqbnE4QzVGT3N4RkNjQk51WGhERFFIVnJjeko4eHphU1N2?=
 =?utf-8?B?UlM5eEw5ZlhrUDc4R0NzYStGV3p5STdBY0kxcXBoMnhZblNHM2dSbVFzZ3NT?=
 =?utf-8?B?SS9xRFI0OGZMZWVYbnU5SVUwRVFaTm9ZUkJsbklJbnFCYW9uNWgzb2NjdXRw?=
 =?utf-8?B?NDJ0THRlOG1Db2F2WjJma3ZCSU5iRGdjNnNpYnU2MGhKOGFpbmxGNTBSVita?=
 =?utf-8?B?R3kxMkZ4OXBDZnd1NXJaUUlwS2ZFVDdLSnpLeUQ1REpMaEdLdGY5YTVFWFV3?=
 =?utf-8?B?TjBCakdNb0VicEs2c3c1aWg5RkdQbEhiamVtcXdyOVBZbk04R3lrYmQvN2tH?=
 =?utf-8?B?MUV4dnd1S1BnMWM3dzJWMHlMWUxRSXRpZFVTb1d5a3VCN2ZKTFZSb3hiUENj?=
 =?utf-8?B?a1NzWk91V3pEeEI5dXhBSEk5SWNORyswbXFhMFRqY1FERlZNV2kzRzVlQmpK?=
 =?utf-8?B?UUFZcC9mUTlYcW9VbDZsTFM1TFI3L2MrZjFZcUdhVmN6eFArc0FuRUZxQko1?=
 =?utf-8?B?V3ZSbFFJSDN1d3NOdS9ya0dHWjM3MjNURklrMWd3ak9WVW9hOU9GM0pVMjNq?=
 =?utf-8?B?T2s1bllsNnVtMGxuc2R1QndTWml3K0Q0MWpwSlRrNVZ2clBxWVpJWXlIYTNQ?=
 =?utf-8?B?WmhJVGxSWjZTOFUvU0pXMktweC9SaUpScjdNUGg5SFVwVFZEQ2lPMDQ2dUR1?=
 =?utf-8?B?Y09GVGNwWkpleEllR3A3SklDZFpxeWZ6VkQ0Nm9seW9MWUlGRXlFdGVZcVZz?=
 =?utf-8?B?OFBIYzlFODBrd3YrVUdjL2t4VHRmeDR0Q3lnTVl2NzI2ckx6S2FNanpESFh4?=
 =?utf-8?B?UURJRHRZVktNbTFsbk5GRjA1dURMalNIOWxaYWN4ZE5LL2hoY1ZvQVhSNzhu?=
 =?utf-8?B?NmVFV3Y4OGRLZWJMWWZiTFc4eGxwUGNQNCtwUlZFanJtL3hJdWxocGVZbDJY?=
 =?utf-8?B?eTlwdDBSTWVUUnp2bVdDTDJZYVpQeGFkelBVdnhrZ3ZFOWxITURWVGJWZklS?=
 =?utf-8?B?cUtWWG82a0Q0R1dXTHZyRzc0emtmelZUdFRmVC84TlBlVG9tM3lqYklRaXV5?=
 =?utf-8?B?cGkwdUQ4THZBZ1BiZjcraGxibXJ3ZkFOVXAzWVZqalpLNHp6aVFIZFFlcnQr?=
 =?utf-8?B?T1RWTzJxL01MM3ZqWGdEdXhaVmlUbURubjdyUGw2R1dNN1NObWhhL0J2cmFI?=
 =?utf-8?B?UkdYaGtpSVBpa3pwRTkvNTZQUHd5RkJKYm1OM2dRMWlYTi8vUTBJaWh0MVNT?=
 =?utf-8?B?MUhGZXFRb0MzMkxGK2FuRGRUWHZ3MHdMZWs2UFM1MXY3T0hPRzVoM3Y3UCth?=
 =?utf-8?B?b2V2ck9xR1RsTENBTjNOL2l2NWQ5MXQxMjRLMGxEakxoNU0wYjc1TW9VN3Zl?=
 =?utf-8?B?T2R5UnBtcGJLNzc1S2hjbkZ2Q1dnaXFZdG9xclFsUExDMENxZ2Q1Nzlha0pL?=
 =?utf-8?B?Vzc1d1gyTmlLNXJaejhvOXpSdStaeHNmTnN1TU4vUlRzZGs3OXhxZUNqUUlU?=
 =?utf-8?B?dENJNzNRSmROOGJUWVErRU1FdjRvNU5aS1pBQTBvNEw1dEtiODN6cDRlMHh1?=
 =?utf-8?Q?ZWyyo2rHAE4YtlviPk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bb851f-c382-4881-9c4b-08d925eb74ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 17:25:45.8073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C3lGnlqcl4JO8Ju/RCs3gyLFhaLCcABdHnXOZ6TGOyKeoOa5f3wg+ntQytYLdVQGVDu4L4fXDCt74Yowhc0n2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5191
Received-SPF: pass client-ip=40.107.96.108;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, "open
 list:S390 general arch..." <qemu-s390x@nongnu.org>, "open list:ARM TCG
 target" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gRml4IGhhdm4ndCAtPiBoYXZlbid0IHR5
cG8uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdA
YW1zYXQub3JnPg0KPiAtLS0NCj4gIGh3L3VzYi9kZXNjLW1zb3MuYyAgICAgICAgIHwgMiArLQ0K
PiAgdGFyZ2V0L3MzOTB4L3RyYW5zbGF0ZS5jICAgfCA2ICsrKystLQ0KPiAgdGNnL3RjZy1vcC5j
ICAgICAgICAgICAgICAgfCAyICstDQo+ICB0Y2cvYXJtL3RjZy10YXJnZXQuYy5pbmMgICB8IDYg
KysrKy0tDQo+ICB0Y2cvc3BhcmMvdGNnLXRhcmdldC5jLmluYyB8IDYgKysrKy0tDQo+ICA1IGZp
bGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IC0gICAgLyog
VmFsaWRhdGUgdGhhdCB0aGUgImNvbXByZXNzZWQiIGVuY29kaW5nIHdlIHNlbGVjdGVkIGFib3Zl
IGlzIHZhbGlkLg0KPiAtICAgICAgIEkuZS4gd2UgaGF2bid0IG1ha2UgdHdvIGRpZmZlcmVudCBv
cmlnaW5hbCBmaWVsZHMgb3ZlcmxhcC4gICovDQo+ICsgICAgLyoNCj4gKyAgICAgKiBWYWxpZGF0
ZSB0aGF0IHRoZSAiY29tcHJlc3NlZCIgZW5jb2Rpbmcgd2Ugc2VsZWN0ZWQgYWJvdmUgaXMgdmFs
aWQuDQo+ICsgICAgICogSS5lLiB3ZSBoYXZlbid0IG1ha2UgdHdvIGRpZmZlcmVudCBvcmlnaW5h
bCBmaWVsZHMgb3ZlcmxhcC4NCj4gKyAgICAgKi8NCg0KaGF2ZW4ndCBtYWtlIC0+IGhhdmVuJ3Qg
bWFkZT8NCg0KT3RoZXIgdGhhbiB0aGF0LA0KDQpSZXZpZXdlZC1ieTogTHVpcyBQaXJlcyA8bHVp
cy5waXJlc0BlbGRvcmFkby5vcmcuYnI+DQoNCi0tDQpMdWlzIFBpcmVzDQpJbnN0aXR1dG8gZGUg
UGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3
LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

