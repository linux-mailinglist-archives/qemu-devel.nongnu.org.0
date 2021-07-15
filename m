Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE4E3C9C6B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 12:08:41 +0200 (CEST)
Received: from localhost ([::1]:59552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3yIK-0003UQ-ER
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 06:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3yG6-0001ly-Cd
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 06:06:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3yG2-0004mz-Uf
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 06:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626343577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jSqSywu5z22/wKdTC9dC/gu/5wZck4fwl1eBCVjRFx4=;
 b=frN6AVFQjVJK0URMflbL8I/+PmVYdfDU8PqyykyGULtMzMzr+jjraUjEqXpD7DUHVAVw+i
 J709BKPf/jdb26Tb1/ynpWAkRqDNybKiyuaEHgAehVoTv/vIsT481+m93g5g4c/rb1jrQQ
 Y0MxmVHCQD6S3BM9wCnlrhOUGzPmhJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-jcdw37etO6azuvWHazkECg-1; Thu, 15 Jul 2021 06:06:15 -0400
X-MC-Unique: jcdw37etO6azuvWHazkECg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AACB100C609;
 Thu, 15 Jul 2021 10:06:14 +0000 (UTC)
Received: from localhost (ovpn-114-184.ams2.redhat.com [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B7D51042A52;
 Thu, 15 Jul 2021 10:06:05 +0000 (UTC)
Date: Thu, 15 Jul 2021 11:06:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v2 03/21] docs: add a section on the generalities of
 vhost-user
Message-ID: <YPAIjFSZc2CPb8Ar@stefanha-x1.localdomain>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
 <20210714182056.25888-4-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210714182056.25888-4-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YKokRms8C8ScUGHO"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YKokRms8C8ScUGHO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 14, 2021 at 07:20:38PM +0100, Alex Benn=E9e wrote:
> While we do mention some of this stuff in the various daemons and
> manuals the subtleties of the socket and memory sharing are sometimes
> missed. This document attempts to give some background on vhost-user
> daemons in general terms.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20210714093638.21077-4-alex.bennee@linaro.org>
> ---
>  docs/interop/vhost-user.rst        |  2 +
>  docs/system/device-emulation.rst   |  1 +
>  docs/system/devices/vhost-user.rst | 59 ++++++++++++++++++++++++++++++
>  3 files changed, 62 insertions(+)
>  create mode 100644 docs/system/devices/vhost-user.rst

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--YKokRms8C8ScUGHO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDwCIwACgkQnKSrs4Gr
c8jCRwf/RqQ26Qstc3PA5zYaSv//L6Zm/s9Tn9AEkTYlpVcYDQZUA9wEdYK2+vGB
GuD7ZXk7BfWz36jLN67C57f5oncdqq3adfr7QSLPd24c1HDjoZpQEsgiNx5sNoie
npSA0QQgQOxKQ/Soreg+B52lfLWHGm0L218nYGm3TmlPWCPMT2aRJE/wnLPXH7p/
a49KMjHOOxhucFAESrnJPm0GVZuCB0yiMiQtAYBj2tuf1j0pLY77fST0znYeqWZv
GD/kAcRCWvAk2ZjLbAmsrMZHcDEC2str7EIESqA/TRPOJRZ5dG5xOBAJuyOn2Ill
Uk+8SPdIsyO88qYFl0ub4T0jUNXOVA==
=isPy
-----END PGP SIGNATURE-----

--YKokRms8C8ScUGHO--


