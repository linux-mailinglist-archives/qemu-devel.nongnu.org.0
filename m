Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCA743CEB2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:25:01 +0200 (CEST)
Received: from localhost ([::1]:58850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfljY-0005pA-63
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfl4m-0002Xe-Uk
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:42:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfl4k-0003sG-ND
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:42:52 -0400
Received: by mail-wm1-x32f.google.com with SMTP id 192so1492476wme.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bdso/lsEeW7B4M85/U3Mw8B4/Aqyj6cwf7BTxkhn0/c=;
 b=bWuPu+z0pP6ZmC9Y//bln8JslLtwPzSDpw9OLMUDVMDgwNsIbrcCeZ6X9lxh5E9Msh
 UMk66F3P/gHxlj5AJuryYPLTJiykGlC+gfV22OXTJMLNiU7QQx+wwZ30HiMkBdofzufs
 YUhbEq6DD8dSzWLwj6oT00cmM9TLIdiH9mHeXnuhrbFbUsUqzI/13wE7kZmVqpL2ItIY
 g6YDZr2z18BbFJvht4JIG/Yh/K9sCxjB+Lh4MVmsif4Ay5NZYSmdobQZJBW+nLVFK89m
 lf8pFotgBrVJRp9lrDtlX8RD2P/LZh4AXFngI7l6URdas32489TbDxePn6EIwN6NAlcg
 Qmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bdso/lsEeW7B4M85/U3Mw8B4/Aqyj6cwf7BTxkhn0/c=;
 b=0Qbc/Exj6xLfDZ2hFM2tSI18iPAtDK46OZuvWVqIN9k1vECpuMdqmDXuBUnXla+hrP
 BdyEbX3zVz4BBKWHzYQIFcLeKyr+kY1qlU1apKjZYNC2LYCnIxyQ9YxPYTms/F8Gt5YF
 Nx+LvYvF/XJ7hCTMTiWRwjTkZxiByvdMtL/jsa2Mzq9Tn0X3Za/XTyQzOjMmvrkRw+F8
 elDoNvS4uoFlaIPBcFsiW/R5DJ1/F3S6VxmSDLvuoT/DukMkyFooVdHxXLljakhkTLFC
 CjMDvFax0ESlnMIVXQLqUH5GEob+UNxHDQ/FTAqzuxJ/8rOCf9ynmDklLi807f9+3cil
 GVSA==
X-Gm-Message-State: AOAM532ciXtfRzAfvXcxWtOygXrrG3sBb+2hNfRbpu7HZb3622M9QaDr
 LHxKGyPkRNrU8pSTGpCfp80=
X-Google-Smtp-Source: ABdhPJwiDJdXFqO5KnqqH5c0PdLheLro7b1i0p4om5drIJBPVhL/TdT2zBaAySgDibtXIVc4EgjaiA==
X-Received: by 2002:a05:600c:2104:: with SMTP id
 u4mr186745wml.23.1635349369438; 
 Wed, 27 Oct 2021 08:42:49 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c17sm147059wmk.23.2021.10.27.08.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:42:48 -0700 (PDT)
Message-ID: <0e3fdeaa-9580-ed81-ee17-63ec0c19a062@amsat.org>
Date: Wed, 27 Oct 2021 17:42:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 01/11] hw/sh4: Fix a typo in a comment
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <f03f38eb6b70b8586f33868b0ba4839f3b214fc9.1635342377.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <f03f38eb6b70b8586f33868b0ba4839f3b214fc9.1635342377.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/timer/sh_timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
> index 02eb865908..0a18ac8276 100644
> --- a/hw/timer/sh_timer.c
> +++ b/hw/timer/sh_timer.c
> @@ -107,7 +107,7 @@ static void sh_timer_write(void *opaque, hwaddr offset,
>          if (s->enabled) {
>              /*
>               * Pause the timer if it is running. This may cause some inaccuracy
> -             * dure to rounding, but avoids a whole lot of other messyness
> +             * due to rounding, but avoids a whole lot of other messyness

Also "messiness", otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>               */
>              ptimer_stop(s->timer);
>          }
> 


