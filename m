Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC99324D24
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:47:21 +0100 (CET)
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDEu-0004VJ-Jw
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFDDg-00043U-0k
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:46:04 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFDDd-0007Xe-45
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:46:03 -0500
Received: by mail-ej1-x632.google.com with SMTP id jt13so7786665ejb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 01:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MIRAgUd+w5/Egv5Sz0ckLw370GRfXh8/sBZ/SwfJLZY=;
 b=JsA7fISpOog9DCdVw8ejll+3siK1dWJDAsbGLJvqn6lOd8O5f5384MlY3t1bZS94Jq
 UtB9641BE10EceZDeuDPkcwdp4/donyz9eOQXpKtsd0rNuDSbi+JYlE9hB1VTQkbWJhh
 u0utJaSrienxE9pcvytFYVhx9Hj1vVlLolPeKvFiyLP8yMox+uQi8JJvW0DFsfodMMXH
 CcBgkyd3l+9zmlWc1i7DDx9wkDmihib252WoFCn897YV5GHE7mUjDU0Un0q676XP1gm2
 zgzdoaJGujGBd57QvBG4b6EJ/NeaANOXWrSOq12iov6WnzTm4LV4fuM6N/54k2vRDWZr
 79BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MIRAgUd+w5/Egv5Sz0ckLw370GRfXh8/sBZ/SwfJLZY=;
 b=sHCg1esdZ2kmSf7jcp0mTzfb3Qav639O+l6pP5UVOfFkNsBRrATzTXzuG5YgMO90ir
 eG1aqmDo3CW3+otU8pgmUSGiY+kdlbh8yW87yMgVNWnBHOHHAfB+YSEvxX6wqz+jb8t5
 gNRcNJhHaFAvfFxC8NLXm2TyupP32Wwx9CsZy5zhZ1nTCRe9tsj15Gg7q0jT6muvxvjS
 lsICxH1PdjvVlzK8/H4nbB5KxCM2H7EFtsOPQcJEBu1+C8tB5BZImm6GGFt8k2cmzTwg
 MABH+6yzKUb4NiQk36saSpMUJDhnkkUpylZvBJ4KMcUxcTD3iQyovExDbFJN9kKbzXDY
 /njA==
X-Gm-Message-State: AOAM532A0dK5kcQUn5eXaodY8B+ad1l8bla+UZMHY0PmWfYoaCpinWcB
 uCUT4maKHtTqauKU1tj3FdDeQuG014Kh86BtkkE=
X-Google-Smtp-Source: ABdhPJz4lFlB4fsYlC5Zkceb5ycK3VBPS6GnblSmFTQ0DwXw0G0HZLBo9Mr7c27S2lJDRKoLS3YRxgSH6bPq+d2F3M8=
X-Received: by 2002:a17:906:fa0e:: with SMTP id
 lo14mr1807728ejb.263.1614246359123; 
 Thu, 25 Feb 2021 01:45:59 -0800 (PST)
MIME-Version: 1.0
References: <20210224110656.5pctwd7hdpvqi2na@sirius.home.kraxel.org>
 <20210225013609.73388-1-akihiko.odaki@gmail.com>
 <20210225013609.73388-3-akihiko.odaki@gmail.com>
 <20210225091049.npg2w7yacxel2cyz@sirius.home.kraxel.org>
In-Reply-To: <20210225091049.npg2w7yacxel2cyz@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 25 Feb 2021 18:45:48 +0900
Message-ID: <CAMVc7JUrsB9QVfkHJNtuOViGJrBnRGcVV4DathRFRneFdvzhkg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] virtio-gpu: Do not distinguish the primary console
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: qemu Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B42=E6=9C=8825=E6=97=A5(=E6=9C=A8) 18:11 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
> > -        if (m->scanout_id =3D=3D 0 && m->width =3D=3D 0) {
> > +        if (m->width =3D=3D 0) {
> >              s->ds =3D qemu_create_placeholder_surface(640, 480,
> >                                                      "Guest disabled di=
splay.");
> >              dpy_gfx_replace_surface(con, s->ds);
>
> Just call dpy_gfx_replace_surface(con, NULL) here and let console.c
> create the placeholder?

I'll change according to this and the comments in the other replies
and submit a new version.

>
> >      for (i =3D 0; i < g->conf.max_outputs; i++) {
> >          g->scanout[i].con =3D
> >              graphic_console_init(DEVICE(g), i, &virtio_gpu_ops, g);
> > -        if (i > 0) {
> > -            dpy_gfx_replace_surface(g->scanout[i].con, NULL);
> > -        }
>
> I think we should call dpy_gfx_replace_surface(..., NULL)
> unconditionally here instead of removing the call.

graphic_console_init will set a placeholder anyway so it does not need
an additional call.

>
> > +    /* primary head */
>
> Comment can go away as we remove the special case for scanout =3D=3D 0,
>
> > +    ds =3D qemu_create_placeholder_surface(scanout->width  ?: 640,
> > +                                         scanout->height ?: 480,
> > +                                         "Guest disabled display.");
> >      dpy_gfx_replace_surface(scanout->con, ds);
>
> likewise "dpy_gfx_replace_surface(..., NULL);"
>
> take care,
>   Gerd
>

