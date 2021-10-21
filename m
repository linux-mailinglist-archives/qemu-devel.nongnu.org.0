Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F9E4365F7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:23:04 +0200 (CEST)
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZuJ-0001Dw-Eq
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZsK-0006t4-IR
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZsH-00056a-Oh
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634829654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V92QC3cgthuquJsoqlHSOiRHa+89ZljgrQFk5+xNe+I=;
 b=UB3JK5R1IGq/Cjw3eqYuiGfn1SKkDdovZSUuuVWLI3mc9ASQl4uHRcgHcj42vrJ8ewdDlt
 GQv0dlSAO7kuGifw6+eLXHW1XcSkajJX12YK2NiKFaXN3J59UBtHwIAyK5cQXtXcgeMsZZ
 gv8jQ6Lk9Yw5CjWKguT8nwWEyD8vo3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-XYHYqY1-M920fN1c1VE3uQ-1; Thu, 21 Oct 2021 11:20:52 -0400
X-MC-Unique: XYHYqY1-M920fN1c1VE3uQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF56579EDC;
 Thu, 21 Oct 2021 15:20:51 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7548C99BE;
 Thu, 21 Oct 2021 15:20:51 +0000 (UTC)
Date: Thu, 21 Oct 2021 16:20:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 3/3] linux-aio: add `dev_max_batch` parameter to
 laio_io_unplug()
Message-ID: <YXGFUqWqlLYLO7y0@stefanha-x1.localdomain>
References: <20210923143100.182979-1-sgarzare@redhat.com>
 <20210923143100.182979-4-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923143100.182979-4-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wkso0hP4CUh1Jih+"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wkso0hP4CUh1Jih+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 04:31:00PM +0200, Stefano Garzarella wrote:
> Between the submission of a request and the unplug, other devices
> with larger limits may have been queued new requests without flushing
> the batch.
>=20
> Using the new `dev_max_batch` parameter, laio_io_unplug() can check
> if the batch exceeds the device limit to flush the current batch.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/block/raw-aio.h | 3 ++-
>  block/file-posix.c      | 2 +-
>  block/linux-aio.c       | 8 +++++---
>  3 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--wkso0hP4CUh1Jih+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxhVIACgkQnKSrs4Gr
c8hQ5gf/eLkfGmOkIQ0ruli0+TGWF2flssH5R0oBdZeDIHEvqFRwBHbjKceNfhsB
/t9JK+XtLqT1AUsKngbCAaIhmsi4JiIzYA6T56BTUFMjLFdJnLMaJ5qSo4sJBegP
KlsGDyF46EmgORCEg+pjNa7ZLS5CIRBpdtJtk/GjnbCzE5uRdF7Z5OsiCTAPtIqb
t18r0neERyRA9qllNJwLm92wZFKd83h0jQv60Vp0cMee+EO/G2bmx2LuBtRCWisv
T2EL3XsJlwzs28j73EJTOXgTjmsdNN0Yt975FzkvEIV3dJCFxTbvlCZFCB2dupb+
WrPlm6uDUM3fRefFYZjvGHlotn1F7g==
=dGIP
-----END PGP SIGNATURE-----

--wkso0hP4CUh1Jih+--


