Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258D53BE5A6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 11:32:34 +0200 (CEST)
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m13uz-0007zj-3b
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 05:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m13tD-0005tF-E9
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:30:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m13tB-0003Ax-Oe
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625650241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzjgEG9ZmNx/5d0ffD/qFybXJZRFB+vObTlcHHXPIfo=;
 b=FgwPnUxwUPm9uE2zw15Mlsko1YxH6b5myyXu812l/zD0qbynJzLf2WdRYB53KGgLnZQwbg
 stevlm4DdcC7KToZoMn7Hy+PiUq3xhb7fghniPf9DSuF5KGHDcfx6AD1AHEjViKAjcnUhf
 0CL99LLS9n2wkvJWabBxI6IFiB2XxXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-gxlKKzWiONW9ILfNpNVR5A-1; Wed, 07 Jul 2021 05:30:39 -0400
X-MC-Unique: gxlKKzWiONW9ILfNpNVR5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44E7A898419;
 Wed,  7 Jul 2021 09:30:32 +0000 (UTC)
Received: from localhost (ovpn-114-152.ams2.redhat.com [10.36.114.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67ACC6B91E;
 Wed,  7 Jul 2021 09:30:31 +0000 (UTC)
Date: Wed, 7 Jul 2021 10:30:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
Message-ID: <YOV0NlZOdz2WsIT/@stefanha-x1.localdomain>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <a8c1e845-bf1a-dde6-64a1-dfc89686f6f4@redhat.com>
 <e6091448-00d3-fb47-c830-a473f426a539@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e6091448-00d3-fb47-c830-a473f426a539@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+mFoaSEVYeWZTZXv"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+mFoaSEVYeWZTZXv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 10:37:03AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Stefan, IIRC the multi-process conclusion was we have to reject
> PCI devices briding another (non-PCI) bus, such ISA / I2C / USB
> / SD / ... because QEMU register the bus type globally and the
> command line machinery resolves it to plug user-creatable devices,
> so we can not share such buses. Is that correct?

I'm not sure I understand, but I'll try:

You can implement an out-of-process USB host controller (a PCI device),
but QEMU will not be aware of devices on this out-of-process USB bus.

If you're referring to a PCI IDE controller that is also exposed on the
ISA bus, then that's hard to do. Maybe there would need to be a separate
ISA-to-PCI bridge device so there's a clean separation between the PCI
device and the ISA portion. The current multi-process QEMU protocol (and
the upcoming vfio-user protocol) support PCI devices but not ISA
devices.

Stefan

--+mFoaSEVYeWZTZXv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDldDYACgkQnKSrs4Gr
c8gEtQf8DvVBu4GGKaSUz5a2vf54fOuNYMiblzP9YlQPHhfu/0UHj9Jx0QGxfF+y
dVXkkp7EJTc9DvywQFp1NnM/4Me/NDdOqLi43bF/NJZTqPOSOqpkeML5xiRlRHuO
jtlwMTA2y1jwciRF+yTh0/FbctKfENF+OQeV1Vw8NFWSMS4e4eVsigreyzS37O5n
8XONe3KJtkjYAeO0nFuFv8YpoWBPYeBxrbt1cAvvvj+MK5IGTRM2NCHCZKqYUPGh
SrEqYsVY6DeWBg/1CAC5QjtsqITFKlzT9CqpyYQq8JLPXre6QEAT2C/BqfDghc0f
Nygga3w8eFDDDrRL07QM4zcC2mw5pQ==
=yBPf
-----END PGP SIGNATURE-----

--+mFoaSEVYeWZTZXv--


