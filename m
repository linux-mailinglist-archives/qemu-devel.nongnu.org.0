Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1009504838
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 17:43:24 +0200 (CEST)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng73b-0006IC-JX
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 11:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ng71a-0005au-V3
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 11:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ng71X-0002mP-B5
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 11:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650210073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B8I9NevocK+PUHUVKQtOfsb/1OauykLw3C36IDf70sY=;
 b=H11sAJeMApFY+xkJtHCY0evoWYqX2g3EnA92TSqdDAcZ1/gDP5hPRgb9ERqPKzWuHms6AS
 zmE30C8U/XKoZPOcayUAlPiVTJQKnVqGow95cFBJ4tQEZ7i1KwjRk+gu8hZLMT3HswnqsV
 FFYcLkkZNdePXpH2cjiAuG8eAuFpSlo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-YpppjSzPNImVW6xkiLnpqA-1; Sun, 17 Apr 2022 11:41:09 -0400
X-MC-Unique: YpppjSzPNImVW6xkiLnpqA-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-2f18a73fabeso5550167b3.20
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 08:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B8I9NevocK+PUHUVKQtOfsb/1OauykLw3C36IDf70sY=;
 b=SV1cloH1GuSy2lvCwq0HWC+xAdI9rfpKRUnJfYSBUxPKsqlPdwvJsG3RqpLVkBZAHZ
 75xANHbldmimnmnn7jVuXwSnV+nGCe8291hXgBYYjjoVNfa4Ts0AMQjX+IhbqKJzSmdy
 7tamHOMFQig2YkASMamBqsbhpo4fJghnu/8DLjyqGMplGrDMiSlUu+WctvFm5uxPrF7S
 ww+9/Gb/KNInomCgqo3OsWk5fuep17KimrnauwNqwQvnHu+hpbq/Rk3zX+5nSDUe/jfn
 LkBoAabGQmCNDtIzUZ+OwkmUljsAj0zebWPxk5bgTlAk01h8kml2s5Wte1HafLhkDxGP
 W6Ow==
X-Gm-Message-State: AOAM530DCZWX+wX0zV+MysYo7i9jIUJVUxeWQ8s42QywpwFEoZ7QuH6g
 rI9D/als0Ozwv2hNdlrc9zHGRQPa5gdKTq48t/v7D4fgFFTygOQzb5FKzbTEvP+WZGLjqt5kM33
 FG6bBbrN7XZv35z0N7KKX9tC7T97RmPo=
X-Received: by 2002:a05:6902:286:b0:63d:d035:73f4 with SMTP id
 v6-20020a056902028600b0063dd03573f4mr6387447ybh.205.1650210069254; 
 Sun, 17 Apr 2022 08:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW15z70ghHR34qBj88wNGg9MX8VhmMfLEiniDMQ4BtyOo+teXjFL5tuDYU/qaJ3VJYr55LeiXSL0v+wjO0ruE=
X-Received: by 2002:a05:6902:286:b0:63d:d035:73f4 with SMTP id
 v6-20020a056902028600b0063dd03573f4mr6387438ybh.205.1650210069051; Sun, 17
 Apr 2022 08:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <fb9c4633-27af-a01d-3cca-79ed20519727@zapateado.de>
In-Reply-To: <fb9c4633-27af-a01d-3cca-79ed20519727@zapateado.de>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Sun, 17 Apr 2022 18:40:58 +0300
Message-ID: <CAPMcbCpBL+L2LvZ17yuB1raJoPFtcEzccepi_b-ivUqngQ_VgA@mail.gmail.com>
Subject: Re: [PATCH] qga/vss-win32: enable qga-vss.tlb generation with widl
To: Helge Konetzka <hk@zapateado.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f8904d05dcdb788a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f8904d05dcdb788a
Content-Type: text/plain; charset="UTF-8"

Hi Helge,

In general, the patch looks good but I want to make sure
that we will not break other compilation environments.

What version of MSYS2 do you use?
In my case, I can compile GA without this patch.


Best Regards,
Konstantin Kostiuk.


On Sun, Apr 17, 2022 at 5:50 PM Helge Konetzka <hk@zapateado.de> wrote:

> Generation with widl needs to be triggered explicitly and requires
> library and include directories containing referenced *.idl and *.tlb
> as parameters.
>
> Signed-off-by: Helge Konetzka <hk@zapateado.de>
> ---
>
> For tested Msys2 build all referenced resources reside in /<usr>/include.
> Msys2 provides its flavours in different /<usr> bases.
>
> This patch derives the missing include directory path from widl path.
> Assuming the given widl path is /<usr>/bin/widl, it determines /<usr>
> as base and appends /<usr>/include as include and library directories
> to widl command. This way the directory is correct for any Msys2
> flavour.
> It makes sure, only existing directories are appended as parameter.
>
> ---
>   qga/vss-win32/meson.build | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
> index 71c50d0866..51539a582c 100644
> --- a/qga/vss-win32/meson.build
> +++ b/qga/vss-win32/meson.build
> @@ -30,9 +30,16 @@ if midl.found()
>                             input: 'qga-vss.idl',
>                             output: 'qga-vss.tlb',
>                             command: [midl, '@INPUT@', '/tlb', '@OUTPUT@
> '])
> -else
> +elif widl.found()
> +  widl_cmd = [widl, '-t', '@INPUT@', '-o', '@OUTPUT@']
> +  usr_include = fs.parent(fs.parent(widl.full_path()))/'include'
> +  if fs.is_dir(usr_include)
> +    widl_cmd += ['-L', usr_include]
> +    widl_cmd += ['-I', usr_include]
> +  endif
>     gen_tlb = custom_target('gen-tlb',
>                             input: 'qga-vss.idl',
>                             output: 'qga-vss.tlb',
> -                          command: [widl, '-t', '@INPUT@', '-o',
> '@OUTPUT@'])
> +                          build_by_default: true,
> +                          command: widl_cmd)
>   endif
> --
> 2.30.2
>
>

--000000000000f8904d05dcdb788a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Helge,</div><div><br></div><div><div>In general, t=
he patch looks good but I want to make sure <br></div><div>that we will not=
 break other compilation environments.<br></div></div><div><br></div><div>W=
hat version of MSYS2 do you use? <br></div><div>In my case, I can compile G=
A without this patch.</div><br><div><br></div><div><div><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
><div>Best Regards,</div><div>Konstantin Kostiuk.</div></div></div></div><b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Sun, Apr 17, 2022 at 5:50 PM Helge Konetzka &lt;<a href=3D"mailt=
o:hk@zapateado.de">hk@zapateado.de</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Generation with widl needs to be triggere=
d explicitly and requires<br>
library and include directories containing referenced *.idl and *.tlb<br>
as parameters.<br>
<br>
Signed-off-by: Helge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de" target=
=3D"_blank">hk@zapateado.de</a>&gt;<br>
---<br>
<br>
For tested Msys2 build all referenced resources reside in /&lt;usr&gt;/incl=
ude.<br>
Msys2 provides its flavours in different /&lt;usr&gt; bases.<br>
<br>
This patch derives the missing include directory path from widl path.<br>
Assuming the given widl path is /&lt;usr&gt;/bin/widl, it determines /&lt;u=
sr&gt;<br>
as base and appends /&lt;usr&gt;/include as include and library directories=
<br>
to widl command. This way the directory is correct for any Msys2<br>
flavour.<br>
It makes sure, only existing directories are appended as parameter.<br>
<br>
---<br>
=C2=A0 qga/vss-win32/meson.build | 11 +++++++++--<br>
=C2=A0 1 file changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build<br>
index 71c50d0866..51539a582c 100644<br>
--- a/qga/vss-win32/meson.build<br>
+++ b/qga/vss-win32/meson.build<br>
@@ -30,9 +30,16 @@ if midl.found()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 input: &#39;qga-vss.idl&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 output: &#39;qga-vss.tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 command: [midl, &#39;@INPUT@&#39;, &#39;/tlb&#39;,=
 &#39;@OUTPUT@&#39;])<br>
-else<br>
+elif widl.found()<br>
+=C2=A0 widl_cmd =3D [widl, &#39;-t&#39;, &#39;@INPUT@&#39;, &#39;-o&#39;, =
&#39;@OUTPUT@&#39;]<br>
+=C2=A0 usr_include =3D fs.parent(fs.parent(widl.full_path()))/&#39;include=
&#39;<br>
+=C2=A0 if fs.is_dir(usr_include)<br>
+=C2=A0 =C2=A0 widl_cmd +=3D [&#39;-L&#39;, usr_include]<br>
+=C2=A0 =C2=A0 widl_cmd +=3D [&#39;-I&#39;, usr_include]<br>
+=C2=A0 endif<br>
=C2=A0 =C2=A0 gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 input: &#39;qga-vss.idl&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 output: &#39;qga-vss.tlb&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 command: [widl, &#39;-t&#39;, &#39;@INPUT@&#39;, &#39;-o&=
#39;, <br>
&#39;@OUTPUT@&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 build_by_default: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 command: widl_cmd)<br>
=C2=A0 endif<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--000000000000f8904d05dcdb788a--


