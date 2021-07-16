Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC1B3CB584
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 11:57:54 +0200 (CEST)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4KbR-0002P4-Eh
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 05:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4KZl-0001hz-KG
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:56:09 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4KZd-0004gw-VR
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:56:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id t2so11807231edd.13
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CMzjrDE/KmcAqLYYQ8Y3RQYRMteh0+ErzNTInAWaeyQ=;
 b=bMCCftKtmDuWBVlxe+hLbhAHvyDRcSBgD4ig/0re/oyxwKpRdbACCzCRasObsB/nqx
 /EUA4A0rxN5N7lS00LQ7h55e3cMpTx+M4S2gy+KJYgFWSU/T0cL/K587yZyGbhn1eMtP
 fX1PefycN6R5TB/xFCc4biJ4BKk8Tl9mwjcMbC4P1BWBcP8hfm4LTTAgi0rfVPZofMjv
 KZ1Um5KLw9EtXhJMR34AU2F/CE7PRe3h/R05iYoUFoyJvY8L5rxAD0s84JFqsnSring4
 M5/dNbBz/8JoNA5s4seugvAwrkFMgpapQ1HhAGRFMX1udu0NoTjG4gRDYhxNQDv4uB5q
 ax/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CMzjrDE/KmcAqLYYQ8Y3RQYRMteh0+ErzNTInAWaeyQ=;
 b=SBm13acbs3hZqt18ycVQo9bGvEu+iIFonZ+zMUM1KfmepvqE7FBW4Hi28zcxpRSgmX
 DrtZ4xVXHpSIpHRIj4d2JcVnRNOkJvneRmHUj2Sff5+Tbo3emlJlf0n+hXeQNOet7o/z
 S6TIbwPb8SgTsA8zpUhsIvE2pi9H3fEWJT/pPJqNcmJK3NcyeK7N+75693dyQRnMqeDe
 RFXFi0FIrdzbs+NqO23+W2WftnEHCgrme4qUX15KQl4FH7/hA+Nfr4WuDYfDRxSYw7na
 JPUQarwmu/e2nR4nLbFc3zo0rFskQUV2bSMbSJ/J86EX8pwersX0WoN2x8RNLkQQyENf
 fDBw==
X-Gm-Message-State: AOAM533n8d/F+8WL5YFdajTP1Se/8z6JD6/oSVXx2yXh/JF1Qdpy/ysv
 M066GgoLUU9CWLGciQFZ9i2Ww5L5tLU1+GVwT/Wd9w==
X-Google-Smtp-Source: ABdhPJz4om76BNKC37bf4ZOUJeem6w7M7n/yW6cTVbASF2gOyMvWpJdeQ9+rk1e4xZdT7ZLoo2I89apYgrtEV6x9a8Q=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr13556531edb.52.1626429360145; 
 Fri, 16 Jul 2021 02:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210715071640.232070-1-alistair.francis@wdc.com>
In-Reply-To: <20210715071640.232070-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 10:55:20 +0100
Message-ID: <CAFEAcA_d_NCxR8=QNf7djf70+_g+_1tEWTevEE_8HcvaMpGj=A@mail.gmail.com>
Subject: Re: [PULL v2 00/12] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
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

On Thu, 15 Jul 2021 at 08:16, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit a9649a719a44894b81f38dc1c5c1888ee684acef:
>
>   Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pull-request' into staging (2021-07-14 18:09:09 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210715
>
> for you to fetch changes up to b3d8aa20692b1baed299790f4a65d6b0cfb1a0bc:
>
>   hw/riscv/boot: Check the error of fdt_pack() (2021-07-15 09:35:46 +1000)
>
> ----------------------------------------------------------------
> Fourth RISC-V PR for 6.1 release
>
>  - Code cleanups
>  - Documentation improvements
>  - Hypervisor extension improvements with hideleg and hedeleg
>  - sifive_u fixes
>  - OpenTitan register layout updates
>  - Fix coverity issue
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

