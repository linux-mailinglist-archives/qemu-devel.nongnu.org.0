Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821EF44D578
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:02:25 +0100 (CET)
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7qa-000154-7S
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:02:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7pM-0007kT-6z
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:01:08 -0500
Received: from [2a00:1450:4864:20::32a] (port=35563
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7pK-0000ux-I1
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:01:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so6970312wme.0
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Ap1hB1r4cHIAeS9Yp6oaDnh91NsbhhwOMgvLjIuSNyo=;
 b=o4NHsA2Th6vGBLg2WAiSJexilRMSfwN123xKK96I01ZJ+YKl2am7kxYh0mjg91yJ3f
 /9qgUpYOGib5wKE8l+KU5IOHdBPCRPjRhVcbAk8UZcW+++Ya5OGu+xOVsUewEARSUJuH
 btMGp4YwNQCL/KbPjIWlFtl4Suc43mvTXPQM+z0yvpAbSWELcm6wr3YbMqp/QWFeEj3n
 efrKnjNWheW6j2+SmN9RcsA+wGLZdGKrzQsDh2zAZQjivTqqe9TpGmbeAKYwZgsR2Aw/
 7yYAKd6ED44V4OX/SK0nDaM5aJVyA/4Wb7sPoCcOLelbzEiRQLpJiUu8AvqiBBk/q/Ai
 aWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ap1hB1r4cHIAeS9Yp6oaDnh91NsbhhwOMgvLjIuSNyo=;
 b=OVvVQalZ9OOUtk+Jy18/9/6NAhDCZzUTF+1PS3srdFZZJ/cRFMjQvwIy7kaiy9SxdG
 OdL1Wn5gGEM54IxsJiqHqs1qTTuCNzbtzkVNzBD0XeR5IH2ruKei7TKFTpX2+wxRhYFO
 zXrhQdh7gJg6feZF9Me2PB5B+NJLOYpI/3EWa+ByYfx4o5ixvcz1pSILFh28jpHKdqV9
 qoTz2hj6CH3oDvTcqYQN7w2IZhCiU9HtvQNFs2iWuDidetI3S0U2gC0+XOOKGY7B8nWX
 QJZBZJismP62Eu7PCfVt10g9aNcr3bFiFRImUrNOmSpR5Skhu2adY76whyEdSzQulr15
 uiGQ==
X-Gm-Message-State: AOAM5323OJZmPH8EoJ1JH0eyEzj+wnpxefFqdCnzf/VPl9k4x+Vp0qRd
 jJyuOGnir1hAS2Kvv6w+ER51ECZlaZ4wYQdcWFI=
X-Google-Smtp-Source: ABdhPJweM3XpQNGzf+qoV7WvhoI86pKJ0qfbPAibIGNOKLZIoEL7/01fOrk/cBo3GesAPCLmTGajOA==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr7534597wmc.94.1636628464118; 
 Thu, 11 Nov 2021 03:01:04 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id n4sm3013646wri.41.2021.11.11.03.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:01:03 -0800 (PST)
Subject: Re: [PULL 0/5] x86, RCU/TCG patches for QEMU 6.2-rc1
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211111073607.195697-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70cb0e1c-ea1b-aa76-e698-99cd77c4470e@linaro.org>
Date: Thu, 11 Nov 2021 12:01:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111073607.195697-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/11/21 8:36 AM, Paolo Bonzini wrote:
> The following changes since commit 114f3c8cc427333dbae331dfd2ecae64676b087e:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/avocado-20211108' into staging (2021-11-08 18:50:09 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 2c3132279b9a962c27adaea53b4c8e8480385706:
> 
>    sgx: Reset the vEPC regions during VM reboot (2021-11-10 22:57:40 +0100)
> 
> ----------------------------------------------------------------
> * Fixes for SGX
> * force_rcu notifiers
> 
> ----------------------------------------------------------------
> Greg Kurz (2):
>        rcu: Introduce force_rcu notifier
>        accel/tcg: Register a force_rcu notifier
> 
> Paolo Bonzini (2):
>        target/i386: sgx: mark device not user creatable
>        numa: avoid crash with SGX and "info numa"
> 
> Yang Zhong (1):
>        sgx: Reset the vEPC regions during VM reboot
> 
>   accel/tcg/tcg-accel-ops-mttcg.c | 26 +++++++++++++++++++++
>   accel/tcg/tcg-accel-ops-rr.c    | 10 +++++++++
>   hw/core/numa.c                  |  7 ++++++
>   hw/i386/sgx-epc.c               |  1 +
>   hw/i386/sgx.c                   | 50 +++++++++++++++++++++++++++++++++++++++++
>   include/qemu/rcu.h              | 15 +++++++++++++
>   util/rcu.c                      | 19 ++++++++++++++++
>   7 files changed, 128 insertions(+)

Applied, thanks.

r~


