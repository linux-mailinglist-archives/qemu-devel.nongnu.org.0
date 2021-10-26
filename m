Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA5A43BC1D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 23:12:52 +0200 (CEST)
Received: from localhost ([::1]:48818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTkZ-0001Hx-E0
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 17:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTic-0008F6-Aw
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 17:10:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTia-0005Xd-B4
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 17:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635282647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kwsj0Q5/JnDR6WYK+DO+qgFfUZPFjbk3kvhgOuVI5C8=;
 b=ibffLRZWQUNxQpou5dIh+exE/xzQyEEOEQN9CLw7OnEbrOtn5XeXbDgx6C285zUwHhoW6S
 SMdCS3s2xDKJ3OhOoFfvvhYz80QgVXzP8ih5uDT5LUST6sSFZoWYElqhL9MeyC0IZtLEPN
 bvcxEQwYPnf1v21hFobYbm5EfEzprgw=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-tE3ayAY6NXunkqnW9xfqpQ-1; Tue, 26 Oct 2021 17:10:46 -0400
X-MC-Unique: tE3ayAY6NXunkqnW9xfqpQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 p79-20020a1f2952000000b002dca61a7524so342661vkp.16
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 14:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kwsj0Q5/JnDR6WYK+DO+qgFfUZPFjbk3kvhgOuVI5C8=;
 b=D/oDH5zbRjA1DDey1RINh+9+/wUynJHDZMZ5bFu8q6NxliDZEz79xqtUugu3ddZBe0
 kW/pv58IeXJPyaFy+Kwk16YWLjl86fT9tLQMRU9kXecWVV2z6NsFOY5DZ2HE/jxZdaWd
 njZKWQfEWpfgbOsp/iTt2Ze93zHWUPdFN7hqWc64Ekb0vEu6zaDTDhLfHo/O2YBCnd1V
 LlwwlQDcMbW+dwCEcXz0D7YV0EBZm2m7jh/8SBSBgNJEx20z0Fs2eNtNil+iK6Hyvj00
 hkFIn6Z3BZ+cbc8yMv/rEfrNRJbEAya5jyqVVISSVbIAf7O08my9B/CUcQqqNbx1q2Qo
 25RQ==
X-Gm-Message-State: AOAM531uHbQUUx9D0/VlIMVNK5C7uxO9hLQcz390WymSqIIDr1Bi0qQ/
 l7L8TG2pelsG3D60TBtmxY+XcipOStsnreR6EGK59mm9nNpBXigpZ9wPDnGliw18rGcC3/w2NFs
 I/YhYpAqAvs0lxo2ZzCw+S3Fcde4S8/4=
X-Received: by 2002:ab0:4e14:: with SMTP id g20mr25496853uah.50.1635282645482; 
 Tue, 26 Oct 2021 14:10:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/EaqPXTtEgY9WpTxxVbED8ctdu7n4UFP3BY7LxQh9+PUnLntXJCBXPFkOCY1aft4Rstvn6pyqKyHxIn9TTPo=
X-Received: by 2002:ab0:4e14:: with SMTP id g20mr25496828uah.50.1635282645340; 
 Tue, 26 Oct 2021 14:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211015105344.152591-1-marcandre.lureau@redhat.com>
In-Reply-To: <20211015105344.152591-1-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 17:10:34 -0400
Message-ID: <CAFn=p-a+qN=JLJC4X-gB-ahUkeKkvCAbzpMrv78_f6T82vc-=g@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Some Sphinx improvements
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002ee9e505cf47e990"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002ee9e505cf47e990
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 6:57 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> I have collected a few Sphinx-related improvements to improve depfile
> generation
> and add some keyboard navigation. Hope you'll like it.
>
> v2:
>  - fix test 'output:' regression
>  - fix javascript indentation (Paolo)
>  - split "meson: remove explicit extensions dependency file list" (Paolo)
>
> Marc-Andr=C3=A9 Lureau (8):
>   docs/sphinx: add loaded modules to generated depfile
>   docs/sphinx: add static files to generated depfile
>   docs/sphinx: add templates files to generated depfile
>   tests/qapi-schema/meson: add depfile to sphinx doc
>   meson: drop sphinx_extn_depends
>   meson: drop sphinx_template_files
>   docs/sphinx: set navigation_with_keys=3DTrue
>   docs/sphinx: add 's' keyboard binding to focus search
>
>  docs/conf.py                  |  7 ++++++-
>  docs/meson.build              | 10 ----------
>  docs/sphinx-static/custom.js  |  9 +++++++++
>  docs/sphinx/depfile.py        | 19 +++++++++++++++++--
>  tests/qapi-schema/meson.build |  6 ++++--
>  5 files changed, 36 insertions(+), 15 deletions(-)
>  create mode 100644 docs/sphinx-static/custom.js
>
> --
> 2.33.0.721.g106298f7f9
>
>
The javascript blurb selecting the correct DOM node being any better
probably requires the search input box itself being given an 'id'
parameter, but I don't know if that's something the theme we're using
allows us to customize in any way. I'm not a webdev at all, so ... I'll
assume it's fine?

Reviewed-by: John Snow <jsnow@redhat.com>

--0000000000002ee9e505cf47e990
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 15, 2021 at 6:57 AM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Hi,<br>
<br>
I have collected a few Sphinx-related improvements to improve depfile gener=
ation<br>
and add some keyboard navigation. Hope you&#39;ll like it.<br>
<br>
v2:<br>
=C2=A0- fix test &#39;output:&#39; regression<br>
=C2=A0- fix javascript indentation (Paolo)<br>
=C2=A0- split &quot;meson: remove explicit extensions dependency file list&=
quot; (Paolo)<br>
<br>
Marc-Andr=C3=A9 Lureau (8):<br>
=C2=A0 docs/sphinx: add loaded modules to generated depfile<br>
=C2=A0 docs/sphinx: add static files to generated depfile<br>
=C2=A0 docs/sphinx: add templates files to generated depfile<br>
=C2=A0 tests/qapi-schema/meson: add depfile to sphinx doc<br>
=C2=A0 meson: drop sphinx_extn_depends<br>
=C2=A0 meson: drop sphinx_template_files<br>
=C2=A0 docs/sphinx: set navigation_with_keys=3DTrue<br>
=C2=A0 docs/sphinx: add &#39;s&#39; keyboard binding to focus search<br>
<br>
=C2=A0docs/conf.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 7 ++++++-<br>
=C2=A0docs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10=
 ----------<br>
=C2=A0docs/sphinx-static/custom.js=C2=A0 |=C2=A0 9 +++++++++<br>
=C2=A0docs/sphinx/depfile.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 ++++++++++++++=
+++--<br>
=C2=A0tests/qapi-schema/meson.build |=C2=A0 6 ++++--<br>
=C2=A05 files changed, 36 insertions(+), 15 deletions(-)<br>
=C2=A0create mode 100644 docs/sphinx-static/custom.js<br>
<br>
-- <br>
2.33.0.721.g106298f7f9<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">The javascript blurb selecting the correct DOM node being any b=
etter probably requires the search input box itself being given an &#39;id&=
#39; parameter, but I don&#39;t know if that&#39;s something the theme we&#=
39;re using allows us to customize in any way. I&#39;m not a webdev at all,=
 so ... I&#39;ll assume it&#39;s fine?</div><div class=3D"gmail_quote"><br>=
</div><div class=3D"gmail_quote">Reviewed-by: John Snow &lt;<a href=3D"mail=
to:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote"><div>=C2=A0</div></div></div>

--0000000000002ee9e505cf47e990--


