Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C24D149C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:19:18 +0100 (CET)
Received: from localhost ([::1]:37822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWw1-0002gA-Ub
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:19:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRWsV-0007V3-3o
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:15:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRWsR-0000mc-Sb
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646734533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3KwDmwhwDWTTmP0UZSLpsnS2aUWGC3VBOdIuKfh51DE=;
 b=gLa6qD+7d58fEP/8rkTmAPXt2Myqxjb0bJ1w3JfMwzYbz8Uwt6kwmvMeZwiVPGrDbZdxAN
 jMKqf6a9hcQ7iFrW/zG3qJ0auo1G+gLVRJTGuGysGe3s9JBZCZYGp3wm4RjJ6c0LMKQW1c
 JUIPcJYbuAjn+soGPlaeZOuXegwECPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-F9bUrkr6N-WYWmPA7fNocQ-1; Tue, 08 Mar 2022 05:15:29 -0500
X-MC-Unique: F9bUrkr6N-WYWmPA7fNocQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 410B2801DDB;
 Tue,  8 Mar 2022 10:15:28 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BF5422DF4;
 Tue,  8 Mar 2022 10:15:27 +0000 (UTC)
Date: Tue, 8 Mar 2022 10:15:26 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 15/19] vfio-user: handle device interrupts
Message-ID: <Yicsvuie5xZj5IOY@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <ba5a32f3def72ce66a894191747dcafd63e7a517.1645079934.git.jag.raman@oracle.com>
 <YiXdUbz3r1xORJKD@stefanha-x1.localdomain>
 <217B92CB-B619-4B09-9ABA-200DA703C617@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J+RMrN4+L6SxvTBL"
Content-Disposition: inline
In-Reply-To: <217B92CB-B619-4B09-9ABA-200DA703C617@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--J+RMrN4+L6SxvTBL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 03:10:41PM +0000, Jag Raman wrote:
> > On Mar 7, 2022, at 5:24 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > On Thu, Feb 17, 2022 at 02:49:02AM -0500, Jagannathan Raman wrote:
> >> @@ -332,6 +336,13 @@ void msi_notify(PCIDevice *dev, unsigned int vect=
or)
> >>     msi_send_message(dev, msg);
> >> }
> >>=20
> >> +void msi_notify(PCIDevice *dev, unsigned int vector)
> >> +{
> >> +    if (dev->msi_notify) {
> >=20
> > Can this ever be NULL?
>=20
> Unlikely in the current code flow, but it could change in the future.
>=20
> As a matter of principle, I thought that we should check if a function
> pointer is non-NULL before invoking it in QEMU. Is that not the case?

No, it's better to dump core with a backtrace when a program invariant
is violated than to silently suppress it. If msi_notify() is called but
the function pointer is NULL then there is a bug in the program that
needs to be fixed.

Stefan

--J+RMrN4+L6SxvTBL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmInLL4ACgkQnKSrs4Gr
c8j1Awf/VQrXVPdWQqqJGj70drIhjyEREfiu8uPEBV9+IjyfAUJLejB+qjlPX47G
FBz6o5j4Ts/jiRllAiXuoq+xYuiew2rr0phuOAi6cCuQeAcDr23vq+ij2reWlVgA
BiDGHkS1vAfqJ/FUPzIJIdaxj5KBrIrHEw313tiGtI6xRP/8xLxadyp7F1hF8n4K
cSz2Hetfo+nlI8z8vJro2Iv0h75mRWq0Y6UuJn/70asgaBzPt+vcRrr1Y4wwnxJd
cXbE0QILmF164PfE6E/ngDtZW2Yb+sEXvcprkYboDdUMFDV4HBEP37CdEZfRlQlO
0cxU/pLmt+aQpgjkanGSGTjHTcUM/Q==
=jgvX
-----END PGP SIGNATURE-----

--J+RMrN4+L6SxvTBL--


