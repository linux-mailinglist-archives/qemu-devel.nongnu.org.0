Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355925387AC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:13:53 +0200 (CEST)
Received: from localhost ([::1]:38642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvkpr-0004qF-Tc
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvknu-00036n-B3; Mon, 30 May 2022 15:11:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvkns-0004JJ-AW; Mon, 30 May 2022 15:11:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k7/aaf0LECyYsI6vlWtpUBVubShsusUR2YPLHvyMB2A=; b=cb+SUrW9sFcb8MJHiKhG/Fyt9c
 bNpfTw7mCDGO59eHEQxKVjxgw6a2O7ICvXGNu74OBViDleiAf56QiFo1ORg4/7LJDesXgmzalmVQl
 N+pAmp8lVpDiEt3c7JFzWhUObPfuj46GY9x5+klDfks7iijL+Urqm8+dxfg/PhY2PXFHr9og1YAeM
 fG0fJs7OMMctuCGijaTQo8Gax46d3Uy68uwwjhnG+dt56vXtmUHDud7inFSNQ8zzGfBuD9LBLAehg
 IMpOYOsHTUHxqZgC32FNu0jB/JkNEczR9TMPc+H25WKyyueOIdkadXeu46f2uifed3HpaGwovFr2K
 4Cu/+o5pkqnOJ5ocs7rJnYf/X3ST7tB2Zij9/+b0BlS5H1NIFBVN0FhZekiGf4jv/MEQtGlMVfAHx
 vMjI1aP2jY0165/yOOBLi/qw889sxjr9outQdasauyOZ0H9ITuiBg+9QxudaJzWFPd/w+k0rfviP+
 +6entjVmhRGjtE7UUtqdcrfBMVrjc8HL8q6gbOeB07I4sptHIjI3S001pS0b33TnV1ShO5T32lFZ6
 p2DqSSZW6R+pKrPXLV7WCmU6UWiJRvEZG5VJ5G61T4qmprXBDeajP/VSrtvexKm7ivaFaQXBnbb5M
 q437/XsHhr/Tshnrpu7ba/eAoisex7AVud8g23tGY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvkmj-0008uH-Sm; Mon, 30 May 2022 20:10:42 +0100
Message-ID: <5ef86c6c-719b-f197-3ccb-462e453dffa5@ilande.co.uk>
Date: Mon, 30 May 2022 20:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220528192057.30910-1-shentey@gmail.com>
 <110e160e-19bd-dd7a-1b4e-1a0e7437b782@ilande.co.uk>
 <ac5d95b2-8be5-1585-3076-deabe749e926@ilande.co.uk>
 <CAG4p6K7DzHVsp8425-O4uvb46XT9nzw-A2CK_jK8Nm+Xt8wsbw@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAG4p6K7DzHVsp8425-O4uvb46XT9nzw-A2CK_jK8Nm+Xt8wsbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 0/7] QOM'ify PIIX southbridge creation
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/05/2022 14:02, Bernhard Beschow wrote:

> On Sun, May 29, 2022 at 12:06 PM Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk 
> <mailto:mark.cave-ayland@ilande.co.uk>> wrote:
> 
>     On 29/05/2022 10:46, Mark Cave-Ayland wrote:
> 
>      > On 28/05/2022 20:20, Bernhard Beschow wrote:
>      >
>      >> v3:
>      >> * Rebase onto 'hw/acpi/piix4: remove legacy piix4_pm_init() function' (Mark) [1]
>      >> * Use embedded structs for touched PCI devices (Mark)
>      >> * Fix piix4's rtc embedded struct to be initialized by
>      >>    object_initialize_child() (Peter) [2]
>      >>
>      >> Testing done:
>      >>
>      >> 1)
>      >> `make check-avocado` for --target-list=x86_64-softmmu,mips-softmmu
>      >> Result: All pass.
>      >>
>      >> 2)
>      >> * `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_64.iso`
>      >> * `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda
>      >>    debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"`
>      >>
>      >> In both cases the system booted successfully and it was possible to shut down
>      >> the system using the `poweroff` command.
>      >>
>      >>
>      >> v2:
>      >> * Preserve `DeviceState *` as return value of piix4_create() (Mark)
>      >> * Aggregate all type name movements into first commit (Mark)
>      >> * Have piix4 southbridge rather than malta board instantiate piix4 pm (me)
>      >>
>      >> Testing done:
>      >>
>      >> 1)
>      >> `make check-avocado` for --target-list=x86_64-softmmu,mips-softmmu
>      >> Result: All pass.
>      >>
>      >> 2)
>      >> Modify pci_piix3_realize() to start with
>      >>      error_setg(errp, "This is a test");
>      >> Then start `qemu-system-x86_64 -M pc -m 1G -accel kvm -cpu host -cdrom
>      >> archlinux-2022.05.01-x86_64.iso`.
>      >> Result: qemu-system-x86_64 aborts with: "This is a test"
>      >>
>      >>
>      >> v1:
>      >> The piix3 and piix4 southbridge devices still rely on create() functions which
>      >> are deprecated. This series resolves these functions piece by piece to
>      >> modernize the code.
>      >>
>      >> Both devices are modified in lockstep where possible to provide more context.
>      >>
>      >> Testing done:
>      >> * `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_64.iso`
>      >> * `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda
>      >>    debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"`
>      >>
>      >> In both cases the system booted successfully and it was possible to shut down
>      >> the system using the `poweroff` command.
>      >>
>      >> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg05686.html
>     <https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg05686.html>
>      >> [2] https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01128.html
>     <https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01128.html>
>      >>
>      >> Bernhard Beschow (7):
>      >>    include/hw/southbridge/piix: Aggregate all PIIX soughbridge type names
>      >>    hw/isa/piix4: Use object_initialize_child() for embedded struct
>      >>    hw/isa/piix{3,4}: Move pci_map_irq_fn's near pci_set_irq_fn's
>      >>    hw/isa/piix{3,4}: QOM'ify PCI device creation and wiring
>      >>    hw/isa/piix{3,4}: Factor out ISABus retrieval from create() functions
>      >>    hw/isa/piix4: QOM'ify PIIX4 PM creation
>      >>    hw/isa/piix{3,4}: Inline and remove create() functions
>      >>
>      >>   hw/i386/pc_piix.c             |   7 +-
>      >>   hw/isa/piix3.c                |  98 ++++++++++++++-------------
>      >>   hw/isa/piix4.c                | 120 +++++++++++++++++-----------------
>      >>   hw/mips/malta.c               |   7 +-
>      >>   include/hw/isa/isa.h          |   2 -
>      >>   include/hw/southbridge/piix.h |   6 +-
>      >>   6 files changed, 127 insertions(+), 113 deletions(-)
>      >
>      > Hi Bernhard,
>      >
>      > I've spotted a couple of small things, but once those are fixed this series looks
>      > good to me so I'm happy to give a:
>      >
>      > Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk
>     <mailto:mark.cave-ayland@ilande.co.uk>>
>      >
>      > Thanks for your patience with these series too: you've done some good work here,
>      > however patchsets like this can sometimes take a while to get reviewed because
>     they
>      > both i) touch legacy code/APIs and ii) cut across multiple machines and
>     maintainers.
>      > I'd really like to get this work, along with your RTC updates, merged soon as
>     it is a
>      > great improvement.
>      >
>      > One reason that you may not get many reviews is because you've not added the
>     relevant
>      > maintainers on To/CC. Due to the large volume of emails on qemu-devel, quite a
>     few
>      > maintainers will filter based upon their own email address so it is definitely
>     worth
>      > adding them in.
>      >
>      > Fortunately you can easily find the relevant maintainer email addresses by
>     running
>      > "./scripts/get_maintainer.pl <http://get_maintainer.pl>
>     <path-to-git-patch-dir>" on your git format-patch
>      > directory. I'd recommend doing this, and also dropping qemu-trivial since I
>     would say
>      > these patches are now beyond the trivial threshold.
> 
>     Oh wait - I see now it's just the cover letter which is missing the additional
>     maintainer addresses :)  If you could add them into the cover letter for your next
>     revision that would be great, since it gives context for maintainers to help with
>     the
>     review process.
> 
> 
> Hi Mark,
> 
> Thanks for your great work you put into reviews and the useful insights! It seems to 
> me that the time it takes for patches to be queued depends on the subsystem - some 
> are faster, some are slower...
> 
> I've automated my setup as described in [1]. However, it doesn't seem to work for the 
> cover letter which I'd expect to be sent to the union of all reviewers of all 
> patches. Any idea how to fix this?
> 
> Best regards,
> Bernhard
> 
> [1] 
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html#cc-the-relevant-maintainer 
> <https://www.qemu.org/docs/master/devel/submitting-a-patch.html#cc-the-relevant-maintainer> 

Good question. I tend to do "git format-patch -o /tmp/foo --cover-letter" to generate 
the series, fill in the cover letter, and then use "git send-email /tmp/foo" to send 
out the emails (entering in the results of get_maintainer.pl by hand). I'm not sure 
why the cover letter isn't being generated correctly in your case I'm afraid.


ATB,

Mark.

