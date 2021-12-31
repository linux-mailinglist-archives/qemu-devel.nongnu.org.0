Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D1F482595
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 20:07:51 +0100 (CET)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3NFl-0001Rx-AI
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 14:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3NEW-0000hr-S6
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 14:06:32 -0500
Received: from [2607:f8b0:4864:20::42b] (port=35389
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3NET-0008EG-3U
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 14:06:32 -0500
Received: by mail-pf1-x42b.google.com with SMTP id v11so24337174pfu.2
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 11:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vKD5Q0nHnqzE9ovKLpfLRvkltw8R+hEanjpYSAbPyZA=;
 b=nVJwXJUVWRQWnCRQ7YFjH6LC99NSup/FbaXPqNY7JHPnaPhKb4JMzJJo07T6suaZ+B
 MUYS2FQaOLatypQ9IweHDPB7TxrVGDyMKqBWCeEMnEyR533mgTyGjwUT4myRYuhRfv+J
 SNpvx91AiMwJSp8llA/TOyszhbvnHidZ0hcVQ2Z9gBY5Xj19IuAUziJ8iuWbkf1Wg2ug
 6zY/4Fgc8iV/FPO9spmOrSXmsauPF1Q2Rg3Fnhx0ahlANKx74eGSrD0cbd9VGobl6nbY
 LJLmDcuawfWqVc2YHcEw8xO3vfI8k4kSiq4XX4OK6v4qHx4g0OlMdNr6zYJ8r9SqNbGI
 Nw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vKD5Q0nHnqzE9ovKLpfLRvkltw8R+hEanjpYSAbPyZA=;
 b=CFK/qsx68CYix14Cwa3G3o7jw/CBevm0UYBZToKBtvWxY7Z8y03OF70DFebWoSJ2ly
 0Ji/zLrhAQDFUOQaioSOSYCbKxf3+4m5nvrReIEinNXDSybWlzGcBRy3uCTPXkXF1eBa
 svdRB5S8HOWIb05Em91qKktQTKo746RhvXPDry62P1JTXMKUOMIYkF8EtWwIn8mho9A1
 qjxRLlEsvjgmbn8f/A8fJBTQPjPWj34ZPa+D4+z2GxROXHx+fwlOMIGmijDD6CJv2/vr
 wsGrTUrmPmmuRWMZXwe2XRAgZCApmjwKUdQ1Qk/NMqIeMoAcL3ig0RIRJnm2Tkmzs5/a
 7PIg==
X-Gm-Message-State: AOAM533NklBDQ4rCSVPV75l5qT3XLUb1LVQJez6yKJLDzmbW4Rqsnp89
 uq+LD+5jDump55xa76wwv0bVJQ==
X-Google-Smtp-Source: ABdhPJwCs9X8+l81s5PiO+Moj3o6JwQdJgFdeRoOcSuZHM561PLC8DifYXsMBeecuLDe/8m98mk5jA==
X-Received: by 2002:a63:81c8:: with SMTP id
 t191mr32104826pgd.598.1640977587639; 
 Fri, 31 Dec 2021 11:06:27 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:9312:6940:7d21:4efb?
 ([2601:1c0:6101:be80:9312:6940:7d21:4efb])
 by smtp.gmail.com with ESMTPSA id g10sm14573793pjs.1.2021.12.31.11.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 11:06:26 -0800 (PST)
Subject: Re: [PULL 00/20] Machine-next patches for 2021-12-31
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211231124754.1005747-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e515eae3-8098-0853-a5b6-48ebd75a5597@linaro.org>
Date: Fri, 31 Dec 2021 11:06:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/21 4:47 AM, Philippe Mathieu-Daudé wrote:
> The following changes since commit 69f153667fce723ee546d2f047d66d0cfa67c3cc:
> 
>    Merge tag 'memory-api-20211231' of https://github.com/philmd/qemu into staging (2021-12-30 17:02:42 -0800)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/machine-core-20211231
> 
> for you to fetch changes up to 2ece6e64846e1929c4ed338c73328d3b126e48d3:
> 
>    MAINTAINERS: email address change (2021-12-31 13:42:54 +0100)
> 
> ----------------------------------------------------------------
> Machine core patches
> 
> - Clarify qdev_connect_gpio_out() documentation
> - Rework test-smp-parse tests following QOM style
> - Introduce CPU cluster topology support (Yanan Wang)
> - MAINTAINERS updates (Yanan Wang, Li Zhijian, myself)
> 
> ----------------------------------------------------------------
> 
> Li Zhijian (1):
>    MAINTAINERS: email address change
> 
> Philippe Mathieu-Daudé (13):
>    hw/qdev: Cosmetic around documentation
>    hw/qdev: Correct qdev_init_gpio_out_named() documentation
>    hw/qdev: Correct qdev_connect_gpio_out_named() documentation
>    hw/qdev: Rename qdev_connect_gpio_out*() 'input_pin' parameter
>    tests/unit/test-smp-parse: Pass machine type as argument to tests
>    tests/unit/test-smp-parse: Split the 'generic' test in valid / invalid
>    tests/unit/test-smp-parse: Add 'smp-with-dies' machine type
>    tests/unit/test-smp-parse: Add 'smp-generic-invalid' machine type
>    tests/unit/test-smp-parse: Add 'smp-generic-valid' machine type
>    tests/unit/test-smp-parse: Simplify pointer to compound literal use
>    tests/unit/test-smp-parse: Constify some pointer/struct
>    hw/core: Rename smp_parse() -> machine_parse_smp_config()
>    MAINTAINERS: Change philmd's email address
> 
> Yanan Wang (6):
>    qemu-options: Improve readability of SMP related Docs
>    hw/core/machine: Introduce CPU cluster topology support
>    tests/unit/test-smp-parse: Add testcases for CPU clusters
>    tests/unit/test-smp-parse: No need to explicitly zero MachineClass
>      members
>    tests/unit/test-smp-parse: Keep default MIN/MAX CPUs in
>      machine_base_class_init
>    MAINTAINERS: Self-recommended as reviewer of "Machine core"
> 
>   qapi/machine.json            |   5 +-
>   include/hw/boards.h          |   9 +-
>   include/hw/qdev-core.h       |  24 ++-
>   hw/core/gpio.c               |  13 +-
>   hw/core/machine-smp.c        |  32 ++--
>   hw/core/machine.c            |   5 +-
>   softmmu/vl.c                 |   3 +
>   tests/unit/test-smp-parse.c  | 295 ++++++++++++++++++++++++++---------
>   .gitlab-ci.d/edk2/Dockerfile |   2 +-
>   .mailmap                     |   1 +
>   MAINTAINERS                  |  21 +--
>   qemu-options.hx              |  79 +++++++---
>   12 files changed, 358 insertions(+), 131 deletions(-)

Applied, thanks.

r~


