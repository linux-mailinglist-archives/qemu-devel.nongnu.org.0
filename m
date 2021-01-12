Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116FA2F3BA1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 21:53:57 +0100 (CET)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQfr-0001Or-PJ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 15:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1kzQf1-000104-Sa
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 15:53:03 -0500
Received: from home.keithp.com ([63.227.221.253]:41338 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1kzQez-0004LZ-A7
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 15:53:03 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id B22363F2E77A;
 Tue, 12 Jan 2021 12:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1610484776; bh=Yc+AUOyQnuNogR+JtbjoIoxiWHny7cAAXVADZhbFyck=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=AR1d+p49QDiKY06D+mr5KQDyfbedbVaPRhO96XRW+4Dyq26LBJTUIWaF6CVGzwNy9
 jdLF0OjC97W8znJUFBNUSwthHfgSsUda6C2vxz6TN4ptwW0LwYEwKtCDXHzJvDAQJX
 BULbSfQmTaGfUwA/SkB2OYndIvwtSlVV8VoOskC/vyDNeh5eEOpM0+ea+WpsG9k2WD
 vB3kjhW7zJaQ0TFJsVxkVnEYp8JUQLx/cj7tilpRwNFxqz+YztfNKloW2ASK/HNR5n
 6oQIq870tbih5r99QsTO1I6I38F3DIbn6+w9aPeSNlYMK2XZf4JCMuU0Kueyjg5saM
 U3lzRGKJHvDXA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id O56y5zBXJcNm; Tue, 12 Jan 2021 12:52:56 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 1E6933F2E776;
 Tue, 12 Jan 2021 12:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1610484776; bh=Yc+AUOyQnuNogR+JtbjoIoxiWHny7cAAXVADZhbFyck=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=AR1d+p49QDiKY06D+mr5KQDyfbedbVaPRhO96XRW+4Dyq26LBJTUIWaF6CVGzwNy9
 jdLF0OjC97W8znJUFBNUSwthHfgSsUda6C2vxz6TN4ptwW0LwYEwKtCDXHzJvDAQJX
 BULbSfQmTaGfUwA/SkB2OYndIvwtSlVV8VoOskC/vyDNeh5eEOpM0+ea+WpsG9k2WD
 vB3kjhW7zJaQ0TFJsVxkVnEYp8JUQLx/cj7tilpRwNFxqz+YztfNKloW2ASK/HNR5n
 6oQIq870tbih5r99QsTO1I6I38F3DIbn6+w9aPeSNlYMK2XZf4JCMuU0Kueyjg5saM
 U3lzRGKJHvDXA==
Received: by keithp.com (Postfix, from userid 1000)
 id DA6121582498; Tue, 12 Jan 2021 12:52:55 -0800 (PST)
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gdbstub.c uses incorrect check for active gdb in
 use_gdb_syscalls
In-Reply-To: <875z471tcy.fsf@linaro.org>
References: <20201223212752.1145294-1-keithp@keithp.com>
 <875z471tcy.fsf@linaro.org>
Date: Tue, 12 Jan 2021 12:52:55 -0800
Message-ID: <87zh1dnahk.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Reply-to: Keith Packard <keithp@keithp.com>
From: Keith Packard via <qemu-devel@nongnu.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> It would be better to wrap the test in a function (static bool
> is_connected()?) so the semantic meaning is clear in the code and we can
> fix things in one place if needed.

That makes good sense to me.

> How exactly did you create the segfault? Just starting with -s and
> attaching to a running tasks works fine for me although I Can see
> semihosting stuff would never get to gdb after connection.

Making a semihosting call before GDB is connected results in
dereferencing a NULL gdbserver_state.c_cpu pointer below
gdb_do_syscallv. The sequence goes like this:

 1. gdbserver_start is called during qemu startup, which calls
    init_gdbserver_state which sets gdbserver_state.init =3D true

 2. application makes semihosting call (like putc)

 3. semihosting code calls use_gdb_syscalls(), which returns true
    because gdbserver_state.init is true

 4. gdb_do_syscallv checks gdbserver_state.init, which is true

 5. gdb_do_syscallv uses gdbserver_state.c_cpu, which is still NULL and
    causes a segfault in qemu_cpu_kick

> Hmm I don't see anything obviously wrong - although I note a bunch of
> tests also check for ->fd which is probably a clearer indication of an
> active connection. I'm sure this could be improved with a semantically
> clearer code though.

fd is < 0 only *after* a connection has failed, it is not set to -1 before
a connection has started. I agree that using 'fd' is a good idea instead
of c_cpu, but it would need to be combined with checking 'init' and
initializing fd to -1 when init is set to true.

In any case, hiding all of this behind a couple of functions seems like
a good idea. For now, I'll continue to use c_cpu as that is independent
of CONFIG_USER_ONLY *and* has the advantage of being initialized to NULL
by default. It's marked with XXX in the patch as it seems like a bit of
a kludge.

> Yes it's a bit of a hack. I can imagine starting with a remote GDB
> connection and then loosing it after opening a file descriptor would
> result in Bad Things (tm). I'm not sure what the cleanest approach is to
> handling the resulting mess.

Hrm. use_gdb_syscalls caches the results of the first test, so we won't
ever mix things, we'll just get some semihosting calls dropped when the
gdb server is not connected. If use_gdb_syscalls checks for a valid
connection, then gdb will never get semihosting calls if -S is not on
the command line. If use_gdb_syscalls checks for gdbserver_state.init,
then gdb will get semihosting calls whenever it is connected, otherwise
those calls will be dropped.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl/+DCcACgkQ2yIaaQAA
ABHftQ//azQezGWsaFBgssTUDTpGZuUMQQgvqnZMAGSO0gm6K2gwBq9OurMnSiNs
U35i+PYRn6RMm/RvPXjgERZj0LAm8j6mt5ngvzawKKEQMcbaAUphNbIyxb4h3JzD
Waw8HpYc4ykf16FJ/eWvtesSQLl+tnnBMgsb+bttOHd1VrYfIZjXDf7L4lQhFdzz
ou5c+a4vjLwdNlpgmSZ9lvgffpdbdX//Gu6vaXN0G9HEJTOCPxj4ox4RBs9dWIou
tKqf3xjkjqwWQgjgCwouOMTngI4O0RCLK5Jri9ICMMGmUseYhMhKIPotOR4imtQX
QJeL1b0uz5Dz6TYvvdU4lHeBxIfxRS+SjvYpzIoJttU11hz8qSamJhxvyxJ1ofh/
6Y8TmlZlMoFAuSHTo5MwvNY7NRdi4s4u5LZeAw946jr7BACNwnvKOvZqn6+c3J4z
B76ZJBUZaKkRY4meDFoCHGLLvJtlO5ZI8gFt4b7hKRaQ4N0DregNiEG0Fekk74IY
OOh1pyCJ0inLtb9Dgu0RutT9Xap79tZYxzRjhdHeYuC2IE78n4Ru+d6eqjJl+JcT
FH0iWg34vtLMG28Etro0pdZn9VgcE+F4VP2Bkmc6yYsLTG18xVnfyN1PPAFCumHb
4JLllES/lyOYdjkNAkE/q2+lc8kDWljO4ZUiIxDK6yEKuTxpkFI=
=Ths9
-----END PGP SIGNATURE-----
--=-=-=--

