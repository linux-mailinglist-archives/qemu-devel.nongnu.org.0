Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB202538826
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 22:17:54 +0200 (CEST)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlpp-0004dS-DT
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 16:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvlav-0003Io-Kh
 for qemu-devel@nongnu.org; Mon, 30 May 2022 16:02:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvlau-0003Fp-0U
 for qemu-devel@nongnu.org; Mon, 30 May 2022 16:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lC5CVuLPR7Awh+Gm2lpd6SkbKIrSew3v9LIZnGsWnzI=; b=PQQtbd0u7nwlX//LXK1mak7lCc
 cQyhG4dyE7Brls2DmlBIwjYHG/vg20VieC557C3bVSu7+qfEVbLEfkvv7a0Yi1zjA9Iwn4Ueh9Wir
 2BChaUrhesXYEmHgD2vyAU4ZQlihpH2whjwDdRMxKLdZyuoOz6m43ssBi8Z6R0xh5mDR2AH698q0J
 u91fU5OuB3VGVa4XyaTi8lkfrQuzRz7Znp5gGq8f1T1QO8yQFPyPXNI5Ukb2HRrNyKUyyCwZwTchj
 Fyd+acgjblVUUhGvtz7lxtbugP8ny12DeS66p3G5RbffG8UEc1ghf+0bJ3E3V+cDY7GZ732GdIi56
 Y0LP3gqcK0DDRpl3avXafKD5yMgju6gw0q+XGn1boxJNBxz9LFDvATO52780J0aEdFcCQCLhGjaAr
 aa47fUA9ujxkN7HJsMe9BEOity8ABItlM8BEW3+d3lWOLMe7KUe3++cfyfSEscP+lhQwQlprP/yci
 FXR6Qt2OCTflRQEmjdhI+oABu1jQ65IQ1sYA6O9iN8SU21svFv7PtUJfZiaHKFXgHe/aOIq5QrXVF
 VuSfLcetv558FVFeTkUJdBbmQnZS7cwP56f1C8qpytzG1N6d0lxJj5Z9RiKU4bdnQRd2wkGiUICAS
 qEHcvXgSG/7srBkhKHHHEFFUcQ5X+uVOraTMFW9BU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvlZe-0009IZ-Bo; Mon, 30 May 2022 21:01:14 +0100
Message-ID: <0fd7cf4c-e529-054b-a31c-0574bb82507a@ilande.co.uk>
Date: Mon, 30 May 2022 21:02:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, aurelien@aurel32.net,
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 hpoussin@reactos.org, qemu-devel@nongnu.org
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
 <d56db423-6d8f-d2ca-c91b-d098ed9f4549@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <d56db423-6d8f-d2ca-c91b-d098ed9f4549@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/12] hw/acpi/piix4: remove legacy piix4_pm_init()
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

On 29/05/2022 19:05, Philippe Mathieu-Daudé via wrote:

> On 28/5/22 11:19, Mark Cave-Ayland wrote:
>> Whilst reviewing Bernhard's PIIX Southbridge QOMifcation patches at
>> https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg04329.html, I
>> noticed that we should first eliminate the legacy device init function
>> piix4_pm_init().
>>
>> This series moves the outstanding logic from piix4_pm_init() into the
>> relevant instance init() and realize() functions, changes the IRQs to
>> use qdev gpios, and then finally removes the now-unused piix4_pm_initfn()
>> function.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>>
>> Mark Cave-Ayland (12):
>>    hw/acpi/piix4: move xen_enabled() logic from piix4_pm_init() to
>>      piix4_pm_realize()
>>    hw/acpi/piix4: change smm_enabled from int to bool
>>    hw/acpi/piix4: convert smm_enabled bool to qdev property
>>    hw/acpi/piix4: move PIIX4PMState into separate piix4.h header
>>    hw/acpi/piix4: alter piix4_pm_init() to return PIIX4PMState
>>    hw/acpi/piix4: rename piix4_pm_init() to piix4_pm_initfn()
>>    hw/acpi/piix4: introduce piix4_pm_init() instance init function
>>    hw/acpi/piix4: use qdev gpio to wire up sci_irq
>>    hw/acpi/piix4: use qdev gpio to wire up smi_irq
>>    hw/i386/pc_piix: create PIIX4_PM device directly instead of using
>>      piix4_pm_initfn()
>>    hw/isa/piix4.c: create PIIX4_PM device directly instead of using
>>      piix4_pm_initfn()
>>    hw/acpi/piix4: remove unused piix4_pm_initfn() function
> 
> Nitpicking, SCI could also be a named GPIO :)

FWIW I used the SCI irq as the "primary" GPIO since it was referenced as just "irq" 
within PIIX4PMState which is typical for a single output IRQ (my guess would be that 
"smi_irq" came along later).

> Series:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!


ATB,

Mark.

