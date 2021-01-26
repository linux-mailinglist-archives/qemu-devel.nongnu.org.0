Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64815303381
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 05:58:11 +0100 (CET)
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4GQc-0001LU-Gq
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 23:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=Dmitry.Fomichev@wdc.com>)
 id 1l4GOO-0000pQ-6Q; Mon, 25 Jan 2021 23:55:52 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:14107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=Dmitry.Fomichev@wdc.com>)
 id 1l4GOK-0004WR-NT; Mon, 25 Jan 2021 23:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611636948; x=1643172948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fYFmayqwQ4zdFPz41OHlGSNv9E/4OnI7KGVELTwYG18=;
 b=IWFXjJHm/vqsuHj6wfq8jGEZq+eP3dIejq5LwRG/fVpYOGYXkF8W//l7
 Hx1dZGzs4wfDreqkB1bJSwz8R1KLk/Z/jrRsNP31JJ5MZHc0H/FK/P21N
 ASuJfqUeou04LGYxPGkBOHZPeZGUE235C6JKNuQheg19cVYM7OiP+aCR4
 rjdVKko9u4k1GenMwKjiDcSmA24FDriYYeBObkwTSU2siyQDYm376/oGf
 JJtr/OyNl+6At6/BvEh3rA+9VkOgBpzmWtlARpWi0jG+u6Sbth7BxEntW
 QXanNE/eE7Sv0YGQqv7K98YV8Bzo/SDHXJXngaBLIa7GxNQTHsXuYPNAU Q==;
IronPort-SDR: Yx2l6SXoxrMC5tBeVzl4Gl57fBvalULMKmipcSdHfBrDfsvGK+PVPokoc5D9wEG/Jki0SP5AHD
 DEzI6fOB75753nv3wFUxkpKb38ez9V79zHqbQOGsOTLgM6oYc+lM9xNsxl2UlimeMFDhLT599e
 Zdlv5gl1zRSSkKueCCSD6+875+9WLGoGISomGshtgIWrO7Z1cxbWh21LVbYQjYcGE9YQWRyGsw
 q0cNPQRDlzNXjVdouQ3VBQptRCvoo3EWUX+ewrVvtdrNnNlrLdfIbCfNkyOwI1T20I4SV3uFPo
 jbE=
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; d="scan'208";a="158317840"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 12:55:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StPqQYxQTQhpG9XceGniCLENwAdbPLC7zl76ebdo+qa1tSxvEp7GuqJLQa7ENKoyb3Kx+qbwQfHIGX9iUH6KoIE7duB+ay7QYroNgTo+qc6vHCV/cfpvtPiGIvm8KykwJEqND+gwWSo+BsUml4ZoE04II3A+0yXR50I3t7zHOrHAFWsayvplDaEAMYpGHMtUsROcPVrXDZQlTCrr9gP5gFBb3hv7ut/VZScmIH75iPehvSwdB5aUkARoCifnYTj6+EiJYvWjErVqToKR5gx86htW4ucmFW4D3NIew9e7v2aaFy56KCTaqrIjUFIEqMCPO8B0OyRTrWChTUR2NhchxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYFmayqwQ4zdFPz41OHlGSNv9E/4OnI7KGVELTwYG18=;
 b=hQxSqyEZc78rJ3pMaLh/8D7ytArMlxIRgcbuvlC+1EHkVS/0R7imHJEUWB8zlst3049HmiPS7HPjTuzjJBjYbQFHSYezZI2ovqDXYP6k2mZ4QArL1ehy0LU3Lpb1dvxrMDj0RRC777EgoJdOgZrIdpeFWRcHXAx7yTMXD4dgKzXG0w1x8IEnjBgGkVt1Q0iX0d5WFOdd1VfCa+aMMRS6F+UtXy4bRaT5sBQ+iJCt//b8GDzlwnekA4GQIM9kV0KsqCncIl+/EvE4X+PAlBrZV1vwOU7kMLhZpCHvf6wwn3+UZSUOKU2Erqtk1oFVl05d7NN9zOBeaj1ftByUASn7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYFmayqwQ4zdFPz41OHlGSNv9E/4OnI7KGVELTwYG18=;
 b=xaxOK5tqjVTz2xZvrm2O+WDAwxt3oHCgff9Lz11CF1FrFzmoI1Gzztyln0nMW1V7azDwsOZdH9OsmxGJsG3L61XJrDYHd4lGNZ1wBrJbVWFX+OhrsHE62t3QOr+JdU1pSGCy1zTQxMVC16cVNOHxNZv9OHZlE3mrygrwWBAqU+0=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MN2PR04MB5517.namprd04.prod.outlook.com (2603:10b6:208:d6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 04:55:41 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617%4]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 04:55:41 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "its@irrelevant.dk" <its@irrelevant.dk>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/2] hw/block/nvme: fix zone boundary check for append
Thread-Topic: [PATCH 1/2] hw/block/nvme: fix zone boundary check for append
Thread-Index: AQHW7mq0Cpj1owp7B0uhK6xZbWM89Ko5YYaA
Date: Tue, 26 Jan 2021 04:55:41 +0000
Message-ID: <16895b0f976dbe50ddde73bf8211a1bf74ba5870.camel@wdc.com>
References: <20210119135500.265403-1-its@irrelevant.dk>
 <20210119135500.265403-2-its@irrelevant.dk>
In-Reply-To: <20210119135500.265403-2-its@irrelevant.dk>
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
x-ms-office365-filtering-correlation-id: a584e107-b2af-4c91-6d49-08d8c1b6a1e6
x-ms-traffictypediagnostic: MN2PR04MB5517:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB551711F3A42135C3B1267946E1BC9@MN2PR04MB5517.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AC+vNoUssl7D+YjSb0V1aGAIJWbQxNz4wQ6q3ihqkGHVynGlHnAO3C9fSjoDZyyeX+SommfHjw0M/JgnQOeEJbFGsIiZoOpL/hygijR9vD57d5NY1A9LmI0qlUWlrlQivd7w+EDjbVF88pR3uGWHsWtNmySaZlE+YfDB245auXtK7pOurniw8uhd2AK4QdDfx7b7E9cpPcbkCX0qNG4Afg5rAklluqJeWnWJgkrDMmkOrNMp7aqX4os/7IxqrS6cBxNCzLjE5rCMClKQ/FKS66f0mDmXQtHxhkJXXLtdMCHn14x3KQGPxGdaBmqV1PDzhQ6Z/N1lB6MIu6fwOaulR+THYLeXcObaPNQzPWwv8O+xlOtITqCG3oeILff8XID2wtt8p4wIFBFyMOsJ99j7Ow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(5660300002)(86362001)(83380400001)(8676002)(316002)(36756003)(54906003)(8936002)(71200400001)(26005)(186003)(66946007)(4326008)(6486002)(66476007)(66556008)(66446008)(6506007)(76116006)(2906002)(2616005)(6512007)(110136005)(64756008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SnVXdlAzVk5qTFAzbmFXQ3lYaVhZbTZTelNPZ2tpY2Nib25UaHVnK1o3U3B2?=
 =?utf-8?B?MDQzeEhGT0hpdWFxMTZzSE5yNzVqMTkreVpSMkxLS1dRQlVFN3NJbk10czZQ?=
 =?utf-8?B?ZFhmb29XdG5nMjRreXZqWVROWTg3Y05OYUNIVlVwSU9VRG8wejdMc1Rxc1ht?=
 =?utf-8?B?Z3lpMzA3dmFMU3pqZUVSWFZVdHNXSjhQcHJKQTZrb25RZko2UVJwTVFlTG8y?=
 =?utf-8?B?d0d5cFJ5b1BIU1FwVXhROTIzWktMeXVNaXF4QzdBbjQvb1ZPR05hTFdSNldO?=
 =?utf-8?B?RHI1L3F5ay9xVmNTSUtudThBQWxORU1pSFZoejZIWGJXUVd0MlByRlpjR2JV?=
 =?utf-8?B?QnNnMjljTmlGVzBlQndidTEvSXduajd5ZG5KeG5temw3ajB3V25mMUtVUWNk?=
 =?utf-8?B?dmk1cjY5OHJpWEtYSDVVQzZjNXVETm9naXcvQk56Y2VNYlFLVUNOazdoSHhT?=
 =?utf-8?B?QVVaVDdDWWdQamFzNG5TS2M2V0lucDFReHNON1pyNFROdm1pdlV3YXVXcWR4?=
 =?utf-8?B?aExVVGhRamo3WFNWUXdwRGpmSHRkQ0JicFdOVFIwd0xTWE1yVmkxREgybVFu?=
 =?utf-8?B?NUVBdnZsNGhVUlQyb0k0U0l0aDhERDdaMTlQaDZoK21NblAzY1JrYis2R1U2?=
 =?utf-8?B?ZzlaWFpTUkV0OG5JU1NuS20rUFlOSyt3ZlpWRzlzZjV0bVh0RjNLa1NBcmhU?=
 =?utf-8?B?QmsxaUYwaitueDRPVEJSZUJCSHdCdGtzV0wwMFpoa3JsVmdKWVFrSFBHaXNO?=
 =?utf-8?B?eTFFbnVrdzMrZlU1Z2ZTYlp1bTFjOVRBUjBuc29EN3Yyb2hDTTN0ZUpUZU42?=
 =?utf-8?B?eWdzM21iNkdOWGZRYlFyWlhDWjl0Y0U5SHV3Ty84enlVejdJUzdvbURZOHdv?=
 =?utf-8?B?TE8xSkdvSnNPR0tFeUZENXI1aENpVCsrRC9TZWNWSlBFRFpnblVRUFFNMGJB?=
 =?utf-8?B?by94NU10RTBROWc0U05VcUNVQUtSdmNucWZsMmZ6bStGblIvZDNtU09uWmRk?=
 =?utf-8?B?L2xNVFkweXVtMGlWaHdXUnlxVXRUcUgwTFpBaGU5Q2Q3UEQrcEkrQmtCZldm?=
 =?utf-8?B?Y202dlQ4VEVUaGxBaHVNUTQrcXp3Y2JUdUl0N1pFRVBSVmlHcXBSaTlaKzFK?=
 =?utf-8?B?VERmQVdCL1QxSVh0L0Zjdzd4UEU0Mko2VUFqQld6NVFnMUc2Sm9BelBMYmNm?=
 =?utf-8?B?ZXcwUXY5bThJTFd5b3RJUzQrTHdjNGVFMXNvZnBaMjllT0t1T1JHcy9FblR3?=
 =?utf-8?B?M1lBQVRWUkxWZGlRS0toNWh4WWppSXRGTFQ4WGh2VmhyVmhiUEZvL2FyaHJG?=
 =?utf-8?B?Yy9sMWEzd3YrYW1sUVRxSGt5Vi9qR1dLZ1k0K2s4ZFNlWnVFa21WK2M1R2ox?=
 =?utf-8?B?QzBwbjJidmI1aURmV1RFd2tmNHFXOThCRjhTWlo2QnF4Z0hKZXJUVW9QY1Ry?=
 =?utf-8?B?K0ZrNTBDbHVUa1VaZ0x2SXIzK2lwb2d3dk1QOGh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A5A09D6438530489EB3AC3F60739EF1@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a584e107-b2af-4c91-6d49-08d8c1b6a1e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 04:55:41.6357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pfRttNv+5eXJmPbE70euFcatSCovL4oDFFaGrNsegtvRCeEI4PkcjPjJb3hsZ6v2NzEXPLZj43bH1HFdEbLlEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5517
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=653775e38=Dmitry.Fomichev@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
 Niklas Cassel <Niklas.Cassel@wdc.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVHVlLCAyMDIxLTAxLTE5IGF0IDE0OjU0ICswMTAwLCBLbGF1cyBKZW5zZW4gd3JvdGU6DQo+
IEZyb206IEtsYXVzIEplbnNlbiA8ay5qZW5zZW5Ac2Ftc3VuZy5jb20+DQo+IA0KPiBXaGVuIGEg
em9uZSBhcHBlbmQgaXMgcHJvY2Vzc2VkIHRoZSBjb250cm9sbGVyIGNoZWNrcyB0aGF0IHZhbGlk
aXR5IG9mDQo+IHRoZSB3cml0ZSBiZWZvcmUgYXNzaWduaW5nIHRoZSBMQkEgdG8gdGhlIGFwcGVu
ZCBjb21tYW5kLiBUaGlzIGNhdXNlcw0KPiB0aGUgYm91bmRhcnkgY2hlY2sgdG8gYmUgd3Jvbmcu
DQo+IA0KPiBGaXggdGhpcyBieSBjaGVja2luZyB0aGUgd3JpdGUgKmFmdGVyKiBhc3NpZ25pbmcg
dGhlIExCQS4gUmVtb3ZlIHRoZQ0KPiBhcHBlbmQgc3BlY2lhbCBjYXNlIGZyb20gdGhlIG52bWVf
Y2hlY2tfem9uZV93cml0ZSBhbmQgb3BlbiBjb2RlIGl0IGluDQo+IG52bWVfZG9fd3JpdGUsIGFz
c2lnbmluZyB0aGUgc2xiYSB3aGVuIGJhc2ljIHNhbml0eSBjaGVja3MgaGF2ZSBiZWVuDQo+IHBl
cmZvcm1lZC4gVGhlbiBjaGVjayB0aGUgdmFsaWRpdHkgb2YgdGhlIHJlc3VsdGluZyB3cml0ZSBs
aWtlIGFueSBvdGhlcg0KPiB3cml0ZSBjb21tYW5kLg0KPiANCg0KS2xhdXMsDQoNCkkgdGVzdGVk
IHRoaXMgc2VyaWVzIGFuZCBpdCB3b3JrcyBmaW5lLiBJIGhvd2V2ZXIgdGhpbmsgdGhhdCB0aGUg
cHJvYmxlbSB0aGF0DQpOaWtsYXMgaGFzIGZvdW5kIGNhbiBiZSBmaXhlZCBpbiB0aGUgbXVjaCBz
aW1wbGVyIHdheSBieSBhcHBseWluZyB0aGUNCmZvbGxvd2luZyB0byB0aGUgZXhpc3RpbmcgY29k
ZSAtDQoNCi0tLSBhL2h3L2Jsb2NrL252bWUuYw0KKysrIGIvaHcvYmxvY2svbnZtZS5jDQpAQCAt
MTE1Miw2ICsxMTUyLDkgQEAgc3RhdGljIHVpbnQxNl90IG52bWVfY2hlY2tfem9uZV93cml0ZShO
dm1lQ3RybCAqbiwgTnZtZU5hbWVzcGFjZSAqbnMsDQogICAgICAgICAgICAgICAgIHRyYWNlX3Bj
aV9udm1lX2Vycl9hcHBlbmRfbm90X2F0X3N0YXJ0KHNsYmEsIHpvbmUtPmQuenNsYmEpOw0KICAg
ICAgICAgICAgICAgICBzdGF0dXMgPSBOVk1FX0lOVkFMSURfRklFTEQ7DQogICAgICAgICAgICAg
fQ0KKyAgICAgICAgICAgIGlmICh6b25lLT53X3B0ciArIG5sYiA+IG52bWVfem9uZV93cl9ib3Vu
ZGFyeSh6b25lKSkgew0KKyAgICAgICAgICAgICAgICBzdGF0dXMgPSBOVk1FX1pPTkVfQk9VTkRB
UllfRVJST1I7DQorICAgICAgICAgICAgfQ0KICAgICAgICAgICAgIGlmIChudm1lX2wyYihucywg
bmxiKSA+IChuLT5wYWdlX3NpemUgPDwgbi0+emFzbCkpIHsNCiAgICAgICAgICAgICAgICAgdHJh
Y2VfcGNpX252bWVfZXJyX2FwcGVuZF90b29fbGFyZ2Uoc2xiYSwgbmxiLCBuLT56YXNsKTsNCiAg
ICAgICAgICAgICAgICAgc3RhdHVzID0gTlZNRV9JTlZBTElEX0ZJRUxEOw0KDQpJIGFtIGdvaW5n
IHRvIHNlbmQgYSBmZXcgcGF0Y2hlcyB0aGF0IHRha2UgdGhpcyBhcHByb2FjaCwgcGxlYXNlIHRh
a2UgYSBsb29rLiBJbiBteQ0KdGVzdGluZywgaXQgd29ya3MganVzdCBhcyB3ZWxsIDopDQoNCj4g
DQo+IEluIHRoZSBwcm9jZXNzLCBhbHNvIGZpeCBhIG1pc3NpbmcgZW5kaWFubmVzcyBjb252ZXJz
aW9uIGZvciB0aGUgem9uZQ0KPiBhcHBlbmQgQUxCQS4NCg0KR3JlYXQgY2F0Y2ghIFRoaXMgY291
bGQgYmUgcGxhY2VkIHRvIGEgc2VwYXJhdGUgcGF0Y2ggdGhvdWdoLi4uDQpBIGZldyBtb3JlIGNv
bW1lbnRzIGJlbG93Lg0KDQoNClJlcG9ydGVkLWJ5OiBOaWtsYXMgQ2Fzc2VsIDxOaWtsYXMuQ2Fz
c2VsQHdkYy5jb20+DQpDYzogRG1pdHJ5IEZvbWljaGV2IDxkbWl0cnkuZm9taWNoZXZAd2RjLmNv
bT4NClNpZ25lZC1vZmYtYnk6IEtsYXVzIEplbnNlbiA8ay5qZW5zZW5Ac2Ftc3VuZy5jb20+DQot
LS0NCsKgaHcvYmxvY2svbnZtZS5jIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KwqAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjIg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9ody9ibG9jay9udm1lLmMgYi9ody9ibG9jay9u
dm1lLmMNCmluZGV4IDMwOWMyNmRiOGZmNy4uZjA1ZGVhNjU3YjAxIDEwMDY0NA0KLS0tIGEvaHcv
YmxvY2svbnZtZS5jDQorKysgYi9ody9ibG9jay9udm1lLmMNCkBAIC0xMTMzLDcgKzExMzMsNyBA
QCBzdGF0aWMgdWludDE2X3QgbnZtZV9jaGVja196b25lX3N0YXRlX2Zvcl93cml0ZShOdm1lWm9u
ZSAqem9uZSkNCsKgDQrCoHN0YXRpYyB1aW50MTZfdCBudm1lX2NoZWNrX3pvbmVfd3JpdGUoTnZt
ZUN0cmwgKm4sIE52bWVOYW1lc3BhY2UgKm5zLA0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTnZtZVpv
bmUgKnpvbmUsIHVpbnQ2NF90IHNsYmEsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50MzJfdCBubGIsIGJvb2wgYXBwZW5kKQ0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDMyX3QgbmxiKQ0KwqB7DQrCoMKgwqDCoMKgdWludDE2X3Qg
c3RhdHVzOw0KwqANCkBAIC0xMTQ3LDE2ICsxMTQ3LDggQEAgc3RhdGljIHVpbnQxNl90IG52bWVf
Y2hlY2tfem9uZV93cml0ZShOdm1lQ3RybCAqbiwgTnZtZU5hbWVzcGFjZSAqbnMsDQrCoMKgwqDC
oMKgwqDCoMKgwqB0cmFjZV9wY2lfbnZtZV9lcnJfem9uZV93cml0ZV9ub3Rfb2soc2xiYSwgbmxi
LCBzdGF0dXMpOw0KwqDCoMKgwqDCoH0gZWxzZSB7DQrCoMKgwqDCoMKgwqDCoMKgwqBhc3NlcnQo
bnZtZV93cF9pc192YWxpZCh6b25lKSk7DQotICAgICAgICBpZiAoYXBwZW5kKSB7DQotICAgICAg
ICAgICAgaWYgKHVubGlrZWx5KHNsYmEgIT0gem9uZS0+ZC56c2xiYSkpIHsNCi0gICAgICAgICAg
ICAgICAgdHJhY2VfcGNpX252bWVfZXJyX2FwcGVuZF9ub3RfYXRfc3RhcnQoc2xiYSwgem9uZS0+
ZC56c2xiYSk7DQotICAgICAgICAgICAgICAgIHN0YXR1cyA9IE5WTUVfSU5WQUxJRF9GSUVMRDsN
Ci0gICAgICAgICAgICB9DQotICAgICAgICAgICAgaWYgKG52bWVfbDJiKG5zLCBubGIpID4gKG4t
PnBhZ2Vfc2l6ZSA8PCBuLT56YXNsKSkgew0KLSAgICAgICAgICAgICAgICB0cmFjZV9wY2lfbnZt
ZV9lcnJfYXBwZW5kX3Rvb19sYXJnZShzbGJhLCBubGIsIG4tPnphc2wpOw0KLSAgICAgICAgICAg
ICAgICBzdGF0dXMgPSBOVk1FX0lOVkFMSURfRklFTEQ7DQotICAgICAgICAgICAgfQ0KLSAgICAg
ICAgfSBlbHNlIGlmICh1bmxpa2VseShzbGJhICE9IHpvbmUtPndfcHRyKSkgew0KKw0KKyAgICAg
ICAgaWYgKHVubGlrZWx5KHNsYmEgIT0gem9uZS0+d19wdHIpKSB7DQrCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHRyYWNlX3BjaV9udm1lX2Vycl93cml0ZV9ub3RfYXRfd3Aoc2xiYSwgem9uZS0+
ZC56c2xiYSwNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHpvbmUtPndf
cHRyKTsNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVzID0gTlZNRV9aT05FX0lOVkFM
SURfV1JJVEU7DQpAQCAtMTI5NCwxMCArMTI4Niw5IEBAIHN0YXRpYyB2b2lkIG52bWVfZmluYWxp
emVfem9uZWRfd3JpdGUoTnZtZU5hbWVzcGFjZSAqbnMsIE52bWVSZXF1ZXN0ICpyZXEsDQrCoMKg
wqDCoMKgfQ0KwqB9DQrCoA0KLXN0YXRpYyB1aW50NjRfdCBudm1lX2FkdmFuY2Vfem9uZV93cChO
dm1lTmFtZXNwYWNlICpucywgTnZtZVpvbmUgKnpvbmUsDQotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQzMl90IG5sYikNCitzdGF0aWMgdm9pZCBudm1lX2FkdmFuY2Vf
em9uZV93cChOdm1lTmFtZXNwYWNlICpucywgTnZtZVpvbmUgKnpvbmUsDQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgbmxiKQ0KwqB7DQotICAgIHVpbnQ2NF90IHJl
c3VsdCA9IHpvbmUtPndfcHRyOw0KwqDCoMKgwqDCoHVpbnQ4X3QgenM7DQrCoA0KwqDCoMKgwqDC
oHpvbmUtPndfcHRyICs9IG5sYjsNCkBAIC0xMzEzLDggKzEzMDQsNiBAQCBzdGF0aWMgdWludDY0
X3QgbnZtZV9hZHZhbmNlX3pvbmVfd3AoTnZtZU5hbWVzcGFjZSAqbnMsIE52bWVab25lICp6b25l
LA0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBudm1lX2Fzc2lnbl96b25lX3N0YXRlKG5zLCB6
b25lLCBOVk1FX1pPTkVfU1RBVEVfSU1QTElDSVRMWV9PUEVOKTsNCsKgwqDCoMKgwqDCoMKgwqDC
oH0NCsKgwqDCoMKgwqB9DQotDQotICAgIHJldHVybiByZXN1bHQ7DQrCoH0NCg0KwqBzdGF0aWMg
aW5saW5lIGJvb2wgbnZtZV9pc193cml0ZShOdm1lUmVxdWVzdCAqcmVxKQ0KQEAgLTE2OTIsNyAr
MTY4MSwyNCBAQCBzdGF0aWMgdWludDE2X3QgbnZtZV9kb193cml0ZShOdm1lQ3RybCAqbiwgTnZt
ZVJlcXVlc3QgKnJlcSwgYm9vbCBhcHBlbmQsDQrCoMKgwqDCoMKgaWYgKG5zLT5wYXJhbXMuem9u
ZWQpIHsNCsKgwqDCoMKgwqDCoMKgwqDCoHpvbmUgPSBudm1lX2dldF96b25lX2J5X3NsYmEobnMs
IHNsYmEpOw0KDQotICAgICAgICBzdGF0dXMgPSBudm1lX2NoZWNrX3pvbmVfd3JpdGUobiwgbnMs
IHpvbmUsIHNsYmEsIG5sYiwgYXBwZW5kKTsNCisgICAgICAgIGlmIChhcHBlbmQpIHsNCg0KVGhp
cyBpcyB3aGF0IEkgc2VlIGFzIGEgZHJhd2JhY2sgb2YgdGhpcyBhcHByb2FjaC4NCllvdSBoYXZl
IHRvIG1vdmUgdGhlIFpBIGNoZWNrcyB0aGF0IHdlcmUgcHJldmlvdXNseSBuaWNlbHkgdHVja2Vk
IGluDQpudm1lX2NoZWNrX3pvbmVfd3JpdGUoKSB0byB0aGUgc3BvdCBiZWxvdyBhbmQgbm93IHRo
aXMgdmFsaWRhdGlvbiBpcyBkb25lDQppbiB0d28gZGlmZmVyZW50IHBsYWNlcyBmb3IgYXBwZW5k
cyBhbmQgcmVndWxhciB3cml0ZXMuIFRoaXMgY2FuIGJlIGF2b2lkZWQuDQogDQorICAgICAgICAg
ICAgaWYgKHVubGlrZWx5KHNsYmEgIT0gem9uZS0+ZC56c2xiYSkpIHsNCisgICAgICAgICAgICAg
ICAgdHJhY2VfcGNpX252bWVfZXJyX2FwcGVuZF9ub3RfYXRfc3RhcnQoc2xiYSwgem9uZS0+ZC56
c2xiYSk7DQorICAgICAgICAgICAgICAgIHN0YXR1cyA9IE5WTUVfSU5WQUxJRF9GSUVMRDsNCisg
ICAgICAgICAgICAgICAgZ290byBpbnZhbGlkOw0KKyAgICAgICAgICAgIH0NCisNCisgICAgICAg
ICAgICBpZiAobnZtZV9sMmIobnMsIG5sYikgPiAobi0+cGFnZV9zaXplIDw8IG4tPnphc2wpKSB7
DQorICAgICAgICAgICAgICAgIHRyYWNlX3BjaV9udm1lX2Vycl9hcHBlbmRfdG9vX2xhcmdlKHNs
YmEsIG5sYiwgbi0+emFzbCk7DQorICAgICAgICAgICAgICAgIHN0YXR1cyA9IE5WTUVfSU5WQUxJ
RF9GSUVMRDsNCisgICAgICAgICAgICAgICAgZ290byBpbnZhbGlkOw0KKyAgICAgICAgICAgIH0N
CisNCisgICAgICAgICAgICBzbGJhID0gem9uZS0+d19wdHI7DQorICAgICAgICAgICAgcmVzLT5z
bGJhID0gY3B1X3RvX2xlNjQoc2xiYSk7DQoNCkl0IGlzIGEgYml0IHByZW1hdHVyZSB0byBzZXQg
dGhlIHJlc3VsdCBoZXJlIHNpbmNlIHRoZSBudm1lX2NoZWNrX3pvbmVfd3JpdGUoKSBiZWxvdw0K
Y2FuIHN0aWxsIGZhaWwuIEFzIEkgcmVjYWxsLCBBTEJBIGlzIG9ubHkgcmV0dXJuZWQgYnkgYSBz
dWNjZXNzZnVsIGNvbW1hbmQuIEFnYWluLA0KZ29vZCBmaW5kIGFib3V0IGVuZGlhbm5lc3MhDQoN
ClJlZ2FyZHMsDQpEbWl0cnkNCg0KKyAgICAgICAgfQ0KKw0KKyAgICAgICAgc3RhdHVzID0gbnZt
ZV9jaGVja196b25lX3dyaXRlKG4sIG5zLCB6b25lLCBzbGJhLCBubGIpOw0KwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKHN0YXR1cyAhPSBOVk1FX1NVQ0NFU1MpIHsNCsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZ290byBpbnZhbGlkOw0KwqDCoMKgwqDCoMKgwqDCoMKgfQ0KQEAgLTE3MDIsMTEgKzE3
MDgsNyBAQCBzdGF0aWMgdWludDE2X3QgbnZtZV9kb193cml0ZShOdm1lQ3RybCAqbiwgTnZtZVJl
cXVlc3QgKnJlcSwgYm9vbCBhcHBlbmQsDQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8g
aW52YWxpZDsNCsKgwqDCoMKgwqDCoMKgwqDCoH0NCsKgDQoNCi0gICAgICAgIGlmIChhcHBlbmQp
IHsNCi0gICAgICAgICAgICBzbGJhID0gem9uZS0+d19wdHI7DQotICAgICAgICB9DQotDQotICAg
ICAgICByZXMtPnNsYmEgPSBudm1lX2FkdmFuY2Vfem9uZV93cChucywgem9uZSwgbmxiKTsNCisg
ICAgICAgIG52bWVfYWR2YW5jZV96b25lX3dwKG5zLCB6b25lLCBubGIpOw0KwqDCoMKgwqDCoH0N
CsKgDQoNCsKgwqDCoMKgwqBkYXRhX29mZnNldCA9IG52bWVfbDJiKG5zLCBzbGJhKTsNCg0K

