Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5214B0014
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:24:01 +0100 (CET)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvNY-0000s2-Jn
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHvBf-0006yZ-Hm
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:11:44 -0500
Received: from [2607:f8b0:4864:20::633] (port=44566
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHvBc-0005wY-2s
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:11:43 -0500
Received: by mail-pl1-x633.google.com with SMTP id y18so137046plb.11
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 14:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XSEIErEx8DYerkoq5mmWeG7GqrwaAYxe1QJG4jfZVPk=;
 b=ogV/hsFVxh8vCWzyc8Ys2J6CgRjTsrxfxfKpcNQCtWlRAGoQHOLPi9lbGJZl2NgGuw
 RVDBOQFMku8EctWa9upE9bpkI+icTwrtv6eqHkfyeTkOiYLHOM4biawO0jeWRwgq64lK
 q853uwvzZdVncoDzPLE/T79dmLeTdvnDNIFBDFlbI6gb2lojY3fNeRMFJZrc9TMaLxHB
 qkSvZ6tA3xFqmEvgX/NMCUFBMcCp3RGZk2mhqlXJ1qm0AR8xiWk7HfS2HU6Wu8og6Xp/
 ZQGQk50myz/udsdJVIhC3R/SN5A/z3tXXH9J8kJiEtKQc8jYwNXoQjXkh4vwcyFjYdP0
 +fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XSEIErEx8DYerkoq5mmWeG7GqrwaAYxe1QJG4jfZVPk=;
 b=QQY4ZOf7Ra91RoVZsdB73OGvohy6WkVfSW9IZ4BrYrxVIVspdaTcHgc5GMMYbqr1qw
 mXn+fb+0McbUN4PL+jN6ZBg/RHs2hKELeM6XE3O4zKnSwUfweOjMEfpJvJuuq+45AiIZ
 GpEuJap6xuZh6Qo1rFqol+wYXN5dI8f7ULdNaH2vdb3J1Q0uqD/FJK35Muw7bja+UxuE
 +bTTO/K/VtBOEMs8/90b7N/nKO0tVc9Dxw8xd0Mhx8we2a93OxB/AMdFOuLsXvVmlvMh
 6xQYe4dqE5n02yj2sUIFB6937cc/GTv94AQHH7n0qfD7Rsf/A81mOMP7+ewriZ/VFIZ2
 qvWQ==
X-Gm-Message-State: AOAM531Y7kd+9yAHbjdfhCWWNceTYxL9/JeespBhEzQIy3gSdXN0gwKJ
 jM5+wYFVN7yK2bwWc/Q5SsI2NQ==
X-Google-Smtp-Source: ABdhPJyMcMtWVqqsGx4ji5hcea/EVAyW/ALxwXAJAIgBNuNWD7ti1yubcevRgM4QtYINNFbUh7Y7kg==
X-Received: by 2002:a17:90b:3a82:: with SMTP id
 om2mr4546122pjb.167.1644444670766; 
 Wed, 09 Feb 2022 14:11:10 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id u17sm11895714pfi.163.2022.02.09.14.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:11:10 -0800 (PST)
Message-ID: <25b7935c-b674-6aea-84ac-0bb2975337af@linaro.org>
Date: Thu, 10 Feb 2022 09:11:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/15] hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209215446.58402-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 08:54, Philippe Mathieu-Daudé wrote:
> hwaddr type is defined in "exec/hwaddr.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/m68k/mcf.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

