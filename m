Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA1C47E8D1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 21:38:25 +0100 (CET)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Ur2-0004He-AG
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 15:38:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UpK-0003DW-0g; Thu, 23 Dec 2021 15:36:38 -0500
Received: from [2607:f8b0:4864:20::82c] (port=33719
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UpI-0008Tt-6v; Thu, 23 Dec 2021 15:36:37 -0500
Received: by mail-qt1-x82c.google.com with SMTP id v4so3335566qtk.0;
 Thu, 23 Dec 2021 12:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x3/N/dYaJR5XXppMVzYeDisR3xsyrK+uB89MhRhSOUo=;
 b=YQs/uFwqE/zinMuZkyIgtdLL41GFb3dmhdF9Svq7Ffl1CMiii+N3bq/V27PVYol6Kj
 sBwUpu6tEcB8UNUFlG6gqkIdyHk+VHmuELJ94X+bFmCeWcF97OLR3mdOtZ5HEkckcgNt
 lO55ps9rsWEvjirZUQLPKjruxZrhYCDzLsEC2vkGYoo1cd4BPwIRttDFeeaTDiXYfuEe
 gIBOnvcVHlYaV4njcGkJJ2ORYgHHxrnYpYvVi15CO7W9MDU4VxS3a6uR5GQ9kLwqiyFx
 VamSvmwOjWGLghFwFfy936ehyWV+g1SwRpag9mSjrnYN8Ed1xRuocIFtCsQas3tUhPRj
 kvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x3/N/dYaJR5XXppMVzYeDisR3xsyrK+uB89MhRhSOUo=;
 b=0e70ZMJFsY+MDZn1O7zc955+WKx9TikBsWSvqmKTL1AFY/yyp+GhIvmOgkcM0kcsu/
 K1gGs5d+pEwINyuRHb6lTuxmP4bx+xoYyg2LaABQOG83sIprxNyzO++s6QPzObvctFCI
 a94mJg7z7ecgbPd5kFphHKL9aebWfR8cbZ3QWoHUnwKgpIV06lN5/iyv0wskpye4WFpU
 epZeEG3PolgEz5IAj5UarfOs3NI0Sqod6Dx12swIEcdBvY88PdNdQz+cQQOfeG9UB3Oe
 tqRlsINDI5550FJjriMsTkuHnwlT7yJsMqiSlH0jrkP3ZvK84Q2hI2eXTqZ6yt8coSTw
 1lmA==
X-Gm-Message-State: AOAM531s0SlMLsKjr5exMjjxARL1Q8Q/H9XeLLNvD2DiWEPMODh2VkTU
 8KAQLzLG9/5oGasyaBQGASM=
X-Google-Smtp-Source: ABdhPJyvKkzlrSna7BSwIKgoK2SMBAEGN+uYSs7nioop2o5EK/IzE7LsBbYE0f9oyJGB2emRfRq1fQ==
X-Received: by 2002:a05:622a:1a1c:: with SMTP id
 f28mr3140372qtb.308.1640291794954; 
 Thu, 23 Dec 2021 12:36:34 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:7ce4:b718:2cc0:32df:97ee?
 ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id w8sm5068212qtc.36.2021.12.23.12.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 12:36:34 -0800 (PST)
Message-ID: <1b988844-075d-beb3-7fd1-a26f30e9f5dc@gmail.com>
Date: Thu, 23 Dec 2021 17:36:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/3] Reorg ppc64 pmu insn counting
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211223030149.1947418-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/23/21 00:01, Richard Henderson wrote:
> In contrast to Daniel's version, the code stays in power8-pmu.c,
> but is better organized to not take so much overhead.
> 
> Before:
> 
>      32.97%  qemu-system-ppc  qemu-system-ppc64   [.] pmc_get_event
>      20.22%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc
>       4.52%  qemu-system-ppc  qemu-system-ppc64   [.] hreg_compute_hflags_value
>       3.30%  qemu-system-ppc  qemu-system-ppc64   [.] helper_lookup_tb_ptr
>       2.68%  qemu-system-ppc  qemu-system-ppc64   [.] tcg_gen_code
>       2.28%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
>       1.84%  qemu-system-ppc  qemu-system-ppc64   [.] pmu_insn_cnt_enabled
> 
> After:
> 
>       8.42%  qemu-system-ppc  qemu-system-ppc64   [.] hreg_compute_hflags_value
>       6.65%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
>       6.63%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc
> 

Thanks for looking this up. I had no idea the original C code was that slow.

This reorg is breaking PMU-EBB tests, unfortunately. These tests are run from the kernel
tree [1] and I test them inside a pSeries TCG guest. You'll need to apply patches 9 and
10 of [2] beforehand (they apply cleanly in current master) because they aren't upstream
yet and EBB needs it.

The tests that are breaking consistently with this reorg are:

back_to_back_ebbs_test.c
cpu_event_pinned_vs_ebb_test.c
cycles_test.c
task_event_pinned_vs_ebb_test.c


The issue here is that these tests exercises different Perf events and aspects of branching
(e.g. how fast we're detecting a counter overflow, how many times, etc) and I wasn't able to
find out a fix using your C reorg yet.

With that in mind I decided to post a new version of my TCG rework, with less repetition and
a bit more concise, to have an alternative that can be used upstream to fix the Avocado tests.
Meanwhile I'll see if I can get your reorg working with all EBB tests we need. All things
equal - similar performance, all EBB tests passing - I'd rather stay with your C code than my
TCG rework since yours doesn't rely on TCG Ops knowledge to maintain it.


Thanks,


Daniel


[1] https://github.com/torvalds/linux/tree/master/tools/testing/selftests/powerpc/pmu/ebb
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg00073.html

> 
> r~
> 
> 
> Richard Henderson (3):
>    target/ppc: Cache per-pmc insn and cycle count settings
>    target/ppc: Rewrite pmu_increment_insns
>    target/ppc: Use env->pnc_cyc_cnt
> 
>   target/ppc/cpu.h         |   3 +
>   target/ppc/power8-pmu.h  |  14 +--
>   target/ppc/cpu_init.c    |   1 +
>   target/ppc/helper_regs.c |   2 +-
>   target/ppc/machine.c     |   2 +
>   target/ppc/power8-pmu.c  | 230 ++++++++++++++++-----------------------
>   6 files changed, 108 insertions(+), 144 deletions(-)
> 

