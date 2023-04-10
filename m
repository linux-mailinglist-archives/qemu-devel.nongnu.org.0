Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462256DC355
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 07:39:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plkDp-0006Jp-3n; Mon, 10 Apr 2023 01:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1plkDm-0006JX-4U; Mon, 10 Apr 2023 01:37:42 -0400
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1plkDj-0004Gi-Ry; Mon, 10 Apr 2023 01:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681105059; x=1712641059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fx/+xLcox1cHJfiPwPfNxk72pTNanagKQdk+bbGiFmk=;
 b=fAFz72exCqnqpG5D3K7MqccpiG75znLRl+uQ/HdRZ/xFAIooxbJO6hru
 uIvcN4lbQkjrHzZswVVulU45IAYYn/2qZ3T/HUED0jTFjBSXkB163LzTd
 kvLfO/d6APWgzuLSUBg10W+14qoKf9kE1INSBhxSFJpNhTma9ZrtGlICp
 F77BX9mRrumByrwjhmFN+IH3YuAj8rGdsHnSIToae5lhlOh8Y+uWcChqP
 kasoidzxEO1T18/wlxWl4+2y2k2A+QKbwgWoeUYvLqn5GRfMAhN/QtZkt
 Iu9B6szlZc1vnf/TS+/MCkqFdqVtr74H+4ahItOCoTB+vAgU3sGCxdDsf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="340779037"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; d="scan'208";a="340779037"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2023 22:37:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="1017880374"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; d="scan'208";a="1017880374"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2023 22:37:31 -0700
Date: Mon, 10 Apr 2023 01:37:18 -0400
From: Yang Zhong <yang.zhong@linux.intel.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, seanjc@google.com,
 christian.ehrhardt@canonical.com, kai.huang@intel.com,
 weijiang.yang@intel.com, qemu-stable <qemu-stable@nongnu.org>
Subject: Re: [PATCH v3] target/i386: Change wrong XFRM value
Message-ID: <ZDOgjiOg6cmEWBmM@yangzhon>
References: <20230406064041.420039-1-yang.zhong@linux.intel.com>
 <a3075e7e-9f7b-105c-a952-f0604d541c39@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3075e7e-9f7b-105c-a952-f0604d541c39@msgid.tls.msk.ru>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=yang.zhong@linux.intel.com; helo=mga11.intel.com
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

On Sun, Apr 09, 2023 at 04:40:50PM +0300, Michael Tokarev wrote:
> 06.04.2023 09:40, Yang Zhong wrote:
> > The previous patch wrongly replaced FEAT_XSAVE_XCR0_{LO|HI} with
> > FEAT_XSAVE_XSS_{LO|HI} in CPUID(EAX=12,ECX=1):{ECX,EDX}, which made
> > SGX enclave only supported SSE and x87 feature(xfrm=0x3).
> > 
> > Fixes: 301e90675c3f ("target/i386: Enable support for XSAVES based features")
> 
> This seems to be -stable material, no?
>
  
  I checked Qemu stable-7.2, the 301e90675c3f patch was included into this release.
  So, this fix patch need to be merged into stable release. thanks!

  Regards,
  Yang

> /mjt

