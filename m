Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241E24C0011
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:24:38 +0100 (CET)
Received: from localhost ([::1]:56932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYtw-0007nv-Q8
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:24:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMYlM-0005Mq-JL
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:15:44 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=38868
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMYlK-0006p7-VD
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:15:44 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id y6so42606121ybc.5
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LZ4MHhWIw47wDrXE1AI/xQ7AlaFbvYjaKxAdjg6OhNc=;
 b=F651ahFw+Znk9lIXXmY/LRHtzpR2sAPNNCF237FxJ+RVhRJ3SmTfx02GYWo/AdzdQ0
 1y4ZP/7z5zkpE2gF797S+hR5wM6glMhD17uwTzAmE2mqYIHth0aymG7ckJB40SX+rYz+
 NK5cuFI+CFdIwtHQzGRGKmp6foX/FRvkfukS45EylyiDuxFMFMbd5OiS0dpVTbEDKkjN
 yFCRPpJcBKnf8Qdje92juTHCTeGxnmWaXYylly7GP7tGaSeRebtGEdONsUOJPrSkOYE+
 /+l1iGeA1NzM705GQbP/7KQzG7lpswXlZo1yvZkpgI2YgY+VKD1qUSMVe1LHI0YMpHCp
 nXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LZ4MHhWIw47wDrXE1AI/xQ7AlaFbvYjaKxAdjg6OhNc=;
 b=wmkMMXqvmfsYNUNWu7VJQyt14BwLYxUhExg8+w4dYMcLSj0oX9XOsgE58cL+jz7E39
 BnLZTGVRQPCK4d0c6fCiE8RLhDRjB+XdJwKC/anQYcFi7jpZmUchyiu25fRa+u8Mx9pd
 iEgtDRTeAy4y1KtXxdsc3fjsR5scrsc0ZExkGEjEs7eUeLbkfBPzhVUvkoon+hSsfI6M
 8gjPJU6kj6MD8xRp1u7KgxhfD1hgZF41OEQvUboO+iv34FinIM0X/Rqn1+Of9H1RKyw2
 BZLAcCV1r7G2CuUFRKrKyueAmKZSzKpkvyeLs9j/KUuRFjxoEiApcozyAXmM8gEozUoN
 G8kQ==
X-Gm-Message-State: AOAM530khMcFsgeMlNH3q9pxzuRikQlusTBFFy3R9nulYSP2YFaf0Z1n
 8JpFOjLeKUNi+tcBd0xwt/+pX7lxY7yuEnd7CWiTIQ==
X-Google-Smtp-Source: ABdhPJx9uFMwCF8572uKPhYnNDroWzI+GzLIAxR+ksC5KgM8kBS0sli6kkZQGAca3x7MQRqk5LYY3ODGu0ZS2zWs74g=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr23771877ybs.140.1645550133668; Tue, 22
 Feb 2022 09:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20220222170645.860661-1-peter.maydell@linaro.org>
 <20220222170645.860661-2-peter.maydell@linaro.org>
 <CAMVc7JXkQo4XYhuYHN91h7Sr+60HQkp4gKQSH=QH=yg3JSjz3g@mail.gmail.com>
In-Reply-To: <CAMVc7JXkQo4XYhuYHN91h7Sr+60HQkp4gKQSH=QH=yg3JSjz3g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 17:15:22 +0000
Message-ID: <CAFEAcA_-tP_ecJtUx3BNwUGEGHTZ_tYv=YC65_paCucD_ryjOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ui/cocoa.m: Fix updateUIInfo threading issues
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Feb 2022 at 17:13, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> On Wed, Feb 23, 2022 at 2:06 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index a8f1cdaf926..f8d3d8ad7a6 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -522,8 +522,9 @@ QemuCocoaView *cocoaView;
> >      }
> >  }
> >
> > -- (void) updateUIInfo
> > +- (void) doUpdateUIInfo
>
> You may add the suffix "Locked" to align with handleEventLocked and
> make the intention more explicit.

Ah, good idea.

> > +    /* Now we're set up, tell the UI layer our initial window size */
> > +    dispatch_async(dispatch_get_main_queue(), ^{
> > +        [cocoaView updateUIInfo];
> > +    });
> >  }
>
> This is not necessary since register_displaychangelistener calls dpy_gfx_switch.

Cool, I'll drop this bit.

-- PMM

