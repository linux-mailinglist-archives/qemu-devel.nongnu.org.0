Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA21946D6EF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 16:24:49 +0100 (CET)
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muyoK-0007s4-S1
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 10:24:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muyme-0006T4-R4
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 10:23:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muymc-0003LH-KS
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 10:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638976982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gqfW8siDCAHgMzorf2E5z9h68ygHNUKLTSUt1+c5yoY=;
 b=I0TEVFvKfasRKMiT+b+aTInJdxYzr9Z1zVgqhDdA/0dAzO+y2c42iIkcz7xJKV21JXNBRV
 fnEVhu7QDQFL46CanSWZ02x+0Sx9v2TNoTuL+KHSroF7WoAbJCA4YrI0Pf6ZAcjeUgSWOQ
 3mOQ649m/eGvzn4qx3iMFa1M0Bc9PFY=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-QwRokEr7M6GkT5bumROz4Q-1; Wed, 08 Dec 2021 10:22:58 -0500
X-MC-Unique: QwRokEr7M6GkT5bumROz4Q-1
Received: by mail-vk1-f200.google.com with SMTP id
 s12-20020a1ff40c000000b002fa86937165so1345551vkh.8
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 07:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gqfW8siDCAHgMzorf2E5z9h68ygHNUKLTSUt1+c5yoY=;
 b=2mvfmyU0fJrgHSWItKc18vDQut3aRJtU9SDQ4Sbhuw097cgfYv+/NGJcrmCMwC7iCT
 Li+JjeDv2/Zfpsl7n7WCGp4l35s2FzpJ2aYDY1N3MCdZd3jm3QwAueFPzHvgAjVzVoSp
 slfhTtJ94b+D/gm5sz+MFcH5RS2Lbf8IC5IIcww1fgCHOcPQ2jJy4s2334KwiXP7kJD9
 uFZPVKJ3W9iPSEdW2+CE8AnUK0PjXV4AmIQRoXiQv7rJEtNeRcExtfa8LAG5Qp1mHoof
 VeE+icvpArNvHG5muutwpjM9ftwZtxsWZH3L0h1NTDoFtoq/yJ6lssiO4D9uIei6RUeX
 9z6A==
X-Gm-Message-State: AOAM533YdZUDxNnRPFVuHjRMgBluanZN6i7rh0FTO2++FcHJLjqlLAjd
 H34IEt/NVsLVqTrg8StKw2AHVlNWjJlVG2cfmDlbxoOtu7jdnYn/CBjBK9yn0uYqWUIqWs4ILRO
 5pd09CgzTuHbldSLnIEIX16PKA1wF8/E=
X-Received: by 2002:a67:d78c:: with SMTP id q12mr55351597vsj.35.1638976977451; 
 Wed, 08 Dec 2021 07:22:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJys4nrrb4qIc5RWSALoxiMMT/g2mfdDV1eK8As1n3Fo2kkg+ZBk9Tmzl3cTH6iavLGWVyOk6fri0wCWzolunNc=
X-Received: by 2002:a67:d78c:: with SMTP id q12mr55351562vsj.35.1638976977191; 
 Wed, 08 Dec 2021 07:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20211207204038.664133-1-jsnow@redhat.com>
 <20211207204038.664133-3-jsnow@redhat.com>
 <YbB2qS8bpHlYccvP@redhat.com>
In-Reply-To: <YbB2qS8bpHlYccvP@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 8 Dec 2021 10:22:47 -0500
Message-ID: <CAFn=p-ZWtbggrGCVR4oxJsDH6TmDZHMzFPyR6ukni8QwjVKZMg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ui/clipboard: Don't use g_autoptr just to free a
 variable
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000855ff005d2a4109b"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000855ff005d2a4109b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 8, 2021, 4:11 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:

> On Tue, Dec 07, 2021 at 03:40:38PM -0500, John Snow wrote:
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
> >  ui/clipboard.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/ui/clipboard.c b/ui/clipboard.c
> > index d7b008d62a..9ab65efefb 100644
> > --- a/ui/clipboard.c
> > +++ b/ui/clipboard.c
> > @@ -44,12 +44,11 @@ void qemu_clipboard_peer_release(QemuClipboardPeer
> *peer,
> >
> >  void qemu_clipboard_update(QemuClipboardInfo *info)
> >  {
> > -    g_autoptr(QemuClipboardInfo) old =3D NULL;
> >      assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
> >
> >      notifier_list_notify(&clipboard_notifiers, info);
> >
> > -    old =3D cbinfo[info->selection];
> > +    g_free(cbinfo[info->selection]);
>
> This is a ref counted data type - it can't use g_free:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg04890.html
>
> >      cbinfo[info->selection] =3D qemu_clipboard_info_ref(info);
> >  }
>
> Regards,
> Daniel
>

Whoops, sorry. I saw free being used elsewhere and assumed it was safe.
That's what I get for assuming things...

--000000000000855ff005d2a4109b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Dec 8, 2021, 4:11 AM Daniel P. Berrang=C3=A9 &=
lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Tue, Dec 07, 2021 at 03:40:38P=
M -0500, John Snow wrote:<br>
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
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ui/clipboard.c | 3 +--<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/ui/clipboard.c b/ui/clipboard.c<br>
&gt; index d7b008d62a..9ab65efefb 100644<br>
&gt; --- a/ui/clipboard.c<br>
&gt; +++ b/ui/clipboard.c<br>
&gt; @@ -44,12 +44,11 @@ void qemu_clipboard_peer_release(QemuClipboardPeer=
 *peer,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void qemu_clipboard_update(QemuClipboardInfo *info)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 g_autoptr(QemuClipboardInfo) old =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(info-&gt;selection &lt; QEMU_CLIPBOARD_SELE=
CTION__COUNT);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 notifier_list_notify(&amp;clipboard_notifiers, inf=
o);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 old =3D cbinfo[info-&gt;selection];<br>
&gt; +=C2=A0 =C2=A0 g_free(cbinfo[info-&gt;selection]);<br>
<br>
This is a ref counted data type - it can&#39;t use g_free:<br>
<br>
=C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg=
04890.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.g=
nu.org/archive/html/qemu-devel/2021-11/msg04890.html</a><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cbinfo[info-&gt;selection] =3D qemu_clipboard_info=
_ref(info);<br>
&gt;=C2=A0 }<br>
<br>
Regards,<br>
Daniel<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Whoops, sorry. I saw free being used elsewhere and assumed it was saf=
e. That&#39;s what I get for assuming things...</div><div dir=3D"auto"><br>=
</div></div>

--000000000000855ff005d2a4109b--


