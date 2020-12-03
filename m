Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4017E2CD6C8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:30:22 +0100 (CET)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkogf-0002Yv-86
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kkoeo-00019Q-O5
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:28:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kkoe2-0003BW-Pe
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:28:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607002057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x0iDditjlW7YSjAn8R4RM+dw1MvDMHK9/9D9n1PvySY=;
 b=F83J96H/BJyBe5kLDa8IaGDHdKJmPDNj0H4/iQgo34KY/czFuB9R3Gj8w4Ju6bpOLX8XYp
 iIhp9UT8e2Oh4ACqV3o9ViTFWfSZlqRA+G4MaXsLrdcIZ3JRqjX/GjofGxoLVwxcTM9uhQ
 pjs3rApbd/zvIgPyJ1PWSOC7+A4tUJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-JeTMjwhiPNC06Lv7blFFPg-1; Thu, 03 Dec 2020 08:27:34 -0500
X-MC-Unique: JeTMjwhiPNC06Lv7blFFPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD22E8030DD;
 Thu,  3 Dec 2020 13:27:32 +0000 (UTC)
Received: from localhost (ovpn-116-25.rdu2.redhat.com [10.10.116.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E651E110877D;
 Thu,  3 Dec 2020 13:27:20 +0000 (UTC)
Date: Thu, 3 Dec 2020 14:27:19 +0100
From: Sergio Lopez <slp@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 05/12] microvm: make pcie irq base runtime changeable
Message-ID: <20201203132719.6ajv3xq2t3qjaj4z@mhamilton>
References: <20201203105423.10431-1-kraxel@redhat.com>
 <20201203105423.10431-6-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203105423.10431-6-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vc3pnplyzpoz27bd"
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

--vc3pnplyzpoz27bd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 11:54:16AM +0100, Gerd Hoffmann wrote:
> Allows to move them in case we have enough
> irq lines available.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/i386/microvm.h |  2 +-
>  hw/i386/microvm.c         | 11 ++++++-----
>  2 files changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--vc3pnplyzpoz27bd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/I57YACgkQ9GknjS8M
AjWabg/+L1QfdeF2GShqWGk5dj9e/GHqPdBjWIQLMxD1iZBMtvcxsgF5XTiVXhfH
xS4+9uV8qUpWlQmzF/16IWW5i5YGL2RGiiDFCEkphb0MDo2Ap0bySdRIjONaK9Tr
seyXrp6JBYDvl0OlqkV153rJtxHWV3g6WCnAoHICEijxbZNQ9ghk1SKBdcTbGFPL
XM62KbO1oY/S+P+dhOYg59ejQP4i815tm9v6S6nxbo/VSO1pMh4umTyfBZB8mPeO
DfEw0uNNVye2YYSOJrnRQTeWRn639SHQ2GTOrXpsDqnNu36xWyHYnXnVsHkm1eXM
U0XNDhFLngmaiY1UUf14vgFWOwCCboaobCNCEn/A5yjEgn7dM5LA20BTvXfGzXCK
VyrJISO7CDmgtmeYvj2iCtbpAFqdko4d2Nu0KFMe5WqpbaUMfjZi/HWYVdOcC4xO
WqorrgADyxodA6mUXzo7NFmw9bvSeuJW/4HULbDGzi1kMu4nkoR19M+o0+4PqyM6
taTEBmDp/pDF/WVs1UFI6ZvKsbDLyM8OJSMpp445WxRrHdGOjacMiNXEZhapKo5B
7bGUouz68jX/R9tyN7vMqJNjedzHiarwYTCQ0EgNzELBrjb9urhqi6798bof8te2
ZI/0MYBcLs7MjUvP3W2VH/PhcmLeQNEDIKdR+5ng33kQ12c2M1k=
=aiFb
-----END PGP SIGNATURE-----

--vc3pnplyzpoz27bd--


