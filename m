Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4239E664FC0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 00:16:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFNqn-00015S-O5; Tue, 10 Jan 2023 18:16:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNql-00014j-AF
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 18:16:12 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNqj-0007YJ-Jw
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 18:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cP0Q5vj0ulhw6KQNu7LSAy26xGGkaA1BShcQcySrSVg=; b=WwZgIoQLWdgeb3hocn8yTBuml7
 Q0ls3RIyRrO6SVZ/zOVcQrywazjALDNL1xnkbZKT8helHQ7XYMcIptiAHA8nnldU3iUBVTuzvbsIX
 aNrR7RWGUHnRqPw7j+LPt8DNd6JJ2S+9iEHF1Ej487+zfITnOx6vrFFl52DsxsECzoH3GgXgTBwCi
 rl8tVpVTnBPBVMQzFjX3MPhv9omMizkzirsCuYxlSvRqNWzfeBHc5I8mYTba+hGwjOdw1+lzBvhUw
 ZaR2V18yVpLwui7h/f77y0O/3f34uNOVADekPMkNJn/gFT3LpKtYpg9lMgihwpkxPWlJY0Pur93Ym
 z/d/bIF2kSzSLjGf7CfRuckcALBBF9AUJ+F745R01Ke3AALquZObZbV9AAHRFHTphTcBvc3xT3zqS
 aS0l0OZtUzMsTqP5i55zhzRS6ltGZzFRhvX0dCNHd7UwP9ZF+rVCG0PhRLdPkTga6h0eB2WsaRfi9
 oDIreOmrZQJA3kJBu/DIRP8JoLVpJVJsBJpKVCMPdvFhAvk4E8yDgzsUbhrO3KKl80jf6Ly7H/U5l
 z/aenUm5/DIuEN+5OvII8h8e6cnYRTFft6mXiCYfp25XiglzBfm8NYwZ1HVDD2XNJS/EsjwuwORQm
 QW9dztu7SdImniz8CMov3CMkPj4Gn5DjoU2kkTT5I=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNqH-000971-Kk; Tue, 10 Jan 2023 23:15:45 +0000
Message-ID: <3d0b6d5f-6e1f-e98b-bd69-5682d0836ad8@ilande.co.uk>
Date: Tue, 10 Jan 2023 23:16:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael S Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230110095351.611724-1-thuth@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230110095351.611724-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v6 0/4] Make the mc146818 RTC device target independent
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/01/2023 09:53, Thomas Huth wrote:

> The basic idea of this patch set is to change hw/rtc/mc146818rtc.c into
> target independent code so that the file only has to be compiled once
> instead of multiple times (and that it can be used in a qemu-system-all
> binary once we get there).
> 
> The first patch extracts some functions from the APIC code that will be
> required for linking when the mc146818rtc becomes target-independent.
> 
> The second patch adds a new way for checking whether the "driftfix=slew"
> policy is available or not (since the corresponding #ifdefs in the
> mc146818rtc code will be removed).
> 
> The third patch then removes the "#ifdef TARGET" switches and turns
> the mc146818rtc code into a target-independent file.
> 
> The fourth patch just fixes a small cosmetic nit that I discovered along
> the way: On systems without mc146818, the "-rtc driftfix=slew" simply
> got ignored silently. We should at least emit a warning in this case.
> 
> Changes since last iteration:
> - Dropped the approach of using a new "slew-tick-policy-available"
>    property that needs to be set by the machine code (and thus dropped
>    the clean-up patches from Bernhard from this series since they are
>    no longer required here now)
> - Use a new check in hw/core/qdev-properties-system.c instead
>    (see the second patch)
> 
> Thomas Huth (4):
>    hw/intc: Extract the IRQ counting functions into a separate file
>    hw/core/qdev-properties-system: Allow the 'slew' policy only on x86
>    hw/rtc/mc146818rtc: Make the mc146818 RTC device target independent
>    softmmu/rtc: Emit warning when using driftfix=slew on systems without
>      mc146818
> 
>   include/hw/i386/apic.h           |  2 --
>   include/hw/i386/apic_internal.h  |  1 -
>   include/hw/intc/kvm_irqcount.h   | 10 +++++++
>   include/hw/rtc/mc146818rtc.h     |  1 +
>   hw/core/qdev-properties-system.c | 28 +++++++++++++++++-
>   hw/i386/kvm/i8259.c              |  4 +--
>   hw/i386/kvm/ioapic.c             |  4 +--
>   hw/intc/apic.c                   |  3 +-
>   hw/intc/apic_common.c            | 30 ++-----------------
>   hw/intc/kvm_irqcount.c           | 49 ++++++++++++++++++++++++++++++++
>   hw/rtc/mc146818rtc.c             | 20 ++-----------
>   softmmu/rtc.c                    |  6 +++-
>   hw/intc/meson.build              |  6 ++++
>   hw/intc/trace-events             |  9 +++---
>   hw/rtc/meson.build               |  3 +-
>   15 files changed, 115 insertions(+), 61 deletions(-)
>   create mode 100644 include/hw/intc/kvm_irqcount.h
>   create mode 100644 hw/intc/kvm_irqcount.c

This looks much better than the previous approaches - thanks for working on this! 
Looks good to me, so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

