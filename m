Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B703B9CE5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 09:23:53 +0200 (CEST)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzDWh-0004jl-Sv
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 03:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzDVR-0003em-5A
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:22:33 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzDVP-0004BH-DA
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:22:32 -0400
Received: by mail-ed1-x535.google.com with SMTP id x12so11923419eds.5
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3vufwc/SbFKOq6I0VQ78cainjQs2UEZFTA/Gp+jhvwI=;
 b=WBqS7lWVu0wrXOfYJDC3MA571OSOuKmPDUc7vAlOgDOj53DSzhKYIeyKog2wJMc/EZ
 8Vf7TWOXUK/UmKR3rf/lcAWreGBXWapFtVTzYUyGfU+FosLCLsLRwu4I9EiTihCFPUcs
 pVjbBm/4iihsWHTznJkpKT/4iIuEjZgI+Qf02DixhyO+AjhSP3lPuXouXH/SQqHNIgog
 uhM09durfk9qbRZMEsdeFa2cUjnIlNxiX7b2g2aMIlTtG1+567odUIBhOpRISYuTiPNi
 y598s8HIvPV8OuqcikIl+kAvRpYoB3jK2lP8JiLxlI2hkfIGHRZYqMPn11CVB5eitIUM
 GzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3vufwc/SbFKOq6I0VQ78cainjQs2UEZFTA/Gp+jhvwI=;
 b=mDjNy4edsmZGCcmXa4/mrXMByNk6w2wFh+Wu2s55WrBL0ll3TpjMJ7XlfU+TdRsZ7S
 EgoXNNVQcOuyT78IRttFjGyoUzHyvLQp2vCO5VlSYpQ8QwLQrzOXD3py5g0+ezquQvFG
 60rNcvqn0cmOY66+s/kIGv0FDlkI24/eg3cVCzF98S4S/7EEAUJyaKPuFu/1aGRp9uun
 sbZStN1ar16mW1xZKvgkg4Lj7F9Uzo3TO6IpuBUXauYS4kG2Ec08VUnquN1kDCCtVrAW
 TYmPG4Xp37AFVdhsCwfROoWclDxqKZwQ1NDu5fRGE2vDTP7FLLZ6VAJsCZUXZfTfkzOO
 O0bA==
X-Gm-Message-State: AOAM5330UoAbyHFkifQGIarNJQLsvDUquYcqtQLo3blWZeLa17ui8Bpy
 s9LnybVzWlwTyc9WhKgmOiTazVVpcfIsbZ+h0PtZGw==
X-Google-Smtp-Source: ABdhPJzqPWSGvKB/kM9fT5iaG9WFXQ/V1N09DmPAZ8mlbqC8fr8D79h7eFss6XlgU/I/GtU/Y3R/KdTfWi1ks3VMwSg=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr4945087edz.44.1625210549700; 
 Fri, 02 Jul 2021 00:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Jul 2021 08:21:51 +0100
Message-ID: <CAFEAcA_67Lcsoo=7ZMCekLzTEPpCU9TOzAcoNqKujPGCuzVg9w@mail.gmail.com>
Subject: Re: [PULL 00/63] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Jun 2021 at 20:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 13d5f87cc3b94bfccc501142df4a7b12fee3a6e7:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-axp-20210628' into staging (2021-06-29 10:02:42 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210629
>
> for you to fetch changes up to c86bd2dc4c1d37653c27293b2dacee6bb46bb995:
>
>   tcg/riscv: Remove MO_BSWAP handling (2021-06-29 10:04:57 -0700)
>
> ----------------------------------------------------------------
> TranslatorOps conversion for target/avr
> TranslatorOps conversion for target/cris
> TranslatorOps conversion for target/nios2
> Simple vector operations on TCGv_i32
> Host signal fixes for *BSD
> Improvements to tcg bswap operations
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

