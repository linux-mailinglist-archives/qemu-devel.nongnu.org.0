Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB52D158F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:09:58 +0100 (CET)
Received: from localhost ([::1]:51768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJ5J-0005zP-5f
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1kmJ1Y-0002w7-OS
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:06:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:50772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1kmJ1U-000289-Jx
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:06:04 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A3C623741;
 Mon,  7 Dec 2020 16:05:57 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kmJ1P-00GnxZ-3d; Mon, 07 Dec 2020 16:05:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 07 Dec 2020 16:05:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
In-Reply-To: <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com>
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
 <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
 <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
 <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
 <CAJc+Z1H7akXwDtVvQLiGVVyZ0DfmsxyJQhE7Sno6aAO9GaafEA@mail.gmail.com>
 <46fd98a2-ee39-0086-9159-b38c406935ab@arm.com>
 <CAFEAcA_Q8RSB-zcS8+cEfvWz_0U5GLzmsf12m_7BFjX8h-1hrA@mail.gmail.com>
 <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <0d0eb6da6a11f76d10e532c157181985@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: steven.price@arm.com, peter.maydell@linaro.org,
 haibo.xu@linaro.org, linux-kernel@vger.kernel.org, quintela@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
 catalin.marinas@arm.com, tglx@linutronix.de, will@kernel.org,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
 Dave.Martin@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=198.145.29.99; envelope-from=maz@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Haibo Xu <haibo.xu@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-12-07 15:45, Steven Price wrote:
> On 07/12/2020 15:27, Peter Maydell wrote:
>> On Mon, 7 Dec 2020 at 14:48, Steven Price <steven.price@arm.com> 
>> wrote:
>>> Sounds like you are making good progress - thanks for the update. 
>>> Have
>>> you thought about how the PROT_MTE mappings might work if QEMU itself
>>> were to use MTE? My worry is that we end up with MTE in a guest
>>> preventing QEMU from using MTE itself (because of the PROT_MTE
>>> mappings). I'm hoping QEMU can wrap its use of guest memory in a
>>> sequence which disables tag checking (something similar will be 
>>> needed
>>> for the "protected VM" use case anyway), but this isn't something 
>>> I've
>>> looked into.
>> 
>> It's not entirely the same as the "protected VM" case. For that
>> the patches currently on list basically special case "this is a
>> debug access (eg from gdbstub/monitor)" which then either gets
>> to go via "decrypt guest RAM for debug" or gets failed depending
>> on whether the VM has a debug-is-ok flag enabled. For an MTE
>> guest the common case will be guests doing standard DMA operations
>> to or from guest memory. The ideal API for that from QEMU's
>> point of view would be "accesses to guest RAM don't do tag
>> checks, even if tag checks are enabled for accesses QEMU does to
>> memory it has allocated itself as a normal userspace program".
> 
> Sorry, I know I simplified it rather by saying it's similar to
> protected VM. Basically as I see it there are three types of memory
> access:
> 
> 1) Debug case - has to go via a special case for decryption or
> ignoring the MTE tag value. Hopefully this can be abstracted in the
> same way.
> 
> 2) Migration - for a protected VM there's likely to be a special
> method to allow the VMM access to the encrypted memory (AFAIK memory
> is usually kept inaccessible to the VMM). For MTE this again has to be
> special cased as we actually want both the data and the tag values.
> 
> 3) Device DMA - for a protected VM it's usual to unencrypt a small
> area of memory (with the permission of the guest) and use that as a
> bounce buffer. This is possible with MTE: have an area the VMM
> purposefully maps with PROT_MTE. The issue is that this has a
> performance overhead and we can do better with MTE because it's
> trivial for the VMM to disable the protection for any memory.
> 
> The part I'm unsure on is how easy it is for QEMU to deal with (3)
> without the overhead of bounce buffers. Ideally there'd already be a
> wrapper for guest memory accesses and that could just be wrapped with
> setting TCO during the access. I suspect the actual situation is more
> complex though, and I'm hoping Haibo's investigations will help us
> understand this.

What I'd really like to see is a description of how shared memory
is, in general, supposed to work with MTE. My gut feeling is that
it doesn't, and that you need to turn MTE off when sharing memory
(either implicitly or explicitly).

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

