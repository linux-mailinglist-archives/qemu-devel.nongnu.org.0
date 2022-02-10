Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15484B1949
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:17:00 +0100 (CET)
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIIgN-00073M-5m
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:16:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIch-0005Gv-Km
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:13:11 -0500
Received: from [2607:f8b0:4864:20::1031] (port=46859
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIcf-0002Po-Mr
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:13:11 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso7083357pjh.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vaSr6teM7K5+CBT3mf5CKZUvXkmGeswzJScoB8CBXfw=;
 b=pKb1ehaTGDnufe2yaMEcLMl4I0C4/LUAaX6ohhLK0RAI85lg0ITJ3g/AJU/n1Cx+Xw
 2/Nh8a2hRxDEmpHC7nUClZhE/ZFrlwOQfzBPPTc2EAediZoUxw4EWLryXtocv3zMUmWp
 b1bdz51BBfbS6EKoB7lkiHHNvrG8nvSLEP2C76MkJGY4e06ffnhA0V5cysi8Q1oPeRBC
 Hk7NsBkaHmNDLAsDkEspYNpbbZFD9bilicNC1qeNx0cFIozrIPBafSxEh20HabPjHi8P
 W7nFc8ZWfAJ664JbmkdbmUT1Bv9D1me4/Z9Sjle7u8qbf0ws6CRILIBtg/0rF6pzn/n4
 urfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vaSr6teM7K5+CBT3mf5CKZUvXkmGeswzJScoB8CBXfw=;
 b=rVbqzCHewsT4cbZPBAZmDX9sSB0bCu432IfszDlBjjSLXiIMwmX/7Z0/QBALRAGsYo
 egyj5t12Jppzfi7U79IHG457jz6VPlAI7FrrV4PXNms7om35aVDAwZ97AvSP08P6yNDd
 ZA5S5wWMu0veT7iiOT4PA6b6Jaanv6Ek2ht5lCO+SuXrOqACOn927tW6KPCnW5OOpinQ
 MVC+4L1IgNwGA8ps/Eyp2E8urPasFcfcr2doiAOf9zPSSM9bWYL4RUOVaLk0pP0qSQp6
 gJXcyJzUO/W/lsvzNmRZZZBdgxIjGhJeVrulIvoRHDlCAwxZt650P2XO2kKPbr2hqFgP
 qKqQ==
X-Gm-Message-State: AOAM532HuIzt7A3fliUdMxwQiOJ+lYdio5D6JxPiCUCNEOq+cujTwDNz
 +Yr//U/zAn4x1udd6wBRd0/+Og==
X-Google-Smtp-Source: ABdhPJxxx4W/DD+Lb/mAQgAU59u0U4kwtRL4Gq91u2EHYErWgjJhVsy+oNxhOzJ3+ZhwlmvTxx27Og==
X-Received: by 2002:a17:90b:390f:: with SMTP id
 ob15mr5243274pjb.195.1644534788389; 
 Thu, 10 Feb 2022 15:13:08 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id f3sm25593541pfe.67.2022.02.10.15.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 15:13:07 -0800 (PST)
Message-ID: <b900e251-7f2c-af29-bf77-4d615f2f1edc@linaro.org>
Date: Fri, 11 Feb 2022 10:13:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/9] linux-user/exit: Add missing 'qemu/plugin.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209230030.93987-5-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 10:00, Philippe Mathieu-Daudé wrote:
> qemu_plugin_user_exit() is declared in "qemu/plugin.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/exit.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

