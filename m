Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DFC2311E3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 20:44:29 +0200 (CEST)
Received: from localhost ([::1]:45948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0UaS-0006PP-UB
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 14:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0UZQ-0005v3-QZ
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 14:43:24 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:38241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0UZP-0006HF-28
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 14:43:24 -0400
Received: by mail-ot1-x333.google.com with SMTP id t18so15649802otq.5
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=bU+o0lZupffZ7NPc4M3548lccrz0qfn5e0WUtTvftdM=;
 b=JUQZGeN6rHKQf2py5usiKna3UanZ4rHQ3Cn0cF2SkVZhyoxKWRXoX+PiOa4T6swBv7
 bq7uH9fqXAIEiz0VXcK618LEv+MLfGKRpUCRR71Hzik5EhqKV3yuKgcYFsgQ580Od+Il
 keTog6WGUOObokQgqO/j+r+XP2YXAwxqJsRnGZ6A/LC0xrMkIw/ebb5yN8yG3mZJT+Se
 2PuMuZ/RmOhiIQ+eKsT+UiQuDsdrDjE6XhGa+YmqcHaRrH3JiSz70HGQG7aBhNK3jMv5
 JpqJPQFzwdCrDOA/+ryxRD1qCX0HsOVHHBAKPDcvkQaE/Tvoly9lYYVQhzwdtdV0DG3y
 zRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=bU+o0lZupffZ7NPc4M3548lccrz0qfn5e0WUtTvftdM=;
 b=jaDxlFQVfA+xofMxh5RUvQNel6olmJlUqD28gMIyM+wDU7FCQFmDyPIQPtmoE0xiuo
 wiiVLfsLzuqiie87TlcSxnnbGuKEeWrW49WhgqTXa1xRx0ZZlErty7Eo9x2MDMOQXtH0
 BijNMLS2mZ+lRLFQVfV9jynyV3feG+3obt7XzsY8fdgbXC/qpqpYcHapRFlQG4JpJdrn
 h1DuuNkwTiYbEWDDCneRpnZ9Xs63tz+ynY6rdx7zEOCK/y9225GCXvc+dQySLvCuZSf3
 nZKPFE3i8SIwLfMeqLM81+8l/eQNdPuVCUyDFgGiXAhPry9hRb66+Qz73WRzjvimqEIk
 2uqA==
X-Gm-Message-State: AOAM532t47D0eCwVwoqQhogbpUtbAApA0/TgEXS2R8CJMjvQf2gNR2CI
 pZ0mT6yYUD7YOQg3OIZkv32e0O04W6wcQdVFuZMD6X7o
X-Google-Smtp-Source: ABdhPJyIKR91NBisT47o09FmWH/jsAm98JvVQ51LjF7xD/bNxwph3VdPDB/gzIo3CK319IL+rNFmmKmJWiQh3LE4LCo=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr25441642ota.91.1595961801451; 
 Tue, 28 Jul 2020 11:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200727151920.19150-1-peter.maydell@linaro.org>
In-Reply-To: <20200727151920.19150-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2020 19:43:10 +0100
Message-ID: <CAFEAcA_0=ERPa2v_Z9vi-3xUwYETPh9U67HJZCgHmfMtFWLVew@mail.gmail.com>
Subject: Re: [PULL 0/7] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x333.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Jul 2020 at 16:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Just some bugfixes this time around.
>
> -- PMM
>
> The following changes since commit 4215d3413272ad6d1c6c9d0234450b602e46a74c:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-5.1-20200727' into staging (2020-07-27 09:33:04 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20200727
>
> for you to fetch changes up to d4f6dda182e19afa75706936805e18397cb95f07:
>
>   target/arm: Improve IMPDEF algorithm for IRG (2020-07-27 16:12:11 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * ACPI: Assert that we don't run out of the preallocated memory
>  * hw/misc/aspeed_sdmc: Fix incorrect memory size
>  * target/arm: Always pass cacheattr in S1_ptw_translate
>  * docs/system/arm/virt: Document 'mte' machine option
>  * hw/arm/boot: Fix PAUTH, MTE for EL3 direct kernel boot
>  * target/arm: Improve IMPDEF algorithm for IRG
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

