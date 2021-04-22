Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4CF367DEE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:44:01 +0200 (CEST)
Received: from localhost ([::1]:33142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVsO-0001cf-8Q
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lZVqr-00008r-NC
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:42:25 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:35591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lZVqp-0000ay-CQ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:42:25 -0400
Received: by mail-yb1-xb30.google.com with SMTP id i4so13108276ybe.2
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 02:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5hITLWBnPmSuinUVleVv9ni9I3Kflv2mk2/MFOo++8Q=;
 b=HFN1zbe6eXStdAMsV710pJRXLiW0j975jI2J8fg7k6uWlJG7OB8XPZII+cC2mn0q7v
 erwWv7tXGfX1wxuONx9pwDFXb7A/irFHh65KBfKpPwIMRdgu+klmYeYrcMYzBvcfO6KQ
 bOVe+dQOtkXBYFMDSStSSvlM8zWnRaXKftzAGy4imImyMC443iK4jDb8zv07aLctpED1
 hi4lsacbvmABELV6Bkyiv9z1B70UuDsEk5LnmNAghItIH5/ZaiVeI+pBZyNq2q7zLr6S
 K9gktXwWzMR5YFMeHzJMymvUx1Q6QD9LxCXyDZ4TfGq83oyCnLz/5FPaipJJLO85qi6K
 M7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5hITLWBnPmSuinUVleVv9ni9I3Kflv2mk2/MFOo++8Q=;
 b=qwUYb0GX6y+fjaL9dlAEyvXTUEcgvuxhPIBaPgpipfvbzZ+XB7Ld1uSSKaCpcH7ymI
 krfpdHOswI8OK2Rlw6lWsRZ/KqQvbBr8V9RKzCWfXSK1p4T2A4iQjlKNfiatKJ5dsIOZ
 Gj7wMxq4MT29KAJnEWw1cUCqof1OplaUj4oM+i7F/VkSJS6Vaden/UcB4UZlhbdAUIXT
 1FLWP8rTnObAZzHVS2nzgYxG4gzC8YV963+e7poV4OvPaDrIkDSm6haygPnp4XlLbHRp
 oSTBMShTmEKo922WoILlgGXxHZajDkVrSxXuuUP4vQWwkrm3u7/NWdUvuoE6vdRzkWGs
 iurQ==
X-Gm-Message-State: AOAM530pxB+ybm+3VcVLG+39+3noQ5NSY35wMn1IJKY5hSLZVdE3XHiR
 ggKy3le4S9zDTl0eV1uvh5t3Sqh4MGlgJBtigTc=
X-Google-Smtp-Source: ABdhPJzIHx+oc5v5w6idDajNCukVOQI6c34Vwa6G058Z8GPhkZETL7KjWDfYpPvirohnZy5jWouwi6lQEtndceHbvvI=
X-Received: by 2002:a25:42cd:: with SMTP id p196mr3472240yba.314.1619084542289; 
 Thu, 22 Apr 2021 02:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
 <fe1f97bc-5ff9-002b-debc-5bc2c449c8b8@redhat.com>
 <CAEUhbmXR1Yn5paL+d0DMjgZUiinQGNRazj3neScL4_=CGvC8zg@mail.gmail.com>
 <CAFEAcA_4TSF1KKxVQUDt3r+aAnZqT-A2uA8m7O0ZaxHQVWgKJg@mail.gmail.com>
In-Reply-To: <CAFEAcA_4TSF1KKxVQUDt3r+aAnZqT-A2uA8m7O0ZaxHQVWgKJg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Apr 2021 17:42:11 +0800
Message-ID: <CAEUhbmX-XvJ6ViPjTsiQ2GhmhwefTSbF_m1CRwzphf82SNQixA@mail.gmail.com>
Subject: Re: [PATCH-for-6.0] net: tap: fix crash on hotplug
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 5:36 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 22 Apr 2021 at 05:29, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Thu, Apr 22, 2021 at 12:36 AM Philippe Mathieu-Daud=C3=A9
> > <philmd@redhat.com> wrote:
> > >
> > > Cc'ing Bin.
> > >
> > > On 4/21/21 5:22 PM, Cole Robinson wrote:
> > > > Attempting to hotplug a tap nic with libvirt will crash qemu:
> > > >
> > > > $ sudo virsh attach-interface f32 network default
> > > > error: Failed to attach interface
> > > > error: Unable to read from monitor: Connection reset by peer
> > > >
> > > > 0x000055875b7f3a99 in tap_send (opaque=3D0x55875e39eae0) at ../net/=
tap.c:206
> > > > 206           if (!s->nc.peer->do_not_pad) {
> > > > gdb$ bt
> > > >
> > > > s->nc.peer may not be set at this point. This seems to be an
> > > > expected case, as qemu_send_packet_* explicitly checks for NULL
> > > > s->nc.peer later.
> > > >
> > > > Fix it by checking for s->nc.peer here too. Padding is applied if
> > > > s->nc.peer is not set.
> > > >
> > > > https://bugzilla.redhat.com/show_bug.cgi?id=3D1949786
> > > > Fixes: 969e50b61a2
> > > >
> > > > Signed-off-by: Cole Robinson <crobinso@redhat.com>
> > > > ---
> > > > * Or should we skip padding if nc.peer is unset? I didn't dig into =
it
> > > > * tap-win3.c and slirp.c may need a similar fix, but the slirp case
> > > >   didn't crash in a simple test.
> > > >
> > > >  net/tap.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/net/tap.c b/net/tap.c
> > > > index dd42ac6134..937559dbb8 100644
> > > > --- a/net/tap.c
> > > > +++ b/net/tap.c
> > > > @@ -203,7 +203,7 @@ static void tap_send(void *opaque)
> > > >              size -=3D s->host_vnet_hdr_len;
> > > >          }
> > > >
> > > > -        if (!s->nc.peer->do_not_pad) {
> > > > +        if (!s->nc.peer || !s->nc.peer->do_not_pad) {
> >
> > I think we should do:
> >
> > if (s->nc.peer && !s->nc.peer->do_not_pad)
>
> Yes. If there is no peer then the qemu_send_packet() that we're about
> to do is going to discard the packet anyway, so there's no point in
> padding it.
>
> Maybe consider
>
> static inline bool net_peer_needs_padding(NetClientState *nc)
> {
>     return nc->peer && !nc->peer->do_not_pad;
> }
>
> since we want the same check in three places ?

Sounds good to me.

Regards,
Bin

