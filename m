Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C32DE388
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:55:05 +0100 (CET)
Received: from localhost ([::1]:44490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGDo-0004Vf-Qq
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kqFwd-0006n2-Q0
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:37:19 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kqFwQ-0005U8-Cp
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:37:19 -0500
Received: by mail-ed1-x529.google.com with SMTP id b2so2383249edm.3
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 05:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AOaAC/BCnoFehHB6rzHi+dg5O4wawVS86U+47L0cThQ=;
 b=WaCMVX2w9TC1GLPU68wmVh/K0OlM68pcizUirFlVW71EUcTXGbRHZVlMKg/zBCa1wP
 YwTo7YPMyeeWxgR9HeyLsHtR7endrXp7nSHJPgt05xkQBigzj3MZfy6qVI5iz7WrgdNA
 10W/IuJq7KGkzpkrSBlXBqAoRqMVk92iFZ4nkQcJ4XxItEY1lg0VedA86jLedcYQordF
 sENCkc4TOh5EaBgHFFyBbavkFZAXFlLQ/SIZ1uNrY1BRoMJIW0A0BdTLywcrGMAFvYJ+
 lF2fA9b5rcOu9HX2eF2PN4ONt4Z3HTEGW1Af74znwGBIc1PEgxYL6cfS1zSQKSxWtVDc
 NKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AOaAC/BCnoFehHB6rzHi+dg5O4wawVS86U+47L0cThQ=;
 b=N5LQY4JCdSgUUesAl9vWUmeIm+pP4H8UStCEO79OfnIc+qskKM3Tht9kn+IqaL7Tf9
 wnqobMHHRVHZRpuA4r2CLeEIY4/6f/+aHAcKzAD4NFw7R1TLmeTDhOpEYJI1ye3V2CFC
 0xGAh0L4tgyRVRwT/0h/exC7tNhA/tkz2DI885quFX83BBvBhJ3pAZfZY6havWgwXKur
 pd5x4NKtfxLTz3CCtODsdHPvrXuncZgEZqiL3ec6PMgwzupFXRRjt8nlbc5eJ1OS+jsv
 xUwtD+BJyvzwYVElB9SzLu0vCY+5IY1F118YRvvLo9eCVWIvkFk5KSJaHHYblgqatiCm
 Vo8g==
X-Gm-Message-State: AOAM532xsStnmrgjXjEYUmqd66dRGavU9IptaYeg3pmHuYdejCf8PqZD
 8G+CwUfoNUHq0INkzwqq0JeAqLQWOGLxrblQcY5qzNVR7Ho=
X-Google-Smtp-Source: ABdhPJyMWkQZxaXWote+OUjum13PDNfBH6GCw7aVUzNN+SelhjPUEjeGYiM9Mdiz5Y4gI1ogXNDZFlB8yol7hMFqkeI=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr4487539edq.36.1608298624141;
 Fri, 18 Dec 2020 05:37:04 -0800 (PST)
MIME-Version: 1.0
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2020 13:36:52 +0000
Message-ID: <CAFEAcA92rfAi_Pz6c_nitzc1ffqLe5eRDoU3z4mpwih=70y=fA@mail.gmail.com>
Subject: Re: [PULL 00/23] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Fri, 18 Dec 2020 at 06:01, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit 75ee62ac606bfc9eb59310b9446df3434bf6e8c2:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2020-12-17 18:53:36 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20201217-1
>
> for you to fetch changes up to d31e970a01e7399b9cd43ec0dc00c857d968987e:
>
>   riscv/opentitan: Update the OpenTitan memory layout (2020-12-17 21:56:44 -0800)
>
> ----------------------------------------------------------------
> A collection of RISC-V improvements:
>  - Improve the sifive_u DTB generation
>  - Add QSPI NOR flash to Microchip PFSoC
>  - Fix a bug in the Hypervisor HLVX/HLV/HSV instructions
>  - Fix some mstatus mask defines
>  - Ibex PLIC improvements
>  - OpenTitan memory layout update
>  - Initial steps towards support for 32-bit CPUs on 64-bit builds
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

