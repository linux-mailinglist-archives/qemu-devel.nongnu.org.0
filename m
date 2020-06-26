Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01B20BA13
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 22:14:04 +0200 (CEST)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joujb-0008SK-VD
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 16:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1jouib-0007tj-T3; Fri, 26 Jun 2020 16:13:02 -0400
Received: from home.keithp.com ([63.227.221.253]:46114 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1jouiX-000581-EO; Fri, 26 Jun 2020 16:13:01 -0400
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 2AF9E3F2CB96;
 Fri, 26 Jun 2020 13:12:53 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Q-I34M2iVTzj; Fri, 26 Jun 2020 13:12:52 -0700 (PDT)
Received: from keithp.com (168-103-152-72.tukw.qwest.net [168.103.152.72])
 by elaine.keithp.com (Postfix) with ESMTPSA id B593D3F2CA82;
 Fri, 26 Jun 2020 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1593202372; bh=oYtEsauZuorfVnhgAC4L9NLhapb/Gm12K/+8bw+hy20=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ReEC9GqgRxiOiahQIoQGkcLdKjTCMBw3zvUsTHacAKZ3WWwU47KPF+86SZOIQu1Cj
 vr2YGBAlK8vdF8zwybgBK4I5lKUhJGXOyMbKlWB5Fvk4HZnEhuWQyRlsKhhEXGggkv
 Vlfa1fMBfYMUu+ERRIiwwruPhyti2gYIL4i85vTfEqrh4/Pi5vTdM4/F6rxD7LhEzE
 4tD9GqibFgFVIeBaoqcfJpcFFYbp6zj20JK+D1gP/JaO2EfFNff/m7jhcPAvchgDQb
 McpmDsVzmdzEBdYOJdTw1JcDBprCJiRQH6EBx5VJ+v4Vxt+XITcNX7OqrimsjKRPX8
 9CCopwn1uXVmg==
Received: by keithp.com (Postfix, from userid 1000)
 id 1D5FC1582167; Fri, 26 Jun 2020 13:12:47 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH] hw/arm: Add 'virtm' hardware
In-Reply-To: <CAFEAcA_ZRMpqAhR7BL05a+O_C54fhXZn8-+kC_KUU5n3BpzoCw@mail.gmail.com>
References: <20200625230740.549114-1-keithp@keithp.com>
 <CAFEAcA9ut5CVAgRTP-_BK3WpiDSmitFowZMe549TvgSAjj+Kfg@mail.gmail.com>
 <87imfdixv9.fsf@keithp.com>
 <CAFEAcA_ZRMpqAhR7BL05a+O_C54fhXZn8-+kC_KUU5n3BpzoCw@mail.gmail.com>
Date: Fri, 26 Jun 2020 13:12:46 -0700
Message-ID: <87a70pio1t.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 16:12:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: "Keith Packard" <keithp@keithp.com>
From: "Keith Packard" via <qemu-devel@nongnu.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> writes:

> You might find the user-mode qemu-arm sufficient for that
> kind of thing. I know some gcc tests run that way. You
> get a processor, semihosting, and whatever memory your
> ELF file's data segment says you have (plus anything
> you care to mmap()).

Thanks for the pointer; I've spent a bit of time checking out whether
that might work, and it looks like I could get some testing done there,
but I couldn't get the chip startup code tested (things like enabling
the FPU, setting up the stack, data and bss segments).

I had always assumed that qemu-arm was designed to run user-mode Linux
applications on top of another Linux system (given that it's called
'arm-linux-user' in the qemu configuration code). That's why I hadn't
even tried using it for this work.

> Sure, but "machine-that-works-for-keith-packard" isn't really
> a very clearly-defined concept :-)

It seems well defined to me at least? An ARM core plus memory. That's
sufficient to run tests with semihosting to validate compilers,
libraries and the like. It would also serve as a model for people
developing new QEMU boards to start from; here's a processor and memory,
now you add peripherals and you've got a complete system.

This is all in service of a pretty easily explained goal -- a free
software C library designed for embedded systems that gets tested on the
target processors.

With QEMU, I'm able to incorporate all of the code necessary right in
the library to execute tests on simulated hardware that starts from the
reset vector. That same code can run on native hardware, allowing
developers to get past the usual embedded development startup hurdle of
creating a linker script, writing NVIC interrupt vector table and
initializing RAM.

I'd like to make the memory parameters configurable so that a developer
could set qemu to match their particular SoC. Then they'd be able to run
their application under QEMU and at least ensure that it gets to main()
before flashing it on the target hardware.

> I think that trying to weld M-profile into the A-profile virt
> board is likely to be more confusing than having a separate board.
> But I remain unhappy about defining a virtual board at all
> if I can avoid it.

Ok, that was my thinking for doing this as a separate board; the
existing virt board seems complex enough without attempting to wedge
something very different into it.

I'll experiment with the arm-linux-user mode of QEMU a bit more to see
how much testing that would enable; it should at least allow testing of
the libc and libm functions, although not the crt0 implementation and
sample linker scripts.

I'd love help in creating a better definition of what the 'virtm' board
should be, and figure out a way to explain it so that you appreciate the
value it brings to the ARM ecosystem.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl72Vr4ACgkQ2yIaaQAA
ABEiGBAAq6FY6vbywXCZbiXJRhkvv0zCSYngGFKXK5DsJ4YtioppPMllypv6o97q
GZnMDU0WUcX8m/TIU9ikZL/zh8xqUIOtkzDKUQqADk23+uCFH2CAVYNyGHgg+vMO
gQa2lf4TYjgv2gvPIB2nrV36akvHcGucNpfgf2wBsoIdacjtKtiGCo6/PF2pTp8F
IEftpv9OzPsKBqugJLNzmLhNYsiEOs5fiku59ERgBMB+tk5bJJghtFzA2Gqd533i
UJXqh4xAYZsuY97ENTG2EZ21xqIbeZLU0Ff1V6f9jWctxQYGFnq1w5G1KxYcH1J6
LuGqDZlCUwrLSXQAa+GUjaNgVMoJ7TN2qD3oXwE2GI7ksyED+JjOR3w8dedZYJWr
CRkDG5w6cE1ExDA+JnvtDKoD8ff071HIg3RevpU5iink0tztedAAqc+gkN8A8g11
1bMk/m/YO/x3x6nVM8qdfyDvzgFdchqvt2TDkzJQ3G1zsNvCnl7kykZW8hnw+F7s
7xRtXpN+7KD6bcdc3XrR470sN/0E2sSDLlQwLkCjEFu/ncYZ04rIPbqGvUCGrokI
Q8hGTJuefiGwuQ2znAbHRiTJ8CT+NhamKu11z1jmGINp42eg7QCumx4pMlhmdbk2
0A0ocbwBwr+6v28T3oT9QDxDIhiA3ysKYZITrIIexjGgqQ0oczQ=
=c4U7
-----END PGP SIGNATURE-----
--=-=-=--

