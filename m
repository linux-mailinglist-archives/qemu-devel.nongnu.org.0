Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184C02F87C2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:40:35 +0100 (CET)
Received: from localhost ([::1]:50282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Wpd-0006es-H2
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0Wna-0005j3-4E
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:38:26 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:40106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0WnW-0007Vg-69
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:38:25 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 51CBAC03CB;
 Fri, 15 Jan 2021 21:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610746699; bh=MbHmtCDszqs5W9HQILHMv0m1kG+rkLAUniyBRDkJsZs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RzkPeDhwjZQHDZOar1Hcnz/hqtGrS7mPIbthC3d4v//R3imvaK7jLbHl+HsH7P8si
 RL3EJMfHv459zE/YDK47SxoeC2cF8l1aUqT8G2O0baOk2+xAS/YmhYkLwpM5Rhx7R/
 UxsP1rkyknIViT83AxvV8tvmCvtY24uxkCXcT4w5Hh8lFQlI81wDIeONgNBICHJj7a
 PbrzJWwKoQLuax2MvMnHDROUk4s2PHZJjBAUUsxcuYe3Rl92kX6zixfh+KzPdbNdrG
 EevB1d/wmvsmoCTvSRf+RsNFzL2+w99bwHvWsUApFlcP3m4LfEuYqY/5Q0ka5wZugt
 6kFTyqJoId+Dg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 80183A006F;
 Fri, 15 Jan 2021 21:38:17 +0000 (UTC)
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2059.outbound.protection.outlook.com [104.47.46.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A46484004A;
 Fri, 15 Jan 2021 21:38:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="mvdg3Qxs";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzZ3v959/TXRat3G3Ydxax1bWy9f8JWltFlQTjSifgOqyRhhe+1FxkzdvNw/tHK4tB0DZuXDfmfoOlBsMFEZNBGpN0qX4kpGBywDy3sl0WM2bG2YOqZIIZe61uNgQsZjj7HS8U7WO4HzP8gj9nWkoFXUceMxvNFKBJZurReFbjw0YWxWBJWg3RnwevzYsW5kTXbelG5oqpKBmjHccVPSv8Wmj6BLaAIOctz8daSP9CFv6691xONB3ySb8TypwexB+ktewrpbYDkRLf8lfXSbk7/J/ONPrTMt8AszBqTJIBI+lJrKFyPAEycObMFf3zox5FZ6mfYcxSoVnxq7EOYvRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbHmtCDszqs5W9HQILHMv0m1kG+rkLAUniyBRDkJsZs=;
 b=l+GugoPJuc7OlZ9wIZ7WS7rQEP19Quh/x8ER28yLIkXEmAQAn3OCd/+7NSGYKaa1two7sz3+z/o2lmmKGDdWBmN4xMb1w9t64ADCmDPVkrM9iddXZEEro1SLcu2ugT640ka5UgfRk6JE6YsapcMdv6OinUm+3fLVfc11zvxTktUwwb8izm3u+pVvKMKpWRExTsOVTDNopfMoHNoPOPTvgI+FyZSHzWgF0L3T4MMIwC1Zfahuw9xOFgU0hXSd4qesxVgzwCZH87PnP5yUYEd0SrEz33sx/j5CYszE0wJ3K1N2WosYZ/b9pATp3gXU8yEBmu2i2u/+UYi91777+v1EBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbHmtCDszqs5W9HQILHMv0m1kG+rkLAUniyBRDkJsZs=;
 b=mvdg3Qxs7h6RDgseN7LxatG/Gi9EhNYWkowa5U+DNoo0QGp/PC2zXPxEvYxhV7iHxT0/2Kzxc/mktCl85inDu4tDHWsiHfIxAzaRbyPOhrTMvWTN1BcxP7k3xm0+Ow3gkrCEVULHV21ylruaAVZDzblNJ6clMQyRv13c3PV9h/A=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB4582.namprd12.prod.outlook.com (2603:10b6:208:26b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Fri, 15 Jan
 2021 21:38:13 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 21:38:13 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 05/15] arc: TCG instruction generator and hand-definitions
Thread-Topic: [PATCH 05/15] arc: TCG instruction generator and hand-definitions
Thread-Index: AQHW62F5Yc1XOx1vqESeY83yqPhwtA==
Date: Fri, 15 Jan 2021 21:38:13 +0000
Message-ID: <55f04719-98f2-aef8-e4c7-10e162d79fd7@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-6-cupertinomiranda@gmail.com>
 <1b75a1e6-481c-1fe0-00b9-518b01fd53bd@linaro.org>
 <9a9183ca-fd2c-9d57-b283-cf06dbac23cb@synopsys.com>
 <983f948f-dcf8-74f7-71b8-b613b8490fc7@linaro.org>
In-Reply-To: <983f948f-dcf8-74f7-71b8-b613b8490fc7@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e51850f-409f-434f-4ac8-08d8b99ddc85
x-ms-traffictypediagnostic: MN2PR12MB4582:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4582E86CD55774D13BF44D1EA8A70@MN2PR12MB4582.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zXinXHID6nocd1PoGhMO/y+PGhMKALKHaw9K2VT8F+/jutrsmrdeHD2e4tBMKPd+rfTb9P+K8Qz/c2sMkCGU1Q8sp42PhmeWxOftxyE3wd+pROeO6ty9Xj5Pbe/L8oib3zDRxaU3mezwWTkalHTq6WK5cxbtg0BoXxvEbTLdmq0fKLFG9dSMvPekXB9NMatSWwDx+S5lCiCJLvBTupzipl3IkY+6ESJgBo50/JWPnLSrsJOxDndTAKJMwpoFnq6OsaPWAtL1p3Tqoy0xzwZ/2Qisms7vcb6W/cHThXGuwlO6M8u0/MLfWjV3OsG2toYUrFq0GvKUNsQIuIZdVM9xLgmFD8mTk5hMgMGZ8NLNpZx7iG7lTa/oP/fMiP1u3fDQ5SEZ0F/LJ9NH8xDYo3O0GdUSRRWU/sQY1UtE+HpbiAoKoOoIFvlfifjH7GnHxpBfx3agGKTUvXgjQPrFpExjwxKxz3EsgheGNaMXbtJ48saUg3LMfBp82wry4t6mbjjajduV0S3sjgPVmUoxHmFEGdUGgsZJkJ6sfAjxrkssMaPCy2II+gsdHvx3Pvsh6pECExKTuNN6G7kxZvlbN67xqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(346002)(376002)(396003)(366004)(64756008)(26005)(107886003)(4326008)(36756003)(186003)(66446008)(6512007)(66556008)(53546011)(2906002)(66946007)(110136005)(2616005)(91956017)(478600001)(8936002)(5660300002)(76116006)(31686004)(83380400001)(66476007)(6486002)(71200400001)(54906003)(8676002)(316002)(6506007)(31696002)(86362001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZURJRDZNZzg1N0xiRlhhOC9nVC9TNENZZGpaUHVLSVBPYU5wL2U3Q25PaENH?=
 =?utf-8?B?aCtzYTczSEk0dERGQWI5TE16dTFwbkZWTW52ZVNZekdNajRaWGh4Q1BUWmpk?=
 =?utf-8?B?S3BVVjdINFc1Lyt5cThYeFM3L01Rcld5Z2RiR082c2ZObkprc2ovZEpta2FG?=
 =?utf-8?B?Z2xhS3NWSTV0c0dNRXlKV0tucWJKVGx1SkRlRFhDZzRTSXVMOXR3WG9UcW5a?=
 =?utf-8?B?bkMwd3NmL3NxUnhvVjJUYkhtNjBiTlQ4L2JsWlFnaHNXUW9hZXlOL1ZYL1J0?=
 =?utf-8?B?enBxVTlwNEZhZGxJSFdZNTRaZTBPZklCUGlMWERkZk1KSk5DZEFEZGw5NGt4?=
 =?utf-8?B?NFJvVENzVlhnbW1KL1EyWFdKdERtcTJPN1FvZXV5VGxVbzA0dG9jR0psUmpI?=
 =?utf-8?B?Vld5dTh2eHIzL1R3TnJUL3NQVTQvRnlXdlU3RFZRV2tkR3dxbjhnSXp2aFVz?=
 =?utf-8?B?cTVROWg0YjltZ0FtTGZvUVpIdWliVVlpZFdSNEtIMnBWY3VyV3JwVE5aeGFY?=
 =?utf-8?B?SGZDTFUySHlwa2JYdi83UzFNODJWZTVXZW1uNDNIR3BWNFpiZHhzaFN6SkVv?=
 =?utf-8?B?d2xSRzRCQU1pTFhyYU5ZZ010WTdKY0dWbnJhek1CbUdBcXNJVFo1ZkdRdzdq?=
 =?utf-8?B?cEtlRVdsNXpkanBRV3JwOW44WnJEYlJSZ1FEVjRLUmVJYjd2eHNtNGpLQWxW?=
 =?utf-8?B?aXVHSDZDRkYzNGR5ZnNJSEE5K29rSllLU2RvWm11ZTVHTzNMUEdWMFZrTE9r?=
 =?utf-8?B?MFdQQjEraGZEdEFOb1ZPYTR5S3lvZ0FmYVZ1ZGRQdVVpRUVIWVpRTzE2NUxi?=
 =?utf-8?B?NTJFQmd4cis2eHdET3VmQVRYeWRCM2dyUVBJVkcrL0Y3eE02MndhL2FZZ01u?=
 =?utf-8?B?azc0M241Ujg4bFVpNDd6dERXYmZodW95bG5LZU1SV2piUFhZQ2s3eGs4OG12?=
 =?utf-8?B?VkU5QmFTYmpNSFF6MDVhNzhKdVBXWCtOaXdWQ2IzQnVKVDVSZ0ZTU3RRNEMr?=
 =?utf-8?B?eS9mZUFRL1IrM3VjaFo1M1hOQnVFM3NhcFc1Ni9YWGJxeGJZK3FnbkQ3ZkFk?=
 =?utf-8?B?QUwwZ281OWNDSUMvSzJqT1VCbUpLWCs1Mm1ZZnNKdFlPeDhSY0k4OXZ1SHdY?=
 =?utf-8?B?RzA3VXdaZUNuRGdUY1ZnalJqejJhNTI4WUZCMENDcS8xaW1JK09QQXo3aVFv?=
 =?utf-8?B?Qkc3K2tQcjhIaUdKSFFHaUw2aTRJTzh4TlBBMmU2MVhIRG55bWl1Z3Mxdmpn?=
 =?utf-8?B?MU5MMG9WU3JZTFFxZ3krNm81K0Y2SlI5eCs3NmZUV0NIZGR2WjY3UmJTTlpC?=
 =?utf-8?Q?8mN2sGxWLmLHs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B442F9A57960AF48B1805D7DCCE9E26D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e51850f-409f-434f-4ac8-08d8b99ddc85
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 21:38:13.3003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bs7xBgJQje1VbUQwR0g1mcmJusOdmHLpQJ6p5qUaKHK3nNwOUB1TuLgxH4r1V210Xa1yJpYOUVsCDEE7im+I+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4582
Received-SPF: pass client-ip=149.117.87.133;
 envelope-from=Cupertino.Miranda@synopsys.com; helo=smtprelay-out1.synopsys.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhhbmtzIGZvciB5b3VyIHF1aWNrIHJlcGx5Lg0KDQpPbiAxLzE1LzIxIDg6MTcgUE0sIFJpY2hh
cmQgSGVuZGVyc29uIHdyb3RlOg0KPiBPbiAxLzE1LzIxIDc6MTEgQU0sIEN1cGVydGlubyBNaXJh
bmRhIHdyb3RlOg0KPj4+IE9uIDExLzExLzIwIDEwOjE3IEFNLCBjdXBlcnRpbm9taXJhbmRhQGdt
YWlsLmNvbSB3cm90ZToNCj4+Pj4gKy8qDQo+Pj4+ICsgKiBUaGUgbWFjcm8gdG8gYWRkIGJvaWxl
ciBwbGF0ZSBjb2RlIGZvciBjb25kaXRpb25hbCBleGVjdXRpb24uDQo+Pj4+ICsgKiBJdCB3aWxs
IGFkZCB0Y2dfZ2VuIGNvZGVzIG9ubHkgaWYgdGhlcmUgaXMgYSBjb25kaXRpb24gdG8NCj4+Pj4g
KyAqIGJlIGNoZWNrZWQgKGN0eC0+aW5zbi5jYyAhPSAwKS4gVGhpcyBtYWNybyBhc3N1bWVzIHRo
YXQgdGhlcmUNCj4+Pj4gKyAqIGlzIGEgImN0eCIgdmFyaWFibGUgb2YgdHlwZSAiRGlzYXNDdHh0
ICoiIGluIGNvbnRleHQuIFJlbWVtYmVyDQo+Pj4+ICsgKiB0byBwYWlyIGl0IHdpdGggQ0NfRVBJ
TE9HVUUgbWFjcm8uDQo+Pj4+ICsgKi8NCj4+Pj4gKyNkZWZpbmUgQ0NfUFJPTE9HVUUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4gKyAgVENHdiBjYyA9IHRjZ190ZW1w
X2xvY2FsX25ldygpOyAgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4gKyAgVENHTGFiZWwgKmRv
bmUgPSBnZW5fbmV3X2xhYmVsKCk7ICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4gKyAgZG8geyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4gKyAg
ICBpZiAoY3R4LT5pbnNuLmNjKSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+
Pj4gKyAgICAgICAgYXJjX2dlbl92ZXJpZnlDQ0ZsYWcoY3R4LCBjYyk7ICAgICAgICAgICAgICAg
IFwNCj4+Pj4gKyAgICAgICAgdGNnX2dlbl9icmNvbmRpX3RsKFRDR19DT05EX05FLCBjYywgMSwg
ZG9uZSk7IFwNCj4+Pj4gKyAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4+Pj4gKyAgfSB3aGlsZSAoMCkNCj4+Pj4gKw0KPj4+PiArLyoNCj4+
Pj4gKyAqIFRoZSBmaW5pc2hpbmcgY291bnRlciBwYXJ0IG9mIENDX1BST0xVR0UuIFRoaXMgaXMg
c3VwcG9zZWQNCj4+Pj4gKyAqIHRvIGJlIHB1dCBhdCB0aGUgZW5kIG9mIHRoZSBmdW5jdGlvbiB1
c2luZyBpdC4NCj4+Pj4gKyAqLw0KPj4+PiArI2RlZmluZSBDQ19FUElMT0dVRSAgICAgICAgICBc
DQo+Pj4+ICsgICAgaWYgKGN0eC0+aW5zbi5jYykgeyAgICAgIFwNCj4+Pj4gKyAgICAgICAgZ2Vu
X3NldF9sYWJlbChkb25lKTsgXA0KPj4+PiArICAgIH0gICAgICAgICAgICAgICAgICAgICAgICBc
DQo+Pj4+ICsgICAgdGNnX3RlbXBfZnJlZShjYykNCj4+Pg0KPj4+IFdoeSB3b3VsZCB0aGlzIG5l
ZWQgdG8gYmUgYm9pbGVyLXBsYXRlPyAgV2h5IHdvdWxkIHRoaXMgbm90IHNpbXBseSBleGlzdCBp
bg0KPj4+IGV4YWN0bHkgb25lIGxvY2F0aW9uPw0KPj4+DQo+Pj4gWW91IGRvbid0IG5lZWQgYSB0
Y2dfdGVtcF9sb2NhbF9uZXcsIGJlY2F1c2UgdGhlIGNjIHZhbHVlIGlzIG5vdCB1c2VkIHBhc3Qg
dGhlDQo+Pj4gYnJhbmNoLiAgWW91IHNob3VsZCBmcmVlIHRoZSB0ZW1wIGltbWVkaWF0ZWx5IGFm
dGVyIHRoZSBicmFuY2guDQo+Pj4NCj4+DQo+PiBJIHdvbmRlciBpZiB3aGF0IHlvdSB0aG91Z2h0
IHdhcyB0byBtb3ZlIHRob3NlIG1hY3JvcyB0byBmdW5jdGlvbnMgYW5kDQo+PiBjYWxsIGl0IHdo
ZW4gQ0NfUFJPTE9HVUUgYW5kIENDX0VQSUxPR1VFIGFyZSB1c2VkLg0KPj4gSSB0aGluayB0aGUg
bWFjcm9zIHdlcmUgY2hvb3NlbiBkdWUgdG8gdGhlIHNoYXJpbmcgb2YgdGhlICdjYycgYW5kDQo+
PiAnZG9uZScgdmFyaWFibGVzIGluIGJvdGggQ0NfUFJPTE9HVUUgQU5EIENDX0VQSUxPR1VFLg0K
PiANCj4gSSBtZWFudCB0aGF0IHRoZSBjaGVja2luZyBvZiBjdHgtPmluc24uY2MgY291bGQgYmUg
ZG9uZSBhdCBhIGhpZ2hlciBsZXZlbCwgc28NCj4gdGhhdCB0aGlzIGNvZGUgZXhpc3RlZCBpbiBl
eGFjdGx5IG9uZSBwbGFjZSwgbm90IHNjYXR0ZXJlZCBiZXR3ZWVuIGFsbCBvZiB0aGUNCj4gZGlm
ZmVyZW50IGluc3RydWN0aW9ucy4NCj4gDQo+IEJ1dCBpZiB0aGF0IGlzbid0IHBvc3NpYmxlIGZv
ciBzb21lIHJlYXNvbiwgeW91IGNhbiBjZXJ0YWlubHkgcHV0ICJkb25lIiBpbnRvDQo+IHRoZSBE
aXNhc0NvbnRleHQgc28gdGhhdCB5b3UgY2FuIGhhdmUgdG8gZnVuY3Rpb25zIGNjX3Byb2xvZ3Vl
KGN0eCkgYW5kDQo+IGNjX2VwaWxvZ3VlKGN0eCkuDQo+IA0KPiANCj4+Pj4gK3ZvaWQgZ2VuX2dv
dG9fdGIoRGlzYXNDb250ZXh0ICpjdHgsIGludCBuLCBUQ0d2IGRlc3QpDQo+Pj4+ICt7DQo+Pj4+
ICsgICAgdGNnX2dlbl9tb3ZfdGwoY3B1X3BjLCBkZXN0KTsNCj4+Pj4gKyAgICB0Y2dfZ2VuX2Fu
ZGlfdGwoY3B1X3BjbCwgZGVzdCwgMHhmZmZmZmZmYyk7DQo+Pj4+ICsgICAgaWYgKGN0eC0+YmFz
ZS5zaW5nbGVzdGVwX2VuYWJsZWQpIHsNCj4+Pj4gKyAgICAgICAgZ2VuX2hlbHBlcl9kZWJ1Zyhj
cHVfZW52KTsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsgICAgdGNnX2dlbl9leGl0X3RiKE5VTEwsIDAp
Ow0KPj4+DQo+Pj4gTWlzc2luZyBlbHNlLiAgVGhpcyBpcyBkZWFkIGNvZGUgZm9yIHNpbmdsZS1z
dGVwLg0KPj4gR29lcyBhIGxpdHRsZSBhYm92ZSBteSBrbm93bGVkZ2Ugb2YgUUVNVSBpbnRlcm5h
bHMgdG8gYmUgaG9uZXN0Lg0KPj4gRG8geW91IGhhdmUgYSByZWNvbW1lbmRhdGlvbiB3aGF0IHdl
IHNob3VsZCBiZSBkb2luZyBoZXJlID8NCj4gDQo+IEJvdGggb2YgdGhlc2UgYWN0aW9ucyBlbmQg
dGhlIFRCLCBzbzoNCj4gDQo+ICAgIGlmIChjdHgtPmJhc2Uuc2luZ2xlc3RlcF9lbmFibGVkKSB7
DQo+ICAgICAgZ2VuX2hlbHBlcl9kZWJ1ZyhjcHVfZW52KTsNCj4gICAgfSBlbHNlIHsNCj4gICAg
ICB0Y2dfZ2VuX2V4aXRfdGIoTlVMTCwgMCk7DQo+ICAgIH0NCj4gDQpDbGVhciAhISEgOi0pDQoN
Cj4+PiBZb3UgY291bGQgcHV0IGFsbCBvZiB0aGVzZSBpbnRvIGEgY29uc3Qgc3RhdGljIHRhYmxl
Lg0KPj4gV2hhdCBkbyB5b3UgbWVhbiwgY2FuIHdlIG1ha2UgdGhlIGVmZmVjdCBvZiB0Y2dfZ2xv
YmFsX21lbV9uZXdfaTMyIGFzDQo+PiBjb25zdGFudCA/DQo+IA0KPiBObywgSSBtZWFuIGFsbCBv
ZiB0aGUgZGF0YSB0aGF0IGlzIHBhc3NlZCB0byB0Y2dfZ2xvYmFsX21lbV9uZXcuICBTZWUgZm9y
DQo+IGluc3RhbmNlIHRhcmdldC9zcGFyYy90cmFuc2xhdGUuYywgc3BhcmNfdGNnX2luaXQoKS4N
CkNsZWFyLg0KPiANCj4gDQo+Pj4+ICtzdGF0aWMgdm9pZCBpbml0X2NvbnN0YW50cyh2b2lkKQ0K
Pj4+PiArew0KPj4+PiArI2RlZmluZSBTRU1BTlRJQ19GVU5DVElPTiguLi4pDQo+Pj4+ICsjZGVm
aW5lIE1BUFBJTkcoLi4uKQ0KPj4+PiArI2RlZmluZSBDT05TVEFOVChOQU1FLCBNTkVNT05JQywg
T1BfTlVNLCBWQUxVRSkgXA0KPj4+PiArICBhZGRfY29uc3RhbnRfb3BlcmFuZChNQVBfIyNNTkVN
T05JQyMjXyMjTkFNRSwgT1BfTlVNLCBWQUxVRSk7DQo+Pj4+ICsjaW5jbHVkZSAidGFyZ2V0L2Fy
Yy9zZW1mdW5jX21hcHBpbmcuZGVmIg0KPj4+PiArI2luY2x1ZGUgInRhcmdldC9hcmMvZXh0cmFf
bWFwcGluZy5kZWYiDQo+Pj4+ICsjdW5kZWYgTUFQUElORw0KPj4+PiArI3VuZGVmIENPTlNUQU5U
DQo+Pj4+ICsjdW5kZWYgU0VNQU5USUNfRlVOQ1RJT04NCj4+Pj4gK30NCj4+Pg0KPj4+IEV3LiAg
WWV0IGFub3RoZXIgdGhpbmcgdGhhdCBjYW4gYmUgZG9uZSBhdCBidWlsZCB0aW1lLg0KPj4gQXMg
ZmFyIGFzIEkgcmVtZW1iZXIgaXQsIHRoZXJlIHdhcyBubyB3YXkgSSBjb3VsZCBnZW5lcmF0ZSB0
aGlzIHRhYmxlDQo+PiB1c2luZyB0aGUgQyBwcmUtcHJvY2Vzc29yLiBEbyB5b3Ugc3VnZ2VzdCB0
byBtYWtlIHRoaXMgdGFibGUgdXNpbmcgYW4NCj4+IGV4dGVybmFsIHRvb2wgPw0KPiANCj4gSSBh
c3N1bWVkIHRoYXQgeW91IGNvdWxkIGp1c3QgYXMgZWFzaWx5IGdlbmVyYXRlIGEgdGFibGUgdXNp
bmcgdGhlIGMNCj4gcHJlcHJvY2Vzc29yIGFzIHRoaXMgZnVuY3Rpb24uICBJIGd1ZXNzIEknZCBs
aWtlIHRvIGtub3cgbW9yZSBhYm91dCB3aHkgeW91DQo+IGNhbid0Li4uDQoNClRvIGJlIGZhaXIs
IGl0IHdvdWxkIGJlIHBvc3NpYmxlIGJ1dCBub3Qgc28gZWNvbm9taWNhbC4NClRoaXMgd291bGQg
YWN0dWFsbHkgYmUgYSAyIGRpbWVuc2lvbmFsIHRhYmxlIG9mIHNpemUgKChOQU1FICogTU5FTU9O
SUMpIA0KeCAoMykpLiAzIGlzIHRoZSBhc3N1bWVkIG1heGltdW0gb3BlcmFuZCBzaXplLg0KDQpJ
biBvcmRlciB0byBtaW5pbWl6ZSB3YXN0ZWQgc3BhY2UgdGhlIHNlY29uZCBkaW1lbnNpb24gd2Fz
IGltcGxlbWVudGVkIA0KYXMgYSBsaW5rZWQgbGlzdC4NCkNvbnNpZGVyaW5nIGFsc28gdGhpcyB0
aGUgZW50cmllcyBpbiB0aGUgdGFibGUgd291bGQgYWxzbyBuZWVkIHRvIGJlIG9mIA0KdHlwZSBz
dHJ1Y3QsIGFzIHdlIG5lZWRlZCB0byBtYXJrIHNvbWVob3cgdGhlIGVudHJpZXMgdGhhdCBkaWQg
bm90IA0KZGVmaW5lIGEgQ09OU1RBTlQuDQoNClBsZWFzZSBub3RpY2UgdGhlcmUgYXJlIG9ubHkg
MTYgZW50cmllcyBvZiB0aGlzIENPTlNUQU5UIG1hY3JvLCBtYWtpbmcgDQp0aGlzIGluaXRpYWxp
emF0aW9uIG5lZ2xpZ2libGUuDQoNCj4gDQo+Pj4+ICsgICAgICAgICAgICBpbnQzMl90IGxpbW0g
PSBvcGVyYW5kLnZhbHVlOw0KPj4+PiArICAgICAgICAgICAgaWYgKG9wZXJhbmQudHlwZSAmIEFS
Q19PUEVSQU5EX0xJTU0pIHsNCj4+Pj4gKyAgICAgICAgICAgICAgICBsaW1tID0gY3R4LT5pbnNu
LmxpbW07DQo+Pj4+ICsgICAgICAgICAgICAgICAgdGNnX2dlbl9tb3ZpX3RsKGNwdV9saW1tLCBs
aW1tKTsNCj4+Pj4gKyAgICAgICAgICAgICAgICByZXQgPSBjcHVfcls2Ml07DQo+Pj4+ICsgICAg
ICAgICAgICB9IGVsc2Ugew0KPj4+PiArICAgICAgICAgICAgICAgIHJldCA9IHRjZ19jb25zdF9s
b2NhbF9pMzIobGltbSk7DQo+Pj4+ICsgICAgICAgICAgICB9DQo+Pj4+ICsgICAgICAgIH0NCj4+
Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgcmV0dXJuIHJldDsNCj4+Pg0KPj4+IFdoeSBhcmUg
eW91IHVzaW5nIGxvY2FscyBmb3IgZXZlcnl0aGluZz8gIElzIGl0IGJlY2F1c2UgeW91IGhhdmUg
bm8gcHJvcGVyDQo+Pj4gY29udHJvbCBvdmVyIHlvdXIgdXNlIG9mIGJyYW5jaGluZz8NCj4+DQo+
PiBJbml0aWFsbHkgd2UgdGhvdWdoIGxvY2FscyB0aGUgZ29vZCB3YXkgdG8gZGVmaW5lIHRlbXBv
cmFyaWVzLiA6LSgNCj4+IFdoYXQgc2hvdWxkIGJlIHRoZSBiZXN0ID8gV2Ugd2lsbCBuZWVkIHRv
IGNoYW5nZSBhIGxvdCBvZiBjb2RlIGZvciB0aGlzLg0KPiANCj4gVENHIGlzIGEgcG9vciBvcHRp
bWl6ZXIuICBJZiB5b3UgY2FuIGF0IGFsbCBhdm9pZCBicmFuY2hlcywgd2hpbGUgaW1wbGVtZW50
aW5nDQo+IGEgc2luZ2xlIGluc3RydWN0aW9uLCBkbyBzby4gIEJlY2F1c2UgdGhpcyBtZWFucyB0
aGF0IHlvdSBjYW4gdXNlDQo+IHRjZ190ZW1wX25ld19pMzIgKGV0IGFsKSB3aGljaCBhcmUgIm5v
cm1hbCIgdGVtcHMsIGFuZCBhcmUgbm90IHNwaWxsZWQgdG8gdGhlDQo+IHN0YWNrIGF0IHRoZSBl
bmQgb2YgdGhlIEJCLg0KPiANCj4gVGhpcyBkb2VzIG5vdCBuZWNlc3NhcmlseSBhcHBseSB0byBj
b25kaXRpb25hbCBleGVjdXRpb24gKGNjX3Byb2xvZ3VlLCBldCBhbCkNCj4gYmVjYXVzZSB5b3Ug
Y2FuIHRoaW5rIG9mIHRob3NlIGFzICJvdXRzaWRlIiBvZiB0aGUgaW5zdHJ1Y3Rpb24sIG1lcmVs
eSB3cmFwcGluZw0KPiB0aGVtLiAgVGhlIGFjdHVhbCBsaXZlIHRlbXBzIHdpbGwgYmUgImluc2lk
ZSIgYW5kIG5vdCBsaXZlIHBhc3QgdGhlIGRvbmUgbGFiZWwuDQoNCk1heWJlIEkgd2lsbCBuZWVk
IHRvIG1ha2UgbXkgdGNnIGNvZGUgZ2VuZXJhdG9yIGF3YXJlIG9mIHRoaXMgaW4gb3JkZXIgDQp0
byBwcm9wZXJseSBjcmVhdGUgdGVtcHMuDQoNCj4+Pj4gKy8qIFJldHVybiBmcm9tIGV4Y2VwdGlv
bi4gKi8NCj4+Pj4gK3N0YXRpYyB2b2lkIGdlbl9ydGllKERpc2FzQ29udGV4dCAqY3R4KQ0KPj4+
PiArew0KPj4+PiArICAgIHRjZ19nZW5fbW92aV90bChjcHVfcGMsIGN0eC0+Y3BjKTsNCj4+Pj4g
KyAgICBnZW5faGVscGVyX3J0aWUoY3B1X2Vudik7DQo+Pj4+ICsgICAgdGNnX2dlbl9tb3ZfdGwo
Y3B1X3BjLCBjcHVfcGNsKTsNCj4+Pj4gKyAgICBnZW5fZ290b190YihjdHgsIDEsIGNwdV9wYyk7
DQo+Pj4+ICt9DQo+Pj4NCj4+PiBZb3UgbXVzdCByZXR1cm4gdG8gdGhlIG1haW4gbG9vcCBoZXJl
LCBub3QgZ290b190Yi4gIFlvdSBtdXN0IHJldHVybiB0byB0aGUNCj4+PiBtYWluIGxvb3AgZXZl
cnkgdGltZSB5b3VyIGludGVycnVwdCBtYXNrIGNoYW5nZXMsIHNvIHRoYXQgcGVuZGluZyBpbnRl
cnJ1cHRzDQo+Pj4gbWF5IGJlIGFjY2VwdGVkLg0KPj4+DQo+PiAiZ2VuX2dvdG9fdGIiIGNhbGxz
IGluIHRoZSBlbmQgInRjZ19nZW5fZXhpdF90YihOVUxMLCAwKSIsIGlzIGl0IG5vdCB0aGUNCj4+
IHNhbWUgPw0KPiANCj4gTm8uICBCZWNhdXNlIGdlbl9nb3RvX3RiIHVzZXMgdGNnX2dlbl9nb3Rv
X3RiLCB3aGljaCBlbmRzIHRoZSBUQiByaWdodCB0aGVyZS4NCj4gQW5vdGhlciBpbnN0YW5jZSBv
ZiB0aGUgImVsc2UiIGJ1ZyBhYm92ZS4NCj4gDQo+PiBXZSBuZWVkIHRvIGludmVzdGlnYXRlIHRo
aXMgaW1wbGVtZW50YXRpb24gZnVydGhlci4gQSBxdWljayBjaGFuZ2UgdG8NCj4+IGdlbl9ydGll
IGJyb2tlIGxpbnV4IGJvb3RpbmcuDQo+PiBDYW4geW91IHJlY29tZW5kIHNvbWUgdGFyZ2V0IHRo
YXQgaW1wbGVtZW50cyB0aGUgbG9vcCBleGl0IG9uIHJ0aWUgYXMNCj4+IHlvdSBzdWdnZXN0ID8N
Cj4gDQo+IHRhcmdldC9yaXNjdi8gLS0gc2VlIHRyYW5zX21yZXQoKSBhbmQgZXhpdF90YigpLg0K
Q2xlYXIuDQo+IA0KPiANCj4gcn4NCj4gDQo=

