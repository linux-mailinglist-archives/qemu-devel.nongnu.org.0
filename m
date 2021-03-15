Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0248933AF07
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:45:27 +0100 (CET)
Received: from localhost ([::1]:36546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjmw-0003Ar-2m
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLjki-0002Vv-GG; Mon, 15 Mar 2021 05:43:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLjkh-0007TS-1a; Mon, 15 Mar 2021 05:43:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id g20so7706671wmk.3;
 Mon, 15 Mar 2021 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rwQ4dQZ+buiXd7NYgH4hrsjQB7KlouHJfeE4xlks0h0=;
 b=fXDuKPLOAFVntXsLxCfR+o1HQSVotVT1qNEf2thkPrPN47vmsugqbhtwYx47a1S1dM
 XDt+vP5k2UgFmOXkd0fC/KJsOJUOIfeP8EyvueTjnphgp5FRJX4MqhC7b9wYDUpbHeXm
 u4qfBfmKR2SlAjvZoY8QnHVbo9AYsxvhud4dmAKiqgRzJWzGhsvZAfO45Zx/pqjhDiec
 6T0Jm+rHsZjlvZvbvuUSiNgao2bCfJd7toqT0XbNlIrNi9cehWrrcrjq23xQlK8+Si5Z
 9EJEEXYr3I/R0ZmlYxb9Zs8rjbFoXYs6BxEtTL7X7ST8s87CXuqk/FmJPOPaMr2QDmYS
 Gz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rwQ4dQZ+buiXd7NYgH4hrsjQB7KlouHJfeE4xlks0h0=;
 b=CHQgBhuRN4347zdH1NDqf+9ygdXAk1m7pW3feO/0Po02UPSz25kCE5L1IOoAj9R84z
 F5EIEjYFOZMpVVUgXWQTQEPfp0ObadUr1dMzMR2HGlsEU1fX4ys8wuz93CntRO4PnW7h
 2X1a0JxUOe94TgRi6HfxlrhxynWA9HWd2LtnmdMpF5sZxqLXJ6BJ2NzfaXUonEnedZ5R
 XkPhgkzRnc6Kh0nMAqMVr2gNvnyUC0VIk07qj6Kv6+0XFo7C2IFHnkhf9RULRQx0H6Jr
 Hb/ixwVpO10i2wDeU4MFlJ1+kvLJ9FXamaFCB+NyUbvcVRI0Tjf0ewB0BYwPJFeQUqcb
 FWIQ==
X-Gm-Message-State: AOAM531FhjD49NoEfaTvPoAHA4OEqiIRsu4gfiqv42XLSHxJlzjRLAv0
 Ej3QXkc8pLhs9DKzoEEqURk=
X-Google-Smtp-Source: ABdhPJxPX3wyiw6xuIOsDXXEH0WXQniqJhb2/xoFNH1KfAnEdPD/pc9NwnDXjuSUb/Ufg0YKuf9MqQ==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr9049191wmi.153.1615801385211; 
 Mon, 15 Mar 2021 02:43:05 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i17sm17754655wrp.77.2021.03.15.02.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:43:04 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (target/hexagon) remove unnecessary semicolons
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <1615784100-26459-1-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b68140b5-d2bc-8019-6ded-d7b2abe02926@amsat.org>
Date: Mon, 15 Mar 2021 10:43:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1615784100-26459-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 5:55 AM, Taylor Simpson wrote:
> Address feedback from Richard Henderson <<richard.henderson@linaro.org>
> 

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/gen_tcg.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
> index e044dea..a30048e 100644
> --- a/target/hexagon/gen_tcg.h
> +++ b/target/hexagon/gen_tcg.h
> @@ -83,9 +83,9 @@
>  #define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
>  #define fGEN_TCG_L2_loadrub_pi(SHORTCODE)      SHORTCODE
>  #define fGEN_TCG_L2_loadrb_pr(SHORTCODE)       SHORTCODE
> -#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE;
> +#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE
>  #define fGEN_TCG_L2_loadruh_pr(SHORTCODE)      SHORTCODE
> -#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE;
> +#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE
>  #define fGEN_TCG_L2_loadrh_pr(SHORTCODE)       SHORTCODE
>  #define fGEN_TCG_L2_loadrh_pi(SHORTCODE)       SHORTCODE
>  #define fGEN_TCG_L2_loadri_pr(SHORTCODE)       SHORTCODE
> 


