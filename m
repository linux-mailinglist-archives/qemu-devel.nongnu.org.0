Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB44B6B4E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 12:41:55 +0100 (CET)
Received: from localhost ([::1]:57776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJwDS-0001wQ-RN
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 06:41:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJwBH-0001C9-Qu
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:39:40 -0500
Received: from [2a00:1450:4864:20::42a] (port=36379
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJwBE-0005dy-On
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:39:38 -0500
Received: by mail-wr1-x42a.google.com with SMTP id o24so28949140wro.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 03:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hDsVCuNDpEl7oPg4Sel05WLiYEawZS8qDlZQolDd4UI=;
 b=ayiqin5tO51d5kU9siqrT+UgWbL0KWL1vvor6kq1+mc8p+aKReZbH94+ZGrG2Trz/b
 Lvwu/LqQnAUDEhHKHNbpSYjzCnGsSE4sw/qJBlGgrGU+egTfCNm2cO0ipRWJBR8no5qd
 nie6RzkpJCciUoIviyeZPd9V1qf7wpRudRxJoH1oZw5u1ruHu9PTMjJtbmFJu+R3B107
 D3LYAJ5C66mVq+fvfXN0JFlezJy7m27d6LdHuk1e88BJeexPJCQogBuso3jgwBBflEgI
 w37Ibnkzgf6Vij0Z9W95ckKhmJIckHRS7EloTVPy6/rjHsHevMGYCH9mW3fHhUK7IASj
 5T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hDsVCuNDpEl7oPg4Sel05WLiYEawZS8qDlZQolDd4UI=;
 b=grLLs0YxajZe+zacBpmOCJHOmkrxtiDpZ4dnwm1+94f4AhUfpj4Vp/YjSUajGkMTiF
 u04dq6qwasRAkY1GFzZvmxoeJlh3tq8emeqFdaxdtn/Mf9OZ/urx1hxpMda0Dx0gQRDD
 ORjN2e1gcmV5aGUa7mmfWJblOvIugdSR8qsDriHBxUchrNXuGaDYTEHSs9ugNCW30GYo
 UrikK+gWRdf+RgxdWJfLmQ+Mh/ftPZgruAdet0SwmvzbEPWNQ1v6xpqYKWRGI8gag6n2
 wzuJsEGBfDougG1P14fGlmuqWrDJCkI2GdYeoZfiozGFsvu799r5SLLN3BlHcMtDKnfi
 u+HQ==
X-Gm-Message-State: AOAM533FpsXpNK7EwasFYiB5MT79CnCRNe3LZ8DzAJ73V32vu9icg6E8
 Q+A5DmJNsgmFlyU15nIdZ+fsDpMyLv+o64yXU20mqw==
X-Google-Smtp-Source: ABdhPJyrFtrfX81EVvj0VPrwSB3g8jhqebKyHFr9XVF4aUzmPKnWeIkEEb7tLdpWImiHhRnFVFAo5NWATyWLb5dt1P8=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr2860991wrv.319.1644925173445; 
 Tue, 15 Feb 2022 03:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 11:39:22 +0000
Message-ID: <CAFEAcA96Jir1xbWSjhtXJhJkKQ3oR2ck=OFM06OWsyZJep0ecg@mail.gmail.com>
Subject: Re: [PULL 00/40] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Feb 2022 at 00:07, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220212
>
> for you to fetch changes up to 31d69b66ed89fa0f66d4e5a15e9664c92c3ed8f8:
>
>   docs/system: riscv: Update description of CPU (2022-02-11 18:31:29 +1000)
>
> ----------------------------------------------------------------
> Fourth RISC-V PR for QEMU 7.0
>
>  * Remove old Ibex PLIC header file
>  * Allow writing 8 bytes with generic loader
>  * Fixes for RV128
>  * Refactor RISC-V CPU configs
>  * Initial support for XVentanaCondOps custom extension
>  * Fix for vill field in vtype
>  * Fix trap cause for RV32 HS-mode CSR access from RV64 HS-mode
>  * RISC-V AIA support for virt machine
>  * Support for svnapot, svinval and svpbmt extensions

Hi; this has format string issues on 32-bit hosts:
https://gitlab.com/qemu-project/qemu/-/jobs/2092600735

../hw/riscv/virt.c: In function 'create_fdt_imsic':
../hw/riscv/virt.c:519:49: error: format '%lx' expects argument of
type 'long unsigned int', but argument 2 has type 'hwaddr' {aka 'long
long unsigned int'} [-Werror=format=]

../hw/riscv/virt.c:569:49: error: format '%lx' expects argument of
type 'long unsigned int', but argument 2 has type 'hwaddr' {aka 'long
long unsigned int'} [-Werror=format=]

Printing hwaddrs needs the HWADDR_PRIx macro. (%l and %ll are
usually the wrong thing in QEMU code as we don't often deal
with real 'long' or 'long long' types.)

-- PMM

