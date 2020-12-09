Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0972D4324
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 14:27:21 +0100 (CET)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmzV1-00073B-J0
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 08:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1kmzTB-0006F1-Hk
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:25:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:37756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1kmzT8-000758-UK
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:25:25 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0167123101;
 Wed,  9 Dec 2020 13:25:21 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kmzT4-00HOUv-VX; Wed, 09 Dec 2020 13:25:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Dec 2020 13:25:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
In-Reply-To: <20201209124443.GB13566@gaia>
References: <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
 <CAJc+Z1H7akXwDtVvQLiGVVyZ0DfmsxyJQhE7Sno6aAO9GaafEA@mail.gmail.com>
 <46fd98a2-ee39-0086-9159-b38c406935ab@arm.com>
 <CAFEAcA_Q8RSB-zcS8+cEfvWz_0U5GLzmsf12m_7BFjX8h-1hrA@mail.gmail.com>
 <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com>
 <0d0eb6da6a11f76d10e532c157181985@kernel.org> <20201207163405.GD1526@gaia>
 <874kkx5thq.wl-maz@kernel.org> <20201208172143.GB13960@gaia>
 <7ff14490e253878d0735633b792e1ea9@kernel.org> <20201209124443.GB13566@gaia>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <ef14a5158fc65c00f6c3c842cfa83b2c@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, steven.price@arm.com,
 peter.maydell@linaro.org, haibo.xu@linaro.org, linux-kernel@vger.kernel.org,
 quintela@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 dgilbert@redhat.com, tglx@linutronix.de, will@kernel.org,
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
 Juan Quintela <quintela@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Dave Martin <Dave.Martin@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Haibo Xu <haibo.xu@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-12-09 12:44, Catalin Marinas wrote:
> On Tue, Dec 08, 2020 at 06:21:12PM +0000, Marc Zyngier wrote:
>> On 2020-12-08 17:21, Catalin Marinas wrote:
>> > On Mon, Dec 07, 2020 at 07:03:13PM +0000, Marc Zyngier wrote:
>> > > I wonder whether we will have to have something kernel side to
>> > > dump/reload tags in a way that matches the patterns used by live
>> > > migration.
>> >
>> > We have something related - ptrace dumps/resores the tags. Can the same
>> > concept be expanded to a KVM ioctl?
>> 
>> Yes, although I wonder whether we should integrate this deeply into
>> the dirty-log mechanism: it would be really interesting to dump the
>> tags at the point where the page is flagged as clean from a dirty-log
>> point of view. As the page is dirtied, discard the saved tags.
> 
> From the VMM perspective, the tags can be treated just like additional
> (meta)data in a page. We'd only need the tags when copying over. It can
> race with the VM dirtying the page (writing tags would dirty it) but I
> don't think the current migration code cares about this. If dirtied, it
> copies it again.
> 
> The only downside I see is an extra syscall per page both on the origin
> VMM and the destination one to dump/restore the tags. Is this a
> performance issue?

I'm not sure. Migrating VMs already has a massive overhead, so an extra
syscall per page isn't terrifying. But that's the point where I admit
not knowing enough about what the VMM expects, nor whether that matches
what happens on other architectures that deal with per-page metadata.

Would this syscall operate on the guest address space? Or on the VMM's
own mapping?

         M.
-- 
Jazz is not dead. It just smells funny...

