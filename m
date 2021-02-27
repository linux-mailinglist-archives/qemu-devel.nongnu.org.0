Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54766326D06
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 13:25:32 +0100 (CET)
Received: from localhost ([::1]:41404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFyf4-0001h2-Pk
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 07:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFyeB-0001GJ-9D
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 07:24:35 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFye9-0000kP-2Q
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 07:24:34 -0500
Received: by mail-wr1-x434.google.com with SMTP id e10so10939285wro.12
 for <qemu-devel@nongnu.org>; Sat, 27 Feb 2021 04:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zAowLdkljbcQJlnS6PVokKpq06Pdj3BKZ1gvw9PGpfs=;
 b=usPrLU2VzM9KVa2TjO5bpKPDrH9hZWlMhDoBtSJvRVH8jRrHCTkDbYPoQAV9tLHkg0
 MnErx6qyD6Igdh2SOCUq3mFqy6jOFMQhsbMxS/HiNR0drVWP9gMcrIK3VFNh4Z8uWXmL
 cqnXmNx+c9u2k+chAqxjRYjVrVcjLfTki1kMrcPPpw+bzatsT8N3tEr7hb9/zT/62qn8
 YU2soBx7K28vT9NaxTrwlG/wABpZ/ErolRCvswRQxZuQO2KZk7apNNXhekxTcKE4/mfu
 rzruqUVtoCFcHFQ7bMZ22r85fZ3SecRO4rImF8w/ti9L4RSEGLMSgpgAVICcPDGCiTT8
 QT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zAowLdkljbcQJlnS6PVokKpq06Pdj3BKZ1gvw9PGpfs=;
 b=JVXX6d/hHU1vQG9LOnCiO4e6/Hi+aBq0dxrgnqqEzJt53f0EvXio3ZKPpS5jaigp72
 LWMgW9XEaJWXh0OHwYuUs7N+OQvBeIRUdX4ApM2ZhN7/8fTZTQ2kn84waXJl6joBPeJW
 Sj6Yz9Y7tudoIw5gVL6yErypEfoKA2S8MGOh9AUO0ch2fNtffXu/tjYCg1qlJxlYCKpB
 Bf+N3Cp5fmiA7640dBqAy6NdKwnCNX0jJiYxNuYsqLvfrPQJKR1xmj72yAvcbm40yGA6
 O9skMvW08bxsHoIhWjUQHLpb4w4F2nbVsJ6ZSL6cMW1MMtN8k7k4ZARKj28e5PeO3j0G
 DYPw==
X-Gm-Message-State: AOAM532N1yYjCg/SjEDosVBCL0x4Bmt1rJphECAgsFhV/n95kw329Pny
 lRXEKOgqHHn9qN5BUEWCdBPkBQ==
X-Google-Smtp-Source: ABdhPJwclebSEGDOD1/6Ix8AK42KLQqx2Uwek4iChqbAjlQeuO/XQIlW6ggb0h7mJtWuSVJmU135qQ==
X-Received: by 2002:adf:97d5:: with SMTP id t21mr7884091wrb.139.1614428670728; 
 Sat, 27 Feb 2021 04:24:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z3sm18431712wrw.96.2021.02.27.04.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 04:24:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9D9A1FF7E;
 Sat, 27 Feb 2021 12:24:28 +0000 (GMT)
References: <8735xskm7j.fsf@linaro.org> <YDOsP1pWUS+hXiBX@work-vm>
 <871rd86xrf.fsf@linaro.org>
 <CAFubqFuhmDe5=g3_e63rR8hgsYOJMDb3T=oKjs=imb+7zjpLzQ@mail.gmail.com>
 <CAFubqFs7ARvf=xjZJm55DVPN8LvLL+oUKSeXmBLDbEq-qsV5Vg@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Raphael Norwitz <raphael.s.norwitz@gmail.com>
Subject: Re: vhost reply_ack negotiation (a.k.a differences in vhost-user
 behaviour with libvhost-user and vhost-user-backend.rs)
Date: Sat, 27 Feb 2021 12:23:08 +0000
In-reply-to: <CAFubqFs7ARvf=xjZJm55DVPN8LvLL+oUKSeXmBLDbEq-qsV5Vg@mail.gmail.com>
Message-ID: <871rd1u29v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 chirantan@chromium.org, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, keiichiw@chromium.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 =?utf-8?Q?Marc?= =?utf-8?Q?-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 dgreid@chromium.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Raphael Norwitz <raphael.s.norwitz@gmail.com> writes:

> As an afterthought - if VHOST_USER_F_PROTOCOL_FEATURES is indeed
> unset, the issue may well be caused by QEMU reading an uninitialized
> value for dev->protocol_features. Some device types like cryptodev
> explicitly zero it out. As I said, it isn't set anywhere else in the
> source and If dev->protocol_features had REPLY_ACK set when the
> vhost_dev device is initialized, it would exactly explain the behavior
> you are seeing.

Can I point you at the proposed clarification of the vhost-user
specification:

  Subject: [VHOST USER SPEC PATCH] vhost-user.rst: add clarifying language =
about protocol negotiation
  Date: Fri, 26 Feb 2021 11:16:19 +0000
  Message-Id: <20210226111619.21178-1-alex.bennee@linaro.org>


>
> On Fri, Feb 26, 2021 at 9:58 AM Raphael Norwitz
> <raphael.s.norwitz@gmail.com> wrote:
>>
>> There are two sets of features being negotiated - virtio and
>> vhost-user.  Based on what you've posted here, I suspect the
>> VHOST_USER_F_PROTOCOL_FEATURES virtio feature may not be negotiated by
>> the backend, preventing the vhost-user protocol feature negotiation
>> from happening at all. I'm not 100% sure why this would cause QEMU to
>> assume that REPLY_ACK was negotiated though.
>>
>> some questions:
>>
>> On Mon, Feb 22, 2021 at 3:26 AM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >
>> >
>> > Dr. David Alan Gilbert <dgilbert@redhat.com> writes:
>> >
>> > > * Alex Benn=C3=A9e (alex.bennee@linaro.org) wrote:
>> > >> Hi,
>> > >>
>> > >> I finally got a chance to get down into the guts of vhost-user while
>> > >> attempting to port my original C RPMB daemon to Rust using the
>> > >> vhost-user-backend and related crates. I ended up with this hang du=
ring
>> > >> negotiation:
>> > >>
>> > >>   startup
>> > >>
>> > >>   vhost_user_write req:1 flags:0x1
>> > >>   vhost_user_read_start
>> > >>   vhost_user_read req:1 flags:0x5
>> > >>   vhost_user_backend_init: we got 170000000
>> >
>> > GET_FEATURES
>>
>> Do we also see a GET_PROTOCOL_FEATURES and a SET_PROTOCOL_FEATURES
>> message here? If so can you confirm what flags they contained?
>>
>> vhost-user feature negotiation works as follows (see vhost_user_backend_=
init()):
>>
>> err =3D vhost_user_get_features(dev, &features);
>> if (err < 0) {
>>     return err;
>> }
>>
>> if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
>>     dev->backend_features |=3D 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
>>
>>     err =3D vhost_user_get_u64(dev, VHOST_USER_GET_PROTOCOL_FEATURES,
>>                                               &protocol_features);
>>     if (err < 0) {
>>         return err;
>>     }
>>
>>     dev->protocol_features =3D
>>         protocol_features & VHOST_USER_PROTOCOL_FEATURE_MASK;
>> ...
>>
>>     err =3D vhost_user_set_protocol_features(dev, dev->protocol_features=
);
>>     if (err < 0) {
>>          return err;
>>      }
>> }
>>
>> So we first get the virtio features and check if the backend
>> advertises VHOST_USER_F_PROTOCOL_FEATURES. If it does, we proceed to
>> negotiate vhost-user features, in which case we should see
>> GET_PROTOCOL_FEATURES and a SET_PROTOCOL_FEATURES. Otherwise it looks
>> like the function just returns, and we leave the vhost-user features
>> uninitialized (presumably zeroed out?), and the backend will never
>> even receive a GET/SET_PROTOCOL_FEATURES.
>>
>> dev->protocol_features is not touched anywhere else, and, if
>> VHOST_USER_F_PROTOCOL_FEATURES is negotiated, comes directly to the
>> backend from the protocol_features the backend &ed with
>> VHOST_USER_PROTOCOL_FEATURE_MASK. Therefore if
>> VHOST_USER_F_PROTOCOL_FEATURES is indeed negotiated here I'm not sure
>> what could cause QEMU to think REPLY_ACK was negotiated while the
>> backend does not, spare something obvious like the backend mishandling
>> the GET/SET_PROTOCOL_FEATURES messages. I briefly checked the rustvmm
>> code for that and didn't see anything obvious.
>>
>> mst - are backend devices meant to function if
>> VHOST_USER_F_PROTOCOL_FEATURES is not advertised? Do we know of any
>> functioning backend which does not advertise this virtio feature? If
>> not, maybe we consider failing out here?
>>
>> alex - Are you sure QEMU gets stuck waiting on a reply_ack message,
>> and not somewhere else in the setup path? I trust a SET_MEM_TABLE
>> message was actually received by the backend. Did you confirm that
>> QEMU was indeed stuck waiting for a reply and not somewhere else later
>> on?
>>
>> >
>> > >>   vhost_user_write req:15 flags:0x1
>> > >>   vhost_user_read_start
>> > >>   vhost_user_read req:15 flags:0x5
>> > >>   vhost_user_set_protocol_features: 2008
>> > >>   vhost_user_write req:16 flags:0x1
>> > >>   vhost_user_write req:3 flags:0x1
>> > >>   vhost_user_write req:1 flags:0x1
>> > >>   vhost_user_read_start
>> > >>   vhost_user_read req:1 flags:0x5
>> > >>   vhost_user_write req:13 flags:0x1
>> > >>
>> > >>   kernel initialises device
>> > >>
>> > >>   virtio_rpmb virtio1: init done!
>> > >>   vhost_user_write req:13 flags:0x1
>> > >>   vhost_dev_set_features: 130000000
>> > >>   vhost_user_set_features: 130000000
>> >
>> > SET_FEATURES
>>
>> This is setting virtio features - should have nothing to do with REPLY_A=
CK.
>>
>> >
>> > >>   vhost_user_write req:2 flags:0x1
>> > >>   vhost_user_write req:5 flags:0x9
>> > >>   vhost_user_read_start
>> > >>
>> > <snip>
>> > >>
>> > >>  - Should QEMU have preserved VhostUserVirtioFeatures::PROTOCOL_FEA=
TURES
>> > >>    when doing the eventual VHOST_USER_SET_FEATURES reply?
>> > >>
>> > >>  - Is vhost.rs being to strict or libvhost-user too lax in interpre=
ting
>> > >>    the negotiated features before processing the ``need_reply`` [Bi=
t 3]
>> > >>    field of the messages?
>> > >
>> > > I think vhost.rs is being correctly strict - but there would be no h=
arm
>> > > in it flagging that you'd hit an inconsistency if it finds a need_re=
ply
>> > > without the feature.
>> >
>> > But the feature should have been negotiated. So unless the slave can
>> > assume it is enabled because it asked I think QEMU is in the wrong by
>> > not preserving the feature bits in it's SET_FEATURES reply. We just ge=
ts
>> > away with it with libvhostuser being willing to reply anyway.
>> >
>> > >
>> > >>  - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_FD inclu=
ded
>> > >>    in the "list of the ones that do" require replies or do they only
>> > >>    reply when REPLY_ACK has been negotiated as the ambiguous "seeal=
so::"
>> > >>    box out seems to imply?
>> > >
>> > > set_mem_table gives a reply when postcopy is enabled (and then qemu
>> > > replies to the reply!) but otherwise doesn't.
>> > > (Note there's an issue opened for .rs to support ADD_MEM_REGION
>> > > since it's a lot better than SET_MEM_TABLE which has a fixed size ta=
ble
>> > > that's small).
>> >
>> > Thanks for the heads up.
>> >
>> > >
>> > > Dave
>> > >
>> > >> Currently I have some hacks in:
>> > >>
>> > >>   https://github.com/stsquad/vhost/tree/my-hacks
>> > >>
>> > >> which gets my daemon booting up to the point we actually need to do=
 a
>> > >> transaction. However I won't submit a PR until I've worked out exac=
tly
>> > >> where the problems are.
>> > >>
>> > >> --
>> > >> Alex Benn=C3=A9e
>> > >>
>> >
>> >
>> > --
>> > Alex Benn=C3=A9e
>> >


--=20
Alex Benn=C3=A9e

