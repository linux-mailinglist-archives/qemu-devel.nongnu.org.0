Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88436276A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:05:45 +0200 (CEST)
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSqe-0000uK-5V
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS5G-0001wH-7E
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:16:46 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS5E-0004xj-Gu
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:16:45 -0400
Received: by mail-pg1-x52d.google.com with SMTP id z16so19627719pga.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9KQIjYDBxy2HxVGFpgxRlwRoIgmkb2BKQUJLZpUGJKw=;
 b=brHGAUel4INY0FVFlqCI4JLudJE88aGcSyCUoAusNcV8nwHKbCAS5Ml9Fd0boqc8Bt
 DHAvtkO0HGbgfHDzssIufBYWPBCqHXl3aWLReMY0YtgDvBJBsx21irXPNVcVO051iH1i
 IfjkDRU3bIfw4STLcOMqWivgp4DIAwm8HIiCjMqZh4/cWMPMiFY0zlT+OcQFAV5zC8f5
 aVryWW+snSLxD0HJzRmpIQquiAih5wVacPZzyyPI58603Cgm6CJPxacZuOF4TltD8JgM
 xwBQPNqxbO4JgjRpIQ9cI70MqgcSU+fSkOgp85awGIYkny5yQ9diKQSZ2Y7aKd3JPJri
 H2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9KQIjYDBxy2HxVGFpgxRlwRoIgmkb2BKQUJLZpUGJKw=;
 b=gEO9IkZNXh/NrKoE5K3ucrMR4BwWHOCIvdHiKu5KQtYsOpB0Z+03R7We43U/AE44bq
 aDuMNSXH0aGHnzZJyLE/qSVOyW3gvAOI76C/OE7JkAzLxChwZ6r3OLsrbKfCpUOLFf8g
 BPfcXVxl8tsdDmegph1yVJ3kQn6qV/54O/0mLb62EayVf+AVL3CUyJm67sOSQxsJRKkm
 e0+/ayKreOGKW/CD5uxR/6Pin1wT2/j1r4N+u75CZnQ+zjgIE5bCli7IQ6NkCeoR36YC
 g+h+W1vGnUw4mCC41uz/bdWNMJuSPokrRRVfghDnpVDPZ+SyJ6Y4O2iiM87ChKsOJxmt
 2K2A==
X-Gm-Message-State: AOAM533VvrPoMQfNC27TR5IOTENPV1UbsFb/RKii/lIVA2FhkvKUD+OR
 RNvUqTRpTL31belAi5HtmfuN4w==
X-Google-Smtp-Source: ABdhPJxUo7rH61Rhx5PbGo8lKwzpohLuzbluF32iBjmHMGnKAsjTcmZswxDQ8ViORRHmgxObL3Kuag==
X-Received: by 2002:a63:814a:: with SMTP id t71mr96928pgd.427.1618593401949;
 Fri, 16 Apr 2021 10:16:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id j26sm5210485pfn.47.2021.04.16.10.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 10:16:41 -0700 (PDT)
Subject: Re: [PATCH for-6.0? 1/6] osdep: include glib-compat.h before other
 QEMU headers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210416135543.20382-1-peter.maydell@linaro.org>
 <20210416135543.20382-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f573668-5cac-0f89-20e1-6fbc4c970585@linaro.org>
Date: Fri, 16 Apr 2021 10:16:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416135543.20382-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 6:55 AM, Peter Maydell wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> glib-compat.h is sort of like a system header, and it needs to include
> system headers (glib.h) that may dislike being included under
> 'extern "C"'.  Move it right after all system headers and before
> all other QEMU headers.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> [PMM: Added comment about why glib-compat.h is special]
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/osdep.h | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

