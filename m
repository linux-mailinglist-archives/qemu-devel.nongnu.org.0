Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E64CD81D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:40:01 +0100 (CET)
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQA2C-0000y5-GI
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ9lZ-00006L-MM
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:22:49 -0500
Received: from [2607:f8b0:4864:20::112c] (port=39998
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ9lX-0002EA-AC
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:22:49 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2dc0364d2ceso95179837b3.7
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 07:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i+hDWVlCPf4UJArNF+AYq1v6Mh8GXYGeU3bUdH/JN7s=;
 b=KJpdM8ZkG3Ej6ThrEKjFZr/b7DbMdGycnqsRkH8lwKO0xSmGqratyDfU2oRCKDa42U
 uPyNEtEni42ChkYEhCBe6fDaQ+JHQYo35x3aFndoVHF0gWreqwxou3zBX54TPZihBQjS
 XF8UbRpFSqovyO5od5hxc8z/O+Kz1m5yYO0RYMuGyRxhDMYrg8uY38OI5M0x/AJ2Tgdd
 zCV/LfZBusMMfu7o8CX3H9FT3NRcJyrIqiAZElZGNi8KkyyOPEnXJRk23tfcgU/ylNLr
 VsdrTrrc16xO7kq2IeW0njmGLHKAnpP75d3bz2fRU95tIHwvlyCEtoX1MY4dinw3QqbA
 X7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i+hDWVlCPf4UJArNF+AYq1v6Mh8GXYGeU3bUdH/JN7s=;
 b=boHWwll4N4hVxTbE5L6WQAeE/ksMcavqV1jqosOaaIWeIjQDgN+EHQ9ZKpZLI1MZTw
 7lgtp6OxVhw2Y3KggMZkBoQmbtaQ0+96GZRXf7ffHxEbzodtZ69LB8eZDFpKvLCoyGLv
 e0RZGxWyNoqwYhjpyDVkQWPn6b+dlaWcwc9ZNsAIK8YUEB3EPAPhdAVg8EAcXZOGVR4q
 mPSH/6aMjfOtrJXntKGLHbLP//oMZfS53GS6zqSPNue2+JC6cCIrcVfS4pR0y2YLSNq7
 83+K/t7ogfEfpbxA+6KHAv2YBuIeXWBNrjpNy589phe4kxygOxNP1PW0kLqW/axih98c
 msiA==
X-Gm-Message-State: AOAM532a9AjcAj9UrnYU7LkUBheqw9CDMkSwyy5y6ScSLcANoLqnyBXE
 T2f2BJBNLpqmAKXL+8VT5zQaZW1+b+S+gPLRFPLl6Z98xL2v3u3e
X-Google-Smtp-Source: ABdhPJyZlZM1KSs74JilQ1TQy1c6y+EOWlsAaHTfirNmAEmJTHEWafTBk9/8xlwjpE+Qk5ljG22ugFXu0QPmNLF6MEY=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr42314906ywf.469.1646407361368; Fri, 04
 Mar 2022 07:22:41 -0800 (PST)
MIME-Version: 1.0
References: <20220303205944.469445-1-richard.henderson@linaro.org>
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 15:22:30 +0000
Message-ID: <CAFEAcA8EWNdCa7cAaVKQpuuj+0-KLfYaybjjQYUtyy+k7MVrSw@mail.gmail.com>
Subject: Re: [PULL 00/30] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 20:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 36eae3a732a1f2aa81391e871ac0e9bb3233e7d7:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-migration-20220302b' into staging (2022-03-02 20:55:48 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220303
>
> for you to fetch changes up to f23e6de25c31cadd9a3b7122f9384e6b259ce37f:
>
>   tcg/loongarch64: Support TCG_TARGET_SIGNED_ADDR32 (2022-03-03 10:47:20 -1000)
>
> ----------------------------------------------------------------
> Reorder do_constant_folding_cond test to satisfy valgrind.
> Fix value of MAX_OPC_PARAM_IARGS.
> Add opcodes for vector nand, nor, eqv.
> Support vector nand, nor, eqv on PPC and S390X hosts.
> Support AVX512VL, AVX512BW, AVX512DQ, and AVX512VBMI2.
> Support 32-bit guest addresses as signed values.
>

This causes the linux-user tests to fail on the aarch64 host:
https://gitlab.com/qemu-project/qemu/-/jobs/2163919769

All the qemu-i386 invocations fail like this:

timeout --foreground 90
/home/gitlab-runner/builds/CMuZxyfG/0/qemu-project/qemu/build/qemu-i386
sigbus > sigbus.out
qemu-i386: Unable to reserve 0x100000000 bytes of virtual address
space at 0x8000 (File exists) for use as guest address space (check
your virtual memory ulimit setting, min_mmap_addr or reserve less
using -R option)

The build-oss-fuzz test also failed with a timeout, but it
has a habit of doing that so could be unrelated to these changes:
https://gitlab.com/qemu-project/qemu/-/jobs/2163919743


thanks
-- PMM

