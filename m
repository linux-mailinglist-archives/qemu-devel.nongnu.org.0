Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAFA13DD8D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 15:36:29 +0100 (CET)
Received: from localhost ([::1]:43098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is6G4-0007U1-Gz
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 09:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53014)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1is6Ez-0006or-ML
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 09:35:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1is6Ev-0001x6-Rn
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 09:35:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20357
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1is6Ev-0001wY-Nf
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 09:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579185317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BCUO7kz03mNbQP5hTOasv/LzZOKf/dKpOhL/3eo/ptg=;
 b=HYnazV6gtK8434bn9H9X0iv/osOtZZ5ZmlKg7Uo+NLI2mgZM+RpoFPy87ZMmLF1o7CgGBI
 BXI+VkRUP6eEvILINdnfPDF4c5FDGtTox9kIH0S7iIjZSQTCMHJ1iZomUxe1mhDeEHbdUh
 qs/E5CiMkdUKTUPPVv3KcS5+wz4jXck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-TGE1hDYUOJmXNNwJ--01hw-1; Thu, 16 Jan 2020 09:35:15 -0500
X-MC-Unique: TGE1hDYUOJmXNNwJ--01hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C53D10B0F32
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 14:35:14 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6D3E61073;
 Thu, 16 Jan 2020 14:35:12 +0000 (UTC)
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-46-dgilbert@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 045/104] virtiofsd: prevent ".." escape in lo_do_readdir()
Message-ID: <87r1zzwjua.fsf@redhat.com>
In-reply-to: <20191212163904.159893-46-dgilbert@redhat.com>
Date: Thu, 16 Jan 2020 15:35:10 +0100
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, stefanha@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-=-=
Content-Type: text/plain


Dr. David Alan Gilbert (git) <dgilbert@redhat.com> writes:

> From: Stefan Hajnoczi <stefanha@redhat.com>
>
> Construct a fake dirent for the root directory's ".." entry.  This hides
> the parent directory from the FUSE client.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 36 +++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 14 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl4gdJ4ACgkQ9GknjS8M
AjWy0A/+IJzERmeIy07eUBC1F8qZy2GVFx02HP3fvCHAgO5ihAdHOz6WL4uJ87Xz
KETknUuXBlLWG6c8RXzhGgCtJpZOjLuEyf6F8plhHuwTUdmcRFiRO+D87dkrd8lb
C4v8X9lKYFRAzSjh6LAcxBGeVZToX3ne1UQ3YzBj7qA7xAr54PxtnR9+pMiiFXqF
SrkIW1Y38PQF4mOuFpSXQ0DDVvm0MUAprLCXH9whSEklu4Ez38yNLwAOJCENEyBn
frZ/9ED6JH08RMavryq+s51isjaNv4DHqOWOVBhLHFmagaPOkkuMeHAkmRkowqqd
f9DuWe92a9PhTw/6bUEzbEPKvAo6To0f4iftzZLtuqj5LZxb/SkFFQ8cyR28if6P
Su/471DiqLFoGVxEt6LCSjdwuTLFYGsYaqEt1G+SFu3HykLd+vV59Secr0ljPq0A
qUclMLt0uoKVMfTSUlsrsWOi2CqPM8Zp9/QOdwlowKNjtKn8JBc9UbZtSUFY42TL
7sJrxekJu/0J1xG7zO9IpsguUGZFr2ALPfTdcqucU/2kfvbX+0C75OejhoCF2yvs
zPpVDIjnc8USUKDS2TkG7IoANL7Ct9ekOAnFa5Xo7LY6K86uHu9wBeOFi9MmNn9R
uWdbaDNAM6nC7l5FDxEGTW2vRDuj9KrFAJ1Dp5WYG4anujFHm6M=
=NXAe
-----END PGP SIGNATURE-----
--=-=-=--


