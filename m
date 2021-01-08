Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09BB2EF2AE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 13:56:11 +0100 (CET)
Received: from localhost ([::1]:45662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxrJK-0000W8-8W
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 07:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxrIC-0008PE-8r
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:55:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxrIA-0007pJ-CZ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:54:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id t16so8931023wra.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JHfKgbFBE78ffVGPMtC/OXIpuVrprZXYeZSPYUDjHQ0=;
 b=VUCZSi4AekbdNtO3y81F8cHC9C1TvrKWBe5SbC3EyjBybu9+7KavOJmkBhCyhb4Ubt
 R2j2n7Ye5BUJWE4AyV+r/hlKUlAFcjYMUbNra6dJjKhoGeihKUy+mRRPHiyHFZE2FTrG
 +/ZYYtVMs1GlM/dmVLEin0Nd8sGVwdZiujG7g47Tvf8x0rro6m4IhIrwZsML1e4TtO82
 wiFdczdUsTEKaQSmrclgiAx4y84hXdpiwETLj+hYHV91Jo92HSaRExGPHm9zWTjGCLC8
 dEZt11uD+VOTeXw8PNFz3dTHi3Uyu/BhHedJwBozL3Dq7neq9IjLKX5kBuryDg8VaFk+
 FC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JHfKgbFBE78ffVGPMtC/OXIpuVrprZXYeZSPYUDjHQ0=;
 b=CPGjM9iMx2smN6BMe8555WnmtTuaYTuNQff3Qwe91dmTAZk67wr4oNzGpNx5GNEBEW
 W5ksWI4a4xv9iEWiPeq5ZxYta+n5XWAGTw4a4iccgsqUI8HmfvJ835oUK5f/ftJq0CGg
 hMbbmOik0DY5ve/sDpID3+3FKy0k3YzryO/oQDh1STxTf2WeSXwDM7T+X3uaZwwn5Lqq
 ab1AEq1Ov5s24dgl0g3h8INQ4Cqnk2JL3pOopFJ24Rt5Vqrb7pM1hB61rJnBbNxuq6ji
 5/xrdRqlmA6EW7TmzLy9gY+M6ZSEbSfgzr3fBk5EwczhRuQ0u1XThjR3ECptKGn/dv+C
 2w6A==
X-Gm-Message-State: AOAM531lLR/CTsPdrdEHMTe4XerAq+VqEujSqN0CQ/E5ajjb1seWVIqE
 R+TeaXBkru9+tSzm2Y5DWk5RXA==
X-Google-Smtp-Source: ABdhPJxw9UcxguO1V2RwVLHQa0MsAfX0p1ZiCCW2rRale6BHe8ASvyCEBR7EX5vRbjzR4Oe8lHKPGA==
X-Received: by 2002:a5d:5913:: with SMTP id v19mr3564547wrd.207.1610110496783; 
 Fri, 08 Jan 2021 04:54:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z6sm11487207wmi.15.2021.01.08.04.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 04:54:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2B611FF7E;
 Fri,  8 Jan 2021 12:54:53 +0000 (GMT)
References: <20201223212752.1145294-1-keithp@keithp.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Keith Packard <keithp@keithp.com>
Subject: Re: [PATCH] gdbstub.c uses incorrect check for active gdb in
 use_gdb_syscalls
Date: Fri, 08 Jan 2021 12:36:06 +0000
In-reply-to: <20201223212752.1145294-1-keithp@keithp.com>
Message-ID: <875z471tcy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Keith Packard <keithp@keithp.com> writes:

> When checking whether there is a live gdb connection, code shouldn't
> use 'gdbserver_state.init' as that value is set when the
> gdbserver_state structure is initialized in init_gdbserver_state, not
> when the gdb socket has a valid connection.
>
> The 'handle_detach' function appears to use 'gdbserver_state.c_cpu' as
> an indication of whether there is a connection, so I've used the same
> in use_gdb_syscalls.

I guess it could be anything that is set by gdb_accept_init(). I'm a
little wary of c_cpu given it has a specific meaning of current cpu and
does move around depending on actions of the debugger.

It would be better to wrap the test in a function (static bool
is_connected()?) so the semantic meaning is clear in the code and we can
fix things in one place if needed.

> This avoids a segfault when qemu is run with the '-s' flag (create a
> gdb protocol socket), but without the '-S' flag (delay until 'c'
> command is received).

How exactly did you create the segfault? Just starting with -s and
attaching to a running tasks works fine for me although I Can see
semihosting stuff would never get to gdb after connection.

> I would like this patch to inform a discussion on whether the numerous
> other places using gdbserver_state.init are also incorrect (most of
> them appear to be using it in the same way use_gdb_syscalls does), and
> also whether use_gdb_syscalls should cache the result of this check or
> whether it should check each time it is called to see if a gdb
> connection is currently acive.

Hmm I don't see anything obviously wrong - although I note a bunch of
tests also check for ->fd which is probably a clearer indication of an
active connection. I'm sure this could be improved with a semantically
clearer code though.

> For the second question, I don't have a
> clear idea; mixing gdb and native calls seems problematic for stateful
> operations like file open/close.

Yes it's a bit of a hack. I can imagine starting with a remote GDB
connection and then loosing it after opening a file descriptor would
result in Bad Things (tm). I'm not sure what the cleanest approach is to
handling the resulting mess.

>
> Signed-off-by: Keith Packard <keithp@keithp.com>
> ---
>  gdbstub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index d99bc0bf2e..4e709d16fd 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -460,7 +460,7 @@ int use_gdb_syscalls(void)
>      /* -semihosting-config target=3Dauto */
>      /* On the first call check if gdb is connected and remember. */
>      if (gdb_syscall_mode =3D=3D GDB_SYS_UNKNOWN) {
> -        gdb_syscall_mode =3D gdbserver_state.init ?
> +        gdb_syscall_mode =3D gdbserver_state.c_cpu !=3D NULL ?
>              GDB_SYS_ENABLED : GDB_SYS_DISABLED;
>      }
>      return gdb_syscall_mode =3D=3D GDB_SYS_ENABLED;


--=20
Alex Benn=C3=A9e

