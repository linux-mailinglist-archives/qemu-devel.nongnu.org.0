Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B6A577C39
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 09:14:14 +0200 (CEST)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDKxI-0004oz-TV
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 03:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oDKvN-0003Qc-FL
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:12:14 -0400
Received: from mga12.intel.com ([192.55.52.136]:18743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oDKvK-0005As-NO
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658128330; x=1689664330;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vUoUNRSpNOI26Boi9NtFxA3tPn3Ov+poOTrVOxsu/WM=;
 b=QiFVKiLNY5HFQaqaUBbe8wHMQuvVvb/gnNF40mCkCG2+4ER6wRdgle2q
 hsOyXF1QFwd0hhYs5psf6zlexexeo16TaznRzKpesIA/KeKqQ8VzmyFPj
 qwsy9DVvv03rlhl9HzXDSjvRdDGCslwX/XLFfPkXnKeyxC3eM9fW3vnHH
 LI+jXhw3qpwnOjVfs2D8z0B3ag/a3HLH+K/lZuYkWCxRPah1/KoXiD7/3
 COONSqcbcIz5HrIqcl+q/86b+tzp6rWcNkZTmpQysO9UpmrU+nzEoLfLU
 1foAMMEZCe4ItnfcvGzjQHze9B10ha4ptEns1ix4q7rVxCQyhRRlA7JZM w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="265936293"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; d="scan'208";a="265936293"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 00:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; d="scan'208";a="924230630"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2022 00:12:04 -0700
Message-ID: <c1f857fab3b2dd1e58c0fe7ca087f8c742f2aff2.camel@linux.intel.com>
Subject: Re: [PATCH] acpi/nvdimm: Define trace events for NVDIMM and
 substitute nvdimm_debug()
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, qemu-devel@nongnu.org, 
 robert.hu@intel.com, Jingqi Liu <jingqi.liu@intel.com>
Date: Mon, 18 Jul 2022 15:12:03 +0800
In-Reply-To: <20220707112101.259acc3a@redhat.com>
References: <20220704085852.330005-1-robert.hu@linux.intel.com>
 <20220707112101.259acc3a@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=robert.hu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 2022-07-07 at 11:21 +0200, Igor Mammedov wrote:
> On Mon,  4 Jul 2022 16:58:52 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> 
> > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> > Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Thanks for review Igor.
BTW, during the unit test, I met some bios-table test error, 
https://gitlab.com/qemu-project/qemu/-/issues/1098, perhaps related to
your patches in June.
https://patchwork.kernel.org/project/qemu-devel/cover/20220608135340.3304695-1-imammedo@redhat.com/
> 
> > ---


