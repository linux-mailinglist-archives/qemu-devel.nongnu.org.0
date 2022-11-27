Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB838639C6C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 19:41:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozMaB-0006OI-Q4; Sun, 27 Nov 2022 13:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozMa1-0006LU-0W
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:40:41 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozMZz-0003bE-4Z
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:40:40 -0500
Received: by mail-yb1-xb31.google.com with SMTP id j196so10861086ybj.2
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 10:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6MJINvQwOT6MP2LO7evGHThUACB2WDVfmnHyOLxzkSc=;
 b=TBTABdVwcpCJJ7t3hhBpWSZokhMbjbD29AZpIFDSsjS6EzVlHPf0JFvBssJMi7hwiX
 5XwRZQiYj3K3ZEe2eZx5b2jSYaT4AX1IlgaUo4IjagxTtVja3Ib4fcN9HtxToL22Dtn/
 LeDpMLzg2Bw6iy299JzDcP6r7olsE5Pz2LnI2ZLdmnSm+RqCNonr2JCAA7Q+n6QrSWQY
 bi6pbsGe2QHUDP+vEk3MRPw34iOhCACSCcP6FIMHBG9H9FkhTS82RBXQSSxA0pCxClRn
 BGabyxqQ8S815AJUcWXbBS2gCVqWJzcrKBvYEQZM9z6TkersuTESVFqvNKpSbl/mdlft
 7bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MJINvQwOT6MP2LO7evGHThUACB2WDVfmnHyOLxzkSc=;
 b=TD6i/x3+pqf3VE6OaJcitt8/U1bSOAI586UKJd92AE5JatckK51ZhT6JkPX/9075RJ
 p0XTAwusPBKZrUNs6hp4s8ZyGy/vrGRGvee9u0H2yZdg78OxrOeJC/dkjFoa7yY0mfwl
 iJk6vFVmXi3DVzzP27t9MSOYx4AxP/MdMQm2xSNHs4aO4nAnsDh7sWbiqHDipbQ1Z6CN
 Ze6sDcOdz9LBDUlN2PnDLsCqfeSEV3H089C6P2S/BT7yqoSnFHvciJHhdc4uXZCR3OAk
 wB7y+pJDP3DDAKq4Yw577xZ+PKS6/2fKPLp4OYqRkgye23iuK9nBOsVlFGMKECVsFs71
 CYWQ==
X-Gm-Message-State: ANoB5pmQ2tFgA71RE4b26ZRXkjZqjJAka7EJirGRx47jkHphfRtchAiB
 Z4irfC4h0RTotxXHzCKL37gPrKHLWsg3d/pvvFI=
X-Google-Smtp-Source: AA0mqf7UKRb//bfNQTUGlChzhoKpO9WDXA7/DjFOevEbC7eTVpA8lb2HF3g48iheY7zno6U9eCe+scitLy+hKg9YGLo=
X-Received: by 2002:a25:32d3:0:b0:6f3:3829:22ff with SMTP id
 y202-20020a2532d3000000b006f3382922ffmr10900775yby.366.1669574437613; Sun, 27
 Nov 2022 10:40:37 -0800 (PST)
MIME-Version: 1.0
References: <20221126152507.283271-1-sw@weilnetz.de>
 <20221126152507.283271-6-sw@weilnetz.de>
 <CAJSP0QVqm-BpgKpdD2p8F-k2s9yaE4gRrDPRSju7jKh20H1ExQ@mail.gmail.com>
In-Reply-To: <CAJSP0QVqm-BpgKpdD2p8F-k2s9yaE4gRrDPRSju7jKh20H1ExQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 27 Nov 2022 13:40:25 -0500
Message-ID: <CAJSP0QVf3h-c8ghb=9kjnxN6EVGi8KxahasSBBYPLFzvDGocXg@mail.gmail.com>
Subject: Re: [PATCH v3 for-7.2 5/6] MAINTAINERS: Add subprojects/libvhost-user
 to section "vhost"
To: "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 27 Nov 2022 at 13:09, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Sat, 26 Nov 2022 at 10:25, Stefan Weil <sw@weilnetz.de> wrote:
> >
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cf24910249..6966490c94 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2005,6 +2005,7 @@ F: docs/interop/vhost-user.rst
> >  F: contrib/vhost-user-*/
> >  F: backends/vhost-user.c
> >  F: include/sysemu/vhost-user-backend.h
> > +F: subprojects/libvhost-user/
>
> Requires agreement from Michael. Also including Marc-Andr=C3=A9 who
> originally created libvhost-user.

Stefan showed me the email where Michael agreed:
https://lore.kernel.org/qemu-devel/20221123015218-mutt-send-email-mst@kerne=
l.org/

Stefan

