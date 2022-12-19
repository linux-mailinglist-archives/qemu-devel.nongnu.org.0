Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74D650E58
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7HoD-0002h1-R5; Mon, 19 Dec 2022 10:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7HoB-0002cE-CD
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:12:03 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7Ho9-0000pw-3a
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:12:02 -0500
Received: by mail-pf1-x433.google.com with SMTP id a14so6472313pfa.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 07:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bG0Ng5S7ud/zGGFmoR7DwEaj2aI2xNchrGfj1ocHwyw=;
 b=c3jTUh7djpC8lfXPVPM75ZtCqFct8QtWB3umL55fkhGTa+MWsQESyYKdWq7ldgh3Mh
 teqAAty1O7YpFJEhq9mxvV/GcaqGTeFULSIxcCJWebkoLVYtNWdmXTq0oCj7rb4q4Rqt
 FAxYH9VqBjuAlF1VUFYrYixLn973LE9zWI69vYqYK5TO6hpR7XB8u6O+ebndna5irhws
 4OnvQc6Faod9zcn4wRXohnQhV5obB9Uiw+JCeZC5QV5+iU3gQTDrSUlCYF6sUMbppB8y
 24Iefcljf6Jp3lwXpcnwtPwxELApYEuEXAITzKdxWVJEI8vU3vIU4nIy5lNbZnQ4ODYW
 NuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bG0Ng5S7ud/zGGFmoR7DwEaj2aI2xNchrGfj1ocHwyw=;
 b=W1z4WxABUYkF7LaciVI4sh3lQk8TcCtn0gSPPWnzmkmCT1OuOBbex9fZOSuJLIcc2d
 BNkEN+6j2teNERGKgm/l0Jct480zwzo6GSKLg4KYQyrLMam/wHuq4gQXs92bV9XEaGqy
 55KHhMpUciWUvwo/uONon0bAsAfYQ2Szn/W6RIDCiu6jrg5f0fECTBcXXb6k1tnDlY4W
 TKC/MKbwfoenZ8Fn9041QmNW8mnY1WkfIEnkwMYpF3ioCnaGtjmUrSn3nrp9OdvV/xJq
 K5YIHqNrl7ykjUjoFruZ6xDhVsq9GwgcV6BvjjqgR9TsLTbbfo7Un06DVD3QPLKxN7CF
 HQGg==
X-Gm-Message-State: ANoB5pmk9SUnhDypPKlFCVTvuvHmU7WcUfOpCvX4YArHy9AXb09Oi7qT
 kbIj4aZNiHzVk/UdICrfZDbIEUd5/kaUXkEXO5bUwg==
X-Google-Smtp-Source: AA0mqf6WmxhsUD6pEfV1Mst1yWzymS+IjBRTO9o0DOMiehEpMxMRHLVur9kSxCyR1a6zbOXkXv+pc3c9nOKgwxbLGHs=
X-Received: by 2002:a63:c149:0:b0:477:86c1:640f with SMTP id
 p9-20020a63c149000000b0047786c1640fmr2149005pgi.231.1671462719754; Mon, 19
 Dec 2022 07:11:59 -0800 (PST)
MIME-Version: 1.0
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 15:11:48 +0000
Message-ID: <CAFEAcA-yvQCGRURDBDLkgLgS2bxY-_Jat_2v-gDGde74eELRZg@mail.gmail.com>
Subject: Re: [PULL 00/45] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 19 Dec 2022 at 02:29, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit 562d4af32ec2213061f844b3838223fd7711b56a:
>
>   Merge tag 'pull-loongarch-20221215' of https://gitlab.com/gaosong/qemu into staging (2022-12-18 13:53:29 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-20221219-3
>
> for you to fetch changes up to e59b3c6ece6a1351aeca6b916cd9674e23d15e89:
>
>   hw/intc: sifive_plic: Fix the pending register range check (2022-12-19 10:42:14 +1000)
>
> ----------------------------------------------------------------
> First RISC-V PR for QEMU 8.0
>
> * Fix PMP propagation for tlb
> * Collection of bug fixes
> * Add the `FIELDx_1CLEAR()` macro
> * Bump the OpenTitan supported version
> * Add smstateen support
> * Support native debug icount trigger
> * Remove the redundant ipi-id property in the virt machine
> * Support cache-related PMU events in virtual mode
> * Add some missing PolarFire SoC io regions
> * Fix mret exception cause when no pmp rule is configured
> * Fix bug where disabling compressed instructions would crash QEMU
> * Add Zawrs ISA extension support
> * A range of code refactoring and cleanups

Hi -- gpg says your key expired last week. What keyserver can I
download the updated key from, please ?

thanks
-- PMM

