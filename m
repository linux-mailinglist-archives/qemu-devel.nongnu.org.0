Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34573305F06
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:04:44 +0100 (CET)
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4mN9-0005r8-Fp
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4mLy-0005BU-C5
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:03:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4mLt-0008AD-9l
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611759801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jy7QJasRPoDx0cigs/wloybG3rkIeXABb2YNJ2LIs5A=;
 b=WIURpGud0NCpWc/RZh3aWgdjhYT5OJPuc+oXyoH79HFKA0jHBz9deiD609qr6P5s2CHF6O
 ETp6sSiF2mGApuIdlcpIWF5nFfQ4WAELmKhuxVLZL5niIF+lF/rleUv+o9803VC/cwwc0w
 aE2sMTlsVhL5Vs0489dbG3Xw0Qs+4yM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-g87SGapUNmeUerE9Q9VG1g-1; Wed, 27 Jan 2021 10:03:18 -0500
X-MC-Unique: g87SGapUNmeUerE9Q9VG1g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 384B81842140
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 15:03:17 +0000 (UTC)
Received: from localhost (ovpn-115-15.ams2.redhat.com [10.36.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0D8F60C05;
 Wed, 27 Jan 2021 15:03:12 +0000 (UTC)
Date: Wed, 27 Jan 2021 15:03:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 3/8] meson: add module_trace & module_trace_src
Message-ID: <20210127150311.GF310142@stefanha-x1.localdomain>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210121125028.3247190-4-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121125028.3247190-4-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kbCYTQG2MZjuOjyn"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kbCYTQG2MZjuOjyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 01:50:23PM +0100, Gerd Hoffmann wrote:
> module_trace is a dict which keeps track of the trace source files for a
> module.
>=20
> module_trace_src collects the trace source files for a given trace-events=
 file,
> which then either added to the source set or to a new module_trace dict
> depending on whenever they are for a module or core qemu.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  meson.build       |  3 ++-
>  trace/meson.build | 16 ++++++++++++----
>  2 files changed, 14 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--kbCYTQG2MZjuOjyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmARgK8ACgkQnKSrs4Gr
c8iXDwf+KlafBv5UQNdWv6KkDhStALDbHFes+CsQIiFLfTVLXKLe2sSUI+Mg47Oa
ZWpOEMsrCetZ7zqJ99mIGpuoMpxAEs/6bAh2IPvape0Gm3UEIB+QUDdL4Do/QHh9
AiQ0GdQK9X84jMlM31fk4CJcIEzzxVbj5CStcrlzuNlhwm1C963rkwFrGWBChpkx
KkHw5TgcwX3ZJfxjWuvGK6pw1UXkoknVnzvYKuH+KgTzMZu+4xdNwcfmTQapAL06
9AI5jZglu61QPHErxusp0sj1yujhP5bd/Lq9VWvnUyfGxErRLRlyvkIiSNZKUqkc
LKTjnpevmQNkyKqFvIZ1UQ58Ea3q/g==
=HFlT
-----END PGP SIGNATURE-----

--kbCYTQG2MZjuOjyn--


