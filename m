Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D69434A68
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:43:50 +0200 (CEST)
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdA0b-0006re-3j
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1md9tf-00020B-JI
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 07:36:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1md9td-0005b3-Hd
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 07:36:39 -0400
Received: by mail-wm1-x32d.google.com with SMTP id o24so10841805wms.0
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nRDSKsQejtYH5CkaG10rMVtuiLhKAWaspoW6UUUwp4M=;
 b=kxrRTajWjE/PujSjJ5NWc4ffYQq6s7XKDqNRzL7q/1M0DFCe1CquUpjCXtkwX0UlXk
 iaOTR9do/FPkHSmG2cvGNXD6vXI8JVg7SzjXzAc5YpULQGYtbPem2QBedDNLO/ONwZe/
 SjsrBhIvnPWvKWJ6oPXDFS4DbqMNsiQyNUiX+YW6S/gTm+eMeISCn/GXJH26Sm6xERuJ
 uMyFpx5BYhh58cO16bv1heeq5bepYT2nr8vlyGneA4dNPti8JSLdKz6Bf2TenUYidCD3
 TTeOuan9sn1UKKH+n43BK9C4gp8OhwpmqCcwiP3GRzPNBaoeHiRzjAOsPTNU6tJm57RQ
 AaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nRDSKsQejtYH5CkaG10rMVtuiLhKAWaspoW6UUUwp4M=;
 b=tGoxAGG3NJxeyPbpmO8U9GPM96H8ITUvdWxP7aWpazMoxL9uy9kMHYfkZdpPSgxuKZ
 d6QA/shQXpks8PGsQ299XfAo+g/tApPUG5mv8RLO3afK7Q629m17GMcm0JntjPv54+P9
 qzPw2GAvErx/FA35FarUr+t5ZpI+ExD3Rh9WzEXfictmgiUWZvqzFjlUllSvSMbe1IO4
 Zx9MdL49HqpfFYfCaIm6A5l49o8lvvO8gEgEGgCoRHGDT4efo4oPRRPvWatUGPxC1BVQ
 jMVw7nbukUEQZaNsst61pjM40bMbE65CN9jSXb4tHlO1ExjLNxqBO1ZYEycD3x4L3km8
 dEqA==
X-Gm-Message-State: AOAM530ce5yqFDGUun/qanVRcpJ+Au86OudT5RL2KOirvCFlBubsL2aO
 1y6h/6NI7QUGstD5Fjybtph5AQ==
X-Google-Smtp-Source: ABdhPJxiwikIPFjpt1FD4YCofArXyy41uKE2Tm+NtXJWtQ66uJlBRTEPI4uwd5Cig3n7a/p/MCFgnQ==
X-Received: by 2002:adf:9bc9:: with SMTP id e9mr51680560wrc.388.1634729795531; 
 Wed, 20 Oct 2021 04:36:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u5sm1697477wmm.39.2021.10.20.04.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 04:36:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D89B31FF96;
 Wed, 20 Oct 2021 12:36:33 +0100 (BST)
References: <20210930095111.23205-1-pavel@labath.sk>
 <20211019174953.36560-1-pavel@labath.sk>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Labath <pavel@labath.sk>
Subject: Re: [PATCH v2] gdbstub: Switch to the thread receiving a signal
Date: Wed, 20 Oct 2021 09:35:23 +0100
In-reply-to: <20211019174953.36560-1-pavel@labath.sk>
Message-ID: <87fsswvsfy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Labath <pavel@labath.sk> writes:

> Respond with Txxthread:yyyy; instead of a plain Sxx to indicate which
> thread received the signal. Otherwise, the debugger will associate it
> with the main one. Also automatically select this thread, as that is
> what gdb expects.

Just for reference it's best to post vN's in a new thread as the
Replied-to field can confuse some of the automatic tools (b4, patchew
etc).

> Signed-off-by: Pavel Labath <pavel@labath.sk>
> ---
>  gdbstub.c                                     |  8 ++-
>  tests/tcg/multiarch/Makefile.target           | 10 +++-
>  .../gdbstub/test-thread-breakpoint.py         | 60 +++++++++++++++++++
>  3 files changed, 75 insertions(+), 3 deletions(-)
>  create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 36b85aa..23baaef 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -3138,8 +3138,12 @@ gdb_handlesig(CPUState *cpu, int sig)
>      tb_flush(cpu);
>=20=20
>      if (sig !=3D 0) {
> -        snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
> -        put_packet(buf);
> +        gdb_set_stop_cpu(cpu);
> +        g_string_printf(gdbserver_state.str_buf,
> +                        "T%02xthread:", target_signal_to_gdb(sig));
> +        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
> +        g_string_append_c(gdbserver_state.str_buf, ';');
> +        put_strbuf();
>      }
>      /* put_packet() might have detected that the peer terminated the
>         connection.  */
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Ma=
kefile.target
> index 6ccb592..c84683f 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -70,11 +70,19 @@ run-gdbstub-qxfer-auxv-read: sha1
>  		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
>  	"basic gdbstub qXfer:auxv:read support")
>=20=20
> +run-gdbstub-thread-breakpoint: testthread
> +	$(call run-test, $@, $(GDB_SCRIPT) \
> +		--gdb $(HAVE_GDB_BIN) \
> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
> +	"hitting a breakpoint on non-main thread")
> +
>  else
>  run-gdbstub-%:
>  	$(call skip-test, "gdbstub test $*", "need working gdb")
>  endif
> -EXTRA_RUNS +=3D run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read
> +EXTRA_RUNS +=3D run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
> +	      run-gdbstub-thread-breakpoint
>=20=20
>  # ARM Compatible Semi Hosting Tests
>  #
> diff --git a/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py b/test=
s/tcg/multiarch/gdbstub/test-thread-breakpoint.py
> new file mode 100644
> index 0000000..798d508
> --- /dev/null
> +++ b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
> @@ -0,0 +1,60 @@
> +from __future__ import print_function
> +#
> +# Test auxiliary vector is loaded via gdbstub

I'm fairly sure this isn't what the test is doing...

> +#
> +# This is launched via tests/guest-debug/run-test.py
> +#
> +
> +import gdb
> +import sys
> +
> +failcount =3D 0
> +
> +def report(cond, msg):
> +    "Report success/fail of test"
> +    if cond:
> +        print ("PASS: %s" % (msg))
> +    else:
> +        print ("FAIL: %s" % (msg))
> +        global failcount
> +        failcount +=3D 1
> +
> +def run_test():
> +    "Run through the tests one by one"
> +
> +    sym, ok =3D gdb.lookup_symbol("thread1_func")
> +    gdb.execute("b thread1_func")
> +    gdb.execute("c")
> +
> +    frame =3D gdb.selected_frame()
> +    report(str(frame.function()) =3D=3D "thread1_func", "break @
> %s"%frame)

I think we can do better here by checking gdb.selected_thread() and
ensuring the num (or global_num) is not 1. Also maybe check the
is_stopped() status:

  https://sourceware.org/gdb/current/onlinedocs/gdb/Threads-In-Python.html

I noticed while running the test that output still continued for some
time from the other thread but it was still doing that pre this change
so I'm not quite sure what was going on there.

> +
> +#
> +# This runs as the script it sourced (via -x, via run-test.py)
> +#
> +try:
> +    inferior =3D gdb.selected_inferior()
> +    arch =3D inferior.architecture()
> +    print("ATTACHED: %s" % arch.name())
> +except (gdb.error, AttributeError):
> +    print("SKIPPING (not connected)", file=3Dsys.stderr)
> +    exit(0)
> +
> +if gdb.parse_and_eval('$pc') =3D=3D 0:
> +    print("SKIP: PC not set")
> +    exit(0)
> +
> +try:
> +    # These are not very useful in scripts
> +    gdb.execute("set pagination off")
> +    gdb.execute("set confirm off")
> +
> +    # Run the actual tests
> +    run_test()
> +except (gdb.error):
> +    print ("GDB Exception: %s" % (sys.exc_info()[0]))
> +    failcount +=3D 1
> +    pass
> +
> +print("All tests complete: %d failures" % failcount)
> +exit(failcount)

I also tried some manual testing:

  =E2=9E=9C  ./qemu-aarch64 -g 1234 tests/tcg/aarch64-linux-user/testthread
  fish: =E2=80=9C./qemu-aarch64 -g 1234 tests/tc=E2=80=A6=E2=80=9D terminat=
ed by signal SIGSEGV (Address boundary error)
  =F0=9F=95=9912:33:49 alex@zen:qemu.git/builds/arm.all  on =EE=82=A0 gdbst=
ub/next [$!?=E2=87=A1] took 12s [=E2=9A=A1 SEGV]=20
  =E2=9C=97

where in the other window I did:

  0x00000000004005d0 in _start ()
  (gdb) hbreak thread2_func
  Hardware assisted breakpoint 1 at 0x400824: file /home/alex/lsrc/qemu.git=
/tests/tcg/multiarch/testthread.c, line 34.
  (gdb) hbreak thread1_func
  Hardware assisted breakpoint 2 at 0x400798: file /home/alex/lsrc/qemu.git=
/tests/tcg/multiarch/testthread.c, line 22.
  (gdb) c
  Continuing.
  [New Thread 1.2748248]
  Remote connection closed

which seems to indicate some problems with breaking on multiple threads.
Maybe this is related to the weird output I was seeing above?

--=20
Alex Benn=C3=A9e

