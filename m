Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A0036DEE6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 20:19:43 +0200 (CEST)
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbomj-0004GM-LU
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 14:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lbokw-0003Ps-G7
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:17:50 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:44652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lboks-0004V4-T4
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:17:50 -0400
Received: by mail-qt1-x829.google.com with SMTP id y12so47364297qtx.11
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 11:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5cpQoTu4cKL/AFzgNd4SRtPT0asfBakN5dF4n/1n+YA=;
 b=Rn2I1Jq1l0vwtaG9fJWc1hWg1VMefeVhIEQScqyNuZEfF1lWPCFK3wYb5VxA3wL6ls
 D0N0itlYTnnVz0tPQa2+OzmXyzqI/cyv3p7HY0RIDuRm+Ove5WsU1La9bC17KbsyuR2n
 ejzN3gT45cJCRNayejquv4AhpnoCOIe+CzFggDSXB1TBtWOOjIOOTqJy/mP4iHTSQRO5
 8CDes5ec6f1UKrlOui6mCZ+5xavAN9Da50TAqrPRdahIZ9R7jEnlhyEFXhaY9w1STMwT
 lUSdCfXC1lNLZxlOSkJN5azg7JZ1ZoqAqtKlR0eSv/P7Xr+VgQBhuZAiSZGW7zfx1ZUF
 bcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5cpQoTu4cKL/AFzgNd4SRtPT0asfBakN5dF4n/1n+YA=;
 b=VpZVhl7lHP64K/ibrl14S2ujvbddjYs13W+5UxUu/csp1y3/jlJ41VCrrToZo+6CDL
 anX0OGdfVBDl4DIGmtCbIq3aPnCzTpqmCOc3CoOirI8YU/3Uz9UIa8lPlNGgS34yHuD4
 vniNRUpHWiN8zmy8qhbRdq5XesbcZdBVwgHbOaUY1963wR/JQasRI/oDKiIGTQAGifgM
 r7Rx9+4fU85tRCcSZqLD9aC2wN4j/4k9cTiuobg9+wYH0f42iHTGognK3NIj3wK6CRKr
 3YmMJ9Q8w3//Oha3R6bPj3odA7BCS5jmOjmfJQ4Ic3WMfZnXmPX262gEN37CEgb1vZo+
 Czqg==
X-Gm-Message-State: AOAM53089Bh/lVVYCCMNhwjKanzIpqRHlR6nrVNyblZcSr/ibSzRuwUl
 xiJ/1VI6djyk73eGh+zUecm9MUO1ep8CVr1LgsI=
X-Google-Smtp-Source: ABdhPJxNSYTWJyFMZUmhph7gn1H+oLcfoxc42/XfofBkGVPEgU+GvyU2To3u8TFntDhqmzo2f4iQhrXGeAAbYLcJ108=
X-Received: by 2002:ac8:4b54:: with SMTP id e20mr28304178qts.371.1619633863801; 
 Wed, 28 Apr 2021 11:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20b7f194-066f-c3bf-a830-deb1cde8f1be@adacore.com>
In-Reply-To: <20b7f194-066f-c3bf-a830-deb1cde8f1be@adacore.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Wed, 28 Apr 2021 21:17:31 +0300
Message-ID: <CAK4993h7rBLi9AymaAyzGXSG3LKWa364OpZaaU85sMuE7iMNnQ@mail.gmail.com>
Subject: Re: [RFC] AVR watchdog
To: Fred Konrad <konrad@adacore.com>
Content-Type: multipart/alternative; boundary="0000000000001e3d0e05c10c6575"
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=mrolnik@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001e3d0e05c10c6575
Content-Type: text/plain; charset="UTF-8"

Hi Fred.

How can I reproduce it?
Thank you.
Michael Rolnik

Sent from my cell phone, please ignore typos

On Wed, Apr 28, 2021, 5:17 PM Fred Konrad <konrad@adacore.com> wrote:

> Hi,
>
> I fall on a segfault while running the wdr instruction on AVR:
>
> (gdb) bt
>       #0  0x00005555add0b23a in gdb_get_cpu_pid (cpu=0x5555af5a4af0) at
>         ../gdbstub.c:718
>       #1  0x00005555add0b2dd in gdb_get_cpu_process (cpu=0x5555af5a4af0) at
>         ../gdbstub.c:743
>       #2  0x00005555add0e477 in gdb_set_stop_cpu (cpu=0x5555af5a4af0) at
>         ../gdbstub.c:2742
>       #3  0x00005555adc99b96 in cpu_handle_guest_debug
> (cpu=0x5555af5a4af0) at
>         ../softmmu/cpus.c:306
>       #4  0x00005555adcc66ab in rr_cpu_thread_fn (arg=0x5555af5a4af0) at
>         ../accel/tcg/tcg-accel-ops-rr.c:224
>       #5  0x00005555adefaf12 in qemu_thread_start (args=0x5555af5d9870) at
>         ../util/qemu-thread-posix.c:521
>       #6  0x00007f692d940ea5 in start_thread () from /lib64/libpthread.so.0
>       #7  0x00007f692d6699fd in clone () from /lib64/libc.so.6
>
> Wondering if there are some plan/on-going work to implement this watchdog?
>
> ---
>
> Also meanwhile I though about a workaround like that:
>
> diff --git a/target/avr/helper.c b/target/avr/helper.c
> index 35e1019594..7944ed21f4 100644
> --- a/target/avr/helper.c
> +++ b/target/avr/helper.c
> @@ -24,6 +24,7 @@
>   #include "exec/exec-all.h"
>   #include "exec/address-spaces.h"
>   #include "exec/helper-proto.h"
> +#include "sysemu/runstate.h"
>
>   bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>   {
> @@ -191,7 +192,7 @@ void helper_wdr(CPUAVRState *env)
>       CPUState *cs = env_cpu(env);
>
>       /* WD is not implemented yet, placeholder */
> -    cs->exception_index = EXCP_DEBUG;
> +    qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>       cpu_loop_exit(cs);
>   }
>
> In the case the guest wants to reset the board through the watchdog, would
> that
> make sense to swap to that?
>
> Best Regards,
> Fred
>

--0000000000001e3d0e05c10c6575
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Fred.<div dir=3D"auto"><br></div><div dir=3D"auto">How=
 can I reproduce it?=C2=A0</div><div dir=3D"auto">Thank you.=C2=A0</div><di=
v dir=3D"auto">Michael Rolnik=C2=A0<br><br><div data-smartmail=3D"gmail_sig=
nature" dir=3D"auto">Sent from my cell phone, please ignore typos </div></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Apr 28, 2021, 5:17 PM Fred Konrad &lt;<a href=3D"mailto:konrad@a=
dacore.com">konrad@adacore.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">Hi,<br>
<br>
I fall on a segfault while running the wdr instruction on AVR:<br>
<br>
(gdb) bt<br>
=C2=A0 =C2=A0 =C2=A0 #0=C2=A0 0x00005555add0b23a in gdb_get_cpu_pid (cpu=3D=
0x5555af5a4af0) at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../gdbstub.c:718<br>
=C2=A0 =C2=A0 =C2=A0 #1=C2=A0 0x00005555add0b2dd in gdb_get_cpu_process (cp=
u=3D0x5555af5a4af0) at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../gdbstub.c:743<br>
=C2=A0 =C2=A0 =C2=A0 #2=C2=A0 0x00005555add0e477 in gdb_set_stop_cpu (cpu=
=3D0x5555af5a4af0) at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../gdbstub.c:2742<br>
=C2=A0 =C2=A0 =C2=A0 #3=C2=A0 0x00005555adc99b96 in cpu_handle_guest_debug =
(cpu=3D0x5555af5a4af0) at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../softmmu/cpus.c:306<br>
=C2=A0 =C2=A0 =C2=A0 #4=C2=A0 0x00005555adcc66ab in rr_cpu_thread_fn (arg=
=3D0x5555af5a4af0) at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../accel/tcg/tcg-accel-ops-rr.c:224<br>
=C2=A0 =C2=A0 =C2=A0 #5=C2=A0 0x00005555adefaf12 in qemu_thread_start (args=
=3D0x5555af5d9870) at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../util/qemu-thread-posix.c:521<br>
=C2=A0 =C2=A0 =C2=A0 #6=C2=A0 0x00007f692d940ea5 in start_thread () from /l=
ib64/libpthread.so.0<br>
=C2=A0 =C2=A0 =C2=A0 #7=C2=A0 0x00007f692d6699fd in clone () from /lib64/li=
bc.so.6<br>
<br>
Wondering if there are some plan/on-going work to implement this watchdog?<=
br>
<br>
---<br>
<br>
Also meanwhile I though about a workaround like that:<br>
<br>
diff --git a/target/avr/helper.c b/target/avr/helper.c<br>
index 35e1019594..7944ed21f4 100644<br>
--- a/target/avr/helper.c<br>
+++ b/target/avr/helper.c<br>
@@ -24,6 +24,7 @@<br>
=C2=A0 #include &quot;exec/exec-all.h&quot;<br>
=C2=A0 #include &quot;exec/address-spaces.h&quot;<br>
=C2=A0 #include &quot;exec/helper-proto.h&quot;<br>
+#include &quot;sysemu/runstate.h&quot;<br>
<br>
=C2=A0 bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
=C2=A0 {<br>
@@ -191,7 +192,7 @@ void helper_wdr(CPUAVRState *env)<br>
=C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 /* WD is not implemented yet, placeholder */<br>
-=C2=A0 =C2=A0 cs-&gt;exception_index =3D EXCP_DEBUG;<br>
+=C2=A0 =C2=A0 qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);<br>
=C2=A0 =C2=A0 =C2=A0 cpu_loop_exit(cs);<br>
=C2=A0 }<br>
<br>
In the case the guest wants to reset the board through the watchdog, would =
that<br>
make sense to swap to that?<br>
<br>
Best Regards,<br>
Fred<br>
</blockquote></div>

--0000000000001e3d0e05c10c6575--

