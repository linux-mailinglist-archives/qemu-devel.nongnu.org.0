Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB82C3E44
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 11:41:43 +0100 (CET)
Received: from localhost ([::1]:58250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khsF4-00084R-GW
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 05:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khsE6-00075A-Ti; Wed, 25 Nov 2020 05:40:42 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:43705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khsE5-00077C-8D; Wed, 25 Nov 2020 05:40:42 -0500
Received: by mail-ej1-x642.google.com with SMTP id k27so2286793ejs.10;
 Wed, 25 Nov 2020 02:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JDXtBYcuuRxOiCAVLeZf6/IcC/h23HsqzybB+jzVtB8=;
 b=pjcHRc2sO1Ywr7UKIOz/Hoo3NTekbEUJKVOd1oJEWf9XIPvoISOqGnQhgVAY3zb8uA
 SVPskk2vgqNM4JZ2tMtqNBEHLe5eIu79rrgc9RMk/lFPuB3f8ZvPCeocP/9AnfSSlzti
 cfYsnSZPhZMYPd4ZsmLfM0b7C/+y6IOgWEEf/d2lOOLH2NcVfQAlVqBuVG4yJ4WmyCB9
 AG5fTJ3laSJx4LJv78kRMWnkZE+QA8BYBID7G4f/HeFaYG+izcgWqEKh9WTdPQsbWoZs
 u9EqclHjenE7pH0LlwRG65BpdEFCaJJ70SmVFzzsbbzwT9B1wruvHkgBRXWhLjuIgzD3
 7Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JDXtBYcuuRxOiCAVLeZf6/IcC/h23HsqzybB+jzVtB8=;
 b=SQk8J7LfcO0/lDRw94V9nPv2MmUKXyFIHNcLoJBBzLN2vjL+hejF+9lGuO1cSG7Pw6
 3rrLAMTgAH0JIIBGd+O1cQvSHWTL0UpVcgoIBMcLbZCk55gXmUU/le6oZ6T/E/QXpT1k
 iHXSM5mB1jiVWEx5oRWgzwto/z5DV5o1PoprI+s3sFwnEOy7+QCxILAG+VLATLCqJfDg
 8KxB3zDGSR3e1juA7ohgMjYWl7c2e1Wjxfoj8+hOVHqoEuLcAPfXUKMV/Gcsg7shiazY
 jNpyf7vENsn3eJJc0hTdbs61k1HmUr7kmnZDBXoCr5ol02Ex/qvHxrjyk0QYESmNbwSk
 Cu1Q==
X-Gm-Message-State: AOAM5317cACawN5WtkUg6Jb7CuaSMp57AAWMiH6nVJaDEjdqTQI0KOG3
 6KF9/Nra0v/nIyroRRxKC8z+IF6/dRgpKDIOsOE=
X-Google-Smtp-Source: ABdhPJy2iLsnwNhbvrORmhV20eqZuojWcvVRTvBFylUANS9HNFsZ/7h7j91ii/hoawtpmryY8S2Rwzh4VAnlf1CYgU0=
X-Received: by 2002:a17:906:bcd4:: with SMTP id
 lw20mr2457966ejb.527.1606300839322; 
 Wed, 25 Nov 2020 02:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20201125102403.57709-1-alex.chen@huawei.com>
In-Reply-To: <20201125102403.57709-1-alex.chen@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 25 Nov 2020 14:40:27 +0400
Message-ID: <CAJ+F1C+mc-HHs629SYQcRtxrLZxaEne5Bi+NnWOyo4EAEL3oyw@mail.gmail.com>
Subject: Re: [PATCH] test-qga: fix a resource leak in
 test_qga_guest_get_osinfo()
To: Alex Chen <alex.chen@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000ee2bc805b4ec0ec7"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x642.google.com
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
Cc: qemu trival <qemu-trivial@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ee2bc805b4ec0ec7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 2:37 PM Alex Chen <alex.chen@huawei.com> wrote:

> The fixture->fd is created in fixture_setup() and, likewise, needs to be
> closed
> in fixture_tear_down().
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>


Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  tests/test-qga.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/test-qga.c b/tests/test-qga.c
> index c1b173b3cb..eb33264e8e 100644
> --- a/tests/test-qga.c
> +++ b/tests/test-qga.c
> @@ -111,6 +111,7 @@ fixture_tear_down(TestFixture *fixture, gconstpointer
> data)
>
>      g_rmdir(fixture->test_dir);
>      g_free(fixture->test_dir);
> +    close(fixture->fd);
>  }
>
>  static void qmp_assertion_message_error(const char     *domain,
> --
> 2.19.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ee2bc805b4ec0ec7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 25, 2020 at 2:37 PM Alex =
Chen &lt;<a href=3D"mailto:alex.chen@huawei.com">alex.chen@huawei.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The fi=
xture-&gt;fd is created in fixture_setup() and, likewise, needs to be close=
d<br>
in fixture_tear_down().<br>
<br>
Reported-by: Euler Robot &lt;<a href=3D"mailto:euler.robot@huawei.com" targ=
et=3D"_blank">euler.robot@huawei.com</a>&gt;<br>
Signed-off-by: Alex Chen &lt;<a href=3D"mailto:alex.chen@huawei.com" target=
=3D"_blank">alex.chen@huawei.com</a>&gt;<br></blockquote><div><br></div><di=
v><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:=
marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br>=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/test-qga.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/tests/test-qga.c b/tests/test-qga.c<br>
index c1b173b3cb..eb33264e8e 100644<br>
--- a/tests/test-qga.c<br>
+++ b/tests/test-qga.c<br>
@@ -111,6 +111,7 @@ fixture_tear_down(TestFixture *fixture, gconstpointer d=
ata)<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_rmdir(fixture-&gt;test_dir);<br>
=C2=A0 =C2=A0 =C2=A0g_free(fixture-&gt;test_dir);<br>
+=C2=A0 =C2=A0 close(fixture-&gt;fd);<br>
=C2=A0}<br>
<br>
=C2=A0static void qmp_assertion_message_error(const char=C2=A0 =C2=A0 =C2=
=A0*domain,<br>
-- <br>
2.19.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ee2bc805b4ec0ec7--

