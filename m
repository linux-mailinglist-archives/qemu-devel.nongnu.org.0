Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058C0401061
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 16:47:27 +0200 (CEST)
Received: from localhost ([::1]:33640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMtQc-0001Rd-2a
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 10:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMtOP-0007bh-S6
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:45:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMtON-0002Mh-Tn
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:45:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so3087040wmn.4
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ejt6oNm3ZdGgFwOI5M651qGFtQ91mTz6Nj34y/AeS2M=;
 b=px3ozMlwtubD8v2+CYhJYp/veHM0yxvyFcu/0nX22RNo5oNN+D9QNVZYTCaRzN30Uk
 /csYBrvveyS974ljlWCLehOtLOzxFV2mz+2/LRoPlOvNnZXO4d+cbY42GcEhJaAXdIzW
 b8hZMUAq+a2cn+Us8v3OyxY6iLCqgCDXTqT1JdjEzSrFPmVqrhhKiv7hrIzTXz5u1MZs
 Om0BKkCK1dPbEMab3YTVTz0EVKeaPY2ftUZDv+2aQtGaoJa3o1YZTTx7F6EWC3m/iL+L
 V3S2ZmTtc6CryUJIjm25vDgUgSIwvAV7R7aGT1H/bYqBFpHZAnYnbrULA5mB2Wd1+u5U
 DMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ejt6oNm3ZdGgFwOI5M651qGFtQ91mTz6Nj34y/AeS2M=;
 b=M5SxcsJeGqETR5fIZoZMY1dXhWEWUhsijj+ty7vi4Vxs3K0rbAtlEMG9c7BQkoWiFm
 pLHagtltERyt03XjOLSdHZCpG1jFQ9AIvn8WF++i51LjaxzaEpl1JE7QliykUZULCgXD
 o7vSyWlGICr+Pg1+TTr7zDIsWNQ6aMOBNkuqIfn6e9nVzyXf+/hnz1yAFbjcJyutrAV8
 Qz2eoRO32/ipE7O4lL7nao8OO12RiDZtSH7mS3ARiq1rvn0gSPU7VWffM6xu1BuBOaM8
 LMyc5fjLMcgH1y96+ZaAo9Smijd4HQdjksQmPmxgv9xdOUadFxh/J74+/8KMBa3jsUrP
 6DhQ==
X-Gm-Message-State: AOAM532IivxfDm0RMcNefUdjBusdYvFU9+qLz7qjFj96Ven8JqU1+3+Z
 a8/XGqWU6CLElkikD0UH/DxqexUu6jIQtUga+JB09g==
X-Google-Smtp-Source: ABdhPJymV2pA2JyvFqAqGhLjCOX8OiBOGEE6LOIAYE988uLqWkrNqH+y5VRL2L/F5+eVeTDSAbYhNIrqAI8bM35n4HQ=
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr7370658wmq.32.1630853103834; 
 Sun, 05 Sep 2021 07:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <YTPIdbUCmwagL5/D@os.inf.tu-dresden.de>
In-Reply-To: <YTPIdbUCmwagL5/D@os.inf.tu-dresden.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 5 Sep 2021 15:44:14 +0100
Message-ID: <CAFEAcA_UVbxP59XF4XRYNRrtcYmAH2u066xZOcTnnwx0Ote=bw@mail.gmail.com>
Subject: Re: arm: Launching EFI-enabled arm32 Linux
To: Adam Lackorzynski <adam@l4re.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

On Sat, 4 Sept 2021 at 20:26, Adam Lackorzynski <adam@l4re.org> wrote:
> while trying to launch an EFI-enabled arm32 Linux binary (zImage) I
> noticed I get an undefined instruction exception on the first
> instruction. Now this is a bit special because Linux uses a nop
> instruction there that also is a PE file signature ('MZ') such that the
> CPU runs over it and the file is still recognized as a PE binary. Linux
> uses 0x13105a4d (tstne r0, #0x4d000) as the instruction (see also
> arch/arm/boot/compressed/head.S and efi-header.S in Linux).
> However, QEMU's instruction decoder will only recognize TST with bits
> 12-15 being 0, which this instruction is not fullfilling, and thus the
> undef exception. I guess other CPU implementations will allow this
> encoding. So while investigating I was doing the following to make Linux
> proceed. I also believe this was working in a previous version of QEMU.
>
> diff --git a/target/arm/a32.decode b/target/arm/a32.decode
> index fcd8cd4f7d..222553750e 100644
> --- a/target/arm/a32.decode
> +++ b/target/arm/a32.decode
> @@ -127,7 +127,7 @@ ADD_rri          .... 001 0100 . .... .... ............       @s_rri_rot
>  ADC_rri          .... 001 0101 . .... .... ............       @s_rri_rot
>  SBC_rri          .... 001 0110 . .... .... ............       @s_rri_rot
>  RSC_rri          .... 001 0111 . .... .... ............       @s_rri_rot
> -TST_xri          .... 001 1000 1 .... 0000 ............       @S_xri_rot
> +TST_xri          .... 001 1000 1 .... ---- ............       @S_xri_rot
>  TEQ_xri          .... 001 1001 1 .... 0000 ............       @S_xri_rot
>  CMP_xri          .... 001 1010 1 .... 0000 ............       @S_xri_rot
>  CMN_xri          .... 001 1011 1 .... 0000 ............       @S_xri_rot
>
>
> Any thoughts on this?

If your guest code is relying on bits [15:12] in the TST (immediate)
Arm encoding being non-zero then it is broken. In the v8A Arm ARM
DDI 0487G.b, section F5.1.262, these bits are noted as "(0)", which
means RES0, should-be-zero. In F1.7.2 this is described as meaning
that if the bit is 1 then the behaviour is CONSTRAINED UNPREDICTABLE,
and can be result in any of:
 * UNDEF (this is what QEMU chooses)
 * NOP
 * executes as if the bit were 0
 * any destination registers become UNKNOWN

This was true also for v7A. Even back as far as ARMv5 these bits
are marked as "SBZ" (should-be-zero).

Since this is all in the UNPREDICTABLE zone, there are presumably
some CPUs that do execute this insn as either a NOP or ignoring
the incorrectly set bits; but I would not be surprised if there
are also some CPUs that behave like QEMU and UNDEF them.

Looking at the code where this is used, I think it probably
needs to abandon the goal of having the insn be a true
or nearly-true NOP. Since this is the first insn the kernel
executes, it doesn't really have to be a NOP, as long as it
doesn't trash the registers where the bootloader passed it
information (r0, r1, r2).

Unless there are other undocumented constraints on this
instruction pattern, you might try
  0xe2255a4d   ; eor r5, r5, 0x4d000

That's not a NOP on its own, but if you use it twice
in a row then it is, and you can make sure the use in
head.S arranges to put two of those and then revert to
more normal-looking NOPs for the rest of its run of NOPs.

(This doesn't work for CONFIG_THUMB2_KERNEL, but neither does
the current insn pattern I think.)

thanks
-- PMM

