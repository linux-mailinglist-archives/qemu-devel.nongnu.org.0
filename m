Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76A667FBE7
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 00:59:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLv5p-00039q-4S; Sat, 28 Jan 2023 18:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLv5m-000395-Nn
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:58:42 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLv5l-0007oY-8H
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:58:42 -0500
Received: by mail-pf1-x431.google.com with SMTP id z31so5539011pfw.4
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 15:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fUZhQbLaPuWY16f2nW4F/x9o3br7tZ29FQ7xAWsWI8A=;
 b=y4ujSpsCx5eamlaS+MOvZmoVUpjVOdmeBP0I/D3r15xdOm6owkVoUoXQneSWfgfddK
 sgvfO9kBvPv6uyGlPKqu1ef0SAWz/9RMFd2e3UJRGuBL9TPp1YLT8vSs8G+OhLk6TiDs
 RMW8GGjOrm01MYk2dNZieGU25y7GOejWf2hlYjmY93QxaenL8gv9bsYYQGndAcwbkuJN
 XME6318RcY6U6X7H11ErzLYaenNQaeg4dCsLSU8xMDaSlKwQlaFF47vVuseKrEqmlZwa
 J3hyUpuLo3lBP8RfF+vwfYxPenjSuKYIgRyrSRR+qWnmWuXt/mgCps9yar3j+tOmfYPD
 a3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fUZhQbLaPuWY16f2nW4F/x9o3br7tZ29FQ7xAWsWI8A=;
 b=OaL2qss6E40yvZu7aHPhZxOXDBX7X+7/Ggz8hcXqtSLB0oNecxXS2wJcdhUhVbMPe2
 GiX7OI/2FJbGbMOHu/99l87F3HhfufM6R8SD8V8g+YJ6a1c8e2g8/V0wfVhCz6gtfpAo
 yJpl5TlTelCE2ctFStsEzE+grQXLNl5W+QewiG5MuPAPm667SrrvjgmoS4eq/JumnLOm
 86QZx8avzwKk59gDhykfMwyWtz1DAsKA/wurIKoGdfu5mP6FlExSIkxmlSM5jnbpiy1y
 6jBX/poeZO1m9QLZzjdAzRuFstNHFxGEo33brQFxePSSLTRGtsd4SF+VzGKzQYIf1qdW
 m80Q==
X-Gm-Message-State: AO0yUKUQ/SAAJ3qy0cskUmT+N/uvz8AupWbwc5nwdNxtoQoWPV2Lyz4C
 lnCza9PDPb+hNTNnO8/rzFtTiA==
X-Google-Smtp-Source: AK7set9OrWRU/eRK41HGo74v6T6yWJAqU8K6IRzZzrOunJ/N8E8etXwX90U8hBgpCIOBGmMOXf0hBQ==
X-Received: by 2002:a62:6445:0:b0:592:557f:9f63 with SMTP id
 y66-20020a626445000000b00592557f9f63mr9473805pfb.11.1674950319452; 
 Sat, 28 Jan 2023 15:58:39 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 q6-20020aa79826000000b00592543d7363sm4293698pfl.1.2023.01.28.15.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:58:38 -0800 (PST)
Message-ID: <1f067e72-6313-e0c1-5d27-939dae16169a@linaro.org>
Date: Sat, 28 Jan 2023 13:58:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 21/23] target/arm: Implement the HFGITR_EL2.SVC_EL0 and
 SVC_EL1 traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/27/23 07:55, Peter Maydell wrote:
> Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1 fine-grained traps.
> These trap execution of the SVC instruction from AArch32 and AArch64.
> (As usual, AArch32 can only trap from EL0, as fine grained traps are
> disabled with an AArch32 EL1.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h           |  1 +
>   target/arm/translate.h     |  2 ++
>   target/arm/helper.c        | 20 ++++++++++++++++++++
>   target/arm/translate-a64.c |  9 ++++++++-
>   target/arm/translate.c     | 12 +++++++++---
>   5 files changed, 40 insertions(+), 4 deletion

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

