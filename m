Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776D6419537
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:39:24 +0200 (CEST)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqqp-0008Lt-II
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1mUqM3-0004Hl-OI
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:35 -0400
Received: from mga12.intel.com ([192.55.52.136]:14246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1mUqM0-00044s-LN
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="203960959"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="203960959"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 06:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="478110982"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2021 06:06:13 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 27 Sep 2021 06:06:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 27 Sep 2021 06:06:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 27 Sep 2021 06:06:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtLUMq1f+g+3gnZVBLBMVuQKKWHZi7CqdzCuPiwZ6fdU6GgInSh2uo4qcSruxNXqC1rcv+TFpWJpQe5+gjdtq1AeXqXtR5E1vtgiKKsjc3bCWTTAc3C0fFQqhwjyQMQYeKpcDAckaJyRQIn3Ow6r8VM9P6rQXw7WzDjHKLl0GQ48KxbFln1aoxfeI+RnZhV/0ot+AtYuxYQYpHiTbRzVlE84j9vLX8EskZBsE1c7FcaNVA5fBO/DLMklW5TIwJRHvWVFg8Ev2QlWJ1/VPoB9/QPlzzBqSbt/N/V4U6zLOyvGKpLMiPhRmnnxwaNc5lJ0LjdKbQ46uHrAfqeO0d39vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=FMjMmmEHcgxQfXoGV6EE5foSI0GBVKmF9BkJXtEjvLk=;
 b=C4Ib+uHEXPgTFgYbenk8/oLqvj4mBaUdgBXFZsCInBOUic1B35Qygi7OciErhlO4/ki+ivppJ6Z5GCnr8xFqeOcHF0FOLPIs3fvw1fEnr6MEJhvPR61apvErRyszB6AVZ2KimGjNAIzmSXLHmwPGS3s59TPFO0LibYpuZQD1BLJt2PbvLpvBRDh1RjtSc9p8GA0oHmHGClYs1JG0tJuGyDgRhJ/NGBQsLztOIvIvZPKvsUQkuSaychPjmuFcbhEQDrFUP7n4bNB8k3xM0ve0JkEQXa/bi9W5sCiJMLWIw92W0K77n5dKsL9g5E4EVTdlLPgqCFQhVkFvK9x05H9ptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMjMmmEHcgxQfXoGV6EE5foSI0GBVKmF9BkJXtEjvLk=;
 b=WQhcq5dbiDh6DW5t2bwm7lKdEcyL29uJvKRrcrKSx+LbM9TvOiwPug8fJYk3mSZn+x3gaQcVxggCNL9Zvh4spnAaMr8JXxqmctwZRDX08AakCWfQB6aPRXPIx0InpM559+ntBPXFACrAZpMg813FnjTvqqtHENnisf1MGXuhJig=
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN9PR11MB5531.namprd11.prod.outlook.com (2603:10b6:408:104::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 13:05:55 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 13:05:55 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>, Tarun Gupta <targupta@nvidia.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Eric Auger <eric.auger@redhat.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: RE: [question] VFIO Device Migration: The vCPU may be paused during
 vfio device DMA in iommu nested stage mode && vSVA
Thread-Topic: [question] VFIO Device Migration: The vCPU may be paused during
 vfio device DMA in iommu nested stage mode && vSVA
Thread-Index: AQHXsQwh2mhwIZa9kkaP0W0OQp9PmKuyuLBwgAUcAoCAAAjhQA==
Date: Mon, 27 Sep 2021 13:05:55 +0000
Message-ID: <BN9PR11MB5433811835A1FBD5BDC1B6FA8CA79@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <7494b6a8-8dae-cbe9-fcff-29e10a4f0015@huawei.com>
 <BN9PR11MB5433E189EEC102256A3348A18CA49@BN9PR11MB5433.namprd11.prod.outlook.com>
 <41425c1b-1db4-f753-ca67-152366fe3865@huawei.com>
In-Reply-To: <41425c1b-1db4-f753-ca67-152366fe3865@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50fcb8f4-31d0-4d57-51c8-08d981b78a89
x-ms-traffictypediagnostic: BN9PR11MB5531:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB553134E22C6BF20875935F688CA79@BN9PR11MB5531.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BcvMfeovXh1IgO9qs8MYrcl37J9gkHgBbcXCZe8hlg0ZwIGq/QK8+lUiHldk5WpNkFhf32vx69baRjzrDNA4yt9t7YVYDSkDNMhEJRkCq7aHcjTxUo0EVwWKYdmXp8h32lVDgQHGhZvIveLqWCMEazSL0I7bNpIMgGxQUqw6T1UMSE93rOCn67wsjZ7AS29bjt4EYyCTznRez24f5EYZBzsQ+eHSiTwqcPEMUDMsPt0gjxvbgnds1inMGTWp8wsiPcJga7Abt9IUsuvUbn1FReiIYx0FMl+giD74xYGoe/21QtKDyEV3iumNJVAI9t0gZygx7Ipwwk/POF3x3vmmjrQ/PFBRzoFldc+gU88FuSFEM8Et9aA1u9zwuUDr9FdLY7r9/PLaQWttjk7STTSc74WdS7EIWvnpxMKlcb2Tiehp9lIJ5S4Ls8HEdYjmz4eJRqVX1h8/5mtfbEIXTJiraU4yyCM3pvMPKkrS6i18jwsQce44GVfLBm3UBNeAOjfvxiFZ0QebIY7XHKdQ3eWLNyUVl1GLqOHhED9ZzWFy6oNaMVGGiyU5pxKM7W+r00ZBg0yn+D358THnh8dKEmgGyqZKs4dekVEFS+udY+cBR2/xskazUkisqXUJAju8bZy7toemui2B3o7QcoW7E04HGEnJviCTw6u87OID38ktTnNm+J44qvEAyU5b4zlx8vqzhmd8tukPFJKgPHUz+m9LGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5433.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(55016002)(66946007)(76116006)(9686003)(66556008)(53546011)(66476007)(66446008)(64756008)(7416002)(83380400001)(7696005)(4326008)(38070700005)(86362001)(52536014)(38100700002)(107886003)(71200400001)(316002)(5660300002)(8936002)(508600001)(8676002)(33656002)(186003)(2906002)(26005)(122000001)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlNwbkV2YmptQzVBN3AzcEJiNDlkTXJabm9sRjJNRTJ2YXlaTldEcHRPZWZ0?=
 =?utf-8?B?bTlJTys0MWNWbFRmcUpWbmsvbEoyWGxzVGxZRm91aEtORDNUUG9ZdWhYTW81?=
 =?utf-8?B?QktWdnU1bnExMzVkM1UvQ3lacXcrYXZRQ1ljU0tVZmtXcFY4Z1VxWFA3cWkz?=
 =?utf-8?B?a0pHS1hycG1vTVlYdkd1RjczYnNzeFZGVVpwZHZCYW1nWHZ6ZlV3YlpzZmtJ?=
 =?utf-8?B?Z3gzNGtYYTdLdEZMT1kyL0pOTTVwNnpKZFc4alNuelpxSzNGVnVVbHFzUTNz?=
 =?utf-8?B?bFlzVEcraCtJVUI5Q2o2MlVMMTdKYWt4S1o2amI5WXdlQUJka2JWamY2cjZm?=
 =?utf-8?B?R1B0bDZRNzRiWVpjMU1nQlRNVlBIeWVISG0xOWg3U1krUkxSb0t1bVFqNGFz?=
 =?utf-8?B?WjBXSVl0azczNXNPMHp2WlhMdzNsU1pqbHFOblpsZU9ROWE5dTFqbkliVFNl?=
 =?utf-8?B?RnkyMEIzV1NSVUR5Y09ndFAxdERSSW5RMUh0N3ZLL3pBbzJnbWNWazExSTFo?=
 =?utf-8?B?bWVDeU9zZ3U4Sm9NakFsSkxCZDAvVzU1S0crZnptWW1tR3J6NFVZc09HcjY3?=
 =?utf-8?B?cWFHc1RKQ0tKNDBvdGE1bjZPVU1mTVgwV3Q3N2ZoUyswVDY2ZXQvTUc2OGFv?=
 =?utf-8?B?ZUF3aGlXQUY4M1lYelRkTEo4SCtZQVpVY1I1R0owK2hLL0hjN2RSK2VTcm0w?=
 =?utf-8?B?RmRzVWFQZ3I4clBBSVdXQko2V2EwazB6OUpmSjNEUmhHZGZXTDN4MFBreS9n?=
 =?utf-8?B?QnZJZzBwRnZHZHBWNHhYSjVCTGdlbmxrYkQyOUI5Q2VabnVMZmVVTzdpMVp2?=
 =?utf-8?B?SGdDNzVKS0M5dXArc0VoL3dTWnRRazhYblhjYkROWG5zTCsxZDI3aXNtdzJy?=
 =?utf-8?B?aGxrZ1hCbjN6SGg4R1h5b3ZJQWlKZ3g2TlZTQWE1bzloQjRFMHhUQWJ3SExp?=
 =?utf-8?B?bzVnT1NVQTkxVWNrN2dJSzlBemlmc0JCTGhDNHA3eStxc2Zabmg2b1ZHTGdG?=
 =?utf-8?B?NnFidFprVFlsM2t2SDZaREg3ZEJWckZLdFVaVDJZMFB4dXNEeWd5bEZBNjR1?=
 =?utf-8?B?dFFLVHVISFluMzJreG9lR2k0SnEzMlA5dUpkWVRNTGlLUElXSkg3MW43cWhV?=
 =?utf-8?B?STZvU1lENXo4UUtpc0o4TXY0RHFseWtlVXFFd2J2SFlNVFBDaWs1SENEc2JW?=
 =?utf-8?B?c2VVc0FpWUdhdFVGOWFSS3RtaHNKaWNWSlU3V0Y4MWZqaVlDTHZ3Slk2Q1My?=
 =?utf-8?B?SjFZektBRWhneC82d2pRakJ2cCtHbFFYeGY2WnVaeXdEbWhXVXB4WDVocEJ0?=
 =?utf-8?B?T2FBWldEV0t5dW5aQWZoam9Mdi96VXRZNXllei9sM0daWTFhSExybk55SmE2?=
 =?utf-8?B?ci9nUElYb2hCVVRZTGZTU1JoZHRUTDhtYVdzK2NjajhvRXZPNkVwSDcrRFI3?=
 =?utf-8?B?dHhMTC8yQlZObEs4andZYko5SVJlMWl1Qm91Q2ZBRDE1ZnJURVgrTEgxVTRN?=
 =?utf-8?B?Z0ZTU1VwdDhzTlpWQU1uWnFJbytTTWxwMG5QSWNZckdaWG1hNzF6aERBcHFx?=
 =?utf-8?B?Q1RoNk13c0x0d09NR1poOTBqUTJZN1dHdXl3d1FHYndOam9DaTZZTis1dk5q?=
 =?utf-8?B?ZWJFNEpGdVlwWUVVblpySVpuMWJobExOZE8vY0tJK0dsUGFocXJZV0VzYUVy?=
 =?utf-8?B?bXh1S3VQOXhKS1FnQ2x5d1JyZmJrSkYrZXBPM3kxOWVOa2gyaDdqRVUvcHVH?=
 =?utf-8?Q?qi9Yk9Q89IJvARw42zdJTKohF/nNRvvagMthF3d?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fcb8f4-31d0-4d57-51c8-08d981b78a89
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 13:05:55.2421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mCj30lU4VryBVq1TpeL5RIc7JZMjk3F3XBPQdm61ZEBwMdULnMcU/vtgahUoy8W1KD9tVwBhpvAe5CEA59QwAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5531
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=kevin.tian@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "tangnianyao@huawei.com" <tangnianyao@huawei.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 "liulongfang@huawei.com" <liulongfang@huawei.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBLdW5rdW4gSmlhbmcgPGppYW5na3Vua3VuQGh1YXdlaS5jb20+DQo+IFNlbnQ6IE1v
bmRheSwgU2VwdGVtYmVyIDI3LCAyMDIxIDg6MzAgUE0NCj4gDQo+IEhpIEtldmluOg0KPiANCj4g
T24gMjAyMS85LzI0IDE0OjQ3LCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPj4gRnJvbTogS3Vua3Vu
IEppYW5nIDxqaWFuZ2t1bmt1bkBodWF3ZWkuY29tPg0KPiA+PiBTZW50OiBGcmlkYXksIFNlcHRl
bWJlciAyNCwgMjAyMSAyOjE5IFBNDQo+ID4+DQo+ID4+IEhpIGFsbCwNCj4gPj4NCj4gPj4gSSBl
bmNvdW50ZXJlZCBhIHByb2JsZW0gaW4gdmZpbyBkZXZpY2UgbWlncmF0aW9uIHRlc3QuIFRoZQ0K
PiA+PiB2Q1BVIG1heSBiZSBwYXVzZWQgZHVyaW5nIHZmaW8tcGNpIERNQSBpbiBpb21tdSBuZXN0
ZWQNCj4gPj4gc3RhZ2UgbW9kZSAmJiB2U1ZBLiBUaGlzIG1heSBsZWFkIHRvIG1pZ3JhdGlvbiBm
YWlsIGFuZA0KPiA+PiBvdGhlciBwcm9ibGVtcyByZWxhdGVkIHRvIGRldmljZSBoYXJkd2FyZSBh
bmQgZHJpdmVyDQo+ID4+IGltcGxlbWVudGF0aW9uLg0KPiA+Pg0KPiA+PiBJdCBtYXkgYmUgYSBi
aXQgZWFybHkgdG8gZGlzY3VzcyB0aGlzIGlzc3VlLCBhZnRlciBhbGwsIHRoZSBpb21tdQ0KPiA+
PiBuZXN0ZWQgc3RhZ2UgbW9kZSBhbmQgdlNWQSBhcmUgbm90IHlldCBtYXR1cmUuIEJ1dCBqdWRn
aW5nDQo+ID4+IGZyb20gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sIHdlIHdpbGwgZGVmaW5p
dGVseSBlbmNvdW50ZXINCj4gPj4gdGhpcyBwcm9ibGVtIGluIHRoZSBmdXR1cmUuDQo+ID4gWWVz
LCB0aGlzIGlzIGEga25vd24gbGltaXRhdGlvbiB0byBzdXBwb3J0IG1pZ3JhdGlvbiB3aXRoIHZT
VkEuDQo+ID4NCj4gPj4gVGhpcyBpcyB0aGUgY3VycmVudCBwcm9jZXNzIG9mIHZTVkEgcHJvY2Vz
c2luZyB0cmFuc2xhdGlvbiBmYXVsdA0KPiA+PiBpbiBpb21tdSBuZXN0ZWQgc3RhZ2UgbW9kZSAo
dGFrZSBTTU1VIGFzIGFuIGV4YW1wbGUpOg0KPiA+Pg0KPiA+PiBndWVzdCBvc8KgwqDCoCDCoMKg
wqAgwqDCoMKgIDQuaGFuZGxlIHRyYW5zbGF0aW9uIGZhdWx0IDUuc2VuZCBDTURfUkVTVU1FIHRv
IHZTTU1VDQo+ID4+DQo+ID4+DQo+ID4+IHFlbXXCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAg
My5pbmplY3QgZmF1bHQgaW50byBndWVzdCBvcyA2LmRlbGl2ZXIgcmVzcG9uc2UgdG8NCj4gPj4g
aG9zdCBvcw0KPiA+PiAodmZpby92c21tdSkNCj4gPj4NCj4gPj4NCj4gPj4gaG9zdCBvc8KgwqDC
oCDCoMKgwqAgwqDCoMKgwqDCoCAyLm5vdGlmeSB0aGUgcWVtdSA3LnNlbmQgQ01EX1JFU1VNRSB0
byBTTU1VDQo+ID4+ICh2ZmlvL3NtbXUpDQo+ID4+DQo+ID4+DQo+ID4+IFNNTVXCoMKgwqAgwqDC
oMKgIMKgwqDCoMKgwqAgMS5hZGRyZXNzIHRyYW5zbGF0aW9uIGZhdWx0wqDCoMKgIMKgwqDCoCDC
oMKgwqDCoMKgIDgucmV0cnkgb3INCj4gPj4gdGVybWluYXRlDQo+ID4+DQo+ID4+IFRoZSBvcmRl
ciBpcyAxLS0tPjguDQo+ID4+DQo+ID4+IEN1cnJlbnRseSwgcWVtdSBtYXkgcGF1c2UgdkNQVSBh
dCBhbnkgc3RlcC4gSXQgaXMgcG9zc2libGUgdG8NCj4gPj4gcGF1c2UgdkNQVSBhdCBzdGVwIDEt
NSwgdGhhdCBpcywgaW4gYSBETUEuIFRoaXMgbWF5IGxlYWQgdG8NCj4gPj4gbWlncmF0aW9uIGZh
aWwgYW5kIG90aGVyIHByb2JsZW1zIHJlbGF0ZWQgdG8gZGV2aWNlIGhhcmR3YXJlDQo+ID4+IGFu
ZCBkcml2ZXIgaW1wbGVtZW50YXRpb24uIEZvciBleGFtcGxlLCB0aGUgZGV2aWNlIHN0YXR1cw0K
PiA+PiBjYW5ub3QgYmUgY2hhbmdlZCBmcm9tIFJVTk5JTkcgJiYgU0FWSU5HIHRvIFNBVklORywN
Cj4gPj4gYmVjYXVzZSB0aGUgZGV2aWNlIERNQSBpcyBub3Qgb3Zlci4NCj4gPj4NCj4gPj4gQXMg
ZmFyIGFzIGkgY2FuIHNlZSwgdkNQVSBzaG91bGQgbm90IGJlIHBhdXNlZCBkdXJpbmcgYSBkZXZp
Y2UNCj4gPj4gSU8gcHJvY2Vzcywgc3VjaCBhcyBETUEuIEhvd2V2ZXIsIGN1cnJlbnRseSBsaXZl
IG1pZ3JhdGlvbg0KPiA+PiBkb2VzIG5vdCBwYXkgYXR0ZW50aW9uIHRvIHRoZSBzdGF0ZSBvZiB2
ZmlvIGRldmljZSB3aGVuIHBhdXNpbmcNCj4gPj4gdGhlIHZDUFUuIEFuZCBpZiB0aGUgdkNQVSBp
cyBub3QgcGF1c2VkLCB0aGUgdmZpbyBkZXZpY2UgaXMNCj4gPj4gYWx3YXlzIHJ1bm5pbmcuIFRo
aXMgbG9va3MgbGlrZSBhICpkZWFkbG9jayouDQo+ID4gQmFzaWNhbGx5IHRoaXMgcmVxdWlyZXM6
DQo+ID4NCj4gPiAxKSBzdG9wcGluZyB2Q1BVIGFmdGVyIHN0b3BwaW5nIGRldmljZSAoY291bGQg
c2VsZWN0aXZlbHkgZW5hYmxlDQo+ID4gdGhpcyBzZXF1ZW5jZSBmb3IgdlNWQSk7DQo+IEhvdyB0
byB0ZWxsIGlmIHZTVkEgaXMgb3Blbj8NCj4gSW4gZmFjdCwgYXMgbG9uZyBhcyBpdCBpcyBpbiBp
b21tdSBuZXN0ZWQgc3RhZ2UgbW9kZSwgdGhlcmUgd2lsbA0KPiBiZSBzdWNoIGEgcHJvYmxlbSwg
d2hldGhlciBpdCBpcyB2U1ZBIG9yIG5vLXZTVkEuIEluIG5vLXZTVkEgbW9kZSwNCj4gYSBmYXVs
dCBjYW4gYWxzbyBiZSBnZW5lcmF0ZWQgYnkgbW9kaWZ5aW5nIHRoZSBndWVzdCBkZXZpY2UgZHJp
dmVyLg0KDQpZb3UgZG9uJ3QgbmVlZCB0ZWxsIGlmIHZTVkEgaXMgb3Blbi4gVGhlIGtlcm5lbCBk
cml2ZXIga25vd3MNCndoZXRoZXIgbmVzdGVkIGlzIGVuYWJsZWQgYW5kIHdoZXRoZXIgZmF1bHQg
aXMgaGFuZGxlZCBieSANCnVzZXJzcGFjZS4gd2l0aCB0aGlzIGtub3dsZWRnZSB0aGUgZHJpdmVy
IGNhbiBnZW5lcmFsbHkgaW5kaWNhdGUgDQpzdWNoIG9yZGVyIHJlc3RyaWN0aW9uIHRvIFFlbXUg
dmlhIG1pZ3JhdGlvbiByZWdpb24gaW5mby4NCg0KPiA+DQo+ID4gMikgd2hlbiBzdG9wcGluZyBk
ZXZpY2UsIHRoZSBkcml2ZXIgc2hvdWxkIGJsb2NrIG5ldyByZXF1ZXN0cw0KPiA+IGZyb20gdkNQ
VSAocXVldWVkIHRvIGEgcGVuZGluZyBsaXN0KSBhbmQgdGhlbiBkcmFpbiBhbGwgaW4tZmx5DQo+
ID4gcmVxdWVzdHMgaW5jbHVkaW5nIGZhdWx0czsNCj4gPiAgICAgICogdG8gYmxvY2sgdGhpcyBm
dXJ0aGVyIHJlcXVpcmVzIHN3aXRjaGluZyBmcm9tIGZhc3QtcGF0aCB0bw0KPiA+IHNsb3cgdHJh
cC1lbXVsYXRpb24gcGF0aCBmb3IgdGhlIGNtZCBwb3J0YWwgYmVmb3JlIHN0b3BwaW5nDQo+ID4g
dGhlIGRldmljZTsNCj4gPg0KPiA+IDMpIHNhdmUgdGhlIHBlbmRpbmcgcmVxdWVzdHMgaW4gdGhl
IHZtIGltYWdlIGFuZCByZXBsYXkgdGhlbQ0KPiA+IGFmdGVyIHRoZSB2bSBpcyByZXN1bWVkOw0K
PiA+ICAgICAgKiBmaW5hbGx5IGRpc2FibGUgYmxvY2tpbmcgYnkgc3dpdGNoaW5nIGJhY2sgdG8g
dGhlIGZhc3QtcGF0aCBmb3INCj4gPiB0aGUgY21kIHBvcnRhbDsNCj4gSXMgdGhlcmUgYW55IHJl
bGF0ZWQgcGF0Y2ggc2VudCBvdXQgYW5kIGRpc2N1c3NlZD8gSSBtaWdodCBoYXZlDQo+IG92ZXJs
b29rZWQgdGhhdC4NCg0KTm90IHlldC4gQXMgeW91IHNhaWQgZXZlbiB2U1ZBIHN1cHBvcnQgaXMg
bm90IGluIHBsYWNlLiBJdCdzIHRvbyANCmVhcmx5IHRvIHNlbmQgcGF0Y2hlcyBmb3Igb3RoZXIg
ZmVhdHVyZXMgb24gdG9wIG9mIHRoYXQuDQoNClRoYW5rcywNCktldmluDQo=

