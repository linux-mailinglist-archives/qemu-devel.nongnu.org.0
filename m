Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A491E49CAA1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:21:01 +0100 (CET)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCiEM-0001ur-MD
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:20:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCi5d-0008L1-8d
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:11:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCi5T-0002Ex-Ee
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643202701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qLZDDiyi+JYv96IPGAnoJ5fkIqZyzkyH2xxLtNtNx74=;
 b=ESQJ8LGB+VoVOO3/RgKiFGHOr7snOZv63nhdNUWX9AQvP3o3x4rbfOsJne7E37D86b7isi
 6YsOZ8nCudDoKTeN3uEeVGcPWuAO35Yuy0brob4UG0kP0sQadcsiXw9Xu92Ws+8/iH0OHY
 44Ce+KB26tsb6tPthU8tPRuLDFSgF/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-4-mopKehOh6usGDHQ_m7qA-1; Wed, 26 Jan 2022 08:11:39 -0500
X-MC-Unique: 4-mopKehOh6usGDHQ_m7qA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09713104FC0D
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:11:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B76B1F473;
 Wed, 26 Jan 2022 13:11:38 +0000 (UTC)
Date: Wed, 26 Jan 2022 13:11:37 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: tracing.rst neglects to document syntax of trace-events files
Message-ID: <YfFIiV3RTaHTYKis@stefanha-x1.localdomain>
References: <87zgntpi3t.fsf@dusky.pond.sub.org> <YeaCFxnGltxc5uFR@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="exERAYF1Y7mIkHC/"
Content-Disposition: inline
In-Reply-To: <YeaCFxnGltxc5uFR@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--exERAYF1Y7mIkHC/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 09:02:35AM +0000, Daniel P. Berrang=E9 wrote:
> On Tue, Jan 18, 2022 at 09:23:50AM +0100, Markus Armbruster wrote:
> > Almost[*] all trace-events files start with this line:
> >=20
> >     # See docs/devel/tracing.rst for syntax documentation.
> >=20
> > But I can't find syntax documentation there.
>=20
> In that doc, under the heading "Declaring trace events", is a wordy
> paragraph that looks like it was attempting to fill this need,
> especially the last part.
>=20
> [quote]
> Each event declaration will start with the event name, then its arguments,
> finally a format string for pretty-printing. For example::
>=20
>     qemu_vmalloc(size_t size, void *ptr) "size %zu ptr %p"
>     qemu_vfree(void *ptr) "ptr %p"
> [/quote]
>=20
> It certainly has plenty of scope for improvement though !

Yes. Should we rename the "Declaring trace events" section to "Syntax
for declaring trace events"?

Stefan

--exERAYF1Y7mIkHC/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxSIkACgkQnKSrs4Gr
c8gkuwf/f1nc0FUppJutQeYNp5DIgmIM/QdwAXVYLUY0DbK4opbi0ia7i/ELx4Ip
bFEuCI6y6C/cDnv6OZvoJk75AN2h5u1CbN9OZt43WC8T+Whg1NU9NCsQmvainUbL
C8QTr0sQN7wFeQFMsiY6Oatq0VEpHooXJf/uV4Id3tF3DB4lorK6XgzxJ0jvUQ2k
MSF1z31iR6FGfXqs+NeLrKMHG+KHaLHnzO+8uIGroM2/HuoYEV4AlXxDxAVDVpBn
4+U8bKqeaOSjgzoJpUKNQMQYPA5rCMXnCtrnckmbs2HFe0H6rugVWNm9E5PNeNW+
fzw8Krkl/IRUIBkbClYnAyaXltI1Ug==
=JyKq
-----END PGP SIGNATURE-----

--exERAYF1Y7mIkHC/--


