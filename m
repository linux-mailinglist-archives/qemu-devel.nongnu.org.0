Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D44EB220
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 18:47:16 +0200 (CEST)
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZEzy-0007Sh-Ui
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 12:47:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lcapitul@redhat.com>)
 id 1nZEyD-0005mY-Mg
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:45:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lcapitul@redhat.com>)
 id 1nZEy8-0004aZ-9N
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648572319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XbnUEjt3XEggyBXNJ5/UQ7IZJLrRfXOrjWCE+1lXW/c=;
 b=Tm6Mjb5llDVx4V81PxFJG/i5CoaVXEuXUCpM/Z6wsk07cgsH9W1rd+B4E1OjdNBEMVGi8D
 RH/tBXAfR0e2fSAa45VJBeybyh1Z77R5xwuM4e0/F1XVcyNs+t+RCqWRrTWpl48qFe3ixN
 +n1nUHP9Wq/eQfxNGUugfI1AEjcsYDI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-ItqTSJzYP2W6h3nCWkOKow-1; Tue, 29 Mar 2022 12:44:10 -0400
X-MC-Unique: ItqTSJzYP2W6h3nCWkOKow-1
Received: by mail-pf1-f199.google.com with SMTP id
 w201-20020a627bd2000000b004fa92f4725bso10419179pfc.21
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 09:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XbnUEjt3XEggyBXNJ5/UQ7IZJLrRfXOrjWCE+1lXW/c=;
 b=L0jhLVgTV6otI0ZLYtAtYgc1Vh4B0dcKFpPMHV5f7Q/5Wgcgp5PMWWho6hYKUMtsim
 wG1trKB+TuUkTpFpm2QdKjQmGXMIfvFfzvDv2mYRfaJAXMJuStkx1r7zSO8irpdK/yBc
 5QlMrr1Q/hUlL1YE2vdaVBMgIYTNxkAmDEouEFHAr6qylRtj9uNjtp2HWsSDEKPf09dA
 HpTR4evzmlMZPXE/kHVJ3jmRNOfuxMhpXfYl5xBs7rPNIXmJTI+quRMKmcLaMSCdY0F/
 qjBgHFcxaImBdRUggfIu7YfcSSQPbw30vwEYHfYOBz3MprITnN9jfnjuCqRXHKWGSG6D
 CJ5Q==
X-Gm-Message-State: AOAM533HAqLl1fisPjO3W1Lr8YBTz9hGrh6GKET0qFpbI/zLmATgMbdy
 hzwK2U8Q4/J8jc9m5zcDB6S58niXsIrPiswiEwCFl9WdmiYjTFNoDYlu54adHv3PpuNTRZc7dKZ
 cqTzDRdeGl8YOwxoTkyphPX/da2s6upo=
X-Received: by 2002:a17:903:1cd:b0:154:5edf:5704 with SMTP id
 e13-20020a17090301cd00b001545edf5704mr31721711plh.26.1648572248685; 
 Tue, 29 Mar 2022 09:44:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydV3poKeTn6Lrk6K02p7kK/1PYBRUoUIsM0snKOh1NzFOxsx2g4zuQpBfcVZqiJBOYt1dQSkk//0O9Keid+qI=
X-Received: by 2002:a17:903:1cd:b0:154:5edf:5704 with SMTP id
 e13-20020a17090301cd00b001545edf5704mr31721681plh.26.1648572248325; Tue, 29
 Mar 2022 09:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200438.2556381-1-jsnow@redhat.com>
 <20220325200438.2556381-4-jsnow@redhat.com>
In-Reply-To: <20220325200438.2556381-4-jsnow@redhat.com>
From: Luiz Capitulino <lcapitulino@redhat.com>
Date: Tue, 29 Mar 2022 12:43:57 -0400
Message-ID: <CAA3vgKT8m9XEYU669qSj5obzUSBoNrMkDK7tcuRjbLDxd0AGbQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] python/qmp-shell: relicense as LGPLv2+
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lcapitul@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003f993605db5e23c0"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lcapitul@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <mlureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@habkost.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003f993605db5e23c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022 at 4:04 PM John Snow <jsnow@redhat.com> wrote:

> qmp-shell is presently licensed as GPLv2 (only). I intend to include
> this tool as an add-on to an LGPLv2+ library package hosted on
> PyPI.org. I've selected LGPLv2+ to maximize compatibility with other
> licenses while retaining a copyleft license.
>
> To keep licensing matters simple, I'd like to relicense this tool as
> LGPLv2+ as well in order to keep the resultant license of the hosted
> release files simple -- even if library users won't "link against" this
> command line tool.
>
> Therefore, I am asking permission from the current authors of this
> tool to loosen the license. At present, those people are:
>
> - John Snow (me!), 411/609
> - Luiz Capitulino, Author, 97/609
> - Daniel Berrang=C3=A9, 81/609
> - Eduardo Habkost, 10/609
> - Marc-Andr=C3=A9 Lureau, 6/609
> - Fam Zheng, 3/609
> - Cleber Rosa, 1/609
>
> (All of which appear to have been written under redhat.com addresses.)
>
> Eduardo's fixes are largely automated from 2to3 conversion tools and may
> not necessarily constitute authorship, but his signature would put to
> rest any questions.
>
> Cleber's changes concern a single import statement change. Also won't
> hurt to ask.
>
> CC: Luiz Capitulino <lcapitulino@redhat.com>
> CC: Daniel Berrange <berrange@redhat.com>
> CC: Eduardo Habkost <ehabkost@habkost.com>
> CC: Marc-Andr=C3=A9 Lureau <mlureau@redhat.com>
> CC: Fam Zheng <fam@euphon.net>
> CC: Cleber Rosa <crosa@redhat.com>
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>

Acked-by: Luiz Capitulino <lcapitulino@redhat.com>

Thank you John and everybody who's contributing, it's very reassuring to se=
e
these things are in good hands!

- Luiz

---
>  python/qemu/aqmp/qmp_shell.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.p=
y
> index 35691494d0..c23f1b1928 100644
> --- a/python/qemu/aqmp/qmp_shell.py
> +++ b/python/qemu/aqmp/qmp_shell.py
> @@ -1,11 +1,12 @@
>  #
> -# Copyright (C) 2009, 2010 Red Hat Inc.
> +# Copyright (C) 2009-2022 Red Hat Inc.
>  #
>  # Authors:
>  #  Luiz Capitulino <lcapitulino@redhat.com>
> +#  John Snow <jsnow@redhat.com>
>  #
> -# This work is licensed under the terms of the GNU GPL, version 2.  See
> -# the COPYING file in the top-level directory.
> +# This work is licensed under the terms of the GNU LGPL, version 2 or
> +# later. See the COPYING file in the top-level directory.
>  #
>
>  """
> --
> 2.34.1
>
>

--0000000000003f993605db5e23c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 25, 2022 at 4:04 PM John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">qmp-shell is p=
resently licensed as GPLv2 (only). I intend to include<br>
this tool as an add-on to an LGPLv2+ library package hosted on<br>
PyPI.org. I&#39;ve selected LGPLv2+ to maximize compatibility with other<br=
>
licenses while retaining a copyleft license.<br>
<br>
To keep licensing matters simple, I&#39;d like to relicense this tool as<br=
>
LGPLv2+ as well in order to keep the resultant license of the hosted<br>
release files simple -- even if library users won&#39;t &quot;link against&=
quot; this<br>
command line tool.<br>
<br>
Therefore, I am asking permission from the current authors of this<br>
tool to loosen the license. At present, those people are:<br>
<br>
- John Snow (me!), 411/609<br>
- Luiz Capitulino, Author, 97/609<br>
- Daniel Berrang=C3=A9, 81/609<br>
- Eduardo Habkost, 10/609<br>
- Marc-Andr=C3=A9 Lureau, 6/609<br>
- Fam Zheng, 3/609<br>
- Cleber Rosa, 1/609<br>
<br>
(All of which appear to have been written under <a href=3D"http://redhat.co=
m" rel=3D"noreferrer" target=3D"_blank">redhat.com</a> addresses.)<br>
<br>
Eduardo&#39;s fixes are largely automated from 2to3 conversion tools and ma=
y<br>
not necessarily constitute authorship, but his signature would put to<br>
rest any questions.<br>
<br>
Cleber&#39;s changes concern a single import statement change. Also won&#39=
;t<br>
hurt to ask.<br>
<br>
CC: Luiz Capitulino &lt;<a href=3D"mailto:lcapitulino@redhat.com" target=3D=
"_blank">lcapitulino@redhat.com</a>&gt;<br>
CC: Daniel Berrange &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_b=
lank">berrange@redhat.com</a>&gt;<br>
CC: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@habkost.com" target=3D"_=
blank">ehabkost@habkost.com</a>&gt;<br>
CC: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mlureau@redhat.com" target=
=3D"_blank">mlureau@redhat.com</a>&gt;<br>
CC: Fam Zheng &lt;<a href=3D"mailto:fam@euphon.net" target=3D"_blank">fam@e=
uphon.net</a>&gt;<br>
CC: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" target=3D"_blank">c=
rosa@redhat.com</a>&gt;<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Acked-=
by: Luiz Capitulino &lt;<a href=3D"mailto:lcapitulino@redhat.com" target=3D=
"_blank">lcapitulino@redhat.com</a>&gt;</div><div><br></div><div>Thank you =
John and everybody who&#39;s contributing, it&#39;s very reassuring=C2=A0to=
 see</div><div>these things are in good hands!</div><div><br></div><div>- L=
uiz</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0python/qemu/aqmp/qmp_shell.py | 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py<=
br>
index 35691494d0..c23f1b1928 100644<br>
--- a/python/qemu/aqmp/qmp_shell.py<br>
+++ b/python/qemu/aqmp/qmp_shell.py<br>
@@ -1,11 +1,12 @@<br>
=C2=A0#<br>
-# Copyright (C) 2009, 2010 Red Hat Inc.<br>
+# Copyright (C) 2009-2022 Red Hat Inc.<br>
=C2=A0#<br>
=C2=A0# Authors:<br>
=C2=A0#=C2=A0 Luiz Capitulino &lt;<a href=3D"mailto:lcapitulino@redhat.com"=
 target=3D"_blank">lcapitulino@redhat.com</a>&gt;<br>
+#=C2=A0 John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank=
">jsnow@redhat.com</a>&gt;<br>
=C2=A0#<br>
-# This work is licensed under the terms of the GNU GPL, version 2.=C2=A0 S=
ee<br>
-# the COPYING file in the top-level directory.<br>
+# This work is licensed under the terms of the GNU LGPL, version 2 or<br>
+# later. See the COPYING file in the top-level directory.<br>
=C2=A0#<br>
<br>
=C2=A0&quot;&quot;&quot;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--0000000000003f993605db5e23c0--


