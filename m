Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D343DF3FD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 19:35:55 +0200 (CEST)
Received: from localhost ([::1]:37158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAyKY-0006WW-7p
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 13:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAyJY-0005bz-KP
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 13:34:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAyJV-00087X-Kt
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 13:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628012087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jfSvV2qRbURV5ggFhVZl3g9nvoixoxU3L70MCEaqY6w=;
 b=bvfNT/MmFgwBHOYsM4fNM39UzpRGIChpFdQQvDv5UpS/bmhy1YV8JNqkrJ5jIQDGwgRbTS
 74UPxxTmzZx4f7Brb9q/ep1S75F/n/vp5ArOD7tZqzyzafdq2RAf/Qe4WRLlYN6VCIdmTv
 DzDkCgUhf2a3TNPNnwe1fcyTALIKLIE=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-jjNwpbWnPvCvW1MMAlGuSA-1; Tue, 03 Aug 2021 13:34:45 -0400
X-MC-Unique: jjNwpbWnPvCvW1MMAlGuSA-1
Received: by mail-oi1-f197.google.com with SMTP id
 c6-20020aca35060000b029025c5504f461so8913953oia.22
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 10:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jfSvV2qRbURV5ggFhVZl3g9nvoixoxU3L70MCEaqY6w=;
 b=PSOXeOWB1svPLXVygqztjnSSE+WiuIUTb011PhnlUarX5maxw2aZy8FQeJKkvKNT5V
 Tjogap5L4SQVN19YN0YeQofcknVphcT1ElpIErRbJPzZqyEw3MtvSoKKXktaImN3gLnY
 b1zvWVx6YOz3F2vdMupl66nXmusQBej48KMDD/3plhPh7pMU6twj1x7U+O0uc55qNOUy
 OVqxq6aCTP91Xebe2CcABMwgJ2EZuUG9kDvLsFnMnYp+82h3CgMOVpxHkRE4IlG9WIPR
 +8xhhGHWDy1Io0RoyIeB2tLW1xG+GpTQX2W0Ap+eg8q6GVf+YMP3S1jjP8Iju7b8Vkw8
 zIAw==
X-Gm-Message-State: AOAM5335QArnSZ2oWwYYRF9n75JzFzB0vjm1NXQwGH+5Sl4H9MBkLkCf
 hGY6UiXSn193JStoeR769K2tLVN58bmZdHOd7N95tC4x9fx+vX2PW5tkq2g3M/UEvk0z5H6WHgE
 F4f6dZW9ayumdn5OFXj14JktBtOftEw8=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr16408483otb.323.1628012083866; 
 Tue, 03 Aug 2021 10:34:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYRFSFUpBrJ/1vmdaOCeZnuoI6uHAM/UrRHS5azD9QQlYyedjfd7EwpNAs6UhvsLfYHJknFTo4BdDHiukr24Y=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr16408470otb.323.1628012083693; 
 Tue, 03 Aug 2021 10:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210717003253.457418-1-jsnow@redhat.com>
 <20210717003253.457418-3-jsnow@redhat.com>
 <20210803160129.e63u5lylorivgjov@redhat.com>
In-Reply-To: <20210803160129.e63u5lylorivgjov@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 3 Aug 2021 13:34:32 -0400
Message-ID: <CAFn=p-aeLwTwhUzEMS9RM4jV8udFg4huKXN3v9QEn8gRG+t9vw@mail.gmail.com>
Subject: Re: [PATCH v2 02/24] python/aqmp: add error classes
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f0623b05c8ab1900"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f0623b05c8ab1900
Content-Type: text/plain; charset="UTF-8"

Got it. I was *just* about to send a refreshed version of this patchset
because I found a new bug while on my way to making a sync compatibility
shim for iotests -- Do you have more feedback cooking, or should I hit the
send button?

--js

On Tue, Aug 3, 2021 at 12:02 PM Eric Blake <eblake@redhat.com> wrote:

> On Fri, Jul 16, 2021 at 08:32:31PM -0400, John Snow wrote:
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/aqmp/__init__.py |  4 +++
> >  python/qemu/aqmp/error.py    | 50 ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 54 insertions(+)
> >  create mode 100644 python/qemu/aqmp/error.py
>
> > +++ b/python/qemu/aqmp/error.py
> > @@ -0,0 +1,50 @@
>
> > +
> > +class ProtocolError(AQMPError):
> > +    """
> > +    Abstract error class for protocol failures.
> > +
> > +    Semantically, these errors are generally the fault of either the
> > +    protocol server or as a result of a bug in this this library.
>
> duplicate 'this'
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--000000000000f0623b05c8ab1900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Got it. I was *just* about to send a refreshed versio=
n of this patchset because I found a new bug while on my way to making a sy=
nc compatibility shim for iotests -- Do you have more feedback cooking, or =
should I hit the send button?</div><div><br></div><div>--js<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Aug 3, 2021 at 12:02 PM Eric Blake &lt;<a href=3D"mailto:eblake@redhat.co=
m">eblake@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Fri, Jul 16, 2021 at 08:32:31PM -0400, John Snow wro=
te:<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 python/qemu/aqmp/__init__.py |=C2=A0 4 +++<br>
&gt;=C2=A0 python/qemu/aqmp/error.py=C2=A0 =C2=A0 | 50 ++++++++++++++++++++=
++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 54 insertions(+)<br>
&gt;=C2=A0 create mode 100644 python/qemu/aqmp/error.py<br>
<br>
&gt; +++ b/python/qemu/aqmp/error.py<br>
&gt; @@ -0,0 +1,50 @@<br>
<br>
&gt; +<br>
&gt; +class ProtocolError(AQMPError):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 Abstract error class for protocol failures.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Semantically, these errors are generally the fault of e=
ither the<br>
&gt; +=C2=A0 =C2=A0 protocol server or as a result of a bug in this this li=
brary.<br>
<br>
duplicate &#39;this&#39;<br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div>

--000000000000f0623b05c8ab1900--


