Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EA739FCDD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 18:52:36 +0200 (CEST)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqexv-0006yN-Ag
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 12:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqeww-0006Et-HL
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:51:34 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqewu-0003Ah-Ji
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:51:34 -0400
Received: by mail-ej1-x634.google.com with SMTP id g8so33752677ejx.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nAlTZ22z+OStEJXG+zotgb5aMMFeI4IXetIQDcYAExg=;
 b=PRm6tWjFmgKbYwlca6V91TZaMNIzlwKetD+UWRKpHo79VT01ksJnhrGyI7C3SMaBW3
 ahstsemo9x2Au3DMYmpvMvQW28qrhIb7e+EHNiu2ADD2pDNtrnkepy1NRxp3g89Xm0/u
 xJM5CP9w30coAff3+bWqmBwoD88Yq4i2plMwP9G4bOJBdnf26a2GN8xT9cRRX2aDaLhx
 +t8YvzQDKtUIjFXKpoWJr707sgZYEqoVD4v9+cmFTJyagKf+2JtldifbOzxP8VknYFm0
 zziq/tIcMpS8RgsT5Q1pxAy2uddp9j6J5QHX/mN0YRKcKyLjjnIkz/y2rNGzXyrC9ALX
 0TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nAlTZ22z+OStEJXG+zotgb5aMMFeI4IXetIQDcYAExg=;
 b=sV5nCtVI+mBURBZxSbhYXgj81pV7tH9mNV7kLgizqhv8cBkU5mAvH/F7X7lgEY2n+2
 B/T6V9KCA5+D7GOIKPx0y17ntP6Y3s3mE+NDdUHYY9c7r7ElIjy/PALqYXqlW1ZDW47z
 6Cww7ShCGVW72V3TBJNOYaJNn7QHrRyGmskAn2L29yaPApxtBHKBsXUohp2/YrsrNM85
 NALYyy9dVjoKSwGdJlzrjbCFEBebgxLL/cGlB7XU+ApclND4/g5Z0m62sirjHSD455k2
 B8C8L+EgalYs/LKeGXwHHds4T8J3Yw3IQQxOp6/wO2K1hsUHoT2deJDyQgF3aCRmUwzz
 3L7A==
X-Gm-Message-State: AOAM533r9n5zVb4smDtyxa2hNeRAd8Kj6sPpax3tdouT+HHEfyk06IYw
 4bDMv4fwvQGhcF1lgoa7+beGDu2fUkL0tNG022ennQ==
X-Google-Smtp-Source: ABdhPJzrevY9+x4X+u8Q2H6aML8Uet+ezHUfyNBvBBVTppt5HmWd5fqY6g5SlMx+r/UQqWH0+yyTT1utlWzTmMItAbE=
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr24532569ejm.85.1623171090513; 
 Tue, 08 Jun 2021 09:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 17:50:57 +0100
Message-ID: <CAFEAcA8PVz1V-Xucr5myBkbLuoZD9NA61_W3_Qs3jmC7+MCXwg@mail.gmail.com>
Subject: Re: [PULL 00/32] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Tue, 8 Jun 2021 at 01:30, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit a35947f15c0ee695eba3c55248ec8ac3e4e23cca:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-updates-070621-2' into staging (2021-06-07 15:45:48 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210608-1
>
> for you to fetch changes up to d2c1a177b138be35cb96216baa870c3564b123e4:
>
>   target/riscv: rvb: add b-ext version cpu option (2021-06-08 09:59:46 +1000)
>
> ----------------------------------------------------------------
> Second RISC-V PR for QEMU 6.1
>
>  - Update the PLIC and CLINT DT bindings
>  - Improve documentation for RISC-V machines
>  - Support direct kernel boot for microchip_pfsoc
>  - Fix WFI exception behaviour
>  - Improve CSR printing
>  - Initial support for the experimental Bit Manip extension
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

