Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C335B2CD6A5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:24:47 +0100 (CET)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkobG-0007pL-CM
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kkoZc-0007FW-Mg
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kkoZa-0001kv-Gs
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607001781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MJ7q/VcA8bUfAgsqaEK7cZ+kpPLjbTPGdv0yUng5WWQ=;
 b=IyQ9UwWpFRD8p9yIr4mbrkFf/kFlm/RPlE+LJQyaV7TjwThtFHf/eh77CV7v6MvGjIYpD5
 qWAnw8/dQpE4JKEksj91N++5fYowAiAVWTEB1uPH/u9PL14VH0mmZcnObxt57+UcSBgzv0
 feqGfO8vHu2zl+5QhbZ47BJXpA8Rd/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-lSw7TXOfPMahK10su36LQw-1; Thu, 03 Dec 2020 08:21:28 -0500
X-MC-Unique: lSw7TXOfPMahK10su36LQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CFD3A0CA7;
 Thu,  3 Dec 2020 13:21:26 +0000 (UTC)
Received: from localhost (ovpn-116-25.rdu2.redhat.com [10.10.116.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05D005D6AC;
 Thu,  3 Dec 2020 13:21:19 +0000 (UTC)
Date: Thu, 3 Dec 2020 14:21:18 +0100
From: Sergio Lopez <slp@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 03/12] x86: add support for second ioapic
Message-ID: <20201203132056.lgz46kxalypp6nav@mhamilton>
References: <20201203105423.10431-1-kraxel@redhat.com>
 <20201203105423.10431-4-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203105423.10431-4-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uuku57rrrzlq5uri"
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

--uuku57rrrzlq5uri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 11:54:14AM +0100, Gerd Hoffmann wrote:
> Add ioapic_init_secondary to initialize it, wire up
> in gsi handling and acpi apic table creation.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/i386/ioapic.h          |  2 ++
>  include/hw/i386/ioapic_internal.h |  2 +-
>  include/hw/i386/x86.h             |  3 +++
>  hw/i386/acpi-common.c             | 10 ++++++++++
>  hw/i386/x86.c                     | 21 +++++++++++++++++++++
>  5 files changed, 37 insertions(+), 1 deletion(-)=20

Reviewed-by: Sergio Lopez <slp@redhat.com>


--uuku57rrrzlq5uri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/I5k4ACgkQ9GknjS8M
AjWRrRAAqsW1Wn0Xh2eIEskQGD3ZNczgqrjLdFnd8Y9Qpv6k7U5H+uZl+kFb74x+
8IdxqcKAv+rNWv470Hx/6dB6Wu6RGAUtPSanSE7BHnumhyTz3LwXxYjNf/6nl9ku
93DWdUp8hPayVhS5GIhS41iHqs5RY1cMdoelL9392l0KTKP+uqjyp/eVK/9vBNkh
3Oggcb/joMTZJ0rpFO573BVzhPGPLH4VEX+NBDdjWFDZ3l0NyBB4tpBqcvmiWqZR
6G9qqBuxzI+Sek/cEmbDYrIkT9C0KEl1K+i8FUGyohYQQq0d2wtJa8IqisI8Mbii
MUTvoWHSH4uGopUiVO6fJLTUktmFiCoIGjM1uKoK/5vvWdhlfarDqSPJOpOhO5jc
XjoSK5t3maEwfYSUmQlDAvAe4PlQ5MBvWsRvtBQmMn8roIyp9uEchgVWae4lzsME
p73FzEn9rotxm1Jnyl1XEwVyX3F2Urx2eeCckgFAd8z0vxM9UOZnx8id2FrUzI3y
6HJA545Qu7v2PFfzJzmid1MuQHLBrhOBubbfJRBv3Tjv+2Gj9PbnkT2bxMu7RSjM
0xVjvrZVs0aKoy6CrSdtN8QkKccyhZUzSmVqtKZ21AGkASzv4sg+Yj2Dr7nYpSs2
TOIghZvnija90JhnLt8vzBce3C/a9nuLGA1OaEar14bIOVpL8/8=
=pkRE
-----END PGP SIGNATURE-----

--uuku57rrrzlq5uri--


