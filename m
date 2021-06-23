Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE293B1DA6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:32:51 +0200 (CEST)
Received: from localhost ([::1]:43418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4ry-0003Hs-5E
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lw4qg-0002bi-AE
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:31:30 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lw4qe-00076f-3r
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:31:29 -0400
Received: by mail-ej1-x62f.google.com with SMTP id bu12so4774074ejb.0
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 08:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/HRXSVlRdtZZ5LVowXrFAusH9v8/HRflstxY7q7HRmE=;
 b=NL6mmdFBorRK79HUyCNOSfdFh6Jdr5buliM80K+6B2eNPms/7XlQjI0k30K6WAnaxz
 yi6p2V9xsr031PKnRakad2NRz2WfsSs3gy6PPDQ+e29/7GxkG/aJmEB580nPAKL/E8hf
 KN4Qh+aj1PApbpVbs5AS3ZxzoGj0lOR8aIz4L0KNJRbO4GrlihmXSuA7lu18sgMYYrwu
 0xBHFppQbdoU0gexmJd1Xa6lJfqlMx0L9T9qQ3FMrHUijrv01XtfEmTYczplkGx8N8E+
 E7YkuyLOai22pneYVDEX4KHGIqzMPojDDAmc0AEP5tS60H4w4t4TkuO2Rf77mmCPoc5x
 dfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/HRXSVlRdtZZ5LVowXrFAusH9v8/HRflstxY7q7HRmE=;
 b=UftkrtTVGIIN9P/uXPn19N2g0TdL+GzIpRejUPO4QQZ/PT9ovVTcvTKuPAjQSPUhKc
 gYy6KE6L0HD6EIZtGWm0GYRFzMRRGD+Oc4u5gjomzwMDtzshFKUMdZLyR92i+0nlXiBG
 QKNSZ5t3uCd7CPAEApWwc2bqoDI0xolXqt91Nw9sgDFjb3cv2syzCBXuQTeiA8ke62SJ
 Z/8mjqPSvn97nIdyDpPFxRhmCaYaBvSCF7XDyqfeksFGxLAeuivHfflAEVGzzJ71beCd
 CCtkxrOlF7OICz+D6NTBkMd62VcKtZJsBZdwxpE7CxtKHMHP205KI4tTWLEVUmXQX1gn
 a5Nw==
X-Gm-Message-State: AOAM530xGNYAgh7IYAEHmHiEllI76JxH2auEVWsTten77kYpowvmNJe1
 0MyGJRzT4mw923VCnRoca7azQnO6DEOacs7+kAg=
X-Google-Smtp-Source: ABdhPJxLNwm2cVRHcyFbZm9Y0OkPSyqh+jiw7OFIFWVJ2CTSbFA5fQdnaefqBEan7jYzCIq98DQlSgX9ClWu7tM6Pg4=
X-Received: by 2002:a17:906:4b08:: with SMTP id
 y8mr581552eju.389.1624462284827; 
 Wed, 23 Jun 2021 08:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <7132e6a4-8d3a-828e-1c08-b17954445341@redhat.com>
 <87k0mk4vyg.fsf@dusky.pond.sub.org> <YNNOi22ZQaKibqSO@redhat.com>
In-Reply-To: <YNNOi22ZQaKibqSO@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 23 Jun 2021 19:31:13 +0400
Message-ID: <CAJ+F1CKuknwaWXfjU7iXXYOTo0aB_Z_a_hj5ny+JRFiMYRZLNQ@mail.gmail.com>
Subject: Re: Auditing QEMU to replace NULL with &error_abort
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000702eed05c57099c6"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000702eed05c57099c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 23, 2021 at 7:10 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Jun 23, 2021 at 02:16:55PM +0200, Markus Armbruster wrote:
> > &error_abort has been a clear win for us.  &error_fatal too, when used
> > judiciously.  Marc-Andr=C3=A9 tried to get both into GLib, unsuccessful=
ly[2].
>
> ...snip...
>
> > [2] https://gitlab.gnome.org/GNOME/glib/-/issues/2288
>
> This doesn't actually suggest adding error_abort/fatal to GLib. Rather
> it adds a general callback hook to GLib. Biggest complaints there
> are around the callback concept and difficulty of safely using it,
> which I can't disagree with.
>
> I wonder if we would have more luck if we explicitly proposed the
> error_abort/fatal concept to GLib instead. At least that would not
> hit any of the complaints raised about the callback.
>
>
Without callbacks, it will be difficult to report errors back to the
monitor, or prettify it the way we want (since we would be using extended
GErrors for hints etc)

But we could have a more specific callback for that perhaps?

You are welcome to propose something else :)

--=20
Marc-Andr=C3=A9 Lureau

--000000000000702eed05c57099c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 23, 2021 at 7:10 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, Jun 23, 2021 at 02:16:55PM +0200, Markus Armbruster wrote:<=
br>
&gt; &amp;error_abort has been a clear win for us.=C2=A0 &amp;error_fatal t=
oo, when used<br>
&gt; judiciously.=C2=A0 Marc-Andr=C3=A9 tried to get both into GLib, unsucc=
essfully[2].<br>
<br>
...snip...<br>
<br>
&gt; [2] <a href=3D"https://gitlab.gnome.org/GNOME/glib/-/issues/2288" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/glib/-/iss=
ues/2288</a><br>
<br>
This doesn&#39;t actually suggest adding error_abort/fatal to GLib. Rather<=
br>
it adds a general callback hook to GLib. Biggest complaints there<br>
are around the callback concept and difficulty of safely using it,<br>
which I can&#39;t disagree with.<br>
<br>
I wonder if we would have more luck if we explicitly proposed the<br>
error_abort/fatal concept to GLib instead. At least that would not<br>
hit any of the complaints raised about the callback.<br>
<br></blockquote><div><br></div><div>Without callbacks, it will be difficul=
t to report errors back to the monitor, or prettify it the way we want (sin=
ce we would be using extended GErrors for hints etc)</div><div><br></div><d=
iv>But we could have a more specific callback for that perhaps?</div><div><=
br></div><div>You are welcome to propose something else :)<br></div></div><=
br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau=
<br></div></div>

--000000000000702eed05c57099c6--

