Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041B53A6B8C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:22:15 +0200 (CEST)
Received: from localhost ([::1]:45774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspLp-00015c-WD
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lspKx-0000QY-S5
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:21:19 -0400
Received: from forward4-smtp.messagingengine.com ([66.111.4.238]:36517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lspKv-0000cM-Ch
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:21:19 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailforward.nyi.internal (Postfix) with ESMTP id 420041940334;
 Mon, 14 Jun 2021 12:21:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 14 Jun 2021 12:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uKVU1s
 66+0tQ8fTEmxuWUNwMS4pSH8TgLhqUisUlk/4=; b=XXFN97XLt6deaKHDtN/f5m
 7YmJjgnpJA2kB8Xs8kMywB3nRipwqNHuDWuGt25KwjYRTFz9yrh6XQffv3+B6Htj
 8j9A9/Qx+XaZ2kL6msMp5jmsMCQC20qA3YrxfyyAB/Epp6YUzLUFYiJ6up0KRbXQ
 XSIcV6+vCeIgpspQrIx71AWJ/4pRRBL9NWxpvAaLwzl3aWTpY+UUGWdwh59L9glp
 SPx3pGPsj7wMrZh1GMdD3m2SF7hLsDjvZDPauvLFGvaHPtlFSVzx8jGOam6YdLhy
 miHc1MS2WIitVqhWGY6tgMBLXc7b1LRqWhw9rxzIRmWjBW2yNTGoG/ADeaC2IDDw
 ==
X-ME-Sender: <xms:-oHHYM_jyC3azcVzZOKkr41Jw5yLHnTiMHcpvK6AucTusjD0BL1O-Q>
 <xme:-oHHYEsV_8cCYEd3vIDU2uWyHPfnWKHPNl5IykPtBngY-xo-tNhY1E2BcD6M1i8DD
 TfGkGQr10uZWLXHNFQ>
X-ME-Received: <xmr:-oHHYCDLQfd8tQfJvIhvte4UGQhDC7O-Gys8zvBqrvLfbrpmhqcpNPK91Ki5U5VgjjQkvc9PpY5pW8mUFCJW974DTrWsYTks7ciJWv1999g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvhedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgesthdtredttddttdenucfhrhhomhepffgrvhhiugcu
 gfgumhhonhgushhonhcuoegumhgvsegumhgvrdhorhhgqeenucggtffrrghtthgvrhhnpe
 fhkeeguedtvdegffffteehjedvjeeitefgfefgffdugeffffegudehgeetgeelkeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegumhgvsegumh
 gvrdhorhhg
X-ME-Proxy: <xmx:-oHHYMeo5akcnHl-tmAzrmjduREfDCpgTyRyNUURDGZa9jTlaxxfFw>
 <xmx:-oHHYBNrIxL7dET8c3WuKrT4-aN60fLnCg3reZCf3PhiEWJZ7CeLJA>
 <xmx:-oHHYGlFsjv0ZfDv01DoDM5ZI3lmqP14Wk9hoi-6R_3JMbR-pK2cvw>
 <xmx:-4HHYEeIVH7uzNxhfReP9hB3uFugSnb8KjWW8urrusVfSyvr6C1Sdw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jun 2021 12:21:13 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 13ec9a44;
 Mon, 14 Jun 2021 16:21:12 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/7] Support protection keys in an AMD EPYC-Milan VM
In-Reply-To: <330417d8-9e23-4c90-b825-24329d3e4c66@redhat.com>
References: <20210520145647.3483809-1-david.edmondson@oracle.com>
 <330417d8-9e23-4c90-b825-24329d3e4c66@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Mon, 14 Jun 2021 17:21:12 +0100
Message-ID: <cuno8c81kp3.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=66.111.4.238; envelope-from=dme@dme.org;
 helo=forward4-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Babu Moger <babu.moger@amd.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 2021-06-11 at 18:01:55 +02, Paolo Bonzini wrote:

> First of all, sorry for the delayed review.
>
> On 20/05/21 16:56, David Edmondson wrote:
>> AMD EPYC-Milan CPUs introduced support for protection keys, previously
>> available only with Intel CPUs.
>> 
>> AMD chose to place the XSAVE state component for the protection keys
>> at a different offset in the XSAVE state area than that chosen by
>> Intel.
>> 
>> To accommodate this, modify QEMU to behave appropriately on AMD
>> systems, allowing a VM to properly take advantage of the new feature.
>
> Uff, that sucks. :(
>
> If I understand correctly, the problem is that the layout of 
> KVM_GET_XSAVE/KVM_SET_XSAVE depends on the host CPUID, which in 
> retrospect would be obvious.  Is that correct?

Yes.

> If so, it would make sense and might even be easier to drop all usage
> of X86XSaveArea:
>
> * update ext_save_areas based on CPUID information in kvm_cpu_instance_init
>
> * make x86_cpu_xsave_all_areas and x86_cpu_xrstor_all_areas use the 
> ext_save_areas offsets to build pointers to XSaveAVX, XSaveBNDREG, etc.
>
> What do you think?

I will produce a patch and send it out.

> Paolo
>
>> Further, avoid manipulating XSAVE state components that are not
>> present on AMD systems.
>> 
>> The code in patch 6 that changes the CPUID 0x0d leaf is mostly dumped
>> somewhere that seemed to work - I'm not sure where it really belongs.
>> 
>> David Edmondson (7):
>>    target/i386: Declare constants for XSAVE offsets
>>    target/i386: Use constants for XSAVE offsets
>>    target/i386: Clarify the padding requirements of X86XSaveArea
>>    target/i386: Prepare for per-vendor X86XSaveArea layout
>>    target/i386: Introduce AMD X86XSaveArea sub-union
>>    target/i386: Adjust AMD XSAVE PKRU area offset in CPUID leaf 0xd
>>    target/i386: Manipulate only AMD XSAVE state on AMD
>> 
>>   target/i386/cpu.c            | 19 +++++----
>>   target/i386/cpu.h            | 80 ++++++++++++++++++++++++++++--------
>>   target/i386/kvm/kvm.c        | 57 +++++++++----------------
>>   target/i386/tcg/fpu_helper.c | 20 ++++++---
>>   target/i386/xsave_helper.c   | 70 +++++++++++++++++++------------
>>   5 files changed, 152 insertions(+), 94 deletions(-)
>> 

dme.
-- 
Oliver darling, call Mister Haney, I think our speakers are blown.

