Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3544444B0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:33:58 +0100 (CET)
Received: from localhost ([::1]:43746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIGz-00044x-IZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miIDZ-0005lG-4f
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miIDW-0003Ed-Lx
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635953422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wYprP1yN5UMPkW+SR9gZo4iIeTUi7AxA3GWMYynjxi0=;
 b=EgOWFWoty8C/t/n7p/tXgW628DssnbWwEI+RkJDYQFZZY60gXvsnokahFvSLBciJg1VEl1
 Mml6FMNp+KomTOfBsiOh0qaD5wFn0FV74f1j/N2veJV8s3Jk7uUm/Dvv58xMLC01ogBZej
 3WNTy1qdmD3lSRMuxMIm9t9V4hLAK8U=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-4NLEniFJPPKmwjuJp1u8qQ-1; Wed, 03 Nov 2021 11:30:20 -0400
X-MC-Unique: 4NLEniFJPPKmwjuJp1u8qQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 p144-20020a1fbf96000000b002eb82e0e8cfso1058544vkf.18
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wYprP1yN5UMPkW+SR9gZo4iIeTUi7AxA3GWMYynjxi0=;
 b=pU3x3U6jbsMH6X6MAxa8dJV1tWRreke08JE6VO/ZQ9+UvkkP2BJ+xkMSW0TUJC75yW
 MQ111t06OLfZnPZuHTSl7qitxAzhMq34UJbYJWAWBNfKWMqSnxDBK65NrQQJGq18+wTk
 VI66c0rfPEpXU3coFW/PC5kZ64dyTB5T0APCMJhWr35hifzgLjEialamuWcWNwHs9L3X
 vMHZa5psHL9tyG7Mp1ItXsbb3zdpnDhEQB1tGtB+F9/ZGjDgo1M+guXsGDSnl8d5S6NL
 FYwj+wR3INtwPCJtelctZCaYU3aLWAlHr7PkQXP0uGylwUH126rbI+zjp/87eHl/mX4G
 2XEQ==
X-Gm-Message-State: AOAM530MHo8W4mQwxl2lNKrCBUpp/YxPJRxCfSpF5J646VhBHFMKMzyI
 No75xnRRKV0IWPGfpkz8tPVOeSNq1PDr0mYfoz9/CyI9koxjw6mM6dwW6xytr7bNwsNRn9jLo6c
 U5rgumfLMYup+hZFu5JcGLqC5eqO7sv0=
X-Received: by 2002:a05:6102:e0d:: with SMTP id
 o13mr35103817vst.13.1635953420183; 
 Wed, 03 Nov 2021 08:30:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3nWrk9TCgJdcVYaMcBVDAADz/5DHJM+WifNADHF4+dEGZdbr2RD0fxqWpHQwA4Wuwp/jilMnos/YC3GCbshc=
X-Received: by 2002:a05:6102:e0d:: with SMTP id
 o13mr35103792vst.13.1635953420047; 
 Wed, 03 Nov 2021 08:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-3-jsnow@redhat.com>
 <YYKjqVGr4QxB6wax@redhat.com>
In-Reply-To: <YYKjqVGr4QxB6wax@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 3 Nov 2021 11:30:09 -0400
Message-ID: <CAFn=p-bwq0Qwr5+SC1xdRK-nA2b5BuyRcisXxqNZsEBjJzBXGA@mail.gmail.com>
Subject: Re: [PATCH 2/6] ui/clipboard: Don't use g_autoptr just to free a
 variable
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000078ad5105cfe4167a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000078ad5105cfe4167a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2021 at 10:59 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Nov 03, 2021 at 10:48:40AM -0400, John Snow wrote:
> > Clang doesn't recognize that the variable is being "used" and will emit
> > a warning:
> >
> >   ../ui/clipboard.c:47:34: error: variable 'old' set but not used
> [-Werror,-Wunused-but-set-variable]
> >       g_autoptr(QemuClipboardInfo) old =3D NULL;
> >                                  ^
> >   1 error generated.
> >
> > OK, fine. Just do things the old way.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  ui/clipboard.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/ui/clipboard.c b/ui/clipboard.c
> > index d7b008d62a..d53576b0f6 100644
> > --- a/ui/clipboard.c
> > +++ b/ui/clipboard.c
> > @@ -44,13 +44,14 @@ void qemu_clipboard_peer_release(QemuClipboardPeer
> *peer,
> >
> >  void qemu_clipboard_update(QemuClipboardInfo *info)
> >  {
> > -    g_autoptr(QemuClipboardInfo) old =3D NULL;
> > +    QemuClipboardInfo *old =3D NULL;
> >      assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
> >
> >      notifier_list_notify(&clipboard_notifiers, info);
> >
> >      old =3D cbinfo[info->selection];
> >      cbinfo[info->selection] =3D qemu_clipboard_info_ref(info);
> > +    g_free(old);
> >  }
>
> Surely the right answer here is to get rid of the variable
> entirely as it isn't adding value
>
>    g_free(cbinfo[info->selection]);
>

Alrighty, I'll clean it up.

Respin pending comments on 1/6 and 6/6.

--js

--00000000000078ad5105cfe4167a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 10:59 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Nov 03, 2021 at 10:48:40AM -0400, John Snow wrote:<br>
&gt; Clang doesn&#39;t recognize that the variable is being &quot;used&quot=
; and will emit<br>
&gt; a warning:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0../ui/clipboard.c:47:34: error: variable &#39;old&#39; set=
 but not used [-Werror,-Wunused-but-set-variable]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_autoptr(QemuClipboardInfo) old =3D NULL;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt;=C2=A0 =C2=A01 error generated.<br>
&gt; <br>
&gt; OK, fine. Just do things the old way.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ui/clipboard.c | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/ui/clipboard.c b/ui/clipboard.c<br>
&gt; index d7b008d62a..d53576b0f6 100644<br>
&gt; --- a/ui/clipboard.c<br>
&gt; +++ b/ui/clipboard.c<br>
&gt; @@ -44,13 +44,14 @@ void qemu_clipboard_peer_release(QemuClipboardPeer=
 *peer,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void qemu_clipboard_update(QemuClipboardInfo *info)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 g_autoptr(QemuClipboardInfo) old =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 QemuClipboardInfo *old =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(info-&gt;selection &lt; QEMU_CLIPBOARD_SELE=
CTION__COUNT);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 notifier_list_notify(&amp;clipboard_notifiers, inf=
o);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 old =3D cbinfo[info-&gt;selection];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cbinfo[info-&gt;selection] =3D qemu_clipboard_info=
_ref(info);<br>
&gt; +=C2=A0 =C2=A0 g_free(old);<br>
&gt;=C2=A0 }<br>
<br>
Surely the right answer here is to get rid of the variable<br>
entirely as it isn&#39;t adding value<br>
<br>
=C2=A0 =C2=A0g_free(cbinfo[info-&gt;selection]);<br></blockquote><div><br><=
/div><div>Alrighty, I&#39;ll clean it up.</div><div><br></div><div>Respin p=
ending comments on 1/6 and 6/6.</div><div><br></div><div>--js<br></div></di=
v></div>

--00000000000078ad5105cfe4167a--


