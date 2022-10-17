Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1C86004A0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 02:58:30 +0200 (CEST)
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okESa-0003nd-OO
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 20:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okEO3-0006pG-4k; Sun, 16 Oct 2022 20:53:47 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okEO0-00049V-5P; Sun, 16 Oct 2022 20:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665968024; x=1697504024;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yUTQn4nqxFWZXNLeHWdpcebNrCMPuTeHJ1dq3ey7DLk=;
 b=GuINyCOMAfUpV+YIJVGZogmsKO8UvthLNHNIxkrpajDsyFhgVoX6y60k
 x6sIEbobDDuCvNsvFifHhlwsnf5iLtqYtMZJrETtRtg6ETd4IUV0hK/t3
 hOTaxjoXFAsnhmMOxgynnrVtuWPM3gAz5DP0qmqA7zcyf3dMYNE9WKj4c
 yIK1AUZ0dssttaUPO8usivf8RofV8wgET8vh4C2Vah7Mb4hlPuIcbhmZm
 E+fjLzvUYJaIYm5NcDng6XQ2+m7jdc7at5yWo3jMylBopaz8r+moFPQto
 QeqnCLfySNqa3zSrdw/ac5C+98FNiBQgk7taVXekRMZEiROBNRFA1bJSD Q==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="219123075"
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 08:53:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MM5p10AGWI1aSM+Xav+Bjxs8rvdTtmKPuLKTkIGxsLIJ0ub9+9pPgdzjHO80JvwlNZtDT2ZMvAzY5pj8IMFcBbuolMQyaD2e/QhRID57pB9pqQn1LgcrJwpOZZkp6AdzEillWt6hGMmw3sKdQagEVz3Y1oK1Y9YNmJw/WQKZHOXuvnCwaeOP9EpdocARISnw69Od4aR5no13N7DPW3LNB7mXzFTZKl0BwRoOXoX8sgRVTkBHivhpoXeE7so6SPUXmErbWVcPRyeZCnuOpzxKHK+Q4hNy+6tE/5pMA0zQOhHTxbL2CldHexDy2l8euYdTfyP6C1SeQk8keyyf4NWGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUTQn4nqxFWZXNLeHWdpcebNrCMPuTeHJ1dq3ey7DLk=;
 b=aQwIYDJ4D41Ue9GHYGXYEeJC6vuOEPvs2whdSOJLgJc/+oQ95Gwx00tnwLBAKJ1OnydusoEQsVAneFS7yYUkVs9WM+O1S2MGKLO9Siy0pXgdk5GUY9pqm1lqOchtTudOWir+dhy533SQ/IRagDjBUb0/0LzIhCZ2Bfa/p7DWTn4Kba0dk3K29tO1bEkOAqnqC5dyXltJTzTmye4WzSAZ0rh8XxZZ8XKaR5fki096TOC9ZbctE6gdMh68Jm1SKQRKi1jG5eRNVH1n1QERixzy+B9sEK95m9QMaG8Oqe0FG7HarU3qeV9fFBQ3DGBeoUO4Qi3Qknj3I68gADHvCojUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUTQn4nqxFWZXNLeHWdpcebNrCMPuTeHJ1dq3ey7DLk=;
 b=zxPoJRyr4yZ9t2EC6umIH0XFUCMFumjjgTivRTphiuh8wsEdddeLG7UQx51ZFdYd6FFNXulwEB1fORuG2FkjEInjHdisB2TA0NsWsU+WP185DggKBG3Mb+RuH5UL7RJm4XxAc15ym5GbzxOvUowpr0Oeg3r1gInZx/9RQ6gy6iE=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by SJ0PR04MB7472.namprd04.prod.outlook.com (2603:10b6:a03:294::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 00:53:36 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee%5]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 00:53:36 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "raphael.norwitz@nutanix.com" <raphael.norwitz@nutanix.com>, "mst@redhat.com"
 <mst@redhat.com>, "damien.lemoal@opensource.wdc.com"
 <damien.lemoal@opensource.wdc.com>
Subject: Re: [RFC v3 1/2] include: update virtio_blk headers from Linux
 5.19-rc2+
Thread-Topic: [RFC v3 1/2] include: update virtio_blk headers from Linux
 5.19-rc2+
Thread-Index: AQHY4XC6cr4YXB+AHEq6z4wFb32c1q4RwuOA
Date: Mon, 17 Oct 2022 00:53:36 +0000
Message-ID: <e5ee5de51ec437cc97b71ad2a7e2a969e21cbcce.camel@wdc.com>
References: <20221016150506.172675-1-faithilikerun@gmail.com>
 <20221016150506.172675-2-faithilikerun@gmail.com>
In-Reply-To: <20221016150506.172675-2-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB5951:EE_|SJ0PR04MB7472:EE_
x-ms-office365-filtering-correlation-id: 7be37356-65fb-4902-0374-08daafda0614
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JDuc5c6hGwbWSM/5eulAmS+Jx+JxgGkViV5gEUfKALoIQLb3JI+KYogNAO7QWo3p3x4/D9t0tsGJsUsl2YZlbIJbSqGRCLEskRlNTUjT6LO0VuQq6AjrXtPC2Xjga1l1BEav0IA0siBTluY9YABVLdjTip77zh2mGQYmJYs0mC5bYN4N0gk89zhHaNiQPa6u6a7Itkvlop57hA4TekrSrScEPCnbehBiHYlcP+p4wb6Dk1gNSiNXvEPvyS8WbAlEg013L2RoxWp9jOnvmU8Kf+TNLmjDEZda0TKgFH4UDldVZzwZsEIArK+ZSwWqyGNozqDrR+Xpk/khNuh1Qegqu5O7y3E51g2XZgQ0KXDf9qyR/ggCpUpfT6P2TBJ21Gw+z2hwKu/Gnedyba7Zlf4qZevNoM7aO6LH2Dib0BZAGw1qnpF2BPJcYdXzdNOdzh8jDbkPjNbpQZjXKAWxE+8vu50xtK2UREdKhaislVlLF1CGDB+UW8++EpgOppya6VPRb/ZYKTLnHFoEcM2gjNC778sguYZn79ggG0Zav0pfqfLt4UKgZ18KqToAjFRwRdOtmFOPGapxViTZ0vcANZYzh59yfYslOEM5fPriDP8IQ+0274MfW9Bp4jrPDAT6OtTHx+YLAp5/5jksD8BBQU+FXvxYTTNi3UJU5LLp5IQ5nsspqQRFU1vL5TiSmucJbQqUzonrD9TKMeeaaTzXL9oEFsOg+Ly1eO8p9HYMEuiEjYdz4jG2ST4h7ywTJDBSipYRchCU+wr7iy9Dl7tQwCZCrShpWRMFwpD0xNgs0anNfYA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199015)(38100700002)(6486002)(966005)(478600001)(71200400001)(38070700005)(122000001)(82960400001)(4001150100001)(2616005)(15650500001)(186003)(316002)(8676002)(4326008)(54906003)(64756008)(66446008)(66946007)(66556008)(66476007)(110136005)(76116006)(91956017)(6506007)(5660300002)(36756003)(26005)(41300700001)(6512007)(8936002)(86362001)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVhNdU9Na3hUVXhGbnR3SmtPNFFxazNtOTMzdjl4dkVUemFtTmI1VFlHOVhS?=
 =?utf-8?B?NjUzRHVDQ2lNV2oxV3pIZzI5bUNWZkNxeGlXNjJZY242b2RQV2VWOUNxaEtI?=
 =?utf-8?B?dzlIWWJJcVIwUWxEQktMb1VWUzdrU3pFTHBCRnJjamhmY2YvUkRBY1JhaGhG?=
 =?utf-8?B?bXJzZkFuWlpsTndwSzhWVFExVzZ3SlNFRWx4UnlkSlBvWk5Od01JaVZQOGZq?=
 =?utf-8?B?RDFNQmhGRUdlYjEySklVQ3k0T2lselJzVjNaME56MXByTWtmOUxSblVOWFc3?=
 =?utf-8?B?b0FCTThPTXhPZnkrbnBndjYrWVJEZDh1a0lIVjF4VlN4bWdyb1o3bzBjSGIz?=
 =?utf-8?B?ZG8wOWJDc3dRcUZHU1NFcVBqQ0w0eFdtM0cvTUxId1B5aGhvQm5kVW85SG05?=
 =?utf-8?B?RmZGUUpSRHFiWG16T1JSeTVMZDVsYVNlVVRyaEpMZ1pTdWdxVmdMclNSVUhj?=
 =?utf-8?B?UktnZ0JjdUtXUmVvdHpNK3JWekx2cEhZNnBTWDhMcVJBd21iZEREaG1pMHdD?=
 =?utf-8?B?aDBOR1NYb3BZYUZrTlFVazI0RWxRRkpnUTV5Z0RHSkF6ekpTMGY3K2kxTHZi?=
 =?utf-8?B?VnRpQ0JUYWhOakNocnV3LytZdFRkb2RCVTdZWnVPbUROQ2VVSUZTR3lzVzk0?=
 =?utf-8?B?Qko0Y1c3ZmlmQVdLbm00Y0FGaGJOTUt5U0JyNWx0bWp4c2o3dXE3RTNYTmdX?=
 =?utf-8?B?VEV5MlVNa2lDM2s1c2pOVm9yNit3VmpSc1NMbGlVQnFQWUsvUmR3Y043YkEx?=
 =?utf-8?B?dHdReXAzTmFleHNEM2NJVGlORXlaSXBQaEFJVlNMTjEvSGRBOFhqb2F5YnhE?=
 =?utf-8?B?NUcvUERwR05YeVRmNkJlYThPZDltTWhRNU9WZDYyM3RhOHF5aHArenpHRWRS?=
 =?utf-8?B?cTg0RlB4aWRUeUppaGFHbnYzcnVmOFBnTjh0T2YwRDh5Q0FOb0dDR3NVcFFm?=
 =?utf-8?B?S29lUkl2bFAwb0FJZUxLZlNERnR5a2N6d3Y2UjRsRGNmRkNrc1poZEZVclp2?=
 =?utf-8?B?dVlKQlRMZHVZVTZGcFE2K1plQ1MvbHdRNWdNbTJsVTR6dnpIMHNxMmpHTDFM?=
 =?utf-8?B?Z2FmblRkdWVUL25ibHZhaTFQZHpkbldLWldndnFtdUZlcW9uQnpVVDh1Z1N1?=
 =?utf-8?B?ejVSSERXOWdONjFLdEswZmdzdzJTa1RCcS9yNUxCWitHQ3lVL0FCUWdIMzIx?=
 =?utf-8?B?eXhjeFcyM0tUTEY5TkxzNWg3bWx1R2VtSk9MamZhNXBiUzZhNUlwQ1FvaXdF?=
 =?utf-8?B?UlhIRlF2R2crUnpMZkpOUVZNTDlVemt3MU5PdkMzL1VzbElFUkhveERPaEdL?=
 =?utf-8?B?NDBHdzk3Q1VTdVU4WTVTN0pyOGtRRmFjcUptOE1DWjE1TTRMamZhUmpjQjJw?=
 =?utf-8?B?VVp6Tm4wNk53R21lbEowMWJtdUt5SUtkQ3JYVzJHb3dlZWZWMzNhZzJxRTVq?=
 =?utf-8?B?ODhudzJlOWlmNlUrWTJtVUUzZmZHTkhWR0pncXAxY1REeGlENjk4L1RPTm9z?=
 =?utf-8?B?S1JCMlhQNXJHYVJBUHB6d2NRdW91SVZkTEkwVi9YakNkeFhNcjBBZnRvSHJL?=
 =?utf-8?B?VEdyWFkvT2tKb2p4YW94eTNlN3BPYWlDSlYvS2dVRkNMLzdJYjBhSjNGelhP?=
 =?utf-8?B?RE5zN2I3OEZhNGtCR2t6MHF2cFZNZXVEUG5jRGpHbWpValBqak8zcEM1Wkhr?=
 =?utf-8?B?bzJpcGlkZFg1enY5MEplMndJbkROcUJocTg1eVhNUVlqcWRHMFdZdUlXN1Ew?=
 =?utf-8?B?a2szclBFbzcrM3BaU2FyL3hWWU5ISk9nNk8ySnhDdUhDZk90UDcybkcyRHk1?=
 =?utf-8?B?MlhhK2w0czdXbUR2UWZNT3dsTTFHMnVPQnN5RGxOUktpdUJMeHhtdTFuVWh4?=
 =?utf-8?B?djg4SEZ0VU5OZi8vcXhweVRzaHRuK0hCTkNPclYzelpDY25NZE1hbVg2U2ZQ?=
 =?utf-8?B?ZzJmbitLTDBLU1hWclljanhFKytBSm9IRXIrZGVDdXIzVWt5ZnpmZXQvbnZk?=
 =?utf-8?B?eXR3aFJRb0V2OTgyV096Y0QrRTRPNWcrSGw4N1hzMkxOL0hGcW81a2Z2YWxy?=
 =?utf-8?B?elZKUDFFZitwcEI2RzZ0TGhoSUVJSGdjUXQrZDFpQnpoRllzakM3dVRTTTRE?=
 =?utf-8?B?bU4rVy96YjFpUUJDZHREbUtLY0t4Q2w0TWJGaFN4Z3VLeTR4N2U1NDRyT1lX?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDAAD860DA4065478FEDC97CB2B6323B@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be37356-65fb-4902-0374-08daafda0614
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 00:53:36.5584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: es2aQnL0hOncpYOontZixaLAH2TN8ovKomGSDSoK6ewTmMluklstgrRAWcdo0h2GdF4Y4vy4zrvyTns1G3Qneg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7472
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=282f36034=Dmitry.Fomichev@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gU3VuLCAyMDIyLTEwLTE2IGF0IDIzOjA1ICswODAwLCBTYW0gTGkgd3JvdGU6Cj4gVXNlIHNj
cmlwdHMvdXBkYXRlLWxpbnV4LWhlYWRlcnMuc2ggdG8gdXBkYXRlIHZpcnRpby1ibGsgaGVhZGVy
cwo+IGZyb20gRG1pdHJ5J3MgInZpcnRpby1ibGs6YWRkIHN1cHBvcnQgZm9yIHpvbmVkIGJsb2Nr
IGRldmljZXMiCj4gbGludXggcGF0Y2guIFRoZXJlIGlzIGEgbGluayBmb3IgbW9yZSBpbmZvcm1h
dGlvbjoKPiBodHRwczovL2dpdGh1Yi5jb20vZG1pdHJ5LWZvbWljaGV2L3ZpcnRibGstemJkCj4g
Cj4gU2lnbmVkLW9mZi1ieTogU2FtIExpIDxmYWl0aGlsaWtlcnVuQGdtYWlsLmNvbT4KPiBSZXZp
ZXdlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IFNhbSBMaSA8ZmFpdGhpbGlrZXJ1bkBnbWFpbC5jb20+Cgp0aGUgZHVwbGljYXRlIHNp
Z24tb2ZmIGlzIG5vdCBuZWVkZWQuIFdpdGggdGhpcywKClJldmlld2VkLWJ5OiBEbWl0cnkgRm9t
aWNoZXYgPGRtaXRyeS5mb21pY2hldkB3ZGMuY29tPgoKPiAtLS0KPiDCoGluY2x1ZGUvc3RhbmRh
cmQtaGVhZGVycy9saW51eC92aXJ0aW9fYmxrLmggfCAxMDkgKysrKysrKysrKysrKysrKysrKysK
PiDCoDEgZmlsZSBjaGFuZ2VkLCAxMDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3N0YW5kYXJkLWhlYWRlcnMvbGludXgvdmlydGlvX2Jsay5oIGIvaW5jbHVkZS9zdGFu
ZGFyZC0KPiBoZWFkZXJzL2xpbnV4L3ZpcnRpb19ibGsuaAo+IGluZGV4IDJkY2M5MDgyNmEuLjQ5
MGJkMjFjNzYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zdGFuZGFyZC1oZWFkZXJzL2xpbnV4L3Zp
cnRpb19ibGsuaAo+ICsrKyBiL2luY2x1ZGUvc3RhbmRhcmQtaGVhZGVycy9saW51eC92aXJ0aW9f
YmxrLmgKPiBAQCAtNDAsNiArNDAsNyBAQAo+IMKgI2RlZmluZSBWSVJUSU9fQkxLX0ZfTVHCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDEywqDCoMKgwqDCoMKgLyogc3VwcG9ydCBtb3Jl
IHRoYW4gb25lIHZxICovCj4gwqAjZGVmaW5lIFZJUlRJT19CTEtfRl9ESVNDQVJEwqDCoMKgMTPC
oMKgwqDCoMKgwqAvKiBESVNDQVJEIGlzIHN1cHBvcnRlZCAqLwo+IMKgI2RlZmluZSBWSVJUSU9f
QkxLX0ZfV1JJVEVfWkVST0VTwqDCoMKgwqDCoMKgMTTCoMKgwqDCoMKgwqAvKiBXUklURSBaRVJP
RVMgaXMgc3VwcG9ydGVkICovCj4gKyNkZWZpbmUgVklSVElPX0JMS19GX1pPTkVEwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAxN8KgwqDCoMKgwqDCoC8qIFpvbmVkIGJsb2NrIGRldmljZSAqLwo+
IMKgCj4gwqAvKiBMZWdhY3kgZmVhdHVyZSBiaXRzICovCj4gwqAjaWZuZGVmIFZJUlRJT19CTEtf
Tk9fTEVHQUNZCj4gQEAgLTExOSw2ICsxMjAsMjAgQEAgc3RydWN0IHZpcnRpb19ibGtfY29uZmln
IHsKPiDCoMKgwqDCoMKgwqDCoMKgdWludDhfdCB3cml0ZV96ZXJvZXNfbWF5X3VubWFwOwo+IMKg
Cj4gwqDCoMKgwqDCoMKgwqDCoHVpbnQ4X3QgdW51c2VkMVszXTsKPiArCj4gK8KgwqDCoMKgwqDC
oMKgLyogU2VjdXJlIGVyYXNlIGZpZWxkcyB0aGF0IGFyZSBkZWZpbmVkIGluIHRoZSB2aXJ0aW8g
c3BlYyAqLwo+ICvCoMKgwqDCoMKgwqDCoHVpbnQ4X3Qgc2VjX2VyYXNlWzEyXTsKPiArCj4gK8Kg
wqDCoMKgwqDCoMKgLyogWm9uZWQgYmxvY2sgZGV2aWNlIGNoYXJhY3RlcmlzdGljcyAoaWYgVklS
VElPX0JMS19GX1pPTkVEKSAqLwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB2aXJ0aW9fYmxrX3pv
bmVkX2NoYXJhY3RlcmlzdGljcyB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9f
dmlydGlvMzIgem9uZV9zZWN0b3JzOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBf
X3ZpcnRpbzMyIG1heF9vcGVuX3pvbmVzOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBfX3ZpcnRpbzMyIG1heF9hY3RpdmVfem9uZXM7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoF9fdmlydGlvMzIgbWF4X2FwcGVuZF9zZWN0b3JzOwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBfX3ZpcnRpbzMyIHdyaXRlX2dyYW51bGFyaXR5Owo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB1aW50OF90IG1vZGVsOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB1aW50OF90IHVudXNlZDJbM107Cj4gK8KgwqDCoMKgwqDCoMKgfSB6b25lZDsK
PiDCoH0gUUVNVV9QQUNLRUQ7Cj4gwqAKPiDCoC8qCj4gQEAgLTE1Myw2ICsxNjgsMjcgQEAgc3Ry
dWN0IHZpcnRpb19ibGtfY29uZmlnIHsKPiDCoC8qIFdyaXRlIHplcm9lcyBjb21tYW5kICovCj4g
wqAjZGVmaW5lIFZJUlRJT19CTEtfVF9XUklURV9aRVJPRVPCoMKgwqDCoMKgwqAxMwo+IMKgCj4g
Ky8qIFpvbmUgYXBwZW5kIGNvbW1hbmQgKi8KPiArI2RlZmluZSBWSVJUSU9fQkxLX1RfWk9ORV9B
UFBFTkTCoMKgwqAgMTUKPiArCj4gKy8qIFJlcG9ydCB6b25lcyBjb21tYW5kICovCj4gKyNkZWZp
bmUgVklSVElPX0JMS19UX1pPTkVfUkVQT1JUwqDCoMKgIDE2Cj4gKwo+ICsvKiBPcGVuIHpvbmUg
Y29tbWFuZCAqLwo+ICsjZGVmaW5lIFZJUlRJT19CTEtfVF9aT05FX09QRU7CoMKgwqDCoMKgIDE4
Cj4gKwo+ICsvKiBDbG9zZSB6b25lIGNvbW1hbmQgKi8KPiArI2RlZmluZSBWSVJUSU9fQkxLX1Rf
Wk9ORV9DTE9TRcKgwqDCoMKgIDIwCj4gKwo+ICsvKiBGaW5pc2ggem9uZSBjb21tYW5kICovCj4g
KyNkZWZpbmUgVklSVElPX0JMS19UX1pPTkVfRklOSVNIwqDCoMKgIDIyCj4gKwo+ICsvKiBSZXNl
dCB6b25lIGNvbW1hbmQgKi8KPiArI2RlZmluZSBWSVJUSU9fQkxLX1RfWk9ORV9SRVNFVMKgwqDC
oMKgIDI0Cj4gKwo+ICsvKiBSZXNldCBBbGwgem9uZXMgY29tbWFuZCAqLwo+ICsjZGVmaW5lIFZJ
UlRJT19CTEtfVF9aT05FX1JFU0VUX0FMTCAyNgo+ICsKPiDCoCNpZm5kZWYgVklSVElPX0JMS19O
T19MRUdBQ1kKPiDCoC8qIEJhcnJpZXIgYmVmb3JlIHRoaXMgb3AuICovCj4gwqAjZGVmaW5lIFZJ
UlRJT19CTEtfVF9CQVJSSUVSwqDCoMKgMHg4MDAwMDAwMAo+IEBAIC0xNzIsNiArMjA4LDcyIEBA
IHN0cnVjdCB2aXJ0aW9fYmxrX291dGhkciB7Cj4gwqDCoMKgwqDCoMKgwqDCoF9fdmlydGlvNjQg
c2VjdG9yOwo+IMKgfTsKPiDCoAo+ICsvKgo+ICsgKiBTdXBwb3J0ZWQgem9uZWQgZGV2aWNlIG1v
ZGVscy4KPiArICovCj4gKwo+ICsvKiBSZWd1bGFyIGJsb2NrIGRldmljZSAqLwo+ICsjZGVmaW5l
IFZJUlRJT19CTEtfWl9OT05FwqDCoMKgwqDCoCAwCj4gKy8qIEhvc3QtbWFuYWdlZCB6b25lZCBk
ZXZpY2UgKi8KPiArI2RlZmluZSBWSVJUSU9fQkxLX1pfSE3CoMKgwqDCoMKgwqDCoCAxCj4gKy8q
IEhvc3QtYXdhcmUgem9uZWQgZGV2aWNlICovCj4gKyNkZWZpbmUgVklSVElPX0JMS19aX0hBwqDC
oMKgwqDCoMKgwqAgMgo+ICsKPiArLyoKPiArICogWm9uZSBkZXNjcmlwdG9yLiBBIHBhcnQgb2Yg
VklSVElPX0JMS19UX1pPTkVfUkVQT1JUIGNvbW1hbmQgcmVwbHkuCj4gKyAqLwo+ICtzdHJ1Y3Qg
dmlydGlvX2Jsa196b25lX2Rlc2NyaXB0b3Igewo+ICvCoMKgwqDCoMKgwqDCoC8qIFpvbmUgY2Fw
YWNpdHkgKi8KPiArwqDCoMKgwqDCoMKgwqBfX3ZpcnRpbzY0IHpfY2FwOwo+ICvCoMKgwqDCoMKg
wqDCoC8qIFRoZSBzdGFydGluZyBzZWN0b3Igb2YgdGhlIHpvbmUgKi8KPiArwqDCoMKgwqDCoMKg
wqBfX3ZpcnRpbzY0IHpfc3RhcnQ7Cj4gK8KgwqDCoMKgwqDCoMKgLyogWm9uZSB3cml0ZSBwb2lu
dGVyIHBvc2l0aW9uIGluIHNlY3RvcnMgKi8KPiArwqDCoMKgwqDCoMKgwqBfX3ZpcnRpbzY0IHpf
d3A7Cj4gK8KgwqDCoMKgwqDCoMKgLyogWm9uZSB0eXBlICovCj4gK8KgwqDCoMKgwqDCoMKgdWlu
dDhfdCB6X3R5cGU7Cj4gK8KgwqDCoMKgwqDCoMKgLyogWm9uZSBzdGF0ZSAqLwo+ICvCoMKgwqDC
oMKgwqDCoHVpbnQ4X3Qgel9zdGF0ZTsKPiArwqDCoMKgwqDCoMKgwqB1aW50OF90IHJlc2VydmVk
WzM4XTsKPiArfTsKPiArCj4gK3N0cnVjdCB2aXJ0aW9fYmxrX3pvbmVfcmVwb3J0IHsKPiArwqDC
oMKgwqDCoMKgwqBfX3ZpcnRpbzY0IG5yX3pvbmVzOwo+ICvCoMKgwqDCoMKgwqDCoHVpbnQ4X3Qg
cmVzZXJ2ZWRbNTZdOwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB2aXJ0aW9fYmxrX3pvbmVfZGVz
Y3JpcHRvciB6b25lc1tdOwo+ICt9Owo+ICsKPiArLyoKPiArICogU3VwcG9ydGVkIHpvbmUgdHlw
ZXMuCj4gKyAqLwo+ICsKPiArLyogQ29udmVudGlvbmFsIHpvbmUgKi8KPiArI2RlZmluZSBWSVJU
SU9fQkxLX1pUX0NPTlbCoMKgwqDCoMKgwqDCoMKgIDEKPiArLyogU2VxdWVudGlhbCBXcml0ZSBS
ZXF1aXJlZCB6b25lICovCj4gKyNkZWZpbmUgVklSVElPX0JMS19aVF9TV1LCoMKgwqDCoMKgwqDC
oMKgwqAgMgo+ICsvKiBTZXF1ZW50aWFsIFdyaXRlIFByZWZlcnJlZCB6b25lICovCj4gKyNkZWZp
bmUgVklSVElPX0JMS19aVF9TV1DCoMKgwqDCoMKgwqDCoMKgwqAgMwo+ICsKPiArLyoKPiArICog
Wm9uZSBzdGF0ZXMgdGhhdCBhcmUgYXZhaWxhYmxlIGZvciB6b25lcyBvZiBhbGwgdHlwZXMuCj4g
KyAqLwo+ICsKPiArLyogTm90IGEgd3JpdGUgcG9pbnRlciAoY29udmVudGlvbmFsIHpvbmVzIG9u
bHkpICovCj4gKyNkZWZpbmUgVklSVElPX0JMS19aU19OT1RfV1DCoMKgwqDCoMKgwqAgMAo+ICsv
KiBFbXB0eSAqLwo+ICsjZGVmaW5lIFZJUlRJT19CTEtfWlNfRU1QVFnCoMKgwqDCoMKgwqDCoCAx
Cj4gKy8qIEltcGxpY2l0bHkgT3BlbiAqLwo+ICsjZGVmaW5lIFZJUlRJT19CTEtfWlNfSU9QRU7C
oMKgwqDCoMKgwqDCoCAyCj4gKy8qIEV4cGxpY2l0bHkgT3BlbiAqLwo+ICsjZGVmaW5lIFZJUlRJ
T19CTEtfWlNfRU9QRU7CoMKgwqDCoMKgwqDCoCAzCj4gKy8qIENsb3NlZCAqLwo+ICsjZGVmaW5l
IFZJUlRJT19CTEtfWlNfQ0xPU0VEwqDCoMKgwqDCoMKgIDQKPiArLyogUmVhZC1Pbmx5ICovCj4g
KyNkZWZpbmUgVklSVElPX0JMS19aU19SRE9OTFnCoMKgwqDCoMKgwqAgMTMKPiArLyogRnVsbCAq
Lwo+ICsjZGVmaW5lIFZJUlRJT19CTEtfWlNfRlVMTMKgwqDCoMKgwqDCoMKgwqAgMTQKPiArLyog
T2ZmbGluZSAqLwo+ICsjZGVmaW5lIFZJUlRJT19CTEtfWlNfT0ZGTElORcKgwqDCoMKgwqAgMTUK
PiArCj4gwqAvKiBVbm1hcCB0aGlzIHJhbmdlIChvbmx5IHZhbGlkIGZvciB3cml0ZSB6ZXJvZXMg
Y29tbWFuZCkgKi8KPiDCoCNkZWZpbmUgVklSVElPX0JMS19XUklURV9aRVJPRVNfRkxBR19VTk1B
UMKgwqDCoMKgwqAweDAwMDAwMDAxCj4gwqAKPiBAQCAtMTk4LDQgKzMwMCwxMSBAQCBzdHJ1Y3Qg
dmlydGlvX3Njc2lfaW5oZHIgewo+IMKgI2RlZmluZSBWSVJUSU9fQkxLX1NfT0vCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoDAKPiDCoCNkZWZpbmUgVklSVElPX0JMS19TX0lPRVJSwqDC
oMKgwqDCoDEKPiDCoCNkZWZpbmUgVklSVElPX0JMS19TX1VOU1VQUMKgwqDCoMKgMgo+ICsKPiAr
LyogRXJyb3IgY29kZXMgdGhhdCBhcmUgc3BlY2lmaWMgdG8gem9uZWQgYmxvY2sgZGV2aWNlcyAq
Lwo+ICsjZGVmaW5lIFZJUlRJT19CTEtfU19aT05FX0lOVkFMSURfQ01EwqDCoMKgwqAgMwo+ICsj
ZGVmaW5lIFZJUlRJT19CTEtfU19aT05FX1VOQUxJR05FRF9XUMKgwqDCoCA0Cj4gKyNkZWZpbmUg
VklSVElPX0JMS19TX1pPTkVfT1BFTl9SRVNPVVJDRcKgwqAgNQo+ICsjZGVmaW5lIFZJUlRJT19C
TEtfU19aT05FX0FDVElWRV9SRVNPVVJDRSA2Cj4gKwo+IMKgI2VuZGlmIC8qIF9MSU5VWF9WSVJU
SU9fQkxLX0ggKi8KCg==

