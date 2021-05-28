Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6369393D78
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 09:09:48 +0200 (CEST)
Received: from localhost ([::1]:52236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmWcu-00071c-0D
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 03:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lmWc3-0005hX-Dr; Fri, 28 May 2021 03:08:55 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:45741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lmWc1-0004Oi-NZ; Fri, 28 May 2021 03:08:55 -0400
Received: by mail-qk1-x743.google.com with SMTP id i5so3190751qkf.12;
 Fri, 28 May 2021 00:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mHcZc0fhbo/ogWUziOMjVXe+punIc2PZi7tzwZxT/8A=;
 b=keBwd0DYQHhRUxcEUpDxBy0+CJZC4xwuaEogJaOZ39W4PnpesLo7GUA3iNVBLVenaa
 gG+dFs9wt08UOwsf8lR7sQOQWjEv2pqcRXsnrbiUls8VkIKUDbLc86mkR7QNTmShAmSY
 ITHnbdyBVfU1wZ0hzNkGIrnAHTqMbTSO5ZnyCyrNrOXMc/8XuRu3Acq0gBdu3q22Jl6g
 G7taXLYHB1nOPLgILM8CzFPUWZzS4PjtQF3co861aDuqnErdd6DcwcQ2VMoWEocCYV2Y
 3wp2faqHsojDAsK3bqz+LLcNeBhLaAzoTyEeuFk6sGp9lTkbQhz5KDNd+X8sAZDa6PBS
 Asdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mHcZc0fhbo/ogWUziOMjVXe+punIc2PZi7tzwZxT/8A=;
 b=s8ywyhI3rPRPN4Rx1wnM1nphWWnd+mGs3RN0ryiiEFYzpC692aSuqSo731s6B1DO0S
 yqTY5wRH+bX8l+JCodCX33+OZeHDHStjsGxxZMkknuEL+VY38jSzK6XrjAcP1KgPiuWv
 Y/pvnsW5vka2v3M/mp7RdT07zPEXAr/X3Sg75pn06RX/2FPH4u8Eh7g0+EgX5M33g4St
 89U8j5uryfRhSa2oXDxc2oXszObwwrehEG0BMPfF/paNZ8yXZEk//OgEHo4Xiwzl3y05
 98pQZuiY/32iGLI4Yew3ZEPwsNIwFCnVP0Qu2Bi7GF7lm+UuzhNX1JkCVPshP/B4VZja
 ODEQ==
X-Gm-Message-State: AOAM532rQG3dwfxqbisar10RViglsPQMPTeckjwvlW3wH68bL9xw5cDq
 KLmNQpOrdonvxpOtTe/3DPoHvmvEVFc1AQjv+as=
X-Google-Smtp-Source: ABdhPJx/m28F1ILvSjlej//2LcLmjnSTaAgsg5DmOzlI1JYmko3SUfCD0i3KFwglMHwIBviI1/eG//WKdihkUU+nWk8=
X-Received: by 2002:a37:a6c2:: with SMTP id p185mr2502460qke.191.1622185731762; 
 Fri, 28 May 2021 00:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
In-Reply-To: <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Fri, 28 May 2021 15:08:41 +0800
Message-ID: <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=gengdongjiu1@gmail.com; helo=mail-qk1-x743.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Swetha Joshi <swethajoshi139@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B45=E6=9C=8827=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:19=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Wed, 26 May 2021 at 18:32, Swetha Joshi <swethajoshi139@gmail.com> wro=
te:
> >
> > Hello,
> >
> > One of the qemu machines we use has KVM enabled, but we don't want the =
CONFIG_ARM_VIRT enabled as it pulls in emulation of a variety of physical h=
ardware that we don't need. The compilation errors I mentioned are not in t=
he qemu mainline per say but we see them in one of the qemu derived machine=
s we use.
>
> Sure, but unless you can give me a recipe for reproducing the
> build failure in mainline I can't really help...

Hi Swetha=EF=BC=8C
     Yes,  Can you give a method that how to reproduce the build
failure issues? Thanks

>
> thanks
> -- PMM

