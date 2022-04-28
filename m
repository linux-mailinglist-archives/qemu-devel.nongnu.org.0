Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6937B51335A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:08:43 +0200 (CEST)
Received: from localhost ([::1]:55446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2wr-00074W-VJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nk2tf-0004ru-JD
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:05:23 -0400
Received: from mga03.intel.com ([134.134.136.65]:49017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nk2tb-00018C-EL
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651147519; x=1682683519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ajLsUA7vG+JzuAyCR3RpDKO5WCz6HlFMkNS0/x/8omQ=;
 b=FRXAu91uiATxr4B6QN+d4B5N+9A91KdT2yBCSskQdlqBZj8I2jj2Wk4m
 rgDI76NLsMIG7+qDgMIcg4z9t6HXsa9FIEsTofsPja3pDBQpxw+WfTKGO
 U/LVYvR4SatqFQbHEE+ULgUkqKK5nDR/Om0sWR9Bp+YmR/XjNw70DAUOm
 wVjSGptYLMdMHYucMwaXX49FzNlnUF780O+IfD7iu/vEcKX9ngD74aFbP
 5D+14wDBmPkkI1ypFl7nAM+2o7c6Q3CnPSZzTJ3pJsobHZh+82f/Si2Qy
 wle3HZ3eigipkLjme75tZwcHFg+n65a+MxnK8gK4Kx+gVCRWn+hA6Lop2 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="266082506"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="266082506"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 05:05:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="581320929"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 28 Apr 2022 05:05:13 -0700
Date: Thu, 28 Apr 2022 19:48:50 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Jinpu Wang <jinpu.wang@ionos.com>
Subject: Re: RFC: sgx-epc is not listed in machine type help
Message-ID: <20220428114850.GA20626@yangzhon-Virtual>
References: <CAMGffEmEmWK99xDu=i2iq9WeTxdPwnG9-94UEqFnBSzmvv=TWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMGffEmEmWK99xDu=i2iq9WeTxdPwnG9-94UEqFnBSzmvv=TWQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yang.zhong@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yang.zhong@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Yu Zhang <yu.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 01:59:33PM +0200, Jinpu Wang wrote:
> Hi Yang, hi Paolo,
> 
> We noticed sgx-epc machine type is not listed in the output of
> "qemu-system-x86_64 -M ?",
> This is what I got with qemu-7.0
> Supported machines are:
> microvm              microvm (i386)
> pc                   Standard PC (i440FX + PIIX, 1996) (alias of pc-i440fx-7.0)
> pc-i440fx-7.0        Standard PC (i440FX + PIIX, 1996) (default)
> pc-i440fx-6.2        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-6.1        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-6.0        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-5.2        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-5.1        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-5.0        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-4.2        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-4.1        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-4.0        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-3.1        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-3.0        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.9        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.8        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.7        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.6        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.5        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.4        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.3        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.2        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.12       Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.11       Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.10       Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.1        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-2.0        Standard PC (i440FX + PIIX, 1996)
> pc-i440fx-1.7        Standard PC (i440FX + PIIX, 1996) (deprecated)
> pc-i440fx-1.6        Standard PC (i440FX + PIIX, 1996) (deprecated)
> pc-i440fx-1.5        Standard PC (i440FX + PIIX, 1996) (deprecated)
> pc-i440fx-1.4        Standard PC (i440FX + PIIX, 1996) (deprecated)
> q35                  Standard PC (Q35 + ICH9, 2009) (alias of pc-q35-7.0)
> pc-q35-7.0           Standard PC (Q35 + ICH9, 2009)
> pc-q35-6.2           Standard PC (Q35 + ICH9, 2009)
> pc-q35-6.1           Standard PC (Q35 + ICH9, 2009)
> pc-q35-6.0           Standard PC (Q35 + ICH9, 2009)
> pc-q35-5.2           Standard PC (Q35 + ICH9, 2009)
> pc-q35-5.1           Standard PC (Q35 + ICH9, 2009)
> pc-q35-5.0           Standard PC (Q35 + ICH9, 2009)
> pc-q35-4.2           Standard PC (Q35 + ICH9, 2009)
> pc-q35-4.1           Standard PC (Q35 + ICH9, 2009)
> pc-q35-4.0.1         Standard PC (Q35 + ICH9, 2009)
> pc-q35-4.0           Standard PC (Q35 + ICH9, 2009)
> pc-q35-3.1           Standard PC (Q35 + ICH9, 2009)
> pc-q35-3.0           Standard PC (Q35 + ICH9, 2009)
> pc-q35-2.9           Standard PC (Q35 + ICH9, 2009)
> pc-q35-2.8           Standard PC (Q35 + ICH9, 2009)
> pc-q35-2.7           Standard PC (Q35 + ICH9, 2009)
> pc-q35-2.6           Standard PC (Q35 + ICH9, 2009)
> pc-q35-2.5           Standard PC (Q35 + ICH9, 2009)
> pc-q35-2.4           Standard PC (Q35 + ICH9, 2009)
> pc-q35-2.12          Standard PC (Q35 + ICH9, 2009)
> pc-q35-2.11          Standard PC (Q35 + ICH9, 2009)
> pc-q35-2.10          Standard PC (Q35 + ICH9, 2009)
> isapc                ISA-only PC
> none                 empty machine
> x-remote             Experimental remote machine
> 
> 
> I think this would cause confusion to users, is there a reason behind this?
> 

  No specific machine type for SGX, and SGX is only supported in Qemu PC and Q35 platform.
  
  Yang


> Thanks!
> Jinpu Wang @ IONOS Cloud

