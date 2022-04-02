Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CAB4F0102
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 13:21:59 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nabpO-0002kJ-6d
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 07:21:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1naboB-00021m-Ge
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 07:20:43 -0400
Received: from [2607:f8b0:4864:20::112f] (port=43204
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nabo9-0000q0-RD
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 07:20:43 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2e5e31c34bfso56065777b3.10
 for <qemu-devel@nongnu.org>; Sat, 02 Apr 2022 04:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qqioWiBIwW6rsyOFImTV+eWLi6qkTL9+6ydS13uA4LE=;
 b=VaLoDo1BqKkIAm20Hb/R6OyMPHTmfqjS4cg9PkwocSUJGhxICz3rUf0vgLedPxar3K
 PlNqkSE3xyK1INlKZbC6eDrj9RToi/8ogcyr/07Gg82x1YwLWIBwi/p/+71ylzAGzAwE
 HYsGGnDzLxGvuFMF9SifN9sciGbvf1bMm7iGxJVC9/r+bNfWepKDldLpKPLy5IetBN2U
 fvwJkt/wgfRp+faXvSANQjlGhzPS5VAz2nJwWohAcOzTmDwx8FvWaGPGTPTwePlnAPi/
 2zVy8YWdgZBNYMWHZK2V5fPc0o1nvcVSwd1mN3IKHc+AeBwNebucvvcDEHKlnFtZRvyL
 CQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qqioWiBIwW6rsyOFImTV+eWLi6qkTL9+6ydS13uA4LE=;
 b=2xw/FDhrX091TsPDlo2JqHQJNlDtoNIt+Zybgmq62yviv11VfPeoTWKIP7uNIA4+3l
 cdF5OefUkNoFZ56GBAg9z8O7XKA9p1mNBdJhlQUfEKpdLi0K1Q8MSelzJyPmxCyNaq26
 shwHnN4kBATU0H9s5Z66cYbekoHqm8Zp0RipiQeu6wTVMFHlGGBE6zK1oM6NRuCh3qha
 TqvrBH/WxsCXonD5HTpzrEztMeeczDk8vg9gBL6W4L1WRIp7KQaKAn66WZ+HXhV2WNfn
 QDC83dohxGhh0KamaolOc7eBUut6iD5cl7BiQjoVxtLGLOEVXuIdzDVhqmcvlW05H6gE
 hdAg==
X-Gm-Message-State: AOAM533Tczo5rgUWsh2u9+d1WiPE5xwoMWUrZtrLezZduLNb/C4I/DLE
 fg2fkT3A1DwxMh6Pquc2Yzzznk5bfru8hZQnh7U=
X-Google-Smtp-Source: ABdhPJyfdNMATnkg7kHBH3elD3mR5VNrkZITYyIrfrs5mvrr0tO9W0U/9+uT9CxXoUYsO2RaO97pLVhSJmgLCpHlUj0=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr14287329ywk.209.1648898435329; Sat, 02
 Apr 2022 04:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
 <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
 <CAEUhbmVXiB+mbbjhy0sT2PhQHNJgdHmehXfcE18g=E3SPffndQ@mail.gmail.com>
 <87wngj3aj2.fsf@linaro.org>
 <CAFEAcA_O8=0KZ=sjzP7GZ=ytSQm0P+zB_t=jQ2nZnw6b721Yxw@mail.gmail.com>
 <CAEUhbmWjjqihJb70x2k4+yf9dr8yh+_eMRu0MubofSbw+C9izQ@mail.gmail.com>
 <CAFEAcA_m0wUWqJQ2-n5bYZq=xPkUW+SOU2555-z=LMgzrm2W0Q@mail.gmail.com>
 <CAEUhbmV7BnHHAoY+jHAioiYo2Vz-2VJOpgcz7WRFx6+FGvaYxA@mail.gmail.com>
In-Reply-To: <CAEUhbmV7BnHHAoY+jHAioiYo2Vz-2VJOpgcz7WRFx6+FGvaYxA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 2 Apr 2022 19:20:24 +0800
Message-ID: <CAEUhbmXNBt1L0jqma2XwCEr5C70r=3z0mH-A_1qq=3zKee1f1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 12:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Mar 28, 2022 at 5:10 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
> >
> > On Mon, 28 Mar 2022 at 03:10, Bin Meng <bmeng.cn@gmail.com> wrote:
> > > IMHO it's too bad to just ignore this bug forever.
> > >
> > > This is a valid use case. It's not about whether we intentionally wan=
t
> > > to inspect the GIC register value from gdb. The case is that when
> > > single stepping the source codes it triggers the core dump for no
> > > reason if the instructions involved contain load/store to any of the
> > > GIC registers.
> >
> > Huh? Single-stepping the instruction should execute it inside
> > QEMU, which will do the load in the usual way. That should not
> > be going via gdbstub reads and writes.
>
> Yes, single-stepping the instruction is executed in the vCPU context,
> but a gdb client sends additional commands, more than just telling
> QEMU to execute a single instruction.
>
> For example, the following is the sequence a gdb client sent when doing a=
 "si":
>
> gdbstub_io_command Received: Z0,100000,4
> gdbstub_io_reply Sent: OK
> gdbstub_io_got_ack Got ACK
> gdbstub_io_command Received: m18c430,4
> gdbstub_io_reply Sent: ff430091
> gdbstub_io_got_ack Got ACK
> gdbstub_io_command Received: vCont;s:p1.1;c:p1.-1
> gdbstub_op_stepping Stepping CPU 0
> gdbstub_op_continue_cpu Continuing CPU 1
> gdbstub_op_continue_cpu Continuing CPU 2
> gdbstub_op_continue_cpu Continuing CPU 3
> gdbstub_hit_break RUN_STATE_DEBUG
> gdbstub_io_reply Sent: T05thread:p01.01;
> gdbstub_io_got_ack Got ACK
> gdbstub_io_command Received: g
> gdbstub_io_reply Sent:
> 3848ed0000000000f08fa6100000000003000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000100000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
00000000000000000000000000000000000001f90000000030a5ec000000000034c41800000=
00000c9030000
> gdbstub_io_got_ack Got ACK
> gdbstub_io_command Received: m18c434,4
> gdbstub_io_reply Sent: 00e004d1
> gdbstub_io_got_ack Got ACK
> gdbstub_io_command Received: m18c430,4
> gdbstub_io_reply Sent: ff430091
> gdbstub_io_got_ack Got ACK
> gdbstub_io_command Received: m18c434,4
> gdbstub_io_reply Sent: 00e004d1
> gdbstub_io_got_ack Got ACK
> gdbstub_io_command Received: m18c400,40
> gdbstub_io_reply Sent:
> ff4300d1e00300f980370058000040f900a00191000040f900b00091000040f900e004911=
e7800f9fe0340f91e0000f9ff43009100e004d174390094bb390094
> gdbstub_io_got_ack Got ACK
> gdbstub_io_command Received: mf9010000,4
>
> Here "mf9010000,4" triggers the bug where 0xf9010000 is the GIC register.
>
> This is not something QEMU can ignore or control. The logic is inside
> the gdb client.
>

Ping for this series?

Regards,
Bin

