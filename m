Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3602F50DBB9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:53:54 +0200 (CEST)
Received: from localhost ([::1]:52860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuTh-0007Sx-4J
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niu0G-0006kN-8P
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niu0B-0002ke-Km
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650875002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z/L/ZknMNfEQ3o6kt7TmKa1CIoUksIAbvfZ3DejgADk=;
 b=fHAX/pNebShbVpY4hD8Mco1T6nT2bJBPFZjYYRF/5uRgya/yX5RGlqrg4W0z6QEu9p4Bmf
 IKzBjxPOxKeEvHj/3k23/+cer9HvcyVTb1btryDgP+7078Sf6u4F/u5PCQDZikSd7LSTi8
 dz+Ie1w7aoQcdD8XVyHH1TAl/H8BnY4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-DjAHIMvBNtSq_iPUjG1fSw-1; Mon, 25 Apr 2022 04:23:18 -0400
X-MC-Unique: DjAHIMvBNtSq_iPUjG1fSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62CD6833962;
 Mon, 25 Apr 2022 08:23:17 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F94D2166BDF;
 Mon, 25 Apr 2022 08:22:10 +0000 (UTC)
Date: Mon, 25 Apr 2022 09:22:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 06/17] vfio-user: build library
Message-ID: <YmZaLzuUXh2ka6r1@stefanha-x1.localdomain>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <049efa4ec96f2e9f195ee94cbe7b49b07861af41.1650379269.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0k6SiXgE+/YV/fQ9"
Content-Disposition: inline
In-Reply-To: <049efa4ec96f2e9f195ee94cbe7b49b07861af41.1650379269.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, thanos.makatos@nutanix.com,
 kanth.ghatraju@oracle.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0k6SiXgE+/YV/fQ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 04:44:11PM -0400, Jagannathan Raman wrote:
> add the libvfio-user library as a submodule. build it as a cmake
> subproject.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  configure                                  | 20 +++++++++-
>  meson.build                                | 44 +++++++++++++++++++++-
>  .gitlab-ci.d/buildtest.yml                 |  2 +
>  .gitmodules                                |  3 ++
>  Kconfig.host                               |  4 ++
>  MAINTAINERS                                |  1 +
>  hw/remote/Kconfig                          |  4 ++
>  hw/remote/meson.build                      |  2 +
>  meson_options.txt                          |  3 ++
>  subprojects/libvfio-user                   |  1 +
>  tests/docker/dockerfiles/centos8.docker    |  2 +
>  tests/docker/dockerfiles/ubuntu2004.docker |  2 +
>  12 files changed, 86 insertions(+), 2 deletions(-)
>  create mode 160000 subprojects/libvfio-user

libvfio-user is BSD-3-Clause and libjson-c is MIT (Expat).

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--0k6SiXgE+/YV/fQ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJmWi8ACgkQnKSrs4Gr
c8ieuwgAyLfphSaGrciZvBIESnyySaeY3iqPAFVs9qLO7dSwKfuEmMzK8A0+zYSP
IgJdiA8IGe933BVAeO44ea+eTTy9pUwN20o0uElHwAc28x/h2NqFKh7onlMOVbEQ
wbQ3ccWp8ibCHeJQpQo6xOsd7kKZcy1HrwPYTWg8+QynJz39MTVZ7h1CglC8VF0Z
35x8P0dtrHgCWKjw3EeFVh8HlTVtkq2q735TMfQ3NEesqJpRsfpxpfTFBCyWyB3q
P5zQPixH0SNzlfu4W30PL8a9hjK3AUyuc9XBR7tIgpae/OgEKaD5AjZqZPlr+RCJ
IHAD2b1REwu8SG+38JsKFQpNZciqZQ==
=b8wW
-----END PGP SIGNATURE-----

--0k6SiXgE+/YV/fQ9--


