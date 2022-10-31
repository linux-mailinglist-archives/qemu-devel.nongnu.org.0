Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140BD613197
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQ1A-0005UK-8J; Mon, 31 Oct 2022 04:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ0j-0005KG-2j
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:19:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ0h-0007uC-E4
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:19:08 -0400
Received: by mail-wm1-x334.google.com with SMTP id t4so6676339wmj.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QhckKR35tUPeXDRiQIvwocDG2KhyuEnYKSoV/8pmSt0=;
 b=I3Y0vf0hVEFNvEBUqznk81qj8L6yrn5pdOMYyWMWYbP5QbJ/SbyiQSJ9IGkMYHc4y7
 aIwwr6U6MvBpeGLtPCuFXdzbDn+2GfS3/yoUsyQl2K4eiMyPZgUZykwNgpiCfQMGggDf
 tDi9yfcjOP4PrhF93pJv8eUrSn5nW38XAaabVZRV0QjRu70VAMT736H4BHGXqmPKuvur
 fyoeeu01AYofLMGvm1rKH4ZNQoQkP+e++WijFqPYdmHke2DGoITW2EAi75JRf4rT5WHy
 LJ54AyZjLKroxpUVJOFbGNwmGVwZqj5WaPctLGeXSrguMyKNPsuy+8CJxu3vG7bg0No9
 6jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QhckKR35tUPeXDRiQIvwocDG2KhyuEnYKSoV/8pmSt0=;
 b=KGHAFqrC1iI9yW5YyOCIUgxP9e3PSrCNqkE4/TEGcu+XqxK2vVOHzXW17jdIw1M0Qn
 5w5HQNtAvDtowAYnTwnVqzJP417RWfWrKu88GoqFeWUqGmKmR+OfRf+mCZ0WSNaGFZ/8
 bRMhdn4OM+n7PgFKhhCuYvtwmEBytLjBGEYnICcr5Pw93NQHZR06BINZElGaZZ2iWwVD
 qMKpOepTNJgNTgd75FN7dCyqoVDLF9Dlyo/5BuZL1qwAZgPtHt9ZyGteK4aupVUZ+6eM
 ErQoqaqqkcCH5rZ4SVIOGBgNhG0X7ZPe9TDA3kFuLQmKM407rgNE8sOsZZgf5PwXF49u
 4A7w==
X-Gm-Message-State: ACrzQf2q1mTURcJFwfGSzOo3qkYwkolnkGCF0jGRSyOmTFeRXfnD2+cZ
 ahrBjrfWwgK33iZH3dpzaHqthw==
X-Google-Smtp-Source: AMsMyM7LIQ0cZBxAo8doS6Ce18EwfGwnvUODdOE3EOmzcAzJAZqdSz7iQFMC0NCyfzPX9gfeo9Uliw==
X-Received: by 2002:a05:600c:15c9:b0:3cf:6054:3b3b with SMTP id
 v9-20020a05600c15c900b003cf60543b3bmr9555575wmf.167.1667204344426; 
 Mon, 31 Oct 2022 01:19:04 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a5d620a000000b0023657e1b97esm6396354wru.11.2022.10.31.01.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:19:03 -0700 (PDT)
Message-ID: <7f03ab9a-5f00-684a-f644-dc16b1cca7cf@linaro.org>
Date: Mon, 31 Oct 2022 09:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH qemu.git 04/11] hw/timer/imx_epit: remove explicit fields
 cnt and freq
Content-Language: en-US
To: ~axelheider <axelheider@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <166718254546.5893.5075929684621857903-4@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166718254546.5893.5075929684621857903-4@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/22 12:33, ~axelheider wrote:
> From: Axel Heider <axel.heider@hensoldt.net>
> 
> The CNT register is a read-only register. There is no need to
> store it's value, it can be calculated on demand.
> The calculated frequency is needed temporarily only.
> 
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>   hw/timer/imx_epit.c         | 42 +++++++++++++++----------------------
>   include/hw/timer/imx_epit.h |  2 --
>   2 files changed, 17 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index a79f58c963..37b04a1b53 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -77,23 +77,25 @@ static void imx_epit_update_int(IMXEPITState *s)
>    * Must be called from within a ptimer_transaction_begin/commit block
>    * for both s->timer_cmp and s->timer_reload.
>    */
> -static void imx_epit_set_freq(IMXEPITState *s)
> +static uint32_t imx_epit_set_freq(IMXEPITState *s)

Maybe rename as imx_epit_get_freq() or simply imx_epit_freq(),
otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


