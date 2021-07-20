Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D03D012C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:03:47 +0200 (CEST)
Received: from localhost ([::1]:59494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5u5q-00037u-8n
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5u3D-000811-QV
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:01:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5u3B-0006gW-Mj
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626804061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GjgO9h7/1wbMnunvb+/ba+Jd3nF8JxVIGqD6wpiI880=;
 b=VL8yq55keaEWMnTby5MOOWoB2BIvvk4Td/29YHXCWNqmSk/M822q57UgzUSJpJQjdRhhvB
 gXc/MxCF3cC8hI4wLIpxa5G2DtZj1unubf0uTo5hfD8GozvNkgcon9zedUfjPy2JcxT5rO
 8f/mCyIk6fsr5lnxnWiR+ALhMI0iFjs=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-mt3jZcuXObmo89EJQkf5dQ-1; Tue, 20 Jul 2021 14:00:59 -0400
X-MC-Unique: mt3jZcuXObmo89EJQkf5dQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 i11-20020a9d68cb0000b02904d0a18787d4so5036186oto.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GjgO9h7/1wbMnunvb+/ba+Jd3nF8JxVIGqD6wpiI880=;
 b=U7HlVo0n0l+n+laChGjIYheqvTsEudyzj8DWjMmt7ou0QKkLV7idyJpFsqrYOdeEz8
 HYSZqmuq1XH9EUr5euYfll8oCGkuuHL9kQmlx1KGl+S9kUb/dueZQcJtF9kciApc0RTa
 SvxTlceQtykLP7gEwnolX1QIPhUZCrb+jygS7kxF5/esNJj0oTEjlY+5y08P6aOPvPx7
 d6UGJHyBBTw5KVmKcaQxfw1tsE5ZwswDqQt/LnTlZ4LGjFvKkxBspOySrR7c0KKoVZke
 Hxtv7W+iPRRBkN8VMUx5REPjyhZpS1/fSNLZdXwUx5IdPTNPnBcaaGfYl7I+HiSw/Sc/
 1aQw==
X-Gm-Message-State: AOAM533SWDj9CRBFgSMM+O6zZi6GMXGquTTQ1Di3eUbVXCkoiczx2kW3
 FWRhO331G29LbSerX26q01RiZjxSfM6Hh6bpOqm2ckvlu7A4jGT+IUcaNxnOLhKGLtFavyMQHbA
 NDkdKxW352FHwSzG63pGTqeHAt69tR20=
X-Received: by 2002:a4a:8544:: with SMTP id l4mr21647468ooh.5.1626804058482;
 Tue, 20 Jul 2021 11:00:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1GAtfR2gyezYNY0LuyB5regR8LD9I//EQQFB7yPVeUCJziAallwuZ8rTSMaCAIh6saN+pDscQXx0bSLbcywk=
X-Received: by 2002:a4a:8544:: with SMTP id l4mr21647452ooh.5.1626804058321;
 Tue, 20 Jul 2021 11:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210702212603.26465-1-niteesh.gs@gmail.com>
 <20210702212603.26465-2-niteesh.gs@gmail.com>
In-Reply-To: <20210702212603.26465-2-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 20 Jul 2021 14:00:47 -0400
Message-ID: <CAFn=p-b3gOzFtcGCH3amNTyzosMqP2HkYFSiaX04e9yVWhfgBw@mail.gmail.com>
Subject: Re: [PATCH 1/6] python: disable pylint errors for aqmp-tui
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000004070f05c791d65d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000004070f05c791d65d
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 2, 2021 at 5:26 PM G S Niteesh Babu <niteesh.gs@gmail.com>
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
> index bce8807702..1a552d672a 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -89,6 +89,8 @@ ignore_missing_imports = True
>  # no Warning level messages displayed, use "--disable=all --enable=classes
>  # --disable=W".
>  disable=too-many-function-args,  # mypy handles this with less false
> positives.
> +        missing-docstring, # FIXME
> +        fixme, # FIXME
>

You aren't actually using any FIXME statements in this branch right now
that I can see, so you don't need that suppression. It could be removed in
V3.


>
>  [pylint.basic]
>  # Good variable names which should always be accepted, separated by a
> comma.
> --
> 2.17.1
>
>

--00000000000004070f05c791d65d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 2, 2021 at 5:26 PM G S Ni=
teesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Disable missing-docstring and fixme pylint warnings.<br>
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
index bce8807702..1a552d672a 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -89,6 +89,8 @@ ignore_missing_imports =3D True<br>
=C2=A0# no Warning level messages displayed, use &quot;--disable=3Dall --en=
able=3Dclasses<br>
=C2=A0# --disable=3DW&quot;.<br>
=C2=A0disable=3Dtoo-many-function-args,=C2=A0 # mypy handles this with less=
 false positives.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 missing-docstring, # FIXME<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fixme, # FIXME<br></blockquote><div><br></div>=
<div>You aren&#39;t actually using any FIXME statements in this branch righ=
t now that I can see, so you don&#39;t need that suppression. It could be r=
emoved in V3.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
=C2=A0[pylint.basic]<br>
=C2=A0# Good variable names which should always be accepted, separated by a=
 comma.<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--00000000000004070f05c791d65d--


