Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E66C652872
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 22:36:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7kG5-0004iF-Fk; Tue, 20 Dec 2022 16:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7kG2-0004hj-Lm
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:34:43 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7kG0-0000um-Vv
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:34:42 -0500
Received: by mail-pf1-x430.google.com with SMTP id k79so9391868pfd.7
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 13:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WCQsZXq3em49J8sijHtLwzQMt+b2ZIzcPazaG7zKuAw=;
 b=WuoRkSy9ER3iv42KGSjePWe1RmvDggVrRROGGUeY7UmVQVvxdNE2DM3JxD9Qx0oI/c
 m99jS+F/+4zmKj7AlyshQMj1DDBsA5wJ1ZtbkqiwrypJVSd4Rx8V2PBQgRdJZHE1EVk2
 SouCycUA+6bINyCz75F+8q26Z/tUDvNVkDJaqs/MaL0Kib2fqTTN/murldj/rg156xur
 VvscoaZLHvQBh7nw6Yb38kXrMrO8aT1ATtNDYpv3zVXKvC9LJr5gxKYc5qagwdOHDFLN
 5tqLuihdZGh7fVFrtcx1IBYNMGPYwjBebuffPMBLExUzZt0vgnu+e266nVBJh959auvN
 lSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WCQsZXq3em49J8sijHtLwzQMt+b2ZIzcPazaG7zKuAw=;
 b=J49msJPPWQMyxEH1hZSNa50/dOAzTwfBozrDxW0jiV5fRgpUIomYHgtxJ+0l2BDtpW
 M1K9Qzdh57uwcZzjs/3oBxhLSstmnqqIn6BZyak8UjOMm4D/y9YJKwvU1jpDmLS1w2BF
 Ssh+oK0sYyFPB9CixElkCQmODAToI5mkvSBPTt8N+pzbteW22ivWuESA2PG7YfVVDvT3
 yOBd/Sm3K1vffkRttPZHOuuSQ1A3s6Jqk01e2STneRvmyLuY9DtdfG8ZVmKFff6hizPz
 VA/V5AZFYrcj6jN/QSdUOMv0+/ZNBpuKIfNmtbHd9XPnbXYrGfHbkaALCs3oyLFaYyP5
 qaWw==
X-Gm-Message-State: ANoB5pnccoVTUrCeAGthtTQYvOUYMnfmqc8l4OUlZ5UCm1NF7e+RiSFT
 0hCpbLlIerHPSPur54aweUIIQ63Hjw/vUY0HATEJ6Q==
X-Google-Smtp-Source: AA0mqf43gXAPK2F41yhTWtNAHrdw47+DMgKmXwCqhrtzIll1U2OAbxB5ebJjwq6rztS6TD/G+nE5pnKY7XYjeklPdOk=
X-Received: by 2002:a63:d20d:0:b0:479:18a:8359 with SMTP id
 a13-20020a63d20d000000b00479018a8359mr7006933pgg.105.1671572078205; Tue, 20
 Dec 2022 13:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20221220135251.155176-1-danielhb413@gmail.com>
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Dec 2022 21:34:26 +0000
Message-ID: <CAFEAcA_52bvonP4YN1tr-W3x6rpRyJZe9jfw76yxw6SDyRzmZw@mail.gmail.com>
Subject: Re: [PULL 00/15] ppc queue
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 20 Dec 2022 at 13:53, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> The following changes since commit 33698d3abf8ce65c38bb4b12b600b130d2682c=
79:
>
>   Merge tag 'pull-monitor-2022-12-19' of https://repo.or.cz/qemu/armbru i=
nto staging (2022-12-19 16:12:59 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20221220
>
> for you to fetch changes up to bac9fdfd3940f7b79735f85cd3a6dd319365e978:
>
>   target/ppc: Check DEXCR on hash{st, chk} instructions (2022-12-20 10:39=
:24 -0300)
>
> ----------------------------------------------------------------
> ppc patch queue for 2022-12-20:
>
> This queue contains a MAINTAINERS update, the implementation of the
> Freescale eSDHC, the introduction of the DEXCR/HDEXCR instructions and
> other assorted fixes (most of them for the e500 board).
>
> ----------------------------------------------------------------
> Bernhard Beschow (6):
>       target/ppc/mmu_common: Log which effective address had no TLB entry=
 found
>       target/ppc/mmu_common: Fix table layout of "info tlb" HMP command
>       hw/ppc/virtex_ml507: Prefer local over global variable
>       hw/ppc/e500: Prefer local variable over qdev_get_machine()
>       hw/ppc/e500: Resolve variable shadowing
>       hw/ppc/e500: Move comment to more appropriate place
>
> Daniel Henrique Barboza (1):
>       MAINTAINERS: downgrade PPC KVM/TCG CPUs and pSeries to 'Odd Fixes'
>
> Nicholas Miehlbradt (2):
>       target/ppc: Implement the DEXCR and HDEXCR
>       target/ppc: Check DEXCR on hash{st, chk} instructions
>
> Philippe Mathieu-Daud=C3=A9 (6):
>       hw/sd/sdhci: MMIO region is implemented in 32-bit accesses
>       hw/sd/sdhci: Support big endian SD host controller interfaces
>       hw/ppc/e500: Add Freescale eSDHC to e500plat
>       target/ppc/kvm: Add missing "cpu.h" and "exec/hwaddr.h"
>       hw/ppc/vof: Do not include the full "cpu.h"
>       hw/ppc/spapr: Reduce "vof.h" inclusion

This fails 'make check'; I think the sdhci changes have
broken the npmcm7xx-sdhci device:

https://gitlab.com/qemu-project/qemu/-/jobs/3504313175

46/106 ERROR:../tests/qtest/npcm7xx_sdhci-test.c:101:sdwrite_read:
assertion failed: (!memcmp(rmsg, msg, len)) ERROR
46/106 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_sdhci-test ERROR 1.67s
killed by signal 6 SIGABRT

thanks
-- PMM

