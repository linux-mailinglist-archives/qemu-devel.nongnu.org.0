Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E331302E45
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 22:49:42 +0100 (CET)
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l49jx-0001Gi-LM
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 16:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=65246ce22=Dmitry.Fomichev@wdc.com>)
 id 1l49iu-0000Iz-PX; Mon, 25 Jan 2021 16:48:37 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:18219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=65246ce22=Dmitry.Fomichev@wdc.com>)
 id 1l49ip-00058I-2o; Mon, 25 Jan 2021 16:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611611310; x=1643147310;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fuI99gglT9unfnPdbnb9nkvJIugwj76QyNKfRjrRtYk=;
 b=YLntKOclxhDWsSdkn+5InoGOgwe4Af1ox9cBPJXnw0tcujN0yv8IsRLx
 fUOfZfC2Eij+GUSceJkUiuOLh800uDZaL2jLK4GlvIlzaHfPFhpYpnUvy
 qt+ubIfOwPGGfePEeC3dNF11FfqMgPq+DPPpFhqHIw+xIba+lL5yMlmrH
 BoD/JDOvb2xqCILLlPG+3IHxnzLDwUNlxiuv1d6+YHpW+WNX3BXBW2fE1
 i5V5rJ5k14YASlBZcoupERRgtxqsWkGjZ5k3aNEmNlkoyeqZIf0hbswAf
 x0VxZC+90PeEp818j6tRF4EYF+/Pu1T0pkip5m8W45xLqLBrh5Bfq1TuB Q==;
IronPort-SDR: S76qXS9nTegbujdheFrHPKmhidm5iXcJrVTcLeMaqGj5pbNrRAmVIzGB355cupqlp00k345DuD
 HqESGMjg5c3PPE0MFJalHwaje/r/KE2sHFX9o7FIEmDptSysxaQM95jl3rUzVHyHDdPVbsNIda
 4epVpJW5sd10dfD+Eyj5CRkFMAnzhiQB0zh1PcfxyuH0OpZrL/bTJAK4o40anogEAh74+iX33z
 gApIr550w6rFNLEvT3pllG0Sp6WJIHWfyeW7P9SUpnmfhfp7G7nNh8/96opeouZwpgKy2D238X
 7hs=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; d="scan'208";a="268651074"
Received: from mail-bl2nam02lp2050.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.50])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 05:48:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDVLuh8eTIwn3/Xl4lUSbs+L89BMPorZ6ZTFBQRNcJm4Xh4EQRfUGgOvfY4JdvPfdzzFcfaSwIXXSIYgXGlr6NTFINDjoLT81yYdmHrTRwj9utgmGnbuejixVfB4lSyfziJQ1QMN359jcfV/RjnUOKFZOAyKxtvwl4BtYl/X2j/EuMvuTgk4fN/XEkweEVr1p9jm1BBgoryCAkU/olRTaIdtNr54YrOGpvsO5IdH6c4sF5qoQmGAL0BJsAi9w6TbhIrka63Qq253+k0Qcd4KNNCV32tVAHMmoZ0G6Pd0ZFb859p5kcxAgEiM9zR40qCneT0wLrsHNARJaICbGpf4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuI99gglT9unfnPdbnb9nkvJIugwj76QyNKfRjrRtYk=;
 b=AhauQZ2hvu29sSgJm3NpVFj9D8etcyzT/OY++BMIjJHnwBDo71hhnaBiOIA8K0FRTjaCnJJ6PKhuCbqxwemBpqpk9+OaurONwAu3DBiF50vUWZLbv542d8tKfGHqzXNaWMGA+Pf5MCl7/c7dNI7OD+nt8jZZqu6+cfajD46MmrgaCWFnRmPjzLMCzKAGcvuV8oAa+fCiDMZcg6/3CknyyzVOVHm3rnBu/A5bjT0B46z0GUxX6V2KAWHeuaFeGDNwYeMk40cf4VaSvDJ6yaQEI6UPg2//VmHG7NG4UacxBilYg+7lBIqNg89c4euvjnZnFqTBOWjHntTClzSiMte9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuI99gglT9unfnPdbnb9nkvJIugwj76QyNKfRjrRtYk=;
 b=xSoRzdGXUjpOFYIOINLuiQtTkVbPZmgB+ayiY+Mk04n6pbtJrarIvTVc4I2pl3IKyb5qWlzyg0AbdT7JNLKuShHvyDiMK2V2dMZfGhXJxmT3RM8WAkKE7RNvCXN+7deKHy+IAMXTfWsf+J3v11k2kzoB+eRoDdF6QMrwdGQQIj4=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MN2PR04MB5550.namprd04.prod.outlook.com (2603:10b6:208:d8::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Mon, 25 Jan
 2021 21:48:25 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617%4]) with mapi id 15.20.3784.017; Mon, 25 Jan 2021
 21:48:24 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "its@irrelevant.dk" <its@irrelevant.dk>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 0/2] hw/block/nvme: zoned fixes
Thread-Topic: [PATCH 0/2] hw/block/nvme: zoned fixes
Thread-Index: AQHW7mq06uPlYAWtgE6/z7pGm8HsuKo3+Y4AgADxN4A=
Date: Mon, 25 Jan 2021 21:48:24 +0000
Message-ID: <c805ce7863bdf3871763ba8edc7fb7295ea41e98.camel@wdc.com>
References: <20210119135500.265403-1-its@irrelevant.dk>
 <YA5yTh/OlS4zYGOu@apples.localdomain>
In-Reply-To: <YA5yTh/OlS4zYGOu@apples.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 (3.38.2-1.fc33) 
authentication-results: irrelevant.dk; dkim=none (message not signed)
 header.d=none;irrelevant.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [100.35.205.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6addee02-cda7-43d1-3a9c-08d8c17af0dd
x-ms-traffictypediagnostic: MN2PR04MB5550:
x-microsoft-antispam-prvs: <MN2PR04MB55501F60E69F8591734E8ADEE1BD9@MN2PR04MB5550.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WxKOT/7O36hw11/C6oStgePhnMMZf8iXTGxje6wjHgm/CUroAO48NjJmiIIkMT8DFbwbRul2imweYObuWCjAJ8HnjOmTeOazWpniPS4Sz413zgqnDUoMZ9/h5tvJ3qqs3xFayiITUxmyDVPZVQXt76aARFACgvhqgAk+37wajp7kPPoNPMel/d5aoBo3/WXkHOGPp3DuFVKJ9/A0NigMT9nVCZMX+lv/r3xjZAdE+xAmxWLopblFFawwFMbmBCnb91rskTFSGXzohlwfChlLXxFCyTqO0a7AnbbZuLiZZJM5iA0afgLJbpsjwiF8aBCSUOQEjAzfEkQhSc24QfBA7XcrBtHdJD9QM3Eumi/gIaWvx+fDTrSVqZl0XjBPYwJzL0562cm2mKTpSNFeYOeZSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(36756003)(26005)(86362001)(2616005)(6506007)(316002)(110136005)(8676002)(54906003)(66446008)(66556008)(2906002)(64756008)(186003)(6486002)(478600001)(66476007)(71200400001)(76116006)(4744005)(5660300002)(8936002)(6512007)(4326008)(83380400001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ejhOdUlZMzJtcGZDMCsvNTFHaTRmNjdJb0xUZURlVjFrNTZ2RkRNR0hyWE9O?=
 =?utf-8?B?a0l3TW1PT0pZZktFQTIxb2hEYUJMckw5OTZhaWdZcFhnUXdsc3pMb2tOVHFq?=
 =?utf-8?B?YWdNTEdzTWFVSXVOV1VhRTlsTHFESlpSSHoxOVlBUUMrWFJKaHRkRFRzeEpV?=
 =?utf-8?B?eVpMNFhhRzg5bUwxWkNlckM3ZFI4S2d3TjJGUU1NbzJKeC9ZMDRKR0NWSE1j?=
 =?utf-8?B?MGEwRDBVdk84MVkyTGJsY2lQZVV0bGR2a0VwSkppUzUyYUZlK0h2bzhGNmls?=
 =?utf-8?B?dm94WWpNQnVuY3JDM1NpODhXZHlMeDF1YVBoZ1AzMzRkZXpxTWFqelRVQmp6?=
 =?utf-8?B?cjJ2SXF2blBWZjY5UkxwbUplN2tINWdXb3R3NmNjUnRHekh6SmNvTHFhd3lS?=
 =?utf-8?B?Umo1dVdHVlNJY0ZEdG1PdEhpUHh5aXdoNUErd1ZUeWdZdUtDRWRCNWJPSkVS?=
 =?utf-8?B?RDd4K1FUUks2bXNFaHRtdFdlc01EcmtCSW1rdXhIdFhLTEpjczExWFNMZUhw?=
 =?utf-8?B?emZjaGtCMkdHU3VJakVDZXovbWsxZU5tVE9KaGFDZ2dkdHRQdnFBakFTL2J4?=
 =?utf-8?B?OWJycmVFbG13OFN0RkhkTm1GRWhnWlpLWFQ4UVlBc1UzZjdYUXZxOUw3OFkx?=
 =?utf-8?B?UnZuZTlGenZPc2M0aVNQUGliRUdnQTBJUnNSajA0RVMxWWxNOUNMSjMzRnVQ?=
 =?utf-8?B?N3NIVFNXVUZxRHFXclF0cmRVMkM0UkxpRjJUQnBrWHhTdmptR1JaVmdIMUg4?=
 =?utf-8?B?R1ErVFVjQUM3M1h0a2RTL3BUb2hqZ1VCUzhrMWFScnBCVE42MjcwaDdxRXBr?=
 =?utf-8?B?U3pyZS9Hc3cwdEp5SDFuTWtVSEZTV1ZKYW1yWHplSFdtRjltWjgrMk1xbkg0?=
 =?utf-8?B?bVZrdWtERTBoUERRUmE5QVowYlVRZGdmN2NLYmdvdzJwY2JUV0hXUGpCcGtB?=
 =?utf-8?B?eVVhaXE1Z3FkZjVVVU80anBicXArRFV3VHQ4QTVVVHdlbVQ5eFlZcm9wcHdo?=
 =?utf-8?B?YjErdncrU1Ria3pMM21xNDhwOGdpR1pWTkV6YVJja2tDVHF4cElVYTJyMSto?=
 =?utf-8?B?K1llRFEwQms3OC9PamYzRU5mYTZtbHdlM2FWWFRRMTRxaVhLWUIxakNoRFl6?=
 =?utf-8?B?c1A0K3lka1p2Qjh4N3d6V1IrWHF1bzRYZ1BEMDNzcG8ySEFzTW5DS1A2bDJw?=
 =?utf-8?B?eVluSm1hby85WkRpQWdFcmEvY1JXY1hISndnZEk1bmhmdEt2R0s5cWxLVDd2?=
 =?utf-8?B?c0JKN0RKeDhsTUtrcVVGU0o3SmtmRlUwUTFhamROL2JNS1dmdm5zV090bkk0?=
 =?utf-8?B?QW1DTTBFak1tU3Y1VFhhS3NuYmVKLzhyYms0VnpWNnVkbDEweUVWS3BTN0JF?=
 =?utf-8?B?M2pKMFMxNzJ2QzZTS1QwL0Y4OXovYzhHNm5aaXZsYThacTU0T2FZVTd6dVdW?=
 =?utf-8?B?S0VTcDNCWW9zY2szSEMrS2U2cHB0bDZBU3hxZmZBPT0=?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4194D92D05B4794A8D9C5F07F09328A6@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6addee02-cda7-43d1-3a9c-08d8c17af0dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2021 21:48:24.1188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DyvP5DrrE8Hy65I+xd53wOQzWGHt4Gennrn6IN9SfmJQwyH/l8Pwgg9q6gZu9SOQHqO6/FllFpwbLZRvO6G+8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5550
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=65246ce22=Dmitry.Fomichev@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gTW9uLCAyMDIxLTAxLTI1IGF0IDA4OjI1ICswMTAwLCBLbGF1cyBKZW5zZW4gd3JvdGU6DQo+
IE9uIEphbiAxOSAxNDo1NCwgS2xhdXMgSmVuc2VuIHdyb3RlOg0KPiA+IEZyb206IEtsYXVzIEpl
bnNlbiA8ay5qZW5zZW5Ac2Ftc3VuZy5jb20+DQo+ID4gDQo+ID4gUGF0Y2ggWzEvMl0gZml4ZXMg
dGhlIHpvbmUgYXBwZW5kIGJ1ZyByZXBvcnRlZCBieSBOaWtsYXMuIFsyLzJdDQo+ID4gcmVmYWN0
b3JzIHRoZSB6b25lIHdyaXRlIGNoZWNrIGZ1bmN0aW9uIHRvIHJldHVybiBzdGF0dXMgY29kZXMg
aW4gYQ0KPiA+IGRpZmZlcmVudCBvcmRlciBpZiB0aGVyZSBhcmUgbXVsdGlwbGUgem9uZSB3cml0
ZSB2aW9sYXRpb25zIHRoYXQgYXBwbHkuDQo+ID4gDQo+ID4gS2xhdXMgSmVuc2VuICgyKToNCj4g
PiDCoMKgaHcvYmxvY2svbnZtZTogZml4IHpvbmUgYm91bmRhcnkgY2hlY2sgZm9yIGFwcGVuZA0K
PiA+IMKgwqBody9ibG9jay9udm1lOiByZWZhY3RvciB0aGUgbG9naWMgZm9yIHpvbmUgd3JpdGUg
Y2hlY2tzDQo+ID4gDQo+ID4gwqBody9ibG9jay9udm1lLmMgICAgICAgfCA4OSArKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gwqBody9ibG9jay90cmFjZS1l
dmVudHMgfCAgNSArKysNCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwg
NDYgZGVsZXRpb25zKC0pDQo+ID4gDQo+IA0KPiBQaW5naW5nIGZvciBhIHJldmlldy4gRG1pdHJ5
IG1heWJlPw0KDQpJIGFtIHRlc3RpbmcgaXQgbm93LCB3aWxsIHBvc3QgbXkgcmV2aWV3IHNob3J0
bHkuDQoNCkRGDQo=

