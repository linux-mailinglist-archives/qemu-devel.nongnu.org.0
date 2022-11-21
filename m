Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4942632946
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:22:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9YG-0006IP-I9; Mon, 21 Nov 2022 11:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9YE-0006FX-Jz
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:21:42 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9YA-0008KB-5Q
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:21:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n3so4074211wrp.5
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 08:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nsj0APwCh58w8IiMK8oOvN07dN8sMTD9RrNpb3q+lIE=;
 b=Fcv40FgCDKQRCNjLkt07Tb1lFUDrRCqvq4Sb98BdAbQwAPVbnSTXihhZcWuAoKOH+Z
 Xo8uEt7qZZejx60ypbCfuV5vuE+nX2WdPQDR33v1L/LayOSQzGPTj/BibCc5dyfU3Xrm
 U5SQxg3gUTq0C5ZnucoNN8YiFip+zTcGwSSKjYNOWlVHLfXulBFPJthfVhkQQ05D62yM
 LrIboc8CpXnPT3KhjpZxmU1BRQkKP3wvR6LHjTaLRcEJKvK0bYjetFwn6SPLC/WVdckg
 0KziWwRQumHSHypJ9q1XGEpiDMRGGfo/UjNl4jiumL4jwtnFqdfX30oqQtA27V27o23Z
 7jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nsj0APwCh58w8IiMK8oOvN07dN8sMTD9RrNpb3q+lIE=;
 b=1Of7avCfCmgV0UiwGKwmOEGAAugl/2eCRO/4riC2N4GP57U8P16C+LK1kXm9jeJqF9
 IA4NHmEX0Q0Hul2mqpwmdgV5D7ZdnDtVHZtc/YJUo80LEqbOu1FRhVKx6YHaZDkhINs9
 WlZ6cYTKVpIwpwBjFkWS0RL0B3dwUhRNXpFpFORakwXbIcvK3DCwgPi2N8zA/GYTAz6B
 Qqf1jL6fzcQHyCgqvUWcoR4F92iJb7og8BptG7RAw2fIxJZXZKYZkdwLBebbA79jJo7e
 W2obd0NXH8AaLFJOVAnybm729eorqVJezZCdd6zVwPGU8Vtyru8aAA+1KhA+UcaDRgpX
 4o8A==
X-Gm-Message-State: ANoB5pk+XsfZoCeGhPatLErok8lg9aA9BkElrk8ejA1T61cotVkyAQXq
 wBue2Nz35BLoa0N/mFoZ2vGWXXGJISpeOg==
X-Google-Smtp-Source: AA0mqf7YCa/p35oImHPbjPqMQdF3+7QSNJkGJtVkOlyhk29JOpLKpXJJZk2dsugWG0WmxGTLcuF73w==
X-Received: by 2002:a5d:6dc8:0:b0:236:53d3:5a48 with SMTP id
 d8-20020a5d6dc8000000b0023653d35a48mr11671853wrz.66.1669047696408; 
 Mon, 21 Nov 2022 08:21:36 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a05600c1d1800b003cf878c4468sm21026072wms.5.2022.11.21.08.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 08:21:35 -0800 (PST)
Message-ID: <3a492b25-d5a4-b51e-6033-e6d272177da6@linaro.org>
Date: Mon, 21 Nov 2022 17:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 21/29] tcg/i386: Introduce tcg_out_mov2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/11/22 10:47, Richard Henderson wrote:
> Create a helper for data movement minding register overlap.
> Use the more general xchg instruction, which consumes one
> extra byte, but simplifies the more general function.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


