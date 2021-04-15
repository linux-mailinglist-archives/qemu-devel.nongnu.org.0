Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F73600AE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 05:58:23 +0200 (CEST)
Received: from localhost ([::1]:34526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWt94-0006xl-K6
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 23:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWt8J-0006UV-15
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 23:57:35 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:46662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWt8H-0007I2-9Z
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 23:57:34 -0400
Received: by mail-il1-x133.google.com with SMTP id l19so15156092ilk.13
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 20:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7645azot0lpBsMidEtmnGlidZJwZA5V1oQhr31WAeE0=;
 b=ZtnC4cQ6WNY32A34fn2ZxN/FJXJ4vx9Q6C9BOjOSFBzqnWZy2zbY8rZsifmwECNGyA
 n2KNxoEAHlgZgnMzLjJSuhAeZYTUjLNOKhDDSy9LoUM/vgoenmq2Tfa1dKib27NbZvKC
 uT7WiyANO3USe9AiCi/5OaSyj5/oDp8/lRluKyiGG6gYpno608V7Aw2ahLjBpC6rwEdp
 8t3yuKnSJtyxmmZMEnpsEi/8ZaYyNSdk9kyqoMGTYctXDoEA+pf2LU9e35RK92xeivRB
 a847emKfiTD81O9kawkfKvMS5hKFVbYRAfoS7FyQLzYw5vVNdEh8RzuJWdvQh3XnkpIT
 h9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7645azot0lpBsMidEtmnGlidZJwZA5V1oQhr31WAeE0=;
 b=PkSbaY0g8v/kHj/CF6r6LBEl8yqY6f6YaQSniPshLSK/nwKQ31IQhl9Y7bZ/HO9aau
 yU9jOtLINLMG0eWY3udBpKBO4m3LzNAV3juKXjChUsFFKDplR05FBizT1XWW8SzVFYdw
 qN1kpe0VhmFFsrKtIeK/msJf7mZ9qIOCvhqRdaxrEzClRxiDit5LjC6f0c8ndzPZpVYO
 TVTI58MAqZHINTuWULTBMGLPlUIWMoNPu+9LHsHBCmLVDEMK1gLG+E0s0jBRvOrt1/8o
 RtcRPVSmuV32QbH+EbW9eU3GOVrH1BG+l/iQvl2vfvygtGBwegmZmPVTfxjyDCBDCGYx
 z20Q==
X-Gm-Message-State: AOAM530UgfGDlG0DLwr6RseWgElR1W9cGnaXm/nrBs0SXJDUUPiY5guE
 R9DilmQp+udPetFjNKHpcugEYLNEVNSI1X8oxfE=
X-Google-Smtp-Source: ABdhPJyKevU8gN1A+latLuk57wM4c9WZBtTnyvfA9Ctc+sCole8pFWVr5kYRyRqgbxwc+1dRnAhCWRT6fGvFt0Vq2nY=
X-Received: by 2002:a05:6e02:671:: with SMTP id
 l17mr1193167ilt.267.1618459052144; 
 Wed, 14 Apr 2021 20:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <161832726983.9430.3755052950345832110.malonedeb@chaenomeles.canonical.com>
In-Reply-To: <161832726983.9430.3755052950345832110.malonedeb@chaenomeles.canonical.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 13:57:06 +1000
Message-ID: <CAKmqyKM7iVth4dzSLgdx6u=V3icoQuFnZ+JeqwUzmvim14BRRg@mail.gmail.com>
Subject: Re: [Bug 1923629] [NEW] RISC-V Vector Instruction vssub.vv not
 saturating
To: Bug 1923629 <1923629@bugs.launchpad.net>, liuzhiwei <zhiwei_liu@c-sky.com>,
 Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+ LIU Zhiwei and Kito Cheng

Alistair

On Wed, Apr 14, 2021 at 1:31 AM Tony Cole <1923629@bugs.launchpad.net> wrot=
e:
>
> Public bug reported:
>
> I noticed doing a negate ( 0 =E2=80=93 0x80000000 ) using vssub.vv produc=
es an
> incorrect result of 0x80000000 (should saturate to 0x7FFFFFFF).
>
> Here is the bit of the code:
>
>                 vmv.v.i         v16, 0
>                 =E2=80=A6
> 8f040457        vssub.vv        v8,v16,v8
>
> I believe the instruction encoding is correct (vssub.vv with vd =3D v8,
> vs2 =3D v16, rs1 =3D v8), but the result does not saturate in QEMU.
>
> I=E2=80=99ve just tested with what I think is the latest branch (
> https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v7 commit 26 Feb
> 2021: 1151361fa7d45cc90d69086ccf1a4d8397931811 ) and the problem still
> exists.
>
> ** Affects: qemu
>      Importance: Undecided
>          Status: New
>
>
> ** Tags: riscv vector
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1923629
>
> Title:
>   RISC-V Vector Instruction vssub.vv not saturating
>
> Status in QEMU:
>   New
>
> Bug description:
>   I noticed doing a negate ( 0 =E2=80=93 0x80000000 ) using vssub.vv prod=
uces an
>   incorrect result of 0x80000000 (should saturate to 0x7FFFFFFF).
>
>   Here is the bit of the code:
>
>                 vmv.v.i         v16, 0
>                 =E2=80=A6
>   8f040457      vssub.vv        v8,v16,v8
>
>   I believe the instruction encoding is correct (vssub.vv with vd =3D v8,
>   vs2 =3D v16, rs1 =3D v8), but the result does not saturate in QEMU.
>
>   I=E2=80=99ve just tested with what I think is the latest branch (
>   https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v7 commit 26 Feb
>   2021: 1151361fa7d45cc90d69086ccf1a4d8397931811 ) and the problem still
>   exists.
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1923629/+subscriptions
>

