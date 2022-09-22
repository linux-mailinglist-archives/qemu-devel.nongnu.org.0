Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3F15E6CC2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 22:09:06 +0200 (CEST)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSVN-0001LG-1c
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 16:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSSd-0005q9-2p
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:06:15 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:46023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSSb-0006GZ-1G
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:06:14 -0400
Received: by mail-lj1-x22f.google.com with SMTP id c7so12278807ljm.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=YYK0N5/Cuyam/Hu+N6F7qMrxu1Apz27vzpN+360WtUQ=;
 b=VMee4L0lB2WlallaMzMYiKxsWYgXBR0sxmPWRb6X6oN6r7rA4Et8AolhtN/x9iaTn5
 9n/diN4GJmh48tixdvrBc2XCoSVRmRPh1OEGjH/hydgbjDKBlbbEp36U5YvbvtHKNTGO
 8xHZ2FgquzEkZHejLMLEINhxotMvwhDEjgGM3zwIVjNgEERI9CjM99UgYywijMNPzWfh
 JCdsBfd1XLUOyJWx+GYr25/NttoQmn8oVCzpntVSyLgv+A3G7MWlSymM6auhPS/I27Rg
 NpI5yRi46cPL9UvDTsBo9n5yw0fsiSv4/z0uqCiE874H7Mnf69XkXCqp405Tm+N3yfg1
 WE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=YYK0N5/Cuyam/Hu+N6F7qMrxu1Apz27vzpN+360WtUQ=;
 b=VAuuP866TALFSnD/97CF9AyU9qfoY5Et5YGdbppbnoX04Qf758lBLSH7xSHTyKWifa
 BO60ZktKtz4MH+ro8/hxD60tt1/Ws5JMSqVwCkaD/1qCmNrGCFZNZWtL8Wun4vZxlgM/
 xJpotNvYkPH2sHw8pwUTUsm55JgC/Po9nP4AtumaNplaEy4D6vDe7sy0E3HnQSWUlq3W
 BeiJajyY2Likdu4Et+70sCWmrl+qrz2YZIpF9EuPL5a5JDXDhJHIV5zYTpIiwXcdv6f/
 LTPxoUO5fDmEu5nGWKTSfMErBG79wPRYawk2HYqSSRPXQ/kEfzD+W6sbZsObEKC+O+/6
 qkoQ==
X-Gm-Message-State: ACrzQf3sfrrlbKddqOq1D8gEDkyUyxVPxxankSU9g5goxziWXzBI+0IO
 stH+lEwuQg9SlEyx2xNzm1n70JDu9VHh63hfLRc=
X-Google-Smtp-Source: AMsMyM4zGRYLvVTsZl0oYKIbsqWVNDBe6KlVCqEIf9g0nGHFn7htUNxgZkhhTBjDiKWuSowuqANeHQC3luE5jhM1CuE=
X-Received: by 2002:a2e:95cd:0:b0:26c:3bb0:289f with SMTP id
 y13-20020a2e95cd000000b0026c3bb0289fmr1667296ljh.449.1663877171063; Thu, 22
 Sep 2022 13:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-25-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-25-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 22:05:59 +0200
Message-ID: <CAJ+F1CKOqza6sws3UsK=UuuvTX2O0uutebPnur1a7W=-+jd5vw@mail.gmail.com>
Subject: Re: [PATCH v2 24/39] tests/qtest: virtio-net-failover: Disable
 migration tests for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bb326205e94997ca"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000bb326205e94997ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 3:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> These tests use the exec migration protocol, which is unsupported
> on Windows as of today. Disable these tests for now.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> (no changes since v1)
>
>  tests/qtest/virtio-net-failover.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/virtio-net-failover.c
> b/tests/qtest/virtio-net-failover.c
> index 443ee56de9..4a809590bf 100644
> --- a/tests/qtest/virtio-net-failover.c
> +++ b/tests/qtest/virtio-net-failover.c
> @@ -588,6 +588,7 @@ static void test_hotplug_2_reverse(void)
>      machine_stop(qts);
>  }
>
> +#ifndef _WIN32
>  static QDict *migrate_status(QTestState *qts)
>  {
>      QDict *resp, *ret;
> @@ -1827,6 +1828,7 @@ static void test_multi_in(gconstpointer opaque)
>
>      machine_stop(qts);
>  }
> +#endif /* _WIN32 */
>
>  int main(int argc, char **argv)
>  {
> @@ -1857,7 +1859,11 @@ int main(int argc, char **argv)
>      qtest_add_func("failover-virtio-net/hotplug/2_reverse",
>                     test_hotplug_2_reverse);
>
> -    /* migration tests */
> +#ifndef _WIN32
> +    /*
> +     * These migration tests cases use the exec migration protocol,
> +     * which is unsupported on Windows.
> +     */
>      qtest_add_data_func("failover-virtio-net/migrate/on/out", tmpfile,
>                          test_migrate_out);
>      qtest_add_data_func("failover-virtio-net/migrate/on/in", tmpfile,
> @@ -1886,6 +1892,7 @@ int main(int argc, char **argv)
>                          tmpfile, test_multi_out);
>      qtest_add_data_func("failover-virtio-net/migrate/multi/in",
>                     tmpfile, test_multi_in);
> +#endif /* _WIN32 */
>
>      ret =3D g_test_run();
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bb326205e94997ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 3:28 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuzho=
u Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blank"=
>xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
These tests use the exec migration protocol, which is unsupported<br>
on Windows as of today. Disable these tests for now.<br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
(no changes since v1)<br>
<br>
=C2=A0tests/qtest/virtio-net-failover.c | 9 ++++++++-<br>
=C2=A01 file changed, 8 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-fai=
lover.c<br>
index 443ee56de9..4a809590bf 100644<br>
--- a/tests/qtest/virtio-net-failover.c<br>
+++ b/tests/qtest/virtio-net-failover.c<br>
@@ -588,6 +588,7 @@ static void test_hotplug_2_reverse(void)<br>
=C2=A0 =C2=A0 =C2=A0machine_stop(qts);<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
=C2=A0static QDict *migrate_status(QTestState *qts)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QDict *resp, *ret;<br>
@@ -1827,6 +1828,7 @@ static void test_multi_in(gconstpointer opaque)<br>
<br>
=C2=A0 =C2=A0 =C2=A0machine_stop(qts);<br>
=C2=A0}<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
@@ -1857,7 +1859,11 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;failover-virtio-net/hotplug/2_reve=
rse&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_=
hotplug_2_reverse);<br>
<br>
-=C2=A0 =C2=A0 /* migration tests */<br>
+#ifndef _WIN32<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* These migration tests cases use the exec migration p=
rotocol,<br>
+=C2=A0 =C2=A0 =C2=A0* which is unsupported on Windows.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_data_func(&quot;failover-virtio-net/migrate/o=
n/out&quot;, tmpfile,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0test_migrate_out);<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_data_func(&quot;failover-virtio-net/migrate/o=
n/in&quot;, tmpfile,<br>
@@ -1886,6 +1892,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tmpfile, test_multi_out);<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_data_func(&quot;failover-virtio-net/migrate/m=
ulti/in&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpfi=
le, test_multi_in);<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D g_test_run();<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bb326205e94997ca--

