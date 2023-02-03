Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA3E68A085
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:39:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO01P-0001qD-83; Fri, 03 Feb 2023 12:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO01N-0001ph-7H
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:38:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO01H-0000vL-TF
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:38:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bt17so2280561wrb.8
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 09:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zBYJayEtUVpizMZqbs+7AWKpfm2CY2uMgJrF0P8X+Wc=;
 b=V8POdrbPb6K6eMYtmMj+1iuXIpo6wnXQoATpPg27zjaRd3JYNvq3HTsoxeWv+/CcNE
 KxuM3rkZkrkYjQQ22zv1l6BMtvQwQc1poEtv5YTztjUeM8QA2X8nG+74DAR/LPEodCSW
 L1PTW3pNuwbI24MGGvGayQQyv4m86HaNYw1xylPo7ZLUaSnQHUrcbi1koW/ZpmKfBv2O
 Ev1wHODGHqX7/RAGhtED+/c4BUkZDzkydw3MKNh24FYWTJYxjRjns2N0ZP0iDeICGUGZ
 YiMPWf+btt+fVCUE+C5UXLYVXfyPBbdgQGepcSjRmWHdcdazlsTK9kIik4wpdPvB548V
 3HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zBYJayEtUVpizMZqbs+7AWKpfm2CY2uMgJrF0P8X+Wc=;
 b=jMQwhIO11nxDCI85OblyEhB+UEIwlDbZOs9tUcF7VwxD264JvskZbWhCxT6RATu2B3
 WfBXCKLi4CrRG6q+W2YLTr/dLAU+wutiQTYeJGt6+dOLK8cfhGpgwnlaK4NwD4s+PLr8
 Z0uPGAfsO/tkSn0GF+MpAQvzY43kbOoBNIMFJP01LymNFM7erdj6SNCTBrsoSSXpW3Pk
 PxCVGCnGX76PKTZpvW3LZzz2bHzVHQvNzlNYYhajLBSWDaejT4jZeVZj6cwVHqh78hK+
 YLYGYOGVq61SMEOm+Gh1NrA4ua6QbaRNIy1IrAq/uXbmzh0WHMkWdd2kHoMZv9heuxLm
 0xmQ==
X-Gm-Message-State: AO0yUKW9RCrIHYhGpdjKYGFvKbwrLiekh9YKxlgbgdH0wsqCHSuObEqm
 dUqu+QQRFiHzni82RJwuOXPK+g==
X-Google-Smtp-Source: AK7set9F8Qvzq0OnHxecPUxEu56hJAj287BycES0JuQiGyh8xnFfDNihRX1f9goyOPMJdC50njgHrw==
X-Received: by 2002:adf:f386:0:b0:2bf:df72:fdf5 with SMTP id
 m6-20020adff386000000b002bfdf72fdf5mr8565800wro.28.1675445917510; 
 Fri, 03 Feb 2023 09:38:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e2-20020a5d5002000000b002c3be6ae0b1sm2461754wrt.65.2023.02.03.09.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 09:38:37 -0800 (PST)
Message-ID: <01d13cc2-f346-71a7-d941-2d1a0dc42514@linaro.org>
Date: Fri, 3 Feb 2023 18:38:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL v2 00/36] Testing, docs, semihosting and plugin updates
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson
 <richard.henderson@linaro.org>, Emilio Cota <cota@braap.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230202160109.2061994-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230202160109.2061994-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/2/23 17:01, Alex Bennée wrote:
> The following changes since commit 026817fb69414c9d3909d8b1a209f90180d777d6:
> 
>    Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into staging (2023-02-01 16:15:56 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stsquad/qemu.git tags/pull-jan-omnibus-020223-1
> 
> for you to fetch changes up to b3ca9646b9a5c44dfd110c5db9b4a8b8497de34e:
> 
>    gitlab: cut even more from cross-win64-system build (2023-02-02 13:25:27 +0000)
> 
> ----------------------------------------------------------------
> Testing, docs, semihosting and plugin updates
> 
>    - update playbooks for custom runners
>    - add section timing support to gitlab
>    - upgrade fedora images to 37
>    - purge perl from the build system and deps
>    - disable unstable tests in CI
>    - improve intro, emulation and semihosting docs
>    - semihosting bug fix and O_BINARY default
>    - add memory-sve test
>    - fix some races in qht
>    - improve plugin handling of memory helpers
>    - optimise plugin hooks
>    - fix some plugin deadlocks
>    - reduce win64-cross build time by dropping some targets
> 
> ----------------------------------------------------------------
FTR I'm now seeing this warning on Darwin/Aarch64:

C compiler for the host machine: clang (clang 14.0.0 "Apple clang 
version 14.0.0 (clang-1400.0.29.202)")
C linker for the host machine: clang ld64 820.1
Host machine cpu family: aarch64
Host machine cpu: aarch64
...
[1/3253] Linking target tests/plugin/libbb.dylib
ld: warning: -undefined dynamic_lookup may not work with chained fixups
[2/3253] Linking target tests/plugin/libinsn.dylib
ld: warning: -undefined dynamic_lookup may not work with chained fixups
[3/3253] Linking target tests/plugin/libmem.dylib
ld: warning: -undefined dynamic_lookup may not work with chained fixups
[4/3253] Linking target tests/plugin/libsyscall.dylib
ld: warning: -undefined dynamic_lookup may not work with chained fixups

