Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC9292A0A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 17:10:29 +0200 (CEST)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUWnr-0003DV-Hm
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 11:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Dave.Martin@arm.com>)
 id 1kUWcb-00048C-DH
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 10:58:50 -0400
Received: from foss.arm.com ([217.140.110.172]:52298)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Dave.Martin@arm.com>) id 1kUWcX-0000kG-R4
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 10:58:48 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C9BD1FB;
 Mon, 19 Oct 2020 07:58:44 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36CE93F66B;
 Mon, 19 Oct 2020 07:58:43 -0700 (PDT)
Date: Mon, 19 Oct 2020 15:58:40 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Kernel patch cases qemu live migration failed.
Message-ID: <20201019145839.GO32292@arm.com>
References: <7fecfc67da4caab1d677a8b4cd5386b3@kernel.org>
 <20201015133505.ubxvbrt6xyvl4362@kamzik.brq.redhat.com>
 <16400df4bdf79b8b22e824eb1a20e2b4@kernel.org>
 <20201015144104.ytwzpxjlsgyun3ob@kamzik.brq.redhat.com>
 <CAFEAcA-LBmbjp-Teb35f=O-1QtMLd8bAuq5XaCz9URdQZ1jxow@mail.gmail.com>
 <20201019092525.ekvgbcwwtm63pueu@kamzik.brq.redhat.com>
 <20201019113157.GN32292@arm.com>
 <CAFEAcA8oncKmGxKGEZBg9Pnm4hjSO8u9KSv4YxFWxX0+LJ5E2g@mail.gmail.com>
 <20201019134043.vqusmzhqp7owjt6x@kamzik.brq.redhat.com>
 <CAFEAcA8RB6MTnv0qavxWs28=pbT16i9dT1pd+0Dy9HxPVk+bZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8RB6MTnv0qavxWs28=pbT16i9dT1pd+0Dy9HxPVk+bZA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: pass client-ip=217.140.110.172; envelope-from=Dave.Martin@arm.com;
 helo=foss.arm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 10:28:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Marc Zyngier <maz@kernel.org>, Andrew Jones <drjones@redhat.com>,
 xu910121@sina.com, kvmarm <kvmarm@lists.cs.columbia.edu>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 19, 2020 at 03:18:11PM +0100, Peter Maydell wrote:
> On Mon, 19 Oct 2020 at 14:40, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Mon, Oct 19, 2020 at 12:43:33PM +0100, Peter Maydell wrote:
> > > Well, ID regs are special in the architecture -- they always exist
> > > and must RAZ/WI, even if they're not actually given any fields yet.
> > > This is different from other "unused" parts of the system register
> > > encoding space, which UNDEF.
> >
> > Table D12-2 confirms the register should be RAZ, as it says the register
> > is "RO, but RAZ if SVE is not implemented". Does "RO" imply "WI", though?
> > For the guest we inject an exception on writes, and for userspace we
> > require the value to be preserved on write.
> 
> Sorry, I mis-spoke. They're RAZ, but not WI, just RO (which is to say
> they'll UNDEF if you try to write to them).
> 
> > I think we should follow the spec, even for userspace access, and be RAZ
> > for when the feature isn't implemented. As for writes, assuming the
> > exception injection is what we want for the guest (not WI), then that's
> > correct. For userspace, I think we should continue forcing preservation
> > (which will force preservation of zero when it's RAZ).
> 
> Yes, that sounds right.

[...]

> > > The problem is that you've actually removed registers from
> > > the list that were previously in it (because pre-SVE
> > > kernels put this ID register in the list as a RAZ/WI register,
> > > and now it's not in the list if SVE isn't supported).

Define "previously", though.  IIUC, the full enumeration was added in
v4.15 (with ID_AA64ZFR0_EL1 still not supported at all):

v4.15-rc1~110^2~27
93390c0a1b20 ("arm64: KVM: Hide unsupported AArch64 CPU features from guests")


And then ID_AA64FZR0_EL1 was removed from the enumeration, also in
v4.15:

v4.15-rc1~110^2~5
07d79fe7c223 ("arm64/sve: KVM: Hide SVE from CPU features exposed to guests")


So, are there really two upstram kernel tags that are mismatched on
this, or is this just a bisectability issue in v4.14..v4.15?

It's a while since I looked at this, and I may have misunderstood the
timeline.


> > > > So, I think that instead of changing the ID_AA64ZFR0_EL1 behaviour,
> > > > parhaps we should move all ID_UNALLOCATED() regs (and possibly
> > > > ID_HIDDEN(), not sure about that) to have REG_HIDDEN_USER visibility.
> > >
> > > What does this do as far as the user-facing list-of-registers
> > > is concerned? All these registers need to remain in the
> > > KVM_GET_REG_LIST list, or you break migration from an old
> > > kernel to a new one.

OK, I think I see where you are coming from, now.

It may make sense to get rid of the REG_HIDDEN_GUEST / REG_HIDDEN_USER
distinction, and provide the same visibility for userspace as for MSR/
MRS all the time.  This would restore ID_AA64ZFR0_EL1 into the userspace
view, and may also allow a bit of simplification in the code.

Won't this will still break migration from the resulting kernel to a
current kernel that hides ID_AA64ZFR0_EL1?  Or have I misunderstood
something.

Cheers
---Dave

