Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFAC3333DA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 04:33:45 +0100 (CET)
Received: from localhost ([::1]:42218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJpbT-0008OW-RX
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 22:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJpZq-0007wl-55
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 22:32:02 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJpZl-0007n7-4V
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 22:32:01 -0500
Received: by mail-ej1-x633.google.com with SMTP id mm21so34693390ejb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 19:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mT+PfgykajyaJ6cM6VtVMeKq6nD7l24p6sUhzL4I27E=;
 b=nSelrU3T3p/KwS2Heujv1BZPVOKSR8h0psKGGL3STqFzrruv1n1xo9wuFznILSyRe7
 vxa7veC1AUlrayj8+TpYTgj9xUbz1OJyG8DN9X6OnvAWpXuQGfRWBEHkGX8IOJDpFVY2
 ZJQJGQfXioQ/n6NVStgNEMoLYxvwskMhOY+3LHPmWM46Ymvnj26ZAI620aF8C8wWvt2P
 o+N3tJJXxM6L4ooFHKC2oOXsBpcS/6JePeg+ZfZM0bFDzxM1E2CfQzboJ5V8rwdztfRW
 e1sS6u1P6gvT+1wgp9nUn2TtFQJ1MfjmlPjjRJSS4pOyS0Whmqo60WbeXoMHM1kZX1WQ
 sEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mT+PfgykajyaJ6cM6VtVMeKq6nD7l24p6sUhzL4I27E=;
 b=RcHmAotqaOkvFs1jFyXqYWcbEsVjSFxE2h/meZuKsAHXt48F6vGzmrKF9gssvLFQQt
 3maQ/3hVgZ4eWtEtWWIA1lYI3Sie2v9amWH0KY196+fCfguhZRr0/F4eXuLYweUECYK7
 0B7I1mQ7SSgyi9nIALuaKOixNxVadun+hIV2Btg43FExnp/Rqj7f2W7iPapXbXr/kcD8
 iwyEqfVYT3NblygzWsLPw61adJY5PpjXfa4tzijX8YANby2U/+votS67A6A9mugQ2IK4
 M/mAA55pLUAXGBFifPo6jWJwIqvKaQnExtAHXg90JMYXkF38YDaxmwFwuHl5IPzcBEWt
 rUgQ==
X-Gm-Message-State: AOAM533lXG3DcZzjZNsiQ4Qys8WOcy5w1JR4+TcsQv/wL9KgT+bO6vPl
 0rTOH7GByjBZybo5RX3Yo2LfXm5stjyPsuiBQwE=
X-Google-Smtp-Source: ABdhPJzF0twGQk32ipvmj/NjN+G9gWb/ps7mvNdh6OFjzRKgUOP4bfeHQHMvKalihebNBck69I7eLQdOLw84+ZiEa0g=
X-Received: by 2002:a17:906:b6cc:: with SMTP id
 ec12mr1293091ejb.520.1615347115523; 
 Tue, 09 Mar 2021 19:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20210309122226.23117-1-akihiko.odaki@gmail.com>
 <20210309122226.23117-2-akihiko.odaki@gmail.com>
 <30b88283-8d6b-502b-9032-33c81e26d97@eik.bme.hu>
In-Reply-To: <30b88283-8d6b-502b-9032-33c81e26d97@eik.bme.hu>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 10 Mar 2021 12:31:44 +0900
Message-ID: <CAMVc7JWO0o9NUwPaE6wBMG+u7zHocWDPxr-6o3OcS5Zm0oT+HA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ui/cocoa: Do not rely on the first argument
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=889=E6=97=A5(=E7=81=AB) 22:10 BALATON Zoltan <balaton@=
eik.bme.hu>:
>
> On Tue, 9 Mar 2021, Akihiko Odaki wrote:
> > The first argument of the executable was used to get its path, but it i=
s
> > not reliable because the executer can specify any arbitrary string. Use=
 the
> > interfaces provided by QEMU and the platform to get those paths.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > ---
> > ui/cocoa.m | 29 +++++++++++++++--------------
> > 1 file changed, 15 insertions(+), 14 deletions(-)
> >
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index d8eacea6d22..6e94301c0d6 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -1414,20 +1414,21 @@ - (void)make_about_window
> >     [superView addSubview: picture_view];
> >
> >     /* Make the name label */
> > -    x =3D 0;
> > -    y =3D y - 25;
> > -    int name_width =3D about_width, name_height =3D 20;
> > -    NSRect name_rect =3D NSMakeRect(x, y, name_width, name_height);
> > -    NSTextField *name_label =3D [[NSTextField alloc] initWithFrame: na=
me_rect];
> > -    [name_label setEditable: NO];
> > -    [name_label setBezeled: NO];
> > -    [name_label setDrawsBackground: NO];
> > -    [name_label setAlignment: NSTextAlignmentCenter];
> > -    NSString *qemu_name =3D [[NSString alloc] initWithCString: gArgv[0=
]
> > -                                            encoding: NSASCIIStringEnc=
oding];
> > -    qemu_name =3D [qemu_name lastPathComponent];
> > -    [name_label setStringValue: qemu_name];
> > -    [superView addSubview: name_label];
> > +    NSBundle *bundle =3D [NSBundle mainBundle];
> > +    if (bundle) {
>
> Does this break about window if the executable is not in a bundle (like
> when run from the command line after compiling)? Shouldn't you only put
> the qemu_name in this if and have some default name if bundle is not
> available (or fall back to argv[0] in that case?
>
> Regards,
> BALATON Zoltan
>

No, it just doesn't show the application name. Everything else is fine.

Regards,
Akihiko Odaki

