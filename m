Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336CC52FA4B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 11:23:10 +0200 (CEST)
Received: from localhost ([::1]:51240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsLKH-0005dh-0W
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 05:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLHI-0004jM-RC; Sat, 21 May 2022 05:20:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLHH-0001qw-6c; Sat, 21 May 2022 05:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=73YO+S4rnJwl+SzIEUsYYRgLMCILcLfGiRGqOh4wZf4=; b=g8lWxMUmItfWb/XtTegkDpWPhV
 go7tQcgEA6LnPftW16JwY5IzTenx+Kum5yqUVKTehySuU6+pAUDK2q6WW3+H2pjKN4/TGjyKkvOtf
 BS9g7OglLaLD1SaLBI8nKwjOEq4BbOaaflfa7sqyF3wFeVLwESu/hwt2u3SI6eBuDY2RCrz9ywzh9
 YfdI60Nrn4gwOx1CEYO6TqmSWqvExZmiBnn6dFjnktDFO5sNKRICPhi4q8A8Ay5+/KEMh1K94EHXZ
 7+f4NCrG5wrx079XFXyT9NHmBKJSf+nMAdotCL6ku/QaW6Wi6WT1H3Lq/tddwW5FDtQWze+ClnGmI
 VsTdd0PUP0TioV/eo1iUpmh8WEiH7vuGHxd4TDGA8DF/651Agmoh9eLcyfqNdzZwM1CeznBDNh1ce
 Stfbdut8xrBRl6nRz++jR4fYQo1VHjAWmHZuVe13PbM9xz05BAO0blQThpEZ1hPIzYtFISt5wS8uh
 3agivxWxHAfQLd1YywzYvhlwM9800AHUm5mSSMPqe7OrUUPdCaoPTMe/sgMDSqgBZdesfvUkdXHUH
 ArwLjz3yknPBTQwnsjKKBU33Sz1ZThNtr4m4IwsWrnzwIBcN/5IgomobWxIz5WlcZxaVC8tkoMW2u
 sLJu7Pr4MbRphr7t2vDPR8W8AQuBKaFUQhBurVLDQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLGC-000AY1-Mo; Sat, 21 May 2022 10:19:00 +0100
Message-ID: <09cf8b54-189b-b03f-1ddd-e414c9c9c9aa@ilande.co.uk>
Date: Sat, 21 May 2022 10:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220520174537.5827-1-shentey@gmail.com>
 <20220520174537.5827-2-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220520174537.5827-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/2] hw/i386/microvm-dt: Determine mc146818rtc's IRQ
 number from QOM property
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

On 20/05/2022 18:45, Bernhard Beschow wrote:

> Since commit 3b004a16540aa41f2aa6a1ceb0bf306716766914 'hw/rtc/
> mc146818rtc: QOM'ify IRQ number' mc146818rtc's IRQ number is
> configurable. Fix microvm-dt to respect its value.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/microvm-dt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
> index 9c3c4995b4..a5db9e4e5a 100644
> --- a/hw/i386/microvm-dt.c
> +++ b/hw/i386/microvm-dt.c
> @@ -208,7 +208,7 @@ static void dt_add_isa_serial(MicrovmMachineState *mms, ISADevice *dev)
>   static void dt_add_isa_rtc(MicrovmMachineState *mms, ISADevice *dev)
>   {
>       const char compat[] = "motorola,mc146818";
> -    uint32_t irq = RTC_ISA_IRQ;
> +    uint32_t irq = object_property_get_uint(OBJECT(dev), "irq", NULL);
>       hwaddr base = RTC_ISA_BASE;
>       hwaddr size = 8;
>       char *nodename;

Rather than using NULL as the last parameter to object_property_get_uint() I think 
using &error_abort to force an explicit failure if the irq property doesn't exist 
would be better.

Otherwise:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

