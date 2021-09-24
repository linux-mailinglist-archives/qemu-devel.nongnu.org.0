Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A419416C1E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 08:51:20 +0200 (CEST)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTf3H-0000Uq-LH
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 02:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1mTf0C-0006mJ-Rs
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 02:48:08 -0400
Received: from mga11.intel.com ([192.55.52.93]:2813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1mTf09-0001uD-Uv
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 02:48:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="220813807"
X-IronPort-AV: E=Sophos;i="5.85,319,1624345200"; d="scan'208";a="220813807"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 23:47:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,319,1624345200"; d="scan'208";a="475887625"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 23 Sep 2021 23:47:56 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 23 Sep 2021 23:47:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 23 Sep 2021 23:47:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 23 Sep 2021 23:47:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsL0U2iK5e85Ev9KN9c+qJAnwPYS8GlXAlSA8+xaOFinNImGIuv6FFSPwu0T5K4InUdXmBtuHM1KnO1+/a7Qyy5tY5fj7RwJss+fLDX64ObWWdfazeQKL6mUir6UP0DnzVHCeNa/W6XizbSikfh5SHpekMkZA0ywkFVmIQT+vJ01lpqZJHSLf2RHftQPC/Za60SBgAuoLZCKB71DwHGbZPv4E0U13FlUbDO7xjmxye6B4OyX7HK/EOtC8uBhOiqpTi84A5MBSfHSi9Feu0/xa8jSNCXnZanX5Kxlo2xWLFdFGgVHZKoPBLbtiPChhV9p8e9qciR/nycy9v1CovWvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Mq9XSi3ySZMKr0zqW2aRuwKQFQa8s1HdWt5ZgJ3KsHY=;
 b=MppRXO8dtr8l5rSEEQ68GVyI92IaNv1le44qL0tlvXQCz6z7W2rT2A/8YD8K4LsGW3HUM89vxdkxnNneSJTDTIEf/U06GIUBZZF+xGMJcEVUwOIt7YFYWVWUY5GXpFkgqrHXbAqY+e6BfxhTNEEey9KDRMSRyU6BZP31MSMXZJi6+jsxuVHRSrJ+6gDAoHob8CVDCaGbiDTWY9gSuzkUqUUQuCdiP+hnsmekch9+/PNZq8XyBYz96/I0tIZvQp8CWIUlv4CwlV2TR9m5FheIVIdw7qlQ0MWQBNdMpU4WwJBCsweHVxs18PutflMHloT+ES42xUHllkrMV3c9wSv+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mq9XSi3ySZMKr0zqW2aRuwKQFQa8s1HdWt5ZgJ3KsHY=;
 b=NMK77Bwb/IwyX4Rqd0qQJzpqYmQu3nuJ8a7/iLoBuL0EPmE8aNknzFsn0+QYPcnlkHeNKC9F4RL84+yaOSl1SuhrXT29HLRVqrYNTJua3ISgHzQ8/LF+TMjO0IVIzXRoYb5V493CY2cUIMF14KXP+0TnonuHZARQ57rlSy+9ECs=
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN9PR11MB5466.namprd11.prod.outlook.com (2603:10b6:408:11f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 06:47:48 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 06:47:48 +0000
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
Thread-Index: AQHXsQwh2mhwIZa9kkaP0W0OQp9PmKuyuLBw
Date: Fri, 24 Sep 2021 06:47:48 +0000
Message-ID: <BN9PR11MB5433E189EEC102256A3348A18CA49@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <7494b6a8-8dae-cbe9-fcff-29e10a4f0015@huawei.com>
In-Reply-To: <7494b6a8-8dae-cbe9-fcff-29e10a4f0015@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38605e5f-88af-4c12-1d56-08d97f273918
x-ms-traffictypediagnostic: BN9PR11MB5466:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB546698368F351E1767E1C67C8CA49@BN9PR11MB5466.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LLvjU9i6bCRXU3EM6DdlLytZVFN0zpm/2McknTeYRCrLEimvFnH19QGo5r7qBjBPtSTSvVnKT+MH+btWF5kSsNQU/MdLThwLj0TlN9ziEeyui1QqE2O+wVyMiSnvhwQv6/agvi0SGPyW0NpO39iV3ow8UsLWN9f6zg9nroK7e9Xeo1YTdsrnQxFHzwHLUIZUi2Df4fct4+qy9yFmbCR4RYLW1scU2GQnuEspyBJvNNTuymkrJCSUy0xRUG6THcnD0WRx5wFjAoWDMpfVtZ+xBmYY8XnX4GO5t4nUmbFk8m9OXfUtDuDLeaDpws9/PiX5P7X0D4UfTckbw1Mlw+/DjTqesBCZuSGooLS7qmEGwTeNqHr1nklnuzfkSstkAFskgc2VbTX6Re1+Kipc0vOcOOLP26CCU76bu2DUsNdAxpYwcAeqC1kza0FKJ8EioDl9xsjW/pOuFrnMCmfnLZpeTIpBdqVJPmsvvY2dBsmMqvrYWZfAK4j1OsfDiL1kxjUkN58YKeZpcgulKjynHTdBj3k/u4ZDLwDpe9NB4eCCTAtDZxr91jw23iXC0w+o18r2UlUwsCYw+XGQVTZOLnjF3iUEs9RMkAsfN3Oz07+jVJ1hIRZi9ERtmTVR0eu8KehgIGyyJuCcNxGeqQ+q7+ZKoZ7RzQ+gaqDVpMGS8tBogxVat7wAkWwXW3+v/pDZROWuJVB7QPf6pJtGOTDC+W6KZg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5433.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(107886003)(186003)(8936002)(9686003)(5660300002)(55016002)(54906003)(83380400001)(52536014)(2906002)(110136005)(66446008)(66946007)(71200400001)(4326008)(26005)(122000001)(508600001)(38070700005)(76116006)(33656002)(66556008)(38100700002)(64756008)(7696005)(66476007)(6506007)(86362001)(7416002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3RCK1JSSlJ5dTlvUitGa2k3eDh4eFVWT0VEOGZhNDRseUFtNmN1N0RGZ3Ro?=
 =?utf-8?B?QXVINXpTQTlNYUJULzFHOFZoaHBOdkFxN3hCc3Z1T0lxdGExMm5ZMFRHbzRs?=
 =?utf-8?B?ZE1KR29nS0w2K3VibWZIOTQyWlN6NGQzSkJCdG56SU9oWTBvdy8yaXNVZDc0?=
 =?utf-8?B?QWNwanJwN0huVkhXcDVEbnhGaER6ZW1TbiswellRa2oyZ29BWnBkMnZoZHEv?=
 =?utf-8?B?NktUOGJkMVBvanJTdGpVRFdZTWl6Sk5LSVNkVmxaSkZGQ1lrc1hXSDRsKzl6?=
 =?utf-8?B?c1Roc0MzU05KZGJUU0ZTSFE5WS84QmRKN3pqTVhiaU9qM2orcmJqVTdpSFdT?=
 =?utf-8?B?cTU0RUtlbDEvVWU2SG5zVDNSNTY0YmpsbU1rditBcHNVQzFpamVnaHlEVFJZ?=
 =?utf-8?B?ZlFoNnFhZkU0ZDJnZG5hdHFLckE1NmlST1BQVHZXREQrZ3ovRmNsVy9EV2dw?=
 =?utf-8?B?YnduU3NEY3pkeEx3UWVaM1cxbDZvQzVGaSt0VkdvN0NQNzUxeVUybHQrcHZZ?=
 =?utf-8?B?QjA3dzFucXZiaHNOYkJ6c05oTndZeXFDYkcrb0UxcFVzTmhYNzdMVEpMbXRW?=
 =?utf-8?B?V0lGSkdpYjBNck5BZVFBSXpSempsdU5QZ1I3TytsRmdMWTJGVUs2cjB0T2ow?=
 =?utf-8?B?Y2xnZzN1REdhUExnK3RraWxIWXo4emhLUjBPVUVpdHdqQytHUnl1VUpWOHVv?=
 =?utf-8?B?a0krb3JPZXNSNDQ3cjJTbU1BSGdPL2VXUko3OVArbXVGVEpwOTY5QjlYcWhP?=
 =?utf-8?B?clB4WGdGN3NEZmF0NHJVMStoSk82bWdRNUNtQ0s2K3pCUWNwUjh2MHNwM3N5?=
 =?utf-8?B?b3ZaUFYycDI0RXdvQktzalBnYjZrb3hmN2FRNnFIWVArZi9wZk4vbGlGSTdT?=
 =?utf-8?B?cHpGV3pydDBJZW5TaHBQcUVqVFRicEsxd0IwNHcyZHR4RFNuUGI5dDVCaU9s?=
 =?utf-8?B?VnBWTjROMEI5WEh4dS9OTEZiRzZ5aGNIb3k2eXJIZldCR0U3L1JYd3BjL1J2?=
 =?utf-8?B?dnF2TzhaSEt6K1ZidUg3U2Q0WEEyYkxlYzdJdFZ0MkMveUMwMEFid2N0aFVI?=
 =?utf-8?B?WjJCMVkyZTQ1VjJnQ3pZNkYzdzZ4TUhpdGRobjVna3QrY0FVUnN2aUtJL1J3?=
 =?utf-8?B?MHlMM3Rvam45NVY1UXZpMzkwTEN4cDlVOVA5OGovM0p6akErSVpoaithWkN1?=
 =?utf-8?B?dFhXV2Q2SmJodld0UEZMUjl2QlhtejVJcnd5MFVETkcxKzNBOUJKSFZQeGZZ?=
 =?utf-8?B?ejFVZVlORWUvT0dzZC84dVJsakNhODBNb2Zac2Z3S0ZTb2d2b0dzWUF2Ym4x?=
 =?utf-8?B?VTh6YkpYMjhSNFNVbFhHd1ZTQWRjMi94ZHMvcFJRMFF3Y3RPTEsvbUI5NXlR?=
 =?utf-8?B?ZW5BNXpHNWtnZDFsN0JUd00vL0lGMkd1M3hQeHFSVnc4ZEVmT25remNoNE15?=
 =?utf-8?B?dUQvbHRNR1JTZGVhbGVkbXk0cDMzSklrYm5qbTlZNGtlRlI1YjNDRmpLdmd1?=
 =?utf-8?B?T1h4Yld4QjFDZm9lcUc4UEF6MHVTTlR5QitLSGFFS3pTTUhMWGI2enNBSnR1?=
 =?utf-8?B?cXd0ZTVrY2hsb0hLTWVKbjFVOXJuSnBOdmVIYU9EbTlLbitodFQvZC9qN0NL?=
 =?utf-8?B?V2VobTkrYjhaZTNlemJXeVE1WGtQZ0NESEZxd3ZacHlxR3RIbStsQXNuN3BT?=
 =?utf-8?B?MUpjbGMvVUIxTlFTaWJpa2svSTBoNWxjVWtBUVFOb3BVWlJxbDlkYzZUd01O?=
 =?utf-8?Q?Jh/yK2sNRmuCf50QnyPaWG90JipGUz87CfIeJKK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38605e5f-88af-4c12-1d56-08d97f273918
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 06:47:48.7451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M2Mqlfkfu8/1eqhA20JNn/u+MDe/7tL4AK9XfPjUy/HOQpeyLLxnHwg57gM5QSTfdSZEQWvALurjxNW/u3BIrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5466
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=kevin.tian@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

PiBGcm9tOiBLdW5rdW4gSmlhbmcgPGppYW5na3Vua3VuQGh1YXdlaS5jb20+DQo+IFNlbnQ6IEZy
aWRheSwgU2VwdGVtYmVyIDI0LCAyMDIxIDI6MTkgUE0NCj4gDQo+IEhpIGFsbCwNCj4gDQo+IEkg
ZW5jb3VudGVyZWQgYSBwcm9ibGVtIGluIHZmaW8gZGV2aWNlIG1pZ3JhdGlvbiB0ZXN0LiBUaGUN
Cj4gdkNQVSBtYXkgYmUgcGF1c2VkIGR1cmluZyB2ZmlvLXBjaSBETUEgaW4gaW9tbXUgbmVzdGVk
DQo+IHN0YWdlIG1vZGUgJiYgdlNWQS4gVGhpcyBtYXkgbGVhZCB0byBtaWdyYXRpb24gZmFpbCBh
bmQNCj4gb3RoZXIgcHJvYmxlbXMgcmVsYXRlZCB0byBkZXZpY2UgaGFyZHdhcmUgYW5kIGRyaXZl
cg0KPiBpbXBsZW1lbnRhdGlvbi4NCj4gDQo+IEl0IG1heSBiZSBhIGJpdCBlYXJseSB0byBkaXNj
dXNzIHRoaXMgaXNzdWUsIGFmdGVyIGFsbCwgdGhlIGlvbW11DQo+IG5lc3RlZCBzdGFnZSBtb2Rl
IGFuZCB2U1ZBIGFyZSBub3QgeWV0IG1hdHVyZS4gQnV0IGp1ZGdpbmcNCj4gZnJvbSB0aGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiwgd2Ugd2lsbCBkZWZpbml0ZWx5IGVuY291bnRlcg0KPiB0aGlz
IHByb2JsZW0gaW4gdGhlIGZ1dHVyZS4NCg0KWWVzLCB0aGlzIGlzIGEga25vd24gbGltaXRhdGlv
biB0byBzdXBwb3J0IG1pZ3JhdGlvbiB3aXRoIHZTVkEuDQoNCj4gDQo+IFRoaXMgaXMgdGhlIGN1
cnJlbnQgcHJvY2VzcyBvZiB2U1ZBIHByb2Nlc3NpbmcgdHJhbnNsYXRpb24gZmF1bHQNCj4gaW4g
aW9tbXUgbmVzdGVkIHN0YWdlIG1vZGUgKHRha2UgU01NVSBhcyBhbiBleGFtcGxlKToNCj4gDQo+
IGd1ZXN0IG9zwqDCoMKgIMKgwqDCoCDCoMKgwqAgNC5oYW5kbGUgdHJhbnNsYXRpb24gZmF1bHQg
NS5zZW5kIENNRF9SRVNVTUUgdG8gdlNNTVUNCj4gDQo+IA0KPiBxZW11wqDCoMKgIMKgwqDCoCDC
oMKgwqAgwqDCoMKgIDMuaW5qZWN0IGZhdWx0IGludG8gZ3Vlc3Qgb3MgNi5kZWxpdmVyIHJlc3Bv
bnNlIHRvDQo+IGhvc3Qgb3MNCj4gKHZmaW8vdnNtbXUpDQo+IA0KPiANCj4gaG9zdCBvc8KgwqDC
oCDCoMKgwqAgwqDCoMKgwqDCoCAyLm5vdGlmeSB0aGUgcWVtdSA3LnNlbmQgQ01EX1JFU1VNRSB0
byBTTU1VDQo+ICh2ZmlvL3NtbXUpDQo+IA0KPiANCj4gU01NVcKgwqDCoCDCoMKgwqAgwqDCoMKg
wqDCoCAxLmFkZHJlc3MgdHJhbnNsYXRpb24gZmF1bHTCoMKgwqAgwqDCoMKgIMKgwqDCoMKgwqAg
OC5yZXRyeSBvcg0KPiB0ZXJtaW5hdGUNCj4gDQo+IFRoZSBvcmRlciBpcyAxLS0tPjguDQo+IA0K
PiBDdXJyZW50bHksIHFlbXUgbWF5IHBhdXNlIHZDUFUgYXQgYW55IHN0ZXAuIEl0IGlzIHBvc3Np
YmxlIHRvDQo+IHBhdXNlIHZDUFUgYXQgc3RlcCAxLTUsIHRoYXQgaXMsIGluIGEgRE1BLiBUaGlz
IG1heSBsZWFkIHRvDQo+IG1pZ3JhdGlvbiBmYWlsIGFuZCBvdGhlciBwcm9ibGVtcyByZWxhdGVk
IHRvIGRldmljZSBoYXJkd2FyZQ0KPiBhbmQgZHJpdmVyIGltcGxlbWVudGF0aW9uLiBGb3IgZXhh
bXBsZSwgdGhlIGRldmljZSBzdGF0dXMNCj4gY2Fubm90IGJlIGNoYW5nZWQgZnJvbSBSVU5OSU5H
ICYmIFNBVklORyB0byBTQVZJTkcsDQo+IGJlY2F1c2UgdGhlIGRldmljZSBETUEgaXMgbm90IG92
ZXIuDQo+IA0KPiBBcyBmYXIgYXMgaSBjYW4gc2VlLCB2Q1BVIHNob3VsZCBub3QgYmUgcGF1c2Vk
IGR1cmluZyBhIGRldmljZQ0KPiBJTyBwcm9jZXNzLCBzdWNoIGFzIERNQS4gSG93ZXZlciwgY3Vy
cmVudGx5IGxpdmUgbWlncmF0aW9uDQo+IGRvZXMgbm90IHBheSBhdHRlbnRpb24gdG8gdGhlIHN0
YXRlIG9mIHZmaW8gZGV2aWNlIHdoZW4gcGF1c2luZw0KPiB0aGUgdkNQVS4gQW5kIGlmIHRoZSB2
Q1BVIGlzIG5vdCBwYXVzZWQsIHRoZSB2ZmlvIGRldmljZSBpcw0KPiBhbHdheXMgcnVubmluZy4g
VGhpcyBsb29rcyBsaWtlIGEgKmRlYWRsb2NrKi4NCg0KQmFzaWNhbGx5IHRoaXMgcmVxdWlyZXM6
DQoNCjEpIHN0b3BwaW5nIHZDUFUgYWZ0ZXIgc3RvcHBpbmcgZGV2aWNlIChjb3VsZCBzZWxlY3Rp
dmVseSBlbmFibGUNCnRoaXMgc2VxdWVuY2UgZm9yIHZTVkEpOw0KDQoyKSB3aGVuIHN0b3BwaW5n
IGRldmljZSwgdGhlIGRyaXZlciBzaG91bGQgYmxvY2sgbmV3IHJlcXVlc3RzDQpmcm9tIHZDUFUg
KHF1ZXVlZCB0byBhIHBlbmRpbmcgbGlzdCkgYW5kIHRoZW4gZHJhaW4gYWxsIGluLWZseSANCnJl
cXVlc3RzIGluY2x1ZGluZyBmYXVsdHM7DQogICAgKiB0byBibG9jayB0aGlzIGZ1cnRoZXIgcmVx
dWlyZXMgc3dpdGNoaW5nIGZyb20gZmFzdC1wYXRoIHRvDQpzbG93IHRyYXAtZW11bGF0aW9uIHBh
dGggZm9yIHRoZSBjbWQgcG9ydGFsIGJlZm9yZSBzdG9wcGluZw0KdGhlIGRldmljZTsNCg0KMykg
c2F2ZSB0aGUgcGVuZGluZyByZXF1ZXN0cyBpbiB0aGUgdm0gaW1hZ2UgYW5kIHJlcGxheSB0aGVt
IA0KYWZ0ZXIgdGhlIHZtIGlzIHJlc3VtZWQ7DQogICAgKiBmaW5hbGx5IGRpc2FibGUgYmxvY2tp
bmcgYnkgc3dpdGNoaW5nIGJhY2sgdG8gdGhlIGZhc3QtcGF0aCBmb3INCnRoZSBjbWQgcG9ydGFs
Ow0KDQo+IA0KPiBEbyB5b3UgaGF2ZSBhbnkgaWRlYXMgdG8gc29sdmUgdGhpcyBwcm9ibGVtPw0K
PiBMb29raW5nIGZvcndhcmQgdG8geW91ciByZXBsYXkuDQo+IA0KDQpXZSB2ZXJpZmllZCBhYm92
ZSBmbG93IGNhbiB3b3JrIGluIG91ciBpbnRlcm5hbCBQT0MuIA0KDQpUaGFua3MNCktldmluDQo=

