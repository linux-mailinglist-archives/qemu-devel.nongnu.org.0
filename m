Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A065F649
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:56:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYD6-0006nt-Kv; Thu, 05 Jan 2023 16:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYCp-0006l0-Pw
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:55:24 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYCo-0002X6-9L
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:55:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so2365360wmb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3LlM7jxLS2WTLZAXy2motc04VZjaGT2uFyRlebEwfuw=;
 b=m/2lTCFlYliDJBs04c4ISPDHtg2s3ch3p0+ueVK+xD2mz7kW91l6OSHt0B/ZAQGc3w
 pg9Ua7vo8LWMFC9aZgqlS73Pj+NDVRv1s4sx4fdEHPMmpt04vjxX2Jm93S2UKWD0JgZ4
 QJ3zI+SH4f5wRw7m+n0TIdnohtyH6Qn8+FCw7x1kCBMfPSk6ovlQRneDkTNFhsmDByQo
 nm2D0DvxZ2HvOozJDMWWQ0ZZ5WfLHWP9jQuHIzk23DNr0nODzHEFK4fNiCDJTlhgkGAJ
 qGtArz7TK0fDj/FrJvznmAkBjesPECmImPwsfQ+4bQJPNDqTe6LdOtZZVoj2hk9Dj7kz
 hj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3LlM7jxLS2WTLZAXy2motc04VZjaGT2uFyRlebEwfuw=;
 b=lPgBFICHFn81ktFapa/a4cJdFL9TDFw4lvnW91aFlkmFsCDD6skkttKSAJy8Vx2DRA
 28DNB23EXuJMavmKKI9srzaid8e96EmE/FjtFlF0bF/WoM97X661NT8QgbHuaacr4bzA
 89kyLkK+rjGlkNOAk8NufIBSib8cG4uqFpKNIKCZe6SGAZnOI6/fzJj5FZcTIRwVa3NF
 i9+kk4GbbWvLE0wGEc6xa3FoDUlZGFPUVcLhhOPOWX3BdXD6sTaV6J2wLlclVb8mD7O1
 sJ3WlnJNCB5jAoIpAKYTo/4YBe3wIEziVg2XqMGTNFajsjXuJ8pkXAHkygzWQTLfAgd9
 4mtw==
X-Gm-Message-State: AFqh2kooEaHPXVPVHeh9pser7oLllctBC7ENF321bAmA+1aVDprqAz7/
 kslVg/ngSf0Vb+EE55Sd3txqFQ==
X-Google-Smtp-Source: AMrXdXvXJAsYNff/UbeDebyG0dYeTsJT+WGRe/PqzRd2SGnA2aBdW2aH4S5QhULpBSc2qCGPerkCVA==
X-Received: by 2002:a05:600c:22d4:b0:3cf:82b9:2fe6 with SMTP id
 20-20020a05600c22d400b003cf82b92fe6mr44891274wmg.8.1672955719751; 
 Thu, 05 Jan 2023 13:55:19 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b003cfaae07f68sm4336574wms.17.2023.01.05.13.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 13:55:19 -0800 (PST)
Message-ID: <f37808a1-857d-5b24-7483-695e256716e3@linaro.org>
Date: Thu, 5 Jan 2023 22:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 14/40] target/arm: Rename arm_cpu_mp_affinity
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 3/1/23 19:16, Richard Henderson wrote:
> Rename to arm_build_mp_affinity.  This frees up the name for
> other usage, and emphasizes that the cpu object is not involved.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h  | 2 +-
>   hw/arm/npcm7xx.c  | 2 +-
>   hw/arm/sbsa-ref.c | 2 +-
>   hw/arm/virt.c     | 2 +-
>   target/arm/cpu.c  | 6 +++---
>   5 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


