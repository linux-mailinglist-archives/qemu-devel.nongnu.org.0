Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DDF650835
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 08:52:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Awb-00015h-8b; Mon, 19 Dec 2022 02:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1p7Aw3-000138-NO
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:51:43 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1p7Aw0-0006sk-TZ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671436301; x=1702972301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xVJgRb68Nkpyisld5HCkMudGRnmiPfSfUzPaVdg30XM=;
 b=VFaYbguVzA1hwdHcBY0Tqc3r7B5e93gCsaEMKd0GcTAfT53/zbQYLEhQ
 lNVDLWHH9ff6KWyub8qGNBNRAs3G9jlyFTP/Wk2YmpUFPzsb/UbXAJcow
 ZQYzRmTk7D67B6b4wRemuchVa6m3a+FAA0i4coKFaArJBUwXu3npv0RaU
 cEUiqZkmvkwErUW5K+GdFd4Euc22zZLSJ6g4xCOw1tIeDda5ycUQoM0oi
 U2ZRcPOFEdTeDPgjCRIuekHUpICa8d5stCZcjaxEfLgU61Ru/hFHjagCj
 poqbA91PPA+alkx32JtxTHWHm2fAAUR0LZCiLCOjjX1NbQZaSpkJ2mEH+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="383637056"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="383637056"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2022 23:51:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="713922703"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="713922703"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2022 23:51:34 -0800
Date: Mon, 19 Dec 2022 02:51:20 -0500
From: Yang Zhong <yang.zhong@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] i386: SGX: remove deprecated member of SGXInfo
Message-ID: <Y6AX+MfN7+cizIpS@yangzhon>
References: <20221218000649.686882-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221218000649.686882-5-pbonzini@redhat.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=yang.zhong@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Dec 18, 2022 at 01:06:49AM +0100, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/about/deprecated.rst       | 13 -------------
>  docs/about/removed-features.rst | 13 +++++++++++++
>  hw/i386/sgx.c                   | 15 ++++++---------
>  qapi/misc-target.json           | 12 ++----------
>  4 files changed, 21 insertions(+), 32 deletions(-)
> 

   Tested-by: Yang Zhong <yang.zhong@linux.intel.com>

   By the way, there is another sgx bug, please help review, thanks!
   https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg04825.html

   Yang
> 
> 

