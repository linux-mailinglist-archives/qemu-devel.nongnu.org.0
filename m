Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01463D0DEA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 13:41:12 +0200 (CEST)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ab9-00022Q-Hr
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 07:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1m6AYv-0001Hy-6D
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:38:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1m6AYr-0006d1-8Q
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626867527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9B1bPV6KNzxioFNBPzLeFWbivv08j3U/NYYVq9YTltE=;
 b=gC7eHSicPtwjGq9CqKMwTHUdNh8TG0z/uZ0u+W3Mdq9SRLxF+XGR4eWrHY2aqS3tlsFSQi
 67S+/67r7Q2DMV/5YT/mvHYlPX+vfhDyl8gnO1LfpFkAxwsnA6GWOGakDDnBUIfMQgOkPE
 WWBaJMGJIPGsnnCZx30VdiYYNY4lPo8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-tkUhhiTgNFSjftS4n5WGgQ-1; Wed, 21 Jul 2021 07:38:45 -0400
X-MC-Unique: tkUhhiTgNFSjftS4n5WGgQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 q22-20020a62e1160000b029032b880fc048so1622946pfh.21
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 04:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9B1bPV6KNzxioFNBPzLeFWbivv08j3U/NYYVq9YTltE=;
 b=XN5jbxPKlcdXD+fnncL4DZ0b5a+57ANk/v6HYyua9Q+g6ft/5Xivs88E2ZvY94L7C8
 +GvLio20lXtV/LFmuWtNWw0uzsiHCXV8x4g5dPwiHMXkub2zOgVyP8f5IsZTpTgvHyxg
 jzNSSJdy0Z8S8GhUcBlFPIhLmJIfUP2LNR4LjhZod5TzrGhB5P3UIu/ZFhinkb17RJ/e
 L3G6yVBgK0PlYR0wjI2si4qnrGOw590a43Q7GngPYNsCVAS3oDoccLbVqOQgskjMau1f
 eGnbkDVC5gvuMoBZU931gBxrKJbfkHSGcGfYaeoEN/4ayGEpQ68zdPZwsnatQW/JSit2
 h9pw==
X-Gm-Message-State: AOAM5316HPd94z4x0fIc/42wagtPaXsN/y2866vBI+bBlnzwD1j2aRjL
 FUGCv5Q/EzUnqWCLHXUNN6WHMJY8p9Vs4x5a3PUEo/daPy2TdKcYGVMMae0przx6E0vP5k+ln1s
 FR7FtKs9BLnGQ3LW4SiWr/C2WlequqIE=
X-Received: by 2002:a17:90b:2112:: with SMTP id
 kz18mr3372372pjb.137.1626867524367; 
 Wed, 21 Jul 2021 04:38:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT1Gaba7TvpBBIPTH3PI3nfHheY0i5x+Q0VU7w20HbRN011jKP5rZaCS64ZGl9wuVPdsErnJY+dGFy5PTJVAw=
X-Received: by 2002:a17:90b:2112:: with SMTP id
 kz18mr3372352pjb.137.1626867524092; 
 Wed, 21 Jul 2021 04:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 21 Jul 2021 15:38:33 +0400
Message-ID: <CAMxuvaz8H6-td5FLRigkE8DgK8usE-s9sMSWLtp66u5ufdM7sw@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Clipboard fixes (for 6.1?)
To: qemu-devel <qemu-devel@nongnu.org>, "Hoffmann, Gerd" <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000dedbb205c7a09c66"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dedbb205c7a09c66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gerd,

On Wed, Jul 21, 2021 at 12:41 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> Here is a few fixes I have collected while working on clipboard-related
> code.
>
> There are some obvious code improvements/fixes, and better handling of
> release &
> unregister to avoid dangling pointers and improve user experience.
>
> v2:
>  - replaced "ui/vdagent: unregister clipboard peer on finalize" with
> "ui/vdagent: disconnect handlers and reset state on finalize" patch.
>  - added "ui/vdagent: reset outbuf on disconnect"
>  - commit message tweaks
>
>
I am still improving this series, but any feedback is welcome.

I am wondering if we should add a migration blocker for 6.1. VNC clients
are reconnected on migration, but migration shouldn't be visible to guest
agent. What do you think?

thanks



> Marc-Andr=C3=A9 Lureau (13):
>   ui/vdagent: fix leak on error path
>   ui/vdagent: remove copy-pasta comment
>   ui/gtk-clipboard: use existing macros
>   ui/gtk-clipboard: fix clipboard enum typo
>   ui/clipboard: add helper to retrieve current clipboard
>   ui/clipboard: release owned grabs on unregister
>   ui/vdagent: disconnect handlers and reset state on finalize
>   ui/vdagent: reset outbuf on disconnect
>   ui/vdagent: split clipboard recv message handling
>   ui/vdagent: use qemu_clipboard_info helper
>   ui/gtk-clipboard: use qemu_clipboard_info helper
>   ui/vdagent: send release when no clipboard owner
>   ui/gtk-clipboard: emit release clipboard events
>
>  include/ui/clipboard.h |  11 ++
>  include/ui/gtk.h       |   1 -
>  ui/clipboard.c         |  24 +++++
>  ui/gtk-clipboard.c     |  30 +++---
>  ui/vdagent.c           | 225 +++++++++++++++++++++++++----------------
>  5 files changed, 188 insertions(+), 103 deletions(-)
>
> --
> 2.32.0.264.g75ae10bc75
>
>
>

--000000000000dedbb205c7a09c66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Gerd,<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 21, 2021 at 12:41=
 PM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Hi,<br>
<br>
Here is a few fixes I have collected while working on clipboard-related cod=
e.<br>
<br>
There are some obvious code improvements/fixes, and better handling of rele=
ase &amp;<br>
unregister to avoid dangling pointers and improve user experience.<br>
<br>
v2:<br>
=C2=A0- replaced &quot;ui/vdagent: unregister clipboard peer on finalize&qu=
ot; with &quot;ui/vdagent: disconnect handlers and reset state on finalize&=
quot; patch.<br>
=C2=A0- added &quot;ui/vdagent: reset outbuf on disconnect&quot;<br>
=C2=A0- commit message tweaks<br>
<br></blockquote><div><br></div><div>I am still improving this series, but =
any feedback is welcome.</div><div><br></div><div>I am wondering if we shou=
ld add a migration blocker for 6.1. VNC clients are reconnected on migratio=
n, but migration shouldn&#39;t be visible to guest agent. What do you think=
?</div><div><br></div><div>thanks</div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
Marc-Andr=C3=A9 Lureau (13):<br>
=C2=A0 ui/vdagent: fix leak on error path<br>
=C2=A0 ui/vdagent: remove copy-pasta comment<br>
=C2=A0 ui/gtk-clipboard: use existing macros<br>
=C2=A0 ui/gtk-clipboard: fix clipboard enum typo<br>
=C2=A0 ui/clipboard: add helper to retrieve current clipboard<br>
=C2=A0 ui/clipboard: release owned grabs on unregister<br>
=C2=A0 ui/vdagent: disconnect handlers and reset state on finalize<br>
=C2=A0 ui/vdagent: reset outbuf on disconnect<br>
=C2=A0 ui/vdagent: split clipboard recv message handling<br>
=C2=A0 ui/vdagent: use qemu_clipboard_info helper<br>
=C2=A0 ui/gtk-clipboard: use qemu_clipboard_info helper<br>
=C2=A0 ui/vdagent: send release when no clipboard owner<br>
=C2=A0 ui/gtk-clipboard: emit release clipboard events<br>
<br>
=C2=A0include/ui/clipboard.h |=C2=A0 11 ++<br>
=C2=A0include/ui/gtk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0ui/clipboard.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 +++++<br>
=C2=A0ui/gtk-clipboard.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 30 +++---<br>
=C2=A0ui/vdagent.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 225 ++++++++++=
+++++++++++++++----------------<br>
=C2=A05 files changed, 188 insertions(+), 103 deletions(-)<br>
<br>
-- <br>
2.32.0.264.g75ae10bc75<br>
<br>
<br>
</blockquote></div></div>

--000000000000dedbb205c7a09c66--


