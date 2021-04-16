Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC63361AEA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 09:58:34 +0200 (CEST)
Received: from localhost ([::1]:59210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJN3-0006Ae-4k
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 03:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lXJLL-0005HQ-3S
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:56:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:59910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lXJLH-0000MU-PL
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:56:46 -0400
IronPort-SDR: yAMomYPP9+R1CqPVGwP9Jw2sa9UpR/MZmtNwSO5ykXlMprZMhfRtw2lso9ruCObtTcHI9xmD8c
 7hsvwRmX8OIA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="194564373"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="194564373"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 00:56:37 -0700
IronPort-SDR: wDZKUfCo256HdpBgx5Hk1O35Cagra3JEYtwC2sMOeHSpgQwietgivc9h711pcQfzsz1kz/sVlW
 Yl0OJt6l03mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="444429613"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga004.fm.intel.com with ESMTP; 16 Apr 2021 00:56:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 16 Apr 2021 00:56:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 16 Apr 2021 00:56:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Fri, 16 Apr 2021 00:56:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQKKTxtcVllmEaRsqLONhDwPA6OfurIfgUhdLTWW6c+TfkQ6+KHZNkUi0k+tVt2Yc/khPhlRDLPd7Msf27LHvOEqLQVluzaLZl7r95Ob/ww9wrL+X0uGPkBD5OKABev0QG8s19n0qD+bwLvGSzzDC4M83lN2EYUyEFyIEVVTIUYlru4FEaVrTGmzDq2XOcmf771EM6VbWn55uK6Z2/3vmc7qw6RZlVJTExM2FNOXbV8W8aBQSISaagsEYyE5GGIMJ/0ctIFjT1C5EX/+fs+2HQPLOm8IJ4FtXGv/8O/74dlQ8FabBJpglg3lVC/dmeDUwv0KWSH1oEgJ0hVYlyYqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTlRTqpuzQBB/gPo6c2TX4DCUKTU+3Vc2cb5V08WLH0=;
 b=HHtfZdyw16FFrL6tdkukadpFqeKFp6CekY6grnYkFLeJJCaMgmKYfDUxsjS55+7VTupfG+3ox0bhGfCTwe2JNMqX3UgAk6VkN6k8Drvofux1Sy77cCBJkDa9EIoZzWonnqv6QdFmoGJvpE+ig4OF4relK/3WYnWIWfmz4LRgfLrP3pGMrJUL73EwJbJQ8d91xwIyaejof+ZYD5+STQolmPkL/JC4629Ux8zBSUo4qnJ8ZO3P3kUNIW27OnxqJGY3tynPSEn8HAtJ//oBATiMiDVK1SbDb3NHsI9iXUZx9ukYJ4d2gx8VVCrP4ee8uhtpqbrKLhC+UhkLUHyQF4PZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTlRTqpuzQBB/gPo6c2TX4DCUKTU+3Vc2cb5V08WLH0=;
 b=IzlZ6CJaBpi2FM+jA4ckqJAXFHuoa3+S+2Xb/VqvSdqZLwtYqlHw13MGxJ8j/33bjtmwky2IlBwjvrL6Orx/bEy/DW3GwJovRBRQAZxoXDYDOEd5gWdBEKGk8hg8oZJXMysjcCjAthGbdJmMpjkyLdG2Bjyq67Wqo33kQHK8pP4=
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5621.namprd11.prod.outlook.com (2603:10b6:8:38::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.19; Fri, 16 Apr 2021 07:56:33 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::39f3:a8d1:d98e:c2db]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::39f3:a8d1:d98e:c2db%5]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 07:56:33 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: "dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: RE: [PATCH v6 09/10] Add the function of colo_bitmap_clear_dirty
Thread-Topic: [PATCH v6 09/10] Add the function of colo_bitmap_clear_dirty
Thread-Index: AQHXLPKwMLHFODNKkE+OXsAxdG/a9qq2zXtw
Date: Fri, 16 Apr 2021 07:56:32 +0000
Message-ID: <DM8PR11MB56405F571F0D4B2C77A71932FD4C9@DM8PR11MB5640.namprd11.prod.outlook.com>
References: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
 <1617938456-315058-10-git-send-email-lei.rao@intel.com>
In-Reply-To: <1617938456-315058-10-git-send-email-lei.rao@intel.com>
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
x-ms-office365-filtering-correlation-id: 49728164-bd7e-4879-7a01-08d900ad26d9
x-ms-traffictypediagnostic: DM8PR11MB5621:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR11MB5621BDEAA70E93F604EA27E5FD4C9@DM8PR11MB5621.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:195;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ChjyjTDyl9Y+1T4zqWqknn6jZI2h9dotQ/tG5i08cUPsqUFdvD8LLPAiTFIWiD851NVartirHIqh1prDm3wzWU7wdKkALDZRN7Wt8p7wqFRrTr3syAXdEb47VIYuJaGQjEIThZnudoqqMDkPg4zLPmi/lFz0uS2WhISteWrUwKc5G8V91uuuBo/wPz+MFsjYS8umDYL1n6Zu9uDjnNAaMG0t4WT3J6zxBBTcIvw4emAEaiMTvppdGd/+NWB6D4TyMrCBh0s2+pSXT4nfziN1RgCD+MIMJP6W2tegPYP/SLOiIsKMaOjOluQsxdCBC/s7dO5EsCqXWauoF4zmKI7RTyL/LZG5B0mFpAJWd4pcEwkzX7WkRIbIuS/68ChahsC+HxUBglDs9wZVHP173F2rqMKropwQRZPuVEmT/TTHPeS7XL23a09YSOmCLjcb9tmD9mHmDeFyn4WilPG3RoIB/cn+I7vDAMZXy6kFJC5IkETtjUGokSK48bbehUAYYAsdFdVnB2DcxaV2wXi1LSLCaafACzyFXFhRw5UlZGPmds3SQbD8K6tpENndhNSSJUKDBKntKMeufM4qXXdRPXMfguHMCBYVp/zazhMXmRWbN7OcDzlwDmgullGNmK7BKohfNylLHMfE3QQzgq76JUK9w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(6916009)(186003)(6506007)(86362001)(54906003)(66446008)(8936002)(8676002)(53546011)(33656002)(66476007)(71200400001)(4326008)(5660300002)(26005)(52536014)(83380400001)(38100700002)(9686003)(55016002)(66946007)(64756008)(2906002)(316002)(76116006)(7696005)(122000001)(66556008)(478600001)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?n2RgOUg0uA/AUZ3nJtD1WJUG5wbpOuJGKePwDi7leA01m9NfQ56b2W9C0UPh?=
 =?us-ascii?Q?0Q9H/uogCZAdQU/QJCL6+ITLwJzGpLXSNT4gdfbeKbVUSaGOx66pIJmi2fTz?=
 =?us-ascii?Q?omoeHiGAvOC7Nq4lmRWXRXcNrTXzR1OBYaA9OeH5W+MgjaYZnqrsWkcl5uPJ?=
 =?us-ascii?Q?TryoNJ0r6Mbdu/1XzDG1F5u9ioSU2+i5s3BGnzXhmmR8JwfJsXPJO1nEVql3?=
 =?us-ascii?Q?HxH5BKjUD2H/lmFc5XVatK8vJLTprl8rQI3zXdQIKcvHZRscGSi+l5Bon4Ts?=
 =?us-ascii?Q?Yn7HArPWGJT+SBMjCNW6ndPqpANsbGY3/q400LiFJSIukZyG6TeE9wbxPrkt?=
 =?us-ascii?Q?DrWIOqPU4KzZgeZm0boJ2xRCGeqo3HeRR0DfvdzTy0/mc5SNBca2Vnj5ySEb?=
 =?us-ascii?Q?iFREljlWJiBNt8IcqXnMeZNKLt1OK3uXQc1LV810Xx2kH6TaSn8XFHXWjKA5?=
 =?us-ascii?Q?RoceozoOHfCSDICB1aSPPrnWayhQ766G9+K09kHVbd3xLAvaNrVI+pdyJQS3?=
 =?us-ascii?Q?b+gPsCa0/hk1zC1T6PKUP3rhS5v7cvI6RRltUPHgusKBK2fknZAtwI17oiKl?=
 =?us-ascii?Q?mv018Xyf/G1vbhxeM+3tX4ENOtVD43sEHgcm0MZX16fKIcGk1/VAiagU75Gw?=
 =?us-ascii?Q?lfxHl5kgVLYZeb73F4Il9bpzZjvjaOs0K0jxzo+/sw/+c0JrnaIMaPItPcmV?=
 =?us-ascii?Q?VbdW5Qon7cDX5/IOtqRMQ5kps9pi10wOLwSWsqUOeefbHXdXOAF9DQl/XMTb?=
 =?us-ascii?Q?6ttbReAWrZTvg8dfPW1Jqw2/mEqKHjnS0oQwqHpXSAtb36R7xRM7mvkGQZl4?=
 =?us-ascii?Q?ZAx0LV3fgldyu6kHFBRuQLZhh8DSr9KW76RW7u7ViwHGoKZSsk2KatP/9HEu?=
 =?us-ascii?Q?hpzIBPx6kcCJY6J4j3Qg1VZ9Us3s7hoUXdJD7qOJyyE6HYQld3gfQYs+IhpX?=
 =?us-ascii?Q?Ohf3tyT2txBUzbmZDXv12oCRqGqHqvMHOS8z5dBGFp3ci+MPZ5lireJxxB6+?=
 =?us-ascii?Q?mkACsSgPZNSfSBJOoDYzqeLXwb87rBhYR+ox8nWwSJp12DBcmd8FHPnd9P+H?=
 =?us-ascii?Q?grzXhKEd1CwNxjAbcg/eYmkXD0xhDpi9bIDq2mvtmJ63aBRd6x/Rr5W1YbtD?=
 =?us-ascii?Q?c7uhLRhp1KNSKLiKDXTchbEyyt1vMFpm0n+O/zvzFl+2roeiqF1MPQagcijR?=
 =?us-ascii?Q?H/BC5jsko3MF40o2ma2FipSOlsFl7L32ldVYc4a6nlihIj5GMREy29el6/oi?=
 =?us-ascii?Q?8kYJiZRR+FNweUQuDOSLKm2OJKhR0kTi68+vjyeCXFxURCh3jScwIGXT6WFZ?=
 =?us-ascii?Q?8Kc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49728164-bd7e-4879-7a01-08d900ad26d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2021 07:56:32.9699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6JpEKN6e95V4zvv9xO+UPIZmw48KuQGxtREKyzt6jz5llasyv9prFwo+f8Mjk4QdEusEloXqlsxLKXT5pxf+Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5621
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=lei.rao@intel.com;
 helo=mga14.intel.com
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
Cc: "lukasstraub2@web.de" <lukasstraub2@web.de>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Dave

The performance data has added to the commit messages.=20
Do you have any other suggestions?

Thanks
Lei.

-----Original Message-----
From: Rao, Lei <lei.rao@intel.com>=20
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


