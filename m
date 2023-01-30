Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A092D681FC0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:36:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdh8-0004dR-Bw; Mon, 30 Jan 2023 18:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdh6-0004d4-3u
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:36:12 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdh4-0000tt-7B
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:36:11 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t18so12739069wro.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lR8SZO3r87nRNy1oGQpP4jmFPB/yZ73DqQAofYDZu5A=;
 b=o5TeF9zxHPlPzE1RL1f/Xsw5d5R9HhWbyTVW3douCUhndxabS4yr5EIiEaA5rYOBTu
 YbFAzB+nmTlOY0xRB5NperBT3MQWqrC5xCaWFuTc6kpOX2at/y0CEIyI+gWsdQQE8QCf
 Tg9MZj7cjUdGYi3NoK48ZeM8bNb5MplpX6PwcxsXNJeEf9r2VC4B3hruworcMDlfTVGp
 daKvqHutVhksc8tq22Xz8HealOcMDqE5eR/kShzIN8KW7PxNaF7cWPfUev/EJX6711HM
 7zNx0j0O2tzome125NnLr1nQ4B4h1PdzY/Yz6d66v5BZrS/3rz1UyrJGUWSLkDtcgJmI
 657g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lR8SZO3r87nRNy1oGQpP4jmFPB/yZ73DqQAofYDZu5A=;
 b=AxWXYdfmBMxhGAorK+WsD6EDA4rFV2ekwJfR6eMpkwo104nyamW5H4bV4dAdvlU23d
 mYKIgvrX5ENEwEvxQ0r3UR79IWT+uELQ89+2CdQ30g99c7lhCwroZCSHAUlaXweo/Rqy
 hf9rtNZtQgFNZuZ7YxV8h6at4eWEpcfeSzBV71ISXxQ8BwAJzfGyrI8653fb9Vdtm7MB
 zSiUCS8O8bW381mm9za34j3oV2GKnVpf7mPx+UobwYfok/tK8YhwiT/V6O2kyhhxynRI
 YFVRnk4lUPGUcO1O+4ynLNh8y4yTJHsHBwTQYRjcgxyVoas6sznqGkcgPpckM7zTlIv7
 OF8A==
X-Gm-Message-State: AO0yUKUXuAIauc04Qz8hbf3bRy0QrOF5baBfihv+zmEytvIwmzZt+DEj
 m51yFECknL/zU10RAmVmeFgcPQ==
X-Google-Smtp-Source: AK7set+WpFDsEFM4kt5qjUPMtJ1ydwPLukFAHObLluEgBkBE3yE8d+VnHwji1vEojZAdojo28NM1gQ==
X-Received: by 2002:a5d:6d02:0:b0:2bf:e7c0:294f with SMTP id
 e2-20020a5d6d02000000b002bfe7c0294fmr8605065wrq.31.1675121768328; 
 Mon, 30 Jan 2023 15:36:08 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a056000128900b002bf95500254sm2251821wrx.64.2023.01.30.15.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:36:07 -0800 (PST)
Message-ID: <6b5afef0-4683-830a-a370-ef1dd2b7e9fc@linaro.org>
Date: Tue, 31 Jan 2023 00:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 07/27] tcg: Remove TEMP_NORMAL
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> TEMP_NORMAL is a subset of TEMP_EBB.  Promote single basic
> block temps to single extended basic block.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h |  2 --
>   tcg/tcg.c         | 19 +++----------------
>   2 files changed, 3 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


