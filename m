Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206003FDFE0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:28:04 +0200 (CEST)
Received: from localhost ([::1]:57970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLT5n-0008R8-2e
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mLSe9-0002Zs-LY
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:59:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mLSe3-0003wO-Qm
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630511962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C7+ch+2nlnAPcA10EYorC4gxStS1nhYgqF+fw5+rZBQ=;
 b=d0PPotp/gdPxPMRZGoyPjXrZEh9gssIk0KhPgUPjevru/X0F8Ce0kJ2+YBpDIRx1YNcA7r
 V7Dii1ZBA+dgtm0N352t0H3HLvagmXOs6qNTXLYjh/cso9/8IroU0kqeJ4ucWj2Pqyg5sL
 Ie+OW6Eo2F1bPFH4I6PI7Ej/yBAulOs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-Ii0WwQTiOFehbXrzWhJ40Q-1; Wed, 01 Sep 2021 11:59:20 -0400
X-MC-Unique: Ii0WwQTiOFehbXrzWhJ40Q-1
Received: by mail-pl1-f200.google.com with SMTP id
 z3-20020a170902ee0300b00138918cbcceso1090107plb.22
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C7+ch+2nlnAPcA10EYorC4gxStS1nhYgqF+fw5+rZBQ=;
 b=RuK9aH8B8TZvsXbykv3XgPGN61snSDtW3n8h4m4nF8Qz+t0Z4Ubv7eIludNx+3XM6h
 KgvyybM/dfV52M6SR1ATGdYUnhDeLESwiMB8R7jNq1bjVPLnRrCZFr54xv8SV8Qs1KcZ
 pPhlYyz46YQXhS6StdSM18EyFb9C67s74uM3Hp9j/MntUoaykWd5yuEr23wLQ9u2Fwio
 uH1Iohpop32h3Kub4i7wb9XkdfBSLz2Uzu+F2JZyEyHiRKBYX+6L7nkr7T0I2loFJPRV
 7yHshoErp4vELJILLV5sln3EcD7vMxeeh2/oSxqlO3y2NR1QIus3yXUJOYwLNloZAni8
 Uxjw==
X-Gm-Message-State: AOAM533+gHZfhq9WbrNxZTy0NyRIjizbCQWnFRpQx5ouNeGO3WbBE/VM
 /mHvHc2F3wq1l9Mc20EpCpsrsXV1CabqrXbQg3Lenwcrs/Eva12um6htLpb2dgcWKNMsXyhOmQm
 a1HbaBKJzusWpg5NsA6c+LM9zIzQqpWU=
X-Received: by 2002:a17:90a:c798:: with SMTP id
 gn24mr66597pjb.97.1630511959690; 
 Wed, 01 Sep 2021 08:59:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCKtGFUKkMQJRzogzvL3FB6u66FaECBMbDp77QAUOQq5XSP6+53CG9DEBTwJiQPIC0Rm+4MwHjy6ZVMvguZVc=
X-Received: by 2002:a17:90a:c798:: with SMTP id
 gn24mr66574pjb.97.1630511959329; 
 Wed, 01 Sep 2021 08:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210901131624.46171-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20210901131624.46171-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 1 Sep 2021 19:59:08 +0400
Message-ID: <CAMxuvaynd8jKZstXHOQS-xwb8Z7ThhE20bEGgzSMkYWFuTA=Jw@mail.gmail.com>
Subject: Re: [PATCH v3] qemu-sockets: fix unix socket path copy (again)
To: Michael Tokarev <mjt@tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002360cc05caf126f9"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002360cc05caf126f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 1, 2021 at 5:16 PM Michael Tokarev <mjt@tls.msk.ru> wrote:

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
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--0000000000002360cc05caf126f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 1, 2021 at 5:16 PM Michae=
l Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tls.msk.ru</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Commit 4cfd97=
0ec188558daa6214f26203fe553fb1e01f added an<br>
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
@nongnu.org</a><br>
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
<br></blockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &l=
t;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.co=
m</a>&gt; <br></div></div></div>

--0000000000002360cc05caf126f9--


