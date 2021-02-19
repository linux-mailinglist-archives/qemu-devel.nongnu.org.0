Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D7731F979
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:40:49 +0100 (CET)
Received: from localhost ([::1]:57430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD55U-0003es-J3
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD51Y-00013p-Vd
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:36:44 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:44452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD51W-0006yL-Fj
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:36:44 -0500
Received: by mail-yb1-xb29.google.com with SMTP id f4so5368725ybk.11
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 04:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x0Y8xLSTs49Zb1R18/ULJ1tew/YZ++kCHEHYHW4YFq4=;
 b=Svfb4wVrh3Mvawi9iGpPXvLAEAHt/LCjML7l/ib28Xh9F8vncCFtXNJBB+19Gh0M/K
 c+BloOBP6hTH/A8glMwj9ppFGXdSYN812JI3XGKiI1sg4RJvgbWNLilqbnqozXLLkk1/
 wHpgEFAvpUte6jkNpaCqRjJxwT0cQU1fV922+kRhUwv08+AJFTB6iUukM7swfr/oQ+35
 Y0Ppxo1ZRFbbQUMpmG9wC53KOF4tqbnAXrkMUdAEwJdUeEzOzvahVaLQ12jBRvoOXMVp
 +mrr6whRg6LgUC5SEUPIoZwl8SEcUVYZqePQSF3Jhcx+iymck1NqoekesKRYb+wUOf+5
 AfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x0Y8xLSTs49Zb1R18/ULJ1tew/YZ++kCHEHYHW4YFq4=;
 b=LY+79H1ZRCnVQ5BAMhXB1SlDpTamILYwJt7nyYjbrHm59sAtwzXARGYotZF6KkdGwo
 aDgNm/8a6iLJ+hH4BoUONFDNSDtxQ5UkzGHPvlevB9MCfsRZdMAE3o0DKppH/S3kxqrc
 sN0BIxeAiTq4e/xJ60ZDUaswQKztJaAp7Yfd+lx1ie0yb8+1UMSofMoZFfxalpHhZERy
 M/OZdSZr8XjlP+5ZyOZVpeD5pZqBOw0IEIPBerRKp4gtC3dKlXYBdfONwiIjV9uUrFyj
 06qB2twBMaIxBB4ZeqDJWQ+gKTZra4OlDaZ7hUUeJr/ZQpWPmggd+5/xuQ/fDhF/amPx
 LT5Q==
X-Gm-Message-State: AOAM531gX6P6ZhCbI4lAbbI7Gvgn3O0g3ozI6aKxwLemyhYebiZDCvGC
 QhK6rxYRUBQS7RV8RRoYWsIorREeM9k7owxxgQ0=
X-Google-Smtp-Source: ABdhPJwzt1TsX6uggm6RRsUut225RoF9qyBJznEd4SEhPD5INDv1bF7pAb3QC0h9UeJRcAHWhI6f3qL+Bzf8pZaiEjg=
X-Received: by 2002:a25:d28b:: with SMTP id
 j133mr12609154ybg.517.1613738201274; 
 Fri, 19 Feb 2021 04:36:41 -0800 (PST)
MIME-Version: 1.0
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
 <CAFEAcA_aEtpfMScS3uzrpbBqAgqGWsWjeisUXCSpqdJJ7=uCYw@mail.gmail.com>
 <CAEUhbmXeYDkKiNnkffRoE8dZc_=-vByoQfr6gdSSUNubkCaB8Q@mail.gmail.com>
 <CAFEAcA8BwTO7OT91B=d1tZrk9+PMiSLTmKtiv_Yd2BNdb1syRQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8BwTO7OT91B=d1tZrk9+PMiSLTmKtiv_Yd2BNdb1syRQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 19 Feb 2021 20:36:29 +0800
Message-ID: <CAEUhbmWRVVhn=NCQjvnbhUF0x8RgPiX-EC7JnpCN4=a4vo3aZg@mail.gmail.com>
Subject: Re: [PULL 00/19] riscv-to-apply queue
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 10:22 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 18 Feb 2021 at 14:07, Bin Meng <bmeng.cn@gmail.com> wrote:
> > On Thu, Feb 18, 2021 at 9:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > Fails to compile, 32 bit hosts:
> > >
> > > ../../hw/riscv/virt.c: In function 'virt_machine_init':
> > > ../../hw/riscv/virt.c:621:43: error: comparison is always false due to
> > > limited range of data type [-Werror=type-limits]
> > >          if ((uint64_t)(machine->ram_size) > 10 * GiB) {
> > >                                            ^
> > > ../../hw/riscv/virt.c:623:33: error: large integer implicitly
> > > truncated to unsigned type [-Werror=overflow]
> > >              machine->ram_size = 10 * GiB;
> > >                                  ^~
> >
> > This kind of error is tricky. I wonder whether we should deprecate
> > 32-bit host support though.
>
> 32-bit host is still not uncommon outside the x86 world...
>
> The thing that makes this particular check awkward is that
> machine->ram_size is a ram_addr_t, whose size is 64 bits if
> either (a) the host is 64 bits or (b) CONFIG_XEN_BACKEND is
> enabled, so it's effectively only 32-bits on 32-bit-not-x86.
>
> It might be a good idea if we decided that we would just make
> ram_addr_t 64-bits everywhere, to avoid this kind of "we
> have an unusual config only on some more-obscure hosts" issue.
> (We did that for hwaddr back in commit 4be403c8158e1 in 2012,
> when it was still called target_phys_addr_t.) This change
> would probably be a performance hit for 32-bit-non-x86 hosts;
> it would be interesting to see whether it was measurably
> significant.

Okay, will send a patch to change ram_addr_t to 64-bit.

Regards,
Bin

