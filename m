Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1032B2CD6C7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:30:22 +0100 (CET)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkogf-0002ZG-0h
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kkoeo-00019P-NG
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:28:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kkoei-0003O4-T5
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:28:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607002100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nYyfAZeFxozALRCSs0DCVvvAO56H5zu+kEuFFs5LHzQ=;
 b=VG+CUQ2RinF/xmWydO+ufzsdI5iaQuut82hDXR6n5Btnt4T4BpLWw7aMSuEYn3IVm39GqU
 6HFOd7dh4kFsuIWwmfDHyfbfPojvaNjwIOaAFCykhN/tVXADFYQJ/vCZtmZkqSMTbw5Ebr
 8lQ6PCmBHiKQDXVXcs9OVXzIR582Lxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-lwq5ldHVOUGdIzRt_LfxBg-1; Thu, 03 Dec 2020 08:28:16 -0500
X-MC-Unique: lwq5ldHVOUGdIzRt_LfxBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2988C100F7C9;
 Thu,  3 Dec 2020 13:28:13 +0000 (UTC)
Received: from localhost (ovpn-116-25.rdu2.redhat.com [10.10.116.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F188D2BCEE;
 Thu,  3 Dec 2020 13:27:54 +0000 (UTC)
Date: Thu, 3 Dec 2020 14:27:53 +0100
From: Sergio Lopez <slp@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 06/12] microvm: drop microvm_gsi_handler()
Message-ID: <20201203132753.vyurmo2fjvmlqrdl@mhamilton>
References: <20201203105423.10431-1-kraxel@redhat.com>
 <20201203105423.10431-7-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203105423.10431-7-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4gqraoskjqfwfhw7"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4gqraoskjqfwfhw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 11:54:17AM +0100, Gerd Hoffmann wrote:
> With the improved gsi_handler() we don't need
> our private version any more.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/i386/microvm.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--4gqraoskjqfwfhw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/I59gACgkQ9GknjS8M
AjVt7Q/7B7aJmVdk6szxU8kAvqCgA5WwKrqlrz2f22acAfkGBLA2dDzu8rLgT2/7
F9GZxdgDL5coz3knmmBBpbMgCygKnGoQKVY9CSY8AxN4cSF2zr+zR6zlTXPneuSo
uFrRFCp5WsQ7wm+ZQPu0PWdplTe3Nn/v08mL6CnOXUk7dNCJbr75ptYFr5yWvwlH
icyakSUJnatgkqc+BDiskZ6vN5rhT5E1mkemm5doYcmQoOHnrc2q9Y1nBVUv//2/
yI69074+XVH7ES6wB+mkl/I/uQ/pU5cI96jiIpmw8wvZdfeqzRTFjKbTN+V1HsGI
fXmHM4a1iAz1fp5+AxDdsFGxFGmJIYs19jY0wDEzH+oX3e4xHMQYtaGj47jhsbr0
6PlWk/FjDppELWkNdYnp5NFU8Dz3S4XP0CmCHCreikydDuZAvIwvFxGbgJJ9ajNj
MJoexzfmUqQ+p0WP5QcuymQBfXYmKCF7RSRASjWoBDgmhnuEaiollLnOaGn57n+m
XzoUhXtSNFoYBL0aQFiDUglsOQ2BBxhKCO7SOBq4+i//cHJu1YY8Vj/BZyzlxZxO
iIwdmNHJ8+ZbhNxYFaOcCjv5D3ZkEwyJZIC21I0+ETFeIWAgYo1Oa4KEoTdf7zPx
2+bHRz/tzGvZfN1BdgU3/1nyT3dBGyBkWHUIFsZo8LnPZOcFUDE=
=eBvO
-----END PGP SIGNATURE-----

--4gqraoskjqfwfhw7--


