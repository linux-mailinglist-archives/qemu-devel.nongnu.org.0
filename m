Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B266185BF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:06:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdem-0003e7-NQ; Thu, 03 Nov 2022 13:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqdee-0003ND-Lw
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:05:29 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqdeb-00082v-Uc
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:05:23 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-367b8adf788so21638887b3.2
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 10:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=utSqaWrXa74qv6Xd9dag8ZDQZ6o4eq2VkKEZyvYTRKo=;
 b=i4Gwismq+uf8XCajVB0GuFowb/QILpyRDpIhXax/LHUR317LsdhO/6eYh/HkE+c8Q3
 kfH88GphsEM5aVY4O0ZGVTWFHt3P8XEfrlQOiqyOh78NYfVT1quOK5eEDogYvzQf5cYV
 TrZ3Vk4SGwXSLEdoU1tDKnS8W/OUi3uSHTAk2mhOhdsUHSD0jbjbDLzKAJ9aQhn7gjpJ
 rwcbJJG5h1ghe5qwoKpiscEPYDSKYNQeUmkDLNxwYwHNn+vfe3hxawsMENSUSg9QP6tv
 sA36AZRJqeDRUoOhFUc0oXjF8ckeeDbYL5i9X8+weyF7Lxl6rKPn65izvgfpMieZ1sq3
 HQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=utSqaWrXa74qv6Xd9dag8ZDQZ6o4eq2VkKEZyvYTRKo=;
 b=PM4/AywnmsiK3r7Nc8pBmbcu0r/QPdILm7s/WCmNrS9QNYv2IQF5apLk82lCmIILBX
 EENd58klbSB2Xl159NGv7NSZIZRBX0q080/5QSQtBGSZci8Etej4Le+9rGthMElJeMQU
 vLY5drjLnXzYL6tDrX8jGLQ3Wlb7qpb7wSNvREKUZtHR9gmeUgu7Qno1+X7Tj6WriGNU
 qDxqon/Cv/foF5XFXXuYyEL5Lvud7vZ5RbQupYgQDaR2cZhcbglUrqDMwBnf0OVzvuum
 jJToXGE+YlLNHF9lQqTdnPCBL5fLhFQIbsIh5pBMav3xCP2FtsCBqwyjX5BwFkLXS9Yx
 3Kxw==
X-Gm-Message-State: ACrzQf15j7MVeTTyF2wUkINzTlnm6baCNQcJTBBKe/mQmdAeaNempeKD
 dk+/CGRS1XzUET3aYSf2xS6+EjKUfqdFoEPJRSg=
X-Google-Smtp-Source: AMsMyM5RBo1O7v8HkNnZj4C+bqIvdh0TnzP+3/4zYwFLnOzDYMsH4yONyYU+ds+rt2BeN+eZSTdMM2d+9TRqaqQwyhY=
X-Received: by 2002:a81:8445:0:b0:36c:c302:8926 with SMTP id
 u66-20020a818445000000b0036cc3028926mr30848917ywf.296.1667495120597; Thu, 03
 Nov 2022 10:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAJSP0QXxO_1WYL-FUZrRFOE9guOEVVr9Ss2jubkdHvAMwPwZqA@mail.gmail.com>
 <Y2Plai60TK1kErl5@redhat.com>
 <CAJSP0QUk4iWY6B7-oxjLtW22OMyAfR-KH7M6QMmQVjvOhwQ+nQ@mail.gmail.com>
 <Y2Pui+kYDyJ1Rgja@redhat.com>
 <CAFEAcA_BEUTWEeTOgeHR9Sy_XOCJ=ckM=ki3c9sSuAMT_emL1w@mail.gmail.com>
 <Y2Pw/1xXSdpXLVfz@redhat.com>
In-Reply-To: <Y2Pw/1xXSdpXLVfz@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 3 Nov 2022 13:05:07 -0400
Message-ID: <CAJSP0QX9PCMpwEJYtJSgTN-OuELE4F50JXp_cS1ouQcgEwzr6A@mail.gmail.com>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000053f67105ec93f64e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000053f67105ec93f64e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 3, 2022, 12:49 Daniel P. Berrang=C3=A9 <berrange@redhat.com> wr=
ote:

> On Thu, Nov 03, 2022 at 04:47:03PM +0000, Peter Maydell wrote:
> > On Thu, 3 Nov 2022 at 16:38, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
> wrote:
> > > On Thu, Nov 03, 2022 at 12:25:49PM -0400, Stefan Hajnoczi wrote:
> > > > 2. The GitLab output does not contain the full command lines becaus=
e
> > > > environment variables are hidden (e.g. $QEMU_CONFIGURE_OPTS).
> > >
> > > Note, $QEMU_CONFIGURE_OPTS is set by the container image itself, so
> > > there's no need to know that one.
> > >
> > > $CONFIGURE_ARGS meanwhile is set in the build-XXXXX template and
> > > easy to find.
> >
> > Not all that easy if you're looking at some specific gitlab
> > job output... it would be helpful if the scripts
> > echoed the exact configure command line before running it,
> > then you wouldn't need to go ferreting around in the gitlab
> > config files and hoping you've found the right bit.
>
> That's easy enough to do, I'll send a patch.
>

Awesome, thank you!

Stefan

>

--00000000000053f67105ec93f64e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Nov 3, 2022, 12:49 Daniel P. Berrang=C3=A9 &lt;<a href=
=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Thu, Nov 03, 2022 at 04:47:03PM +0000, P=
eter Maydell wrote:<br>
&gt; On Thu, 3 Nov 2022 at 16:38, Daniel P. Berrang=C3=A9 &lt;<a href=3D"ma=
ilto:berrange@redhat.com" target=3D"_blank" rel=3D"noreferrer">berrange@red=
hat.com</a>&gt; wrote:<br>
&gt; &gt; On Thu, Nov 03, 2022 at 12:25:49PM -0400, Stefan Hajnoczi wrote:<=
br>
&gt; &gt; &gt; 2. The GitLab output does not contain the full command lines=
 because<br>
&gt; &gt; &gt; environment variables are hidden (e.g. $QEMU_CONFIGURE_OPTS)=
.<br>
&gt; &gt;<br>
&gt; &gt; Note, $QEMU_CONFIGURE_OPTS is set by the container image itself, =
so<br>
&gt; &gt; there&#39;s no need to know that one.<br>
&gt; &gt;<br>
&gt; &gt; $CONFIGURE_ARGS meanwhile is set in the build-XXXXX template and<=
br>
&gt; &gt; easy to find.<br>
&gt; <br>
&gt; Not all that easy if you&#39;re looking at some specific gitlab<br>
&gt; job output... it would be helpful if the scripts<br>
&gt; echoed the exact configure command line before running it,<br>
&gt; then you wouldn&#39;t need to go ferreting around in the gitlab<br>
&gt; config files and hoping you&#39;ve found the right bit.<br>
<br>
That&#39;s easy enough to do, I&#39;ll send a patch.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Awesome, thank you!</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Stefan</div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000053f67105ec93f64e--

