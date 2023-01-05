Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B9C65F656
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:00:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYHo-0001ql-4v; Thu, 05 Jan 2023 17:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYHl-0001qI-0w
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:00:29 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYHj-0003XB-F6
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:00:28 -0500
Received: by mail-wm1-x32f.google.com with SMTP id m3so20128019wmq.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 14:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jG9EiAkWU0BNf3/ErOs7D2erWfIIVWFnhh/kLI4ILig=;
 b=eTghosKzYLjyPcjg1Q54MtcQ1LAj38yP4dfg2oljvTE3B5PvtsPe27zI2zBgGCSPbr
 n4bXrNiPwYlhQCLZnAluN0udoiVZhAVB7bToPLIYbMXkxKs32cx5WdPup5UDpPbFVRgx
 8lOecL7SYc/R/+DqEg0FN500Zn1a5v02tMmiraKz7ACh/Zsx7xHKblu8BW/wD+BxmCxZ
 oE2hvswH4NbfiHAC6K9W+Z/3KOqdzEwlxQAInU6Lk1UIX2WHkoGfNQIVbxzjzRP9vJ48
 iTxYgb8OSUz88VsAahOqwemLk2hTaRuU3/3+YNsXfsE3TgygmK34Cjsfzd1243q4up+G
 afkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jG9EiAkWU0BNf3/ErOs7D2erWfIIVWFnhh/kLI4ILig=;
 b=FDr/vliGD33UZN0TTv5VR92pBBOF3oHZQ7hogQGaxACWjCihxXaa0YyNHD1DmxJ3Ng
 wqUJI19a4b2HWKDW6KQtcCC9cH/RK71CA74kUouky0K8UrPY7+CM7UEz4MFF8jlimb6z
 7sjLF/N+mTupz15+ySc01sIdGGw6xb727fZOgCH7P9MM/ZVXhuxviV1NNBfb3wvNRAFX
 yZQfxTrzFbF5degNN1Yt0nZZlJutICTtkWB4ozhS43ouPbIVrrlUmdJ8SuP+C3AapHlE
 hggvMlXt4SaLE8yNrroyFqPWmSTgHmpiPWF3SiGpBqEayGZd+URz+qfbL6L/ZzDUAfLB
 Kk8A==
X-Gm-Message-State: AFqh2kopZWLer0CSHT1ZwhVZCe1FoeYr6HrEPcGv/XYuFhUS6pNyWF4C
 IVpzet6gc7n4g1mOs5/kLQxFdw==
X-Google-Smtp-Source: AMrXdXuxpRJo6EnvW9xTRcnBVjnuUD1eFoNVIkHL+xarvhxLVjo+/R0+BVIeZDRqEONGoIfI0L6aAQ==
X-Received: by 2002:a05:600c:5554:b0:3cf:8e5d:7184 with SMTP id
 iz20-20020a05600c555400b003cf8e5d7184mr38025248wmb.28.1672956025845; 
 Thu, 05 Jan 2023 14:00:25 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c301300b003d6b71c0c92sm3999476wmh.45.2023.01.05.14.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:00:25 -0800 (PST)
Message-ID: <1e630d1f-19a5-5264-1a9b-8fb0cfe620c2@linaro.org>
Date: Thu, 5 Jan 2023 23:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 08/40] target/arm: Pass ARMCPUClass to
 ARMCPUInfo.class_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
> Streamline new instances of this hook, so that we always go
> through arm_cpu_leaf_class_init first, performing common tasks,
> and have resolved the ARMCPUClass.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-qom.h |  2 +-
>   target/arm/cpu.c     | 10 +++++++---
>   2 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


