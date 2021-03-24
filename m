Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EC03473F2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:51:33 +0100 (CET)
Received: from localhost ([::1]:49938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOzEi-0004kG-7C
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lOzCK-0003QK-0w
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lOzCG-0007zX-2C
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616575739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MSgB3q3vNVnRMKpx3WbskB6Amhx4j04vWWLNV3vMFGQ=;
 b=BeQHNx/3ZWi14z2t8IrjYa0Y7tEh+GIp/6llHTmEdaScsZcTVpM7EJnf1noZmRvJvMkBC6
 ZgzsLqgBxHosRZP7sghw6k4ixSR7Neh6sMJ4CRuVqYflx7Mcz2EoUEgQjg6ZJI+Ii4nmtv
 qI1uRAsnyHIP6cLFvxHRVIvWCIKvZkE=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-fwALh1MZPYuoKnskdAzL7Q-1; Wed, 24 Mar 2021 04:48:54 -0400
X-MC-Unique: fwALh1MZPYuoKnskdAzL7Q-1
Received: by mail-il1-f197.google.com with SMTP id x11so1061314ilu.14
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 01:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MSgB3q3vNVnRMKpx3WbskB6Amhx4j04vWWLNV3vMFGQ=;
 b=uH9PWjKrZyhxt272AW4y2c57vbTTv/AOPoMKeP6W5nK605ch+EG7YC60wGY8PlWrVi
 Ttzomw0DewUCiEp/PJ9+TxXAThHNsefNUzdKQOz/x5Qv+GjwgMKt6N8sZenuSFxZ8Zbp
 85e0toWbZ01ggCaZZcaSG0iH5cU1rIRRD4aFQR2QBlbkBSoiMj3djOcjUix82AS68GoX
 ilfMIi2ailzM5rYpPpKciHSc+uT7K20+6IJt3dQiZknCGY+Z5NjpkzjP5yFpY7gauICX
 FqsBqVjtflx+VzqlQk+8Ah4mZ0l3ODlaCDc+LP2UsPZf8RebVgJB0gU8iaSj9rfpDVD0
 Sfxg==
X-Gm-Message-State: AOAM531F0tAgHqDqIkxN5F7nW7KPx78eXvnkyUw7Ceun65TF86PI2EyS
 aDrVP1Fcw8ZwLCQ2HNSfkeswYz3N8LHAhyi+wFZ550EOvHDHsXAGydzhD6xIzfz4bThnSzwO6vb
 +79KzcNurzT2wJHlQH4ZqQcvquWIltKY=
X-Received: by 2002:a05:6e02:2161:: with SMTP id
 s1mr1767771ilv.161.1616575733979; 
 Wed, 24 Mar 2021 01:48:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwGccsbsipNs01QoKZGmpkthGBXMHtR4kLMqZ8S3KgBi6gVgIubRmX8GbHo+5MH4HDYGnazaM5qU4qZBNdKpU=
X-Received: by 2002:a05:6e02:2161:: with SMTP id
 s1mr1767758ilv.161.1616575733726; 
 Wed, 24 Mar 2021 01:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210324084130.3986072-1-armbru@redhat.com>
In-Reply-To: <20210324084130.3986072-1-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 24 Mar 2021 12:48:42 +0400
Message-ID: <CAMxuvaw9nLYYG=bwzX8rJUQPpML+a-MnobBTi3xkF=-+rC7fQQ@mail.gmail.com>
Subject: Re: [PATCH] qom: Fix default values in help
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005c9e2305be445e43"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Bonzini,
 Paolo" <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005c9e2305be445e43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 12:41 PM Markus Armbruster <armbru@redhat.com>
wrote:

> Output of default values in device help is broken:
>
>     $ ./qemu-system-x86_64 -S -display none -monitor stdio
>     QEMU 5.2.50 monitor - type 'help' for more information
>     (qemu) device_add pvpanic,help
>     pvpanic options:
>       events=3D<uint8>         -  (default: (null))
>       ioport=3D<uint16>        -  (default: (null))
>       pvpanic[0]=3D<child<qemu:memory-region>>
>
> The "(null)" is glibc printing a null pointer.  Other systems crash
> instead.  Having a help request crash a running VM can really spoil
> your day.
>
> Root cause is a botched replacement of qstring_free() by
> g_string_free(): to get the string back, we need to pass true to the
> former, but false to the latter.  Fix the argument.
>
> Fixes: eab3a4678b07267c39e7290a6e9e7690b1d2a521
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  qom/object_interfaces.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index c3324b0f86..bd8a947a63 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -159,7 +159,7 @@ char *object_property_help(const char *name, const
> char *type,
>      }
>      if (defval) {
>          g_autofree char *def_json =3D g_string_free(qobject_to_json(defv=
al),
> -                                                  true);
> +                                                  false);
>          g_string_append_printf(str, " (default: %s)", def_json);
>      }
>
> --
> 2.26.3
>
>

--0000000000005c9e2305be445e43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 12:41 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Out=
put of default values in device help is broken:<br>
<br>
=C2=A0 =C2=A0 $ ./qemu-system-x86_64 -S -display none -monitor stdio<br>
=C2=A0 =C2=A0 QEMU 5.2.50 monitor - type &#39;help&#39; for more informatio=
n<br>
=C2=A0 =C2=A0 (qemu) device_add pvpanic,help<br>
=C2=A0 =C2=A0 pvpanic options:<br>
=C2=A0 =C2=A0 =C2=A0 events=3D&lt;uint8&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-=C2=A0 (default: (null))<br>
=C2=A0 =C2=A0 =C2=A0 ioport=3D&lt;uint16&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
=C2=A0 (default: (null))<br>
=C2=A0 =C2=A0 =C2=A0 pvpanic[0]=3D&lt;child&lt;qemu:memory-region&gt;&gt;<b=
r>
<br>
The &quot;(null)&quot; is glibc printing a null pointer.=C2=A0 Other system=
s crash<br>
instead.=C2=A0 Having a help request crash a running VM can really spoil<br=
>
your day.<br>
<br>
Root cause is a botched replacement of qstring_free() by<br>
g_string_free(): to get the string back, we need to pass true to the<br>
former, but false to the latter.=C2=A0 Fix the argument.<br>
<br>
Fixes: eab3a4678b07267c39e7290a6e9e7690b1d2a521<br>
Reported-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"=
_blank">thuth@redhat.com</a>&gt;<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qom/object_interfaces.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c<br>
index c3324b0f86..bd8a947a63 100644<br>
--- a/qom/object_interfaces.c<br>
+++ b/qom/object_interfaces.c<br>
@@ -159,7 +159,7 @@ char *object_property_help(const char *name, const char=
 *type,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (defval) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_autofree char *def_json =3D g_string_fr=
ee(qobject_to_json(defval),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 false);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_string_append_printf(str, &quot; (defau=
lt: %s)&quot;, def_json);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.26.3<br>
<br>
</blockquote></div></div>

--0000000000005c9e2305be445e43--


