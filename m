Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC263A9F1B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:32:40 +0200 (CEST)
Received: from localhost ([::1]:59854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXWx-0001y3-KT
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ltXV1-0008Ng-Tk
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:30:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ltXUx-0002a6-DH
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623857434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oigv+rqvs4aMKlcj2Xe9aiptf+MttTcWdAl0CtC4EVI=;
 b=hFkYhdIUSGheWZRA53WWh+h71CP5KP5nnTCCtSW0Wlqkk4+8YV9DY7lLHMa51Vx59Wd3LO
 xyxlHYVGYDO6DhlFjr4CvTJcULxPw3i1nX8kyUwH78dypjLjX/8tD/bsj2goNJrOHsVEw6
 SRPxW7zI1dXLQHxPDomE6PB9s3+lAwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-UrX6U0rPPQq82tYRAINKtw-1; Wed, 16 Jun 2021 11:29:37 -0400
X-MC-Unique: UrX6U0rPPQq82tYRAINKtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9270080EDA3;
 Wed, 16 Jun 2021 15:29:36 +0000 (UTC)
Received: from localhost (ovpn-112-26.ams2.redhat.com [10.36.112.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF3F519C66;
 Wed, 16 Jun 2021 15:29:32 +0000 (UTC)
Date: Wed, 16 Jun 2021 16:29:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 26/26] virtiofsd: Ask qemu to drop CAP_FSETID if
 client asked for it
Message-ID: <YMoY27s0zoFzE5wg@stefanha-x1.localdomain>
References: <20210428110100.27757-27-dgilbert@redhat.com>
 <YJQNIPaFCJlG7ZKc@stefanha-x1.localdomain>
 <20210506160223.GA277745@redhat.com>
 <YJj3RSxXKZHxmiKu@stefanha-x1.localdomain>
 <20210510152324.GB150402@horse>
 <YJlSHZ0vzNtCAjkJ@stefanha-x1.localdomain>
 <YK/uUUZI3zy9k8Vk@work-vm> <YMIv5odJWdkbJzWL@work-vm>
 <YMI8fS6m8CjtUtmE@stefanha-x1.localdomain>
 <YMnwOs9bxKLB8wSL@work-vm>
MIME-Version: 1.0
In-Reply-To: <YMnwOs9bxKLB8wSL@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vCVPAPq/bsUMZ+fR"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vCVPAPq/bsUMZ+fR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 01:36:10PM +0100, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > On Thu, Jun 10, 2021 at 04:29:42PM +0100, Dr. David Alan Gilbert wrote:
> > > * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> > > > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > +    uint64_t addr; /* In the bus address of the device */
> >=20
> > Please check the spec for preferred terminology. "bus address" isn't
> > used in the spec, so there's probably another term for it.
>=20
> I'm not seeing anything useful in the virtio spec; it mostly talks about
> guest physical addresses; it does say 'bus addresses' in the definition
> of 'VIRTIO_F_ACCESS_PLATFORM' .

I meant the docs/interop/vhost-user.rst spec.

Stefan

--vCVPAPq/bsUMZ+fR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDKGNQACgkQnKSrs4Gr
c8gLiwgAn8wLJm2ypupTK9cxtNCYleDFZ+gqwPLMEnxXNbLdRvTZhB+leOAkqV1w
bX36vWqDcXAk+gxk6Ld3ocZcnEl8/0YLeMjI9cj1dSSnPt6FxaaD/wLsthJPdk5h
TajFVUX9b1b7PhCWYnYrGxntCsjtbhE3C81/A4iyWWGIutoBwVViZgKO28wUJD0p
Yeu/s5YAdNs+U+Ge6Q9MbqOZRGXa1ftDwLq5u8aDFU+730JO0nW77njMLej2rhlz
IF/H9qAByNg5mmc18zUmc/xyJAEg7gv7Xs3vbsN7eqBoKvDPZuqkGqudYRCigX2U
DvasdqGwBmq6azWna46Bo4FJVLkOJA==
=RR56
-----END PGP SIGNATURE-----

--vCVPAPq/bsUMZ+fR--


