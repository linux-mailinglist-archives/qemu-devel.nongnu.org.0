Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7562502604
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 09:10:53 +0200 (CEST)
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfG6W-0000dr-Hn
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 03:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nfG4R-0008MY-T7
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 03:08:43 -0400
Received: from mga12.intel.com ([192.55.52.136]:28677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nfG4O-0004qm-5J
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 03:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650006520; x=1681542520;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8XT5rTV9XwUuh7VTzFCgDiRtT+FSZYFb9vKMAlUO5qo=;
 b=oCJiY/FPuKLIsHEAQH3uUVRMFfjYWfzWIx0jn8FHMGKM5RhxnH8k21Za
 FE4p3mwyh+sMMCMLd/zMIZjyivPYiAs4td3wUgZCsPelC09IjZndeKOg5
 uJyux5TKzP2ifWzMDXVRBx0TtQCaAzLJpJncHXxxq7ChtUTYh7f21wPck
 lQAHw6dvtayRu9EF8fOxjISuUHbwTTGPoehAIzyFf1REh5lNqFn4Ao6Ac
 Ogr+Ch9nY3xFFSb6ercsPqm007f2bj05XkQ0CS0HlUx6Qsv/9ufxZpCoy
 lvylHbIJmnKD9l4hYkcpqBD7fYW7G2KQPDFCjAmnJNGuRMD7DaJId4RmX Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="243040603"
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; d="scan'208";a="243040603"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 00:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; d="scan'208";a="560477611"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga007.fm.intel.com with ESMTP; 15 Apr 2022 00:07:34 -0700
Message-ID: <7a855b5dc677a832644c08d59bba73e93174cc56.camel@linux.intel.com>
Subject: Re: [PATCH] i386/cpu: Remove the deprecated cpu model 'Icelake-Client'
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Date: Fri, 15 Apr 2022 15:07:33 +0800
In-Reply-To: <20220324092251.12e01ee6@redhat.com>
References: <1647247859-4947-1-git-send-email-robert.hu@linux.intel.com>
 <20220324092251.12e01ee6@redhat.com>
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
Cc: pbonzini@redhat.com, robert.hu@intel.com, richard.henderson@linaro.org,
 ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-03-24 at 09:22 +0100, Igor Mammedov wrote:
> On Mon, 14 Mar 2022 16:50:59 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> 
> > Icelake, is the codename for Intel 3rd generation Xeon Scalable
> > server
> > processors. There isn't ever client variants. This "Icelake-Client" 
> > CPU
> > model was added wrongly and imaginarily.
> > 
> > It has been deprecated since v5.2, now it's time to remove it
> > completely
> > from code.
> > 
> > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Thanks for review, Igor.
BTW, will this patch be queued? when?


