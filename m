Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB4347992
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 14:28:35 +0100 (CET)
Received: from localhost ([::1]:37600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP3Yo-0002nr-V6
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 09:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lP3X1-0001RM-0X
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:26:43 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lP3Wy-0002dC-5w
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:26:42 -0400
Received: by mail-ed1-x536.google.com with SMTP id o19so27604366edc.3
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bl9ucfL6l/t3pMqigSkzt/vnlheC4DANmuefUauDnKo=;
 b=pS3JciqBss197ngwr8nqpY3FxJcBfI1PL5HJ7eCQKz2Ha7wkPkWo+PvcJpzCfXAAHQ
 r30mwSvpIqtZaLXB6f79hoLD3E0FyO/bq0iCPtw6/FgmYFmqxsH8f15EXlG58+QhBdR1
 u+FSK5BWpUTTF5I4thVA70q5ygIgYtp/za/6OJjI6U8TziTK91JsrcX27N6bgbPsaGMF
 V/7tQmFNUEgoxQosVDHmAv/80AF+AOD8t+2f7k/gaWlkTDtC4/VC+6LdIXsy2cTftsGQ
 zSwWhfYKZo12qZNIZq2RpSwINFdHnBO+THcOaYKYasdj6BQu+JvzuSYocRv+R/ZiJNK5
 bqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bl9ucfL6l/t3pMqigSkzt/vnlheC4DANmuefUauDnKo=;
 b=cf43egIrGVNbdozkdw43UDPw0hQqIAUQEbOHkbCTx9zCNhzSAUL018xMrugnJ6bUY/
 KSFjzNLrhYwsWYKRyZcVTcxO+/JtbA4KPyqRRAKfn7ukQ0svRSr5aG+uiEIHNCvKA0nv
 BuTXR5jltFnOQJaDqBn3wq3jnNVU3/IIn+JUI4Pd/Wj+WGzoEOgzBzQk/G+tSRdkgj/G
 A7CYP3izOtBsf2hE9zDYx6OXthlH5wKlDslKvobBsVHsq4i+ATtj/vXAg1vqUEkDSbfZ
 Q6qsvKIsdTWY9xlsUTWur749cYtSRYQYUnAqBh7CskRPo5DHp76c5X8tnSDpb8RQkf9w
 PUzA==
X-Gm-Message-State: AOAM530LrRubYFVNRnFBTEDhircVvFW2JuEP+KK1twlcC2Bhks+WPXWf
 pD7Cu8UBnGlVKOw12tA9xkEyTp+wfBybxDCbeYkrUF5GJsE=
X-Google-Smtp-Source: ABdhPJz9FU7SwISXtnetmItKu2KFkKFvDzKHGIOx6jQyIlyXhxkZ5ETD83AcpUeoDx1JY906EnKKoAGcq0kiKS9B9cA=
X-Received: by 2002:a05:6402:105a:: with SMTP id
 e26mr3474322edu.164.1616592396827; 
 Wed, 24 Mar 2021 06:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210318091647.3233178-1-kraxel@redhat.com>
 <20210318091647.3233178-8-kraxel@redhat.com>
 <CAJ+F1CJqhUX1vnbXOAo8adpkb=rNcJSzMpeGVQnTGT5UuuALJg@mail.gmail.com>
 <20210324101650.irnpfnklksfnejic@sirius.home.kraxel.org>
 <CAJ+F1C+HKdo_MK4rgw4pOpVzRnUu3Pu8O9YrjwFu8ZxGQCP+3A@mail.gmail.com>
 <20210324125743.zuivmbhje465bfne@sirius.home.kraxel.org>
In-Reply-To: <20210324125743.zuivmbhje465bfne@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 24 Mar 2021 17:26:24 +0400
Message-ID: <CAJ+F1CK9x_-ni0Qx6qZpWruBQwptbR-O26oUSvj0JgyBgk3vMQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ui/gtk: add clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008f3f2705be483f7e"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008f3f2705be483f7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 24, 2021 at 4:57 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > I fail to see how that works, imagine the other end is the same code
> (qemu
> > in the guest), it will take clipboard ownership and it is in a endless
> > loop, isn't it?
>
> Notifications on guest-triggered clipboard updates will not be sent back
> to the guest, exactly to avoid that kind of loop.  See self_update
> checks in vdagent_clipboard_notify().  gtk and vnc notify callbacks have
> simliar checks for simliar reasons ;)
>
>
That means the other side may have wrong clipboard expectations. It may ask
for what was previously an image and that will fails. This is not a big
issue per se if error returns are handled correctly all the way. It may
also have an impact on some UI aspects (since some actions shold become
unactive when clipboard has some content or another etc)

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008f3f2705be483f7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 4:57 PM Gerd Hoffmann=
 &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 Hi,<br>
<br>
&gt; I fail to see how that works, imagine the other end is the same code (=
qemu<br>
&gt; in the guest), it will take clipboard ownership and it is in a endless=
<br>
&gt; loop, isn&#39;t it?<br>
<br>
Notifications on guest-triggered clipboard updates will not be sent back<br=
>
to the guest, exactly to avoid that kind of loop.=C2=A0 See self_update<br>
checks in vdagent_clipboard_notify().=C2=A0 gtk and vnc notify callbacks ha=
ve<br>
simliar checks for simliar reasons ;)<br clear=3D"all"><br></blockquote><di=
v><br></div><div>That means the other side may have wrong clipboard expecta=
tions. It may ask for what was previously an image and that will fails. Thi=
s is not a big issue per se if error returns are handled correctly all the =
way. It may also have an impact on some UI aspects (since some actions shol=
d become unactive when clipboard has some content or another etc)<br></div>=
</div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9=
 Lureau<br></div></div>

--0000000000008f3f2705be483f7e--

