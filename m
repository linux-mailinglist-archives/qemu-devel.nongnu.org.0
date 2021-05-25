Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EA2390CE7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:21:10 +0200 (CEST)
Received: from localhost ([::1]:38140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llgMH-0004UN-IS
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llgL7-000336-87
 for qemu-devel@nongnu.org; Tue, 25 May 2021 19:19:57 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llgL5-0000SH-In
 for qemu-devel@nongnu.org; Tue, 25 May 2021 19:19:57 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 ne24-20020a17090b3758b029015f2dafecb0so12897166pjb.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 16:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zOHb9DOTBgwFbyhBoM5tg0CM+qG3I3hrPjha5rYwimw=;
 b=n9hGHmMi4AfDN7jCCgdoll2uZs2OqkK4CULbBFerwzpm40h7oLtFfQv0zkTMauIvrD
 p1OtIbpRRpiTObo80KJRtpBQQ3QTF09uY4b2BMCD3bbCibq60RXiNmO7xg/LttrnG37n
 iJ2QXkuYgy67QV3Pznwc03rylJEKRcgemXq2w9AbahFnq5t5iApBrT1iyHogzRCltmfl
 3H0dzQpXAGoIkZyXbly2u2/p8j5CUofeB847MRNqOYfTNtLPZmGFqR0SVDNkqeMrhnDi
 0s+zlWPgg7XrrodpyGd2K/b3A1P86I4OiMqlFP9g7G2PeF2JPSJQZsBdus/Z5sY2x2wb
 qhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zOHb9DOTBgwFbyhBoM5tg0CM+qG3I3hrPjha5rYwimw=;
 b=RgXAB/g/QOVHBc4Yy/TwyzfV0+34h1WlPMMdfNhzVT7wfi3vtxAJykmQkTXu306g1/
 bK6PV3xGCySsZxtxKUzbpMBc690Xq1iSsL5Xuc9wUiWekaKjtoBq9+IKzK/AZu88t6DA
 RulFNOXHttS+wZDAWfihem+eIMCDVfPHrDySD1tqoYlv0ZwT8T0w9jrVTf3OI8DWChal
 XnFTRUKVMRYqpkvAV7cH92FYADg3dpJ0/HAZR2hM6UI/YfbeENwGbjRe38YxGDT/Bg96
 WCL/P1I6HnT5zobAjMfqk8pG0xuNeMQHnQUUA+ahtrSLgbWIBkzdn62EhFo9uQIvPS8t
 aUvw==
X-Gm-Message-State: AOAM530Be0lO13v8MfzRNjSjioT+m1M5+Q8ut0NZ/Gm2FhrcOh8Dt2hT
 HhBbKLtfuxXb1qQT5MXEuX1cKA==
X-Google-Smtp-Source: ABdhPJy9EcNNa2I1lICNY3cLlMz9VS4gA6S7VsnOlqgu1/Ymjqx6wIsxe0b8k0iYS3L7kP8YgqZeVQ==
X-Received: by 2002:a17:902:c94a:b029:f4:ad23:7e59 with SMTP id
 i10-20020a170902c94ab02900f4ad237e59mr32739639pla.73.1621984793804; 
 Tue, 25 May 2021 16:19:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f5sm2820186pjp.37.2021.05.25.16.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 16:19:53 -0700 (PDT)
Subject: Re: [PATCH 2/3] meson: List if X11 dependency is detected
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210525104648.4060904-1-philmd@redhat.com>
 <20210525104648.4060904-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <837a9d62-f0a3-35fb-3024-414af2de7c06@linaro.org>
Date: Tue, 25 May 2021 16:19:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525104648.4060904-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 3:46 AM, Philippe Mathieu-Daudé wrote:
> It is sometimes useful to know if X11 is detected.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   meson.build | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

