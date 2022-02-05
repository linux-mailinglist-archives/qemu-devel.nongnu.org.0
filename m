Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F94AAD01
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:18:42 +0100 (CET)
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUKH-0004RE-Ny
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:18:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUIO-00035d-8G
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:16:45 -0500
Received: from [2607:f8b0:4864:20::102b] (port=50825
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUIM-0001SC-HJ
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:16:43 -0500
Received: by mail-pj1-x102b.google.com with SMTP id m7so9197668pjk.0
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=B73SmQ0/hMFitc+aHQK2fUt2D644OQLixx4rLjyadt0=;
 b=jErBNf9iEfgTr6mqNR2uYSPo1HXDCWh2a77Rvm6GtUaRRBbtCHwQ4P2RuUeaLYALAR
 PjjzajJ+LK0XtpA+WSL0zORHqHHn3AHaWFd3IFTw5S6XUll/eJ/GKhNW+iNWf7/Af9OX
 MP3re2PYYAabbHSWxvSwdYDrwfA+TWf/2rA/wfW7Bhi9akUIqANObieyA4cWjthWaTbP
 xqpvzOgE5unDxU/qSuh4v3HxPvveRuJ+6FqxPN/VQS89Jwsmgdz2LvLd++wSI0/6+s3D
 m8G6chCowHSz8MQoaOb0LnaIQx08I0jqI/cwLz+Lopu7jYJcXtSnyoLZsXpW4GfhwXWc
 +bDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B73SmQ0/hMFitc+aHQK2fUt2D644OQLixx4rLjyadt0=;
 b=JyVI+5OIycycuZ5kKxaYWcuspfJUwq78TPdFz+uWT2+q29tzeI0vPS6ABUFHaBdh+6
 F4UuvMqmu4UlIGNm8FI7jb4xp7WR6E+7pry1N4oXgXZS86d4Eceum3oXVYeOV7NyQ9wb
 Nle5wTG2uXg34Gl3zzpxCQ2XTkpPHAb8HOQW06UnJXEPesFBj4fqy9KcPRTEb/iH5sb3
 nYch4Y1HTvWpSNCdm6G25Sz73t22NDdypqaHSJPVq4O1jH4GuPolNGM/S8/AdBHFYJhE
 BhtnWFJy6jBkSmh8FHzSMeP1w4JDpGZMzI9CdwU4T+D9oV2hzXL4CGPWMTz07guRURiP
 qFTA==
X-Gm-Message-State: AOAM533vLmlQ3XVd8o80GATmtVfIyA7au5es535BGcbwZ1smPh6jGHlM
 Sewy85mvRDZ3KllNl152haAS4w==
X-Google-Smtp-Source: ABdhPJwJ0hhU5Luitd190Jgl1cBueNDpZOLPC66ugLaxkb/hClZP8VhjoT8KAB+EwVdVIXdXaaDwdg==
X-Received: by 2002:a17:90b:390a:: with SMTP id
 ob10mr10688926pjb.92.1644103001232; 
 Sat, 05 Feb 2022 15:16:41 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id k22sm7380814pfu.210.2022.02.05.15.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:16:40 -0800 (PST)
Message-ID: <6aa9aea4-77e2-9e00-8e71-4f4a2cefc67d@linaro.org>
Date: Sun, 6 Feb 2022 10:16:36 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/21] softmmu/cpus: Code movement
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-10-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 2/4/22 06:18, Philippe Mathieu-Daudé wrote:
> We want cpu_thread_is_idle() to use cpus_accel, so declare this
> variable earlier.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/cpus.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

