Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15DE442DAF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:18:06 +0100 (CET)
Received: from localhost ([::1]:58180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsjt-0002bj-PI
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhruL-0000Jx-4G
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:24:49 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhruJ-0001Lk-8n
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:24:48 -0400
Received: by mail-qk1-x736.google.com with SMTP id bl12so4972754qkb.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fWv6MJRX8TcE+smNnRBlrbLF8rF683jby+AOAcDgw4I=;
 b=hcnWL59sjZHAAjihzlxoRGWACoT4VYB1znh3Np/Nr2OcOgwOOFDhcV9GHVMY3X17QH
 oYfSn1TGjLspiOi3R3WV/k5XpV1d/ALxBYMRblesG9/hK80gYF8XaSUYfoKUQesvTIv8
 8WqW+LcdRv3xtshfTVT1KNFn5BqUnEseiS+F1k7zUdw2eHtidcM2DFzjhbn5j3CeBgEE
 z0VArYgoMfnf+3blDRIVtgKXnhB33GWvdbH2KawO5dTG2Z8XNrsbwemJWeABsnlkTaXk
 ZxnEEZlFmgsKpHcs4Que/1bFZr9o3no9YwpidII2d9ElS0sLqRw3V0ZFd2ZAvosqhMf0
 X5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fWv6MJRX8TcE+smNnRBlrbLF8rF683jby+AOAcDgw4I=;
 b=NKwVXDmfknwL1Qbj4dsr3sWTDDEvI9fxQi3084qs+kRfQWfcjIkwzuGA4M8Ktiro8F
 Uoswgnesmy7Rk82HWVxViaQA6yW6cjChIZpsGJ7d9cUSfV0SdZxYDLnRoPgIjUhw8M76
 S572DLB84z/4RceNwdZqB/R/p5Tv1WmlRyfMoJtcM2omtn+oqTKx12xFXYRoAlHPoMyL
 u6KYiVLAGdgXY2Hq8QDZg8xDBxEhhwxwkksvotiG+JlfCl85zyQdauqsd5jGLSfpPGZF
 8+fLZQVLo7PZQc8/l0fkYbnOnyh9LWRBm4+4whjzE+3ZqsSvbHBjfM4/wn5nJyuXkPyx
 6P2Q==
X-Gm-Message-State: AOAM530crhGRBmhC6pnDEKNe8G3a86yocH6vseAFa55m5mxzCryRvRPP
 kphm9Z+aWRBfzKhFTbVQhez2II82LltA9g==
X-Google-Smtp-Source: ABdhPJwvsdtjuXRmi8djzIpPusKDPuUjribUZ5f3v3AXa5/O6dTAOT3KFCsLIAJrgBieQrJZ6Kc1ug==
X-Received: by 2002:a05:620a:4722:: with SMTP id
 bs34mr28130503qkb.28.1635852286212; 
 Tue, 02 Nov 2021 04:24:46 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id w5sm12822150qko.54.2021.11.02.04.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:24:45 -0700 (PDT)
Subject: Re: [PULL 00/10] Machine-next patches for 2021-11-01
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211101184259.2859090-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5af63e15-ab0e-ddd1-0d3b-50dce5109a92@linaro.org>
Date: Tue, 2 Nov 2021 07:24:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101184259.2859090-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 2:42 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On behalf on Eduardo (and with his blessing) this is the current
> machine-next patch queue.
> 
> The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into staging (2021-10-30 11:31:41 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/machine-20211101
> 
> for you to fetch changes up to 84436ec4b2b4c6c62f0ae8c911f8b982fedc0f4e:
> 
>    machine: remove the done notifier for dynamic sysbus device type check (2021-11-01 19:32:40 +0100)
> 
> ----------------------------------------------------------------
> Machine core patches
> 
> - Move GPIO code out of qdev.c
> - Move hotplug code out of qdev.c
> - Restrict various files to sysemu
> - Move SMP code out of machine.c
> - Add SMP parsing unit tests
> - Move dynamic sysbus device check earlier
> 
> ----------------------------------------------------------------
> 
> Damien Hedde (3):
>    machine: add device_type_is_dynamic_sysbus function
>    qdev-monitor: Check sysbus device type before creating it
>    machine: remove the done notifier for dynamic sysbus device type check
> 
> Eduardo Habkost (1):
>    machine: Move gpio code to hw/core/gpio.c
> 
> Philippe Mathieu-Daudé (4):
>    hw/core: Restrict sysemu specific files
>    hw/core: Declare meson source set
>    hw/core: Extract hotplug-related functions to qdev-hotplug.c
>    hw/core: Restrict hotplug to system emulation
> 
> Yanan Wang (2):
>    hw/core/machine: Split out the smp parsing code
>    tests/unit: Add an unit test for smp parsing
> 
>   meson.build                 |   4 +-
>   include/hw/boards.h         |  17 +-
>   hw/core/gpio.c              | 197 ++++++++++++
>   hw/core/hotplug-stubs.c     |  34 +++
>   hw/core/machine-smp.c       | 181 +++++++++++
>   hw/core/machine.c           | 199 +-----------
>   hw/core/qdev-hotplug.c      |  73 +++++
>   hw/core/qdev.c              | 234 --------------
>   softmmu/qdev-monitor.c      |  11 +
>   tests/unit/test-smp-parse.c | 594 ++++++++++++++++++++++++++++++++++++
>   MAINTAINERS                 |   2 +
>   hw/core/meson.build         |  35 ++-
>   tests/unit/meson.build      |   1 +
>   13 files changed, 1145 insertions(+), 437 deletions(-)
>   create mode 100644 hw/core/gpio.c
>   create mode 100644 hw/core/hotplug-stubs.c
>   create mode 100644 hw/core/machine-smp.c
>   create mode 100644 hw/core/qdev-hotplug.c
>   create mode 100644 tests/unit/test-smp-parse.c

Applied, thanks.


r~


