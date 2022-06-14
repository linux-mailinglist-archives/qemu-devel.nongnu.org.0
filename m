Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E76254B66F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 18:42:49 +0200 (CEST)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19cu-0004p4-AB
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 12:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o19OC-0002kS-Fi
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o19O8-0007oa-JN
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655224050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TZs0skdfRCOOfC2iygL/Yzq3oetV4vB/SLJpTwD5qtQ=;
 b=VTd0tbpwr9keJJ4bjlTEtqCQhrS0GykRvqzU597TNABdcACztCZf6GJXSgDvabI6kbvCft
 PezF73j0Pomy0fV+L1Pm492P04VFNSn8G2HW2LivuegM55s6CXMH8Vfxxje1ew+kJN4cTV
 Xf+B4yitfzqbthMmnwVNnKJ5u4H0Hu0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-QEg04w-jPfimOkMJ-lgR5g-1; Tue, 14 Jun 2022 12:27:27 -0400
X-MC-Unique: QEg04w-jPfimOkMJ-lgR5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD8C13C025B5;
 Tue, 14 Jun 2022 16:27:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 421472166B29;
 Tue, 14 Jun 2022 16:27:26 +0000 (UTC)
Date: Tue, 14 Jun 2022 17:27:25 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v12 00/14] vfio-user server in QEMU
Message-ID: <Yqi27QRzSnL8tN/2@stefanha-x1.localdomain>
References: <cover.1655151679.git.jag.raman@oracle.com>
 <YqgzX2K9X9wLMZmC@stefanha-x1.localdomain>
 <94C1BA50-A498-4A98-A970-2E7C39C97BA6@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QiaMANqBS7fD1w7B"
Content-Disposition: inline
In-Reply-To: <94C1BA50-A498-4A98-A970-2E7C39C97BA6@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QiaMANqBS7fD1w7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 02:37:02PM +0000, Jag Raman wrote:
> > On Jun 14, 2022, at 3:06 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Mon, Jun 13, 2022 at 04:26:20PM -0400, Jagannathan Raman wrote:
> >> This is v12 of the server side changes to enable vfio-user in QEMU.
> >>=20
> >> Thanks so much for reviewing this series and sharing your feedback.
> >>=20
> >> We made the following changes in this series:
> >> [PATCH v12 13/14] vfio-user: handle device interrupts
> >> - Renamed msi_set_irq_state() and msix_set_irq_state() as
> >>   msi_set_mask() and msix_set_mask() respectively
> >> - Added missing return statement for error case in msi_set_mask()
> >=20
> > Thanks, applied to my block tree:
> > https://gitlab.com/stefanha/qemu/commits/block
>=20
> Thank you very much, Stefan! :)

You're welcome! Thanks for the persistence in getting the vfio-user
server into QEMU.

I have mirrored libvfio-user here:
https://gitlab.com/qemu-project/libvfio-user

The QEMU project's policy is to mirror dependencies so full source code
can be provided even in the event that dependencies become unavailable.
The mirror is currently manually updated, so please ping me if you want
newer commits.

Thanks,
Stefan

--QiaMANqBS7fD1w7B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKotu0ACgkQnKSrs4Gr
c8hCXAf/dnbeBPeUU6oW2Xmx6G/JkPVVedLvIUhJRJELAguj+eXiL0hXetdtKdOW
D3jk8FLrgZLQRQ2QLccEF5nxaJSMCM+RtsZlnt+UdEARgePW7JGn/TY+hmaDui4D
PJv1Cquu4bm38UyJl+jVHciSgSI/g96bzfFHzIU9fdEXkCaMhV3qPdr+fAJvm/Kh
AlJOHhGUBZ2TqzSEXyarEJQeV4y4hIbnY1n1V3p8z9sR0z9o/8YB4SxsMf1YuzVo
kLVQZtI0Smp3IjsqJ1SfjH+bugj7jZ8FiTtFu+rheZdRzORsYyYqa/Hk1rUAfu7t
ZlcHTJOGi39pRxacTlNI9gBnnYcPQg==
=uOqx
-----END PGP SIGNATURE-----

--QiaMANqBS7fD1w7B--


