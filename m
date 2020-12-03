Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9322CD9F4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 16:14:47 +0100 (CET)
Received: from localhost ([::1]:54716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkqJh-0003Dj-LS
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 10:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kkqHk-0002UX-Sr
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 10:12:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kkqHY-0005Py-DD
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 10:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607008350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AKs6BESBnA+voc/KLoxRdl8SlmhmayhYklQx89sXoQs=;
 b=R4rJwvaQA6v/OwgSUs0QXPyGtq9C/6/g0MRf2jovkL3WrkgfP29x4CIU9xwsV3vC/McIF0
 aR1TDUVSdZlOx9xz+j+lOFtHYh3QDLzBE70un+4pIiJJY0ywpcQTgTi8o/qvZ7T1s2pXFL
 UHO48answQBA5/UK28gFPFt5Jf9jYy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-ioPfV77xPVGY6zbOInx00g-1; Thu, 03 Dec 2020 10:12:28 -0500
X-MC-Unique: ioPfV77xPVGY6zbOInx00g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A058100C604;
 Thu,  3 Dec 2020 15:12:27 +0000 (UTC)
Received: from localhost (ovpn-117-214.rdu2.redhat.com [10.10.117.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16FD25C1CF;
 Thu,  3 Dec 2020 15:12:20 +0000 (UTC)
Date: Thu, 3 Dec 2020 16:12:19 +0100
From: Sergio Lopez <slp@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 07/12] microvm: add second ioapic
Message-ID: <20201203151154.m4iyreuc4irli2bb@mhamilton>
References: <20201203105423.10431-1-kraxel@redhat.com>
 <20201203105423.10431-8-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203105423.10431-8-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xwrdklv6wyhsmpuu"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--xwrdklv6wyhsmpuu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 11:54:18AM +0100, Gerd Hoffmann wrote:
> Create second ioapic, route virtio-mmio IRQs to it,
> allow more virtio-mmio devices (24 instead of 8).
>=20
> Needs ACPI, enabled by default, can be turned off
> using -machine ioapic2=3Doff
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/i386/microvm.h      |  2 ++
>  hw/i386/microvm.c              | 56 +++++++++++++++++++++++++++++++---
>  tests/qtest/bios-tables-test.c |  8 ++---
>  3 files changed, 57 insertions(+), 9 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--xwrdklv6wyhsmpuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/JAFMACgkQ9GknjS8M
AjWuKA//dmGt1kn8FG4aXOljFmOz4xTd6BF0XZLEG2+jyadyXASsGfNkqPAb5Cu6
q2LdDplIqewRQhUjJEC5J9wdfWu6sSE/ZbzV2AqJOWcD3E7UhzQ13dUtOxPlWjrZ
X/tGFaUNBr4P9seO2kKakKVrSxxAs+5/pKI93Z9b2Cfiy+jBhTlP2IRstN4xKHSP
AmTiiZmdjXcrhbTLiasuJC9Zm22676fdKjJcmZ47hV++m5Ph0WI0YA42CV1xW/qU
PukHPNgQpsndRSUAdeAHzaAw8WkjFr8/IgtjhCRYGjwSN/gjwy80zzUd1310nk8s
x42irFvLcgOd8enB0NCVrCldDyD5iEEl0OGxtN3dU44LPP2e/N1bPAQqJjPXYLXc
yYSSJXphp08pv0NP5JgRBTu7gJpvUFCPX34JvkT4hGt5AwThnlSa7eonkKoqvgor
LU/CPcrap4cVN0vgbeTc3fRPKOEwG6sq7jOojX+lbvwhc/kGvF146NZTHYAbn4AZ
0UoENvQ5ayldRkbkZii8IGWw8HBubP3hQwK+RIcqs+yw3yu882ooHwtMfOtQSZsS
20xNM3OiID26V3p7dfrv36Itae+K0AfCQSxgYRCBUjh1wuzmsSPnYB6sTi0W8ALg
R5yZEUWApZEG0hTd9y8WPMPaoLKnh1xpF5a01xN27Fx+TdvuQjE=
=ZjIF
-----END PGP SIGNATURE-----

--xwrdklv6wyhsmpuu--


