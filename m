Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BACA6504C7
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:25:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p719g-0000s4-3r; Sun, 18 Dec 2022 16:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p719d-0000rr-Nt
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:25:05 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p719b-0003Z6-VJ
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:25:05 -0500
Received: by mail-ej1-x62f.google.com with SMTP id kw15so17412904ejc.10
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 13:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5xnG9xnCM2N/uv4Ntf7xk+0Uzs/Z1POu3Jd6dXDxaIM=;
 b=Mx0etZHunwkgxBVVF8CLIISCfTDIDbWf+/aFXZiKDb45SylHcNFoptrV105oxcn6Sa
 k0tlELi3ZzRmVDStfeHVkguTKZegi2uIBrAYPDLH46Kpxn2XnprMsaWQDdoUURvNCE7f
 yrP/eURI/xaExaz0rm+z3zHZmau0hgGj/Vtz0pp5mb7oO2thZovWiuxrCFCryqfdn8Xt
 2nR3yl0H19WrpUhrSo1xS0gTlTu9aCH/JBZsRn+gxCRhfOsuDEcSguY81o+TEJNqKUlG
 1SEEVwurquE9Vso+us7WWcTCnzQMgcaFiNdcsS9ey4T8tGWANkUJkBK797Js+hYKNxCk
 9Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5xnG9xnCM2N/uv4Ntf7xk+0Uzs/Z1POu3Jd6dXDxaIM=;
 b=KvRhKpQ+2NnJsavHxkvh9tP9wOgmHREAXRqej8E96N99f0ORs4fbYWcdENs2poUEP2
 gblNWbeEVzvtP7lUoXGjB5Jyi1V+Y7YMAGfLWZq3LlTrjUevMlNoHOD7JrEC94MOz0L9
 S2xFjHQ/rm01LDzDKsxSLW+aKaRq3qaI3ZNfSupVQ4KQU/1qeRlwTPEOumIsrHpVMfhc
 BjyK/3f2+YFnXQVmnQff0bZzLbdg/i/GnCu8f9XuMu/n7/rqJOpaUhc9s52Cd1z+pbc2
 +Y/iSnW5gtDbWFVZTU4LCZ1N27cHNN9Iuwb40sk8d3mpPQLDvvBOSMNx1SjwlPg22tAp
 KklA==
X-Gm-Message-State: AFqh2krxLYO10NNyrnPtp07Yk62hKZym1bd5y4NLGXr2THxrKcT8I3N8
 zS7a1ybiXl0rmmXfN1AMvthlXQ==
X-Google-Smtp-Source: AMrXdXu6pLv+0HUT1GMKN6MuSFraB5F/uHltgJbwIpGqgqDfXymoNu0BksRjj66aFqrwU98BNP8Iwg==
X-Received: by 2002:a17:907:88c4:b0:803:4577:ea2 with SMTP id
 rq4-20020a17090788c400b0080345770ea2mr5431441ejc.45.1671398702373; 
 Sun, 18 Dec 2022 13:25:02 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o15-20020aa7c7cf000000b0046f77031d40sm3500564eds.10.2022.12.18.13.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 13:25:01 -0800 (PST)
Message-ID: <645549d0-7c8c-d0c9-890c-bc1e4ed71888@linaro.org>
Date: Sun, 18 Dec 2022 22:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v4 17/27] accel/tcg/plugin: Don't search for the function
 pointer index
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221213212541.1820840-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 13/12/22 22:25, Richard Henderson wrote:
> The function pointer is immediately after the output and input
> operands; no need to search.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/plugin-gen.c | 29 +++++++++++------------------
>   1 file changed, 11 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


