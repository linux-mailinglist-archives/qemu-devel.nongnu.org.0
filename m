Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC56B4385EC
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 01:25:15 +0200 (CEST)
Received: from localhost ([::1]:45640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meQO2-0008Nu-Vc
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 19:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meQN4-0007j6-2d
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 19:24:14 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:47037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meQN2-0004Lm-NT
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 19:24:13 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so5586969pjb.5
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 16:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fJ2yA1WmNyqCDP/fg8JKHXdoD9/Kq/Op/SgEuLuW0DM=;
 b=KLUogVVOJpN5B2qdZrqv2RCoyXUT0aDcvG8ekeJDIrth8PfDrYxutscb7WXDFMRh/1
 U8gVbyrq3r3OI1KJeBgxRwT6QCT7XD/3tp3h5DBuGWinYTpCNL5NXmIkh1k5gHYAJJjw
 9vPSmeGigwO6y4vZZxbH237WsJfMbPtF4+IvPy3Gv77GyNw90IB/FUvywpenMK+g8NER
 oPU4j4Ctk7D7GARGxVetA7r9yrcxR75ppSu8qXd+y0GWo8qM/egR5w4dBaKdQih3vpBH
 oSPZV34sJfzHm8MXESB6F/7hnA3P0mGS5qMiiIHHkRz5hFavX1/lMRYeIQkr72cZsjKg
 Noag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fJ2yA1WmNyqCDP/fg8JKHXdoD9/Kq/Op/SgEuLuW0DM=;
 b=ewv4+qD4WkEe7plJVONeUViJFdrjk+1oGTpfkM1y/hnlLgFoeULgRjeGmBSq0ylaIL
 7uP5PLKT1Iv5esJPvg2KIaq5vYklzY42nKgw2S2TvMn7WKqTAnNKashkASplOvmuOQ/v
 ESctboJVklsV0RstpYGdQsuAjVGdQrXafLTcqe84QNhF2hNfhOOQeH8/YwQQvGf6GdM0
 e80jAUDZiRe7B3FjXpYdZqmmy99634dS5FKj4MN6uYUn5gfxD5HxNOdFIWq3otYI6GHt
 GhInHLxKY1a28fgYCoF4Z3yp4joOmuz02VfQUSbVw0RQh6ol/VKlOtsSUZpN5j2EHc4/
 ZK9Q==
X-Gm-Message-State: AOAM533Nsrgu4AgAucWUwEXz8MFjSFT0J5IQS4xZSyCupBFk+BH4VkJN
 J9S6ZaiV5GgL9kpdEc3QJ/SZcg==
X-Google-Smtp-Source: ABdhPJzZGAPhabG0Xx4wmRSQVUL60XBV4pvmjqHvJcF/5WaBJrHyfC8Z8Q9JfSLmKRxKzN1ea66Vww==
X-Received: by 2002:a17:90b:1112:: with SMTP id
 gi18mr9723561pjb.136.1635031451211; 
 Sat, 23 Oct 2021 16:24:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m186sm14234311pfb.165.2021.10.23.16.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 16:24:10 -0700 (PDT)
Subject: Re: [PATCH 01/33] tests/tcg: Fix some targets default cross compiler
 path
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c553224-9a80-0b7e-b494-359577d84a2d@linaro.org>
Date: Sat, 23 Oct 2021 16:24:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> We do not want a shell command substitution, but a parameter
> substitution (with assignment). Replace $() -> ${}, otherwise
> the expanded command return an empty string and the $cross_cc
> variable is not set.
> 
> Fixes: 634ef789f8e ("tests/tcg: add more default compilers to configure.sh")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   tests/tcg/configure.sh | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

