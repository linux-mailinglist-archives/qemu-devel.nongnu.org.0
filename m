Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D4A537077
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 11:49:34 +0200 (CEST)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvFYC-0005KQ-Ng
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 05:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvFV7-0004Qz-9i; Sun, 29 May 2022 05:46:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvFV5-0001q2-FD; Sun, 29 May 2022 05:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EAJyMhLYfCzffUKPV146n935Ya+6Cj/Mo/VN/sxuREg=; b=rhleUAoKpAni/zz02+e4/vXtQ0
 z7FvBYGdBIuhgkDFuP6hGiVxK3augq9rWrpI/BA7bTYykHQeO0PIi6uhznCOS4Ay8UQ/sd5wWzU4C
 NutN+jJA3+j6jXJfGnmBWxJpVirF64b/GH0/rq01ymhHGW2Flu1HXQTyL6Exi/w2k2LjaimPC1wq3
 SbVJaCllSeMYR8M+fklNHh2oEqCkqH0aaJ1ViTn0iXl814XpFlBnv3DXV9DhoMDYp/HO3fD7+pw6i
 NnV6dpdpq64AjDgUSBPqlLLXymMHXNRhJwgITDx8IRmDG3rm0koWmltXfdrB6LyR1PqyNQJqaofb6
 vjj24whgu6ey/xIRJtOj2vYdiOclq6eBd56LXcvxHKoFsH7wzX1QVJCfOPFE9UZtd86jNYfGb85lD
 LmvhGB9CF3uk4f7Ape1lPOMcsu/l1Zbxeb+VvLMsd1a4fXaHd1yjHmbo/9mEEwE2fiFMfo1+QKQUJ
 F0sFaKdhHgJCWkSpqK+rFjyjAccF2yfDHJIglAlss6Nby1EFwFUGFDVsgFObADusoS6NNAzu/O2t8
 bqfjAk5kVW3iF9S1C9O2dhwDxN3jtrlLkinvwHKzapmzVWgTKufqk2u4mYxqN7K1uDPGyj9ZXxmQJ
 wRk3rdnqDMk6VLYA0WZOmwdIQCv8HJn5TyNxBHcqY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvFTz-000AUn-7h; Sun, 29 May 2022 10:45:15 +0100
Message-ID: <110e160e-19bd-dd7a-1b4e-1a0e7437b782@ilande.co.uk>
Date: Sun, 29 May 2022 10:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220528192057.30910-1-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220528192057.30910-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 28/05/2022 20:20, Bernhard Beschow wrote:

> v3:
> * Rebase onto 'hw/acpi/piix4: remove legacy piix4_pm_init() function' (Mark) [1]
> * Use embedded structs for touched PCI devices (Mark)
> * Fix piix4's rtc embedded struct to be initialized by
>    object_initialize_child() (Peter) [2]
> 
> Testing done:
> 
> 1)
> `make check-avocado` for --target-list=x86_64-softmmu,mips-softmmu
> Result: All pass.
> 
> 2)
> * `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_64.iso`
> * `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda
>    debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"`
> 
> In both cases the system booted successfully and it was possible to shut down
> the system using the `poweroff` command.
> 
> 
> v2:
> * Preserve `DeviceState *` as return value of piix4_create() (Mark)
> * Aggregate all type name movements into first commit (Mark)
> * Have piix4 southbridge rather than malta board instantiate piix4 pm (me)
> 
> Testing done:
> 
> 1)
> `make check-avocado` for --target-list=x86_64-softmmu,mips-softmmu
> Result: All pass.
> 
> 2)
> Modify pci_piix3_realize() to start with
>      error_setg(errp, "This is a test");
> Then start `qemu-system-x86_64 -M pc -m 1G -accel kvm -cpu host -cdrom
> archlinux-2022.05.01-x86_64.iso`.
> Result: qemu-system-x86_64 aborts with: "This is a test"
> 
> 
> v1:
> The piix3 and piix4 southbridge devices still rely on create() functions which
> are deprecated. This series resolves these functions piece by piece to
> modernize the code.
> 
> Both devices are modified in lockstep where possible to provide more context.
> 
> Testing done:
> * `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_64.iso`
> * `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda
>    debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"`
> 
> In both cases the system booted successfully and it was possible to shut down
> the system using the `poweroff` command.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg05686.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01128.html
> 
> Bernhard Beschow (7):
>    include/hw/southbridge/piix: Aggregate all PIIX soughbridge type names
>    hw/isa/piix4: Use object_initialize_child() for embedded struct
>    hw/isa/piix{3,4}: Move pci_map_irq_fn's near pci_set_irq_fn's
>    hw/isa/piix{3,4}: QOM'ify PCI device creation and wiring
>    hw/isa/piix{3,4}: Factor out ISABus retrieval from create() functions
>    hw/isa/piix4: QOM'ify PIIX4 PM creation
>    hw/isa/piix{3,4}: Inline and remove create() functions
> 
>   hw/i386/pc_piix.c             |   7 +-
>   hw/isa/piix3.c                |  98 ++++++++++++++-------------
>   hw/isa/piix4.c                | 120 +++++++++++++++++-----------------
>   hw/mips/malta.c               |   7 +-
>   include/hw/isa/isa.h          |   2 -
>   include/hw/southbridge/piix.h |   6 +-
>   6 files changed, 127 insertions(+), 113 deletions(-)

Hi Bernhard,

I've spotted a couple of small things, but once those are fixed this series looks 
good to me so I'm happy to give a:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Thanks for your patience with these series too: you've done some good work here, 
however patchsets like this can sometimes take a while to get reviewed because they 
both i) touch legacy code/APIs and ii) cut across multiple machines and maintainers. 
I'd really like to get this work, along with your RTC updates, merged soon as it is a 
great improvement.

One reason that you may not get many reviews is because you've not added the relevant 
maintainers on To/CC. Due to the large volume of emails on qemu-devel, quite a few 
maintainers will filter based upon their own email address so it is definitely worth 
adding them in.

Fortunately you can easily find the relevant maintainer email addresses by running 
"./scripts/get_maintainer.pl <path-to-git-patch-dir>" on your git format-patch 
directory. I'd recommend doing this, and also dropping qemu-trivial since I would say 
these patches are now beyond the trivial threshold.


ATB,

Mark.

