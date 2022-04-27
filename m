Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D5A510D95
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:02:39 +0200 (CEST)
Received: from localhost ([::1]:43828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njW4k-0005yW-Gj
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njW2Q-0004g5-Iv
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:00:14 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njW2O-0000pl-7k
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:00:14 -0400
Received: by mail-pg1-x52f.google.com with SMTP id k14so281552pga.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 18:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TAzFJRnQOKrE1dObBSLxjrfoqXzsAzkpmkmeltOYCHk=;
 b=QrOC15/gsaLf13H1uirFE1ZlNfGk8L4wOPzipIweAUdDxukWh/UJ9S9rBZm9KbJY/Y
 4f2l+UNB1d65H+tYHbOga3M840hz4KqvyiRNcceM/pVn8X6sp76WLDA2LgHvzRKLdkUn
 frUDesVxBTzn4IOrWYvODjCg0574F1GJvddYCTLHi2F0OtS0FKVf/k2OZ+M6kblQ4iGw
 aDC+v5nwgHg7emBFO+MG1D5SRuLniDU8cOf967EvY/rZa2wnWVDjDb2Ekz99l44M74jR
 K6ZMdkH2GKX+1tSj4HOKyTEX/9IdTc6hXJCTw4mzlC841aBHIGAoyKtANEv6YMi3OJzE
 1R/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TAzFJRnQOKrE1dObBSLxjrfoqXzsAzkpmkmeltOYCHk=;
 b=poy0LK6q6t1n+pypS2WkgMWmOfxbn574vnm/Uth0LgsDMPDN3DRW2PUd3yIg6eNFHc
 +NTpf0QwFTpKFXEZkDSLSGpAoH0IEW8b2ZRUH8m8BWaVTDUJC46QQqTr+HS1b3k/TU50
 EooT2cBI9M88oRp807IKtxlIFqowBBPZInWyFncIaUf+hQodLNJ4lP335zKbp7yQBMGy
 Mh9JcGXDjIT017XjsZEir+p3U69EjaTSjixy3B8vg/VO9+vln1QixphtReDAXZVVcbab
 wVMutI1eUcG/iz1/jBBtLInQT09sI5kXUMAo2uEj3yy7cbYKPfI+01ffTJt42x7/mAfS
 YoeQ==
X-Gm-Message-State: AOAM530civRFnXf+1YBs6O87GD3/D/eHuexcdynnJlPP8uPhiQPracrG
 Sej/9MBgvAomM9N9X6Rg+lKEWA==
X-Google-Smtp-Source: ABdhPJyOrsrTuP0bKXAUsJDoNShuUL44YumSo7RVNFQ/D2sLzo+CBbjm+szka566mfiJ5q3hE0Y8kQ==
X-Received: by 2002:a05:6a00:1254:b0:50a:55c5:5ff7 with SMTP id
 u20-20020a056a00125400b0050a55c55ff7mr27375858pfi.85.1651021208294; 
 Tue, 26 Apr 2022 18:00:08 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a6541c2000000b0039d1280084asm13716258pgq.26.2022.04.26.18.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:00:07 -0700 (PDT)
Message-ID: <bbc2291c-5e5d-678e-4eff-82c66ccc0b16@linaro.org>
Date: Tue, 26 Apr 2022 18:00:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 08/26] Use g_unix_set_fd_nonblocking()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-9-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426092715.3931705-9-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 02:26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> API available since glib 2.30. It also preserves errno.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   hw/misc/ivshmem.c           | 2 +-
>   util/event_notifier-posix.c | 6 ++----
>   util/main-loop.c            | 2 +-
>   3 files changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

