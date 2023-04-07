Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56766DAC22
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 13:12:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkk06-0006an-7L; Fri, 07 Apr 2023 07:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pkk03-0006Zh-BR
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 07:11:23 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pkk00-00063b-JO
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 07:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680865880; x=1712401880;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/Y6uMWC9AWQYP7lwqAYy2eYi6+CK+D9HGZvtcgaZ+kM=;
 b=Hn/Ulckmov7v+mOU/3HezhidQvr+NkW6266yFsFDlEH/9WmNjpmUnBeQ
 arfGT6f+t4jcYX3gWvL0P69puOKoCY9rUsVInqVCOOEaphWTj/qtDh6Wz
 5B6G1wLaBYdRNU1DopXioSe0PeX3gnYnOZUJh2p/pwgeO9LWdttt/C7Ba
 4kpxRGcgWGiLoV09MghUS2zo2Pnr6seWBXrlWU/ET+G1k+SGByfWpuxw7
 jX+hL2+1z1HMMJPjksaebXzwfVY5vLqgaNT3QtMUB86kYDfYyFGtjXKrj
 4P8aJqlpEfLLCuOI4Fyt3BEujwbkJ0padHs0Ivy8OwO4k8pkUmTXiZJOB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323339380"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="323339380"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 04:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="1017227813"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="1017227813"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 04:10:58 -0700
Date: Fri, 7 Apr 2023 07:10:48 -0400
From: Yang Zhong <yang.zhong@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, seanjc@google.com,
 christian.ehrhardt@canonical.com, kai.huang@intel.com,
 weijiang.yang@intel.com
Subject: Re: [PATCH v3] target/i386: Change wrong XFRM value
Message-ID: <ZC/6OALui4OY0cOx@yangzhon>
References: <20230406064041.420039-1-yang.zhong@linux.intel.com>
 <20230406120506.251454-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406120506.251454-1-pbonzini@redhat.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=yang.zhong@linux.intel.com; helo=mga17.intel.com
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

On Thu, Apr 06, 2023 at 02:05:06PM +0200, Paolo Bonzini wrote:
> Queued, thanks.
>

  Paolo, thanks!

  Yang

> Paolo
> 
> 

