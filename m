Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2798C4BDA9A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:43:10 +0100 (CET)
Received: from localhost ([::1]:48078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAqC-00020x-Qk
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:43:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMAg3-0007G3-K3
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:32:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMAg0-0006bt-Lt
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:32:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645457555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/HmKLrM9kWDE+XFFpjThlL9kUwlYy1g966wx6IoaIE=;
 b=HEICVLrt4ec7cgYy969Fi806Np/2K3KTfF9rwR4pSN2MjZcfFT6B3T1mX7Iy9TqUlaofJg
 22ZMGI09Wjrqoz3mwZ54wDBS52LdwtMHQDQ0m/LvAt/EdlJoj8fSv7Ll2+/j1oVuwOObjP
 vdGe7XrV8ArW5vsYhEwJVSJg+5k0l8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-5KjDBbJ0NuuhJnQWjWsF6w-1; Mon, 21 Feb 2022 10:32:32 -0500
X-MC-Unique: 5KjDBbJ0NuuhJnQWjWsF6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8D572F4D;
 Mon, 21 Feb 2022 15:32:30 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 293D78462C;
 Mon, 21 Feb 2022 15:32:04 +0000 (UTC)
Date: Mon, 21 Feb 2022 15:32:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 05/19] remote/machine: add vfio-user property
Message-ID: <YhOwdMbRwufQuhr3@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4f063dddc17a2ac1f8c9088641df455957a3f78d.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="T32MvXC75XELonmU"
Content-Disposition: inline
In-Reply-To: <4f063dddc17a2ac1f8c9088641df455957a3f78d.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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


--T32MvXC75XELonmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:48:52AM -0500, Jagannathan Raman wrote:
> Add vfio-user to x-remote machine. It is a boolean, which indicates if
> the machine supports vfio-user protocol. The machine configures the bus
> differently vfio-user and multiprocess protocols, so this property
> informs it on how to configure the bus.
>=20
> This property should be short lived. Once vfio-user fully replaces
> multiprocess, this property could be removed.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/remote/machine.h |  2 ++
>  hw/remote/machine.c         | 23 +++++++++++++++++++++++
>  2 files changed, 25 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--T32MvXC75XELonmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmITsHMACgkQnKSrs4Gr
c8gWDgf/cA1vDT/OFg8BRPlK5GFUnYNzouM1tfKkkDRO/niKdlLaFDZE25xMH6EE
/NLjqfN7VHnqAjt0MObD82JDA4STvtNPVrjwAtTYT5BO5Ol5bCXmjNNmU7NDZhug
sIkYtfAQshMhTLDxqb982RIPDG/+6Aay3KEcynxQgX2wXCZCA1hPswHTF1d7m6hn
xqp0zhWsutu1CS7XZF/c84NY9NSmfQmICSGwlfcXDZSpKy6806Ehn1RESVdAt6XG
F5+osLWClpRrua4kpDHLVLosrL5D2hiC96nO5KkouGprXELypi4oTNsz6+NCK9WY
BLcYF91Jbn8Nj/vazqN0R+5eYkQNxQ==
=jYSM
-----END PGP SIGNATURE-----

--T32MvXC75XELonmU--


