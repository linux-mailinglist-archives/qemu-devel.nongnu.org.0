Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35352EED2F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 06:37:40 +0100 (CET)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxkSx-00068n-98
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 00:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kxkSA-0005jg-II
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 00:36:50 -0500
Received: from mga17.intel.com ([192.55.52.151]:61410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kxkS7-0003Hb-Hy
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 00:36:50 -0500
IronPort-SDR: FBLd9DVaIUdjYi9fPmTy73z5WLERCxwbJPzmfrdIDUbcYTY31xN5sDCghfaQuBHcB2O7m4fi5y
 ZzNppQz2GzQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="157325393"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="157325393"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 21:36:42 -0800
IronPort-SDR: 2RrgpmfeVwplJ4uEMy7cvyK1hae9oLn7V2a3oAAn1Jf8+q8SRRnW2P+JfvLZFwXiMyjOPryyPT
 900pVfg0lu9g==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="566372266"
Received: from testonfe-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.141.243])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 21:36:42 -0800
Date: Thu, 7 Jan 2021 21:36:40 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [Linuxarm]  Re: [RFC PATCH v2 07/32] hw/cxl/device: Implement
 basic mailbox (8.2.8.4)
Message-ID: <20210108053640.oimcztkzyp6p5lru@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
 <20210105165323.783725-8-ben.widawsky@intel.com>
 <20210106132123.00003a9d@Huawei.com>
 <20210106174014.00007407@Huawei.com>
 <20210106180556.2nw2p2alxxzdx55w@intel.com>
 <20210106190825.ed5w5p5tdk6v6f2u@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106190825.ed5w5p5tdk6v6f2u@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=ben.widawsky@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Dan@domain.invalid,
 Vishal Verma <vishal.l.verma@intel.com>, qemu-devel@nongnu.org,
 Prashant V Agarwal =?utf-8?Q?=3Cagpr123=40gmail=2Ecom=3E=2C_Chris_Brow?=
 =?utf-8?Q?y_=3Ccbrowy=40avery-design=2Ecom=3E=2C__Michael_S=2E_Tsirkin__?=
 =?utf-8?Q?=3Cmst=40redhat=2Ecom=3E=2C_Philippe_Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-06 11:08:28, Ben Widawsky wrote:
> On 21-01-06 10:05:57, Ben Widawsky wrote:
> > On 21-01-06 17:40:14, Jonathan Cameron wrote:
> > > On Wed, 6 Jan 2021 13:21:23 +0000
> > > Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:
> > > 
> > > > On Tue, 5 Jan 2021 08:52:58 -0800
> > > > Ben Widawsky <ben.widawsky@intel.com> wrote:
> > > > 
> 
> [snip]
> 
> > 
> > I'm sorry you had to debug this. I had fixed this previously and it got lost.
> > I'm currently between test applications, so my regression testing isn't great.
> > 
> > I think the fix should be something like this, but I can't easily test at the
> > moment:
> > 
> > diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> > index c515d45d20..b38e9b4c17 100644
> > --- a/hw/cxl/cxl-device-utils.c
> > +++ b/hw/cxl/cxl-device-utils.c
> > @@ -102,6 +102,9 @@ static void mailbox_reg_write(void *opaque, hwaddr offset, uint64_t value,
> >  {
> >      CXLDeviceState *cxl_dstate = opaque;
> > 
> > +    if (offset >= A_CXL_DEV_CMD_PAYLOAD)
> > +        stn_le_p(cxl_dstate->mbox_reg_state, size, value);
> > +
> >      /*
> >       * Lock is needed to prevent concurrent writes as well as to prevent writes
> >       * coming in while the firmware is processing. Without background commands
> > 
> > 
> > 
> 
> +    if (offset >= A_CXL_DEV_CMD_PAYLOAD) {
> +        stn_le_p(cxl_dstate->mbox_reg_state, size, value);
> +        return;
> +    }
> +

Last time's a charm
         stn_le_p(cxl_dstate->mbox_reg_state + offset, size, value);

> 
> [snip]
> 
> > 

