Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624FA3A7B33
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:52:48 +0200 (CEST)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt5kV-000536-FJ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt5jL-0004Ke-Kj
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:51:36 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt5jJ-0000SS-Ey
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:51:35 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so1329486wmq.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 02:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=/RqQPCu0kGjmymcHgU7jycPs9m8ounwPPEBmtSN+Bo0=;
 b=npgHWbI+sFMVDN5OorPm5t6gqqEdEGTKGk7A2T2K2HEsUSg9RU+uMLjjko1uL4hsch
 BqMfRJWWxZnypYWdHSFlYYqIqH5qb8ZTUWKTFv1yEKVFNzzyCOHRhiqOmFnBvU4FtI6U
 J9r0ipZZd65NRmdUX/M8LyaYuHEEsU85SS9WfzUik/YcIEn/Ys1rXW3HKpfyjrE6pMNY
 /IVvs4pkuL6xA66HM5RLytG92d310PJPNtGraNEhSPuHn1brbC4y6928q9PaOjaHwOlx
 9dCsl0uTNWTj4IqTHbWBRl12AV+h0W8Nv39AepsOehgSjkPDHMzrZGCyHbRAS/erxqpO
 b/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=/RqQPCu0kGjmymcHgU7jycPs9m8ounwPPEBmtSN+Bo0=;
 b=nfRwKLlxjth9rvJmA66kqczm3RYSRAaLy6nPkvPW7RpJw176p/i+0Z2W3wNsFMGuN7
 ZxW3mOQNd/t/tIouBwtrYnhsbsbSeHRZpsZIGjB0H04mRD9TcmeycgONRFYh3v9Ofzty
 qT0Gg46Kt01oSSwNXm7rl0+Zgt+KYYKQrLSE2pj6ZV9a+yWvL5rlL1e+BnWgY9iZm/jh
 Cls0YoM6LnKwKUNj8iPfWh8Mdqjs/7lKljpJ7PvCyeH3CwNYfXmMJlTkudyRR/CopeUk
 NkB1alFx0lRqbGj2cfqkOw4fzjQIKnTjsbQTJCfDe48VH0hexyVIiVZnTbbif68XWyqE
 Yvhg==
X-Gm-Message-State: AOAM531EK0AFLpYuZpe/lMJUwA2i3vhbqag+ZQb9OtAJKRg3r+pE71Vh
 fo20VLWMNKwQBemsXkOs99c/xQ==
X-Google-Smtp-Source: ABdhPJw+6kNqPT1vGvtrdCEpWTpuDs3ywPfNFT4Kpn3YrJOfE0VJVV6DkWJh9Gr+1OANqtu1NdePCA==
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr21970193wmn.132.1623750691053; 
 Tue, 15 Jun 2021 02:51:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y20sm898702wma.45.2021.06.15.02.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 02:51:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D82A1FF7E;
 Tue, 15 Jun 2021 10:51:28 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/5] linux-user/s390x: Fix psw.mask handling in signals
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
 <87sg1jiiku.fsf@linaro.org>
Date: Tue, 15 Jun 2021 10:51:28 +0100
In-Reply-To: <87sg1jiiku.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Tue, 15 Jun 2021 10:27:13 +0100")
Message-ID: <87o8c7ihgf.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, david@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> The PSW_MASK_CC component of psw.mask was not handled properly
>> in the creation or restoration of signal frames.
>
> Still seeing issues running on s390x machine:
>
>   05:00:29 [ajb@qemu01:~/l/q/b/debug] s390x/signal-fixes|=E2=80=A6 38 + r=
etry.py -n 100 -c -- ./qemu-s390x ./tests/tcg/s390x-linux-user/signals
>   ...
>   ...
>   Results summary:
>   0: 62 times (62.00%), avg time 2.253 (0.00 varience/0.00 deviation)
>   -11: 38 times (38.00%), avg time 0.251 (0.00 varience/0.00 deviation)
>   Ran command 100 times, 62 passes
>
> I don't get much from the backtrace, maybe the atomic triggered the seg?
>
>   #0  0x0000000001016244 in vfprintf ()
>   [Current thread is 1 (Thread 0x4001001910 (LWP 27308))]
>   (gdb) bt
>   #0  0x0000000001016244 in vfprintf ()
>   #1  0x000000000101d484 in printf ()
>   #2  0x0000000001000b2e in background_thread_func (arg=3D0x10a3620) at /=
home/ajb/lsrc/qemu.git/tests/tcg/multiarch/signals.c:65
>   #3  0x0000000001003150 in start_thread (arg=3D0x4001001910) at pthread_=
create.c:463
>   #4  0x0000000001035b40 in thread_start ()
>   (gdb) frame 2
>   #2  0x0000000001000b2e in background_thread_func (arg=3D0x10a3620) at /=
home/ajb/lsrc/qemu.git/tests/tcg/multiarch/signals.c:65
>   65          printf("thread%d: started\n", job->number);
>   (gdb) info locals
>   job =3D 0x10a3620
>   (gdb) p job
>   $1 =3D (ThreadJob *) 0x10a3620
>   (gdb) p job->number
>   $2 =3D 0
>   (gdb) frame 0
>   #0  0x0000000001016244 in vfprintf ()
>   (gdb) x/5i $pc
>   =3D> 0x1016244 <vfprintf+1316>:   asi     224(%r11),1
>      0x101624a <vfprintf+1322>:   cgijne  %r1,0,0x1017570 <vfprintf+6224>
>      0x1016250 <vfprintf+1328>:   lg      %r1,336(%r11)
>      0x1016256 <vfprintf+1334>:   lghi    %r3,37
>      0x101625a <vfprintf+1338>:   aghik   %r6,%r1,1
>   (gdb) p/x $r11
>   $3 =3D 0x4001000708
>   (gdb) p/x $r11 + 224
>   $4 =3D 0x40010007e8
>   (gdb) x/1g $4
>   0x40010007e8:   0x0000000000000000
>   (gdb)
>
> However running on x86 backend everything seems to be fine.
>
>   Results summary:
>   0: 200 times (100.00%), avg time 2.255 (0.00 varience/0.00 deviation)
>   Ran command 200 times, 200 passes

It's hard to desegregate the SEGVs we get during normal runs but a pass
followed by a fail shows:

  qemu: SIGSEGV pc=3D0x3fff473bb1e address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff473bb1e address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff473bb1e address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff473bb1e address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  shutting down after: 2000 signals
  qemu: SIGSEGV pc=3D0x3fff484bd1e address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff4848f1a address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff47477f2 address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  [Thread 0x3fffdff1780 (LWP 32928) exited]
  [Inferior 1 (process 32928) exited normally]
  (gdb) r
  Starting program: /home/ajb/lsrc/qemu.git/builds/debug/qemu-s390x ./tests=
/tcg/s390x-linux-user/signals
  [Thread debugging using libthread_db enabled]
  Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
  [New Thread 0x3fffceff910 (LWP 32964)]
  qemu: SIGSEGV pc=3D0x3fff4752f2a address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff471fa1e address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff475c49c address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  [New Thread 0x3fffdff0910 (LWP 32965)]
  qemu: SIGSEGV pc=3D0x3fff4703b18 address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fffd812efe address=3D4001000000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff471081e address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff4715ee6 address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff471a02a address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff472491e address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff4725d1e address=3D4001000000 w=3D1 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff4730536 address=3D4001000000 w=3D0 oldset=3D0x00=
000000
  qemu: SIGSEGV pc=3D0x3fff473171e address=3D40007ff000 w=3D1 oldset=3D0x00=
000000
  [Thread 0x3fffdff0910 (LWP 32965) exited]
  [Thread 0x3fffceff910 (LWP 32964) exited]

  Program terminated with signal SIGSEGV, Segmentation fault.
  The program no longer exists.
  (gdb)

So something is going astray to 4001000000 which otherwise doesn't.

>
>>
>>
>> r~
>>
>>
>> Richard Henderson (5):
>>   target/s390x: Expose load_psw and get_psw_mask to cpu.h
>>   target/s390x: Do not modify cpu state in s390_cpu_get_psw_mask
>>   target/s390x: Improve s390_cpu_dump_state vs cc_op
>>   target/s390x: Use s390_cpu_{set_psw,get_psw_mask} in gdbstub
>>   linux-user/s390x: Save and restore psw.mask properly
>>
>>  target/s390x/cpu.h         |   3 ++
>>  target/s390x/internal.h    |   5 --
>>  linux-user/s390x/signal.c  |  37 ++++++++++++--
>>  target/s390x/cc_helper.c   |   2 +-
>>  target/s390x/excp_helper.c |  28 +++++-----
>>  target/s390x/gdbstub.c     |  15 +-----
>>  target/s390x/helper.c      | 101 ++++++++++++++++++++-----------------
>>  target/s390x/sigp.c        |   3 +-
>>  8 files changed, 110 insertions(+), 84 deletions(-)

--=20
Alex Benn=C3=A9e

