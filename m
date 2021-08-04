Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2BF3E0729
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:06:43 +0200 (CEST)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLHu-0000CX-4H
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBJb4-0004SJ-00
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBJan-0006tu-TU
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628093876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dHcj71k7Ng8+HRI7S+50vRSgPLdtMqRxdHSl5n21Yn0=;
 b=TXA1DhLioukG89V40ELe2mqNf0Lf/mreZY6MHwp9SfCcGI4hAW4ApXTKFGp5h3+UgoomIS
 fQcTRGji4LFq7+XJkbaJjYFH0jZXfDc+41D2kZ1OCPg+8k77QWU/mZ1/6K/Ytul1nHRhrw
 YqBeKoNYRRaQXvkp6J7d/UxVJHpqwSk=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-ZtS9tP4HOGmlf6JpeGUMeA-1; Wed, 04 Aug 2021 12:17:52 -0400
X-MC-Unique: ZtS9tP4HOGmlf6JpeGUMeA-1
Received: by mail-ot1-f71.google.com with SMTP id
 z11-20020a056830290bb02904d1d78ee61cso999869otu.3
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 09:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dHcj71k7Ng8+HRI7S+50vRSgPLdtMqRxdHSl5n21Yn0=;
 b=M6VqxTefhjyAaYMypJfv9t7yhHFLmKyHsltnySJqfv5/VvAchrzNwFoE6XzuiRTXoI
 kzxqUDgrVYKlLrYafopsCzWgulx7J35kjsbBOSX7KqlyNnbEvTY0STHIA4C8g8JBwFTW
 4Uk0RusLL5QQnwv8cXfqwTgRhpYXe6B3QSnIW8TgSpz5kJSwNMyYLaTGp0A0/nCrUXWn
 FWWjBNeOSTOABH3YQKacnPHUq7gAw9G962aXAAITrLt7CMZk08nPI3u+dsK+GDn7ZwJj
 dOVYlL6qg+10v9gJu2hKlLWGj7g+E0f0dymVdBp6n9ylX+/4TR+UX1Usn/VGY2/A3RzR
 bx5A==
X-Gm-Message-State: AOAM53328NMG2C0kl3uE1uT41JD7LiodCyRiZ5RcrsDKazUrnfg+m4wp
 ZG8E5kNECnbov0BF3rn+69hw7gS/SDZGuklUYE0Hi+NUCMbM9ib1HIo/reFtsdRqgPYQMZmG2UP
 wHFrjm9A+qHGztcr4OpXdf4IlAb6ygC8=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr407247otr.45.1628093872037; 
 Wed, 04 Aug 2021 09:17:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0Ru1j5JHnMcXaI/UoQEcWTq6pEzL/HK8C/ixxupnEU4CmiK6K4Xel0FVoZjL2DPYUjUg41pUw+6KUeGy0u+s=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr407237otr.45.1628093871843; 
 Wed, 04 Aug 2021 09:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-30-vsementsov@virtuozzo.com>
In-Reply-To: <20210804093813.20688-30-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 4 Aug 2021 12:17:41 -0400
Message-ID: <CAFn=p-aDksPa5rUT3pqm1CdOnMHEtAS-tc10w0qLgqgJiazhaw@mail.gmail.com>
Subject: Re: [PATCH v7 29/33] iotests.py: hmp_qemu_io: support qdev
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e47b8805c8be24be"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e47b8805c8be24be
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 4, 2021 at 5:39 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 025e288ddd..9d0031a0e8 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -655,9 +655,10 @@ def resume_drive(self, drive: str) -> None:
>          self.hmp(f'qemu-io {drive} "remove_break bp_{drive}"')
>
>      def hmp_qemu_io(self, drive: str, cmd: str,
> -                    use_log: bool = False) -> QMPMessage:
> +                    use_log: bool = False, qdev: bool = False) ->
> QMPMessage:
>          """Write to a given drive using an HMP command"""
> -        return self.hmp(f'qemu-io {drive} "{cmd}"', use_log=use_log)
> +        d = '-d ' if qdev else ''
> +        return self.hmp(f'qemu-io {d}{drive} "{cmd}"', use_log=use_log)
>
>      def flatten_qmp_object(self, obj, output=None, basestr=''):
>          if output is None:
> --
> 2.29.2
>
>
Guess that's really the only flag that this HMP command supports. I was
gonna suggest abstracting to {args} ... but, uh, that's the only one, so...
sure!

Reviewed-by: John Snow <jsnow@redhat.com>

--000000000000e47b8805c8be24be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 4, 2021 at 5:39 AM Vladimir S=
ementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsements=
ov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"=
mailto:vsementsov@virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com=
</a>&gt;<br>
Reviewed-by: Max Reitz &lt;<a href=3D"mailto:mreitz@redhat.com" target=3D"_=
blank">mreitz@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/qemu-iotests/iotests.py | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py<=
br>
index 025e288ddd..9d0031a0e8 100644<br>
--- a/tests/qemu-iotests/iotests.py<br>
+++ b/tests/qemu-iotests/iotests.py<br>
@@ -655,9 +655,10 @@ def resume_drive(self, drive: str) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.hmp(f&#39;qemu-io {drive} &quot;remo=
ve_break bp_{drive}&quot;&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def hmp_qemu_io(self, drive: str, cmd: str,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use_=
log: bool =3D False) -&gt; QMPMessage:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use_=
log: bool =3D False, qdev: bool =3D False) -&gt; QMPMessage:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Write to a given drive =
using an HMP command&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.hmp(f&#39;qemu-io {drive} &quot;{c=
md}&quot;&#39;, use_log=3Duse_log)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d =3D &#39;-d &#39; if qdev else &#39;&#39;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.hmp(f&#39;qemu-io {d}{drive} &quot=
;{cmd}&quot;&#39;, use_log=3Duse_log)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def flatten_qmp_object(self, obj, output=3DNone, basest=
r=3D&#39;&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if output is None:<br>
-- <br>
2.29.2<br>
<br></blockquote><div><br></div><div>Guess that&#39;s really the only flag =
that this HMP command supports. I was gonna suggest abstracting to {args} .=
.. but, uh, that&#39;s the only one, so... sure!</div><div><br></div><div>R=
eviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.=
com</a>&gt;<br></div><div><br></div></div></div>

--000000000000e47b8805c8be24be--


