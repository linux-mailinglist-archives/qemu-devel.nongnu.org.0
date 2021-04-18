Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536A0363739
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 20:58:39 +0200 (CEST)
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYCcw-0005l4-CT
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 14:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCYz-00049W-Gr
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 14:54:34 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:34365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCYv-0008Tp-GR
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 14:54:33 -0400
Received: by mail-qt1-x830.google.com with SMTP id c6so24627238qtc.1
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 11:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lPmKsvCJgKE7IEb4/gf68CuRVwldcluGJUyX1Hq+HaU=;
 b=wi42mhpfBf0rgP/E28P+0Y2mVYiN0grVm6/f7YxYNS4c3y/+GrO8wfvdY6waRWxhzu
 Zw3E8b5PZIpNWkAh4QigqB4tELjT03W5Oi3J/siUlG8jSOQ/F4IF4i/mj3wDKHC0f08f
 BmC2dSwH+0RbXqbDBC8npdZ16DN6Kyp/VV8epp/U0DCSflSU8pSM2vZbtXjwfaJiTnnx
 v3pWb/qwlqMFzuzMJbY9eHLLXzmvVfOpTAAVFd67Aex+DElWGPxQRwjV7ogvPyF5XAFo
 s5liELYi+xQLZDhdl1r4V8aoqk+12xLcdaPxIWplSp9H+eTmUdjbE2xYVrHj7ZW0EpzJ
 86TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lPmKsvCJgKE7IEb4/gf68CuRVwldcluGJUyX1Hq+HaU=;
 b=R08YNaieLJorDjH13SXOrD9LdKLgfieQ0Wkgofgr9P/iFT+T3aO2kpGgoyViiZcpIF
 pzLt8qLaFB1r/KYiC3zARg/NEDMxnf18w9vjV1uQuosNLQ3zfAvJO/JsMFLAsMxGiJBv
 wG/W11QNVr8mU81/rNL7tZ1W2gGryUTAdfZty/ME+TmWbTkhp1Q+xeEX0ecedMtnoqSf
 XxvLkKNdbIEuRAyF84I27QCBe8U9A+qUu9bgUbNV4oj7OdpemIKezKw0Wc7Oca//1z6w
 ppDwnw4yegu4Pi9xJNYJiXXVZ38ndq4kZILQTlMbBKIIPGu7Xb8xNgldYdLvsTYKXp7h
 /MYA==
X-Gm-Message-State: AOAM533x/RCwOfXfORLWIBsKVsuoYdpaS2+4KNxr3eHIy0XfoH8sgdjQ
 Mclg4JWPoT0yPfVf3O8J0ng3bA==
X-Google-Smtp-Source: ABdhPJxL65I3DHzdt3ONISYLMXneKQAjJX8QrwwwcUE0Ua0V0YrEMVFyoe5Ng+PMmXGviuZq7X3lOQ==
X-Received: by 2002:ac8:d83:: with SMTP id s3mr8548669qti.333.1618772067975;
 Sun, 18 Apr 2021 11:54:27 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id f13sm6661950qtj.40.2021.04.18.11.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 11:54:27 -0700 (PDT)
Subject: Re: [PATCH 03/26] target/mips: Move msa_reset() to new source file
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <398ac68a-a81b-d04e-ba60-e490e174b825@linaro.org>
Date: Sun, 18 Apr 2021 11:54:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> mips_cpu_reset() is used by all accelerators, and calls
> msa_reset(), which is defined in msa_helper.c.
> 
> Beside msa_reset(), the rest of msa_helper.c is only useful
> to the TCG accelerator. To be able to restrict this helper
> file to TCG, we need to move msa_reset() out of it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/msa.c        | 60 ++++++++++++++++++++++++++++++++++++++++
>   target/mips/msa_helper.c | 36 ------------------------
>   target/mips/meson.build  |  1 +
>   3 files changed, 61 insertions(+), 36 deletions(-)
>   create mode 100644 target/mips/msa.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

