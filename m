Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC91736BD5F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 04:34:00 +0200 (CEST)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbDXz-0000bt-BF
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 22:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lbDWa-0008Ib-6Q
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 22:32:32 -0400
Received: from mga03.intel.com ([134.134.136.65]:22860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lbDWV-0007rL-Ug
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 22:32:31 -0400
IronPort-SDR: NXii+j8ghNPLr/5+AgI5QNUI88yXAbq5skhmuEBYT6GHLtsPW16gmpcaPJPyUdefDYzAu41xGx
 6eT+yWydPRyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="196496897"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="196496897"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 19:32:20 -0700
IronPort-SDR: ywuYdGzvEyIR1aMLNZ8NDldWAfAVnNM0vDQ7dxCbfqEDSCIAjr0ypkfOsSWvsDQvjvIsPrwBMn
 jnthjUPCMXEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="457434748"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2021 19:32:19 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 26 Apr 2021 19:32:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 26 Apr 2021 19:32:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 26 Apr 2021 19:32:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3z1dVmirTBWP2ar/BMHOiyw7loUl0dxSphOuyWEEsXSwGpRP/B1CUR8C39zb6wPDEv1hsN8F8hWWWquQgI35oaFtWwobaWSzI/uqjcpEQIvgbh/aHLkyZckZer72Ak8pis/rylJiinmlGv9maCg0kctzd1rPSTTWYDXrSGMbUBdoGTrp1BxubmO4Te94aoZFb/Cn9DSqS2kpn/xxJR4KV5R/BFAPUu6EpIGKP1uOV3VTL+OwUXV6bUN9oN5PVUl+Uu3O50G7EKOcHl96iFsWnSW7PPwI/ebEjRbgNXRIVBxljl8Hu3Lx37iLvrkHXTt6NEt5UuNnQe7ldbyPPAtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRUQ02HihzWwIY2mU5cAfT5+/DxQcwXhemyD1sbcOK8=;
 b=LE+XSVpruaeXEvBr4Wu+25gRdb81Gr8TErh3/CGZQpljWtfod6NaDWITIAJP8qVoDix0N8Y/BtbkszHT38r3bkoRDZVv7373nmwpSLsuMmsa9fOYzp9PkwxfNSokyGr0Ebq4TKRE3OVzc3Y5i+2g53dRf1TBvWQBTjeHjzUdhP4ny7bZKz1cdR7ga6dyZkxZSJKLjETaQ8dYeJPAhzS1nIRRXV9fi5cG50DZHSsaEdU8i9/KRhgTxY9BDyd0Eja0ruH+QwhO3jR6dcg3lRUDuilozqRe3ZiNMleT4vCNQpdOPENx6T5ef/M/sG+yBHIxq7PWArJ74jwsIr1ORkpnmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRUQ02HihzWwIY2mU5cAfT5+/DxQcwXhemyD1sbcOK8=;
 b=JjFSV4YNvYooLSwKswWQhmrSGXJtVpN3e52EnOmIV7tuwVcCLUkKg33rWoGH/vAHQjsEGBCQhYVtuHS0wZb6mjJpoQY4CtMBXFyfTLee4q3BuS7adKgHVSTW5j4q9a/FarbtNgWH0f32A5l7zpqxRbJPI2di3yuR9D1xxjQ+OAo=
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22; Tue, 27 Apr 2021 02:32:16 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::39f3:a8d1:d98e:c2db]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::39f3:a8d1:d98e:c2db%5]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 02:32:15 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: "dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: RE: [PATCH v6 09/10] Add the function of colo_bitmap_clear_dirty
Thread-Topic: [PATCH v6 09/10] Add the function of colo_bitmap_clear_dirty
Thread-Index: AQHXLPKwMLHFODNKkE+OXsAxdG/a9qq2zXtwgBDwzyA=
Date: Tue, 27 Apr 2021 02:32:15 +0000
Message-ID: <DM8PR11MB5640F523E220ECAB2A21DA41FD419@DM8PR11MB5640.namprd11.prod.outlook.com>
References: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
 <1617938456-315058-10-git-send-email-lei.rao@intel.com>
 <DM8PR11MB56405F571F0D4B2C77A71932FD4C9@DM8PR11MB5640.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB56405F571F0D4B2C77A71932FD4C9@DM8PR11MB5640.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.46.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14e2fa40-f2a5-431a-9cf8-08d90924ac12
x-ms-traffictypediagnostic: DM8PR11MB5608:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR11MB5608490827DCCF9329C0DACFFD419@DM8PR11MB5608.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OLi62YVE9mTxrOK1rR36FG0tg80q5S76ZqR67XrbOrLSE5l8cfQbDxdbMsnV4HILYtGJd5Phhs1JQ/FrHVlK3s1Sox2KXAYHtUQunvNUrDmeHz8jISJbKleLTcxZRdbUDxGL8XAOl4lMPB9zJW9FU7WbJgLyNMiNPNgtPTB6NkZkabSxYxnuQVWJIqhdprJaZBQFOMa0vQnFJYEIV2Iwd5O07g6Dw2R9aX/vyjmuTkwu2DMlnlIn6jV4fZQVM1WkYhYNO1+g2T6HoGyZiEo0s7LGt8ZZKgrtVJDgwO8H2kTIb5XXUTw0n2tFUQWP7/D0bC2ATNrGYx4e91EFjXjda9F9gBKacs8AQO05Cml++UWUaYCILb862czCP7op8f9wc7iru2cMyOjVzvEKl/WKSe/w1okOB4fJuqCrdKV69T5OMHSDAY1sBIFqONV1Nk29S5hPh0zVPgJIe3oywrRYM7FJdkvDRlWdnDuyyFyxqQw51tYz9UZR8bStaSz5DDcfZ/u5dvZ5Pv7MqHmZ2e301i/0WP0ZN1Y72KbW2228sfeaISyOP5wXbg4paMe4ILvP7FYWrzBqjZIZCKBzAnRsKwXbJi71HRtcgoqk2dnaiYOTiI3Nt8batDAL+0S361scnwYraSK57kucLZS5ZVdXrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(396003)(366004)(376002)(136003)(86362001)(66476007)(186003)(53546011)(26005)(316002)(66946007)(2906002)(9686003)(6916009)(5660300002)(8676002)(76116006)(52536014)(64756008)(54906003)(55016002)(122000001)(6506007)(7696005)(71200400001)(38100700002)(8936002)(33656002)(478600001)(66446008)(83380400001)(4326008)(66556008)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?7AeJV5gpldUoabClDs8o/qvivXg6Fry/qaSkwhfYwX+GcuupspYJQ48bxiYJ?=
 =?us-ascii?Q?i9ID889VllVjEFQarnxxeNTSOorvTYzdeJIL+d4Ar4quFR8s5BWHYtnZr8Pc?=
 =?us-ascii?Q?Y84SmCH2QDVjtGKR/DPYdeVMKzbbR5okYv9KYvbQDi6Ve0hzx8Kj6I2fo4pF?=
 =?us-ascii?Q?GBDL27yFN9kneEogxwiTtpc/jG2DF+TeKcctHk+yT6zD58Rxwcc6Jvhe7cCD?=
 =?us-ascii?Q?cmDvnxb0UOa3s+YWG7cbBl5EHw9JnHJlZ45vtwTevGOtqGzKiLrBAptOhx0I?=
 =?us-ascii?Q?VIy1cxnripdXxJWeG6IFEn5EBl6/Xl28T+mEm534wfoBdJrQZNC2DZgZySte?=
 =?us-ascii?Q?iMZTcf8dZMRbqyFU3IdYv2qcqcT19YUlUeAtV3Ln7V540behkIa1/asmnSo+?=
 =?us-ascii?Q?gNskp3JHjvjPq+aTlsHRaBaV5rdutkMp/qS9fEqI69pCXhzht7A0NfrDczuX?=
 =?us-ascii?Q?PLhNDb1UjzUvvgNp7RyuP8KmEoezerIr+HOIlltJBGL0rV0kdDrR44P9uLsn?=
 =?us-ascii?Q?w4MnyBjlvDzfMWGdWJizIwvd3QF+GlR8ou0xGd3K+OxO6RxRjCMR4nqLqO40?=
 =?us-ascii?Q?I1YLDbk1NRY6buZebSRWx5fC7klJBetBGfPuevaIg7101fCvjIzCRZQgrOa2?=
 =?us-ascii?Q?bLmHq9nDUiKbaH562RdZXW6GeEZUlbLzkQEAgCbLFjGRVSa+pH1cMBI8vHSV?=
 =?us-ascii?Q?n5NisJajRTTdLeiR8qBiJOMJkSG8TVBRzx+iC3ThEo+647VGGtzcIXQvumC7?=
 =?us-ascii?Q?sgNdAaLRKksEWct7ewTtbycVG6Cb1ydjlG71BEbZjK8didwRUvrFd70wuXrx?=
 =?us-ascii?Q?hIHeHD5+pf9Wgs8ccnPqsSeW+Q83HQbrsHEhXZbVP6wTv6tGP8G02pgb0Gzb?=
 =?us-ascii?Q?Xzo7r/6Ywh1lkdWMPNkzWlurrFMS/rDkLXxDPiCg/2P6ifqrz+5mXJeDZkTR?=
 =?us-ascii?Q?i/G+u2dbtZa9I7zDD7m1N0pJxETCPmQtJTDfPr2YK52xcox0NF/gBHl3Wdyd?=
 =?us-ascii?Q?HJW0ZSZTKp5L/Lv5KtBggxTlxSVRvRde3Dv6i63aUjOs7cbt2igFQR340FE0?=
 =?us-ascii?Q?a8LSUImXjW+UXOW1xf8fYWXt9AU9kbJeXExF/+6f1G3j8TjYdC2pxrCfJHRI?=
 =?us-ascii?Q?etH4r8Gk6CFFDycvXqn97xJwjkXPjTBREoAdNAkwJHWYcgLsJPhxPN34eH6S?=
 =?us-ascii?Q?9AHuWmomfhfORrZy5poO/9ZlazFA4R6dsgQLhV1rwtpQDjtto8AFmmvnpEjl?=
 =?us-ascii?Q?A2vfEMN//QIEXIg9Hl6CDkmyJbi9Au18Ehdk1BZxhPOkvrE8uGsKpZ9wh/eP?=
 =?us-ascii?Q?HyU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e2fa40-f2a5-431a-9cf8-08d90924ac12
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 02:32:15.9471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oULEFDXGNAkW0nnFjDG2zomWCiM7msssr0iLMyq633HCfdrryKuBAIAserg0QGwOsezvUG5uVg1JFFEVDXajGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5608
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=lei.rao@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "lukasstraub2@web.de" <lukasstraub2@web.de>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Dave

I think this set of patches is beneficial to upstream. Please check these p=
erformance data. If you have any other ideas, please let me know.

Thanks
Lei.

-----Original Message-----
From: Rao, Lei=20
Sent: Friday, April 16, 2021 3:57 PM
To: dgilbert@redhat.com
Cc: qemu-devel@nongnu.org; Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn=
.fujitsu.com; jasowang@redhat.com; quintela@redhat.com; pbonzini@redhat.com=
; lukasstraub2@web.de
Subject: RE: [PATCH v6 09/10] Add the function of colo_bitmap_clear_dirty

Hi, Dave

The performance data has added to the commit messages.=20
Do you have any other suggestions?

Thanks
Lei.

-----Original Message-----
From: Rao, Lei <lei.rao@intel.com>
Sent: Friday, April 9, 2021 11:21 AM
To: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; quintela@redhat.com; dgilbert@redhat.com; pbonzini@redhat.com; =
lukasstraub2@web.de
Cc: qemu-devel@nongnu.org; Rao, Lei <lei.rao@intel.com>
Subject: [PATCH v6 09/10] Add the function of colo_bitmap_clear_dirty

From: "Rao, Lei" <lei.rao@intel.com>

When we use continuous dirty memory copy for flushing ram cache on secondar=
y VM, we can also clean up the bitmap of contiguous dirty page memory. This=
 also can reduce the VM stop time during checkpoint.

The performance test for COLO as follow:

Server configuraton:
CPU :Intel(R) Xeon(R) Gold 6140 CPU @ 2.30GHz MEM :251G(type:DDR4 Speed:266=
6 MT/s) SSD :Intel 730 and DC S35x0/3610/3700 Series SSDs

dirty pages:3189376  migration_bitmap_clear_dirty time consuming(ns):105194=
000 dirty pages:3189784  migration_bitmap_clear_dirty time consuming(ns):10=
5297000 dirty pages:3190501  migration_bitmap_clear_dirty time consuming(ns=
):105410000 dirty pages:3188734  migration_bitmap_clear_dirty time consumin=
g(ns):105138000 dirty pages:3189464  migration_bitmap_clear_dirty time cons=
uming(ns):111736000 dirty pages:3188558  migration_bitmap_clear_dirty time =
consuming(ns):105079000 dirty pages:3239489  migration_bitmap_clear_dirty t=
ime consuming(ns):106761000

dirty pages:3190240  colo_bitmap_clear_dirty time consuming(ns):8369000 dir=
ty pages:3189293  colo_bitmap_clear_dirty time consuming(ns):8388000 dirty =
pages:3189171  colo_bitmap_clear_dirty time consuming(ns):8641000 dirty pag=
es:3189099  colo_bitmap_clear_dirty time consuming(ns):8280000 dirty pages:=
3189974  colo_bitmap_clear_dirty time consuming(ns):8352000 dirty pages:318=
9471  colo_bitmap_clear_dirty time consuming(ns):8348000 dirty pages:318968=
1  colo_bitmap_clear_dirty time consuming(ns):8426000

it can be seen from the data that colo_bitmap_clear_dirty is more efficient=
.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c index 8661d82..11275cd 10064=
4
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -857,6 +857,36 @@ unsigned long colo_bitmap_find_dirty(RAMState *rs, RAM=
Block *rb,
     return first;
 }
=20
+/**
+ * colo_bitmap_clear_dirty:when we flush ram cache to ram, we will use
+ * continuous memory copy, so we can also clean up the bitmap of=20
+contiguous
+ * dirty memory.
+ */
+static inline bool colo_bitmap_clear_dirty(RAMState *rs,
+                                           RAMBlock *rb,
+                                           unsigned long start,
+                                           unsigned long num) {
+    bool ret;
+    unsigned long i =3D 0;
+
+    /*
+     * Since flush ram cache to ram can only happen on Secondary VM.
+     * and the clear bitmap always is NULL on destination side.
+     * Therefore, there is unnecessary to judge whether the
+     * clear_bitmap needs clear.
+     */
+    QEMU_LOCK_GUARD(&rs->bitmap_mutex);
+    for (i =3D 0; i < num; i++) {
+        ret =3D test_and_clear_bit(start + i, rb->bmap);
+        if (ret) {
+            rs->migration_dirty_pages--;
+        }
+    }
+
+    return ret;
+}
+
 static inline bool migration_bitmap_clear_dirty(RAMState *rs,
                                                 RAMBlock *rb,
                                                 unsigned long page) @@ -37=
74,11 +3804,7 @@ void colo_flush_ram_cache(void)
                 num =3D 0;
                 block =3D QLIST_NEXT_RCU(block, next);
             } else {
-                unsigned long i =3D 0;
-
-                for (i =3D 0; i < num; i++) {
-                    migration_bitmap_clear_dirty(ram_state, block, offset =
+ i);
-                }
+                colo_bitmap_clear_dirty(ram_state, block, offset, num);
                 dst_host =3D block->host
                          + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
                 src_host =3D block->colo_cache
--
1.8.3.1


