Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC41483831
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 22:07:45 +0100 (CET)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4UYS-0000q2-CK
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 16:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4UXP-0008VJ-V7
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 16:06:39 -0500
Received: from [2607:f8b0:4864:20::432] (port=38566
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4UXO-0006hs-BH
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 16:06:39 -0500
Received: by mail-pf1-x432.google.com with SMTP id b22so30399853pfb.5
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 13:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7+dZ3ZSQrS43A9nYa9GAeyuoSsSdaNrmGqIZGZNVgvY=;
 b=OUZroicLHbR5IoQuyH7u0k+0vooa/LXTW2iP3OKZeNZkK6OXHUfzu2/QewR46gaiCm
 ginCtXffE8IAccC+l7F/ComTCgkFHfUPLvCnfDlq2KTIIay8ElslOMboXYPfo2fb8HnP
 Et6eZXDMD6DGqNR1UWiprOjB5N0c1j7tXyNIq2ii/AK2uSpbRz7YMOhSL0WDM78IgMrZ
 Iq8hGuikp3tQDi64hUMyYLRN2OWcpiyJcFibEk7tTC6uyTkTRFA35dqavfER7Y+hQ68g
 fDP8gvWteuKnfDrgqgRcOAzyrsP/ctHjYp2ASQDRjlXmE16ZCgz4xmY2TlnsNt1YijaQ
 PsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7+dZ3ZSQrS43A9nYa9GAeyuoSsSdaNrmGqIZGZNVgvY=;
 b=dnmASKRYQ0p50Q6wXjTARIZEIylcIWyRfhJ8WMV4zUnmiDmJmBVBUHXQM44bWXpd5Q
 YcpJ5M8RUmFfmCLcwAqxVb6Xrx3TRgKqbLVUAxDk0ukwJPO/S+jUqheDR3Ohdkr7mpCT
 CMSwfH/n2a96lmMfLf3fZTUiXNVDD8BWdVRIpFJWn+fR3onfRxeit8oSz3voaV57LZL4
 kezYGB2p6XlTzEoznYK7jYKp7WCqY0WMxw32aAthjPmkL2+tJAoM3xZbem3NK8K8IHyH
 MsHd31kT/cP25axgRAQhz0ktHVwTla3fXLlXS7DAaCaaZtguWgHD7uo7I9buhUI/HpZY
 P0Aw==
X-Gm-Message-State: AOAM5306jVvKTqMvFK+cc8yNv4rhopUGSRrY16ct+k2qEdSLwpHfvKYr
 iqMOs51sSpFZe/pQvmNqUesEJ0v+E8uhdg==
X-Google-Smtp-Source: ABdhPJyH4bO7ipt2qsLqYnIg1t0CJamVAKkDEgimSZ01yKCFNxK42FgU7MMKkBEvz6fXb4JxBqWaSQ==
X-Received: by 2002:a63:8141:: with SMTP id t62mr42747349pgd.548.1641243996856; 
 Mon, 03 Jan 2022 13:06:36 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id mh3sm43491985pjb.26.2022.01.03.13.06.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 13:06:36 -0800 (PST)
Subject: Re: [PULL 0/5] Misc patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220103173326.257152-1-richard.henderson@linaro.org>
Message-ID: <0bcaeca6-8c11-8ad1-06c4-8f48d8f321f1@linaro.org>
Date: Mon, 3 Jan 2022 13:06:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103173326.257152-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 9:33 AM, Richard Henderson wrote:
> The following changes since commit 69f153667fce723ee546d2f047d66d0cfa67c3cc:
> 
>    Merge tag 'memory-api-20211231' of https://github.com/philmd/qemu into staging (2021-12-30 17:02:42 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-misc-20220103
> 
> for you to fetch changes up to 5c23f0c3191907000bab278654570a7d5879822a:
> 
>    gitlab: Disable check-python-tox (2022-01-03 08:55:55 -0800)
> 
> ----------------------------------------------------------------
> Fix some meson conversion breakage
> Disable check-python-tox
> Fix emulation of hppa STBY insn
> 
> ----------------------------------------------------------------
> Richard Henderson (5):
>        meson: Unify mips and mips64 in host_arch
>        tests/tcg: Use $cpu in configure.sh
>        tests/tcg: Unconditionally use 90 second timeout
>        target/hppa: Fix atomic_store_3 for STBY
>        gitlab: Disable check-python-tox
> 
>   configure                      |  2 +-
>   meson.build                    |  2 +
>   target/hppa/op_helper.c        | 27 +++++++------
>   tests/tcg/hppa/stby.c          | 87 ++++++++++++++++++++++++++++++++++++++++++
>   .gitlab-ci.d/static_checks.yml |  2 +
>   tests/tcg/Makefile.target      | 12 +++---
>   tests/tcg/configure.sh         |  2 +-
>   tests/tcg/hppa/Makefile.target |  5 +++
>   8 files changed, 118 insertions(+), 21 deletions(-)
>   create mode 100644 tests/tcg/hppa/stby.c

Applied.

r~


