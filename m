Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB1232EEC4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:26:24 +0100 (CET)
Received: from localhost ([::1]:33332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICLP-0003Ep-Sf
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lICAu-0004KS-Hf
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:15:32 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lICAs-0001wQ-Nk
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:15:32 -0500
Received: by mail-ej1-x62e.google.com with SMTP id mm21so4087720ejb.12
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GSLgNrQVjw2IjLFlvKdTX78KML1nofsxp5fPAu6sdWU=;
 b=Wdhtix8g69AGpw8+g3Y4v/C9AYeJm5aJbK1g5eZHjNYtmNB8Dq6OfEmQfVL8rP4+6X
 2k5Hx1nXWFojgnw+FsPcshiSaXSxDOt1rLAqUFCKi9onSU5fXwovQYyCD8a8SVcGnvr0
 tBLeHI9Eq0k4wEDHIi5tbSiFy14tvrzx46DB3WlegkJCGCkEihd+DP9ZOAbmrzmj3vE1
 yNNL/fDH+ttJ4F7j9DPp2/qSn2SedjnVUKZZRuBZaDQ74r1uGGh2cx8/FH8yBAiwRpim
 zjKTWpgByF1/Nyy/QHrUSFi/PCgtbUc8bEQWHGwPi8Ai14SoJccm3YJewZH4nD0s3IsV
 QJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GSLgNrQVjw2IjLFlvKdTX78KML1nofsxp5fPAu6sdWU=;
 b=CtxM1PhyIjXN3pCrwatGu8aHhKggnimUJoA+2Od1UsjwlexPEY7sGsP8ehnDcxvZ3/
 ZcJCGQSYnEfP6beTB3Dr1DRQ2ZlDI16tp70erAdUDB+bD0RIZW7yv8aexHPJ1R0pMCg6
 q4OQHkCEUaN6FrgNZ2cCQ1qQPo6OZUeYzLKOe0OTj79/iPiISX4JiHiOPGgo5Nc8YoMe
 xS2vaffuk8ESTQxzjCfmjjVFG3g1Lvl5r9NBr1fvJvFBDC5yQ2tL1Axcd0N/HDouYiUf
 J9M2952SpdZeJCMeID+vQd7m5ufvRczusAMgP+N2K8tlLsb1P0kKrEwlo52HHLlYwcQr
 hVJQ==
X-Gm-Message-State: AOAM530yfoBGbDoi63auPpGMszKiyRzx57ggYIs6N14oJBPP06TKRYDW
 Zp1Wc3tDQSrxS9HB+gyRKhMn9nMRrzBE0MV10QAeXRCTXOY=
X-Google-Smtp-Source: ABdhPJyeiyx1TzjcrIhpKdqYvzxwZ/o9TBgfv8CbuByofS+d7jWoXLFa5iKU3P3/OgBGu/RcX3HJCWE7kvnTov71Hu8=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr2708260ejb.56.1614957328513; 
 Fri, 05 Mar 2021 07:15:28 -0800 (PST)
MIME-Version: 1.0
References: <20210304144651.310037-1-alistair.francis@wdc.com>
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 15:15:12 +0000
Message-ID: <CAFEAcA8bBzmaKmFTv-SZJa-wtPfcDh6a5uG7GwPxd_tOW_huhQ@mail.gmail.com>
Subject: Re: [PULL v2 00/19] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Alistair Francis <alistair23@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 at 14:47, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit cb90ecf9349198558569f6c86c4c27d215406095:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210304' into staging (2021-03-04 10:42:46 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210304
>
> for you to fetch changes up to 19800265d407f09f333cf80dba3e975eb7bc1872:
>
>   hw/riscv: virt: Map high mmio for PCIe (2021-03-04 09:43:29 -0500)
>
> ----------------------------------------------------------------
> RISC-V PR for 6.0
>
> This PR is a collection of RISC-V patches:
>  - Improvements to SiFive U OTP
>  - Upgrade OpenSBI to v0.9
>  - Support the QMP dump-guest-memory
>  - Add support for the SiFive SPI controller (sifive_u)
>  - Initial RISC-V system documentation
>  - A fix for the Goldfish RTC
>  - MAINTAINERS updates
>  - Support for high PCIe memory in the virt machine


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

