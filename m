Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C055C2F2DE3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:28:46 +0100 (CET)
Received: from localhost ([::1]:52874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHqv-000284-RY
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzHfv-00068D-LF
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:17:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzHfs-0005oI-2Q
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610450239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XHYPRaeOVd+RUqfYKAwxG2g4dy99D1y/aahPeDJnus4=;
 b=RgKANT726MK3fMlglbBc2PUZpudzGN6rTzZ/b1ns0MUqzqJ9n5songVi6xzMWX/XmmJluX
 qAXlnoofGef06QDKnD56kEUsTKmdVZM2+9/vAdkHyRo6zmpZWjyJjgn4ictV3HKsdcfzKn
 NBR7VKmB8eNAs3shC+3kuwwXXpL7yeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-g9iw6mFrNrKrpUqnduhzOQ-1; Tue, 12 Jan 2021 06:17:15 -0500
X-MC-Unique: g9iw6mFrNrKrpUqnduhzOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3420879500;
 Tue, 12 Jan 2021 11:17:13 +0000 (UTC)
Received: from localhost (ovpn-115-99.ams2.redhat.com [10.36.115.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D7E660C5B;
 Tue, 12 Jan 2021 11:17:05 +0000 (UTC)
Date: Tue, 12 Jan 2021 11:17:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v16 00/20] Initial support for multi-process Qemu
Message-ID: <20210112111704.GE194658@stefanha-x1.localdomain>
References: <cover.1610339529.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cover.1610339529.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2021 at 12:05:45AM -0500, Jagannathan Raman wrote:
> [PATCH v16 08/20] io: add qio_channel_readv_full_all_eof &
>                   qio_channel_readv_full_all helpers
>   - Added two variants of readv - _full_all_eof & _full_all based on feedback
>   - Dropped errno return value
>   - Updated commit message
>   - Unable to remove local variables and set arguments directly as the
>     arguments are later needed for cleanup (g_free/close) during failure

I noticed issues with the qio_channel_readv_full_all() error case and
posted comments on the patch.

Stefan

--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/9hTAACgkQnKSrs4Gr
c8izdAgAyWCXIzmCin8x3Z5q8yafJpwBPZuS7V2tlfXIypvmPDmE1sPNRYjEtT4i
tHBIcp9JD6tWcrUu1lerKldwxuyPBNuS3y3Uu53a6mGJyXxa1nB19lPwQg0vi2BM
UlkBsVDlvBw7BwePE5k7cmXeHvn2kQPWvbOnuSOoMl+r3BW8HCW0dU6qMeWjYXE2
wkY2+3pjGXvg/c3QB7Krv6hMQ0a8n5hnoVD55C4E3/EJJQjckmRcAKvoLb8ODq5D
829gu45GuY3dsYNmjJkRoA15PfKeH5vCzV94YonR3ILUx/uz4Uplqm0eH/MehIw0
ZZwnAzBumLB6SqrQ1wjJYuQhN6n04w==
=y+zt
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--


