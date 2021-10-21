Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3F6436D74
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 00:27:11 +0200 (CEST)
Received: from localhost ([::1]:53974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdgWk-0004A5-Cr
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 18:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgFX-0003qp-UH
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:09:23 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgFV-0007w6-OA
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:09:23 -0400
Received: by mail-pg1-x52c.google.com with SMTP id f5so1501691pgc.12
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 15:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HIPkTC40lKf6Tm3Cb+lz0Sf1+tTV7eRwl3+0J7HwWFM=;
 b=uJfMCU9OS9IZ6qTkXF57yS1kccn+7CiOdIpSAE9FisWS/Jilf7ebeAOR/j9FmUvgAy
 KrcYqK0nEUiYhk1tOb+zN1ya6ZtA+bM+60F2ivclG/R/y1UsDbRqBwdKfxxZtTTYm7tc
 9MozjwAdEA3w7TdRsvk3yBvk4JZNhOqJJZepsRiDV1+mh/vnpwxPzP2+xU3L/tPEv9s/
 18r55g3NyjXOftGT+VieA7gX0yXOxKmpIQ/n+8QNRtsR1KReYya2Erf2pKdUnnRcab2H
 QEhr106G4a9NKCT/wan8q35LbQQrNoM4ePHSsXVBylR4ve0rExNqAluzPwuWqVBN7nSg
 srpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HIPkTC40lKf6Tm3Cb+lz0Sf1+tTV7eRwl3+0J7HwWFM=;
 b=uowX61aVTRFKI3Ae5WX+xzHSCCQAzRw1w/9rXg6DaE0yV2mN245fLVg7sMRaAjChEb
 u8npD0u+3WWDi7RjQYH98m9vIxtEUaaazUMIFU12P+WVQqKGGAFo92t3IIifersUYR2u
 9se1DQKuLK7fuGeKNk8WZFpbMa36nMwTjuaccfLfFiKtXaTGknu3KLYXh/JAPhCtipGf
 L0jJ0WKC09ET35kDUDMjOmykpTXUd1PQdaw0lBYMEm5V999oXt+AmGzBiELVWSW7fknf
 62Grja46VGoZZwmfms0kcB3wxNHikxnkSurPuuKMsSrAVPc/BmUDLewOoP2uhVZnhnmn
 cknA==
X-Gm-Message-State: AOAM530tDRbuaJPh+03i2xkcmVmpThPh7RHAUk1K0phU5tCUSrjmLDZJ
 SZ45Y2QrbgARYbG4fJO0qaQRxg==
X-Google-Smtp-Source: ABdhPJxBliWBiQaeuVQ9hBZ2vadth1M6HWVuOlSOvd3f4MWO+SAxTjjOlrnaqAWcKmWh7QUKQHQJWQ==
X-Received: by 2002:a62:e40a:0:b0:44d:a86:43ce with SMTP id
 r10-20020a62e40a000000b0044d0a8643cemr8441382pfh.69.1634854138146; 
 Thu, 21 Oct 2021 15:08:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g4sm6037769pgs.42.2021.10.21.15.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 15:08:57 -0700 (PDT)
Subject: Re: [PULL 0/1] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211021174104.52826-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <54613b7d-8362-380c-f7d8-1a21e83b706d@linaro.org>
Date: Thu, 21 Oct 2021 15:08:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021174104.52826-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 10:41 AM, Stefan Hajnoczi wrote:
> The following changes since commit afc9fcde55296b83f659de9da3cdf044812a6eeb:
> 
>    Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-10-20 06:10:51 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to 4b2b3d2653f255ef4259a7689af1956536565901:
> 
>    coroutine: resize pool periodically instead of limiting size (2021-10-21 18:40:07 +0100)
> 
> ----------------------------------------------------------------
> Pull request
> 
> Performance optimization when guest applications submit a lot of parallel I/O.
> This has also been found to improve clang SafeStack performance.
> 
> ----------------------------------------------------------------
> 
> Stefan Hajnoczi (1):
>    coroutine: resize pool periodically instead of limiting size
> 
>   include/qemu/coroutine-pool-timer.h | 36 ++++++++++++++++
>   include/qemu/coroutine.h            |  7 ++++
>   iothread.c                          |  6 +++
>   util/coroutine-pool-timer.c         | 35 ++++++++++++++++
>   util/main-loop.c                    |  5 +++
>   util/qemu-coroutine.c               | 64 ++++++++++++++++-------------
>   util/meson.build                    |  1 +
>   7 files changed, 125 insertions(+), 29 deletions(-)
>   create mode 100644 include/qemu/coroutine-pool-timer.h
>   create mode 100644 util/coroutine-pool-timer.c

This is causing

  (001/170) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg: INTERRUPTED: 
Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: 
ERROR\n{'name': '001-tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg', 
'logdir': '/home/richard.henderson/qemu/bld/tests/results/job-2021-10-21T20.58-ae0f6... 
(900.15 s)
  (002/170) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_kvm: INTERRUPTED: 
Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: 
ERROR\n{'name': '002-tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_kvm', 
'logdir': '/home/richard.henderson/qemu/bld/tests/results/job-2021-10-21T20.58-ae0f6... 
(900.23 s)

I initially though this was just gitlab, but it reliably happens on my local machine as well.


r~



