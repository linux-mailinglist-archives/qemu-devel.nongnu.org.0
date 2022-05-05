Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73AC51BBEB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:23:31 +0200 (CEST)
Received: from localhost ([::1]:41218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXhq-0008Ox-3M
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nmWpO-0003k7-QO
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:27:16 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:44447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nmWpM-0001i9-Gt
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651739231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6FjarNmbXQ4XkMo8eyyXTmyuh5gicvD/H8AixHeyUew=;
 b=dqxlro+uocb0QuPFptuFwDitTW0DffnNdKjX9gqMffbZtOFVdCCKInx4ey0TGCNCar85Sp
 CBK+7Y8WnsL2h8pZ8Io7Bj88b+O3luUPxusW1jbh3kopqYbHLjYlc5mYnlpH991Ynv8Ivw
 TZxYmJLab1XUl4A4J3ziT4bnfHgDWYw=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-t9OFrJLYOdewDVJCB-UK0g-1; Thu, 05 May 2022 04:27:09 -0400
X-MC-Unique: t9OFrJLYOdewDVJCB-UK0g-1
Received: by mail-yb1-f199.google.com with SMTP id
 t42-20020a25aaad000000b00649d5b19ee3so3106262ybi.4
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6FjarNmbXQ4XkMo8eyyXTmyuh5gicvD/H8AixHeyUew=;
 b=ql5jthrWQt8q0cAFP2oiH4sZVoH8pRDDrQRVTUxrW0xJb31mP/3nQ0opk1F9hED91Z
 wRcmcha820o/chlgJAG9bOpp/gZv2ldSjGW4w4xDI8iOQXDeah+m3tBDTWatOmynLN7T
 IOa9jxQaRoi+hfqmyW6IoySqXrq9EU6Y31UVwl912INShMKM+GqqXqucu8sic+j3HzYU
 UmX2MOXt0KepCo9ATJR7Q5hVgnZ9XRES+KQ3tLT4qliNd/vreMlSN5GG5XGVV5xv/jC3
 PLNYudWDF8+WpjxDB56DoZayKM9e9XpgZsRyQTrYhBASAWwy2Gk3UPW795xWv5hzJOVw
 ADMQ==
X-Gm-Message-State: AOAM530FbFijLvbf3BdsGf0EbHG2sspSrQNK3GWwYcsnZVIJVVijZEOy
 p6b92D9cYq3LuDOCKDJUJ8tbtc8+tGf2SYisymMRO4YChoSzKuos3x/HrSuH6igmABM6eT2Yq8D
 q4HVIwIejz5V73gyDkcUZosH7t99pcwc=
X-Received: by 2002:a81:9387:0:b0:2f7:eb1b:d25e with SMTP id
 k129-20020a819387000000b002f7eb1bd25emr14923232ywg.402.1651739228782; 
 Thu, 05 May 2022 01:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdvmzeECI+0gd40nlFccPrx2UwJlP7jt0ESDaGNng3UMmr63AjaVTGzUjuN2DVfrw+A37ggjO9UlMvOKZ1zhA=
X-Received: by 2002:a81:9387:0:b0:2f7:eb1b:d25e with SMTP id
 k129-20020a819387000000b002f7eb1bd25emr14923215ywg.402.1651739228610; Thu, 05
 May 2022 01:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-14-marcandre.lureau@redhat.com>
In-Reply-To: <20220505081431.934739-14-marcandre.lureau@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 5 May 2022 11:26:57 +0300
Message-ID: <CAPMcbCq6Z7MgQAERcDyJbj4m5Km=AqJzL-usv96cey1B86RDpA@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] qga/wixl: simplify some pre-processing
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Laurent Vivier <lvivier@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000fbb76305de3f810c"
Received-SPF: pass client-ip=170.10.133.74; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000fbb76305de3f810c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, May 5, 2022 at 11:16 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Sadly, wixl doesn't have 'elif'.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/installer/qemu-ga.wxs | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 651db6e51cda..e5b0958e1898 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -1,21 +1,15 @@
>  <?xml version=3D"1.0" encoding=3D"UTF-8"?>
>  <Wix xmlns=3D"http://schemas.microsoft.com/wix/2006/wi">
> -  <?ifndef var.Arch?>
> -    <?error Define Arch to 32 or 64?>
> -  <?endif?>
> -
>    <?if $(var.Arch) =3D "64"?>
>      <?define ArchLib=3Dlibgcc_s_seh-1.dll?>
>      <?define GaProgramFilesFolder=3D"ProgramFiles64Folder" ?>
> -  <?endif?>
> -
> -  <?if $(var.Arch) =3D "32"?>
> -    <?define ArchLib=3Dlibgcc_s_dw2-1.dll?>
> -    <?define GaProgramFilesFolder=3D"ProgramFilesFolder" ?>
> -  <?endif?>
> -
> -  <?ifndef var.ArchLib ?>
> -    <?error Unexpected Arch value $(var.Arch)?>
> +  <?else?>
> +    <?if $(var.Arch) =3D "32"?>
> +      <?define ArchLib=3Dlibgcc_s_dw2-1.dll?>
> +      <?define GaProgramFilesFolder=3D"ProgramFilesFolder" ?>
> +    <?else?>
> +      <?error Unexpected Arch value $(var.Arch)?>
> +    <?endif?>
>    <?endif?>
>
>    <Product
> --
> 2.36.0.44.g0f828332d5ac
>
>

--000000000000fbb76305de3f810c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5=
, 2022 at 11:16 AM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marca=
ndre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a=
>&gt;<br>
<br>
Sadly, wixl doesn&#39;t have &#39;elif&#39;.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/installer/qemu-ga.wxs | 20 +++++++-------------<br>
=C2=A01 file changed, 7 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs<br>
index 651db6e51cda..e5b0958e1898 100644<br>
--- a/qga/installer/qemu-ga.wxs<br>
+++ b/qga/installer/qemu-ga.wxs<br>
@@ -1,21 +1,15 @@<br>
=C2=A0&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;UTF-8&quot;?&gt;<=
br>
=C2=A0&lt;Wix xmlns=3D&quot;<a href=3D"http://schemas.microsoft.com/wix/200=
6/wi" rel=3D"noreferrer" target=3D"_blank">http://schemas.microsoft.com/wix=
/2006/wi</a>&quot;&gt;<br>
-=C2=A0 &lt;?ifndef var.Arch?&gt;<br>
-=C2=A0 =C2=A0 &lt;?error Define Arch to 32 or 64?&gt;<br>
-=C2=A0 &lt;?endif?&gt;<br>
-<br>
=C2=A0 =C2=A0&lt;?if $(var.Arch) =3D &quot;64&quot;?&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;?define ArchLib=3Dlibgcc_s_seh-1.dll?&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;?define GaProgramFilesFolder=3D&quot;ProgramFiles64=
Folder&quot; ?&gt;<br>
-=C2=A0 &lt;?endif?&gt;<br>
-<br>
-=C2=A0 &lt;?if $(var.Arch) =3D &quot;32&quot;?&gt;<br>
-=C2=A0 =C2=A0 &lt;?define ArchLib=3Dlibgcc_s_dw2-1.dll?&gt;<br>
-=C2=A0 =C2=A0 &lt;?define GaProgramFilesFolder=3D&quot;ProgramFilesFolder&=
quot; ?&gt;<br>
-=C2=A0 &lt;?endif?&gt;<br>
-<br>
-=C2=A0 &lt;?ifndef var.ArchLib ?&gt;<br>
-=C2=A0 =C2=A0 &lt;?error Unexpected Arch value $(var.Arch)?&gt;<br>
+=C2=A0 &lt;?else?&gt;<br>
+=C2=A0 =C2=A0 &lt;?if $(var.Arch) =3D &quot;32&quot;?&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;?define ArchLib=3Dlibgcc_s_dw2-1.dll?&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;?define GaProgramFilesFolder=3D&quot;ProgramFiles=
Folder&quot; ?&gt;<br>
+=C2=A0 =C2=A0 &lt;?else?&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;?error Unexpected Arch value $(var.Arch)?&gt;<br>
+=C2=A0 =C2=A0 &lt;?endif?&gt;<br>
=C2=A0 =C2=A0&lt;?endif?&gt;<br>
<br>
=C2=A0 =C2=A0&lt;Product<br>
-- <br>
2.36.0.44.g0f828332d5ac<br>
<br>
</blockquote></div>

--000000000000fbb76305de3f810c--


