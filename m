Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261754EA6AA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 06:45:05 +0200 (CEST)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ3j5-0008R3-PE
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 00:45:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nZ3iB-0007lr-K9
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 00:44:07 -0400
Received: from [2607:f8b0:4864:20::112d] (port=36568
 helo=mail-yw1-x112d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nZ3i9-0006j6-Vp
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 00:44:07 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2e64a6b20eeso170869207b3.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 21:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ckeZLTdHWZR9ZkDXC8YQFoG2v0G3o9meuHKC0+X096U=;
 b=B8RRRun9IbKK9XNOMLoayLsi3g1BKJwOuEYIteVRzAAj4ozOSqairkjWtAFGTdEaMo
 N0n81H7ZmsaGo4hElrX9RZ0F3GgwEiEVzTMNOSc7bgTZA63tJZf9okEPGRCniBchJagz
 0+p06x873xQb37/t8GESprnAQhswIHrIVI9rxRlfkMEgRfsFXjEqZAlenHmi5PhCbwMV
 7e4U0xfKbbqgUZAi9uAgSlKYg6OVGroUShzgwpRUuqa6FeBJshOa72AD9G3Bqf1sb+mE
 zc3ySfXgA25aCkMmLQrSqZvw60/o1K2F30ZWJ7pN02iFphkUGTc/7lO348OLahhpOa9T
 ZOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ckeZLTdHWZR9ZkDXC8YQFoG2v0G3o9meuHKC0+X096U=;
 b=aSXFBYDmiI0QNzxbHdXfuNUwrk7f5FQPWQdF7ySmQcVuWi5sv3AInswb3ODhTIhRgw
 9GGg1kXFzoa6kmsfGK6miLksKhvmOoTaKrAT4CRM1eze9V/jwFl8yOcqZLDp4xi1dKFo
 slUFJpy45wDPloY4yNPUQIGLMuWekONqFmvNmrlZix54HwtC5OGixjS6PKbZt8ppe8Vw
 ATSn4lZoULygByCO0ZNEeHq4wCdzF7lEoH2uRmv6bIM8bpxVyxRNG2ekUQZWyLOqni6k
 d7QVMGFKcelWOrQVPLluSPFJe438jaVVT9MJGMV6g/PrOu0XHacyLZgMQY41CkKv+91H
 eGJg==
X-Gm-Message-State: AOAM5322mcwD7fLpgHD2lPNpfeV0S/TKZ4pLRYAhyGN4yv0vbCmP8Fhy
 zBzi1Zq8Q2qiTMcaP6S87dQSGUzin2rs0wnI1i4=
X-Google-Smtp-Source: ABdhPJxHOullBADNenJqPiVu2BvlLxlxNdTZpJA/WJG6KJ+l1jIHUmaJL6w/LOYtPJPmIPSalpcPB4XIEAhcPsp3lxs=
X-Received: by 2002:a81:8343:0:b0:2e5:b43c:86eb with SMTP id
 t64-20020a818343000000b002e5b43c86ebmr28898080ywf.153.1648529044846; Mon, 28
 Mar 2022 21:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
 <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
 <CAEUhbmVXiB+mbbjhy0sT2PhQHNJgdHmehXfcE18g=E3SPffndQ@mail.gmail.com>
 <87wngj3aj2.fsf@linaro.org>
 <CAFEAcA_O8=0KZ=sjzP7GZ=ytSQm0P+zB_t=jQ2nZnw6b721Yxw@mail.gmail.com>
 <CAEUhbmWjjqihJb70x2k4+yf9dr8yh+_eMRu0MubofSbw+C9izQ@mail.gmail.com>
 <CAFEAcA_m0wUWqJQ2-n5bYZq=xPkUW+SOU2555-z=LMgzrm2W0Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_m0wUWqJQ2-n5bYZq=xPkUW+SOU2555-z=LMgzrm2W0Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 29 Mar 2022 12:43:52 +0800
Message-ID: <CAEUhbmV7BnHHAoY+jHAioiYo2Vz-2VJOpgcz7WRFx6+FGvaYxA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112d.google.com
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

On Mon, Mar 28, 2022 at 5:10 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Mon, 28 Mar 2022 at 03:10, Bin Meng <bmeng.cn@gmail.com> wrote:
> > IMHO it's too bad to just ignore this bug forever.
> >
> > This is a valid use case. It's not about whether we intentionally want
> > to inspect the GIC register value from gdb. The case is that when
> > single stepping the source codes it triggers the core dump for no
> > reason if the instructions involved contain load/store to any of the
> > GIC registers.
>
> Huh? Single-stepping the instruction should execute it inside
> QEMU, which will do the load in the usual way. That should not
> be going via gdbstub reads and writes.

Yes, single-stepping the instruction is executed in the vCPU context,
but a gdb client sends additional commands, more than just telling
QEMU to execute a single instruction.

For example, the following is the sequence a gdb client sent when doing a "=
si":

gdbstub_io_command Received: Z0,100000,4
gdbstub_io_reply Sent: OK
gdbstub_io_got_ack Got ACK
gdbstub_io_command Received: m18c430,4
gdbstub_io_reply Sent: ff430091
gdbstub_io_got_ack Got ACK
gdbstub_io_command Received: vCont;s:p1.1;c:p1.-1
gdbstub_op_stepping Stepping CPU 0
gdbstub_op_continue_cpu Continuing CPU 1
gdbstub_op_continue_cpu Continuing CPU 2
gdbstub_op_continue_cpu Continuing CPU 3
gdbstub_hit_break RUN_STATE_DEBUG
gdbstub_io_reply Sent: T05thread:p01.01;
gdbstub_io_got_ack Got ACK
gdbstub_io_command Received: g
gdbstub_io_reply Sent:
3848ed0000000000f08fa610000000000300000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000010000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000001f90000000030a5ec000000000034c4180000000=
000c9030000
gdbstub_io_got_ack Got ACK
gdbstub_io_command Received: m18c434,4
gdbstub_io_reply Sent: 00e004d1
gdbstub_io_got_ack Got ACK
gdbstub_io_command Received: m18c430,4
gdbstub_io_reply Sent: ff430091
gdbstub_io_got_ack Got ACK
gdbstub_io_command Received: m18c434,4
gdbstub_io_reply Sent: 00e004d1
gdbstub_io_got_ack Got ACK
gdbstub_io_command Received: m18c400,40
gdbstub_io_reply Sent:
ff4300d1e00300f980370058000040f900a00191000040f900b00091000040f900e004911e7=
800f9fe0340f91e0000f9ff43009100e004d174390094bb390094
gdbstub_io_got_ack Got ACK
gdbstub_io_command Received: mf9010000,4

Here "mf9010000,4" triggers the bug where 0xf9010000 is the GIC register.

This is not something QEMU can ignore or control. The logic is inside
the gdb client.

Regards,
Bin

