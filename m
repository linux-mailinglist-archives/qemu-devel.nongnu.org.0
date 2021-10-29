Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADF144057C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 00:28:57 +0200 (CEST)
Received: from localhost ([::1]:37926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgaMq-0003Bb-14
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 18:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgaKh-0002Rh-7h
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:26:43 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgaKc-0002eS-2S
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:26:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id o14so18858485wra.12
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 15:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gq5Dsjok9FBvqRSkZc6WRfDoruFkuRKPNTM+kVuiATY=;
 b=CGkEfdD8RPBpyTT4n5JCX5W7X9LMYwRl2byOghCSSHwmLbMZmNWR2/j0q5D/4je9PP
 cXgabWqzz8c13f8wr3c5Wc+gmBgm/7BlWnWdlkokSLRZTWuhbd+9F1ZHmbWnhp3OKv2h
 mf0Zeyuel1wxqwAEEXvqsGr5YftY4Wc+ZQR99RPuNXCBupJy5O6NVXj/N3LfJ0Bebzki
 +H11jZ+2n1zku8BGUKKLgmEQqihWYxj1/8vkFuuIEMooBvXC178kKoWgZQX4N7Y9dni3
 SlvS1WJmt/RrCIPACaT5crC0XPfbQ6O1uPAJqc15I4UbyNlQComdH4gS45Rt4iJIaA63
 oYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gq5Dsjok9FBvqRSkZc6WRfDoruFkuRKPNTM+kVuiATY=;
 b=bxuj4HwJgIUkauW6/Hdu6jsi72A+zOyYpPoplJWMhnki7/8JRsdOhMcgxqc76x73Ah
 Nk18x0EFBVXZBaYSvl8X8gmiKmAUGHrx7VKrBMuJx91EPrwk+5+JDyyMwN/eLmOWu41R
 a8cC5E01faTtcz81N+ObpmY/3N2PToTrdd8hPiUp8CmkL0mU21RZLCTXTVBd9YOpFDQp
 3Ra8HHJDaohrdNZ9089p1Lrw5QS3SV5P5SBQw3ZyMizmWRS/BXU2id6liF5jAiI33AI2
 9dgSgxfCUJLr4Rny8WrAGgFLdz5WHS+WjUCFdMKkAi1HRKCkEvIfG9Q6BYgQkTCdJuwv
 MISw==
X-Gm-Message-State: AOAM530K3UvfMBinwpap7SzoIt+MCbXh6Yqp83lsx5ChmmgMHHDTthiN
 efzSlhMHMenMFGy8ajwOEXU=
X-Google-Smtp-Source: ABdhPJyu4+tsb/bo/1QeWRU3PHdAjOcAORwi1TfZUg5MRV+X/Sqm0++y+rNjZ7w3DTkMC72Fe5vhfA==
X-Received: by 2002:adf:e709:: with SMTP id c9mr18121456wrm.78.1635546395537; 
 Fri, 29 Oct 2021 15:26:35 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b7sm8000591wrv.72.2021.10.29.15.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 15:26:34 -0700 (PDT)
Message-ID: <abe8c599-11b7-ea53-a22c-44846d6ffa2a@amsat.org>
Date: Sat, 30 Oct 2021 00:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 29/30] hw/timer/sh_timer: Fix timer memory region size
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <82ca7d39f47685f35f735e40ab1dfa8fa1b86b9b.1635541329.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <82ca7d39f47685f35f735e40ab1dfa8fa1b86b9b.1635541329.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 10/29/21 23:02, BALATON Zoltan wrote:
> The timer memory region is only accessed via aliases that are 0x1000
> bytes long, no need to have the timer region larger than that.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/timer/sh_timer.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
> index 250ad41b48..a6445092e4 100644
> --- a/hw/timer/sh_timer.c
> +++ b/hw/timer/sh_timer.c
> @@ -350,8 +350,7 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr base, int feat, uint32_t freq,
>                                      ch2_irq0); /* ch2_irq1 not supported */
>      }
>  
> -    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s,
> -                          "timer", 0x100000000ULL);
> +    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s, "timer", 0x1000);

Per the manual (R01UH0457EJ0401 Rev. 4.01 [*]) Page 317/1128, Table
12.2 "TMU Registers" the first 3 timers (implemented by the tmu012_state
structure) fit in a region of 0x30 bytes.

Looking at hw/timer/sh_timer.c I only see a maximum access of 0x40,
where 0x1000 comes from? The P4/A7 aliases?

If you have a way to test and ack, I can replace by 0x40 when applying.

[*]
https://www.renesas.com/us/en/document/mah/sh7751-group-sh7751r-group-users-manual-hardware?language=en&r=1055171

