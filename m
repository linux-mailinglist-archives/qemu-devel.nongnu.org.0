Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF73DA8A4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:14:48 +0200 (CEST)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98gJ-0003nu-Mw
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98fA-00033r-Bd
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:13:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98f7-0005ou-Fo
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627575212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bcp+5KvlVxiuqnw235oB/8nThhEyhzkZCbVtdZWxRvg=;
 b=AyRox5kANABGiYB5SdUuRMPUoYXP0LFbVLZFp/KmmpR4YPHv23QoBzUBsIwuoHFt2fxY59
 SooDdRF8Pmf92NkSNXY4c5VOKLM137UiHX2F0jZAGkw6wT1Pa2wmmSAAZkCOwazEzq7Ika
 4V3+rriixW/WfhP07VOIZWDDJgpkHpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-2h94Q-0mOu6PRY0Jmqit2g-1; Thu, 29 Jul 2021 12:13:30 -0400
X-MC-Unique: 2h94Q-0mOu6PRY0Jmqit2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 930B5100CA96;
 Thu, 29 Jul 2021 16:13:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A93E62BFFD;
 Thu, 29 Jul 2021 16:13:24 +0000 (UTC)
Date: Thu, 29 Jul 2021 17:13:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PING][PING][PATCH v2] vhost: make SET_VRING_ADDR, SET_FEATURES
 send replies
Message-ID: <YQLTo9XBPi8uacQ4@stefanha-x1.localdomain>
References: <20210719142138.24543-1-den-plotnikov@yandex-team.ru>
 <8f3959d9-2dd8-3fc0-f350-b4ea98a10f38@yandex-team.ru>
 <f809aa3e-dc2f-4a2f-92d1-e5dc8782c1e5@yandex-team.ru>
 <245ed980-92aa-c0c1-e795-70d50b0eb67e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <245ed980-92aa-c0c1-e795-70d50b0eb67e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BRoua/YJxSXYZCtP"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>, yc-core@yandex-team.ru,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--BRoua/YJxSXYZCtP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2021 at 02:53:53PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Cc more ppl.

This needs to go through Michael Tsirkin's tree.

Stefan

>=20
> On 7/29/21 12:56 PM, Denis Plotnikov wrote:
> >=20
> > On 23.07.2021 12:59, Denis Plotnikov wrote:
> >>
> >> ping!
> >>
> >> On 19.07.2021 17:21, Denis Plotnikov wrote:
> >>> On vhost-user-blk migration, qemu normally sends a number of commands
> >>> to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
> >>> Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
> >>> VHOST_USER_SET_VRING_ADDR per each started ring to enable "used ring"
> >>> data logging.
> >>> The issue is that qemu doesn't wait for reply from the vhost daemon
> >>> for these commands which may result in races between qemu expectation
> >>> of logging starting and actual login starting in vhost daemon.
> >>>
> >>> The race can appear as follows: on migration setup, qemu enables dirt=
y page
> >>> logging by sending VHOST_USER_SET_FEATURES. The command doesn't arriv=
e to a
> >>> vhost-user-blk daemon immediately and the daemon needs some time to t=
urn the
> >>> logging on internally. If qemu doesn't wait for reply, after sending =
the
> >>> command, qemu may start migrate memory pages to a destination. At thi=
s time,
> >>> the logging may not be actually turned on in the daemon but some gues=
t pages,
> >>> which the daemon is about to write to, may have already been transfer=
red
> >>> without logging to the destination. Since the logging wasn't turned o=
n,
> >>> those pages won't be transferred again as dirty. So we may end up wit=
h
> >>> corrupted data on the destination.
> >>> The same scenario is applicable for "used ring" data logging, which i=
s
> >>> turned on with VHOST_USER_SET_VRING_ADDR command.
> >>>
> >>> To resolve this issue, this patch makes qemu wait for the commands re=
sult
> >>> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated and
> >>> logging is enabled.
> >>>
> >>> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> >>> ---
> >>> v1 -> v2:
> >>>   * send reply only when logging is enabled [mst]
> >>>
> >>> v0 -> v1:
> >>>   * send reply for SET_VRING_ADDR, SET_FEATURES only [mst]
> >>>  =20
> >>>  hw/virtio/vhost-user.c | 37 ++++++++++++++++++++++++++++++++++---
> >>>  1 file changed, 34 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> >>> index ee57abe04526..133588b3961e 100644
> >>> --- a/hw/virtio/vhost-user.c
> >>> +++ b/hw/virtio/vhost-user.c
> >>> @@ -1095,6 +1095,11 @@ static int vhost_user_set_mem_table(struct vho=
st_dev *dev,
> >>>      return 0;
> >>>  }
> >>> =20
> >>> +static bool log_enabled(uint64_t features)
> >>> +{
> >>> +    return !!(features & (0x1ULL << VHOST_F_LOG_ALL));
> >>> +}
> >>> +
> >>>  static int vhost_user_set_vring_addr(struct vhost_dev *dev,
> >>>                                       struct vhost_vring_addr *addr)
> >>>  {
> >>> @@ -1105,10 +1110,21 @@ static int vhost_user_set_vring_addr(struct v=
host_dev *dev,
> >>>          .hdr.size =3D sizeof(msg.payload.addr),
> >>>      };
> >>> =20
> >>> +    bool reply_supported =3D virtio_has_feature(dev->protocol_featur=
es,
> >>> +                                              VHOST_USER_PROTOCOL_F_=
REPLY_ACK);
> >>> +
> >>> +    if (reply_supported && log_enabled(msg.hdr.flags)) {
> >>> +        msg.hdr.flags |=3D VHOST_USER_NEED_REPLY_MASK;
> >>> +    }
> >>> +
> >>>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> >>>          return -1;
> >>>      }
> >>> =20
> >>> +    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
> >>> +        return process_message_reply(dev, &msg);
> >>> +    }
> >>> +
> >>>      return 0;
> >>>  }
> >>> =20
> >>> @@ -1288,7 +1304,8 @@ static int vhost_user_set_vring_call(struct vho=
st_dev *dev,
> >>>      return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file=
);
> >>>  }
> >>> =20
> >>> -static int vhost_user_set_u64(struct vhost_dev *dev, int request, ui=
nt64_t u64)
> >>> +static int vhost_user_set_u64(struct vhost_dev *dev, int request, ui=
nt64_t u64,
> >>> +                              bool need_reply)
> >>>  {
> >>>      VhostUserMsg msg =3D {
> >>>          .hdr.request =3D request,
> >>> @@ -1297,23 +1314,37 @@ static int vhost_user_set_u64(struct vhost_de=
v *dev, int request, uint64_t u64)
> >>>          .hdr.size =3D sizeof(msg.payload.u64),
> >>>      };
> >>> =20
> >>> +    if (need_reply) {
> >>> +        bool reply_supported =3D virtio_has_feature(dev->protocol_fe=
atures,
> >>> +                                          VHOST_USER_PROTOCOL_F_REPL=
Y_ACK);
> >>> +        if (reply_supported) {
> >>> +            msg.hdr.flags |=3D VHOST_USER_NEED_REPLY_MASK;
> >>> +        }
> >>> +    }
> >>> +
> >>>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> >>>          return -1;
> >>>      }
> >>> =20
> >>> +    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
> >>> +        return process_message_reply(dev, &msg);
> >>> +    }
> >>> +
> >>>      return 0;
> >>>  }
> >>> =20
> >>>  static int vhost_user_set_features(struct vhost_dev *dev,
> >>>                                     uint64_t features)
> >>>  {
> >>> -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features=
);
> >>> +    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features=
,
> >>> +                              log_enabled(features));
> >>>  }
> >>> =20
> >>>  static int vhost_user_set_protocol_features(struct vhost_dev *dev,
> >>>                                              uint64_t features)
> >>>  {
> >>> -    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES,=
 features);
> >>> +    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES,=
 features,
> >>> +                              false);
> >>>  }
> >>> =20
> >>>  static int vhost_user_get_u64(struct vhost_dev *dev, int request, ui=
nt64_t *u64)
>=20

--BRoua/YJxSXYZCtP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEC06MACgkQnKSrs4Gr
c8gd1gf/RP6UD45bRLMHyWXPzqgekR8mjHRcvfq0tCSob+rMjMnGs/jZUfC//ewp
prFkXZIXOSHftEKrnlB97DtIGwoZb8OCiHRRy71yw1vkgamb/YmmGGQf7IGZsgWL
2nBsOk+5RE+maFFXugINpm6N5lA2cxwQVFr9ctcWpIcCVfQgDLQYpy5b1qfQh5Re
HNyeHWwNbNtSNUEJJ7nFWPwL2e+93hZo55TVs8uh6XAQiMBE7lu2cj5ppSG+dPVM
bAWr0VK8wPli5yEUP2AgjxFxhqhpmySQltF8tqohrLrSEW5jbL3ek8ugSYupadZS
7o7QrUmZW7TS3sL7NBBPIy+vVIUqrg==
=1k6s
-----END PGP SIGNATURE-----

--BRoua/YJxSXYZCtP--


