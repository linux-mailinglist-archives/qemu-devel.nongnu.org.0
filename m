Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6AE5711A0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:58:57 +0200 (CEST)
Received: from localhost ([::1]:44766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7z6-0000Fz-4v
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oB7u5-0005Le-LR
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:53:45 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:47065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oB7u3-0006HA-Og
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:53:45 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s27so6541903pga.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 21:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yfrz5GsqkYvZo8aGSUqQYbA4xjW4hmI4d+p/5mMlCZ4=;
 b=puYN9wNnXLMTjBAtpvCqZsszliqs3e1vBK/50t1SLXVbjrgcWjDBHgXuLDWOUfS5cg
 +g7LRT1ITFfnVMAX7m9tOjlUlSlTV0NRGvSQMs04gfRwVI6rIL+45bg2ZzcVFA3nAuJf
 qcX+hHRWsmtyODr2HTC1UDWlvZbsW1al3RE6+rOPhsnR/FgBcW0wcRcDdNXwFmdoZ3bw
 82zYMZ9hW9DcgKW7pGQUIwdy2yGkgX4TYLetyd6wCQp1QjeAQnNjdoO0qoHelSqlu5xH
 b5iq3RVngiwrKS/JwJDqVNr2gc4AvZQ/QdxJo9Qd/lUWcVVZG6qJMB7772kOY6aygOvT
 FJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yfrz5GsqkYvZo8aGSUqQYbA4xjW4hmI4d+p/5mMlCZ4=;
 b=GhT2w2nEFNYg7fUEDsKb3sE71IalP/5aGIzNAaKoGGniBvS+Otua7VWDGLa/oXrStp
 icZ9MjozMMBnVySRjG7mJYtKz4C1+YTHp/FMzsy/9P8yCTPULK0lcrth+PzZ7nNqzCCb
 6z+AvdzK8TsA0aMfd1WkHxmLdlJhNr6AGC7ZU0QaB4n0chcGcg4c6cXp+1yzx6xawjn1
 gRe3eECE02BQ0hyUQG2CnlMMV7+C6+pcTeCcypGSKkeWLHE2Vzls48ja9zWqBuaiNr6r
 DkYLnvx1I7oAp56VkPHYOMy/NPmDxKg1FUWpBvyHBQ8H8fHR1e8eI6izVGSPMOgyqRoI
 RsSQ==
X-Gm-Message-State: AJIora9BEm9eO0YLFcmt6eodtIHxa3copvZ4GGrLxsvSp8tmnLJpPFSP
 GVAVUkRqqG7/rCxLOPWEmkzwEGI37VjKrNB+gos=
X-Google-Smtp-Source: AGRyM1u7DCGCazfd9dLAhGh0hHjRMCP2MUaLxBqrTU1g7UI+Y1ISsixfdhzemLMmjtyKiQ/dmBGvZN8N0VaFE/+VO6k=
X-Received: by 2002:a05:6a00:1303:b0:528:2ed8:7e86 with SMTP id
 j3-20020a056a00130300b005282ed87e86mr21618416pfu.4.1657601621946; Mon, 11 Jul
 2022 21:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220625223458.1273408-1-simon.sapin@exyr.org>
 <da785d05-e322-2e40-7a89-e926256c6dbe@exyr.org>
 <CAKmqyKN+xvOseT_5XeFgZ=b77giU+wdaZy=w9OgEFL8EXNGDVg@mail.gmail.com>
 <357832d7-6e23-4298-5dbf-cf9171e32e6e@exyr.org>
In-Reply-To: <357832d7-6e23-4298-5dbf-cf9171e32e6e@exyr.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Jul 2022 14:53:15 +1000
Message-ID: <CAKmqyKNtKTkER5y+O1p3S32GqFvpTKnsyxu+eRggAL7KV6TZPQ@mail.gmail.com>
Subject: Re: Booting bare-metal RISC-V virt (Was: [PATCH] Add some
 documentation for "dtb" devices tree blobs)
To: Simon Sapin <simon.sapin@exyr.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 27, 2022 at 4:15 PM Simon Sapin <simon.sapin@exyr.org> wrote:
>
> On 27/06/2022 07:40, Alistair Francis wrote:
> > We have previously kept the addresses backwards compatible. So that
> > software for an older virt machine will work on a newer one. There is
> > currently talks about changing the virt machine memory layout in a
> > breaking way and versioning in the current one though.
> >
> > So I don't really have a good answer for you. I would recommend
> > reading as much as possible from the device tree dynamically at boot.
> >
> > In general though we don't want to break people, we just might have to
> > make changes in the future to allow for new functionality.
>
> I agree that reading from the device tree as much as possible is good. We=
 there=E2=80=99s
> still a need to get code running at all, and finding the device tree.
>
> So it would be good to decide to make stable what=E2=80=99s needed to get=
 there (like was
> apparently decided for ARM) and document it.

Yeah, we are working towards that

>
> On principle maybe a firmware/bootloader could be entirely position-indep=
endent? But

I don't link the RISC-V toolchains suppor fully position independent code

> in what I=E2=80=99ve done/seen so far https://docs.rs/riscv-rt/latest/ris=
cv_rt/ has address
> ranges hard-coded in a linker script for different regions, and when pass=
ing an ELF
> file to -kernel, QEMU maps it to those addresses but boots at 0x8000_0000=
 regardless.

Yeah, I suspect we will keep the 0x8000_0000 as that's pretty standard

>
>
> >> * With `qemu-system-riscv32 -machine virt -bios none -kernel something=
.elf -s -S`,
> >> GDB shows that execution starts at the lowest address of RAM, not of f=
lash like I
> >> expected. Then what is emulated flash for?
> >
> > If you supply a flash image we will start executing from flash automati=
cally.
>
> Passing with -drive? Should I use that instead of -kernel?

If you want to pass a drive then yes, that's the better option

>
>
> >> * To what extent is the above calling convention standardized? I found=
 similar things
> >> in coreboot[4] and in OpenSBI[5]
> >
> > Good question. I don't think it's specified in a spec, but it is very c=
ommon
>
> Should we document this convention as something guest code can rely on?

We probably should at some point

Alistair

>
> --
> Simon Sapin

