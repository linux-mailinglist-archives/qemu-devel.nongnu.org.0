Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EEA6523AF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:32:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ebS-0002a2-Dh; Tue, 20 Dec 2022 10:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7ebQ-0002ZS-C7
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:32:24 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7ebN-0002xw-PZ
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:32:24 -0500
Received: by mail-pl1-x632.google.com with SMTP id w20so6023755ply.12
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SdGSXS19zuYY3YpUNGaxKlRdApS8FKky8y20uNBNZFs=;
 b=zVFdOVeX9gRcw5/FlG/cH+ihv77SK84ENYkVTyfGN2RNOjWk40dxofUsTV3w1T95lA
 PFfI6v9ryFxjFVMDc8QTYE/9TFNlRKG3vKAQkC8cU5nxx+ocOxBKvsyM/m5YfzzxbhxO
 vcuBvT0dOvYs4d+HVDR73aAX9ApRE/utBECz3UcRrnI6Y71JQvzhuarSyUI4bFx9Jbdl
 TjxVQrEC6aFdwsfBg0SQIdKzz6kCDlqPBSL6ojoypWRYneL11SDY8kBtoNm6/PMWrDgq
 RUSTbfrk50Xby1/3M8lfIq+UlgPTAJR8/BNQKXURQaDak4fbu2souuM+nuPElrCYqy/n
 lD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SdGSXS19zuYY3YpUNGaxKlRdApS8FKky8y20uNBNZFs=;
 b=KuVKa03HI+cqpg/McvlkWHx4HjxOSidxVI4a8O7ExYH1oVioEzXhU6hB6MXEd/gmqk
 OnmYnc8UhzOxY6NyxTDfQOp23yB16IgeigJVOi3SEluowylHOk9qWbM0ukxfUIypkAgq
 diWtLdR9AtjUuIpM3Z1fw0yzU14h71EeCgOaFECCiA2Q10oaKU84GJYoT9OXGWW9xzzp
 HQc3CoZ8u8cT5gsyRSCbIYfY3Gj9jt866uJfzOJO+hc74b+cVFL3R+XdVrGgD7ORxbBc
 5/yf3UqDQwfwvrobBnEgz/ZHhJziFg6NNP/UlO0kyppHGfIOXyZriJAtG5Tf0Z5h1o1U
 y5gQ==
X-Gm-Message-State: ANoB5pm1Q3lVOLFPrGyyQj+66C4ZzsPAsHwC6AOjzP3qEdUtBWMNEJtA
 /SpJonSQ042m0uvDvnX2Cz+cYgK5/1pXSH1kYYyK7g==
X-Google-Smtp-Source: AA0mqf6ewownU6wHpCG0I8YAsMjNa9J1jGFJlSIjf2IIEOssBi7pvCE38nqUqP3XzNnUIxhJF7DkXchzj8+8Ap43QPA=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr37200899plt.60.1671550340239; Tue, 20
 Dec 2022 07:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
 <CAFEAcA-yvQCGRURDBDLkgLgS2bxY-_Jat_2v-gDGde74eELRZg@mail.gmail.com>
 <CAKmqyKPcS1-ByO0LCg_c9V0wv9WBeUWdwVXWGyecyNJx2izdyg@mail.gmail.com>
In-Reply-To: <CAKmqyKPcS1-ByO0LCg_c9V0wv9WBeUWdwVXWGyecyNJx2izdyg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Dec 2022 15:32:08 +0000
Message-ID: <CAFEAcA-b9bGmELE=srcfXUL30JhCNMt38yrwoi0+L_-ALbedqQ@mail.gmail.com>
Subject: Re: [PULL 00/45] riscv-to-apply queue
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
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

On Mon, 19 Dec 2022 at 23:29, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Dec 20, 2022 at 1:12 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 19 Dec 2022 at 02:29, Alistair Francis
> > <alistair.francis@opensource.wdc.com> wrote:
> > >
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > The following changes since commit 562d4af32ec2213061f844b3838223fd7711b56a:
> > >
> > >   Merge tag 'pull-loongarch-20221215' of https://gitlab.com/gaosong/qemu into staging (2022-12-18 13:53:29 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-20221219-3
> > >
> > > for you to fetch changes up to e59b3c6ece6a1351aeca6b916cd9674e23d15e89:
> > >
> > >   hw/intc: sifive_plic: Fix the pending register range check (2022-12-19 10:42:14 +1000)
> > >
> > > ----------------------------------------------------------------
> > > First RISC-V PR for QEMU 8.0
> > >
> > > * Fix PMP propagation for tlb
> > > * Collection of bug fixes
> > > * Add the `FIELDx_1CLEAR()` macro
> > > * Bump the OpenTitan supported version
> > > * Add smstateen support
> > > * Support native debug icount trigger
> > > * Remove the redundant ipi-id property in the virt machine
> > > * Support cache-related PMU events in virtual mode
> > > * Add some missing PolarFire SoC io regions
> > > * Fix mret exception cause when no pmp rule is configured
> > > * Fix bug where disabling compressed instructions would crash QEMU
> > > * Add Zawrs ISA extension support
> > > * A range of code refactoring and cleanups
> >
> > Hi -- gpg says your key expired last week. What keyserver can I
> > download the updated key from, please ?
>
> Sorry about that.
>
> You should be able to get a valid key from:
>
> https://keys.openpgp.org/search?q=F6C4AC46D4934868D3B8CE8F21E10D29DF977054

Thanks. The pullreq seems to fail in 'make check-tcg' for the linux-user
tests:

TEST test-noc-with-libbb.so on riscv64
make[1]: *** [Makefile:173: run-plugin-test-noc-with-libbb.so] Error 1
make: *** [/builds/qemu-project/qemu/tests/Makefile.include:56:
run-tcg-tests-riscv64-linux-user] Error 2


https://gitlab.com/qemu-project/qemu/-/jobs/3502502318

thanks
-- PMM

