Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F74853E41C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 12:50:41 +0200 (CEST)
Received: from localhost ([::1]:54058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyAJi-0000Yk-6J
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 06:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyA8I-0003x7-VF
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:38:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyA8G-00008O-OV
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YesdsvhjzmrlRNf+RbzsGhvUlBJ8e7pClOzXXVEXgQw=; b=ZRJXTKZz0ChcPnVo82Xr6YXL4r
 xeY4r9b6/B2Ty6kah71Ow1Eolmk8E5VBo3ne3nS7fqKrcrMVb3KeQVH0jbE+Vn+hKOPbvX1S9kzHG
 bJsp7OJr3q4rNBvCd3jd8R060RiBuWyMK2TjsbXPqZs00LcjYDedHVqQd29MTeHPnaytcVcMV9xCy
 9iS3tpbmrsFVAkRmgV1UvnK8Fsr9pdUzJgvxuTPE/dc07uT+0NvZ7bqOOZpH0UmMZN8l4hcrX3Jne
 2JPzqBWTU+nYH2rki3DRU/RD85ZTjaoumYGEsx4nrElcWPOXLtaGcfJpDj+Jmyjz7MO5kCDapirBz
 D1vutF0dlsPRF/qzUr3xM8FBBYZt3a4S/TPk3J/W9j0v/G/mrEpnp2wnK4f9HmyqBMoLo8fkr1x0L
 Kwyi2f8+woqxFtePBnXZORuEiOAQqAWpc9DpE5kT0WDnVgnFb9mkgAI6FtP+whOQdb1Xv7iptZtwZ
 Z+PA4ReaojPBzkmTCwXRBZ/tiknf7V9F+ZOBIdf/BbKnrVudtXk7Y0nDsmYPQbRg+ZsN4+fs+/2OO
 3ih7/vQt2QAi0wBLJa3o2oi/15nufmXrkC+IgMZrhUMXWZqMnpik7A8q7Rc0wz6nel0CIWvdcwlf1
 P3kgVh0kuEqg0xPkKb8jX0VZXvwkZnVYJLP/wloJw=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyA75-0003Ab-Mn; Mon, 06 Jun 2022 11:37:39 +0100
Message-ID: <9af4ae02-002e-4283-2517-2672a1effb8d@ilande.co.uk>
Date: Mon, 6 Jun 2022 11:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220603185045.143789-1-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 00/11] QOM'ify PIIX southbridge creation
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

On 03/06/2022 19:50, Bernhard Beschow wrote:

> v4:
> * Rebase onto https://patchew.org/QEMU/20220530112718.26582-1-philippe.mathieu.daude@gmail.com/
> * Cosmetics (fix typo, omit "include") (Mark, Philippe)
> * Split piix3 and piix4 (Philippe)
> * s/Found-by/Reported-by/ (Philippe)
> * Don't alias smbus (Mark)
> 
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
> Bernhard Beschow (11):
>    hw/southbridge/piix: Aggregate all PIIX southbridge type names
>    hw/isa/piix4: Use object_initialize_child() for embedded struct
>    hw/isa/piix4: Move pci_map_irq_fn' near pci_set_irq_fn
>    hw/isa/piix4: QOM'ify PCI device creation and wiring
>    hw/isa/piix4: Factor out ISABus retrieval from piix4_create()
>    hw/isa/piix4: QOM'ify PIIX4 PM creation
>    hw/isa/piix4: Inline and remove piix4_create()
>    hw/isa/piix3: Move pci_map_irq_fn near pci_set_irq_fn
>    hw/isa/piix3: QOM'ify PCI device creation and wiring
>    hw/isa/piix3: Factor out ISABus retrieval from piix3_create()
>    hw/isa/piix3: Inline and remove piix3_create()
> 
>   hw/i386/pc_piix.c             |   7 +-
>   hw/isa/piix3.c                |  98 +++++++++++++++-------------
>   hw/isa/piix4.c                | 119 +++++++++++++++++-----------------
>   hw/mips/malta.c               |   9 ++-
>   include/hw/isa/isa.h          |   2 -
>   include/hw/southbridge/piix.h |   6 +-
>   6 files changed, 128 insertions(+), 113 deletions(-)

I've had quick look over this and it seems fine to me, so for the entire series:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

