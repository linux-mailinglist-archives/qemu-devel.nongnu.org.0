Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3EC1052D0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 14:20:58 +0100 (CET)
Received: from localhost ([::1]:40326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXmOG-0006JF-Sv
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 08:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iXmLC-0005L6-Mu
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:17:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iXmLA-0006L8-Dr
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:17:46 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37911
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iXmLA-0006Fh-8v
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574342256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aqbcuRLaWGMy+v8Ac72HUCecNo/BUPdUFC9qkePj7G4=;
 b=Fsw8KztdnwgEuIO36ZeQ/+CSpsCUV6Nsf75gxv+XORAScsNviGpgF1dDQ1NQfDGEXyxP/L
 1OH3u7c5FLC8b/luUXaRvDpSE6pHxwJq8XvnREHmMwHxq+WUyDpgh4qPZFpgCNS9nFGOhK
 4koI0ipMQ9lTHax1lrDIgGee8P47kDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-99iVwFjqN9q78EThYlMwJw-1; Thu, 21 Nov 2019 08:17:33 -0500
X-MC-Unique: 99iVwFjqN9q78EThYlMwJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDAC91822CA8;
 Thu, 21 Nov 2019 13:17:31 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB6D660BCC;
 Thu, 21 Nov 2019 13:17:27 +0000 (UTC)
Date: Thu, 21 Nov 2019 14:17:17 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH 04/15] Header sync protvirt
Message-ID: <20191121141717.728647c1.cohuck@redhat.com>
In-Reply-To: <b1efef4f-48ab-e03e-7246-d7c0bce8ef02@linux.ibm.com>
References: <20191120114334.2287-1-frankja@linux.ibm.com>
 <20191120114334.2287-5-frankja@linux.ibm.com>
 <20191121135959.3fc8f10b.cohuck@redhat.com>
 <b1efef4f-48ab-e03e-7246-d7c0bce8ef02@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; boundary="Sig_/B3x_caIsZw0_RCy0Fu+dOM1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/B3x_caIsZw0_RCy0Fu+dOM1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Nov 2019 14:12:21 +0100
Janosch Frank <frankja@linux.ibm.com> wrote:

> On 11/21/19 1:59 PM, Cornelia Huck wrote:
> > On Wed, 20 Nov 2019 06:43:23 -0500
> > Janosch Frank <frankja@linux.ibm.com> wrote:
> >  =20
> >> Let's sync all the protvirt header changes
> >>
> >> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> >> ---
> >>  linux-headers/asm-s390/kvm.h |  3 ++-
> >>  linux-headers/linux/kvm.h    | 42 +++++++++++++++++++++++++++++++++++=
+
> >>  2 files changed, 44 insertions(+), 1 deletion(-)
> >> =20
> >  =20
> >> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> >> index 18892d6541..d031051601 100644
> >> --- a/linux-headers/linux/kvm.h
> >> +++ b/linux-headers/linux/kvm.h
> >> @@ -995,6 +995,8 @@ struct kvm_ppc_resize_hpt {
> >>  #define KVM_CAP_ARM_SVE 170
> >>  #define KVM_CAP_ARM_PTRAUTH_ADDRESS 171
> >>  #define KVM_CAP_ARM_PTRAUTH_GENERIC 172
> >> +#define KVM_CAP_S390_PROTECTED 180
> >> +#define KVM_CAP_S390_VCPU_RESETS 181 =20
> >=20
> > Hm, where does this cap come from? I did not see it in the kernel
> > patches. =20
>=20
> It'll be part of the V1 once I send it out.
> Pierre found the problem while reviewing QEMU, so I fixed it in both repo=
s.

Ok, that cap probably makes sense. It was just surprising to find :)

--Sig_/B3x_caIsZw0_RCy0Fu+dOM1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAl3Wjl0ACgkQ3s9rk8bw
L68V8A//fsVrDEYF/KwRxR9VBbNmemSa7sQCf5HE8jTSgL1Yidg5k+ey4hDscp+Q
9cEAMK1G5O84UyHcgIFwCaKftlbSMGtKkehaZcmCEcbQvwA5uVKWVdOhXgTlYB/U
Lwl3s0Hp3ZjDD3ADPd1cDtjW5XRaSScUCxtyEfZAiO1K+8Eurub+m6YLX0ird7RL
eom0GegMTGjd+rgq+uuzP2U2BM5TntfRo/P/S/t/0fReC5nYaXrGIkJs+WcClkLJ
HZ7V6DHyory3kcDEEv8Nunr8un7TloCavlIDoPC3se2Klh7lxH3bAEfeY/Rx0jOb
eFRNBDiUa+H1Towl3cyw1SVB7K2Ba09KxhOPN1tMA/zMbnTRye2SZEcG3yMVgeuw
bulYrBPm0WTVXtwzoc2qbRjRJhHiVyUhW4objBYtugdZ3rsWpkz3gmS99SaM6t7U
l6Ut/vtveGeyLsuPwOpgjrTXbxkcW+wrevx3Dy74OIw3B4IkJBGXM5VhxGcWUiD2
+gqQVa/bI4Ef3TxxUIrfXlc/FGcQiGhzo2TS1SwlLEoMKVaSF8FzKfJJQ+9B7l6q
2QeiOwbA9gOwERYZ8U2RHWkXvFJUIOnxPnRuq9vml/vd8MMyZr2wOkeApZe+SY+a
BVzR2FTL/j5zjY+UV+rXc6NacY0EzuT6LkXQACOU31jXrPk0Agg=
=idqZ
-----END PGP SIGNATURE-----

--Sig_/B3x_caIsZw0_RCy0Fu+dOM1--


