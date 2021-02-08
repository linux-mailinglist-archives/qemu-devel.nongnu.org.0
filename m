Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A75F312883
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 01:16:05 +0100 (CET)
Received: from localhost ([::1]:54344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8uDk-0001Ir-0y
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 19:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=666759579=Dmitry.Fomichev@wdc.com>)
 id 1l8uBW-0000Oe-8A; Sun, 07 Feb 2021 19:13:46 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:9466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=666759579=Dmitry.Fomichev@wdc.com>)
 id 1l8uBT-0000z0-LP; Sun, 07 Feb 2021 19:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612743223; x=1644279223;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4ORLU4VyZXC41gUstgESzr1v+MvXJgZX2Ti9dMpNT/A=;
 b=gB3zDvOohhML7DLY2d++tDihv6VKy49nWRiwIVrmTvhptwp4WvxNSlge
 sHWEf8sqFgyTTZr6KOO9ii5vmiLnqpau0CvzibgfHdwTJe3tPfYva0Ykx
 O6q3xfghETI3RyF/n8Vj3bi9F0RyBJyieCxNXd9T8r7uyY7gD987C6CqT
 w57FpGwm+QbqAoZej9imM1iqZ2QyTj/8BOLKFVqDAT3ecgIuNNxpZR+qp
 pdDwVHhemTrBVEn/ALgZylpSQlTLDrRwv7t3XRYopHqV1YzQe6XxCX4FN
 UVMoebyq59ysWPxfzqNVPG9wmEqvXYHnW3ksuABz7RDOJMxwn3E/PqzL8 w==;
IronPort-SDR: 60lVXzXj7T0gNvoait9YvSW0l4InMmxHzUW+GdLbZsCgA24ynC1BKMr4j2cPhYSTDIw22w4jZw
 KxRsJpWCeZudgZLo9HO3hrY6rYKxUhYrQM1cL2P+k4WH0mMUZH4c3cggKbfIAkB4Hdq0MAJfjn
 +JOLcy/V9LMqVB+m7xfyHdNUGxXkc5QUSNboZy4yP0Rlud9tmuVmGdqiIlDYAxQqKRI+lzpxWq
 kr561Dv/9gQ3qYDDGtsPzqsdGDW7tQyhK1u+vc8b32k3SF2lndjDY6p8wXe5k290htIAkDFEnf
 dsc=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="269863839"
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 08:13:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGwlA1e4stbaz5g9CKRndSgQaMKUKiCVAKL2MyVwNeC23xxbJEOyq8tffjNYsZgx06Qc+PNsZGwJN+5RebEVVqvhUBiuo9vzjNQClu4JcMUm6XSFqmGW+VX2xn1JxM3C+n+AN2rsmeOT75LjEKIy2oU+OoNYYThCL1qTyrgtcCYqSdF846jiWqnlyYM4VRP1untfJ7cIUzar1NVs4jSMJp3ZtvvZyFv86eUHAA38fEPxx3H4PUqUkshdyLQZKi0Otlf4uiBOCpFKe7rcJhIbx0KrWyAk9vIWLcz3PySQvSGDmNl0e8MA/lKhIwZrOVluNSb+3WyOZ7LXj1hASjAmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ORLU4VyZXC41gUstgESzr1v+MvXJgZX2Ti9dMpNT/A=;
 b=B6KtsPuDkcCJuT43ef90YGt/XK/62BQ+brKmpKFbGHPnfy6aUoUFki8rp5DNi4Fvw0RcEnqmc9biE/+fp/pJhrFa4/asRqHuBDInPO3Sxv238CcwLJMtKl6LQKQ7YyTRiS3MXD0ACcl+dyS6j6b5kOzAkwsxK6+llA3FiRPPnIui0czr2zBAn/xyhtUETC8b6MldoOH8dO2I6tTsqCrnla+S6ii9rvecGSPCpolSYNYYbY4syg2ibHsV3gcyE/7vNArZbrkZf/RZWFJCw10UCZEL2xKZvXdfIpH8Fbcw6p6u3aSxLUsCoN5dRgoYnyuKNSCgT5AYFLEt93vd1OB1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ORLU4VyZXC41gUstgESzr1v+MvXJgZX2Ti9dMpNT/A=;
 b=tYzi5I4S4dYgubQCh3aN0sZ0m0UC7/GhlT02jXkegFndWHTTV6rkl5g46gqj4BlqNByNw1J6neekyNMFBZ3v5do9+uaAh7ycfPoEwsWAJzQIZiBDoaQcR5hmOlfnREoWA9yX8p0FEH18f56yBg+8Sy9Jz0RrLtDmJDNuXMnYHjA=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MN2PR04MB6141.namprd04.prod.outlook.com (2603:10b6:208:da::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.25; Mon, 8 Feb
 2021 00:13:35 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617%4]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 00:13:35 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "its@irrelevant.dk" <its@irrelevant.dk>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] hw/block/nvme: add missing mor/mar constraint checks
Thread-Topic: [PATCH v2] hw/block/nvme: add missing mor/mar constraint checks
Thread-Index: AQHW89z/r7VLn94gKkKlal62WuB+8KpNdsAA
Date: Mon, 8 Feb 2021 00:13:35 +0000
Message-ID: <8f17c20687867bf2916ee44ef22211887ef349eb.camel@wdc.com>
References: <20210126121529.317189-1-its@irrelevant.dk>
In-Reply-To: <20210126121529.317189-1-its@irrelevant.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 (3.38.2-1.fc33) 
authentication-results: irrelevant.dk; dkim=none (message not signed)
 header.d=none;irrelevant.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [100.35.209.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7ca2c1ef-5ab4-40f3-7b02-08d8cbc66068
x-ms-traffictypediagnostic: MN2PR04MB6141:
x-microsoft-antispam-prvs: <MN2PR04MB61416D274FBA9CD3B3055F3CE18F9@MN2PR04MB6141.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tGzb3ikkfn4ELVpp/gk/+MUY4ylRGyXkTxU9RhAxtMsogFp5/OJfBoL6ytiMxxbZBYvrPIsoT06lLXI98QXTkEKhyNUUQrJZBbZjJ6JLbN2ZAlci+ilo6TexBZAsNQZoFkTEjPU3nFgeZek75g7yPQqz5ty6zGCEM/S6SQxYyjzgQcM7sDkFjR0q2p2+vPZPSyx8zserCT3zWcNSsNggKjnJ2cnHGVG7HZvFtgz1rdCMIj8K5ig7yj9FhQcif0owVsL+XV+wgXjeTnV9e0nfBWjgvFz3fJDxqNCoAF6EJxbRHM6387nFacOPpq5U3TyMATtO9lPN/ussFqZesKEhxhiUrubYIdu7d5Z7RYT5m3FnS28pq9Q3VsTz+oyLTZfjeFkQA8E3Bh0JK051uY8xkokEZVfyLfEuZzwt8icYViWz9Q9pJF0N2Jcy34LtsoTKN9dIToV5VSVvdQF4kkQ3ytXlZadqPOu8s8hd1PCN2zonKkM9l/qlIAQpDMVfcyZa4xVl6j8o8AQUqdY7MeOKjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(478600001)(110136005)(4326008)(26005)(316002)(66476007)(71200400001)(6486002)(186003)(83380400001)(8936002)(86362001)(2616005)(36756003)(66556008)(66946007)(8676002)(6506007)(64756008)(2906002)(66446008)(5660300002)(76116006)(54906003)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bmhvWnFMTE9VaHZ5RVFoMzhuMHk0VXY1VXp5Qzg2OTR0aGxqQitCWnlvdGts?=
 =?utf-8?B?WGFnMTU0MjRjdmVRTGRHQWFKZ0gyOUJEcFpJNERGdW1VT2tHVmRuQUlPL0kz?=
 =?utf-8?B?cW1aWWVZdERUb3lqZWIyaDlLSTVDYStKMFQzZGVDOHdtSjMrOGU3ZnJjem5s?=
 =?utf-8?B?RDBiVTN2Q0FVMjBqL2szRXpHeUZkZ3hRY1g0STljOEVIZ3NzK2dscENKYU5S?=
 =?utf-8?B?dEdOYXFQRmo4UDB1ZmVjeDVXMEFGUzYyMzVyWUtpRjFpcm10eDlsclpFVVht?=
 =?utf-8?B?TFNRN1QzYlFQV0o2TFk5WXo1RUFDTUhJa25Vc0MrNkNwZnczdkgvNzdkdWd6?=
 =?utf-8?B?U1JTK3FKd1ltNllIMHN4WDRuK2Y4MlVyT0kyUGFuVHFndnNVdzhBWmdRUUQ3?=
 =?utf-8?B?YVpIYU1oZVpwTVhsbE43YlNNSXhRS3VoWVVoSjArQ2x2d244YkQ3RGdYV2U4?=
 =?utf-8?B?Q25FZWdqNVVjNlpxQnhGd0F3R2NwOXdITUZ0ZFVWZ0ZzVVI5bFBFTDV1b21W?=
 =?utf-8?B?ZTU4SDgraXFyb3lxdmtXK0FVTHhRbk9GKzAwQkV6cWkrRUd6U056S2xoY2hs?=
 =?utf-8?B?cUpLR1Arc1Bodk9ZbzArb2FPODZzOUo0UjBZMnA3TjhRVm11bUZLVU52R0Uz?=
 =?utf-8?B?SVVuVDM1WE9KZzlvUE9rdkUzNzlHZ2FpUkFyUDJkQ3dmRlAvMjBZSkdOTWlG?=
 =?utf-8?B?MnA0Sm04STFDZUM3YitSc0lYQ3BJZE1xVlNaNjdiM05VTkhOeWVmRzh0aUtp?=
 =?utf-8?B?VzFYLzZPUmN0THQrQUo5MUtUQlRWd3JOT1J6RitOcWt3RnpxdExCS1JrUzVs?=
 =?utf-8?B?Szd4TjZZeXNvRUxFWjNvY05uODAzV2k5ZGJoOUk1VThzUXVvT1RXUERsVmVr?=
 =?utf-8?B?ek5OZEtycFhvTEo5MW9SZEhKWlBZditwOVplTVUzaU94Yy9WVWMrMmpvbnMy?=
 =?utf-8?B?eU5Td0JETDNId2o1bXU1VDRjZlc1YzdqR0dKN0h3d3cxNHhVRFkvZklLSmhC?=
 =?utf-8?B?ZWsrTGt5bksxb05qak1TUXhJUTJHL0IwZWdaTWJud1hjUFAyTkxDazQydS91?=
 =?utf-8?B?SXJhV2J2dE85NmlrOFRpbEM5cnRRYnMwVmgzWmtlSWIvM1paVGp6akorVldi?=
 =?utf-8?B?clBPWEJBeXd6dkFITFpVMFNsUnl6cVZSbFE2WFhkVHM2VkZzN1dLdUthaDg5?=
 =?utf-8?B?Zkg0dnFBSFJjQmhFQk1iNlRLS3NibDJicVBWTW5IS1RIZGM1WVBTLzRneTRj?=
 =?utf-8?B?WUVFN0tWckJQN0RESDlBak1ZUWNzL0ZOSUZ4ei9LTitNN0xQV00wOG5kenN1?=
 =?utf-8?B?aU9uUmg1ekdYSllmT2liQ0gzbVE0NHVjVVU3RUp6akRCQmhzMHJKeUxZSzUv?=
 =?utf-8?B?ZjNRQXdBT0VJaDJEUHRqV1BVcWRJb1pMUHZqbWRYV0FnTlVQRm54RHpCODMr?=
 =?utf-8?B?N1F3NW84TE03N0Vmajh3TUtVWlp0K0NQOGV6V1RUVTBnVUxNemRpei94UU1q?=
 =?utf-8?B?bWpNWHFqRHBwdGpOUVloa2RPTGRQTktNa3IvS0R0bGQwN1VUTWI0MFhkdzdO?=
 =?utf-8?B?WkFEVXYxUXR1S0xMb3V0dTRVdk5STld4dXhMQi9CTDRPNVFMNWxlNzI0YWNG?=
 =?utf-8?B?WXN6dGc4ZEVhWkFKdkkreGVjSWp0QmJNTGpzc1Q3MUF5Wnl2M1pvR1hXWU9r?=
 =?utf-8?B?eGZuRXFEQkFCVVNINW1yKy9BVkUwZ1E5RVJQUzR3YlhDWkljYTRBcGdJWkcr?=
 =?utf-8?Q?FCUkTCKSgkRxjZyT4HlH6oE0SOCLkRkZGU3OI27?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB7FBA4190989C4983513DC0F342597F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca2c1ef-5ab4-40f3-7b02-08d8cbc66068
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 00:13:35.2839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /O62E0BwL3CiLtlHDa9YppBJmQZSK/N0Yn4BzREI8/++eqQ9ebYRhhRVRYXFd8jrS3FsiFyndVQ0C8O7K6JtMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6141
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=666759579=Dmitry.Fomichev@wdc.com; helo=esa1.hgst.iphmx.com
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
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "anaidu.gollu@samsung.com" <anaidu.gollu@samsung.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVHVlLCAyMDIxLTAxLTI2IGF0IDEzOjE1ICswMTAwLCBLbGF1cyBKZW5zZW4gd3JvdGU6DQo+
IEZyb206IEtsYXVzIEplbnNlbiA8ay5qZW5zZW5Ac2Ftc3VuZy5jb20+DQo+IA0KPiBGaXJzdGx5
LCBpZiB6b25lZC5tYXhfYWN0aXZlIGlzIG5vbi16ZXJvLCB6b25lZC5tYXhfb3BlbiBtdXN0IGJl
IGxlc3MNCj4gdGhhbiBvciBlcXVhbCB0byB6b25lZC5tYXhfYWN0aXZlLg0KPiANCj4gU2Vjb25k
bHksIGlmIG9ubHkgem9uZXMubWF4X2FjdGl2ZSBpcyBzZXQsIHdlIGhhdmUgdG8gZXhwbGljaXRs
eSBzZXQNCj4gem9uZXMubWF4X29wZW4gb3Igd2UgZW5kIHVwIHdpdGggYW4gaW52YWxpZCBNQVIv
TU9SIGNvbmZpZ3VyYXRpb24uIFRoaXMNCj4gaXMgYW4gYXJ0aWZhY3Qgb2YgdGhlIHBhcmFtZXRl
cnMgbm90IGJlaW5nIHplcm9lcy1iYXNlZCBsaWtlIGluIHRoZQ0KPiBzcGVjLg0KPiANCj4gQ2M6
IERtaXRyeSBGb21pY2hldiA8ZG1pdHJ5LmZvbWljaGV2QHdkYy5jb20+DQo+IFJlcG9ydGVkLWJ5
OiBHb2xsdSBBcHBhbGFuYWlkdSA8YW5haWR1LmdvbGx1QHNhbXN1bmcuY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBLbGF1cyBKZW5zZW4gPGsuamVuc2VuQHNhbXN1bmcuY29tPg0KDQpSZXZpZXdlZC1i
eTogRG1pdHJ5IEZvbWljaGV2IDxkbWl0cnkuZm9taWNoZXZAd2RjLmNvbT4NCg0KPiAtLS0NCj4g
DQo+IHYyOg0KPiANCj4gwqDCoCogSnVtcGVkIHRoZSBndW4gb24gcmVtb3ZpbmcgdGhlIGNoZWNr
IG9uIHpvbmVkLm1heF9vcGVuLiBJdCBzaG91bGQNCj4gwqDCoMKgwqBzdGlsbCBiZSBkb25lIHNp
bmNlIHRoZSBkZXZpY2UgbWlnaHQgb25seSBoYXZlIGEgY29uc3RyYWludCBvbiBvcGVuDQo+IMKg
wqDCoMKgem9uZXMsIG5vdCBhY3RpdmUuDQo+IMKgwqAqIEluc3RlYWQsIGFkZGVkIGFuIGV4cGxp
Y2l0IHNldCBvZiB6b25lZC5tYXhfb3BlbiBpZiBvbmx5DQo+IMKgwqDCoMKgem9uZWQubWF4X2Fj
dGl2ZSBpcyBzcGVjaWZlZC4NCj4gDQo+IMKgaHcvYmxvY2svbnZtZS1ucy5jIHwgMTIgKysrKysr
KysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9ody9ibG9jay9udm1lLW5zLmMgYi9ody9ibG9jay9udm1lLW5zLmMNCj4gaW5kZXgg
NjJiMjVjZjY5YmZhLi5kZjUxNDI4N2I1OGYgMTAwNjQ0DQo+IC0tLSBhL2h3L2Jsb2NrL252bWUt
bnMuYw0KPiArKysgYi9ody9ibG9jay9udm1lLW5zLmMNCj4gQEAgLTE1Myw2ICsxNTMsMTggQEAg
c3RhdGljIGludCBudm1lX25zX3pvbmVkX2NoZWNrX2NhbGNfZ2VvbWV0cnkoTnZtZU5hbWVzcGFj
ZSAqbnMsIEVycm9yICoqZXJycCkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC0xOw0KPiDC
oMKgwqDCoMKgfQ0KPiDCoA0KPiANCj4gDQo+IA0KPiArICAgIGlmIChucy0+cGFyYW1zLm1heF9h
Y3RpdmVfem9uZXMpIHsNCj4gKyAgICAgICAgaWYgKG5zLT5wYXJhbXMubWF4X29wZW5fem9uZXMg
PiBucy0+cGFyYW1zLm1heF9hY3RpdmVfem9uZXMpIHsNCj4gKyAgICAgICAgICAgIGVycm9yX3Nl
dGcoZXJycCwgIm1heF9vcGVuX3pvbmVzICgldSkgZXhjZWVkcyBtYXhfYWN0aXZlX3pvbmVzICgl
dSkiLA0KPiArICAgICAgICAgICAgICAgICAgICAgICBucy0+cGFyYW1zLm1heF9vcGVuX3pvbmVz
LCBucy0+cGFyYW1zLm1heF9hY3RpdmVfem9uZXMpOw0KPiArICAgICAgICAgICAgcmV0dXJuIC0x
Ow0KPiArICAgICAgICB9DQo+ICsNCj4gKyAgICAgICAgaWYgKCFucy0+cGFyYW1zLm1heF9vcGVu
X3pvbmVzKSB7DQo+ICsgICAgICAgICAgICBucy0+cGFyYW1zLm1heF9vcGVuX3pvbmVzID0gbnMt
PnBhcmFtcy5tYXhfYWN0aXZlX3pvbmVzOw0KPiArICAgICAgICB9DQo+ICsgICAgfQ0KPiArDQo+
IMKgwqDCoMKgwqBpZiAobnMtPnBhcmFtcy56ZF9leHRlbnNpb25fc2l6ZSkgew0KPiDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAobnMtPnBhcmFtcy56ZF9leHRlbnNpb25fc2l6ZSAmIDB4M2YpIHsNCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnJvcl9zZXRnKGVycnAsDQoNCg==

