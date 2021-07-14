Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB323C7E9A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 08:37:19 +0200 (CEST)
Received: from localhost ([::1]:43842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3YWE-0006kD-D3
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 02:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3YVO-000667-Rg
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 02:36:26 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3YVN-0008OF-9D
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 02:36:26 -0400
Received: by mail-io1-xd29.google.com with SMTP id l5so723669iok.7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 23:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f/DdZNzyhyL43t9KgNCSu5J2OVGBQQAUz9jFoY+pJFQ=;
 b=DVKRIPAy7n8HwMSmwqZvuP9X5f/pVjTvQ9CB/LYjfIagkGXiGOs9At6OocKbzEfere
 ypa1h2qIKOTqMT8gsTaBKMN+Zy89oNAPxF4W12v9Ln1GJ2O8UQNneR9gTVjJbeeiCZza
 ynlRz788g7nn6WoJYM91D0bi1EhDYam+4CTVuWxJDfv9nFzSRA20SBOWVPUQ/wHwtvMk
 ZPpy+2plQzXQ7jt+xvuAjFMc4licb8yciytQxasJ1ltqZcRNRkkDtb0b1l3uf5YO9rez
 cV2vbgyTP2M/S2TAapE2HfOeQ3BgKVBBtxYnNGnL2TJIOXtW0rw79Xz0OlchNdn9EOqt
 pnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f/DdZNzyhyL43t9KgNCSu5J2OVGBQQAUz9jFoY+pJFQ=;
 b=BTq5puqVV1vOdcJdMnODa+Z6bmNZUZNvsBYfZCR3j6kBqBmE85g+GIeMxmv8mIgach
 0OKJAgtsve0DtbzQS9vCMrJXJKN+ZQBaWDQoV7Yo2Mek3Brw4cSaertG3MYqKZKqNajL
 +Qf69tZU6KjTanGGz4MHJ7wYzIGO1QoyPEf9bfqo6Sv0v1nTzRLc2bQXoQ1Bu/qqBU9n
 4sL+R0NJh8dUlMjbUQTB6Pj1FxPJS08w2shl0WnWetnL3W3V7O9BQdNkIEhkX409XY8j
 UH4SLbP5BspiEhn5jlC3dat8J+lUMxORRPrxKsKq9SZNS9MaR1aDwHLALdgCOMnOWS6r
 Xsng==
X-Gm-Message-State: AOAM531BTX6b62rwO5mIzRQWLWjGQwMPfL00gk2CFsbl9ptglTu/XVoc
 IuJ+15roGu97q5cVgJflSMMP8mirEETwNO03kQA=
X-Google-Smtp-Source: ABdhPJzXXyAfgmVmpaaKdyF3w9Po3JCrUW9hDmMUD521Y/a7a6sKfQlmbrup5OiW875qxhicn3g1MuyISQQoZccZPPg=
X-Received: by 2002:a05:6638:25c7:: with SMTP id
 u7mr3074538jat.26.1626244583803; 
 Tue, 13 Jul 2021 23:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200714003254.4044149-1-alistair.francis@wdc.com>
 <20200714003254.4044149-5-alistair.francis@wdc.com>
 <CAFEAcA-OmEhVkZFryiJjy693pTEtMLR=MHzEi6y4FSu7Zy=6Dg@mail.gmail.com>
In-Reply-To: <CAFEAcA-OmEhVkZFryiJjy693pTEtMLR=MHzEi6y4FSu7Zy=6Dg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 14 Jul 2021 16:35:57 +1000
Message-ID: <CAKmqyKOmGX8BFNtGHqbs4Ye7eMitYbn8a0rSSJY50QWv+LHf0A@mail.gmail.com>
Subject: Re: [PULL 04/15] RISC-V: Copy the fdt in dram instead of ROM
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
Cc: Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 8:44 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 14 Jul 2020 at 01:44, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > From: Atish Patra <atish.patra@wdc.com>
> >
> > Currently, the fdt is copied to the ROM after the reset vector. The firmware
> > has to copy it to DRAM. Instead of this, directly copy the device tree to a
> > pre-computed dram address. The device tree load address should be as far as
> > possible from kernel and initrd images. That's why it is kept at the end of
> > the DRAM or 4GB whichever is lesser.
>
> Hi; Coverity reports an issue in this code (CID 1458136):
>
> > +uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> > +{
> > +    uint32_t temp, fdt_addr;
> > +    hwaddr dram_end = dram_base + mem_size;
> > +    int fdtsize = fdt_totalsize(fdt);
> > +
> > +    if (fdtsize <= 0) {
> > +        error_report("invalid device-tree");
> > +        exit(1);
> > +    }
> > +
> > +    /*
> > +     * We should put fdt as far as possible to avoid kernel/initrd overwriting
> > +     * its content. But it should be addressable by 32 bit system as well.
> > +     * Thus, put it at an aligned address that less than fdt size from end of
> > +     * dram or 4GB whichever is lesser.
> > +     */
> > +    temp = MIN(dram_end, 4096 * MiB);
> > +    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> > +
> > +    fdt_pack(fdt);
>
> fdt_pack() can return an error code, but we are not checking its
> return value here.
>
> (This is one of Coverity's heuristics where it only reports failure
> to check errors if it sees enough other callsites in the codebase
> which do check errors to make it decide this is an "always need a
> check" API, which is why the error has only popped up now a year on...)

Thanks Peter, sending a patch now.

Alistair

>
> > +    /* copy in the device tree */
> > +    qemu_fdt_dumpdtb(fdt, fdtsize);
> > +
> > +    rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
> > +                          &address_space_memory);
> > +
> > +    return fdt_addr;
> > +}
>
> thanks
> -- PMM
>

