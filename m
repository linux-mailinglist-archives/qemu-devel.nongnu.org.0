Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68236A9462
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:46:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1zF-0005Ul-8h; Fri, 03 Mar 2023 04:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1zC-0005TG-Ku
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:45:58 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1zA-00074S-UI
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:45:58 -0500
Received: by mail-wm1-x332.google.com with SMTP id p26so1175504wmc.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677836755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KFj9qXZA8Xp6R3negD/mao5P4xOpEsilaejAXYshFPE=;
 b=N+R3KyDMX3vUyp6Kv4D2jgrmKjDt+5/hjxCVwIRlrQofWF9zfLghp5dwxq4qeBIDK0
 bHWHQzl02qXx7fUJLWoNeFhKq1vw2JFyI0oj5eVm7Ojdi4Ihzr3zDeMOSKJ2uW+J8BnP
 geb7RUnKs4zgbWKbhFBy+hfs5t6rYF5BQLJhTZGyZ9/NYAZ583Txz1iyEvAgpVZusssO
 rDGznAgdHi4t8r02TCZZ04AUhyWjh2cfzoLjrl8KrAWeSY1ARZp1sfF/h65QB73DY0/M
 aakvcHizlpsrC3qotIn8UIrfPwnaMYRfZ9h1FqIqXFicojnyKtqNwoUBmaxeF1a9Zwcz
 aZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677836755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KFj9qXZA8Xp6R3negD/mao5P4xOpEsilaejAXYshFPE=;
 b=ZvR2j4FBnWSa1S95jbYXPsIOiM3uAcyO+zbbtLm+SPOfAs+FC7H2OzH66Hn5vxVaYa
 L36ZJHPeJ5aiPrLvnYgmSyDP00YPuNdXCo1r+CdcYFBTdtNAgWd72cwHHGubHZNrap1A
 r26CEIKkcmRb6W1wJeaOIAGsRlIuejQEzwzeyavo9jz2hXY+wCzZjEOgdKXtalgxbAyl
 jw/1+RjLgcvcixBoSEDG5SZqmLeM3RC0j9A8xw+NwB+7+yiANEucnQho6lx8lEV1TN0Q
 A5Mno0tN0lB34/cGHmCkIysbvWEavjZY00FPHitIqV7HKpmBdPybv35UYuy/39JnFMZl
 +PGw==
X-Gm-Message-State: AO0yUKWLdd8BveZ5OCzKWN7HW3BIU3GulP5tQVYLW7Hb/VxMRawWk01y
 tDghLvDcn28SrU+Dkne9iHCpOw==
X-Google-Smtp-Source: AK7set+rNfNivuQBwvI5BrSfRMUboyT8WgqUJkJk+g0HoSTQnWc4T7OUg8db3cpBAZYaydJxYehi3Q==
X-Received: by 2002:a05:600c:4fd6:b0:3df:d8c5:ec18 with SMTP id
 o22-20020a05600c4fd600b003dfd8c5ec18mr1039355wmq.13.1677836755626; 
 Fri, 03 Mar 2023 01:45:55 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 c40-20020a05600c4a2800b003eb20d4d4a8sm1820583wmp.44.2023.03.03.01.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:45:55 -0800 (PST)
Message-ID: <07993756-3b4c-1327-da88-74583581966b@linaro.org>
Date: Fri, 3 Mar 2023 10:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4.5 28/29] gdbstub: Build syscall.c once
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230303025805.625589-1-richard.henderson@linaro.org>
 <20230303025805.625589-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303025805.625589-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/3/23 03:58, Richard Henderson wrote:
> There is no longer anything target specific.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   gdbstub/syscalls.c  | 5 +----
>   gdbstub/meson.build | 3 +--
>   2 files changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


