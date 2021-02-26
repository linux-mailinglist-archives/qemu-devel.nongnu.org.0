Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7C326962
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 22:27:09 +0100 (CET)
Received: from localhost ([::1]:56058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFkdg-0000yU-UX
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 16:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1lFkcU-0000SP-7Y
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 16:25:54 -0500
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:35880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1lFkcR-0005Au-WA
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 16:25:53 -0500
Received: by mail-oo1-xc34.google.com with SMTP id x10so2513144oor.3
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 13:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SmMpXpet1LTJXwCKKyz4RHGflzBax4ccVHcWYy7iqSI=;
 b=QiFybXQrjCwzQ7eUsFjW7dp2DSv1MD6va/BB/D0wq2Luo+3qCQJFo3/OaTMWMok0Pu
 AMsVzinbZ4PUGMd2p9eF2T77Onf5LEEQgcwcJbDlcUO+lj4ur1lcgAr2m5yjjpbrNRRq
 5ClKTpcHvmTFfe5FkRn3uigw1iSGzva2nHi9Ufz/8JUcmPZs2uPQVEwOJOmn5HVDttzU
 YQL72PHFRQyR/ep8lQAlUFkLOpnTIcrexiUWMlrXBfFbIi8amYkQT5MjqmEbVm3DK+Dp
 fWgzA+YdOIUBDpEHOP4LQGOHCeKZLpFSi0t8zyO9GOjAlNLvslPlhJYqQ1XV4e625z0m
 P4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SmMpXpet1LTJXwCKKyz4RHGflzBax4ccVHcWYy7iqSI=;
 b=H30gzZOUjPob1dEZjz8U088GwRGnZcQiCcpVImDuy+ImMLLG+vxc8lJusnzEPQq0fe
 h6ptDhZMunpamnMekF2cHF1ABcqp3L37xcCdPZ/KkMnMaOoLo+EbOE3zmdoPdLaUpXGc
 izncQZGwRf3NjBc1CnzWmPSv5pDEz5+wBT8zuwv7ZJZk7lGbkLXtdqZRCM8Grq7Mzph9
 FUzOs/3u8OLX8263d54Fk3FNKnpX2GfrHboUypsNI1SKrYtgyf5OIGxAE+mM4XVttM/p
 tajUvtq1Pdq3VzIXQrEdoJnRzLCq7gcrzhXi/Bz0yPf2vZiAxi2WL4nTDZ3NHmrBKWF1
 nLIw==
X-Gm-Message-State: AOAM533nsKNiKqwnVx60eDaFVpX4n8z+kESDc4WYjjF41GgmIuns0cPg
 Hq3FGJdCH/ewQ/VtEnQOTsjXLckS1Mf3m7BanWg=
X-Google-Smtp-Source: ABdhPJw8r1s5OcRotWJ3PHrW4nKCfz525K8S63Iy35g8VlFLkKaQmXItWAF8pr42+QH7xpQEtuPuU9OczBWqk93vuLU=
X-Received: by 2002:a4a:1101:: with SMTP id 1mr3809281ooc.83.1614374750523;
 Fri, 26 Feb 2021 13:25:50 -0800 (PST)
MIME-Version: 1.0
References: <8735xskm7j.fsf@linaro.org> <YDOsP1pWUS+hXiBX@work-vm>
 <871rd86xrf.fsf@linaro.org>
 <CAFubqFuhmDe5=g3_e63rR8hgsYOJMDb3T=oKjs=imb+7zjpLzQ@mail.gmail.com>
In-Reply-To: <CAFubqFuhmDe5=g3_e63rR8hgsYOJMDb3T=oKjs=imb+7zjpLzQ@mail.gmail.com>
From: Raphael Norwitz <raphael.s.norwitz@gmail.com>
Date: Fri, 26 Feb 2021 11:25:39 -1000
Message-ID: <CAFubqFs7ARvf=xjZJm55DVPN8LvLL+oUKSeXmBLDbEq-qsV5Vg@mail.gmail.com>
Subject: Re: vhost reply_ack negotiation (a.k.a differences in vhost-user
 behaviour with libvhost-user and vhost-user-backend.rs)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=raphael.s.norwitz@gmail.com; helo=mail-oo1-xc34.google.com
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
Cc: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 chirantan@chromium.org, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, keiichiw@chromium.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 dgreid@chromium.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As an afterthought - if VHOST_USER_F_PROTOCOL_FEATURES is indeed
unset, the issue may well be caused by QEMU reading an uninitialized
value for dev->protocol_features. Some device types like cryptodev
explicitly zero it out. As I said, it isn't set anywhere else in the
source and If dev->protocol_features had REPLY_ACK set when the
vhost_dev device is initialized, it would exactly explain the behavior
you are seeing.

On Fri, Feb 26, 2021 at 9:58 AM Raphael Norwitz
<raphael.s.norwitz@gmail.com> wrote:
>
> There are two sets of features being negotiated - virtio and
> vhost-user.  Based on what you've posted here, I suspect the
> VHOST_USER_F_PROTOCOL_FEATURES virtio feature may not be negotiated by
> the backend, preventing the vhost-user protocol feature negotiation
> from happening at all. I'm not 100% sure why this would cause QEMU to
> assume that REPLY_ACK was negotiated though.
>
> some questions:
>
> On Mon, Feb 22, 2021 at 3:26 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >
> >
> > Dr. David Alan Gilbert <dgilbert@redhat.com> writes:
> >
> > > * Alex Benn=C3=A9e (alex.bennee@linaro.org) wrote:
> > >> Hi,
> > >>
> > >> I finally got a chance to get down into the guts of vhost-user while
> > >> attempting to port my original C RPMB daemon to Rust using the
> > >> vhost-user-backend and related crates. I ended up with this hang dur=
ing
> > >> negotiation:
> > >>
> > >>   startup
> > >>
> > >>   vhost_user_write req:1 flags:0x1
> > >>   vhost_user_read_start
> > >>   vhost_user_read req:1 flags:0x5
> > >>   vhost_user_backend_init: we got 170000000
> >
> > GET_FEATURES
>
> Do we also see a GET_PROTOCOL_FEATURES and a SET_PROTOCOL_FEATURES
> message here? If so can you confirm what flags they contained?
>
> vhost-user feature negotiation works as follows (see vhost_user_backend_i=
nit()):
>
> err =3D vhost_user_get_features(dev, &features);
> if (err < 0) {
>     return err;
> }
>
> if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
>     dev->backend_features |=3D 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
>
>     err =3D vhost_user_get_u64(dev, VHOST_USER_GET_PROTOCOL_FEATURES,
>                                               &protocol_features);
>     if (err < 0) {
>         return err;
>     }
>
>     dev->protocol_features =3D
>         protocol_features & VHOST_USER_PROTOCOL_FEATURE_MASK;
> ...
>
>     err =3D vhost_user_set_protocol_features(dev, dev->protocol_features)=
;
>     if (err < 0) {
>          return err;
>      }
> }
>
> So we first get the virtio features and check if the backend
> advertises VHOST_USER_F_PROTOCOL_FEATURES. If it does, we proceed to
> negotiate vhost-user features, in which case we should see
> GET_PROTOCOL_FEATURES and a SET_PROTOCOL_FEATURES. Otherwise it looks
> like the function just returns, and we leave the vhost-user features
> uninitialized (presumably zeroed out?), and the backend will never
> even receive a GET/SET_PROTOCOL_FEATURES.
>
> dev->protocol_features is not touched anywhere else, and, if
> VHOST_USER_F_PROTOCOL_FEATURES is negotiated, comes directly to the
> backend from the protocol_features the backend &ed with
> VHOST_USER_PROTOCOL_FEATURE_MASK. Therefore if
> VHOST_USER_F_PROTOCOL_FEATURES is indeed negotiated here I'm not sure
> what could cause QEMU to think REPLY_ACK was negotiated while the
> backend does not, spare something obvious like the backend mishandling
> the GET/SET_PROTOCOL_FEATURES messages. I briefly checked the rustvmm
> code for that and didn't see anything obvious.
>
> mst - are backend devices meant to function if
> VHOST_USER_F_PROTOCOL_FEATURES is not advertised? Do we know of any
> functioning backend which does not advertise this virtio feature? If
> not, maybe we consider failing out here?
>
> alex - Are you sure QEMU gets stuck waiting on a reply_ack message,
> and not somewhere else in the setup path? I trust a SET_MEM_TABLE
> message was actually received by the backend. Did you confirm that
> QEMU was indeed stuck waiting for a reply and not somewhere else later
> on?
>
> >
> > >>   vhost_user_write req:15 flags:0x1
> > >>   vhost_user_read_start
> > >>   vhost_user_read req:15 flags:0x5
> > >>   vhost_user_set_protocol_features: 2008
> > >>   vhost_user_write req:16 flags:0x1
> > >>   vhost_user_write req:3 flags:0x1
> > >>   vhost_user_write req:1 flags:0x1
> > >>   vhost_user_read_start
> > >>   vhost_user_read req:1 flags:0x5
> > >>   vhost_user_write req:13 flags:0x1
> > >>
> > >>   kernel initialises device
> > >>
> > >>   virtio_rpmb virtio1: init done!
> > >>   vhost_user_write req:13 flags:0x1
> > >>   vhost_dev_set_features: 130000000
> > >>   vhost_user_set_features: 130000000
> >
> > SET_FEATURES
>
> This is setting virtio features - should have nothing to do with REPLY_AC=
K.
>
> >
> > >>   vhost_user_write req:2 flags:0x1
> > >>   vhost_user_write req:5 flags:0x9
> > >>   vhost_user_read_start
> > >>
> > <snip>
> > >>
> > >>  - Should QEMU have preserved VhostUserVirtioFeatures::PROTOCOL_FEAT=
URES
> > >>    when doing the eventual VHOST_USER_SET_FEATURES reply?
> > >>
> > >>  - Is vhost.rs being to strict or libvhost-user too lax in interpret=
ing
> > >>    the negotiated features before processing the ``need_reply`` [Bit=
 3]
> > >>    field of the messages?
> > >
> > > I think vhost.rs is being correctly strict - but there would be no ha=
rm
> > > in it flagging that you'd hit an inconsistency if it finds a need_rep=
ly
> > > without the feature.
> >
> > But the feature should have been negotiated. So unless the slave can
> > assume it is enabled because it asked I think QEMU is in the wrong by
> > not preserving the feature bits in it's SET_FEATURES reply. We just get=
s
> > away with it with libvhostuser being willing to reply anyway.
> >
> > >
> > >>  - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_FD includ=
ed
> > >>    in the "list of the ones that do" require replies or do they only
> > >>    reply when REPLY_ACK has been negotiated as the ambiguous "seeals=
o::"
> > >>    box out seems to imply?
> > >
> > > set_mem_table gives a reply when postcopy is enabled (and then qemu
> > > replies to the reply!) but otherwise doesn't.
> > > (Note there's an issue opened for .rs to support ADD_MEM_REGION
> > > since it's a lot better than SET_MEM_TABLE which has a fixed size tab=
le
> > > that's small).
> >
> > Thanks for the heads up.
> >
> > >
> > > Dave
> > >
> > >> Currently I have some hacks in:
> > >>
> > >>   https://github.com/stsquad/vhost/tree/my-hacks
> > >>
> > >> which gets my daemon booting up to the point we actually need to do =
a
> > >> transaction. However I won't submit a PR until I've worked out exact=
ly
> > >> where the problems are.
> > >>
> > >> --
> > >> Alex Benn=C3=A9e
> > >>
> >
> >
> > --
> > Alex Benn=C3=A9e
> >

