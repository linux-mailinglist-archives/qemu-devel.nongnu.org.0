Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D911341FC6A
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:05:38 +0200 (CEST)
Received: from localhost ([::1]:46576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfdx-0007HC-MJ
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfcb-0006bG-4K
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:04:13 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfcZ-0003TC-GU
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:04:12 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j10-20020a1c230a000000b0030d523b6693so3114208wmj.2
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=alHFy3Z8krFswLX+5mkn5qeUgCLkxPQX/2Et61KNiv8=;
 b=UVxke0soTytTgD8UNu3X5xeNCmY0pDQWYd4cMnW1nDSRGd5N7+M28TmI5221MtFNrr
 AeeKfYjOs51zHEl7ztJzQGQpXqbMJbP/6ZLSsWqwRJDjLqVeKRF3UynwAQYaYTtVMymB
 IGYqZAxV7mvHWXip/MEPTE3pUhYQmioKHuY3okjBN5iKX9Sf/cynsSy04ppNHw+iujp9
 np9efzw+NruD8omZfhx6jY0P639X14jHCdleK+7VcWdzPVL/839QdNPcey5jvEI5HRvd
 VgSa0CBVH6tPsR9lHmaoTAF0dyR6Z4z8kEIu8WWY8P5faXiaual/5K8VdgEBZOZbYyEO
 rdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=alHFy3Z8krFswLX+5mkn5qeUgCLkxPQX/2Et61KNiv8=;
 b=0pRcK6x7x7oHcF81V8WG+N0WkyyizOU7GCclFGR2tyv5wqL5nxwm9x6SZEzf54K7hz
 Wn53EZfhHzfpo7L50mFpQoYCMcVlb2waDoa9smPVR1L2Uc+2rZ2MCvd6fuIwJut5KmRm
 /db7UZ8wr1eG/KMcGDJ1OyXImyf5pkMm2xJoRBqedZYpWU3+HUa+ZfHD52XZJiKXO5zq
 Y4YuQKsUsK/5a+wzHKQxE+8JwhFLiLgEfSJRVdOVOdq/6fLXJ9EvjVedG9BQz6L0tVdj
 vyvKuJ4YO0HzNM/r5AwUQxGuADFiV/mC2EVKwst3u5H/46VdtbTSlxML61EThw81ZY1P
 CTTw==
X-Gm-Message-State: AOAM533rif5OMFF5l5ZZ/LVTHjl2ED5+HO4Tu9sVLZC4WiNIy2bfmdej
 HKVkiWGc0rOK5RrNAakyM98=
X-Google-Smtp-Source: ABdhPJzduITsgfzqdVlY9VO2wH8Yhp+No+zgL+5cyUJaQ4UatNTm7i7AJsoEidDW+yNtkyQYUeAdUQ==
X-Received: by 2002:a1c:a512:: with SMTP id o18mr9607231wme.162.1633183449900; 
 Sat, 02 Oct 2021 07:04:09 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f22sm3499116wml.42.2021.10.02.07.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:04:09 -0700 (PDT)
Message-ID: <7c8f79d6-b4e5-3105-81f7-57636affc9b7@amsat.org>
Date: Sat, 2 Oct 2021 16:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 07/12] macfb: add qdev property to specify display type
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-8-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211002110007.30825-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 13:00, Mark Cave-Ayland wrote:
> Since the available resolutions and colour depths are determined by the attached
> display type, add a qdev property to allow the display type to be specified.
> 
> The main resolutions of interest are high resolution 1152x870 with 8-bit colour
> and SVGA resolution up to 800x600 with 32-bit colour so update the q800 machine
> to allow high resolution mode if specified and otherwise fall back to SVGA.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c         | 6 +++++-
>  hw/m68k/q800.c             | 5 +++++
>  include/hw/display/macfb.h | 1 +
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 5c95aa4a11..023d1f0cd1 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -316,7 +316,7 @@ static uint32_t macfb_sense_read(MacfbState *s)
>      MacFbSense *macfb_sense;
>      uint8_t sense;
>  

What about:

       assert(s->type < ARRAY_SIZE(macfb_sense_table));

> -    macfb_sense = &macfb_sense_table[MACFB_DISPLAY_VGA];
> +    macfb_sense = &macfb_sense_table[s->type];

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

