Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4290B58CBA8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 17:56:01 +0200 (CEST)
Received: from localhost ([::1]:36004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL56l-00039X-Q6
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 11:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL53h-0006Jp-My
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL53e-0007th-FP
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659973965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAsbsU/lRAj2aPsEQanY33A80+fPhC/FLq7bkRwkVrI=;
 b=D7uWfy6t1UQAfIjYIpYEmpgVPKVER0lnLM//8gmxupNzrqpgKZHBbWt4UVP5VaUeO9jC5d
 lHLUkKgIY3Tp+ArjVyRNVcYov0T6kiPCnMMrp1pi5gYvGFjFktevcBgoq62w2UyDx4OZw7
 eATB3GZDGD1h1e1Iy3+qxsmebBB88Ao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-eeCbapIuMXOKzwgnFUGJ0w-1; Mon, 08 Aug 2022 11:52:42 -0400
X-MC-Unique: eeCbapIuMXOKzwgnFUGJ0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B65EB1881450;
 Mon,  8 Aug 2022 15:52:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F7AB400E88D;
 Mon,  8 Aug 2022 15:52:40 +0000 (UTC)
Date: Mon, 8 Aug 2022 11:52:39 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] virtio-blk and scsi: replace
 dataplane_{start/stopping/started}
Message-ID: <YvExR5byISBIB/G5@fedora>
References: <20220808094147.612472-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GnOIsM2xzpj54yyp"
Content-Disposition: inline
In-Reply-To: <20220808094147.612472-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GnOIsM2xzpj54yyp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 05:41:45AM -0400, Emanuele Giuseppe Esposito wrote:
> The way the dataplane stages at startup and stop are monitored is unneces=
sary
> complicated. In virtio-scsi we have dataplane_started, dataplane_starting=
 and
> dataplane_stopping in VirtIOSCSI.
> In virtio-blk we have dataplene_started in VirtIOBlock, and starting and =
stopping
> in VirtIOBlockDataPlane.
>=20
> Just replace all these flags with an atomic enum.
>=20
> Based-on: 20220803162824.948023-1-stefanha@redhat.com

As mentioned on IRC, I don't think it's useful to combine these fields
into a state machine because they serve different purposes
(starting/stopping prevents re-entrancy, started/stopped tracks whether
dataplane is enabled, and fenced tracks whether dataplane is broken).

Combining them all makes it harder to refactor those separate concerns.
In the future it would be nice to refactor away all this state and have
stateless IOThread support (I haven't figured out whether that's
possible yet).

I'm not against merging this, but I don't think using an enum is an
improvement - it's just different.

Regarding thread-safety, we need to guarantee that the state stored by a
QEMU thread is visible to the IOThread. This patch series doesn't really
do this: relaxed loads/stores aren't guaranteed to be visible to the
other thread. I comment on this in the patch: there needs to be at least
a comment or maybe something extra, like a memory barrier or stronger
atomic operation, to make the change to atomics worthwhile.

--GnOIsM2xzpj54yyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLxMUcACgkQnKSrs4Gr
c8hmqAf/Vl7dXJGl+MmenYI7/wU70V4S+7y3emSJSLU9H0wdZIVjVt3iHSpGIWCy
9WwqZqAzLt0vFwLqw/Ke31IlAzuA7q62420Ho32BtoL8ZpabjO0E2OrQ573cIdfW
ba+8yKBE2R2QRqGB+We2dpT0grDlehIa+In+hEqq6KyoAtxq/U0lafXWF9Jnj9iC
b6tZIKdcF2WDsqkYzMaL9uhJxBlNeOcFJjQBm9e5rmSbF5KalAVDnjQmjEDrnIsV
rwG8mEs+CMcEOysJW7JxCEfF/K24FNW5KXB6nGSvPaualPuuJyIqXv1QjSARWCVr
JLQ2I525X99ixQNhvGQlHp1juDTv6Q==
=kkHM
-----END PGP SIGNATURE-----

--GnOIsM2xzpj54yyp--


