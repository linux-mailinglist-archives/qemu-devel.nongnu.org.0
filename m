Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37224BDACF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:24:34 +0100 (CET)
Received: from localhost ([::1]:39152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBUH-0001lq-O6
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:24:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMB4t-0000TW-MZ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:58:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMB4r-0002bM-2p
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645459096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YBL9u67bztZ7WIWfVb+rLnEVmVolX2I05x2V2gxqzFQ=;
 b=S/Lar4VXDGq9Da8oq4HJrk9BhaLpIbx11eM9jo+9JWY1lNL70FFUiPMwSHhlErbW6Qc1DT
 DTAd63uriEDM6xXiyHiABSLHaNckWI21M3aeCeu4v7lWhCJKLCrIE/BqymFsn8yfsXvyxF
 IjKDwSPX0/62EjFuAHo1cwPpq+mmDXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-eCJWhthRN1CZrL_FkQofTg-1; Mon, 21 Feb 2022 10:58:13 -0500
X-MC-Unique: eCJWhthRN1CZrL_FkQofTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F01093923;
 Mon, 21 Feb 2022 15:58:11 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76C457E2E8;
 Mon, 21 Feb 2022 15:57:53 +0000 (UTC)
Date: Mon, 21 Feb 2022 15:57:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 09/19] vfio-user: find and init PCI device
Message-ID: <YhO2gARa4poEBSzI@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <fcc3548397af6c548d46fdeb1ddeedc1c71f28e2.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ga+WsORUZoJ7gn6Q"
Content-Disposition: inline
In-Reply-To: <fcc3548397af6c548d46fdeb1ddeedc1c71f28e2.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ga+WsORUZoJ7gn6Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:48:56AM -0500, Jagannathan Raman wrote:
> @@ -221,6 +272,14 @@ static void vfu_object_finalize(Object *obj)
> =20
>      o->device =3D NULL;
> =20
> +    if (o->unplug_blocker && o->pci_dev) {
> +        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
> +        error_free(o->unplug_blocker);
> +        o->unplug_blocker =3D NULL;
> +    }
> +
> +    o->pci_dev =3D NULL;

Since we don't hold a reference to o->pci_dev there is an assumption
about the order of --object vs --device ->finalize() here. I think it
will work because softmmu/runstate.c:qemu_cleanup() doesn't unref
main_system_bus and only --object ->finalize() is called, but this seems
fragile. We should probably hold a reference to pci_dev and call
object_unref() on it.

--ga+WsORUZoJ7gn6Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmITtoAACgkQnKSrs4Gr
c8i4OggApQiUuu7WJH1BxYvPWJbaKwrN+h0XOPXMKy61gKxUOfOWIPTTkZ4I/YZE
Kpl/Aioabg4MDbJZzJQedWwVLbGv951Pk8qiwltEOuUauzWYY5g6oL+47LpJ14CL
yifgRlhRXgI4OEyGJP90BvfgWSwtyGvkNcZH9m06ZXwOONr5cFO7hQmdbK/WFJhJ
GHjGRnlUp0+F/IzATzAF7DH6CAteRtls7pYveZ0tL1xpHoyVIOMYGbu43X37kPEP
hAKqsxpX4Au2mbpnC+abDAF8mqfoYMoJr6xeaGXWHzNvalpzdrKgTB3jcyw7jstK
hMmuE306g6LNT6cHiel1+hwtpxwa/Q==
=3oM2
-----END PGP SIGNATURE-----

--ga+WsORUZoJ7gn6Q--


