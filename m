Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B52B19D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 11:54:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42839 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVCKQ-00059U-Rl
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 05:54:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVCIY-00041Y-Mh
	for qemu-devel@nongnu.org; Mon, 27 May 2019 05:52:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVCIX-0001wY-4x
	for qemu-devel@nongnu.org; Mon, 27 May 2019 05:52:06 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39339)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hVCIW-0001tH-Tr
	for qemu-devel@nongnu.org; Mon, 27 May 2019 05:52:05 -0400
Received: by mail-wr1-x443.google.com with SMTP id e2so7512871wrv.6
	for <qemu-devel@nongnu.org>; Mon, 27 May 2019 02:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=yNpB2nBml8FOzviDsSKDcewLVxa7+0mIpdoGFCNXlOc=;
	b=OcUtc+RX7vFzunblMuZrgFmaaALCCP0Q5Sdd8LFeA711h5/nMYrrC0zLZPjU32aWpb
	oS/HoZVyTv/RLBGrWD2xc+aLVCwBROXvwVasiLPFTOCSjilWAe04fDINOjyUPq7hPj5U
	kXGmUP6kjuYSZrXyqSbUDRgxPVQqvw4V0430N3eLUlmjTSfRUdeX+DOloUqn/qrO+RBE
	gJ8x0Mcg88W0bP3T82trc5MDTadnOoP5qlzF1LWjUE1NtIsbMLwEK1INnPkQunni5K0j
	ZqPsvaIoFLfBAh936Pa0peFHjqVHVP14wUKOCXJQQ1FIGI7NBybDfoY74hHVqMBSqoPP
	hxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=yNpB2nBml8FOzviDsSKDcewLVxa7+0mIpdoGFCNXlOc=;
	b=P3Mht4n5Rn8L4zif5SFCNPE8iJBcbpGPw7tKzoqm6m3/4pNMl5WpDVic1CWFAy/Xpa
	i0fUh3BSvNhKwJfWAfb2rK6NBNzDWA7Y2j2sgQ22AECyWu0EzoEmZgublqD+QFOpn4BB
	NmmNZrOJyI6It7dzckZYPvnj0nKear+gcsVnUBO/N8a2hivr8WrCmTO+sVSvn5kKZGFn
	RWCDgm+0PPDwqdKZDHR2IVxDCWfj3t+IBWuTZm6+MHKnIfRl5VtTQPcVeu0QEIiHZ2K2
	0pekV0FOqPv/3BjoR/vef8/bX/HDTUCdybgUPkKaga4UyFaEopagffZAWWPfcKkG1c56
	PnRw==
X-Gm-Message-State: APjAAAU6PI0PpgeILXEfSOSiYcRTpa36bEY2RY35RTV+QAD1pn5mSfqU
	MDeNxNwMuFbwUPbuOhPjifdwxEJ8sME=
X-Google-Smtp-Source: APXvYqyqHPdHyBpMLQlsfbHv1qjRR6wkKUxSNjgc3Rkq9sMHN+7ugow2nvWdP2z/Rk5SZ7YkmBXnAA==
X-Received: by 2002:a5d:480b:: with SMTP id l11mr15312000wrq.317.1558950723505;
	Mon, 27 May 2019 02:52:03 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	w185sm9841912wma.39.2019.05.27.02.52.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 27 May 2019 02:52:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 548481FF87;
	Mon, 27 May 2019 10:52:02 +0100 (BST)
References: <20190524160118.31134-1-arilou@gmail.com>
	<20190524160118.31134-8-arilou@gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jon Doron <arilou@gmail.com>
In-reply-to: <20190524160118.31134-8-arilou@gmail.com>
Date: Mon, 27 May 2019 10:52:02 +0100
Message-ID: <87k1ecql6l.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH v11 07/20] gdbstub: Implement breakpoint
 commands (Z/z pkt) with new infra
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jon Doron <arilou@gmail.com> writes:

> Signed-off-by: Jon Doron <arilou@gmail.com>

With the fix to avoid double responses this commit still regresses:

10:46 alex@zen/x86_64  [linux.git/master@origin] >gdb ./builds/arm64/vmlinu=
x -x ~/lsrc/qemu.git/tests/guest-debug/test-gdbstub.py
GNU gdb (GDB) 8.3.50.20190424-git
Copyright (C) 2019 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-pc-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Executed .gdbinit
Reading symbols from ./builds/arm64/vmlinux...
Traceback (most recent call last):
  File "/home/alex/lsrc/linux.git/builds/arm64/vmlinux-gdb.py", line 30, in=
 <module>
    import linux.config
ImportError: No module named config
Connecting to remote
0x0000000040000000 in ?? ()
Checking we can step the first few instructions
0x0000000040000004 in ?? ()
0x0000000040000008 in ?? ()
0x000000004000000c in ?? ()
PASS: single step in boot code
Checking HW breakpoint works
Hardware assisted breakpoint 1 at 0xffffff8010778f0c: file /home/alex/lsrc/=
linux.git/init/main.c, line 1068.
Cannot remove breakpoints because program is no longer writable.
Further execution is probably impossible.

Thread 1 hit Breakpoint 1, kernel_init (unused=3D0x0) at /home/alex/lsrc/li=
nux.git/init/main.c:1068
warning: Source file is more recent than executable.
1068            } else
0xffffff8010778f0c <kernel_init> =3D=3D {int (void *)} 0xffffff8010778f0c <=
kernel_init>
warning: Error removing breakpoint 1
PASS: hbreak @ kernel_init

Something might be broken here due to the BP type?

Setup catch-all for run_init_process
Breakpoint 2 at 0xffffff8010083dc4: file /home/alex/lsrc/linux.git/init/mai=
n.c, line 1009.
Breakpoint 3 at 0xffffff8010083e10: file /home/alex/lsrc/linux.git/init/mai=
n.c, line 1020.
Checking Normal breakpoint works
Breakpoint 4 at 0xffffff801077b300: file /home/alex/lsrc/linux.git/kernel/s=
ched/completion.c, line 136.

Thread 1 received signal SIGTRAP, Trace/breakpoint trap.
Cannot remove breakpoints because program is no longer writable.
Further execution is probably impossible.
kernel_init (unused=3D0x0) at /home/alex/lsrc/linux.git/init/main.c:1068
1068            } else
0xffffff8010778f0c <kernel_init> =3D=3D {void (struct completion *)} 0xffff=
ff801077b300 <wait_for_completion> 0
warning: Error removing breakpoint 4
FAIL: break @ wait_for_completion
Checking watchpoint works
Hardware access (read/write) watchpoint 5: *(enum system_states *)(&system_=
state)

Thread 1 received signal SIGTRAP, Trace/breakpoint trap.
Cannot remove breakpoints because program is no longer writable.
Further execution is probably impossible.
kernel_init (unused=3D0x0) at /home/alex/lsrc/linux.git/init/main.c:1068
1068            } else
FAIL: awatch for system_state (SYSTEM_BOOTING)
Hardware read watchpoint 6: *(enum system_states *)(&system_state)

Thread 1 received signal SIGTRAP, Trace/breakpoint trap.
Cannot remove breakpoints because program is no longer writable.
Further execution is probably impossible.
kernel_init (unused=3D0x0) at /home/alex/lsrc/linux.git/init/main.c:1068
1068            } else
FAIL: rwatch for system_state (SYSTEM_BOOTING)
Hardware watchpoint 7: *(enum system_states *)(&system_state)

Thread 1 received signal SIGTRAP, Trace/breakpoint trap.
Cannot remove breakpoints because program is no longer writable.
Further execution is probably impossible.
kernel_init (unused=3D0x0) at /home/alex/lsrc/linux.git/init/main.c:1068
1068            } else
FAIL: watch for system_state (SYSTEM_BOOTING)
[Inferior 1 (process 1) killed]


> ---
>  gdbstub.c | 84 +++++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 66 insertions(+), 18 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 129a47230f..c59a6765cd 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -950,7 +950,7 @@ static inline int xlat_gdb_type(CPUState *cpu, int gd=
btype)
>  }
>  #endif
>
> -static int gdb_breakpoint_insert(target_ulong addr, target_ulong len, in=
t type)
> +static int gdb_breakpoint_insert(int type, target_ulong addr, target_ulo=
ng len)
>  {
>      CPUState *cpu;
>      int err =3D 0;
> @@ -1591,6 +1591,52 @@ static void handle_set_thread(GdbCmdContext *gdb_c=
tx, void *user_ctx)
>      }
>  }
>
> +static void handle_insert_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
> +{
> +    int res;
> +
> +    if (gdb_ctx->num_params !=3D 3) {
> +        put_packet(gdb_ctx->s, "E22");
> +        return;
> +    }
> +
> +    res =3D gdb_breakpoint_insert(gdb_ctx->params[0].val_ul,
> +                                gdb_ctx->params[1].val_ull,
> +                                gdb_ctx->params[2].val_ull);
> +    if (res >=3D 0) {
> +        put_packet(gdb_ctx->s, "OK");
> +        return;
> +    } else if (res =3D=3D -ENOSYS) {
> +        put_packet(gdb_ctx->s, "");
> +        return;
> +    }
> +
> +    put_packet(gdb_ctx->s, "E22");
> +}
> +
> +static void handle_remove_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
> +{
> +    int res;
> +
> +    if (gdb_ctx->num_params !=3D 3) {
> +        put_packet(gdb_ctx->s, "E22");
> +        return;
> +    }
> +
> +    res =3D gdb_breakpoint_remove(gdb_ctx->params[0].val_ul,
> +                                gdb_ctx->params[1].val_ull,
> +                                gdb_ctx->params[2].val_ull);
> +    if (res >=3D 0) {
> +        put_packet(gdb_ctx->s, "OK");
> +        return;
> +    } else if (res =3D=3D -ENOSYS) {
> +        put_packet(gdb_ctx->s, "");
> +        return;
> +    }
> +
> +    put_packet(gdb_ctx->s, "E22");
> +}
> +
>  static int gdb_handle_packet(GDBState *s, const char *line_buf)
>  {
>      CPUState *cpu;
> @@ -1846,24 +1892,26 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>          put_packet(s, "OK");
>          break;
>      case 'Z':
> +        {
> +            static const GdbCmdParseEntry insert_bp_cmd_desc =3D {
> +                .handler =3D handle_insert_bp,
> +                .cmd =3D "Z",
> +                .cmd_startswith =3D 1,
> +                .schema =3D "l?L?L0"
> +            };
> +            cmd_parser =3D &insert_bp_cmd_desc;
> +        }
> +        break;
>      case 'z':
> -        type =3D strtoul(p, (char **)&p, 16);
> -        if (*p =3D=3D ',')
> -            p++;
> -        addr =3D strtoull(p, (char **)&p, 16);
> -        if (*p =3D=3D ',')
> -            p++;
> -        len =3D strtoull(p, (char **)&p, 16);
> -        if (ch =3D=3D 'Z')
> -            res =3D gdb_breakpoint_insert(addr, len, type);
> -        else
> -            res =3D gdb_breakpoint_remove(addr, len, type);
> -        if (res >=3D 0)
> -             put_packet(s, "OK");
> -        else if (res =3D=3D -ENOSYS)
> -            put_packet(s, "");
> -        else
> -            put_packet(s, "E22");
> +        {
> +            static const GdbCmdParseEntry remove_bp_cmd_desc =3D {
> +                .handler =3D handle_remove_bp,
> +                .cmd =3D "z",
> +                .cmd_startswith =3D 1,
> +                .schema =3D "l?L?L0"
> +            };
> +            cmd_parser =3D &remove_bp_cmd_desc;
> +        }
>          break;
>      case 'H':
>          {


--
Alex Benn=C3=A9e

