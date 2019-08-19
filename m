Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A4E91CD2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 08:03:21 +0200 (CEST)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzalE-0008BI-B4
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 02:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzaj3-0006yG-LR
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 02:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzaj2-000249-OZ
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 02:01:05 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:36200)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hzaj2-0001y8-IF; Mon, 19 Aug 2019 02:01:04 -0400
Received: by mail-ed1-x542.google.com with SMTP id p28so535296edi.3;
 Sun, 18 Aug 2019 23:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zZ2BwGWXncQccBVt/8NdMYiHta8HHiI2QR+2RRI4Ao8=;
 b=VZI0uHJufMNSzXHrN2z3TYz6WFs1Up9E7NURyoUANhXL0TiCKjfzJTt2Gr5/JpzWMQ
 7HzkVy3w+a/86ZwaC8cQZPYKjC9r9ZJjIjmuiEpqr1mSJdWz0u2heSZ/E2G67V4u0wYU
 qXAjNRV5A4o9JuVGnU+YP6oJ+ovaGzbRi1WnXSZFcO811QFN3C18pncJzWccKHhjhHd9
 koZTgZLJMiYdnMX+LlKskOjibZJHX19b1EoYtr6ikTHbYNr3bBebJS72rQVVXj7P2tPN
 6SXobgTA2X3egnq9dll6NLg0FkRzvTfSvQsnMY5e3GhtZfE1QsqxlSFA9GjCTMjvLEFq
 bpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zZ2BwGWXncQccBVt/8NdMYiHta8HHiI2QR+2RRI4Ao8=;
 b=UidrIsC123wxFEsDeefXfNpeL+Z/sSnOH4qXkPG76mnz1tXLWxqKYi7vfnlW+MnJ/a
 zMmnj39OHHA9fmiTa+I1fGAuWa9HvqdgwqDKqjVNqK/FzsZ6zxphKF0ga7olvvYPIfJO
 nE0cKPrxXoIDgs+czTGUSCkCOxCi7LqpthH1cQ4j2nPUJ1wXS3oxAoRE3lOsKhliahx9
 b80WabrPS5kbrtqUbDrYoxUHlPCGyT2K0DReiMyJ0vOeiP+GPTD0u4z1HUxyyp7DgL1P
 5Z1hSdzEHx4Qiw20BfbKZUkXKdsT85K2XOjOPbQT6kgJkIz/WhAOZV0F+bWNw+GtYgtH
 K1Jw==
X-Gm-Message-State: APjAAAUKsYrpgktiYLnIdnzyyqojm61ac7zXTIhu1Hjh8uQ7C9PU4kNU
 r6SgqvtlAsifboUVpkPzP0Vilwhnc2wZvDMUHM8=
X-Google-Smtp-Source: APXvYqwDDi1KboC/UIGX0duPzTaZr7LgQF6XKuvf8pqO7X6kX8OWT41nKJJGFjkPIDuH3R6RvbMwJaMxUiyMdHm2PkE=
X-Received: by 2002:a17:906:340e:: with SMTP id
 c14mr19859892ejb.170.1566194451850; 
 Sun, 18 Aug 2019 23:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <1564577101-29020-1-git-send-email-bmeng.cn@gmail.com>
 <1565232570-29296-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKPQ0z-VtiebdtBqhBocgGkgeLLbtcawhwss0YpoYZyH2A@mail.gmail.com>
 <CAEUhbmWpzQftgOdchxFSQEUNv1_9Zra_n=b9eigh_CRT+6sq1Q@mail.gmail.com>
In-Reply-To: <CAEUhbmWpzQftgOdchxFSQEUNv1_9Zra_n=b9eigh_CRT+6sq1Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 19 Aug 2019 14:00:40 +0800
Message-ID: <CAEUhbmWmCqCGpbw30QS_kYADnJkZOVUAn3eqmxLKPWhHjfuT7w@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: Re: [Qemu-devel] [PATCH v2] riscv: rv32: Root page table address
 can be larger than 32-bit
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 14, 2019 at 5:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Palmer,
>
> On Sat, Aug 10, 2019 at 9:49 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Aug 7, 2019 at 7:50 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > For RV32, the root page table's PPN has 22 bits hence its address
> > > bits could be larger than the maximum bits that target_ulong is
> > > able to represent. Use hwaddr instead.
> > >
> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >
>
> Would you take this one too?
>

Ping?

What's the status of this patch?

Regards,
Bin

