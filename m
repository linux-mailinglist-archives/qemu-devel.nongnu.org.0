Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981971F78D7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 15:45:15 +0200 (CEST)
Received: from localhost ([::1]:59750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjjze-0006Md-3W
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 09:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1jjjye-0005Ol-TR; Fri, 12 Jun 2020 09:44:12 -0400
Received: from mga06.intel.com ([134.134.136.31]:45093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1jjjyb-0005mQ-TJ; Fri, 12 Jun 2020 09:44:12 -0400
IronPort-SDR: 9sieUju1Gl7mV7ZI/I7Ks7ONKPNZy/VjywW8ocyrs52He+ijx44hmDDSR+81+WtguaHz+t5Aoa
 o1qFzEQy2dIA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 06:44:00 -0700
IronPort-SDR: toXeCsWoirLnnY1VKja6uyy8Z0WJHcbgEwBAtKcrGrAWPk9ibKr02k8CrtLrla00JBGvLN9IWS
 FAaAnggzV0jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; d="scan'208";a="448301294"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga005.jf.intel.com with ESMTP; 12 Jun 2020 06:44:00 -0700
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 12 Jun 2020 06:43:59 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 12 Jun 2020 06:43:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 12 Jun 2020 06:43:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrWB0+LtJDRmye0k6CSL3JPpXWmt0M9xWvvdctAqhqF+UlnBL0kYaQKkqHVOoA0eyWz21U5XGs4rfOX1dBs1Nmztd3ex6aD7pVb4lvGvudKPKdAk0f1znAMh7S2JRVyzz2vCc83sCxV5GIY8fSwl1KlcBcVg1+ZC1w1HZ27piBIh9OVrmsBpLa+TLZhKwNsh5baxeqooUM/FvKPRtRbK8BypcYkknIcdAPQgPybxEclp9KVK0Dd9zpVMQ7L5Zruuield3lbD7x0FYOTgvi1enBXrahHl6P0I5SimtGZ8T2xTPpHyNp8fBqSO58/vWQhdBaR0hUG9AMOTRXtuEN95cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsaEm//i16m0aAFjCLxXdCkYs+TyA2M5pLhkhmi0oXU=;
 b=OKowD6EWXoQBhF4SodUyOUPJEF0AAHoDnM0mAZsMnet1ceZWKX3qxHbpctp6CKe/ffI9gtuAlV7+eri5q01b6S1ZHInboVgkTj3QRzzk1XY/ZXKKtSPb71BMzPHjidxhFvCniWOdGk9Hvw9xuX47oeQ9ZaU2579hiVX/042dFcwy3pHvOV8ylZ59Icwcr55Xb58wWywwZj7fhjctmZ7uk2+1kn7ZHjqS13xHjaIJXMlVbw+WjAeRwNLBo04KMGt4pclSk65iiC8GDcXrcFutD330I27H394rh6jaC5bUBDCeDJzwF8VpN6f/cKxdqsLEvTi4oHlvdCjsn5GTiuYJfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsaEm//i16m0aAFjCLxXdCkYs+TyA2M5pLhkhmi0oXU=;
 b=MoHlrpCyD6L0Xz1uxXklHTVqj01XI+fWq3BuIVEk3CcblFLL+rDDe790t8YvdceYmPev/3uBUBQ+s+cV6TovrCXwBtLkhP8rjAq6y6PnNhEL9L0LMm3jJLwWjO7VxBHGQWAkBZulwESyENNAqdfTKo+NKrjvAqiT0CrYRxJZr4U=
Received: from DM5PR11MB1833.namprd11.prod.outlook.com (2603:10b6:3:110::12)
 by DM5PR11MB1722.namprd11.prod.outlook.com (2603:10b6:3:f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.22; Fri, 12 Jun 2020 13:43:58 +0000
Received: from DM5PR11MB1833.namprd11.prod.outlook.com
 ([fe80::3c09:1393:f7b8:1f51]) by DM5PR11MB1833.namprd11.prod.outlook.com
 ([fe80::3c09:1393:f7b8:1f51%9]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 13:43:58 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] hw/nios2: Update interrupt request when CR_STATUS_PIE
 disabled
Thread-Topic: [PATCH] hw/nios2: Update interrupt request when CR_STATUS_PIE
 disabled
Thread-Index: AQHWP4ZsWxBTOO2K8UOOQsF38ZGk3KjU/8ew
Date: Fri, 12 Jun 2020 13:43:57 +0000
Message-ID: <DM5PR11MB1833DA1D82CD4DEAF8DE514F8D810@DM5PR11MB1833.namprd11.prod.outlook.com>
References: <20200611081319.1864-1-wentong.wu@intel.com>
In-Reply-To: <20200611081319.1864-1-wentong.wu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19db34d7-7900-441f-4198-08d80ed6a83d
x-ms-traffictypediagnostic: DM5PR11MB1722:
x-microsoft-antispam-prvs: <DM5PR11MB172249A7439486C7831B34068D810@DM5PR11MB1722.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vbXdm220SA673hcQRxC4YAwA9SqYJVl78YUJCfX1ImNml4UHvGenNShLdzP8dOUHwVB32ieJgBTgDKeFns5IUy+KdXh99YeAMlAOia2Np3xlfvfEr4a28LnZQGxtYN6mUgCexLxNna0Ur/JpdBTL5xnKHYWYmz6ZT3jnFZsLH8weL+OgMCvViyt7xc4oX851BvCCk7MvfKCJusFLt7zAKmKNSVepXdXeqdqiwKR7Nkw4UqDpYLcb7cuh2A7eVV/stuoxPS4zBZMYlNVJCd9w+luuAudOK9fBN5GsiOAw9Z9hijcn7prgPyicmGkWR5djSg+FaGYolyz/Ad/CCr+6TA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1833.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(396003)(39860400002)(376002)(366004)(83380400001)(478600001)(26005)(66556008)(66946007)(86362001)(76116006)(66476007)(64756008)(66446008)(33656002)(52536014)(6506007)(186003)(53546011)(7696005)(6916009)(2906002)(5660300002)(8676002)(316002)(71200400001)(8936002)(4326008)(54906003)(9686003)(15650500001)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: mrVYrxPOAaSNn2ZkexmTsIzYSbBGVI0L35knn1uk0Kzx4SeInAXRbGI6gRctjAhbtlyVQ+xg+8dl/mVRqkCeLkBDuheBMwDFkBrMpZl/EeLZ4nwXcRNZ/yGH0TAYHbMlFXXM/Sp4yjOuDUej3AGin+FUePHP1GY4jI0T7arBIr2ALwYP5PruHoZObGO8k23QgKjxiqhhDYWqmH5ORJUC1O9qSXV6w1eTedo3Mm4MUMgv6pyp5FT+DPohEef+Nzb4KQOaAn2vfgg3z9/4RSmmJmHUVy/9YRyXF4EIs9g+/SbyIy9KucnmqaVPb8FK9qLkefyTC1Jjbk0dsS9srDhsrGLPpkLsYiE1YA6c8Olvxsyqn39tsNZEzvNoKqi4xc2+VaVNnn08U99foSV1TYCpc0IK5Kb6mkQgzxZ01gUQysTuUJGZfM/A4rHoKEoFhLqMGGygFn/XabQDTrX3e16FM7uiL0QyBW6BixatxgAZE+k=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 19db34d7-7900-441f-4198-08d80ed6a83d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 13:43:57.8203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPkVzQQuFf0x32TgjRpmVNjfJC5BJDPNv2pYBwzyjoEZeJAx3g0m7qDjbUXhZG9NcMa6p1S4620odjWXNo6SMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1722
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=wentong.wu@intel.com;
 helo=mga06.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 09:44:01
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "marex@denx.de" <marex@denx.de>, "thuth@redhat.com" <thuth@redhat.com>,
 "crwulff@gmail.com" <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
Can any body help review this patch ? Thanks in advance!

BR

-----Original Message-----
From: Wu, Wentong <wentong.wu@intel.com>=20
Sent: Thursday, June 11, 2020 4:13 PM
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org; crwulff@gmail.com; marex@denx.de; thuth@redhat=
.com; Wu, Wentong <wentong.wu@intel.com>
Subject: [PATCH] hw/nios2: Update interrupt request when CR_STATUS_PIE disa=
bled

Update interrupt request when external interupt pends for STATUS_PIE disabl=
ed. Otherwise on icount enabled nios2 target there will be cpu abort when g=
uest code changes state register with wrctl instruction.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 hw/nios2/cpu_pic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/nios2/cpu_pic.c b/hw/nios2/cpu_pic.c index 1c1989d5..2abc8f=
a8 100644
--- a/hw/nios2/cpu_pic.c
+++ b/hw/nios2/cpu_pic.c
@@ -42,6 +42,8 @@ static void nios2_pic_cpu_handler(void *opaque, int irq, =
int level)
         } else if (!level) {
             env->irq_pending =3D 0;
             cpu_reset_interrupt(cs, type);
+        } else {
+            cs->interrupt_request |=3D type;
         }
     } else {
         if (level) {
--
2.21.3


