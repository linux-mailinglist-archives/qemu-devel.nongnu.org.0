Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287EF3BF3A4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:40:51 +0200 (CEST)
Received: from localhost ([::1]:51224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1J22-0004At-7k
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m1J10-00031A-Gh
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:39:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m1J0y-0004Yd-OU
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625708383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EM7nIxZeLiJ9lF50ZNop2Fa2Ei26qaNLpcsdjeyuxOs=;
 b=XSbxnnY9CXZZO/WT96hpP7UdM+9x7rMuGtsTrJl1iJAbLExHOJIa3MuGAPEdJFxJjf1kCV
 jY6qs140ZEAcKFTeFoyzuz1Ld9dfZ7Zg0YXfU3dg0k99k6enWiPQUNvsFJ+RtCepzL4hBE
 CxglxBbWmyHDv0VA7OCJVub6V260aTo=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151--Rjh1LNYMCWaRK-SoJjI7w-1; Wed, 07 Jul 2021 21:39:42 -0400
X-MC-Unique: -Rjh1LNYMCWaRK-SoJjI7w-1
Received: by mail-oi1-f199.google.com with SMTP id
 u63-20020acac4420000b029024085cadfcbso3311964oif.23
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 18:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EM7nIxZeLiJ9lF50ZNop2Fa2Ei26qaNLpcsdjeyuxOs=;
 b=AKcCAxszHdT1qB8/rY6MeEwb5dhrKi1zxURR4/hp6tugeSLW990/408Da9+inqo/fg
 Y8lqPNmBdoqxxIvJ/BzhGm7kRP5jP8L3dP0EGJ7Ql6V9/A1gaCdwGAStwqR+oU7nUKiq
 UUsvrNYIRZ6TkPd/O3WcOqs1Riex2+JqsdaW+YKCe8pYhFRJrUUWnUmd+PhrgIelGqSz
 PbEAuR0a/D+E0dSj/5y8SJ9n7v8pm95FpXLE8luERdtfWEw3STuwIOHWZX3RgIbdPo8y
 9PSgmxczPJkc2Tss9mO4xSPqQG0zeyWLnZxcI1iZTg2aH3/D6SWA0lBJNoaON4X8jm8C
 gAnQ==
X-Gm-Message-State: AOAM5321Qpey8xRMuWqorNwimKV7EJ1PMe5A1vfAj1EmxmEkG/KSL+Bz
 2AojKa44r9exYqDYI8Nci5MhQLq4PPo3i2hXbBEXK+ANmP3KsOZIv1YqXoQw16mxaPtnEH0LKpN
 FDHwfGacpcw23wyH1zC6uBBCvlH2aWas=
X-Received: by 2002:a4a:8f93:: with SMTP id c19mr20627851ooj.31.1625708381503; 
 Wed, 07 Jul 2021 18:39:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymTFqgrPy6eJbjUsXLnB8F6IRHFRlvwetyIc9iizYPSXuZqa3hQGu2+VPC1g4yCBXNv/cJO9tdBTM28ksTGsQ=
X-Received: by 2002:a4a:8f93:: with SMTP id c19mr20627843ooj.31.1625708381317; 
 Wed, 07 Jul 2021 18:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210702212603.26465-1-niteesh.gs@gmail.com>
 <20210702212603.26465-3-niteesh.gs@gmail.com>
In-Reply-To: <20210702212603.26465-3-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 7 Jul 2021 21:39:30 -0400
Message-ID: <CAFn=p-ZD6Q0EvwMb2QUONF1LsT5XeMvkD0Bfme86xPDVXRazVA@mail.gmail.com>
Subject: Re: [PATCH 2/6] python: Add dependencies for AQMP TUI
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000093c2cd05c692baa6"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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

--00000000000093c2cd05c692baa6
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 2, 2021 at 5:26 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Added dependencies for the upcoming AQMP TUI under the optional
> 'tui' group.
>
> The same dependencies have also been added under the devel group
> since no work around has been found for optional groups to imply
> other optional groups.
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>

One thing that I notice is that if you already have a .tox environment,
adding new dependencies won't cause .tox to regenerate its environments,
forcing me to delete .tox and try again.
Maybe it's possible to update the Makefile so that changes to 'setup.cfg'
will coerce Tox to rebuild?

Looks good otherwise, thank you for taking the time to re-order your
patches for the list, and congrats on your first submission :)

--js


> ---
>  python/Pipfile.lock | 12 ++++++++++++
>  python/setup.cfg    |  7 +++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/python/Pipfile.lock b/python/Pipfile.lock
> index 8ab41a3f60..76cf1e4930 100644
> --- a/python/Pipfile.lock
> +++ b/python/Pipfile.lock
> @@ -289,6 +289,18 @@
>              "markers": "python_version < '3.8'",
>              "version": "==3.10.0.0"
>          },
> +        "urwid": {
> +            "hashes": [
> +
> "sha256:588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae"
> +            ],
> +            "version": "==2.1.2"
> +        },
> +        "urwid-readline": {
> +            "hashes": [
> +
> "sha256:018020cbc864bb5ed87be17dc26b069eae2755cb29f3a9c569aac3bded1efaf4"
> +            ],
> +            "version": "==0.13"
> +        },
>          "virtualenv": {
>              "hashes": [
>
>  "sha256:14fdf849f80dbb29a4eb6caa9875d476ee2a5cf76a5f5415fa2f1606010ab467",
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 1a552d672a..c62803bffc 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -44,11 +44,18 @@ devel =
>      mypy >= 0.770
>      pylint >= 2.8.0
>      tox >= 3.18.0
> +    urwid >= 2.1.2
> +    urwid-readline >= 0.13
>
>  # Provides qom-fuse functionality
>  fuse =
>      fusepy >= 2.0.4
>
> +# AQMP TUI dependencies
> +tui =
> +    urwid >= 2.1.2
> +    urwid-readline >= 0.13
> +
>  [options.entry_points]
>  console_scripts =
>      qom = qemu.qmp.qom:main
> --
> 2.17.1
>
>

--00000000000093c2cd05c692baa6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 2, 2021 at 5:26 PM G S Nitees=
h Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Adde=
d dependencies for the upcoming AQMP TUI under the optional<br>
&#39;tui&#39; group.<br>
<br>
The same dependencies have also been added under the devel group<br>
since no work around has been found for optional groups to imply<br>
other optional groups.<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br></blockquote><div><br></=
div><div>One thing that I notice is that if you already have a .tox environ=
ment, adding new dependencies won&#39;t cause .tox to regenerate its enviro=
nments, forcing me to delete .tox and try again.</div><div>Maybe it&#39;s p=
ossible to update the Makefile so that changes to &#39;setup.cfg&#39; will =
coerce Tox to rebuild?</div></div><div class=3D"gmail_quote"><br></div><div=
 class=3D"gmail_quote">Looks good otherwise, thank you for taking the time =
to re-order your patches for the list, and congrats on your first submissio=
n :)</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">-=
-js<br></div><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
---<br>
=C2=A0python/Pipfile.lock | 12 ++++++++++++<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 |=C2=A0 7 +++++++<br>
=C2=A02 files changed, 19 insertions(+)<br>
<br>
diff --git a/python/Pipfile.lock b/python/Pipfile.lock<br>
index 8ab41a3f60..76cf1e4930 100644<br>
--- a/python/Pipfile.lock<br>
+++ b/python/Pipfile.lock<br>
@@ -289,6 +289,18 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;markers&quot;: &quot;=
python_version &lt; &#39;3.8&#39;&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;version&quot;: &quot;=
=3D=3D3.10.0.0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;urwid&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;hashes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sha256:588be=
e9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;version&quot;: &quot;=3D=
=3D2.1.2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;urwid-readline&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;hashes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sha256:01802=
0cbc864bb5ed87be17dc26b069eae2755cb29f3a9c569aac3bded1efaf4&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;version&quot;: &quot;=3D=
=3D0.13&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;virtualenv&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hashes&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sha256:=
14fdf849f80dbb29a4eb6caa9875d476ee2a5cf76a5f5415fa2f1606010ab467&quot;,<br>
diff --git a/python/setup.cfg b/python/setup.cfg<br>
index 1a552d672a..c62803bffc 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -44,11 +44,18 @@ devel =3D<br>
=C2=A0 =C2=A0 =C2=A0mypy &gt;=3D 0.770<br>
=C2=A0 =C2=A0 =C2=A0pylint &gt;=3D 2.8.0<br>
=C2=A0 =C2=A0 =C2=A0tox &gt;=3D 3.18.0<br>
+=C2=A0 =C2=A0 urwid &gt;=3D 2.1.2<br>
+=C2=A0 =C2=A0 urwid-readline &gt;=3D 0.13<br>
<br>
=C2=A0# Provides qom-fuse functionality<br>
=C2=A0fuse =3D<br>
=C2=A0 =C2=A0 =C2=A0fusepy &gt;=3D 2.0.4<br>
<br>
+# AQMP TUI dependencies<br>
+tui =3D<br>
+=C2=A0 =C2=A0 urwid &gt;=3D 2.1.2<br>
+=C2=A0 =C2=A0 urwid-readline &gt;=3D 0.13<br>
+<br>
=C2=A0[options.entry_points]<br>
=C2=A0console_scripts =3D<br>
=C2=A0 =C2=A0 =C2=A0qom =3D qemu.qmp.qom:main<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--00000000000093c2cd05c692baa6--


