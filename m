Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F05CEFE5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 02:25:21 +0200 (CEST)
Received: from localhost ([::1]:50362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHdJY-00037o-39
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 20:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38307)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHdIG-0002ep-II
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:24:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHdIF-0002y9-88
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:24:00 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:27100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHdIE-0002vj-JK
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:23:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570494239; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=OplKAgqTr65Hkpakpf37PaPcCQdfMS2D6asm2PWvOy4=;
 b=KXABZBOBTB8TMLbdwJUmxNOCPtDSFoUMQUYwFocG7lK0/+3MGKjpT1gjV+CWn74Gcqk1U7KG
 N4rTL49rdpLzAT+BBxrZ54sjDjE9TPIplUjri8vHVWCJv6lNK0scBksHvdoQVr8ZB3cRCO5/
 Hvs5ptch8IFOuc1Y27k6L5hBfby9dYLDp/6nByYywBanFcdAD+BCwHMXFR0hBjIVzbh7nNTi
 hvvUxt/nIXhhi0OC9tyM/xxCHZqEYIehzYtH8PvS+YW0LYaXsiDUH8/NjGI6kQ+sdROBL6el
 DDXz0EAlIITAgOkwR2buKkQrIQx1UliLQUkP6PmVtAwBtX1XuzG93g==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mxa.mailgun.org with ESMTP id 5d9bd71a.7fbf7c6e7cb0-smtp-out-n03;
 Tue, 08 Oct 2019 00:23:54 -0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id w67so10577339lff.4;
 Mon, 07 Oct 2019 17:23:54 -0700 (PDT)
X-Gm-Message-State: APjAAAUmVjAbFKkA2fl7bG/oQ5NeAR9qWYTyqmwHax+/AnhVg3jX3aJl
 ULIkPS+p1Ie2mPZO5tBY3gbcy9Dyv+tGp6f4LwY=
X-Google-Smtp-Source: APXvYqxgwH0csB4WlZEBh4rxOfaL6INyur+bOXoUKRhgxa9t/gwefu6lc3XYGMJQtEbuL1/xeYYLfV0oZrRnUmXKeC0=
X-Received: by 2002:a19:2489:: with SMTP id k131mr17852210lfk.52.1570494232310; 
 Mon, 07 Oct 2019 17:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191004151614.81516-1-jonathan@fintelia.io>
 <CAKmqyKPFuyuC6sGCRGJGo2f_3=2z33MmuXHZov5R0pc7A9O9Jg@mail.gmail.com>
In-Reply-To: <CAKmqyKPFuyuC6sGCRGJGo2f_3=2z33MmuXHZov5R0pc7A9O9Jg@mail.gmail.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Mon, 7 Oct 2019 20:22:47 -0400
X-Gmail-Original-Message-ID: <CANnJOVGDcGrM5FY12GBurSTWWD++EKdrkUB5o-ZEOPsBm8RhQg@mail.gmail.com>
Message-ID: <CANnJOVGDcGrM5FY12GBurSTWWD++EKdrkUB5o-ZEOPsBm8RhQg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Expose "priv" register for GDB
To: Alistair Francis <alistair23@gmail.com>
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 7, 2019 at 2:36 PM Alistair Francis <alistair23@gmail.com> wrote:
> On Fri, Oct 4, 2019 at 8:18 AM Jonathan Behrens <jonathan@fintelia.io> wrote:
> > @@ -296,6 +302,14 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
> >      } else if (n == 32) {
> >          env->pc = ldtul_p(mem_buf);
> >          return sizeof(target_ulong);
> > +    } else if (n == 33) {
> > +#ifndef CONFIG_USER_ONLY
> > +        env->priv = ldtul_p(mem_buf) & 0x3;
> > +        if (env->priv == PRV_H) {
> > +            env->priv = PRV_S;
> > +        }
>
> Why have this? There is no PRV_H so we should never be in that privilege mode.
>
> Alistair

This is hopefully more clear in the next version, but the idea is that
since GDB can try to set the privilege mode to *any* value this
function needs to make sure that it isn't set to something unsupported
like PRV_H.

Jonathan

