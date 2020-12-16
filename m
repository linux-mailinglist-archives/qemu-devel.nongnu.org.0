Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E452DC3B2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:05:18 +0100 (CET)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZIj-0003f3-HR
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kpZH6-0002h1-3v
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:03:36 -0500
Received: from mga07.intel.com ([134.134.136.100]:35137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kpZGy-0003Ej-9J
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:03:35 -0500
IronPort-SDR: dYRXA+TTI9UIV7zOLzRdVvQT3UDjaONLt0PAJB/0++vmwMrc2EbjU4D1HAOP7BJhCvx/wOlyC2
 J19jGMl1j/2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="239180740"
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; d="scan'208";a="239180740"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 08:03:17 -0800
IronPort-SDR: li7Zx/6+2YBRyzbc4bSbjF3X5M2RHtWqWCZVCF+ZgV6cUWFTwBmYqHPTtLKLLQOdkX5qyFT7EP
 iQMS0Cl3NnEg==
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; d="scan'208";a="352644786"
Received: from gviswana-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.134.60])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 08:03:16 -0800
Date: Wed, 16 Dec 2020 08:03:14 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: CXL support in QEMU
Message-ID: <20201216160314.m72v7ynqnv3opu6s@intel.com>
References: <CALOWxgPkoiR9jHSP-S+hYkWZb89xi8kLVY4vsHqTMzpg6Sv=jQ@mail.gmail.com>
 <07f753bd-45d8-d65d-6195-25f9dfb74795@redhat.com>
 <20201216134251.000052d0@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216134251.000052d0@Huawei.com>
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=ben.widawsky@intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Prashant V Agarwal <agpr123@gmail.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-12-16 13:42:51, Jonathan Cameron wrote:
> On Wed, 16 Dec 2020 10:53:34 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
> > On 16/12/2020 06.05, Prashant V Agarwal wrote:
> > > Hi,
> > > Is there a way to know the support plans for CXL protocol in QEMU?
> > > I see that there is side branch development going on:
> > > 
> > > https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v2
> > > <https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v2>
> > > 
> > > But when does it get merged and gets released in QEMU formally?
> > > Is there a way to know a rough timeline?  
> > 
> > You should rather the authors of that repository whether and when they plan
> > to contribute their changes to the QEMU project. It's certainly not going to
> > happen automatically that these patches get merged into the main repository.
> > 
> >  Thomas
> > 
> Worth noting that they have posted an RFC, so I would suggest replying to
> that thread to make sure you get all the right people.
> 
> https://lore.kernel.org/qemu-devel/20201111054724.794888-1-ben.widawsky@intel.com/#r
> 
> +CC Ben
> 

I haven't posted v2 yet because I have a few more changes I wanted to make
before doing so, however v2 has all of Jonathan's feedback plus a few minor
things.

Thomas, it's been CC'd to a few folks outside of the list itself, but I couldn't
get much in the way of reviewers. Advice on that is welcome.

Ben

