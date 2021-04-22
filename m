Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C23678BE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:32:32 +0200 (CEST)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZR0x-0007hy-QA
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lZQy7-0004UL-R8
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:29:35 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:35692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lZQy3-0004en-Kg
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:29:35 -0400
Received: by mail-yb1-xb31.google.com with SMTP id i4so12287999ybe.2
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 21:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zKGMc3HoAK7K3QejFF/LD4+BwMU89Ot7Ta4PMLaLQNE=;
 b=pI48ev+q1VZkSJT07OSU6MVVRkZQ91T+5KFqi3uu/ZaNbkTojlBP1jbK8HZkllvk+Q
 qtUp0PSqesMTwRw+YR3cT3DF9wDexqPz+tiIT3SqWCcD5gEcMd09T896iEvm8OPHkxKt
 qg83wuGAPQykjRip7UjinkSyKwOpIlOUKnMeFW5VaM7eSyLzUnBK711z6R4Ev4cQ+/NT
 ysKw1GmgJTYCbcLJdKrpy8Wl7/QeCfT5cQTcAC5fHBAjN/MW53JgHH6VND9XfvCKTI25
 zGe6qfQuqc1E68m2zf+XEP9mE7H4FojKSvXPHu4j29R1e47hOUUN7GU6OKVdBC3SvHkR
 E4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zKGMc3HoAK7K3QejFF/LD4+BwMU89Ot7Ta4PMLaLQNE=;
 b=IXPelpcjC+VDa2R+/UAj8O0ctP6J2pmPBexPvav+olEteEhHrQEX+EF9BN2Dj2Sxm7
 WPiJN9Lmf5LArGjV9RIUi3iK8aVkiJeGr1cpbeH7QEheZGbGKiL2itndThrbi19Behh6
 9ZZ5q/MHAR4dj7aNqd3DHU/lWUVoHe3hAtdS1spP0cL02uoz8E9qm2SpU4TWFvniIUuw
 hhJf6DXT+5VLIs5EPdrJYOgN8McB7rbwLRvOAiAWjqwYTgbtVekmJJk5kGCOc5ViW7RC
 KReo9h4zHtHocdYJpTi91uPBT5HV9mBy28LafAGSDQVH3lJgE7gVbST+iAVrGuyoiW47
 SrNA==
X-Gm-Message-State: AOAM533ftodNtVYWCO1kPfIJTJQiOpIGUFGBVoIGISKOQ1i5vXqDS4EJ
 8ri6fnG3lTQJ27FEMB7rdIPaz7p9DLQRzD1fjRQ=
X-Google-Smtp-Source: ABdhPJzeNJ7dxPFLRL8X5ctQR7ZiRQoz4t2+1O5PSEWIXvubuvlHWGEypKUWa+KUilnXZM7vWm08EGg2vCG45SXZkX0=
X-Received: by 2002:a25:5146:: with SMTP id f67mr1942922ybb.332.1619065768390; 
 Wed, 21 Apr 2021 21:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
 <fe1f97bc-5ff9-002b-debc-5bc2c449c8b8@redhat.com>
In-Reply-To: <fe1f97bc-5ff9-002b-debc-5bc2c449c8b8@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Apr 2021 12:29:17 +0800
Message-ID: <CAEUhbmXR1Yn5paL+d0DMjgZUiinQGNRazj3neScL4_=CGvC8zg@mail.gmail.com>
Subject: Re: [PATCH-for-6.0] net: tap: fix crash on hotplug
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 12:36 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Cc'ing Bin.
>
> On 4/21/21 5:22 PM, Cole Robinson wrote:
> > Attempting to hotplug a tap nic with libvirt will crash qemu:
> >
> > $ sudo virsh attach-interface f32 network default
> > error: Failed to attach interface
> > error: Unable to read from monitor: Connection reset by peer
> >
> > 0x000055875b7f3a99 in tap_send (opaque=3D0x55875e39eae0) at ../net/tap.=
c:206
> > 206           if (!s->nc.peer->do_not_pad) {
> > gdb$ bt
> >
> > s->nc.peer may not be set at this point. This seems to be an
> > expected case, as qemu_send_packet_* explicitly checks for NULL
> > s->nc.peer later.
> >
> > Fix it by checking for s->nc.peer here too. Padding is applied if
> > s->nc.peer is not set.
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1949786
> > Fixes: 969e50b61a2
> >
> > Signed-off-by: Cole Robinson <crobinso@redhat.com>
> > ---
> > * Or should we skip padding if nc.peer is unset? I didn't dig into it
> > * tap-win3.c and slirp.c may need a similar fix, but the slirp case
> >   didn't crash in a simple test.
> >
> >  net/tap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/tap.c b/net/tap.c
> > index dd42ac6134..937559dbb8 100644
> > --- a/net/tap.c
> > +++ b/net/tap.c
> > @@ -203,7 +203,7 @@ static void tap_send(void *opaque)
> >              size -=3D s->host_vnet_hdr_len;
> >          }
> >
> > -        if (!s->nc.peer->do_not_pad) {
> > +        if (!s->nc.peer || !s->nc.peer->do_not_pad) {

I think we should do:

if (s->nc.peer && !s->nc.peer->do_not_pad)

> >              if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
> >                  buf =3D min_pkt;
> >                  size =3D min_pktsz;
> >

And do the similar fix on tap-win32 and slirp codes.

Regards,
Bin

