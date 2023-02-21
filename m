Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBD769DB1D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:24:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMzt-0001jq-8W; Tue, 21 Feb 2023 02:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMzr-0001jW-6H
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:23:31 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMzp-0004PP-HE
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:23:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id c5so4004187wrr.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yG0GgYGxIW72pUC8eift4wOkilcDFYhQ4pJALdHg5hM=;
 b=W1jt95i0EgDzXVybEvuvpwETSHZqpPK2mngc6qaKt8lD16t1MCt0qjc/CYHzBuYJTW
 x4+FM/knEO3P1aBcKfxTDPv108U+Fz3cgu1bpbuQJ+a9ACiOsRaqiQVev6Kzl/ee5fYL
 07NB/IZhYdPYnUnIe/3FEKXVK+jMvcKINjYBnsbuB71q+JQyHrp5+hz9CEqV+UGYPsP/
 4zwaJXFw3sAGf0a3z5jSvl4TsWdSycRPydjIRTOfphfbBvsPjhyZI01ZNaJ05tC1w1oM
 WjqBQcn5xVAAQMu8lXSzYVjH5fnIuCniNsdF+tu4H+XvBzxSUb29Rl9vkPb7sS8lwDQS
 7u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yG0GgYGxIW72pUC8eift4wOkilcDFYhQ4pJALdHg5hM=;
 b=RjK0n+dchsTYxX00m9XjtzH/vr6X9O/NHXTgIOn++ijXrTKN8YQMa0YSDwMuerTMwy
 CyjdUvzLMlGIIb+724c/euh5Rh9xtVXngq3HMB7P1YIpqRsSq9WvSG8ddfJ9274vj4bH
 x2y8ttFAnzU1iRG3xjYz8haDn5TXllspsIrF15Iw5ciw4Z8Y2fDkGeY1nCMGUV/Phb7k
 LZ32PM4qUKQzve/NZQ5VYkRqn1nmuGexzq9ftzxL0KHMz7+Fr8THYj29pWZXKuNTKQcq
 Nscj+BaBsnsKHnIz4zFDnn3QbA/euxwZaF+oop0e8zt1M4qWiPB2FKAtqcOw81YXGfif
 4mww==
X-Gm-Message-State: AO0yUKUSM6FYXPq7iVUtjl2SH8HNcsCRokP4ApMWUY6pp1CoLf46PUNn
 fZdGPrTA/RVlEpVFK7zRd43TKg==
X-Google-Smtp-Source: AK7set/0Se7FkCnGAe4wWMXuPglqEW30rATPZieX9soQ3PWACASJQKNxKTN1e1mC8vXHd+/E/rdZsg==
X-Received: by 2002:adf:db4d:0:b0:2c5:5ed0:7aaf with SMTP id
 f13-20020adfdb4d000000b002c55ed07aafmr3530039wrj.19.1676964207608; 
 Mon, 20 Feb 2023 23:23:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b002c59e001631sm3293457wrs.77.2023.02.20.23.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:23:26 -0800 (PST)
Message-ID: <ea2c0c02-5d58-28b1-cc39-dabc542de39c@linaro.org>
Date: Tue, 21 Feb 2023 08:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 12/14] target/arm: Export arm_v7m_mrs_control
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 03:19, Richard Henderson wrote:
> From: David Reiss <dreiss@meta.com>
> 
> Allow the function to be used outside of m_helper.c.
> Rename with an "arm_" prefix.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Split out of a larger patch]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 3 +++
>   target/arm/m_helper.c  | 6 +++---
>   2 files changed, 6 insertions(+), 3 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


