Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582B3388A4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:28:48 +0100 (CET)
Received: from localhost ([::1]:46282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe6B-0001Bq-00
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKbfe-0006AL-Ef
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:53:14 -0500
Received: from esa1.fujitsucc.c3s2.iphmx.com ([68.232.152.245]:6578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKbfc-0003aB-F7
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:53:14 -0500
IronPort-SDR: ryfTCacMxAk2oJbe48CWTjf+szK/HupNfVA3gbABzaU/ib6bfyX90JWwpwdBh6yx3yvun/AbAh
 WHoG55GfovGrhjR1AvvNk4fla4jEVw8vHi1N/QeXOTi3atDKohuh6EKcrZeAjb7jym+WDZtTKc
 +KR33kCMAuDSxLt6asFAdbFCu0/4o9fR5p3Js/Ji8t+Ex/2QksqoGBMaUBsk2HccNgIO+ttg/q
 01+rQtjGq+iWrjBPdPpMuS6AkpwTEu9Rs90BI5zA2g+oziWt5TkH2EXHmop9ciMUJwZkH1kmYB
 vmY=
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="35906953"
X-IronPort-AV: E=Sophos;i="5.81,242,1610377200"; d="scan'208";a="35906953"
Received: from mail-ty1jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 15:53:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a41d+vybMFkn/9RMWid6XRCeFS+NO9x39xJSJ2weC3VUlYs8kgvgmHewV2khuH2GvKt5vd6Mkm+Stow8xWWjJw+OBbs8LhWHInjbKRCo7J3Qd7FAOWfc0E4kWWaRRvuUdFltAc5DbgWfnQfePIlVnhKi0TzysPlPU2NnI6hQUqWuwtYcKcNwF3eWacEar5tIu6veDXtLwbn0F8qzvZH2EGiJnw/ITZKi42cRqmG/IMjGKwawFnpIvwBbillEUGQ0Yjcx13mWjNCnvOhmA6a5GtPnDmvTlan9TOaUFx84PBLGZHxOt+xUax4X/epW+AbYMz0Cs10inaj4CB0tybgpCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AmOJMWnKnC1OU3whQhVM1s8iEx7rasyay5gzOtZGIU=;
 b=QN7Cc+6W9+I/xUg2ykO1JyglbkEKJiGGVSK1QpLdQKH7CnUREhSeXfqHDnB11nM63uvQtHvVoAMkmKnJLS+TaBk9tbU3nlyVhmDGteXNmRZr45pa3jxevvGnKrkDcUTdavCwqMxYf9mzy4ZpJ0A42pLnDHKdLaQY4hAo5XvIAqEQEo0Pb53ZQkC6t6QoM1ztVo/e+gPgghMhuiEMjvfIvLYBGMqdH+E7A1fGnz43goH1Pw4icEvoh+puRq7uDoa0bOoS6CjSM6Blns89yyKcvPcGKVsnUdltIYi8pdN8rGEVOs/JMuR5iY71clcfQg0ZvQ9J13D9/qztVUzy3g99lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AmOJMWnKnC1OU3whQhVM1s8iEx7rasyay5gzOtZGIU=;
 b=kFzcZ9B7bJPOphZPJOMh2AmwTcXd749e3Ik8fULJmUNvmSZ2Rhc3IOFbgQENdcQkC6/opWaAX8bDts3AqilzyvRskyou8dKD/ebQE+lYzXFeaapRhDzhDyn7fuVyWxyWHNTTSSzThk9X8bGiIJBrYmD1zsig1iWB2NbLndMnHWs=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYCPR01MB5741.jpnprd01.prod.outlook.com (2603:1096:400:b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 06:53:05 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a%3]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 06:53:05 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: leirao <lei.rao@intel.com>, "chen.zhang@intel.com" <chen.zhang@intel.com>, 
 "jasowang@redhat.com" <jasowang@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "lukasstraub2@web.de"
 <lukasstraub2@web.de>
Subject: Re: [PATCH v2 05/10] Optimize the function of packet_new
Thread-Topic: [PATCH v2 05/10] Optimize the function of packet_new
Thread-Index: AQHXFwAvofO7yNsk1kS/2FPRlN4d4Kp/6q0A
Date: Fri, 12 Mar 2021 06:53:05 +0000
Message-ID: <e5247376-5319-64d0-850c-5a28415c1c41@fujitsu.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
 <1615525383-59071-6-git-send-email-lei.rao@intel.com>
In-Reply-To: <1615525383-59071-6-git-send-email-lei.rao@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10a409de-ea2c-4e43-7c1e-08d8e5237d04
x-ms-traffictypediagnostic: TYCPR01MB5741:
x-microsoft-antispam-prvs: <TYCPR01MB5741C7D6E8EFBB78B6095F12A56F9@TYCPR01MB5741.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:82;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mZuI3qKait9ydLDFWJDzPvK8lw72Z0K/+WkwIQUX57uCJjY/Om2u9VAJdkmW1r2ypJL+hjiiVaR+JW3DXrzfXiiA5626X3+5jncxRSNwwoe/2vM9F8xN31mGm+cHtm7WxI/L5pF2M6oDiWJ+uulqDdwUVOguLduITxJlTpHY4bXrWBmPWX3+8k/FbIisd8K1gq4IPKdNFvd4qZ2Pl3SGhMklGG/QCgAV7Emjv0n4gxz2wcmTDk7VQAjDuI5t6sgJyQLqLBUGanMLhDFiW2+QF2HgXYJbFVn3n3tPX9WGChcw9UJRjQjsG2gYjmJbnInvPnS+/odhlXiWoDDdgGw2kgdQH5BAp3HvBHnHzgUn7+ol6Mgwmu6soQMuk8+e8K30fuqBVihaYNbbf2DABAhicfUpiPuoaFRs0TYk8AXP45UqlW5XhwKWlQhyrAoMRYlpXLc4dqZnSZGSTVevUDhUxk+HPoG25HW8VM/U/pVsGKDhswPBbtYN6u3Ka6F4VzKtDMbSMEMIlxVyjWNnmOJZdDzzNlgZMPV0AEhJZYD/gSDIeeJsu7KlJ91upDDOOnmJkVsO0jzsZoCeoJ/Qicg6ZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(36756003)(6512007)(4326008)(66476007)(31686004)(6486002)(8676002)(71200400001)(26005)(8936002)(6506007)(110136005)(53546011)(186003)(5660300002)(64756008)(316002)(478600001)(83380400001)(91956017)(66556008)(76116006)(2616005)(85182001)(66446008)(31696002)(2906002)(66946007)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eUlqcGxnOEJidTQwTDVDRUFremZteXhySTZLQk5kenpTYlJyem94LzRkNEND?=
 =?utf-8?B?dk1XNEtDWVFxYWJoMFM3aTFmRGF1Zkpwc21KM3dvbmNhclZFSlBMTTNoL1Ux?=
 =?utf-8?B?OTNySWJtZHY3d0FJb2tjMjhFM0tJZUg4SHpsVVVMUUoyNmw3VTc0cXgxcmMz?=
 =?utf-8?B?V0hCMHErS2NMOGUyL2xjN1kyeExRNVJMeDA4TGNxS3V2Rlp5SXBaYkx5QzZX?=
 =?utf-8?B?d05ZbjVFemdEbXVuS3VxbTFFeHEzS2lGZm9MOEdJL1ZnM2xiSDZoV3BKQTdR?=
 =?utf-8?B?YWM1MGZpSXVzeWVrNncvbVdhWFlrRk1qcVA3WjZJeGJJbEZpVWxxc0VyVUpp?=
 =?utf-8?B?b3pLRTk3SHNBQ1J5T2RLVUdvNkEyYnpaTUhLS3JKa1U5bHBZcHp5QVZlY0JB?=
 =?utf-8?B?ZzdCUk1XSW1FdmMyV3I3V0tkMWV1TGdKMFFMeFFWRnBmZnI4NnZ1aER6blRM?=
 =?utf-8?B?L0Mxc2dxZEFuaHovdGorL21QYXpLMWhhc3ZnaGREU0dkaTQ4QkQ0QkVHdjhs?=
 =?utf-8?B?Nk4rUTJoUElrSFp1TnZkWVloSDhaQkVwTHJwNkhPeHR1L1RNaW9wLzM2OXZD?=
 =?utf-8?B?VDh5dk15Q3FJUWJIaGhsQWRzeWszQUlick8yRlVGWmkrak82TlJzeCs0SHFo?=
 =?utf-8?B?Z3dOZG04VDFWUGs3L1hjcFhxY2FKM0orRXpMUFZXYW5GbmNvSmVEMzBMcWNX?=
 =?utf-8?B?THR0RDBzSHQvZmlwOFg4U2p6L2diNWlIMCtXOElkQ0Zqd2czYkRZWjZhM3ZV?=
 =?utf-8?B?aTRMUzBUeXlGdXloS1lTNFVoUnpnbWIvUllzVGFSTVBFaHA4SXY5QVN2N0VS?=
 =?utf-8?B?Y0JlVTVXZlA3RGVjMmZZQkpXT2ROdWJxKy9YeVp0WDB4WThsSzFOK0hOTGw0?=
 =?utf-8?B?cmM5WlgvNlE4Z1l2VFViSDB3R1d3cDVZUkF6Z3ZlZUdqSk1wR2h6NVUwVlhY?=
 =?utf-8?B?WHI2QlBhNE9GdFBqaGxkbm9VNUZGVUQ1VGZ4WXlYZS9OMTA0Y1JlV0RvWnlx?=
 =?utf-8?B?cGRtL1pKdEQzRU1mRXZEOGhocmw2MzYvdnM4TFFwZXA2Q2ZyNzMzeHkrek9x?=
 =?utf-8?B?UG1BMEtVaVBjNEMycU1rdWJLUFlhUU12Mm90ZzJFM29IMkR3b3FBYWQwOWtx?=
 =?utf-8?B?KytlcEQvVFJQWlFGRlBIL3BuSG5kMXNVeFlteko0K3R5aS9ELzFKR1c4Y1Bp?=
 =?utf-8?B?K2NoYkhvQjV0ZzZYMHBEMUlqNng3Wm5ucjE1M0drN3ZLS0NpZUVFODlZWDlR?=
 =?utf-8?B?REFkcVVtSldRQlJndUlCVnRhT3E0ay9TTGtBelRzNkd3aHNuU0Z2cWNZNHF4?=
 =?utf-8?B?TXJHUzkwQjRLd1ZZY2RwdkdYVE5pV0NqSXl6cmhSM1BEZ0JwdWlkdHZBelBo?=
 =?utf-8?B?Qk5SM1lYb2NqblcxTHJPRG8vSmpaTGp1dm9qeXhYc2RQRUlPTDdEUkorV1po?=
 =?utf-8?B?YTl2VlBDdmpiZXJTQlk2aEFPdW56cEp4blowYTJQS2VlaytxMjBmcTNOMW1r?=
 =?utf-8?B?Zk9majE1My9QcXJUS0NwNXJGSlBoWkxzSFdtLzNTekRidkdWWk16UTl3eTRm?=
 =?utf-8?B?LzlyS1YwYlRuVnNFd1FsanptekN4disrdFV6R0g4QmNmZFBJK2RZVTdYVGxO?=
 =?utf-8?B?bDREWUxmZ0FrWWhVU0RxNFUrWlFremw4OEt2SVNDSFpCaGVpU1lxYkYyeWh4?=
 =?utf-8?B?KyttQmhpOFQwTTM3bWdUOThsYmREV3hneWw3M0VQbUNVVkhwUisvL2toUjVT?=
 =?utf-8?Q?XPzUvGfUdDoinMHjHmjxzgJmSD45SY4/r3D/E0O?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1836BE6D4248AD4D859B5A654154F6B5@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a409de-ea2c-4e43-7c1e-08d8e5237d04
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 06:53:05.5877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yV599QFIpyJG0ngB689MSaCH7f85ONYPTEInWmataP7+c1DGw8jVBHouoseeVANtvByw15RAeupRyaVSEYdJFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5741
Received-SPF: pass client-ip=68.232.152.245;
 envelope-from=lizhijian@fujitsu.com; helo=esa1.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Mar 2021 04:24:44 -0500
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDMvMTIvMjEgMTowMiBQTSwgbGVpcmFvIHdyb3RlOg0KPiBGcm9tOiAiUmFvLCBMZWki
IDxsZWkucmFvQGludGVsLmNvbT4NCj4NCj4gaWYgd2UgcHV0IHRoZSBkYXRhIGNvcHkgb3V0c2lk
ZSB0aGUgcGFja2V0X25ldygpLCB0aGVuIGZvciB0aGUNCj4gZmlsdGVyLXJld3JpdGUgbW9kdWxl
LCB0aGVyZSB3aWxsIGJlIG9uZSBsZXNzIG1lbW9yeSBjb3B5IGluIHRoZQ0KPiBwcm9jZXNzaW5n
IG9mIGVhY2ggbmV0d29yayBwYWNrZXQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IExlaSBSYW8gPGxl
aS5yYW9AaW50ZWwuY29tPg0KPiAtLS0NCj4gICBuZXQvY29sby1jb21wYXJlLmMgICAgfCA3ICsr
KysrLS0NCj4gICBuZXQvY29sby5jICAgICAgICAgICAgfCA0ICsrLS0NCj4gICBuZXQvY29sby5o
ICAgICAgICAgICAgfCAyICstDQo+ICAgbmV0L2ZpbHRlci1yZXdyaXRlci5jIHwgMSAtDQo+ICAg
NCBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+DQo+IGRp
ZmYgLS1naXQgYS9uZXQvY29sby1jb21wYXJlLmMgYi9uZXQvY29sby1jb21wYXJlLmMNCj4gaW5k
ZXggOWUxOGJhYS4uOGJkZjVhOCAxMDA2NDQNCj4gLS0tIGEvbmV0L2NvbG8tY29tcGFyZS5jDQo+
ICsrKyBiL25ldC9jb2xvLWNvbXBhcmUuYw0KPiBAQCAtMjQ3LDE0ICsyNDcsMTcgQEAgc3RhdGlj
IGludCBwYWNrZXRfZW5xdWV1ZShDb21wYXJlU3RhdGUgKnMsIGludCBtb2RlLCBDb25uZWN0aW9u
ICoqY29uKQ0KPiAgICAgICBDb25uZWN0aW9uS2V5IGtleTsNCj4gICAgICAgUGFja2V0ICpwa3Qg
PSBOVUxMOw0KPiAgICAgICBDb25uZWN0aW9uICpjb25uOw0KPiArICAgIGNoYXIgKmRhdGEgPSBO
VUxMOw0KPiAgICAgICBpbnQgcmV0Ow0KPiAgIA0KPiAgICAgICBpZiAobW9kZSA9PSBQUklNQVJZ
X0lOKSB7DQo+IC0gICAgICAgIHBrdCA9IHBhY2tldF9uZXcocy0+cHJpX3JzLmJ1ZiwNCj4gKyAg
ICAgICAgZGF0YSA9IGdfbWVtZHVwKHMtPnByaV9ycy5idWYsIHMtPnByaV9ycy5wYWNrZXRfbGVu
KTsNCj4gKyAgICAgICAgcGt0ID0gcGFja2V0X25ldyhkYXRhLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzLT5wcmlfcnMucGFja2V0X2xlbiwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcy0+cHJpX3JzLnZuZXRfaGRyX2xlbik7DQo+ICAgICAgIH0gZWxzZSB7DQo+IC0gICAg
ICAgIHBrdCA9IHBhY2tldF9uZXcocy0+c2VjX3JzLmJ1ZiwNCj4gKyAgICAgICAgZGF0YSA9IGdf
bWVtZHVwKHMtPnNlY19ycy5idWYsIHMtPnNlY19ycy5wYWNrZXRfbGVuKTsNCj4gKyAgICAgICAg
cGt0ID0gcGFja2V0X25ldyhkYXRhLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBzLT5z
ZWNfcnMucGFja2V0X2xlbiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgcy0+c2VjX3Jz
LnZuZXRfaGRyX2xlbik7DQo+ICAgICAgIH0NCj4gZGlmZiAtLWdpdCBhL25ldC9jb2xvLmMgYi9u
ZXQvY29sby5jDQo+IGluZGV4IGVmMDA2MDkuLjA4ZmIzN2UgMTAwNjQ0DQo+IC0tLSBhL25ldC9j
b2xvLmMNCj4gKysrIGIvbmV0L2NvbG8uYw0KPiBAQCAtMTU1LDExICsxNTUsMTEgQEAgdm9pZCBj
b25uZWN0aW9uX2Rlc3Ryb3kodm9pZCAqb3BhcXVlKQ0KPiAgICAgICBnX3NsaWNlX2ZyZWUoQ29u
bmVjdGlvbiwgY29ubik7DQo+ICAgfQ0KPiAgIA0KPiAtUGFja2V0ICpwYWNrZXRfbmV3KGNvbnN0
IHZvaWQgKmRhdGEsIGludCBzaXplLCBpbnQgdm5ldF9oZHJfbGVuKQ0KPiArUGFja2V0ICpwYWNr
ZXRfbmV3KHZvaWQgKmRhdGEsIGludCBzaXplLCBpbnQgdm5ldF9oZHJfbGVuKQ0KPiAgIHsNCj4g
ICAgICAgUGFja2V0ICpwa3QgPSBnX3NsaWNlX25ldyhQYWNrZXQpOw0KPiAgIA0KPiAtICAgIHBr
dC0+ZGF0YSA9IGdfbWVtZHVwKGRhdGEsIHNpemUpOw0KPiArICAgIHBrdC0+ZGF0YSA9IGRhdGE7
DQoNCmlmIHNvLMKgIHNob3VsZCBwYWNrZXRfZGVzdHJveSgpwqAgZnJlZSgpIGRhdGEgd2hpY2gg
bWF5IGJlIG5vdCBhbGxvYyBieSBpdHNlbGYNCg0KVGhhbmtzDQpaaGlqaWFu

