Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6712A4EAB3B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:30:21 +0200 (CEST)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ97E-0003Nz-2T
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:30:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZ93p-00016r-JL
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:26:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZ93n-0008HK-49
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648549606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gbjSfewYNK9fOna8q+1C54jLflPuEWyD6Z3Xv2CcV0g=;
 b=b7bpkBl7tgRU5KbWihyWsYiOlYUUjQGu0Hm/duD08i2B0OTftnsru2JXcbcODGBo9M0ONg
 RR5FKGEGka4PDSBiEzXgpfXG9h1W/XZszx4K9LY2OlGlqCyxN3qo5zulhaQ2Oi+D49qZ60
 9YNFOhQD/9I2nC0hnTWCsEP5on2msXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-rMpHpxP5OWu74fzKjMH5eQ-1; Tue, 29 Mar 2022 06:26:43 -0400
X-MC-Unique: rMpHpxP5OWu74fzKjMH5eQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 525C818E531C;
 Tue, 29 Mar 2022 10:26:36 +0000 (UTC)
Received: from localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CABC2026D6B;
 Tue, 29 Mar 2022 10:26:18 +0000 (UTC)
Date: Tue, 29 Mar 2022 11:26:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v7 08/17] vfio-user: instantiate vfio-user context
Message-ID: <YkLeyRyM3CYx/ftJ@stefanha-x1.localdomain>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <a3adbc37a90f4e09339c11a9c9e5164497dbca38.1648234157.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TaFbDU9p+/TeLgz+"
Content-Disposition: inline
In-Reply-To: <a3adbc37a90f4e09339c11a9c9e5164497dbca38.1648234157.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--TaFbDU9p+/TeLgz+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022 at 03:19:37PM -0400, Jagannathan Raman wrote:
> create a context with the vfio-user library to run a PCI device
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 82 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--TaFbDU9p+/TeLgz+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJC3skACgkQnKSrs4Gr
c8iCuQf/QMu9C8fJG54oDsgAa5X1HvbNCWpVdprQOrvcOAbbZ3H9t7VuiVL0cT6f
+/ZbxFFelvb7OLu2AU6cB0GcBjEAy+KJIbALSEHOOaRKs4KQ/pAq3G4+Z0BaEa89
TT/5P3zIVFjzisTspsMt+fRov0m+Bu1DfK2JcEb4SvlXOecZRBUJnD1tmq2HZ06g
vLOYzwyQg0flXmptJmsr4Vt96xVBAa65KK19KIs6m12HsKWrP4j9U5SU1fISv9KZ
/4J7N/hacFgFtylV47bDDsN2aAyta+kTCHOhLXBb3kHvfgwojyfQh4mjTMYkC51b
sxpEX6bHi//L8uiwN5Jnmhk7BqgaIg==
=Tolh
-----END PGP SIGNATURE-----

--TaFbDU9p+/TeLgz+--


