Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D434AAD0D
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:33:40 +0100 (CET)
Received: from localhost ([::1]:54436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUYl-0006X1-LA
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:33:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUVI-0003oQ-TB
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:30:08 -0500
Received: from [2607:f8b0:4864:20::102c] (port=50868
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUVG-0002p6-3C
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:30:03 -0500
Received: by mail-pj1-x102c.google.com with SMTP id m7so9213982pjk.0
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k+YbnLXTwcQjPERhUMuwBBPoiI7C1qP77JCMU2dqHzs=;
 b=GPGxd2Qc25xLMq7XvLfCPOe1Lt1ok5Hb6EAddg0ZdDp153gXAZh+Zjo808gY3ge37/
 AUNjiWsrH12NNBmhG2irL/urYP8OrJnJqL3avkdl5uVFySmDU6CbnEhU7DAzhT1G7jTj
 4soQprGVESjFSjEfqaO+KOydDBYC1XTqKnAceYhinCmXqSV7HYfqITyy6K0tUbp95hPf
 tADVmxKN0BzEpr543qGLIK8bKBQBQR6QRmqYuavsvELMeXlIrGvPv9IJ8HZPagxe4k1W
 wjTFrK52El5ITIrrV8Z/k0F5FCJ/keGdcwCNqcRiFbhhL2behuhOYTf9WIjVKZ8uWYHe
 2rGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k+YbnLXTwcQjPERhUMuwBBPoiI7C1qP77JCMU2dqHzs=;
 b=3sL0CMDZia9I73ncHJxMBBd+ys8NttafpuR7z+KlmipgtneUJraQLc8/TGd4XNxT+h
 g+yyXDEZf/oB60WiO6z3Zv3vKZGNBJajEB1hktcZqILDFGLbPV9SowShq/dJ6DttYxQt
 JwX4DpuvTdxWvN9lQMrBSeoi9ZX0vgeLUTDYH0BFB6MDNIP1wghqhe96ydcoxLxth/kx
 VVF+eDYV7dCiiZbwaCobPyzwpKxzm6bIdlFUzxZwkN4Gk+yE+f6LXPbIgy+gKs0nDJCO
 qVpvfOKRVB81yhqtsgn70mqTAIgzp+IwkYLN1cjAQUa4whMVAx1WMBK4k6ga1XqJZH1N
 +3aw==
X-Gm-Message-State: AOAM530W2HwwHoIMD3peXqjdN8QQJaGLS1LN/yGf5+g1qyVBCgA2TJWc
 gjlg5uVgECqcqSOvDPiOmdEL/w==
X-Google-Smtp-Source: ABdhPJzxkWBNYWqlbuthhgTrM3eF5ysbJfc5XnIqlViAioon2uJvuFzFqeAaJ3LTpoT+J7Jkr/i6oQ==
X-Received: by 2002:a17:902:714e:: with SMTP id
 u14mr10172510plm.52.1644103794548; 
 Sat, 05 Feb 2022 15:29:54 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id g1sm6972003pfu.32.2022.02.05.15.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:29:54 -0800 (PST)
Message-ID: <664dcd6c-a5af-2e37-2148-6cbb545e8b03@linaro.org>
Date: Sun, 6 Feb 2022 10:29:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 16/21] misc: Remove unnecessary "sysemu/cpu-timers.h"
 include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-17-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/qtest/qtest.c            | 1 -
>   target/alpha/translate.c       | 1 -
>   tests/unit/ptimer-test-stubs.c | 1 -
>   3 files changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

