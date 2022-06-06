Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891DA53E427
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 13:02:16 +0200 (CEST)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyAUs-0001zO-MA
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 07:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyAP5-0007uL-JX
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:56:11 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyAP3-0002jP-QQ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+g83QU/l2Um5q6WRqlB/aPHKTjgzbl7NfmkJKfm86rM=; b=ZqF8bMpKUOQ47C3TtpRrtkljLK
 BVR6bn9Eh2aqhtg9u2nY2R7XZEcvCmieq2vVYm26nI7HtjO9ElqN+wsdWIXQhySYQ3x4bjqF4cuzE
 ANngRFzVd1q/2meTF2rVf0gjDenaqLkHfwYs+tRrNM7j9/FtqAG4iX8C9Itm6fd/xz4zxHc/iNdP0
 hGeKonabzClH/IjxKLB4mKXclJVeYLtTGM+shtRvNHBkxQEfCiV+rcczQeW3MTrax2vA4J4ECQNE3
 FLVDaExObR0Ydnj0m7tNVo3XCYCrSqLhSuR8L//vDt7HN/SUiOdrdEGGHlf+fU6Jj6ytlNpx0nitV
 e5ANyMd8HBRBnc5xfgq00cJLQ8RuMhDZMl+iE07Fn5gAUjaxmZ2IDTLdZ92fhhZ7Hve8iFN9eTdQK
 /ZyI9G7GpwjKo/EkhqGb4VF/ewJneIZXWJ0uzuGOrwkwnqTOq+TE3sXWfD5+4NsoVJkPatGJGT8JH
 mrusdtAGVUQ5rmoCJn9EwdxDWImVIowImVs38mwe2F5hHSEC3vtrri4wO6bzK448HPdbc3mhv2XU9
 bMmhxtwPhDtd+eOzs38PJztcMpVIu7b6zHuOmJ0mMT7wuFQgV6Wvt1jzsiYuAV7YQnZScxPruCgOl
 kqx469Td4BlQDnAeKrOqIol+6GzhrXU8Sup9RLL5E=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyANu-0003H9-F8; Mon, 06 Jun 2022 11:55:02 +0100
Message-ID: <efd524b1-0ba5-048f-0d79-d67c5d87b020@ilande.co.uk>
Date: Mon, 6 Jun 2022 11:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/11] hw/acpi/piix4: remove legacy piix4_pm_init()
 function
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

On 30/05/2022 12:27, Philippe Mathieu-Daudé wrote:

> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> This series moves the outstanding logic from piix4_pm_init() into
> the relevant instance init() and realize() functions, changes the
> IRQs to use qdev gpios, and then finally removes the now-unused
> piix4_pm_initfn() function.
> 
> v2:
> - Addressed Ani & Bernhard review comments
> 
> If no further comments I plan to queue this via mips-next end of
> this week.
> 
> Regards,
> 
> Phil.
> 
> Mark Cave-Ayland (11):
>    hw/acpi/piix4: move xen_enabled() logic from piix4_pm_init() to
>      piix4_pm_realize()
>    hw/acpi/piix4: change smm_enabled from int to bool
>    hw/acpi/piix4: convert smm_enabled bool to qdev property
>    hw/acpi/piix4: move PIIX4PMState into separate piix4.h header
>    hw/acpi/piix4: alter piix4_pm_init() to return PIIX4PMState
>    hw/acpi/piix4: rename piix4_pm_init() to piix4_pm_initfn()
>    hw/acpi/piix4: use qdev gpio to wire up sci_irq
>    hw/acpi/piix4: use qdev gpio to wire up smi_irq
>    hw/i386/pc_piix: create PIIX4_PM device directly instead of using
>      piix4_pm_initfn()
>    hw/isa/piix4.c: create PIIX4_PM device directly instead of using
>      piix4_pm_initfn()
>    hw/acpi/piix4: remove unused piix4_pm_initfn() function
> 
>   hw/acpi/piix4.c               | 77 ++++++-----------------------------
>   hw/i386/acpi-build.c          |  1 +
>   hw/i386/pc_piix.c             | 16 +++++---
>   hw/isa/piix4.c                | 11 +++--
>   include/hw/acpi/piix4.h       | 75 ++++++++++++++++++++++++++++++++++
>   include/hw/southbridge/piix.h |  6 ---
>   6 files changed, 107 insertions(+), 79 deletions(-)
>   create mode 100644 include/hw/acpi/piix4.h

Hi Phil,

I see that you haven't yet sent over the PR for this, so I wondering if it makes 
sense to add Bernhard's other series to mips-next first since they are good cleanups:

https://patchew.org/QEMU/20220603185045.143789-1-shentey@gmail.com/ (QOMify Sbridge)
https://patchew.org/QEMU/20220529184006.10712-1-shentey@gmail.com/  (RTC)
https://patchew.org/QEMU/20220520180109.8224-1-shentey@gmail.com/   (Random cleanups)
https://patchew.org/QEMU/20220605151908.30566-1-shentey@gmail.com/  (Werror fix)

Alternatively if you are busy, please let me know if you are happy for me to send a 
PR with Bernhard's fixes via qemu-sparc on your behalf.


ATB,

Mark.

