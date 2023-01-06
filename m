Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E06605FA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 18:52:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDqsr-0003nR-JT; Fri, 06 Jan 2023 12:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDqsh-0003mp-S9
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 12:51:51 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDqsf-0002IB-2H
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 12:51:51 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 c8-20020a17090a4d0800b00225c3614161so5855425pjg.5
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 09:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJ8hPDGrCEyZK9KawWvPVf6wiiy7sBG99LcNDYd+zDg=;
 b=VUML8qZch/Jv8BSAcHxHGeAHsOC4WJoLkwSCgMP5w1z7u2UpzTX/NOHwU9W7svHPYy
 rKyB12UGWO41JrYyoDB3U4ZzvtLTngAWia03WY1o2/+mH0soLQdJdLrb8xyereyG3iCe
 IUZNT/yUdKh6m0XMvaicXmZX98HDmb4a9L6IU+joNqezKNq7uoc1iPZOwfCRMDsSMI73
 OzKSjEQ+OBxhCCRHzqmS8NNLQHS+nk3k5rr/n5VC+SuECn7Aa08wJKcxkdonB816P/6O
 Zh8DXLJbMHTLrp5RSJJXpu67t1SwGny+FQJIkBeF3qMxmZ2x51rK3uu56EhHp3Gb/0yD
 gyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SJ8hPDGrCEyZK9KawWvPVf6wiiy7sBG99LcNDYd+zDg=;
 b=5JhPBJseVH07Sgro6/7Gc4FQYVpQbRIB6u55moXQtJUTRs9aCjUEBRBW3INJyoumML
 tW5Tcfb7dz6tB60oCwpfigQ9LPk4SsepldyBg3m9bFpqmfxXrP9fCxKbLzNorZFyLr4X
 N3oxHs24+lpsLZ/Ie7KwbjCSRnDyRE1H7eFWHYxH/AHDBoYT2Ud3UtxaNfl5WZCCGHlL
 S0zwqacXzUAvRjuo2XlJsW9bCwkK+yhKtnKt/ENUtaB0GGmRkZ0JX0D/ymPUtplja3ze
 6TaJroDL3Q8wDnFrowD8M9Heb3MFHkt3IpXC7oSfH8HWhFciU2GUtdfkhYfVsCQjwC4m
 OIRw==
X-Gm-Message-State: AFqh2kq/TPn0tVuVVr4Z/4Cun4WqYWxF/PgprWshTP6X11ANpCwSYpkc
 O8sRpF4NYYbU1RTcZwBYK1cBzOmPLWaYzNL6qlnTsw==
X-Google-Smtp-Source: AMrXdXtmiHGmSX2a/fN8FssMJBNbtinCjcEcmhLW9KK1jcpyOhTRxd0IYT+m8Qm64yjg1oAga9ctUZnhRw7ud0XCNdc=
X-Received: by 2002:a17:903:2653:b0:189:cdc8:7261 with SMTP id
 je19-20020a170903265300b00189cdc87261mr3776628plb.168.1673027507504; Fri, 06
 Jan 2023 09:51:47 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 17:51:35 +0000
Message-ID: <CAFEAcA_sw=SdiKD4X3E1=AURS40NTv7zeLNfRTTP6zdLnr93rg@mail.gmail.com>
Subject: Re: [PATCH 00/20] hw: Remove implicit sysbus_mmio_map() from pflash
 APIs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Song Gao <gaosong@loongson.cn>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, 
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Radoslaw Biernacki <rad@semihalf.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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

On Wed, 4 Jan 2023 at 22:04, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Paving the road toward heterogeneous QEMU, the limitations of
> having a single machine sysbus become more apparent.
>
> The sysbus_mmio_map() API forces the caller to map a sysbus
> device to an address on the system bus (system bus here is
> the root MemoryRegion returned by get_system_memory() ).
>
> This is not practical when each core has its own address
> space and group of cores have access to a part of the
> peripherals.
>
> Experimenting with the PFLASH devices. Here the fix is
> quite easy, we split the pflash_cfi_register() -- which
> does the implicit sysbus mapping -- into an explicit qdev
> pflash_cfi_create() followed by the sysbus_mmio_map() call.

pflash_cfi_register() is a legacy convenience function. If
you don't like the sysbus_mmio_map() it does then you can
create, configure, realize and map the device directly.
This is what hw/arm/virt.c does, for instance (it wants to
map the flash devices into either secure or non secure RAM).
(This also lets you embed the device struct into some other
struct if you want rather than using qdev_new(), though
we don't have any code that does that currently.)

thanks
-- PMM

