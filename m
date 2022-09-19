Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF445BCCF6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:22:16 +0200 (CEST)
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGj1-000763-Sc
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1oaGbJ-0006ML-6k
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:14:17 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:14755
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1oaGbH-0005Qm-Hl
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:14:16 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4MWQ9h3x4pz8PbN;
 Mon, 19 Sep 2022 09:14:00 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=from:to:cc
 :date:message-id:in-reply-to:references:subject:mime-version
 :content-type; s=default; bh=vSE30Iq0z07RAxCjks5x0qcC7zc=; b=F/S
 LLDCku+uL0ozvveJPwDysT9qpHy2bX4jY6x2TLsXu7BriXYowfCDAjWdkuyXA5oI
 CRSR75PJ1X2k6wxVInYKPTmdl5a9n9XpmBgv+xOk4UXe6hj3/sbhEz7d+2fb4mP+
 hN1tRtvSk5Hz/k+lvqxFDU5abKAcv4IG7HJYqGIc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=from:to:cc
 :date:message-id:in-reply-to:references:subject:mime-version
 :content-type; q=dns; s=default; b=esVT8Qgt668vavu9OIre0tIDW3bJ1
 jUS2wp/BJgWbj1cGRx220CL0rj7A5N293GvLjEzt29v4QjHemOSfRXAGKTeKzZ6P
 M4ba6qjfe5YX/7h3GEOZ9Lrcf8taHKUXmMCRx13sHx8tzPHD6lz3EHMONlHdNYWN
 lNkvKmnKbLjwXQ=
Received: from [192.168.3.33]
 (bras-base-toroon2719w-grc-64-174-89-121-3.dsl.bell.ca [174.89.121.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4MWQ9h1Nz6z8PbK;
 Mon, 19 Sep 2022 09:14:00 -0400 (EDT)
From: Brad Smith <brad@comstyle.com>
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>
CC: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 "Alex Benn_e" <alex.bennee@linaro.org>,
 "Philippe Mathieu-Daud_" <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Date: Mon, 19 Sep 2022 09:13:59 -0400
Message-ID: <18355e251d8.27f3.c0f5e3539a5acb9c2563017afaca17d6@comstyle.com>
In-Reply-To: <23707701-c7a2-0f46-8146-71218b17534b@redhat.com>
References: <YxacoSbT1cZR4SKr@humpty.home.comstyle.com>
 <23707701-c7a2-0f46-8146-71218b17534b@redhat.com>
User-Agent: AquaMail/1.38.1 (build: 103801197)
Subject: Re: [PATCH] tests/vm: update NetBSD to 9.3
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="18355e25481352227f34add9fa"
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--18355e25481352227f34add9fa
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On September 19, 2022 9:05:31 a.m. Thomas Huth <thuth@redhat.com> wrote:

> On 06/09/2022 03.04, Brad Smith wrote:
>> tests/vm: update NetBSD to 9.3
>>
>> Signed-off-by: Brad Smith <brad@comstyle.com>
>> ---
>> tests/vm/netbsd | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
>> index da6773ff59..aa54338dfa 100755
>> --- a/tests/vm/netbsd
>> +++ b/tests/vm/netbsd
>> @@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
>> name =3D "netbsd"
>> arch =3D "x86_64"
>>
>> -    link =3D=20
>> "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.2/images/NetBSD-9.2-amd64.=
iso"
>> -    csum =3D=20
>> "5ee0ea101f73386b9b424f5d1041e371db3c42fdd6f4e4518dc79c4a08f31d43091eb=
e93425c9f0dcaaed2b51131836fe6774f33f89030b58d64709b35fda72f"
>> +    link =3D=20
>> "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.3/images/NetBSD-9.3-amd64.=
iso"
>> +    csum =3D=20
>> "2bfce544f762a579f61478e7106c436fc48731ff25cf6f79b392ba5752e6f5ec13036=
4286f7471716290a5f033637cf56aacee7fedb91095face59adf36300c3"
>> size =3D "20G"
>> pkgs =3D [
>>  # tools
>
> Tested-by: Thomas Huth <thuth@redhat.com>
>
> I can pick this up for my next "testing"-related pull request.

Thanks.


Sent with Aqua Mail for Android
https://www.aqua-mail.com

--18355e25481352227f34add9fa
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">On September 19, 2022 9:=
05:31 a.m. Thomas Huth &lt;thuth@redhat.com&gt; wrote:</span></div><div id=
=3D"aqm-original" style=3D"color: black;">
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">On 06/09/2022 03.04, Brad Smith wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">tests/vm: update NetBSD to 9.3</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Brad Smith &lt;brad@comstyle.com&gt;</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">tests/vm/netbsd | 4 ++--</div>
<div dir=3D"auto">1 file changed, 2 insertions(+), 2 deletions(-)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/tests/vm/netbsd b/tests/vm/netbsd</div>
<div dir=3D"auto">index da6773ff59..aa54338dfa 100755</div>
<div dir=3D"auto">--- a/tests/vm/netbsd</div>
<div dir=3D"auto">+++ b/tests/vm/netbsd</div>
<div dir=3D"auto">@@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):</div>
<div dir=3D"auto">name =3D "netbsd"</div>
<div dir=3D"auto">arch =3D "x86_64"</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">- &nbsp; &nbsp;link =3D "https://cdn.netbsd.org/pub/NetBS=
D/NetBSD-9.2/images/NetBSD-9.2-amd64.iso"</div>
<div dir=3D"auto">- &nbsp; &nbsp;csum =3D "5ee0ea101f73386b9b424f5d1041e371=
db3c42fdd6f4e4518dc79c4a08f31d43091ebe93425c9f0dcaaed2b51131836fe6774f33f89=
030b58d64709b35fda72f"</div>
<div dir=3D"auto">+ &nbsp; &nbsp;link =3D "https://cdn.netbsd.org/pub/NetBS=
D/NetBSD-9.3/images/NetBSD-9.3-amd64.iso"</div>
<div dir=3D"auto">+ &nbsp; &nbsp;csum =3D "2bfce544f762a579f61478e7106c436f=
c48731ff25cf6f79b392ba5752e6f5ec130364286f7471716290a5f033637cf56aacee7fedb=
91095face59adf36300c3"</div>
<div dir=3D"auto">size =3D "20G"</div>
<div dir=3D"auto">pkgs =3D [</div>
<div dir=3D"auto">&nbsp; # tools</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Tested-by: Thomas Huth &lt;thuth@redhat.com&gt;</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I can pick this up for my next "testing"-related pull req=
uest.</div>
</blockquote>
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks.</div><div dir=
=3D"auto"><br></div>
</div>
<div style=3D"color: black;">
<p style=3D"margin: 0 0 1em 0; color: black; font-family: sans-serif;">Sent=
 with <a href=3D"https://play.google.com/store/apps/details?id=3Dorg.kman.A=
quaMail">Aqua Mail for Android</a><br>
<a href=3D"https://www.aqua-mail.com">https://www.aqua-mail.com</a></p>
</div>
</body>
</html>

--18355e25481352227f34add9fa--


