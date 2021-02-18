Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97431EA66
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 14:27:16 +0100 (CET)
Received: from localhost ([::1]:58776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCjKt-0003P6-BE
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 08:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCjJf-0002s3-JV
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 08:25:59 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCjJb-0003YQ-Ta
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 08:25:59 -0500
Received: by mail-ej1-x630.google.com with SMTP id hs11so5616819ejc.1
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 05:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=66Xe0wdwLOiVtijoNDlVQjMluxGkv1icNodP8oBBia8=;
 b=lwyn0TMuTMHWOLqrTQ+Z4jyYAF8w8jaFLoe6zmfk2OK2VYlw237fopIZKjVdrSQhVp
 CbIIYYTh2vTOZxwsMyLYGM1NYSJPsWepfBUttZ6bmEbddCYxcyrBK4YK8uyxJaFvFwRT
 5CrgloWqsCaf8oNMKqQMtBsgtC1Eq+H3GK9YRvtRoyIRq2wIkzeixUrHKm13ar6NAAU8
 QKQMkMPQqq9EM1GmIRkdjxVY5+h8xBBqtTjqqfaKgkpWTQGCLvhBh2uRS4vQBDI69bGj
 WF/h3WdCH3mKMEBaVTYXOpr85sYZcaaBJ3MoaAW+Ev6UuUYcLovRkZYj0i9k9zKm1+6q
 hIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=66Xe0wdwLOiVtijoNDlVQjMluxGkv1icNodP8oBBia8=;
 b=IrnN0Hia/1EzfhjXSX+3aDC8Gt/r/hTSLI2jPXAbLQAz4nMVHNnlmaTx6EPmJ0gPqz
 SbUpxy3Btc8ZYYzP4rBgO4wj5B8T4NtRnYnXpgm3Cbb40o9R7FmXs5emPAfPSNwnmgS6
 0/Oot3PCT6GvTYZ3zpBu6u41LEz1rW07Yb/W/6zng0iiUJQGa5cOUNAV3j5KUEdkKpKU
 zSV1b0tbX7xk39DrVw5IWuQ6tSg4QZWUcw58zDeadpZC4eGybha+PDZBlp5sbEzVkyRU
 TQSN12R3Oy5zZ7YyhCBncN8opJQOrXkTFyx1inFvMYOjs1zuYG7h6x0Kwh+C4JLKhV6x
 YrQQ==
X-Gm-Message-State: AOAM532LWFmZgdAvzLa7oWpWDsM/Kzy7TSJqCgZZMDFajelll0+6An1M
 07tioLWBOA3fb3050vSQpElNcJg4Zg+OATXUxUnIdg==
X-Google-Smtp-Source: ABdhPJyyJFcGmdDaO1LERAjsqpOvW3dGgjWuy55CjqVOBF+BblNAD+64fUaM2XCePaLyUiU4hJjuPVspz1iN3MlX0bo=
X-Received: by 2002:a17:906:4003:: with SMTP id
 v3mr442786ejj.382.1613654754328; 
 Thu, 18 Feb 2021 05:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2021 13:25:43 +0000
Message-ID: <CAFEAcA_aEtpfMScS3uzrpbBqAgqGWsWjeisUXCSpqdJJ7=uCYw@mail.gmail.com>
Subject: Re: [PULL 00/19] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Thu, 18 Feb 2021 at 01:59, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit 1af5629673bb5c1592d993f9fb6119a62845f576:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210216' into staging (2021-02-17 14:44:18 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210217-1
>
> for you to fetch changes up to d0867d2dad4125d2295b28d6f91fa49cf034ffd2:
>
>   hw/riscv: virt: Map high mmio for PCIe (2021-02-17 17:47:19 -0800)
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

Fails to compile, 32 bit hosts:

../../hw/riscv/virt.c: In function 'virt_machine_init':
../../hw/riscv/virt.c:621:43: error: comparison is always false due to
limited range of data type [-Werror=type-limits]
         if ((uint64_t)(machine->ram_size) > 10 * GiB) {
                                           ^
../../hw/riscv/virt.c:623:33: error: large integer implicitly
truncated to unsigned type [-Werror=overflow]
             machine->ram_size = 10 * GiB;
                                 ^~


-- PMM

