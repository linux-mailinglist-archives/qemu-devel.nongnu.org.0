Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE503CFC19
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 16:14:12 +0200 (CEST)
Received: from localhost ([::1]:56226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHqFf-0004CJ-JF
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 10:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHq4p-0001Kx-Ey
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHq4o-0000jM-7L
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:02:59 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:48121)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHq4n-0000f9-9E
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:02:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570543378; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=8zNle5/VxdvMH7fjCV+Jj0vLf54BpetbGDTm4WTua4o=;
 b=xvI49Nfif0h4DHKu9WbU0ljHgmnFMhO4AKWpd/4Af3M8htEh6gujSQwWkbfLWfhDq2HdH1pr
 PAzk7fi/G0GBm9HReM8tJQTY+76GREyGWQo7U6kx4f4DgX1GNyPIPh4XuNBg6xZ/+ekIqj9b
 wPeH7O0ANYe9E3TB3pVugOL0fvtA6xKf+uM7G/OAGzPJ0JE/pQH1zmu8WHxAkHRNp8RVLuQ8
 uP+NoqKWoc4BA2HGg6B2GlrkI0FKD7iWJ1RM7m82L8glOSMsg4oQBIF+9QgCPodg+Rj/Ruto
 whR5ubXbPq0yXbw4tFvo1kJW4DQWr93X1JrfPUyU2Ptf+s7muAm3ow==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mxa.mailgun.org with ESMTP id 5d9c970f.7f81ed39b3b0-smtp-out-n02;
 Tue, 08 Oct 2019 14:02:55 -0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 7so17680467ljw.7;
 Tue, 08 Oct 2019 07:02:54 -0700 (PDT)
X-Gm-Message-State: APjAAAU0mzrKgzx168lPJGkNyDop/LMV5Ymbny2GjpAxukmoru7h+Zja
 P3YBrtljV3mblaUzLUAmn48gRYkvlEw+u31DcHA=
X-Google-Smtp-Source: APXvYqz98wF5Iiu8KibDWCUnQLdRlYUwWHT4FdlWRbKL/t5JuS9VIdDG+bXXVdDPMUkTBehqFWTpdWg0dYKlKWoVPX8=
X-Received: by 2002:a2e:6e04:: with SMTP id j4mr19408425ljc.99.1570543372757; 
 Tue, 08 Oct 2019 07:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191008001318.219367-1-jonathan@fintelia.io>
 <20191008001318.219367-2-jonathan@fintelia.io>
 <CAEUhbmXHdj=-28inH5-ToS4tOAYOva1Lc1QCz6RGijkMrWhFdg@mail.gmail.com>
In-Reply-To: <CAEUhbmXHdj=-28inH5-ToS4tOAYOva1Lc1QCz6RGijkMrWhFdg@mail.gmail.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Tue, 8 Oct 2019 10:01:47 -0400
X-Gmail-Original-Message-ID: <CANnJOVH6a5m=bVhyk=cKbJ51TRv2XnimfrxHQEY4LmWD7sKXCQ@mail.gmail.com>
Message-ID: <CANnJOVH6a5m=bVhyk=cKbJ51TRv2XnimfrxHQEY4LmWD7sKXCQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] target/riscv: Tell gdbstub the correct number of
 CSRs
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.61.151.224
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 8, 2019 at 5:54 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Oct 8, 2019 at 8:15 AM Jonathan Behrens <jonathan@fintelia.io> wrote:
> >
> > If the number of registers reported to the gdbstub code does not match the
> > number in the associated XML file, then the register numbers used by the stub
> > may get out of sync with a remote GDB instance.
>
> I am not sure how to trigger the out of sync issue. Do you know how?

Try applying the next patch in the series without this one. Attempting
to access the priv register will return E14 because GDB will think
that priv has register number 309 (since the last register with an
assigned regnum is fcsr=68 and then none of the 240 CSRs have assigned
numbers) while the GDB stub will think that the number is 4165 (=33 +
36 + 4096).

