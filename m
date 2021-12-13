Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F78472CCB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:06:47 +0100 (CET)
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwl2U-0002iV-2M
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:06:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwkwQ-00072L-AI; Mon, 13 Dec 2021 08:00:31 -0500
Received: from [2a00:1450:4864:20::330] (port=39501
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwkwO-0002J5-Cs; Mon, 13 Dec 2021 08:00:29 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso13932215wmr.4; 
 Mon, 13 Dec 2021 05:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QRsEWIMBpAFPuvFlO4/xubTig9kMptMut+zvRDO+d3g=;
 b=dPsHmAuD9DRC6sTK8PkkPu4C+mqEn3bioQOFxFhj67TqvWnVCmKLQ6/Cv6NKozAgYB
 5XQcOrsBuVuIw3dXbzvQlnsmC4pc3j3KKZJdNnR9j1PpUPR9l0g4pxaBZdUkraSf8P7e
 WQwQ4ScpyD9GSXvukUCkbpaZM+fp92X/SvEvOLZM9TeCsJyJQClfx6s2mGUaX86M0KTY
 iTvDQJmDubUSX62AIkF4tzs+feqnnAu6J/YyBwgw8aLoJdEEzODoZJ8GMUj5ARmezro7
 Y1ZYoVbFq7IicLPHo3NG4bEsMgFiNjOeAaFbWYr8o4ZGboKtmKXIVMIcP6nHJgnx9liB
 4JxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QRsEWIMBpAFPuvFlO4/xubTig9kMptMut+zvRDO+d3g=;
 b=ESSOZkVWlYndNl6YnuWf3O5X6weZ9th2n36GjdnWkpnCPnm2t9B7ofXuOl/akC8qUI
 a5hUJsP9dKt0YUueCOXD6d8TjNnV/NAZDYUOjGQT2DxiceWa3ILdxG/cvdJePZgyOV3c
 +KodtZwYnFK+/pG8CudV78WqfFmW3vVk0EKB5TVSOeTrsoXu6L0BDG/X33xWAbAj1PBm
 m3EMb5SOdR1/fJDpqWIpaKssjyX5EV5O+/lqcFFOOQgoAL5lnYWCywQQrzWxSnEHBThm
 g986K1wUZqMlXKcuGNwykJVlefQE/V4uS/fyLgG6rXXAN42N473uwsI7X00HZ3lAjncb
 TCgw==
X-Gm-Message-State: AOAM532hBa31MmtpwbRCa4QYD9His7Hz/wb1oELcJJnGUl37ZNcZuqpY
 te5fAt2DKfip1BjCEgiQTIo=
X-Google-Smtp-Source: ABdhPJw1R887o8jn1uzVwq3ZfC5H410sDmC2uN42POTO3T6EJw0ql2BRrBxOVpiKDBPR88DoAtSLsQ==
X-Received: by 2002:a1c:8015:: with SMTP id b21mr36851410wmd.161.1639400425028; 
 Mon, 13 Dec 2021 05:00:25 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id p5sm11630787wrd.13.2021.12.13.05.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 05:00:24 -0800 (PST)
Message-ID: <1e18eba2-258d-4b4f-3ab4-99180c2a1659@amsat.org>
Date: Mon, 13 Dec 2021 14:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 16/26] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-17-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 20:11, Peter Maydell wrote:
> In process_its_cmd() and process_mapti() we must check the
> event ID against a limit defined by the size field in the DTE,
> which specifies the number of ID bits minus one. Convert
> this code to our num_foo convention, fixing the off-by-one error.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

> @@ -299,10 +299,10 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
>                        dte_valid ? "valid" : "invalid",
>                        ite_valid ? "valid" : "invalid",
>                        cte_valid ? "valid" : "invalid");
> -    } else if (eventid > max_eventid) {
> +    } else if (eventid >= num_eventids) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: invalid command attributes: eventid %d > %d\n",

">=" in format.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> -                      __func__, eventid, max_eventid);
> +                      __func__, eventid, num_eventids);

