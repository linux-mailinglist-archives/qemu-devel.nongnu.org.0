Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE88A400313
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:17:25 +0200 (CEST)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBsa-0002qk-RZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mMBfw-00008V-P1; Fri, 03 Sep 2021 12:04:23 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mMBfu-0007HH-EN; Fri, 03 Sep 2021 12:04:20 -0400
Received: by mail-ej1-x633.google.com with SMTP id i21so13065084ejd.2;
 Fri, 03 Sep 2021 09:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hIGTA3O92tKzZmj48Bt5cff3kfhjrrVO2XocxUD/QaY=;
 b=dK2AZsZ8d6Aq2AZn8+rosYyKOQKUlAayh+/YLBcdxVP3yNiLCnkU3UGQF+18+zyUZ5
 EwBzFAvYv7dGfRPacoYOhlQqyqPuQeDvpK9EceKTCD9mxYC2dAaXtXARkvFE6KJpfGEG
 iV6NVGIhdmUeuc5XBJYuLHr5GzmIlfXq6oHN4YUbnHcbCXiudfeLg5ql7tXed9AHROVL
 Lqg4Dw2kYOXLzAbXvMVtbDzjkTibKrIsIUw349b9d3i6RZgGN3SdOja3E5H0GGlsBkyu
 ZKHsOX14gAswAZlSzMqqx3tDYqpoJCG1SuITzgLhX8qIYEKlY75cz17dlSt1h9rYf5Fj
 +AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hIGTA3O92tKzZmj48Bt5cff3kfhjrrVO2XocxUD/QaY=;
 b=qEoMD+UCXM93ormZuCL9OTOBk/dFbeSbg9WBdgdOZ8zCOTdxXQk0hwSsTESHRg7MS/
 2JZB3fAZ7pAaF7+b53vHL2blrXRDoHOHEkQV0V6eyTHDnnX6vWQuynU171zdzKV78p2K
 KqkzI8DR0+NHq8lHxzd1sEy8/SWDeSAg1KuHZmUrJLzZG+/S/j1gIYJCboZK9BVoqJKC
 d0SZtLTzZ3qJ3couPVKFU779ur9OjzqtNVmNIradqUgwycnO57Q9gR65NJA7HAAbIx/l
 xn6MnuztPduXFqDFMh0fQDLNnJlBTcmFaGv+9LoMP5MsO/O1mvlVgYLR26UM7iWhufrp
 Ybkg==
X-Gm-Message-State: AOAM531dybXIjOLOSrC+5ih4vpuCtNf/K1XHp0a9qfgs5OY4pXhlDmGO
 gmgFRctjUdZMmcTgvUGzlXTwN8k2/Zb8c3Dok8s=
X-Google-Smtp-Source: ABdhPJyzLILnOgCsO6ON3yz2qeuqwSDYArDBLbm7N+d4I2JjOKZvYbDF0XhQI6Ex9ZK5+pD8yRFL/PLy3eA6lPQBWbE=
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr5099678ejw.92.1630685055533; 
 Fri, 03 Sep 2021 09:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210901131624.46171-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20210901131624.46171-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 3 Sep 2021 20:04:03 +0400
Message-ID: <CAJ+F1CLcSZ_zE8oMZz3k_WCSOvf50hapGCu-dfSd9RxzzVhumA@mail.gmail.com>
Subject: Re: [PATCH v3] qemu-sockets: fix unix socket path copy (again)
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: multipart/alternative; boundary="00000000000079c92105cb197323"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000079c92105cb197323
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 1, 2021 at 5:22 PM Michael Tokarev <mjt@tls.msk.ru> wrote:

> Commit 4cfd970ec188558daa6214f26203fe553fb1e01f added an
> assert which ensures the path within an address of a unix
> socket returned from the kernel is at least one byte and
> does not exceed sun_path buffer. Both of this constraints
> are wrong:
>
> A unix socket can be unnamed, in this case the path is
> completely empty (not even \0)
>
> And some implementations (notable linux) can add extra
> trailing byte (\0) _after_ the sun_path buffer if we
> passed buffer larger than it (and we do).
>
> So remove the assertion (since it causes real-life breakage)
> but at the same time fix the usage of sun_path. Namely,
> we should not access sun_path[0] if kernel did not return
> it at all (this is the case for unnamed sockets),
> and use the returned salen when copyig actual path as an
> upper constraint for the amount of bytes to copy - this
> will ensure we wont exceed the information provided by
> the kernel, regardless whenever there is a trailing \0
> or not. This also helps with unnamed sockets.
>
> Note the case of abstract socket, the sun_path is actually
> a blob and can contain \0 characters, - it should not be
> passed to g_strndup and the like, it should be accessed by
> memcpy-like functions.
>
> Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f
> Fixes: http://bugs.debian.org/993145
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> CC: qemu-stable@nongnu.org


Daniel or Michael, or someone else queued this already?

thanks


> ---
>  util/qemu-sockets.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index f2f3676d1f..c5043999e9 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1345,25 +1345,22 @@ socket_sockaddr_to_address_unix(struct
> sockaddr_storage *sa,
>      SocketAddress *addr;
>      struct sockaddr_un *su =3D (struct sockaddr_un *)sa;
>
> -    assert(salen >=3D sizeof(su->sun_family) + 1 &&
> -           salen <=3D sizeof(struct sockaddr_un));
> -
>      addr =3D g_new0(SocketAddress, 1);
>      addr->type =3D SOCKET_ADDRESS_TYPE_UNIX;
> +    salen -=3D offsetof(struct sockaddr_un, sun_path);
>  #ifdef CONFIG_LINUX
> -    if (!su->sun_path[0]) {
> +    if (salen > 0 && !su->sun_path[0]) {
>          /* Linux abstract socket */
> -        addr->u.q_unix.path =3D g_strndup(su->sun_path + 1,
> -                                        salen - sizeof(su->sun_family) -
> 1);
> +        addr->u.q_unix.path =3D g_strndup(su->sun_path + 1, salen - 1);
>          addr->u.q_unix.has_abstract =3D true;
>          addr->u.q_unix.abstract =3D true;
>          addr->u.q_unix.has_tight =3D true;
> -        addr->u.q_unix.tight =3D salen < sizeof(*su);
> +        addr->u.q_unix.tight =3D salen < sizeof(su->sun_path);
>          return addr;
>      }
>  #endif
>
> -    addr->u.q_unix.path =3D g_strndup(su->sun_path, sizeof(su->sun_path)=
);
> +    addr->u.q_unix.path =3D g_strndup(su->sun_path, salen);
>      return addr;
>  }
>  #endif /* WIN32 */
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000079c92105cb197323
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 1, 2021 at 5:22 PM Mich=
ael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tls.msk.ru</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Commit 4cfd=
970ec188558daa6214f26203fe553fb1e01f added an<br>
assert which ensures the path within an address of a unix<br>
socket returned from the kernel is at least one byte and<br>
does not exceed sun_path buffer. Both of this constraints<br>
are wrong:<br>
<br>
A unix socket can be unnamed, in this case the path is<br>
completely empty (not even \0)<br>
<br>
And some implementations (notable linux) can add extra<br>
trailing byte (\0) _after_ the sun_path buffer if we<br>
passed buffer larger than it (and we do).<br>
<br>
So remove the assertion (since it causes real-life breakage)<br>
but at the same time fix the usage of sun_path. Namely,<br>
we should not access sun_path[0] if kernel did not return<br>
it at all (this is the case for unnamed sockets),<br>
and use the returned salen when copyig actual path as an<br>
upper constraint for the amount of bytes to copy - this<br>
will ensure we wont exceed the information provided by<br>
the kernel, regardless whenever there is a trailing \0<br>
or not. This also helps with unnamed sockets.<br>
<br>
Note the case of abstract socket, the sun_path is actually<br>
a blob and can contain \0 characters, - it should not be<br>
passed to g_strndup and the like, it should be accessed by<br>
memcpy-like functions.<br>
<br>
Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f<br>
Fixes: <a href=3D"http://bugs.debian.org/993145" rel=3D"noreferrer" target=
=3D"_blank">http://bugs.debian.org/993145</a><br>
Signed-off-by: Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru" target=
=3D"_blank">mjt@tls.msk.ru</a>&gt;<br>
CC: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-stable=
@nongnu.org</a></blockquote><div><br></div><div>Daniel or Michael, or someo=
ne else queued this already?</div><div><br></div><div>thanks</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
---<br>
=C2=A0util/qemu-sockets.c | 13 +++++--------<br>
=C2=A01 file changed, 5 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index f2f3676d1f..c5043999e9 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -1345,25 +1345,22 @@ socket_sockaddr_to_address_unix(struct sockaddr_sto=
rage *sa,<br>
=C2=A0 =C2=A0 =C2=A0SocketAddress *addr;<br>
=C2=A0 =C2=A0 =C2=A0struct sockaddr_un *su =3D (struct sockaddr_un *)sa;<br=
>
<br>
-=C2=A0 =C2=A0 assert(salen &gt;=3D sizeof(su-&gt;sun_family) + 1 &amp;&amp=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0salen &lt;=3D sizeof(struct socka=
ddr_un));<br>
-<br>
=C2=A0 =C2=A0 =C2=A0addr =3D g_new0(SocketAddress, 1);<br>
=C2=A0 =C2=A0 =C2=A0addr-&gt;type =3D SOCKET_ADDRESS_TYPE_UNIX;<br>
+=C2=A0 =C2=A0 salen -=3D offsetof(struct sockaddr_un, sun_path);<br>
=C2=A0#ifdef CONFIG_LINUX<br>
-=C2=A0 =C2=A0 if (!su-&gt;sun_path[0]) {<br>
+=C2=A0 =C2=A0 if (salen &gt; 0 &amp;&amp; !su-&gt;sun_path[0]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux abstract socket */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.path =3D g_strndup(su-&gt;su=
n_path + 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 salen - =
sizeof(su-&gt;sun_family) - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.path =3D g_strndup(su-&gt;su=
n_path + 1, salen - 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.q_unix.has_abstract =3D true;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.q_unix.abstract =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.q_unix.has_tight =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.tight =3D salen &lt; sizeof(=
*su);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.tight =3D salen &lt; sizeof(=
su-&gt;sun_path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return addr;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 addr-&gt;u.q_unix.path =3D g_strndup(su-&gt;sun_path, sizeof=
(su-&gt;sun_path));<br>
+=C2=A0 =C2=A0 addr-&gt;u.q_unix.path =3D g_strndup(su-&gt;sun_path, salen)=
;<br>
=C2=A0 =C2=A0 =C2=A0return addr;<br>
=C2=A0}<br>
=C2=A0#endif /* WIN32 */<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000079c92105cb197323--

