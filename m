Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0304BDAA9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:46:47 +0100 (CET)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAth-0005zz-13
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:46:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMAq3-0002gE-5R
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:42:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMApz-0008PH-W7
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645458174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nTfbv0VnxTfeydp3wqf9SqfmjKhVx5dvgv/BBVTm7JY=;
 b=PKkq+5Jme5gqIIU9JJBQ0sQG0go323o52hGXYNKXkZpKKoBhOlq3ixoywZvxYrVG87SCZ4
 6UCQd4rdJMpQFRYcthNlQ4w3HAB1aGQI0K6k5GW222FXhcDw5Tp5MIQXNHzNx8R+n1FlOU
 qf0bPBE3KP1Ijh1ecULpl9fozV9BvrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-9RDUGb7nMAKN1lwWRtCYgA-1; Mon, 21 Feb 2022 10:42:51 -0500
X-MC-Unique: 9RDUGb7nMAKN1lwWRtCYgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E257A100C661;
 Mon, 21 Feb 2022 15:42:49 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B3B772FA7;
 Mon, 21 Feb 2022 15:42:36 +0000 (UTC)
Date: Mon, 21 Feb 2022 15:42:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 08/19] vfio-user: instantiate vfio-user context
Message-ID: <YhOy6l1mJf1HwwIG@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <f299f4ceb5b3c49ee95176a7206bc1e63e190bc1.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TP/cXTAEvd58S8LQ"
Content-Disposition: inline
In-Reply-To: <f299f4ceb5b3c49ee95176a7206bc1e63e190bc1.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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


--TP/cXTAEvd58S8LQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:48:55AM -0500, Jagannathan Raman wrote:
> @@ -124,6 +190,11 @@ static void vfu_object_init(Object *obj)
> =20
>      k->nr_devs++;
> =20
> +    if (!phase_check(PHASE_MACHINE_READY)) {
> +        o->machine_done.notify =3D vfu_object_machine_done;
> +        qemu_add_machine_init_done_notifier(&o->machine_done);

This probably has to happen after the next if statement since
qemu_add_machine_init_done_notifier() can immediately call ->notify()
and we'd try to initialize on a non-remote machine type.

--TP/cXTAEvd58S8LQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmITsuoACgkQnKSrs4Gr
c8jFAAgAhWfx3N4mC0JJNQmSP3isPnPGfiPd9hI+PoH9rm1gxZkNe+vGwEdifGjQ
4p6O494Hyb7EWiKCpinANSFsFvOLQdjME72q0RbM9ec5TyXPYi/0Qk+PnYmBD6H4
gxEROq8jhnDlkYWQ78m4+4F89lPaxAZAiBhvXxcEy69zMRTdEZAPfA/l6Wh7FSOg
7XpL4Pz6ZR5Bp4ejSDstZnbBHwZazs52VEgXTeI250JCIAmr8oZFjje22OeX8zFJ
NGiUKuAPAzEf37j13fApT6j3oh5x6O1W+3maK0u01Sqtp+O1tFuPE+Gr1OObbDNW
FlXIyjvPMOmUjhDsqQ4tHiFFpAZpqA==
=6GJb
-----END PGP SIGNATURE-----

--TP/cXTAEvd58S8LQ--


