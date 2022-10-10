Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C8C5F9F52
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:23:53 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohsl6-0006Bk-Oq
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohsgO-0002R8-RB
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:19:00 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohsgM-0002lx-4u
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:18:59 -0400
Received: by mail-pl1-x634.google.com with SMTP id l4so10356977plb.8
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 06:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VNmKvjs0yhbDrxDv/9vSERVwwBL+HckugvIkF9wNoCs=;
 b=tJotEwSFaCixPBFon/KrfbbAQJicbe+1NhHNKHjpagEW2wE8VRWybt6HCko3pAJCtJ
 NKF+uwfG0CXueB/4hWAEx0QsA7IHmfGyZT4yEKuppI8AA0eTzluImD506R9SzadRt1R2
 CTkV51Wrn9I8d2AOw6H9u3wRWoQzqVAY/sicei2VSlMqILAnu9XPYhfocH132QucNwaG
 ExC8cODWhisgFyjBKRaMKydaLWrJcbk2WHBcaeVUQHpDRTAVCcKanpIMkqmL6GrOGvFn
 S0mxgojkmeseJ9yUmDk2Ku34DIwQ8X//JHOKV8ahWNpmNVeB6RFODgkuog3Sh3hb/ILF
 aPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VNmKvjs0yhbDrxDv/9vSERVwwBL+HckugvIkF9wNoCs=;
 b=C+CfW66blAyCLpKZzmVz68Qm2WODkP8HQpXc8DMHU9s2qD/5rqarBuUKBKqdQ24+gJ
 TnxxEfN2ZZqd9/GgqNp+2aLiUNXgDvf6IZ1jlct824u+AtLYQG5TZCJQf5QbyMRbsRdF
 L+s92dFZ71yUQlz3xuaquiiR6Ye9uBoZjknSwfbGv9RMRHp3Wllkof3HLDQ6CLD1STPN
 t7Wz9w8/VCjsjVSzTbYpFJA41DCkmdSK0Hy3Cj2kKerphQ6pyVL3xglAYjIyih7YWv8E
 PsUrntUkHswq8A5m+CtDHj6tZSvvmYymOXieWJIifHB/uNcNlu33TzlroC9tTw/Doicp
 L0KA==
X-Gm-Message-State: ACrzQf20pWdzuRfkJrXnpsMVW8chN2H+rU2mV3aAN9i/VPnBhKpzFNns
 C2/xeVDhi0HUq78mFxsaQ9Y2FS6NL83Z8r6OTXBJ3A==
X-Google-Smtp-Source: AMsMyM6yfg1GldRdFN3VzMQkuKZD+B4cG93TJgcsQTc5L0AzI6EQm8g72gVfzS2ZhUzVkqOCKncFYAyBrs69mGZaGvc=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr18639223pll.19.1665407936585; Mon, 10
 Oct 2022 06:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221003145641.1921467-1-jerome.forissier@linaro.org>
 <CAFEAcA9bWzD5gKyHGOsz+8KCH1ykgU6sx2soDTVKiTHEa0D7KA@mail.gmail.com>
In-Reply-To: <CAFEAcA9bWzD5gKyHGOsz+8KCH1ykgU6sx2soDTVKiTHEa0D7KA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 14:18:45 +0100
Message-ID: <CAFEAcA_Bg=sC_aA_1PMZ4wrP-RfDYTAtP7m2QN4Jv1agdca9tw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set CPTR_EL3.ESM and SCR_EL3.EnTP2 when
 booting Linux with EL3
To: Jerome Forissier <jerome.forissier@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 10 Oct 2022 at 14:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 3 Oct 2022 at 15:57, Jerome Forissier
> <jerome.forissier@linaro.org> wrote:
> >
> > According to the Linux kernel booting.rst [1], CPTR_EL3.ESM and
> > SCR_EL3.EnTP2 must be initialized to 1 when EL3 is present and FEAT_SME
> > is advertised. This has to be taken care of when QEMU boots directly
> > into the kernel (i.e., "-M virt,secure=on -cpu max -kernel Image").
> >
> > Cc: qemu-stable@nongnu.org
> > Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
> > Link: [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst?h=v6.0#n321
>
> Ooh, that detailed set of control bit requirements is new
> since I last read that doc -- we should probably go through
> and cross-check that we're setting them all correctly.
>
> > Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> > ---
> >  hw/arm/boot.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index ada2717f76..ee3858b673 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -763,6 +763,10 @@ static void do_cpu_reset(void *opaque)
> >                      if (cpu_isar_feature(aa64_sve, cpu)) {
> >                          env->cp15.cptr_el[3] |= R_CPTR_EL3_EZ_MASK;
> >                      }
> > +                    if (cpu_isar_feature(aa64_sme, cpu)) {
> > +                        env->cp15.cptr_el[3] |= R_CPTR_EL3_ESM_MASK;
> > +                        env->cp15.scr_el3 |= SCR_ENTP2;
> > +                    }
>
> The doc also says that we (as fake EL3) should be setting
> SMCR_EL3.LEN to the same value for all CPUs. Currently we do
> do that, but it's always the reset value of 0. Richard: does
> that have any odd effects (I have a feeling it clamps the
> VL to the minimum supported value)? Should we be setting
> SMCR_EL3.LEN to the max supported value here ?

In any case, this patch is right as far as it goes and
obviously improves the current situation, and it puts
SME into the same place as SVE, so I'll take this into
target-arm.next.

-- PMM

