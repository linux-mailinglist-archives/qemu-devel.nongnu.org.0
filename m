Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A701E2E60
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 12:10:44 +0200 (CEST)
Received: from localhost ([::1]:37465 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNa4o-00006Q-UR
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 06:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iNZLX-0002ea-5f
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:23:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iNZLV-0002Y5-Up
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:23:55 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46752)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iNZLV-0002Xx-Q3
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:23:53 -0400
Received: by mail-oi1-x243.google.com with SMTP id k25so19958857oiw.13
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 02:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cASFsJucXib3nrUJECLJsPBKbh1yQRG/gE0j5Bbte2k=;
 b=ch2IScRd4LHbB+EH7P8RX0nRaLif7ShZKEMyDcr2sJATmFOqX9XFTvaqc9e1u9MFu2
 IfsLmJ/X4gZOp8RlyDVAUZRLsTubw1PegBSY6MdGv/qhd+8dkgaXOY7DLpAF7oro4ix6
 dSase7AhaiStrM4BNyTAxeMl5+lmC94hhnrWaRkTkTiBv5Cm7hX6CQkn7CIipTnxrEqQ
 ZDSdimkI8eNj6+95d4PR2d7oxRbVS8RnQUkL+iAHGiF80IaXv04p4tXKVRq/GlGfvSCo
 j21Yvve4l1Djdp5+QwCBJZ5b10HtA4+CTWYspLk3EhN2fidgCwr3oTKeoeB0l9offM0C
 d0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cASFsJucXib3nrUJECLJsPBKbh1yQRG/gE0j5Bbte2k=;
 b=kxrrkpTKPblgtHKAe2o9kmNovKMe2h7e12VxsX0Y7J39neeR51719oqb9zUWnIlC09
 k3sam97GDrJkB+87BeKV2vNpGB3Yyj57IktBUXNuYKOANkewP4LyxkcwoHGTM2E6WN7M
 +gefAKZwDnCRhBsQGb9x4IB+XYN1+g6eYpHeqlwqYh2233NYYWmMGbMRv/GkW02acQq9
 bOn+TrdOGX75124p7tusqNb1dYTafesb/0cKbFk9b/I4VYGJYJQICKzAr8VENEd+ZIym
 /0YthTAklQ8BUWjqbH55NYd5P7j72Jk3wrghirCtwPzR8pE2TYZSJG6Y7L7RO0SrHRq+
 scLQ==
X-Gm-Message-State: APjAAAUTyttcK5AvVHAYTMvwIyrU/KQPnbB56A6m0APSTg4SGhOUnzZP
 dp5QEW4/pkb3hy4ysSyeVl6dUFOJgFXppT+qR5g=
X-Google-Smtp-Source: APXvYqy9EA7Su9stU56+mUy8RTpBXchNbtVDWsLI5/da89lVAnmA/HAFEimQOaVfDjrh0VzIf/9n6HYwAJa4QOipuig=
X-Received: by 2002:aca:62d5:: with SMTP id w204mr3795228oib.136.1571909032914; 
 Thu, 24 Oct 2019 02:23:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 24 Oct 2019 02:23:52
 -0700 (PDT)
In-Reply-To: <20191019153437.9820-1-f4bug@amsat.org>
References: <20191019153437.9820-1-f4bug@amsat.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 24 Oct 2019 11:23:52 +0200
Message-ID: <CAL1e-=hMJmmRzD8iQdKji__RKPbGrV0fGNciz2bgLjkhmC2v6Q@mail.gmail.com>
Subject: Re: [PATCH 00/11] tests/acceptance: Fix 64-bit MIPS target tests
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000086d37e0595a49796"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Cleber Rosa <crosa@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000086d37e0595a49796
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping for Cleber and Eduardo

On Saturday, October 19, 2019, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> v2:
> - Fixed GIT_COMMITTER_NAME
> - do no include Aleksandar Rikalo mailmap change
>
> Commit 9090d3332cdcc introduced a regression which makes the
> 64-bit target tests to fail.
>
> This series fix it (by previously refactoring the linux_ssh_malta
> test), and also add another test for the 5KEc CPU.
>
> I had to include Avocado-related patches not yet merged again to
> avoid sending patches that will later not apply.
>
> Please review,
>
> Phil.
>
> Cleber Rosa (1):
>   Acceptance tests: refactor wait_for_console_pattern
>
> Philippe Mathieu-Daud=C3=A9 (10):
>   tests/acceptance: Fixe wait_for_console_pattern() hangs
>   tests/acceptance: Send <carriage return> on serial lines
>   tests/acceptance: Refactor exec_command_and_wait_for_pattern()
>   tests/boot_linux_console: Use Avocado archive::gzip_uncompress()
>   tests/boot_linux_console: Run BusyBox on 5KEc 64-bit cpu
>   tests/ssh_linux_malta: Run tests using a snapshot image
>   tests/ssh_linux_malta: Remove duplicated test
>   tests/ssh_linux_malta: Match stricter console output
>   tests/ssh_linux_malta: Refactor how to get image/kernel info
>   tests/ssh_linux_malta: Fix 64-bit target tests
>
>  tests/acceptance/avocado_qemu/__init__.py |  45 ++++++++
>  tests/acceptance/boot_linux_console.py    |  88 ++++++++-------
>  tests/acceptance/linux_ssh_mips_malta.py  | 124 +++++++++++-----------
>  3 files changed, 158 insertions(+), 99 deletions(-)
>
> --
> 2.21.0
>
>
>

--00000000000086d37e0595a49796
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping for Cleber and Eduardo<br><br>On Saturday, October 19, 2019, Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</=
a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">v2:<br>
- Fixed GIT_COMMITTER_NAME<br>
- do no include Aleksandar Rikalo mailmap change<br>
<br>
Commit 9090d3332cdcc introduced a regression which makes the<br>
64-bit target tests to fail.<br>
<br>
This series fix it (by previously refactoring the linux_ssh_malta<br>
test), and also add another test for the 5KEc CPU.<br>
<br>
I had to include Avocado-related patches not yet merged again to<br>
avoid sending patches that will later not apply.<br>
<br>
Please review,<br>
<br>
Phil.<br>
<br>
Cleber Rosa (1):<br>
=C2=A0 Acceptance tests: refactor wait_for_console_pattern<br>
<br>
Philippe Mathieu-Daud=C3=A9 (10):<br>
=C2=A0 tests/acceptance: Fixe wait_for_console_pattern() hangs<br>
=C2=A0 tests/acceptance: Send &lt;carriage return&gt; on serial lines<br>
=C2=A0 tests/acceptance: Refactor exec_command_and_wait_for_<wbr>pattern()<=
br>
=C2=A0 tests/boot_linux_console: Use Avocado archive::gzip_uncompress()<br>
=C2=A0 tests/boot_linux_console: Run BusyBox on 5KEc 64-bit cpu<br>
=C2=A0 tests/ssh_linux_malta: Run tests using a snapshot image<br>
=C2=A0 tests/ssh_linux_malta: Remove duplicated test<br>
=C2=A0 tests/ssh_linux_malta: Match stricter console output<br>
=C2=A0 tests/ssh_linux_malta: Refactor how to get image/kernel info<br>
=C2=A0 tests/ssh_linux_malta: Fix 64-bit target tests<br>
<br>
=C2=A0tests/acceptance/avocado_qemu/<wbr>__init__.py |=C2=A0 45 ++++++++<br=
>
=C2=A0tests/acceptance/boot_linux_<wbr>console.py=C2=A0 =C2=A0 |=C2=A0 88 +=
+++++++-------<br>
=C2=A0tests/acceptance/linux_ssh_<wbr>mips_malta.py=C2=A0 | 124 +++++++++++=
-----------<br>
=C2=A03 files changed, 158 insertions(+), 99 deletions(-)<br>
<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--00000000000086d37e0595a49796--

