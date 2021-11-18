Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD296455985
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 11:57:50 +0100 (CET)
Received: from localhost ([::1]:57414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnf6z-0006DS-Iz
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 05:57:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1mnf4c-0003cq-OT
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:55:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1mnf4Y-0008Ka-Ef
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:55:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637232916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y5OmK6JU9tfim6d1Ub4jNqBh/ipBGxW/CCi5MzxCeXU=;
 b=MPwTRTNX65T4XNBrgFh/n0bPJ6K8fau4t2LPMY8nhYNjTJm5Otazg2Wg9PIDvFl3/aNUpo
 nWgUVgHsVOoMSnwHScK+zdCEK+Sg4xex7Y6bhzpwBkrz8CEypOJy1x0c8hGGot4bml4CH3
 vQtNBLi+Tw/hqHMYSOeeWAAc4/9PzYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-mz7Wd3NHPaWrhNgbkJcYEg-1; Thu, 18 Nov 2021 05:55:12 -0500
X-MC-Unique: mz7Wd3NHPaWrhNgbkJcYEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67C1A8799E0;
 Thu, 18 Nov 2021 10:55:11 +0000 (UTC)
Received: from localhost (unknown [10.33.36.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2DBD5C25D;
 Thu, 18 Nov 2021 10:55:10 +0000 (UTC)
Date: Thu, 18 Nov 2021 11:55:09 +0100
From: Sergio Lopez <slp@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2] hw/i386/microvm: Reduce annoying debug message
 in dt_setup_microvm()
Message-ID: <20211118105509.ax4om2n3iu474ugl@mhamilton>
References: <20211117174331.1715144-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211117174331.1715144-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="klpmdsshfqyrtreo"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--klpmdsshfqyrtreo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 06:43:31PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Fixes: f5918a99283 ("microvm: add device tree support.")
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/i386/microvm-dt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

> diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
> index 875ba919639..6ee6c42904d 100644
> --- a/hw/i386/microvm-dt.c
> +++ b/hw/i386/microvm-dt.c
> @@ -327,7 +327,9 @@ void dt_setup_microvm(MicrovmMachineState *mms)
>      dt_setup_sys_bus(mms);
> =20
>      /* add to fw_cfg */
> -    fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
> +    if (debug) {
> +        fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
> +    }
>      fw_cfg_add_file(x86ms->fw_cfg, "etc/fdt", mms->fdt, size);
> =20
>      if (debug) {
> --=20
> 2.31.1
>=20

--klpmdsshfqyrtreo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmGWMQ0ACgkQ9GknjS8M
AjU85BAAtNm5onAuo077b+XR03qGwEueSzM+YPJViQxa1lMJcCUn7JzdPrVUcgHO
dlKzNfEBFKZ/Hc/AnJHB2GkAsXabVZd5dgbRq1m9vsxrR6tym3o3ZGy3GUVrcSLB
i9yERsNZxYjpQgPRSL5SLUXXIchze07rGC19sjsHNJXpM2wRUmJ6X1QxI+uq2jr4
sm2mfSrsJW/2OKmzokRyiSM4CWV2t+H35q2ioM8fzRjgWhM0yeqDK2d9NIF5Zs4q
xesTQdzibuYiQt4C3xwgiUs4jC0MSuNF4r/HOGlmVRvasSxWwpmE4jbW7Yj79CBb
v/N0UHgLGr1phk1MlDbyXpvZyP2j/VbLAlk1vsR5OmeC55yHrZmt1vhciXD1DwyQ
PoDZDJfB2SqOYlhBM43E7HZ10uDO5uvywrZkKG1Xs3hVjKLpoDqVJox0F6v8cuLU
EO5jj1WhouXsIw34e1cx6rQHzAYBb6PrMvCQENyQ81KypYT2dP8w2s62aQnHOSu0
kIIahplP58DkigO+y/go8xlv5KXATSGMemjrJM3VEsdrfJSgBeIs+KUP5cxkpC8v
eQK4pvr8boBJpu/kxL7VbomjoC3bLLcd5Dc9KDSUW+M3Mbl8l/tZ5bKGFCjdCRYt
Dl8J6qnwFvSpi62VfkO+TsE2WgCYqA0RDm+CIL0iYCnkkN3yvkI=
=EUth
-----END PGP SIGNATURE-----

--klpmdsshfqyrtreo--


