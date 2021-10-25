Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B791439F09
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:12:51 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5Os-0004pn-47
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5Kv-0001Na-2W
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5Ks-0007Ll-VV
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635188922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CH3lVWaVGOZVAsnFBU7YQAe2n1uCm+mqbqmaRGirhTc=;
 b=FCkQ4Xze9xmjZI/7RD3J8phF8crP2YgDSlUiL0jzwIgMbmm2jdQ/SUg/QUhRsD+vqZPxAz
 rxKPBng+bvd553RACH8+ClBxYJ4GZcFkMvWnLO6fH9Ss9nw+18xvDR09rfkdnxCIxlvabL
 lFFSH9wI9/sF4wii3aoRHKqDoChp16k=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-XAOTCYNIONmfQamyfeESXQ-1; Mon, 25 Oct 2021 15:08:40 -0400
X-MC-Unique: XAOTCYNIONmfQamyfeESXQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 j42-20020ab0186a000000b002b0bf3870deso6881344uag.23
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CH3lVWaVGOZVAsnFBU7YQAe2n1uCm+mqbqmaRGirhTc=;
 b=Iq149DcPDC607mq980ya2uxCs/JGg87NrVduw6+W4TvzwbNhEXpyRNUB3hbL0RjOXL
 E6aeOLN2c3b8SuUZ/KImvhS+C9qrBINx3hvDohEU4x0SBleC2z921P3Nam0Ymm7ZIaF5
 kDf8tnVnAw/OFClfM7UCVqNtgPQneNJLWVzqI4bfRinCz49cH4OwhQdMz2M/LDzp95PJ
 OeW0pNr5SF3rcFBq6gVmZ+4wgyxzoi2Tn3P6whMNcmBBq2Kr7ZZBmyrq5ZEZpcoXdWTy
 rmNPZouYZQbKAqvkfWq+LIgsJ1EMx4LNxlNB6aIxvEZI7GwMSgCRQGtJT0zeukVw28Sx
 AYQA==
X-Gm-Message-State: AOAM530fX7i9oRaj6LW37y2FnuTdqim8SDLxna2Hd6zOtAtPClMWmQIl
 CU+Z7s4NHItmGBK9dbT0CnF0PQPZWk7LczCfM2o/ix52MoiUdCmhy+5KtPdTjtEtYUYsIZoRHSg
 +dm4phhkgNrFnAfQ2aodkEmKjuslEFlw=
X-Received: by 2002:a05:6122:2224:: with SMTP id
 bb36mr17172985vkb.23.1635188920232; 
 Mon, 25 Oct 2021 12:08:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/LcAOvXPDxOZSIYV9ByMTYd/GyCWpqEIH5iXfqqAU60uL9uP1f/khAACCwf0XIAdA+1JZ0MEoSqqnIuiojWg=
X-Received: by 2002:a05:6122:2224:: with SMTP id
 bb36mr17172953vkb.23.1635188919993; 
 Mon, 25 Oct 2021 12:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-4-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-4-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Oct 2021 15:08:29 -0400
Message-ID: <CAFn=p-YAfS1esUOFsjgyg51jjMFHSg72jnqfmLW=x1P+BYmNQQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] qapi: Eliminate QCO_NO_OPTIONS for a slight
 simplification
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b7a16d05cf3216b7"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b7a16d05cf3216b7
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster <armbru@redhat.com> wrote:

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/qmp/dispatch.h | 1 -
>  monitor/misc.c              | 3 +--
>  scripts/qapi/commands.py    | 5 +----
>  3 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
> index 075203dc67..0ce88200b9 100644
> --- a/include/qapi/qmp/dispatch.h
> +++ b/include/qapi/qmp/dispatch.h
> @@ -21,7 +21,6 @@ typedef void (QmpCommandFunc)(QDict *, QObject **, Error
> **);
>
>  typedef enum QmpCommandOptions
>  {
> -    QCO_NO_OPTIONS            =  0x0,
>      QCO_NO_SUCCESS_RESP       =  (1U << 0),
>      QCO_ALLOW_OOB             =  (1U << 1),
>      QCO_ALLOW_PRECONFIG       =  (1U << 2),
> diff --git a/monitor/misc.c b/monitor/misc.c
> index ffe7966870..3556b177f6 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -230,8 +230,7 @@ static void monitor_init_qmp_commands(void)
>
>      qmp_init_marshal(&qmp_commands);
>
> -    qmp_register_command(&qmp_commands, "device_add", qmp_device_add,
> -                         QCO_NO_OPTIONS);
> +    qmp_register_command(&qmp_commands, "device_add", qmp_device_add, 0);
>
>      QTAILQ_INIT(&qmp_cap_negotiation_commands);
>      qmp_register_command(&qmp_cap_negotiation_commands,
> "qmp_capabilities",
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 3654825968..c8a975528f 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -229,15 +229,12 @@ def gen_register_command(name: str,
>      if coroutine:
>          options += ['QCO_COROUTINE']
>
> -    if not options:
> -        options = ['QCO_NO_OPTIONS']
> -
>      ret = mcgen('''
>      qmp_register_command(cmds, "%(name)s",
>                           qmp_marshal_%(c_name)s, %(opts)s);
>  ''',
>                  name=name, c_name=c_name(name),
> -                opts=" | ".join(options))
> +                opts=' | '.join(options) or 0)
>      return ret
>
>
>
I'm not a big fan of naked constants on the C side, but the generator
simplification is nice. I suppose it's worth the trade-off if you like it
better this way.

"eh".

Reviewed-by: John Snow <jsnow@redhat.com>

--000000000000b7a16d05cf3216b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 1:25 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" targe=
t=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qapi/qmp/dispatch.h | 1 -<br>
=C2=A0monitor/misc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +-=
-<br>
=C2=A0scripts/qapi/commands.py=C2=A0 =C2=A0 | 5 +----<br>
=C2=A03 files changed, 2 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h<br>
index 075203dc67..0ce88200b9 100644<br>
--- a/include/qapi/qmp/dispatch.h<br>
+++ b/include/qapi/qmp/dispatch.h<br>
@@ -21,7 +21,6 @@ typedef void (QmpCommandFunc)(QDict *, QObject **, Error =
**);<br>
<br>
=C2=A0typedef enum QmpCommandOptions<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 QCO_NO_OPTIONS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
=C2=A0 0x0,<br>
=C2=A0 =C2=A0 =C2=A0QCO_NO_SUCCESS_RESP=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=C2=A0=
 (1U &lt;&lt; 0),<br>
=C2=A0 =C2=A0 =C2=A0QCO_ALLOW_OOB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D=C2=A0 (1U &lt;&lt; 1),<br>
=C2=A0 =C2=A0 =C2=A0QCO_ALLOW_PRECONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=C2=A0=
 (1U &lt;&lt; 2),<br>
diff --git a/monitor/misc.c b/monitor/misc.c<br>
index ffe7966870..3556b177f6 100644<br>
--- a/monitor/misc.c<br>
+++ b/monitor/misc.c<br>
@@ -230,8 +230,7 @@ static void monitor_init_qmp_commands(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qmp_init_marshal(&amp;qmp_commands);<br>
<br>
-=C2=A0 =C2=A0 qmp_register_command(&amp;qmp_commands, &quot;device_add&quo=
t;, qmp_device_add,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0QCO_NO_OPTIONS);<br>
+=C2=A0 =C2=A0 qmp_register_command(&amp;qmp_commands, &quot;device_add&quo=
t;, qmp_device_add, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INIT(&amp;qmp_cap_negotiation_commands);<br>
=C2=A0 =C2=A0 =C2=A0qmp_register_command(&amp;qmp_cap_negotiation_commands,=
 &quot;qmp_capabilities&quot;,<br>
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py<br>
index 3654825968..c8a975528f 100644<br>
--- a/scripts/qapi/commands.py<br>
+++ b/scripts/qapi/commands.py<br>
@@ -229,15 +229,12 @@ def gen_register_command(name: str,<br>
=C2=A0 =C2=A0 =C2=A0if coroutine:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options +=3D [&#39;QCO_COROUTINE&#39;]<br=
>
<br>
-=C2=A0 =C2=A0 if not options:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 options =3D [&#39;QCO_NO_OPTIONS&#39;]<br>
-<br>
=C2=A0 =C2=A0 =C2=A0ret =3D mcgen(&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0qmp_register_command(cmds, &quot;%(name)s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qmp_marshal_%(c_name)s, %(opts)s);<br>
=C2=A0&#39;&#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name=3Dname, =
c_name=3Dc_name(name),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=3D&quot; | &q=
uot;.join(options))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=3D&#39; | &#3=
9;.join(options) or 0)<br>
=C2=A0 =C2=A0 =C2=A0return ret<br>
<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">I&#39;m not a big fan of naked constants on the C side, but the=
 generator simplification is nice. I suppose it&#39;s worth the trade-off i=
f you like it better this way.<br></div><div class=3D"gmail_quote"><br></di=
v><div class=3D"gmail_quote">&quot;eh&quot;.</div><div class=3D"gmail_quote=
"><br></div><div class=3D"gmail_quote">Reviewed-by: John Snow &lt;<a href=
=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</div><div class=3D"gm=
ail_quote"><br></div></div>

--000000000000b7a16d05cf3216b7--


