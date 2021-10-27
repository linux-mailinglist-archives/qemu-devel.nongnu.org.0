Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C047C43CE73
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:14:10 +0200 (CEST)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflZ3-0003Ti-T1
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfl8Y-0000Jq-JV
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:46:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfl8W-0004TJ-2c
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:46:46 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j2-20020a1c2302000000b0032ca9b0a057so2711350wmj.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2LFtbGHQlxfoXOIoRtCICZ08Aw/JyxpmBBElxcYfBAY=;
 b=ES77htAYptHV4XSxvMD6m80Bxlgp3kLQzHUKaCAyOEj0gNs8nI+nKDNoXWyXwhNuer
 5p5hweN6Y32YOxDBfY/MFJqslxMPdQ8hr25YTLCF4h4hE5UHlOMH+DYnIGYXkO0JuoYx
 WsU6actHouMe5HGTPZJ+4s5anqp0IS6cQ+rSvcURal8veZUg7cgg+wbZYpFIsyaYIuc6
 HJNZnQY6aIfPFljpZwxQu0WsZuq2+dYcLaGBkLmdRNe0nadfn9eQSxcpNLeihU2J3sjh
 u+l2UA+QGDYj9y2BoZ0eWABNYWOJ85gUC6xmruq5I5aRqOKSe6c7QbVKqiLB6KuIL1kZ
 3SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2LFtbGHQlxfoXOIoRtCICZ08Aw/JyxpmBBElxcYfBAY=;
 b=HP1Ae/98Mr+vuQ+fkEHIP2jHRqY7Ixx903jgDdhbJThqrK3n+AjSQ2GFpki8BQ7qe7
 qrBXGmjoMJq9WS5jdeai+b4iS2vAUdwgTC/zR8hT1DkGGYxcKsZm1HWSRKRK0GH++uNX
 c9DbuKiOsLUHK3X2A1c/FTIH4NuKgpCcMHWuRwm77FvOHI+ZKl7q+J1bGWY17ekvKCFI
 Ws+LZG28cBso6DaLqQpE9mO7O5dpAdhQChiaVwyjJDLEIpgzY69MaHH/3vd03PlFZqN6
 eFMxRYIaWKXshIEcE3U9gcSxHeDDwZ8zMbLllBdaWgUP8QXy521GrkW0+dLG9sDwey1v
 Wquw==
X-Gm-Message-State: AOAM5325jGfVOoHf9c1gv93w3j/v9sn9HD/tgHUvl1E3eN4cy/y3/60F
 Gy2GIpk0uj+N8MIzGvtII6A=
X-Google-Smtp-Source: ABdhPJwNiCdWu3Dq0RJJfVORbG9HWRJLLQ5YBKQ3Lw6Tu7b5DjFX6/I1t+wAoBSqLjc6BbBEG8dVuA==
X-Received: by 2002:a7b:c8d0:: with SMTP id f16mr6431402wml.193.1635349602168; 
 Wed, 27 Oct 2021 08:46:42 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v191sm130734wme.36.2021.10.27.08.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:46:41 -0700 (PDT)
Message-ID: <b2078399-d80a-96ac-5dee-007ea1b70a68@amsat.org>
Date: Wed, 27 Oct 2021 17:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 08/11] hw/intc/sh_intc: Use existing macro instead of
 local one
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <d1a2e6c3e1e9bc7eb69b9ae2cc1c708db6b9b3e3.1635342377.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <d1a2e6c3e1e9bc7eb69b9ae2cc1c708db6b9b3e3.1635342377.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 15:46, BALATON Zoltan wrote:
> The INTC_A7 local macro does the same as the A7ADDR from
> include/sh/sh.h so use the latter and drop the local macro definiion.

Typo "definition".

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/intc/sh_intc.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
> index c1058d97c0..0bd27aaf4f 100644
> --- a/hw/intc/sh_intc.c
> +++ b/hw/intc/sh_intc.c
> @@ -16,8 +16,6 @@
>  #include "hw/sh4/sh.h"
>  #include "trace.h"
>  
> -#define INTC_A7(x) ((x) & 0x1fffffff)
> -
>  void sh_intc_toggle_source(struct intc_source *source,
>                             int enable_adj, int assert_adj)
>  {
> @@ -112,12 +110,12 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
>  static unsigned int sh_intc_mode(unsigned long address,
>                                   unsigned long set_reg, unsigned long clr_reg)
>  {
> -    if ((address != INTC_A7(set_reg)) &&
> -        (address != INTC_A7(clr_reg)))
> +    if ((address != A7ADDR(set_reg)) &&
> +        (address != A7ADDR(clr_reg)))
>          return INTC_MODE_NONE;
>  
>      if (set_reg && clr_reg) {
> -        if (address == INTC_A7(set_reg)) {
> +        if (address == A7ADDR(set_reg)) {
>              return INTC_MODE_DUAL_SET;
>          } else {
>              return INTC_MODE_DUAL_CLR;
> @@ -297,11 +295,11 @@ static unsigned int sh_intc_register(MemoryRegion *sysmem,
>  
>  #define SH_INTC_IOMEM_FORMAT "interrupt-controller-%s-%s-%s"
>      snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "p4");
> -    memory_region_init_alias(iomem_p4, NULL, name, iomem, INTC_A7(address), 4);
> +    memory_region_init_alias(iomem_p4, NULL, name, iomem, A7ADDR(address), 4);
>      memory_region_add_subregion(sysmem, P4ADDR(address), iomem_p4);
>  
>      snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "a7");
> -    memory_region_init_alias(iomem_a7, NULL, name, iomem, INTC_A7(address), 4);
> +    memory_region_init_alias(iomem_a7, NULL, name, iomem, A7ADDR(address), 4);

I wonder why the address is masked out... It looks there is a mismatch
in the memory region mapping. Anyway this predates this cleanup, so:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

