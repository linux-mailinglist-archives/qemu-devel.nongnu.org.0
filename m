Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60069367DDA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:38:19 +0200 (CEST)
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVms-0005Ba-7i
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZVlf-0003gX-44
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:37:03 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZVlZ-0005WS-Tx
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:37:02 -0400
Received: by mail-ej1-x634.google.com with SMTP id v6so66471194ejo.6
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 02:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YNKWkstbsD5m/ub4e4ip8OryGEEqUC12lMVfCMuEuBg=;
 b=eu8cJiOTngEpXZGtYyy0I3HcseWhC8LqzCXpArRkHZCYtSSOO8hlTD6LVyNhYzu9Po
 q1OzgYvRioRgRBHpCbHBgqhOBcZKSEqY1lfcaaxejfehs7dzCasvBeb31BoJRRM5Cbsd
 BzVBKlGcJLQ+7KpFzTGOGlZWIkqJ979TiNM1D1bGMquMUBM/dCFlryxFyaTCQPnZSv9b
 YRWU1wKhnFBNJy0z9Uy6Eteth0BvM/EDb2QrRadJiBSAFgCMueLyDA7cjNnWMg54hp1T
 sQePb/RXCBHDagGjYjA/EPRzCW7iXdWy8MDG33vNDhlhwma3IxnzYC7at9XFBJccqaqB
 p8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YNKWkstbsD5m/ub4e4ip8OryGEEqUC12lMVfCMuEuBg=;
 b=J7KSHMkbb0G6LIJcy+jYmVjRx1RzGPTLa5hnXgMrV2+5I1XTruFoh21xoJg8TbBOI9
 xKr3pz6qK44ZAR6RUj26hdrEX+zx2k5IGuyfzdN3SnT8DA19gvr8LG3gzWR8H3mbXD8V
 /s5CKEj4pvYwptqOufH7r18M+Yeiha+dMjlnuqS7LFlp8gvvPJZ7/vyGJxGpNJdek+4F
 SPOqtzVvxWgiN2u5y6z/KsUjH+TbviSqLcqhG6c47gZ2JwMHXnE9qBt9B12hc2ATVEkQ
 eUzCeCFjiyC6K/RuFlje74PNqAuBFHufBM04+HjIB6z8dzzYRVii9Z7smYV6lkKM/sz1
 oBWQ==
X-Gm-Message-State: AOAM53100hj1YGzWtPCwE/8YWTd+figsJnXGgS0QzkGpYgvt/SK9Z6uV
 l6Ohu8iWwROFA8xJXsPqoJJO4LAmsRW3L34UU3DgDw==
X-Google-Smtp-Source: ABdhPJw4lIvEYJnNZ0y4hownqK7IxRJc21IBL1RrWf9EGXw/rp+cuk1ZTKCh0s+py0HcGSGyQEChm4OwiGDHZaJH+Cc=
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr2456428ejt.482.1619084216043; 
 Thu, 22 Apr 2021 02:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
 <fe1f97bc-5ff9-002b-debc-5bc2c449c8b8@redhat.com>
 <CAEUhbmXR1Yn5paL+d0DMjgZUiinQGNRazj3neScL4_=CGvC8zg@mail.gmail.com>
In-Reply-To: <CAEUhbmXR1Yn5paL+d0DMjgZUiinQGNRazj3neScL4_=CGvC8zg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Apr 2021 10:36:02 +0100
Message-ID: <CAFEAcA_4TSF1KKxVQUDt3r+aAnZqT-A2uA8m7O0ZaxHQVWgKJg@mail.gmail.com>
Subject: Re: [PATCH-for-6.0] net: tap: fix crash on hotplug
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 22 Apr 2021 at 05:29, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Apr 22, 2021 at 12:36 AM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
> >
> > Cc'ing Bin.
> >
> > On 4/21/21 5:22 PM, Cole Robinson wrote:
> > > Attempting to hotplug a tap nic with libvirt will crash qemu:
> > >
> > > $ sudo virsh attach-interface f32 network default
> > > error: Failed to attach interface
> > > error: Unable to read from monitor: Connection reset by peer
> > >
> > > 0x000055875b7f3a99 in tap_send (opaque=3D0x55875e39eae0) at ../net/ta=
p.c:206
> > > 206           if (!s->nc.peer->do_not_pad) {
> > > gdb$ bt
> > >
> > > s->nc.peer may not be set at this point. This seems to be an
> > > expected case, as qemu_send_packet_* explicitly checks for NULL
> > > s->nc.peer later.
> > >
> > > Fix it by checking for s->nc.peer here too. Padding is applied if
> > > s->nc.peer is not set.
> > >
> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D1949786
> > > Fixes: 969e50b61a2
> > >
> > > Signed-off-by: Cole Robinson <crobinso@redhat.com>
> > > ---
> > > * Or should we skip padding if nc.peer is unset? I didn't dig into it
> > > * tap-win3.c and slirp.c may need a similar fix, but the slirp case
> > >   didn't crash in a simple test.
> > >
> > >  net/tap.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/net/tap.c b/net/tap.c
> > > index dd42ac6134..937559dbb8 100644
> > > --- a/net/tap.c
> > > +++ b/net/tap.c
> > > @@ -203,7 +203,7 @@ static void tap_send(void *opaque)
> > >              size -=3D s->host_vnet_hdr_len;
> > >          }
> > >
> > > -        if (!s->nc.peer->do_not_pad) {
> > > +        if (!s->nc.peer || !s->nc.peer->do_not_pad) {
>
> I think we should do:
>
> if (s->nc.peer && !s->nc.peer->do_not_pad)

Yes. If there is no peer then the qemu_send_packet() that we're about
to do is going to discard the packet anyway, so there's no point in
padding it.

Maybe consider

static inline bool net_peer_needs_padding(NetClientState *nc)
{
    return nc->peer && !nc->peer->do_not_pad;
}

since we want the same check in three places ?

thanks
-- PMM

