Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1316323530
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 02:24:49 +0100 (CET)
Received: from localhost ([::1]:42776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEiv2-0005FS-RU
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 20:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEisd-0004D4-Kw
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:22:19 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEisb-0000tQ-PA
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:22:19 -0500
Received: by mail-pl1-x636.google.com with SMTP id p5so158472plo.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 17:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sE6S3ogPLjBjsbA08Mdqvf0dfIcL2CUcVL3uF05oJNM=;
 b=pL5LBzut1ayhqPWxaSmbooguUaVo2sloKMRI7XHhtxWuisZNy2UzvuMbul8m/xkvxY
 M0Hqa7k4IS5/AaW0FjN8FLni3IWvp4I/O3RS09OXNA6qLVd/H0eHZc/eSM5Iff24PIG7
 sueNkZQBBuwqxuG5Badcwm9dv27sJ2BohcmJggpmppTqXc9Gxqy7UVz2CvGHi0GIf2dL
 iDtznKvvaBjQ1W5gZJTT8ohlPPgH06X5mhajQECxmsBYHsmw+EjEX5PtaxtuQ2/Vx7Ly
 HkvVbdha8Cab/zYAJWGOMiaxIjm3Gpovpj9vW7Qz+wvjhTOwpIkQzlFg2lCB8CAWHHDE
 JWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sE6S3ogPLjBjsbA08Mdqvf0dfIcL2CUcVL3uF05oJNM=;
 b=M4YdHMk+yNtOT6Nbsgfmt0KuTanxftPvBBOb8HM57ONsGGyl9PGO4n7x/+jYYtTQxF
 a0fDMAtH3qTBpOQJsEfnyZbXn1eoFHTNxaHQeH0p66ZYb+IEu0zSIqI7TKlWL24yXz4u
 p/KUDpKsFyk8mFcojiJ3w86JvF2Ykn9vNt8PqkJx+lCipMnKu9uU5pJqKMPwdt/ImCJO
 tmPu5DHkTXR0lqpCGnjfMlKn+O85+l8rQOSzGDQr9Kt04+rSi7U6kSOy/C+xNIb5fjAh
 iRPrVd6nlhlG4PYv1ymmskipMZSUcHW7IS+SzqGl3qNKTJUmKu5a5ku5oroLjl8GdH/b
 7Piw==
X-Gm-Message-State: AOAM531sEdTZE63bsZ9YcGmXvLng7BqDT/OAXQRz9buMPNmMfrrb/f3G
 SqHU8ZlXghVdpGXcwqWdLruX3g==
X-Google-Smtp-Source: ABdhPJxy1R8L/rXOkicboqBWFfIRh0iKV4sc+mpO6yv8E70LhSasqNPyLc+y8YS7aEyq3/TjZd9JhQ==
X-Received: by 2002:a17:902:f20c:b029:e3:cfa7:e2ff with SMTP id
 m12-20020a170902f20cb02900e3cfa7e2ffmr20982914plc.78.1614129736271; 
 Tue, 23 Feb 2021 17:22:16 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id h6sm385204pfv.84.2021.02.23.17.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 17:22:15 -0800 (PST)
Subject: Re: [PATCH v3 03/10] target/mips: Remove unused CPUMIPSState* from
 MXU functions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210222223901.2792336-1-f4bug@amsat.org>
 <20210222223901.2792336-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e094639-21f3-0c5a-5d44-8635d5de5bc1@linaro.org>
Date: Tue, 23 Feb 2021 17:22:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222223901.2792336-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 2:38 PM, Philippe Mathieu-Daudé wrote:
> None of these MXU functions use their CPUMIPSState* env argument,
> remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

