Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BF46474D3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 18:05:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3KJw-0004co-FU; Thu, 08 Dec 2022 12:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3KJV-0004c4-SW
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 12:04:02 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3KJU-0008RC-1z
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 12:04:01 -0500
Received: by mail-pf1-x432.google.com with SMTP id c7so1754471pfc.12
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 09:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tNmXQ1jY2P7WPGouFIzTSfGkUC7gPH5EBlqFcrSvwj0=;
 b=VpUJPYoDxIOKVAkOo8nW+r1XulrHDg7XmGaRKgomBWDlIc7nIndRmqU1xLjsGxcj9L
 Y1RY9CYOdh+H3uo80D72xm22EXTngxLMB+PUtMW5Y7UOJYy0b0YVsrIwJNkDr43uZ5if
 BZ3AtMin4UyTFrScKzjvzkpz7KqguxFLGKSH1mfr6iKEFgL1CZgswS7vRW92rBrRVoxI
 v155uFGyeR/X8HZApxG5xavwc2iGBPO9/rSDwC1RAL5noxUWwQxE25tiiPsormVMornR
 K57lyUNFyN2m1P66pZwSwmc10YH1V2i40DB5N3OxvCYyrHChNzaD82hzwt7nHPXSmZwF
 oWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tNmXQ1jY2P7WPGouFIzTSfGkUC7gPH5EBlqFcrSvwj0=;
 b=NRf0wZ4BTxCR3yJA8naH22WkuFunfMG2qr1Q05mHB3wi3A2N8ti9grZze/wgkd/PQ9
 XEur2QgUfpqbCul9dpOxEfINQMJTiKcBLkn5cyyp22X7UvTlvERgBEntLXSFKbgNn0JY
 tYVxc8W1c813+ry63WKg+EFpsZyqs9B37xTVVDojIBz7cUyWeMUj02f3/SVtrzpyHAeL
 L9H0ULsgxJo7GGEwek83aOYp5VnJMa6FobJOczfs0aAmQEqyt7yBjPubJHKhVVSng34a
 42vrGJFGdKUkUUKk+o3o3sj6oOkEymANUS8K299rWcvX5yMGGzDCCPpw04JojytXPaRt
 iHLg==
X-Gm-Message-State: ANoB5pmBnVH1A2FoyEvr17MTlptn+Zrk7khTn5RFbp99l3EbunjkCisW
 Z0LcjKhtbOt+G4iESNukNNTJ6aK/XvZ+iICFeV45fw==
X-Google-Smtp-Source: AA0mqf5vlQzjyDYZsJcpm0pjffCr59b1PLFpvEGzFTlmweGkmM+HQeUWq2K1XjGLQgKctLSfFcZMMzaqKqD4PfmD+ZI=
X-Received: by 2002:a63:d20d:0:b0:479:18a:8359 with SMTP id
 a13-20020a63d20d000000b00479018a8359mr3790755pgg.105.1670519035113; Thu, 08
 Dec 2022 09:03:55 -0800 (PST)
MIME-Version: 1.0
References: <166983457648.13115.4940680286975412418-0@git.sr.ht>
 <CAFEAcA8csAbbdvLoq+202CAQ0PLWdHaBTfADtqx33c=DNU-wSQ@mail.gmail.com>
 <c31be243-e380-eabd-f387-0b0923d4f6c1@gmx.de>
In-Reply-To: <c31be243-e380-eabd-f387-0b0923d4f6c1@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Dec 2022 17:03:43 +0000
Message-ID: <CAFEAcA88QfXmos_vCMGnDsmH7L22jtMz+-MRrMimObhDaFrwXA@mail.gmail.com>
Subject: Re: [PATCH qemu.git 0/1] hw/arm/virt: add 2x sp804 timer
To: Axel Heider <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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

On Thu, 8 Dec 2022 at 16:59, Axel Heider <axelheider@gmx.de> wrote:
>
> Peter,
>
> >> This patch adds timer peripherals to the arm-virt machine.>>
> > Is there a reason you can't use the CPU's built-in generic timer
> > device ? That is what typical guest code does on this system.
> > I'm a bit reluctant to add more devices to the virt board
> > because over time it gradually gets increasingly complicated,
> > and every new device model we expose to the guest is another
> > thing that's part of the security attack surface for guest
> > code trying to escape from a KVM VM.
>
> For the seL4 specific case, this is currently not possible in
> the standard configuration. It's only exposed for a special
> debug and benchmarking configuration.

It's not clear to me what you mean here -- the generic
timer in the CPU exists in all configurations, so there
should be no obstacle to seL4 using it.

> The catch we have here is, that the virt machine is a nice
> generic ARM (and RISC-V) machine for OS testing purposes also,
> but it sometimes lacks things (see my other patched for the
> UART). So, I wonder what would be the best option to continue
> here. Should we consider defining another generic machine
> profile that is more suited for the system emulation use case.
> This is what OS developer could use then. Or could the virt
> machine get some config parameters to customize it further.
> So the "Machine-specific options" would  support a "sp804=on"
> that would add two timer peripherals then?
>
> The really cool customization option would be passing a DTB
> to QEMU that describes exactly what "virt" machine is to be
> emulated.

This is a firm "no" -- it sounds on the surface like a good
idea but it doesn't actually work in practice -- DTB files
don't provide enough info to be able to build a board from,
except in some specific restricted situations like the Xilinx one.

-- PMM

