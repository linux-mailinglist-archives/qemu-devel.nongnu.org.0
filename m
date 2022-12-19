Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58D56516BA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 00:30:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7PZA-0003UM-C0; Mon, 19 Dec 2022 18:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p7PZ8-0003Tt-PZ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:29:02 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p7PZ7-0008Ep-1B
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:29:02 -0500
Received: by mail-ua1-x935.google.com with SMTP id c26so2469672uak.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nGCiGMLxbGKBCDmxxrDcq/ltwnaM8FF8YVSsMfTBUUk=;
 b=HHlm2aajkJb/tAcrn4IlSLX6OlK31OULX7jazIQ+7eHtlMb+8BJLnONhmqFy+6ex/E
 oQz7hrBBd4Ff0u6czHusha/i4mqCJsOFLNn7K0RdUGX4tV7P5jAfCIXQhRdeXyFGUb/C
 huk9tP16AFGJdz8ufUgASdSJ865YK3irlCvvcNbOOUmDZ90TZeU+SABJJUid7SSSU6eq
 7Irmn5nFk/djkuLykaARPAmFwZZGvGHdHKTUtFOjvtaIHHCYArCvrTarjgWQ6VDB7ykd
 dH1vV2jqUzcgjjQ4m5z2/w+x/8jdgwOom+ZEBj6xciqRJneLakNIVZJdupm37+JbPEr1
 Bpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nGCiGMLxbGKBCDmxxrDcq/ltwnaM8FF8YVSsMfTBUUk=;
 b=rYXH2wygEa56o1NHdylxVupEJGsm4mzN1v/Gl2W2YQFURTEIqkAU5pkqwDzaNx7Ux3
 61XIxI3u0PV4n25Z4P+xiPJ99hPVpYhojuhPkfq5ysrQX2ytC3kdNEFfVwXZMrpvubZE
 onU5HNbxyxc9tCecTKuZ14/NCCwH9h+o4nIk8+JcDRzn8crqmquBXoNRal/RsRfyW2M+
 EGFK59fsyoZ8autOJER6t1CL6EryYPgf7PNdRgfH4nDVFHGZFPZsumHzjlAVPVf4Ql42
 hk33Q3QCpdbkE1L3Qv1XN2+6FSPfsELkR667f38/9MCO0hdORIk0muZrRAf51wzIo0cK
 BUuw==
X-Gm-Message-State: ANoB5plvN9/QL8Smi7Gq7iWnwX37UCqYjdgiZj5JYZklrgU+f0+/nSYy
 qqI0wSdhDczhMyLewGGz+13CgL04m44pX6Gjg5U=
X-Google-Smtp-Source: AA0mqf7sfjgbwkwx0SociRudwumh+XbQwuiDj6UXdFtRXvwrKF2ftZrDEQMp7Y7Sa3iM/R3w5GiLxfzZCZgzUv5WBfk=
X-Received: by 2002:ab0:6598:0:b0:419:2865:3ae7 with SMTP id
 v24-20020ab06598000000b0041928653ae7mr30191213uam.70.1671492539898; Mon, 19
 Dec 2022 15:28:59 -0800 (PST)
MIME-Version: 1.0
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
 <CAFEAcA-yvQCGRURDBDLkgLgS2bxY-_Jat_2v-gDGde74eELRZg@mail.gmail.com>
In-Reply-To: <CAFEAcA-yvQCGRURDBDLkgLgS2bxY-_Jat_2v-gDGde74eELRZg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Dec 2022 09:28:33 +1000
Message-ID: <CAKmqyKPcS1-ByO0LCg_c9V0wv9WBeUWdwVXWGyecyNJx2izdyg@mail.gmail.com>
Subject: Re: [PULL 00/45] riscv-to-apply queue
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

On Tue, Dec 20, 2022 at 1:12 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 19 Dec 2022 at 02:29, Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > The following changes since commit 562d4af32ec2213061f844b3838223fd7711b56a:
> >
> >   Merge tag 'pull-loongarch-20221215' of https://gitlab.com/gaosong/qemu into staging (2022-12-18 13:53:29 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-20221219-3
> >
> > for you to fetch changes up to e59b3c6ece6a1351aeca6b916cd9674e23d15e89:
> >
> >   hw/intc: sifive_plic: Fix the pending register range check (2022-12-19 10:42:14 +1000)
> >
> > ----------------------------------------------------------------
> > First RISC-V PR for QEMU 8.0
> >
> > * Fix PMP propagation for tlb
> > * Collection of bug fixes
> > * Add the `FIELDx_1CLEAR()` macro
> > * Bump the OpenTitan supported version
> > * Add smstateen support
> > * Support native debug icount trigger
> > * Remove the redundant ipi-id property in the virt machine
> > * Support cache-related PMU events in virtual mode
> > * Add some missing PolarFire SoC io regions
> > * Fix mret exception cause when no pmp rule is configured
> > * Fix bug where disabling compressed instructions would crash QEMU
> > * Add Zawrs ISA extension support
> > * A range of code refactoring and cleanups
>
> Hi -- gpg says your key expired last week. What keyserver can I
> download the updated key from, please ?

Sorry about that.

You should be able to get a valid key from:

https://keys.openpgp.org/search?q=F6C4AC46D4934868D3B8CE8F21E10D29DF977054

Alistair

>
> thanks
> -- PMM

