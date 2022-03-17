Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E927C4DC958
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:56:49 +0100 (CET)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrYX-0004gk-20
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:56:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUrTm-0007tW-Sn
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:51:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUrTe-0004Ri-AO
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647528705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7b69nDuFHEtvu9KVt18YzRsZHU/PujfeUHRRCjuyb7U=;
 b=IX397jYlOtcmwOk5FV0iYPljg85A4Kmv/OK5wTC7n1Ob9qZmwBeKEzBwbpALAdgza/LbOw
 8KZMimswPGADHHokPjDuekWPpCVANcpQWv+fCvyX5+cblCmNH4+ACmgII/Tm+IhJlb8gw9
 SFcb4HFZuv6hxZ4dtJDQWUzYUb9xRDE=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-DQZ3L5vaNwe8Sxu3admMuA-1; Thu, 17 Mar 2022 10:51:41 -0400
X-MC-Unique: DQZ3L5vaNwe8Sxu3admMuA-1
Received: by mail-vs1-f71.google.com with SMTP id
 y10-20020a67c98a000000b00322deefc0d2so454476vsk.0
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 07:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7b69nDuFHEtvu9KVt18YzRsZHU/PujfeUHRRCjuyb7U=;
 b=vtAgDsTUBtQ0oy7wCO5nhhaQsGYaLnphoDsMDZqpiji97rgxZVMiTCwgLHa3XmC5oN
 v8D+tpkhK9Lxw+3FeTKizjPbD92TgR/OtQ6nmk03eUaTpoVob6ZeHVLIW/5I9HhTDZRN
 dFPyYP0/M311e1czRlMmQ7q1DUAjgk/igJJrn0SWp/QlNHSygDSj1dtNeNn+AYMqv0zW
 JBTpZSw3W3ypLe2jwAcrOIiFD1SqY3N61dDlQ6ivSFDKKWs8dKOOubJ1KvRMfwqUU2KP
 LUDwA8MArrKFrRGvZVPpG1QXAW43vgTEWCaShhKVTzlVAgZTmojeeTJ877wBZtJ2yo1o
 2iZw==
X-Gm-Message-State: AOAM532lTjerKo/+G61ENtkVK+i+qDlpCBz5/bB3eI4cSt2Jff0MYfLk
 hWufQhBQXBoncAuIsrhCggMwuNNhOvx6owb3+B9Lz/YC5WV3OM7oyA/P2GjEHLkPphCFxwwJBK0
 Cd+CVaHsE+vJyI+F817FFgjF47wpudpk=
X-Received: by 2002:a67:e8d5:0:b0:320:b8d1:cfa2 with SMTP id
 y21-20020a67e8d5000000b00320b8d1cfa2mr2027122vsn.61.1647528701039; 
 Thu, 17 Mar 2022 07:51:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRnUiA5SDrOO1WyEdzOvpG/odWL72++tSkAL7OglAk4k7sq1yJhnnQVO3y8I+pQfUR9P5zM0dMYziwKlu4LBo=
X-Received: by 2002:a67:e8d5:0:b0:320:b8d1:cfa2 with SMTP id
 y21-20020a67e8d5000000b00320b8d1cfa2mr2027108vsn.61.1647528700698; Thu, 17
 Mar 2022 07:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-4-jsnow@redhat.com>
 <8df888e9-ff8e-507a-a36a-dfe798853a4a@redhat.com>
In-Reply-To: <8df888e9-ff8e-507a-a36a-dfe798853a4a@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 10:51:31 -0400
Message-ID: <CAFn=p-Y5_iFs92baOVn3oCApAoGS-EM0=asZhB+WAG8ZZ39ZAw@mail.gmail.com>
Subject: Re: [PATCH 03/14] iotests: add qemu_img_info()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f67e4a05da6b2a01"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f67e4a05da6b2a01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022, 7:09 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 09.03.22 04:53, John Snow wrote:
> > Add qemu_img_info() by analogy with qemu_img_measure() and
> > qemu_img_check(). Modify image_size() to use this function instead to
> > take advantage of the better diagnostic information on failure provided
> > (ultimately) by qemu_img().
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/065        |  5 ++---
> >   tests/qemu-iotests/242        |  5 ++---
> >   tests/qemu-iotests/iotests.py | 15 +++++++++++----
> >   3 files changed, 15 insertions(+), 10 deletions(-)
>
> [...]
>
> > diff --git a/tests/qemu-iotests/iotests.py
> b/tests/qemu-iotests/iotests.py
> > index 7b37938d45..62f82281a9 100644
> > --- a/tests/qemu-iotests/iotests.py
> > +++ b/tests/qemu-iotests/iotests.py
>
> [...]
>
> > @@ -570,10 +573,14 @@ def create_image(name, size):
> >               file.write(sector)
> >               i =3D i + 512
> >
> > -def image_size(img):
> > -    '''Return image's virtual size'''
> > -    r =3D qemu_img_pipe('info', '--output=3Djson', '-f', imgfmt, img)
> > -    return json.loads(r)['virtual-size']
> > +def image_size(img: str) -> int:
> > +    """Return image's virtual size"""
> > +    value =3D qemu_img_info('-f', imgfmt, img)['virtual-size']
> > +    if not isinstance(value, int):
> > +        type_name =3D type(value).__name__
> > +        raise TypeError("Expected 'int' for 'virtual-size', "
> > +                        f"got '{value}' of type '{type_name}'")
> > +    return value
>
> Bit overkill for my taste for the scope of iotests.py, but if you want
> to go the extra mile, I=E2=80=99m not stopping you.
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>

As long as it isn't *too* overkill. Tests should be simple and stupid, but
the helper utilities should be *solid*.

I added a type hint but needed to make it true. I could have used an
assert, but asserts should not be used in library code for sanitizing input
data.

(I've got "Trying to make a public PyPI package" brain and it's hard to
switch off. Maybe an assert would've been fine, ...)

--js

>

--000000000000f67e4a05da6b2a01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 17, 2022, 7:09 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 09.03.22 04:53, John Snow wrote:<br>
&gt; Add qemu_img_info() by analogy with qemu_img_measure() and<br>
&gt; qemu_img_check(). Modify image_size() to use this function instead to<=
br>
&gt; take advantage of the better diagnostic information on failure provide=
d<br>
&gt; (ultimately) by qemu_img().<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/065=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
5 ++---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/242=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
5 ++---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/iotests.py | 15 +++++++++++----<br>
&gt;=C2=A0 =C2=A03 files changed, 15 insertions(+), 10 deletions(-)<br>
<br>
[...]<br>
<br>
&gt; diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotest=
s.py<br>
&gt; index 7b37938d45..62f82281a9 100644<br>
&gt; --- a/tests/qemu-iotests/iotests.py<br>
&gt; +++ b/tests/qemu-iotests/iotests.py<br>
<br>
[...]<br>
<br>
&gt; @@ -570,10 +573,14 @@ def create_image(name, size):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file.write(secto=
r)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D i + 512<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt; -def image_size(img):<br>
&gt; -=C2=A0 =C2=A0 &#39;&#39;&#39;Return image&#39;s virtual size&#39;&#39=
;&#39;<br>
&gt; -=C2=A0 =C2=A0 r =3D qemu_img_pipe(&#39;info&#39;, &#39;--output=3Djso=
n&#39;, &#39;-f&#39;, imgfmt, img)<br>
&gt; -=C2=A0 =C2=A0 return json.loads(r)[&#39;virtual-size&#39;]<br>
&gt; +def image_size(img: str) -&gt; int:<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Return image&#39;s virtual size&quot;=
&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 value =3D qemu_img_info(&#39;-f&#39;, imgfmt, img)[&#39=
;virtual-size&#39;]<br>
&gt; +=C2=A0 =C2=A0 if not isinstance(value, int):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 type_name =3D type(value).__name__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise TypeError(&quot;Expected &#39;int&#=
39; for &#39;virtual-size&#39;, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 f&quot;got &#39;{value}&#39; of type &#39;{type_name}&#39;&q=
uot;)<br>
&gt; +=C2=A0 =C2=A0 return value<br>
<br>
Bit overkill for my taste for the scope of iotests.py, but if you want <br>
to go the extra mile, I=E2=80=99m not stopping you.<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">hreitz@redhat.com</a>&gt;<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">As long as it isn&#39;=
t *too* overkill. Tests should be simple and stupid, but the helper utiliti=
es should be *solid*.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I =
added a type hint but needed to make it true. I could have used an assert, =
but asserts should not be used in library code for sanitizing input data.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">(I&#39;ve got &quot;Tryin=
g to make a public PyPI package&quot; brain and it&#39;s hard to switch off=
. Maybe an assert would&#39;ve been fine, ...)</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">--js</div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"></blockquote></div></div></div>

--000000000000f67e4a05da6b2a01--


