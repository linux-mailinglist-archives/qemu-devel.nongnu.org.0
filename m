Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B4C13FCCD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 00:13:45 +0100 (CET)
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isEKe-0008Vj-4W
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 18:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jkz@google.com>) id 1isEJm-0007yv-0R
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 18:12:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jkz@google.com>) id 1isEJk-0003T4-Tu
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 18:12:49 -0500
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43]:39912)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jkz@google.com>) id 1isEJk-0003Ru-Nr
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 18:12:48 -0500
Received: by mail-vk1-xa43.google.com with SMTP id t129so6170514vkg.6
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 15:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=btw7PgBg32bJXHLppoSQjQfUVuZmpY67KLb9SiiqWHU=;
 b=XjF61TQVmZey5ejZGrVSwvyKomgziMMPGvzCmHeNE88PiF6ak2cmz9eQVn5rVnWCio
 LuUkwMzPUGk4wIcEGFZYwqzk7Qg1hyXbSuAQcFkRUfuMBKrT7t6LOhBUHfTVUYuQ9CE/
 WdBedbLOJBPl0qz79XPxHdh4+Q1ijEZcJ+c+gftDtSGRYwkzmubY2KkBLuY8RfnkSHpx
 RPO7Ya/MMsQrmbQimQBR5XlklMMQkGLv9eARbblisncdmxjM1KcYOL1R6dpcFlQxXB2x
 MCAKHiwDq9OvjCeoxPcmvXE++809c3bySJyYkzkopX4D/2Kj50OjJBC2RJKvqLS9DOU1
 Omrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=btw7PgBg32bJXHLppoSQjQfUVuZmpY67KLb9SiiqWHU=;
 b=ib491PiUO+0YxkFaOABriT1XskSXBnN1W6lxwBr+Hg8SHlQEFbmWKOGmjoZC7vn1ej
 /YhUMjmuJFgtNc1iJqKZmm5PuSYgE2nxGlD3GCvhRjppiJ78Fsel8dWwU4j7XjgStfEq
 J0vIap3LhzDUoUe89UdjWUoxbbV03x6HRJYt3HImoFLgedjbq/GlUzNOIlqiF3oDSFNs
 G405m1V459CTja8VDKW9ftGI0eNT2gic91OqdjxcWmHJa3CQwyVNNxFn5Tcqk/M0PMZX
 jEzGdvE+jcHSY6OHJJZXro2nqjVFVC7GVMvucZ2Yg3ht/H+L8Rdkdvf18TLmN1gm1AVC
 ehVg==
X-Gm-Message-State: APjAAAWohJ4Qo5LOoLzBbVzCIdCoRDi203IzpJ8IF7vhBMsVhbT1Tx3+
 +q6L2RbggTKbTVxuRR3djzxghNbwj3IstPsWnCairQ==
X-Google-Smtp-Source: APXvYqwmbTbPfY1ih8tKOD30er92PoepKIOowRF2dxdHMthHiI6+GCYzsSYbxdnGyNDcy4E75RK+RpOyX/W65QB4FgQ=
X-Received: by 2002:a1f:fccb:: with SMTP id a194mr22503970vki.92.1579216367108; 
 Thu, 16 Jan 2020 15:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20200114030138.260347-1-jkz@google.com>
 <87h80ymhcd.fsf@linaro.org>
In-Reply-To: <87h80ymhcd.fsf@linaro.org>
From: Josh Kunz <jkz@google.com>
Date: Thu, 16 Jan 2020 15:12:35 -0800
Message-ID: <CADgy-2vNk5RKV5VdcaFANiopezPKEgdSSHsQc=a_WaWgsAvxzA@mail.gmail.com>
Subject: Re: [PATCH 0/4] migration: Replace gemu_log with qemu_log
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Riku Voipio <riku.voipio@iki.fi>, 
 Laurent Vivier <laurent@vivier.eu>, armbru@redhat.com
Content-Type: multipart/alternative; boundary="000000000000965e01059c49f669"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a43
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

--000000000000965e01059c49f669
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 3:02 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Josh Kunz <jkz@google.com> writes:
>
> <snip>
> >
> > Not tested:
> >   * Build/logging with bsd-user. I do not have easy access to a BSD
> > system.
>
> If you have the time we have vm-build-netbsd:
>
>   make vm-build-netbsd EXTRA_CONFIGURE_OPTS=3D"--disable-system"
>
> Which will create a NetBSD image for you and run the build through it.
> Other images are available ;-)
>

This works, but it looks like it only runs the tests on BSD, even with
`configure --enable-bsd-user` first. I don't see the bsd-user binaries
being produced in the output of this command.

--000000000000965e01059c49f669
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 14, 2020 at 3:02 AM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Josh Kunz &lt;<a href=3D"mailto:jkz@google.com" target=3D"_blank">jkz@googl=
e.com</a>&gt; writes:<br>
<br>
&lt;snip&gt;<br>
&gt;<br>
&gt; Not tested:<br>
&gt;=C2=A0 =C2=A0* Build/logging with bsd-user. I do not have easy access t=
o a BSD<br>
&gt; system.<br>
<br>
If you have the time we have vm-build-netbsd:<br>
<br>
=C2=A0 make vm-build-netbsd EXTRA_CONFIGURE_OPTS=3D&quot;--disable-system&q=
uot;<br>
<br>
Which will create a NetBSD image for you and run the build through it.<br>
Other images are available ;-)<br></blockquote><div><br></div><div>This wor=
ks, but it looks like it only runs the tests on BSD, even with `configure -=
-enable-bsd-user` first. I don&#39;t see the bsd-user binaries being produc=
ed in the output of this command.</div></div></div>

--000000000000965e01059c49f669--

