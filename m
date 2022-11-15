Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D4A629B8A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:07:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwbM-0004sj-Mr; Tue, 15 Nov 2022 09:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouwb8-0004mQ-Gb
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:07:44 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouwb6-000243-PM
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:07:34 -0500
Received: by mail-pf1-x430.google.com with SMTP id v28so14185325pfi.12
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 06:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x7ubosiXgXLVjwywfhStXpoJ+WxI6Nb0ALMOZWmHl6A=;
 b=dJFnBl0m1MFRfuc0Ljod2AP2HBsI1XE+k9CA6WwC+ijxcwTvsdAtA+HLuZL9wgFxOh
 pXtgeJkADkBMPCd0UK8WhywwLOcyFVWkaePCwPFB/ei/2DW1RejVaJsOtRRhEvvW8zc3
 L1tpnde9dVKU9fYhRmoVNzAD1VaIPP2ArXiXoxuHLQ2JznxNraWZmrBSm7paXDxNV/V0
 8n/JzsCTvbOuZdwaJxBeNmW93SbwJljmQ+ZJpjo4wUCopTr2la5zKA8xJ92Eedf9OvPP
 g8whLdO65IayynK66O7ZfzRSg9uCPGB5EA7IDa4TBY18pEYPab+2oNb+GNHBGBf8NMHZ
 iwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x7ubosiXgXLVjwywfhStXpoJ+WxI6Nb0ALMOZWmHl6A=;
 b=EYq313y1DMBw5cVJ4pTlbPwmsDu7GyWgYBxpsC3+Cwf/Pytw/6Hht2L4WKMjrAxTrj
 4doMYwZM+wXqflcog8wNVfZaGe6uzHVCyLeDarrdLXP6iCcOCDXoGZ8vPDS2n8C9bDos
 y5+NnQCXqliiQO6boV9MkUbW5jf4tb1NIz24HfWkGIrODNrZ9AKm0taNWfb/sitpXj85
 Kf9kFdCINNjWLLiRowYJ2NHfDsbs5ycdgmyNZ4K6CJT6TpTbZ2Ee7A6TjiFv6+00+btx
 lxP+o90ntOMxeY9X/Fo2mAaBT+m1Z80MORgDmQXohhsSeI68PSpiW2IOCnXwK9+5eHax
 UjQg==
X-Gm-Message-State: ANoB5pkiQlHxecTQSBy94mjgTWSSHO+qJhv6MRT1QWIqX4u8xiPk8BTA
 PvwnRhK0ozhorzSiYQKJq8Z31l5W2ZnfzQp76uVtx+HRhfwdBw==
X-Google-Smtp-Source: AA0mqf453lWzCW/26tta297vJ+grCWL3pCJfalX1YtpUtKH6RJH/8PTDYBcBltlkXX3+GSCwbRMDiEjcy2A23heG4oE=
X-Received: by 2002:a65:63c2:0:b0:46b:2753:2a60 with SMTP id
 n2-20020a6563c2000000b0046b27532a60mr16048618pgv.192.1668521251409; Tue, 15
 Nov 2022 06:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20221114133257.1752176-1-jens.wiklander@linaro.org>
 <CAFEAcA-ECwzbojxcjbbAketMa8NkJXg=0xsqPWisKKfiuZGPNg@mail.gmail.com>
 <CAHUa44E9sjxLLmNZFo5fS3SUESsYttzP1jxa+a87O8ahQ67SOg@mail.gmail.com>
In-Reply-To: <CAHUa44E9sjxLLmNZFo5fS3SUESsYttzP1jxa+a87O8ahQ67SOg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 14:07:19 +0000
Message-ID: <CAFEAcA_3QMTg1kSJC=Qa_5QDcCBGZMnB6X4MvKXdfURBkoXG+A@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: fix prio masking on pmr write
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x430.google.com
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

On Tue, 15 Nov 2022 at 13:41, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> On Mon, Nov 14, 2022 at 3:43 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 14 Nov 2022 at 13:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> > > I've only tested this patch on top of v7.1.0 since I couldn't get current
> > > to run in my test setup.
> > >
> > > In case anyone wonders what I'm testing, it's a setup with Hafnium at
> > > S-EL2, OP-TEE at S-EL1 and the Linux kernel at NS-EL1 (no NS-EL2 for
> > > simplicity).
> >
> > Now is a good time to figure out what's not working with current
> > QEMU, so that if it's a bug in QEMU we can fix it before the
> > 7.2 release. Could you try a bisect of QEMU to see where it broke?
> > Alternatively, if you have repro instructions and prebuilt image
> > files I can have a look.
>
> I've bisected and learned this:
> # No output at all, hangs in TF-A bl1:
> bad commit 48da29e485af ("target/arm: Add ptw_idx to S1Translate")
> # bl1 works again, but TF-A bl2 (at S-EL1 if I've understood it right)
> fails to load some binary:
> commit cead7fa4c060 ("target/arm: Two fixes for secure ptw")

OK, so it looks like maybe 48da29e485af had several bugs and we've
fixed one but there's still one lurking.

> I'm using semihosting to load binaries and in this case it might be
> that QEMU refuses to load the binary into the memory pointed at by
> BL2.

Hmm, I wouldn't have expected that to change.

> I can share the binaries (~50 meg) privately, to test with if needed.
> Or if you'd like instructions to build it I can provide that too.

Yes, if you can put the binaries somewhere I/Richard can get at them
I'll have a look at this.

thanks
-- PMM

