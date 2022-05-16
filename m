Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE327529552
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 01:32:28 +0200 (CEST)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqkCS-0004UG-0o
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 19:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqkAZ-0002xH-6k
 for qemu-devel@nongnu.org; Mon, 16 May 2022 19:30:34 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:47000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqkAU-0008St-Pz
 for qemu-devel@nongnu.org; Mon, 16 May 2022 19:30:28 -0400
Received: by mail-pf1-x431.google.com with SMTP id j6so15373577pfe.13
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 16:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=90AwIlCFax8BNMvTel1DHp8eQNF7ryxDE9zLvZNcpC8=;
 b=kWb2i8t+MyorO8AgoTXHcqkEROF5fZgCHP8Vc8P6dzc4F7W9ZfqLvhwQF2vrp/TJKg
 0yf7C0+TzJKXWkQQebKN/lYJdU9hbqzf6e+3rNAATfPNooJErkyyUqJ3QUxOOPjTvSFR
 oNRLoyNFMb3oJyTbQUGCim68wvjRyKiI4tFPwvqlE5TBGl+gNxCdZhi5guabOsYCpReu
 57Oj9eGoHlOu25FqXZH+EB0kJoCLyggzXw1smfHcltBllP5eKk1rFgreoxz6XsDWrGpv
 8bNchutRJIjjVl2hW8GwjBVl1PJ7UeozuCBP2NWbXZ7yywLMXILmxHB/NjhVf0cFxIZc
 EHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=90AwIlCFax8BNMvTel1DHp8eQNF7ryxDE9zLvZNcpC8=;
 b=w0LJDyd8WAX7g1j/xb5ZSsV2yHZ+lLb723w+JmEi0f6fIP5rnYm6AIwFPAe2Oi2Dtz
 CZRwFog9BGXONJZNmlrZ2sogpNkVUeAMwaoHxCQEdsI2Nkrw+4SRrYkcCmUX0rUjk6Ye
 2c/XeR/8QvkrNHpbpn4jymcGYFqjfkgKW//D5snPizsSu99OVB6OhF5Uzw8cf+MTk3qV
 aei8Qi2/Qy08B8I/Fsf9UhJzfFcZkfFHAxsYQnb7qaN7/t5gcFKoTb6AmC2kku+kpSmE
 VLbrmtHV4xRv3ONpGis5VhjvIQZU4/bve6AZveHbUR7cG/mETAYvTEwmgv9Xr1fv89Ns
 5O3A==
X-Gm-Message-State: AOAM532srCS6TLH+ET+i3N11mZCZPBVOT6gigzAGiy34ZmEfaolEV4MG
 HRf5JBA1hqWwBH5WnEoB7cBp2g==
X-Google-Smtp-Source: ABdhPJwNP6ubZODjM9lsvyNllPzVlLpUpqqYM3EjrnIsjS1xldqYzoIN5QUz1/Kww1u8o8HXs9Bi/Q==
X-Received: by 2002:a63:4f56:0:b0:3f2:779f:882d with SMTP id
 p22-20020a634f56000000b003f2779f882dmr4561986pgl.414.1652743823340; 
 Mon, 16 May 2022 16:30:23 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170902e54900b00161947ecc82sm1775617plf.199.2022.05.16.16.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 16:30:22 -0700 (PDT)
Message-ID: <dfb6fe1e-47c9-820f-7612-92c391b12884@linaro.org>
Date: Mon, 16 May 2022 16:30:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/23] Misc QEMU patches for 2022-05-16
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220516155603.1234712-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/22 08:55, Paolo Bonzini wrote:
> The following changes since commit 48de9b0916ef60d5a6bd6ca9288832deff8ee1ee:
> 
>    Merge tag 'linux-headers-v5.18-rc6' of https://gitlab.com/alex.williamson/qemu into staging (2022-05-13 09:45:17 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 8eccdb9eb84615291faef1257d5779ebfef7a0d0:
> 
>    configure: remove duplicate help messages (2022-05-14 12:33:45 +0200)
> 
> ----------------------------------------------------------------
> * fix WHPX debugging
> * misc qga-vss fixes
> * remove the deprecated CPU model 'Icelake-Client'
> * support for x86 architectural LBR
> * remove deprecated properties
> * replace deprecated -soundhw with -audio

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Ivan Shcherbakov (1):
>        WHPX: fixed TPR/CR8 translation issues affecting VM debugging
> 
> Konstantin Kostiuk (2):
>        qga-vss: Add auto generated headers to dependencies
>        qga-vss: Use the proper operator to free memory
> 
> Paolo Bonzini (11):
>        target/i386: introduce helper to access supported CPUID
>        crypto: make loaded property read-only
>        rng: make opened property read-only
>        soundhw: remove ability to create multiple soundcards
>        soundhw: extract soundhw help to a separate function
>        soundhw: unify initialization for ISA and PCI soundhw
>        soundhw: move help handling to vl.c
>        introduce -audio as a replacement for -soundhw
>        build: remove useless dependency
>        configure: remove another dead variable
>        configure: remove duplicate help messages
> 
> Robert Hoo (1):
>        i386/cpu: Remove the deprecated cpu model 'Icelake-Client'
> 
> Yang Weijiang (8):
>        qdev-properties: Add a new macro with bitmask check for uint64_t property
>        target/i386: Add lbr-fmt vPMU option to support guest LBR
>        target/i386: Add kvm_get_one_msr helper
>        target/i386: Enable support for XSAVES based features
>        target/i386: Add XSAVES support for Arch LBR
>        target/i386: Add MSR access interface for Arch LBR
>        target/i386: Enable Arch LBR migration states in vmstate
>        target/i386: Support Arch LBR in CPUID enumeration
> 
>   Makefile                        |   3 -
>   audio/audio.c                   |   8 +-
>   audio/audio.h                   |   1 +
>   backends/rng.c                  |  18 +--
>   configure                       |   5 -
>   crypto/secret_common.c          |  84 +++++-----
>   crypto/tlscredsanon.c           |  20 +--
>   crypto/tlscredspsk.c            |  20 +--
>   crypto/tlscredsx509.c           |  20 +--
>   docs/about/deprecated.rst       |  34 -----
>   docs/about/removed-features.rst |  28 ++++
>   hw/audio/intel-hda.c            |   5 +-
>   hw/audio/soundhw.c              | 136 ++++++++---------
>   hw/core/qdev-properties.c       |  19 +++
>   include/hw/audio/soundhw.h      |   5 +-
>   include/hw/qdev-properties.h    |  12 ++
>   qemu-options.hx                 |  51 +++----
>   qga/vss-win32/meson.build       |   2 +-
>   qga/vss-win32/requester.cpp     |   4 +-
>   softmmu/vl.c                    |  30 +++-
>   target/i386/cpu.c               | 331 ++++++++++++++++++++--------------------
>   target/i386/cpu.h               |  57 ++++++-
>   target/i386/kvm/kvm.c           | 113 +++++++++++---
>   target/i386/machine.c           |  38 +++++
>   target/i386/whpx/whpx-all.c     |  13 +-
>   25 files changed, 600 insertions(+), 457 deletions(-)


