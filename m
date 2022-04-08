Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3034F8D4F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 08:02:56 +0200 (CEST)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nchhu-0002UD-Kz
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 02:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncheE-0001l0-F1
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 01:59:06 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncheC-0001Y1-Nw
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 01:59:06 -0400
Received: by mail-yb1-xb31.google.com with SMTP id r5so3615181ybd.8
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 22:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ri20GATkINNyDNVzBP6Gcei+aMB/E629CADrO/FDXR0=;
 b=f+ncApPvzV8teXXPMsRCETOztMKf3nRT+ab0o2HW/tE9tXfR9yU5xxKv4gEESNpEA/
 1JypENN5vdNCxcOOfUfQiHd3cmSMuuRFEuZO1zycYDTFgsrb1oytDuET1M/SFUhiYYBN
 Rj8+U7I5Yd79u2g5hQw3CfmoFXxDhQmaLNuuWWBYzd3aH0wCRRE3cRWOS2nxdu2pW0kj
 24+vb2pEclFPWEcSBXkMt/VflHsWac7dWx7BENi7ndPTN71MhNSkDV1wKZBOl2J0S4IO
 D0rTpvcXKsVmxnjUaJpqxwbHL5W779nbfF3V64MIkhrNTOYKuMXgZbdcPjeT1382ta1U
 PqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ri20GATkINNyDNVzBP6Gcei+aMB/E629CADrO/FDXR0=;
 b=Xxlr7QQrEJUCfvfayuHYnGHndwMY1pTeb6bqgY7u/iGpJZ0Fa15o4L7wOhQf65rqqm
 /9PMsMArWFx7nAMaylngJ+kbl5YdJxSiowsBMsVgbYbZs7rlGJZxiDgczv8q9UaU8s4a
 sLUUROzcvQKYt43D7z5XNEwHkyY0114oqqBGy+cEHobFRM9iT8JMuOtL8w6pLJYxpvg6
 iSBZzF+luSoXYa4kvOWfohJu86OMgT0Z8F21UqzBLi+gu8RqpBbgq9fJbqJIUqtucVel
 +sWCxpxoPeg+5h62xHNLGjKgKsH/R0Jvgs8ra8o6aHoRIYoxxbRjBknADR78wQRER7PT
 kqMw==
X-Gm-Message-State: AOAM530LGb2Cu0CsFjn/lPGNkuFvko2+14QkQ7KxyhTaXyAUlOH1n99P
 D9x9qsfWcddGWJX4iwY2k/Cb93dQYEteb+sOZ0c=
X-Google-Smtp-Source: ABdhPJwNmiU9aJB40Se6FS9YvQP8shoPbYH9nTjnR/qmwAvsHIEKS4cdwfS858+tmYt2u3hyZnpotAR3FTLFYcmBf0c=
X-Received: by 2002:a05:6902:10c1:b0:63c:d3bf:59d2 with SMTP id
 w1-20020a05690210c100b0063cd3bf59d2mr12424612ybu.99.1649397543428; Thu, 07
 Apr 2022 22:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
 <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
 <CAEUhbmVXiB+mbbjhy0sT2PhQHNJgdHmehXfcE18g=E3SPffndQ@mail.gmail.com>
 <87wngj3aj2.fsf@linaro.org>
 <CAFEAcA_O8=0KZ=sjzP7GZ=ytSQm0P+zB_t=jQ2nZnw6b721Yxw@mail.gmail.com>
 <CAEUhbmWjjqihJb70x2k4+yf9dr8yh+_eMRu0MubofSbw+C9izQ@mail.gmail.com>
 <CAFEAcA_m0wUWqJQ2-n5bYZq=xPkUW+SOU2555-z=LMgzrm2W0Q@mail.gmail.com>
 <CAEUhbmV7BnHHAoY+jHAioiYo2Vz-2VJOpgcz7WRFx6+FGvaYxA@mail.gmail.com>
 <CAEUhbmXNBt1L0jqma2XwCEr5C70r=3z0mH-A_1qq=3zKee1f1Q@mail.gmail.com>
In-Reply-To: <CAEUhbmXNBt1L0jqma2XwCEr5C70r=3z0mH-A_1qq=3zKee1f1Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 8 Apr 2022 13:58:52 +0800
Message-ID: <CAEUhbmVLkLbknHpOncFYQNU3H8_f58-Z7KcgvtEffGP=eaiPLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 2, 2022 at 7:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Mar 29, 2022 at 12:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Mon, Mar 28, 2022 at 5:10 PM Peter Maydell <peter.maydell@linaro.org=
> wrote:
> > >
> > > On Mon, 28 Mar 2022 at 03:10, Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > IMHO it's too bad to just ignore this bug forever.
> > > >
> > > > This is a valid use case. It's not about whether we intentionally w=
ant
> > > > to inspect the GIC register value from gdb. The case is that when
> > > > single stepping the source codes it triggers the core dump for no
> > > > reason if the instructions involved contain load/store to any of th=
e
> > > > GIC registers.
> > >
> > > Huh? Single-stepping the instruction should execute it inside
> > > QEMU, which will do the load in the usual way. That should not
> > > be going via gdbstub reads and writes.
> >
> > Yes, single-stepping the instruction is executed in the vCPU context,
> > but a gdb client sends additional commands, more than just telling
> > QEMU to execute a single instruction.
> >
> > For example, the following is the sequence a gdb client sent when doing=
 a "si":
> >
> > gdbstub_io_command Received: Z0,100000,4
> > gdbstub_io_reply Sent: OK
> > gdbstub_io_got_ack Got ACK
> > gdbstub_io_command Received: m18c430,4
> > gdbstub_io_reply Sent: ff430091
> > gdbstub_io_got_ack Got ACK
> > gdbstub_io_command Received: vCont;s:p1.1;c:p1.-1
> > gdbstub_op_stepping Stepping CPU 0
> > gdbstub_op_continue_cpu Continuing CPU 1
> > gdbstub_op_continue_cpu Continuing CPU 2
> > gdbstub_op_continue_cpu Continuing CPU 3
> > gdbstub_hit_break RUN_STATE_DEBUG
> > gdbstub_io_reply Sent: T05thread:p01.01;
> > gdbstub_io_got_ack Got ACK
> > gdbstub_io_command Received: g
> > gdbstub_io_reply Sent:
> > 3848ed0000000000f08fa61000000000030000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000001000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
0000000000000000000000000000000000000001f90000000030a5ec000000000034c418000=
0000000c9030000
> > gdbstub_io_got_ack Got ACK
> > gdbstub_io_command Received: m18c434,4
> > gdbstub_io_reply Sent: 00e004d1
> > gdbstub_io_got_ack Got ACK
> > gdbstub_io_command Received: m18c430,4
> > gdbstub_io_reply Sent: ff430091
> > gdbstub_io_got_ack Got ACK
> > gdbstub_io_command Received: m18c434,4
> > gdbstub_io_reply Sent: 00e004d1
> > gdbstub_io_got_ack Got ACK
> > gdbstub_io_command Received: m18c400,40
> > gdbstub_io_reply Sent:
> > ff4300d1e00300f980370058000040f900a00191000040f900b00091000040f900e0049=
11e7800f9fe0340f91e0000f9ff43009100e004d174390094bb390094
> > gdbstub_io_got_ack Got ACK
> > gdbstub_io_command Received: mf9010000,4
> >
> > Here "mf9010000,4" triggers the bug where 0xf9010000 is the GIC registe=
r.
> >
> > This is not something QEMU can ignore or control. The logic is inside
> > the gdb client.
> >
>
> Ping for this series?
>

Ping?

