Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C443E1A92
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 19:40:56 +0200 (CEST)
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBhMV-0006AZ-86
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 13:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBhL8-0005EG-9B
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBhL6-0004R9-Lh
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628185167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwXAE/Ez9pco/JV/8noPXxONFwAOTfNxU626tqBhXgU=;
 b=azMmeugZ7yQkZNJHkOM70u3tsQ9muNT8Ln90hUTGHeMQ6/Nlsg3WzKoAOoSjyFaD3eAl/v
 C9t+Sbj1j4vatMv2dWuaxna8C8J80VoznWLRmkOYCAhuYCKJndplfmPfMyRqnBhfzWZzlD
 ZY8H9NTgsdVR6wIfVs4IXMceNGNv5/Q=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-g3jOTSyhOOme25Oo-_2gJA-1; Thu, 05 Aug 2021 13:39:25 -0400
X-MC-Unique: g3jOTSyhOOme25Oo-_2gJA-1
Received: by mail-oi1-f198.google.com with SMTP id
 z13-20020a056808064db029025cce343487so3067177oih.2
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 10:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RwXAE/Ez9pco/JV/8noPXxONFwAOTfNxU626tqBhXgU=;
 b=a9LSUiosVLG2pAu1ea40viIiiNysE/Vwfnz4wMvMRSUYqJqr5UXhSAuMKbvpou/6fy
 mOuMzjHHydAw47rACog/LnwnMv3UHvR3S2CmYyPjB7NUim+Th/b2rttGFu3lqletY6gR
 h6gBXGNk2qip3uDcORUwcpoHaN5t+3TLsBNJHVRS7MPRtT4iSD+OK0pJPAiFC3P+kJIf
 uLfPcVx57s2woU78UQk7OMjQz1cMw0iKhPmB/jHYCSVFndHJbPXPkHYiyV2GekOfddms
 qGTKIaBPI7AQvyyjvy895vxDhcig8jFUvyK1Wj/lMZIoLG+iCCT0SKlGYlsHJXK5saQ/
 qcsA==
X-Gm-Message-State: AOAM531x+1ugHP8WdEjsMtN9AxN/8vV+lw8+LYjYf7qiBwYQwR/y2qWX
 nDwfMErNm32uB3O1aNAkTDyeEM4Q4fFxPQ8NYoAVuL7YYflJE1EsYXJLjn0xHaY6yavF6lnNSpg
 dnH+sExMD41zDMCnz5on9cpd/Hq10JvI=
X-Received: by 2002:a54:489a:: with SMTP id r26mr4565911oic.168.1628185165358; 
 Thu, 05 Aug 2021 10:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/qlVY4lrxr/n2m1SBIPJd1XJ8iH5WDNHKSrDpC0G4Q/ETi4VCdp5MzkyKWKm7HetzRO7P2nm1qxcUmLtRuqE=
X-Received: by 2002:a54:489a:: with SMTP id r26mr4565896oic.168.1628185165192; 
 Thu, 05 Aug 2021 10:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-3-niteesh.gs@gmail.com>
In-Reply-To: <20210730201846.5147-3-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 Aug 2021 13:39:14 -0400
Message-ID: <CAFn=p-YEQyg23j+N2zu0MC3AyBw7Z-zJsPOZq4VYdfEh7+3DZw@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] python: disable pylint errors for aqmp-tui
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000666e0305c8d366fb"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000666e0305c8d366fb
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Disable missing-docstring and fixme pylint warnings.
> This is because since the AQMP is just a prototype
> it is currently not documented properly and lot
> of todo and fixme's are still in place.
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
> ---
>  python/setup.cfg | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 2573cd7bfb..7a30dd5b09 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -90,6 +90,8 @@ ignore_missing_imports = True
>  # --disable=W".
>  disable=too-many-function-args,  # mypy handles this with less false
> positives.
>          no-member,  # mypy also handles this better.
> +        missing-docstring, # FIXME
> +        fixme, # FIXME
>
>
Please put some attention into removing the missing-docstring flag. At this
point, anything that is "FIXME" should either be fixed or re-worded as a
"TODO" and an exemption added to the pylint configuration such that "TODO"
is allowed but "FIXME" is not.

Take a look at pylint --generate-rcfile and find this section:

[MISCELLANEOUS]

# List of note tags to take in consideration, separated by a comma.
notes=FIXME,
      XXX,
      TODO


>  [pylint.basic]
>  # Good variable names which should always be accepted, separated by a
> comma.
> --
> 2.17.1
>
>

--000000000000666e0305c8d366fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S N=
iteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Disable missing-docstring and fixme pylint warnings.<br>
This is because since the AQMP is just a prototype<br>
it is currently not documented properly and lot<br>
of todo and fixme&#39;s are still in place.<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/setup.cfg | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/python/setup.cfg b/python/setup.cfg<br>
index 2573cd7bfb..7a30dd5b09 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -90,6 +90,8 @@ ignore_missing_imports =3D True<br>
=C2=A0# --disable=3DW&quot;.<br>
=C2=A0disable=3Dtoo-many-function-args,=C2=A0 # mypy handles this with less=
 false positives.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no-member,=C2=A0 # mypy also handles this=
 better.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 missing-docstring, # FIXME<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fixme, # FIXME<br>
<br></blockquote><div><br></div><div>Please put some attention into removin=
g the missing-docstring flag. At this point, anything that is &quot;FIXME&q=
uot; should either be fixed or re-worded as a &quot;TODO&quot; and an exemp=
tion added to the pylint configuration such that &quot;TODO&quot; is allowe=
d but &quot;FIXME&quot; is not.</div><div><br></div><div>Take a look at pyl=
int --generate-rcfile and find this section:<br></div><div><br></div><div>[=
MISCELLANEOUS]<br><br># List of note tags to take in consideration, separat=
ed by a comma.<br>notes=3DFIXME,<br>=C2=A0 =C2=A0 =C2=A0 XXX,<br>=C2=A0 =C2=
=A0 =C2=A0 TODO<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
=C2=A0[pylint.basic]<br>
=C2=A0# Good variable names which should always be accepted, separated by a=
 comma.<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--000000000000666e0305c8d366fb--


