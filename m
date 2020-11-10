Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E82AD429
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:56:27 +0100 (CET)
Received: from localhost ([::1]:55200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRK6-0005Bl-2G
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRIW-0004lU-9n
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:54:48 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRIU-0006p4-D6
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:54:47 -0500
Received: by mail-ej1-x634.google.com with SMTP id w13so16857618eju.13
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 02:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gmBdorW/ZH4CnMfpaqN4TQkzzIdfQd1EHReaxrdxn4c=;
 b=K4Efcs29spghYsYW2jRCowkJ5RQpjAwTcYCES3cKGy+Hm6mj3omXwq4kNs7KDJBgSE
 FJ+31ynRZKf5CADZ1oLF0AvgBgXLdRd0CEkCllJlhcRmBlCNWI4SPb3ZzESKMsq8QLsE
 eMe+ss3BKhM41hoDEFNiDUNCrHJSX9DoXCEO9tY8rEVab3bmQ6DR290Zv1Sa7M2wtoNf
 mcN6glCrLajhMDirYbfYAr512R3O9A8b31GP7/PH7d5LaEcTW/bPnUoYEfym11AAWHHH
 Rz5I7NxCKNrsJg/8pzm/Gc+CCf3av4sPcN/AiQxejb4ClOIcze1gJR1yxBvAtzAYOK8W
 tJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gmBdorW/ZH4CnMfpaqN4TQkzzIdfQd1EHReaxrdxn4c=;
 b=a2K4XPT0RlJPqYI0vANK7I2N7ARCsB+OE44+OD6hIAIFwUA6s7dP5sOOkGOQC/zjCY
 CSnUu5Zbe+iVKABe4Vf5My1xmC3L3ytjfG6F2I1l9U01NISgf8uHXaEuAx/H1lQdteB8
 m+yWscJkls+61xH/jBDoupraKhIQWyQEL2zbRGtRwPTRVLVQkFwQkeEOBiIO8F2Jz8cy
 oej/Jw7P0Q+MR96hNXI1hK+sE76MQ07MCA7/4OnRgbXZaYWssa+JeLu/d2oXx9VTvqjK
 JjkXERIse0cML3YFmlS4/AREM7h+z8x+/RPzLqoWB/i1ZigUYEvHwi+YsRSJ7EsOdr6i
 /4Cw==
X-Gm-Message-State: AOAM533Hj8p+MeYjwl2NbmIKKwdS1GGudTQPs9u/3Hz50+Q7oMJEoilp
 YSGZvHtgdoeThacxCIRxepLDjD7uX45JUKexLBg9Aw==
X-Google-Smtp-Source: ABdhPJww4G/WhtqD5P/FLWf36/B8xR6NLQ16848k8lEfeaGDRzk2SSUmJGtgyWemiFi93+OeQ436fJpzRQkd/JC6hYE=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr20456833ejr.56.1605005684813; 
 Tue, 10 Nov 2020 02:54:44 -0800 (PST)
MIME-Version: 1.0
References: <20201110035703.83786-1-alistair.francis@wdc.com>
In-Reply-To: <20201110035703.83786-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2020 10:54:33 +0000
Message-ID: <CAFEAcA9oLGQEP_x7Rwiotb_1CFi=6g4LrkLWVru7fGHsuhzB5g@mail.gmail.com>
Subject: Re: [PULL 0/6] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Tue, 10 Nov 2020 at 04:09, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit 3c8c36c9087da957f580a9bb5ebf7814a753d1c6:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20201104-pull-request' into staging (2020-11-04 16:52:17 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20201109
>
> for you to fetch changes up to 96338fefc19a143abdc91f6c44f37683274b08d4:
>
>   hw/intc/ibex_plic: Clear the claim register when read (2020-11-09 15:09:53 -0800)
>
> ----------------------------------------------------------------
> This fixes two bugs in the RISC-V port. One is a bug in the
> Ibex PLIC, the other fixes the Hypvervisor access functions.
>
> ----------------------------------------------------------------
> Alistair Francis (6):
>       target/riscv: Add a virtualised MMU Mode
>       target/riscv: Set the virtualised MMU mode when doing hyp accesses
>       target/riscv: Remove the HS_TWO_STAGE flag
>       target/riscv: Remove the hyp load and store functions
>       target/riscv: Split the Hypervisor execute load helpers
>       hw/intc/ibex_plic: Clear the claim register when read


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

