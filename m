Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B027243BC0B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 23:07:26 +0200 (CEST)
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTfH-0005mZ-2E
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 17:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTco-0003tk-NL
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 17:04:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTck-0002iz-Tt
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 17:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635282284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3gtzjNBsp+1vYU2mzSETOT3mg1SLCPnrZu4xT3MfmUE=;
 b=bWt+kg+joCILkNYU3pcZ8RIiguNlRSY4aCFyp3t64aBpJ66oQh2C76DPs2nIOnuujv0iDI
 YU65In3dXhBngvSxaJT/bAuh36xL8cGEQ0FTVnZx7LethqPIcm+NGnRn0uJFkQzXax1Vaa
 5kgM32JM01VEhyIG7TM+HJhAVjgQbcU=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-ucmeQMKlOJyHQQbEz1vDNQ-1; Tue, 26 Oct 2021 17:04:41 -0400
X-MC-Unique: ucmeQMKlOJyHQQbEz1vDNQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 q76-20020a1f5c4f000000b002dc9e9530fbso368679vkb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 14:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3gtzjNBsp+1vYU2mzSETOT3mg1SLCPnrZu4xT3MfmUE=;
 b=TD+nrmqBUBLaIgqEaakP+ZCu1jWzFULzjBJscEkIK65tNE289WbDLNvoQiONMhwL9P
 PDByurp0AYu+2vU4NhUmqzWXFBgEk3yj/a0cl2ADK6OsDvxZLo0v3Dy4eZYooi8CI2ny
 zesXZbCkKTXyaHvHBSic8w96EOc0V76xNjkPYNO/6ibcjfAvPiFH4ABlWnBKULiDVbvP
 9y0hloYzyw0GEj9BPJejfQLnD6JnAmwa0Ytz7nhPBFyJfSUIExxqxqrw58hrNxe6dzow
 Wyl0cwt+zYM+kVYuDUYBfk3Qfd3/RSWMfNvg4R1SmtIhWNR5VAUG+Z5kUgfKaO6ucbZz
 wcFQ==
X-Gm-Message-State: AOAM530XcSF12ZY+k4y1gt2IpLTp7kyftTH0ibH/7HEJtvjvFcEZWu1k
 /Fn6hcZ1/8Zge3+cshqADyswxWYyFVgoIpnc3ROTWiJdqyzJ/Ct92XgUZpwHFXixpF5Ao92Vi/g
 fIz9jwCUVZkX55xT9809fx9GghwODa1E=
X-Received: by 2002:a67:ed07:: with SMTP id l7mr26380082vsp.40.1635282280518; 
 Tue, 26 Oct 2021 14:04:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI7K3Xn4lK7zTkq2qeYudIBvOsC6JBCZjbenPskTTUUzS+pKgQzT2FU1j+uhC/tjZs8l0bktF1VQIWIZPu7L0=
X-Received: by 2002:a67:ed07:: with SMTP id l7mr26380048vsp.40.1635282280307; 
 Tue, 26 Oct 2021 14:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211015105344.152591-1-marcandre.lureau@redhat.com>
 <20211015105344.152591-2-marcandre.lureau@redhat.com>
In-Reply-To: <20211015105344.152591-2-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 17:04:29 -0400
Message-ID: <CAFn=p-by8_BkEqZk6bF6Pj2hPQ79Wdvead_Y_f1ELmfpgFUJ-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] docs/sphinx: add loaded modules to generated
 depfile
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006cefa205cf47d3b6"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006cefa205cf47d3b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 6:57 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
You also fix *when* the deps are generated. Small commit message blurb
would be nice.


> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

Reviewed-by: John Snow <jsnow@redhat.com>


> ---
>  docs/sphinx/depfile.py | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/docs/sphinx/depfile.py b/docs/sphinx/depfile.py
> index 277fdf0f56..b6fb926df1 100644
> --- a/docs/sphinx/depfile.py
> +++ b/docs/sphinx/depfile.py
> @@ -12,6 +12,7 @@
>
>  import os
>  import sphinx
> +import sys
>
>  __version__ =3D '1.0'
>
> @@ -20,8 +21,17 @@ def get_infiles(env):
>          yield env.doc2path(x)
>          yield from ((os.path.join(env.srcdir, dep)
>                      for dep in env.dependencies[x]))
> +    for mod in sys.modules.values():
> +        if hasattr(mod, '__file__'):
> +            if mod.__file__:
> +                yield mod.__file__
>
>
(How annoying that built-in modules aren't a different class and that this
attribute really is just entirely missing sometimes ...)


> -def write_depfile(app, env):
> +
> +def write_depfile(app, exception):
> +    if exception:
> +        return
> +
> +    env =3D app.env
>      if not env.config.depfile:
>          return
>
> @@ -42,7 +52,7 @@ def write_depfile(app, env):
>  def setup(app):
>      app.add_config_value('depfile', None, 'env')
>      app.add_config_value('depfile_stamp', None, 'env')
> -    app.connect('env-updated', write_depfile)
> +    app.connect('build-finished', write_depfile)
>
>      return dict(
>          version =3D __version__,
> --
> 2.33.0.721.g106298f7f9
>
>
>

--0000000000006cefa205cf47d3b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 15, 2021 at 6:57 AM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>You also fix *when* the deps are gener=
ated. Small commit message blurb would be nice.<br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br></bl=
ockquote><div><br></div><div>Reviewed-by: John Snow &lt;<a href=3D"mailto:j=
snow@redhat.com">jsnow@redhat.com</a>&gt;<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0docs/sphinx/depfile.py | 14 ++++++++++++--<br>
=C2=A01 file changed, 12 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/docs/sphinx/depfile.py b/docs/sphinx/depfile.py<br>
index 277fdf0f56..b6fb926df1 100644<br>
--- a/docs/sphinx/depfile.py<br>
+++ b/docs/sphinx/depfile.py<br>
@@ -12,6 +12,7 @@<br>
<br>
=C2=A0import os<br>
=C2=A0import sphinx<br>
+import sys<br>
<br>
=C2=A0__version__ =3D &#39;1.0&#39;<br>
<br>
@@ -20,8 +21,17 @@ def get_infiles(env):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield env.doc2path(x)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield from ((os.path.join(env.srcdir, dep=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for dep in env.dependencies[x]))<br>
+=C2=A0 =C2=A0 for mod in sys.modules.values():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if hasattr(mod, &#39;__file__&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if mod.__file__:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield mod.__file__=
<br>
<br></blockquote><div><br></div><div>(How annoying that built-in modules ar=
en&#39;t a different class and that this attribute really is just entirely =
missing sometimes ...)<br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
-def write_depfile(app, env):<br>
+<br>
+def write_depfile(app, exception):<br>
+=C2=A0 =C2=A0 if exception:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 env =3D app.env<br>
=C2=A0 =C2=A0 =C2=A0if not env.config.depfile:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
@@ -42,7 +52,7 @@ def write_depfile(app, env):<br>
=C2=A0def setup(app):<br>
=C2=A0 =C2=A0 =C2=A0app.add_config_value(&#39;depfile&#39;, None, &#39;env&=
#39;)<br>
=C2=A0 =C2=A0 =C2=A0app.add_config_value(&#39;depfile_stamp&#39;, None, &#3=
9;env&#39;)<br>
-=C2=A0 =C2=A0 app.connect(&#39;env-updated&#39;, write_depfile)<br>
+=C2=A0 =C2=A0 app.connect(&#39;build-finished&#39;, write_depfile)<br>
<br>
=C2=A0 =C2=A0 =C2=A0return dict(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =3D __version__,<br>
-- <br>
2.33.0.721.g106298f7f9<br>
<br>
<br>
</blockquote></div></div>

--0000000000006cefa205cf47d3b6--


