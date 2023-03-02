Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AFA6A84D4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 16:03:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkSZ-0001QR-8G; Thu, 02 Mar 2023 10:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1pXkSO-0001GI-Sm
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:03:04 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1pXkSM-0004xB-EK
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677769374; x=1709305374;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZJVmxKEXh/SpRZcdbBvg7S3s43NHgUCy5d2E7XcgkLs=;
 b=Bi0OZ5qWItowjvXlX+n91bYM2zoAgZH3h3ghYHl4rR3dyhJHFA5NiHBN
 P8dZZkTtX/cJcwMF7zDBCjUgvSHA/3k7OIQvR8psPxxGJJMmsK84DI5CU
 KuKjXC2hSMY/wnP+fR3OL942j4a2g4aUSxWziufRiArgKA/kNWXOzF2vh
 v0C6Vr2Fl2BYEzAvX2X+dWW/cVoVypwb3c+flnGHuWzDsINsdlI/tK0Av
 NmNdAwvos3nB4dto1vVRg4Pft+axzUsXbIGyAT/W6rOcsLCEQZgsImjVW
 /xECCBHyJt526L1MWRzhhiwBRY5rSgde/1bvsuF5IuVGRGdd3WSz4spO0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337051803"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="337051803"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:49:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668279984"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="668279984"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 06:49:30 -0800
Message-ID: <bae5a9569653d25ec94f003cf2a913b9e525410d.camel@linux.intel.com>
Subject: Re: [PATCH v3 0/6] Support for new CPU model SapphireRapids
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>, Lei Wang <lei4.wang@intel.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com, 
 berrange@redhat.com, xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Date: Thu, 02 Mar 2023 22:49:29 +0800
In-Reply-To: <20230202120533.37972585@imammedo.users.ipa.redhat.com>
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230202120533.37972585@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=robert.hu@linux.intel.com; helo=mga03.intel.com
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

On Thu, 2023-02-02 at 12:05 +0100, Igor Mammedov wrote:
> MultiBitFeatureInfo looks like an interesting
> idea 

Yeah, we can feel how much effort Lei spent on this.

> but among fixing whatever issues this has atm,
> you'd probably need to introduce a new  qdev_bitfield property
> infrastructure so that such features could be treated like any
> other qdev properties.
> Also when MultiBitFeatureInfo is added, one should convert all
> other usecases where it's applicable (not only for new code)
> so that we would end up with consolidated approach instead of
> zoo mess.
> 
> I'm not sure all MultiBitFeatureInfo complexity is necessary

Kinda ack.

> just for adding a new CPU model, I'd rather use ad hoc approach
> that we were using before for non boolean features.
> 
> And then try to develop MultiBitFeatureInfo & co as a separate
> series to demonstrate how much it will improve current
> cpu models definitions.
> 

CPUID word isn't always bit wise, i.e. each bit representing a feature,
this isn't new.

e.g.
CPUID.1H.EBX[bit23,16] -- Maximum number of addressable IDs for logical
processors in this physical package
CPUID.04H
etc.

And interestingly, we can see that among so many CPUID leaves (which in
turn contain *words* of EAX, EBX, ECX, EDX), only a few has a
corresponding feature word defined in 

typedef enum FeatureWord {
    FEAT_1_EDX,
    FEAT_1_ECX,
    ...
}

Why?

Those CPUID returns are not *feature words(names)*, they're numbers to
decode, strings to interpreted, etc. So does this CPUID.1DH/1EH, I
think.
Why cannot handle them like handling CPUID.04H?


