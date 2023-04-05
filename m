Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29A66D7DF5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 15:44:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk3PH-0005aB-A3; Wed, 05 Apr 2023 09:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pk3PC-0005Xm-8X
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 09:42:30 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pk3P6-0001CO-T5
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 09:42:29 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id p204so42547133ybc.12
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680702143;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UEh5/X4/OgFpk35PEh+Zd1oeulb9vemO5OWJnZZvLXk=;
 b=FZh1WWyYG5YzvXqJM/vt9WIUKa8AbbVfWXscAkViQKVinbFnv5UD8cttD5AcyUfm3O
 wAmA5W7UOfrILdDBlmK0Y9g9flJImoCxUe8aa+r8AcJaeh/LCpJnPGhwmD55i3bOiE4j
 mYyNWKxcUDNX8Keq8+IucDePDq5nYEnew/tRDoh4Ke+tZ5xzgniHkYxPc9MYv5V05FPp
 P5lFZ12nX9qiJCt5+EHjDujiN63Kag3DDoO4pGMGUc+5f47ZORzHEfy6PoSFRMfJ0peb
 NQKaxtiiiZFdOSuPLwvFtpRleX4gqzRHUjUVqn38yuRMMDhVCCV5BFNtaj5xCJGh744y
 lpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680702143;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UEh5/X4/OgFpk35PEh+Zd1oeulb9vemO5OWJnZZvLXk=;
 b=mpKypUka3wN9SrhY+zZ+cqNZCmEw7MZOs1TvUw2RD4T42yUm1yGLbi/N0W1CIzqc4y
 YGJ3R3y5vg1SX98kd2/zzxZrOzZLGBTC3fgkdkg6GRqrrkDL8vZliQDIYIazBYGBq4wE
 PgPvqfTW6i57lYG/MgcBkDC5ya/9t397MPpFJaTf9dk2JEDeRJ+zdUsBKtsQlVECqdEN
 vYt/yt3qTgvDzKK4047ozFDzB+PFrNto4b9u5ZQMCMJ4245sUK9e7BsV5cBIoRGVaipZ
 2m6GGSbYNNxOACvkb1sHg4+BEhzMs+I7PwyByS9OSGJ6ipomIjfiW727UDH/Dbz4QAkL
 hcDQ==
X-Gm-Message-State: AAQBX9dY5rKRB9Z2CvtPxWeCovj36vQX6rKwZgxdh0Yq32MfcRrLRA0/
 v5WznuvYhNOFNbZsDRRcyI7lnPfcSoy9tVLbWc+29Q==
X-Google-Smtp-Source: AKy350ZwPSUBB1kNzdpzYHnqYTSVdtsf2Cb+lHJK7bC/Jc3KG9qXqDODIIM5nW+HSZqKQcFCYrHTxTHkvw5iU1tcDXo=
X-Received: by 2002:a25:3083:0:b0:b23:4649:7ef3 with SMTP id
 w125-20020a253083000000b00b2346497ef3mr4249230ybw.4.1680702142653; Wed, 05
 Apr 2023 06:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230405125920.2951721-1-digit@google.com>
 <20230405125920.2951721-3-digit@google.com>
 <87h6tuqy0f.fsf@redhat.com>
In-Reply-To: <87h6tuqy0f.fsf@redhat.com>
From: David Turner <digit@google.com>
Date: Wed, 5 Apr 2023 15:42:11 +0200
Message-ID: <CACnJMqrf-YH6P0zBC4FSSp_LcO=pxDOrx-P3MGGFDj_uWbWjvg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add missing Linux kernel headers.
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000030661c05f896f67b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=digit@google.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000030661c05f896f67b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 5, 2023 at 3:06=E2=80=AFPM Cornelia Huck <cohuck@redhat.com> wr=
ote:

> On Wed, Apr 05 2023, "David 'Digit' Turner" <digit@google.com> wrote:
>
> > Add <linux/memfd.h>, used by hw/display/virtio-gpu-udmabuf.c
> > Add <linux/nvme_ioctl.h>, used by qga/commands-posix.c
> > Add <linux/const.h> used by kvm-all.c, which requires
> > the _BITUL() macro definition to be available.
> >
> > Without these, QEMU will not compile on Debian 10 systems.
>
> Hm, I wonder why we hadn't seen errors in the CI then.
>

No idea either, but fwiw, I am building on a docker.io/debian:10-slim
container.

>
> > The script has then been run against the official
> > 6.2.8 kernel source tree (current stable release),
> > which explains why comments in <linux/vfio.h>
> > have been updated too.
>
> I think we usually run the script against a release or release
> candidate, not stable.
>
> I meant that this was run against the headers of the 6.2.8 official
release, which was listed as "stable" on https://kernel.org/ (that page now
lists the 6.2.9 release btw)
I'd be happy to re-run it against a different set if you can tell me which
one (and where to get it, just in case).

>
> > Signed-off-by: David 'Digit' Turner <digit@google.com>
> > ---
> >  linux-headers/linux/const.h      |  36 ++++++++++
> >  linux-headers/linux/memfd.h      |  35 ++++++++++
> >  linux-headers/linux/nvme_ioctl.h | 114 +++++++++++++++++++++++++++++++
> >  linux-headers/linux/vfio.h       |  15 ++--
> >  scripts/update-linux-headers.sh  |   4 +-
> >  5 files changed, 196 insertions(+), 8 deletions(-)
> >  create mode 100644 linux-headers/linux/const.h
> >  create mode 100644 linux-headers/linux/memfd.h
> >  create mode 100644 linux-headers/linux/nvme_ioctl.h
>
>

--00000000000030661c05f896f67b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 5, 2023 at 3:06=E2=80=AFP=
M Cornelia Huck &lt;<a href=3D"mailto:cohuck@redhat.com">cohuck@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Wed, Apr 05 2023, &quot;David &#39;Digit&#39; Turner&quot; &lt;<a href=3D=
"mailto:digit@google.com" target=3D"_blank">digit@google.com</a>&gt; wrote:=
<br>
<br>
&gt; Add &lt;linux/memfd.h&gt;, used by hw/display/virtio-gpu-udmabuf.c<br>
&gt; Add &lt;linux/nvme_ioctl.h&gt;, used by qga/commands-posix.c<br>
&gt; Add &lt;linux/const.h&gt; used by kvm-all.c, which requires<br>
&gt; the _BITUL() macro definition to be available.<br>
&gt;<br>
&gt; Without these, QEMU will not compile on Debian 10 systems.<br>
<br>
Hm, I wonder why we hadn&#39;t seen errors in the CI then.<br></blockquote>=
<div>=C2=A0</div><div>No idea either, but fwiw, I am building on a <a href=
=3D"http://docker.io/debian:10-slim">docker.io/debian:10-slim</a> container=
.<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; The script has then been run against the official<br>
&gt; 6.2.8 kernel source tree (current stable release),<br>
&gt; which explains why comments in &lt;linux/vfio.h&gt;<br>
&gt; have been updated too.<br>
<br>
I think we usually run the script against a release or release<br>
candidate, not stable.<br>
<br></blockquote><div>I meant that this was run against the headers of the =
6.2.8 official release, which was listed as &quot;stable&quot; on=C2=A0<a h=
ref=3D"https://kernel.org/">https://kernel.org/</a> (that page now lists th=
e 6.2.9 release btw)<br></div><div>I&#39;d be happy to re-run it against a =
different set if you can tell me which one (and where to get it, just in ca=
se).<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Signed-off-by: David &#39;Digit&#39; Turner &lt;<a href=3D"mailto:digi=
t@google.com" target=3D"_blank">digit@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 linux-headers/linux/const.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 36 +++++=
+++++<br>
&gt;=C2=A0 linux-headers/linux/memfd.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 35 +++++=
+++++<br>
&gt;=C2=A0 linux-headers/linux/nvme_ioctl.h | 114 +++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 linux-headers/linux/vfio.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 =
++--<br>
&gt;=C2=A0 scripts/update-linux-headers.sh=C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 5 files changed, 196 insertions(+), 8 deletions(-)<br>
&gt;=C2=A0 create mode 100644 linux-headers/linux/const.h<br>
&gt;=C2=A0 create mode 100644 linux-headers/linux/memfd.h<br>
&gt;=C2=A0 create mode 100644 linux-headers/linux/nvme_ioctl.h<br>
<br>
</blockquote></div></div>

--00000000000030661c05f896f67b--

