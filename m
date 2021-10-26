Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5163D43B3BA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:13:04 +0200 (CEST)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNCJ-0005xI-Ez
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfN9u-0004af-01
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:10:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfN9p-0007h4-Ok
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635257428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5LXaiVrYgB1eG2aJ7cjmqV1mzz6fPRbnM2eMys9EPhM=;
 b=JPDqKZWmbJPTKiOcYfjNYBzJX5KcuYE7Z62/V/M5A6Hv33Zfj/K9BB5QQ/FvrEaxLqghGo
 4+GBQGeQoLuFrU/jN3kEG3F5PSZ5S81pIwi0Lo7qOI4WHVSnnBofrLDakrSKcGuFN5GT9k
 IKqAIFBnzP219dtP2TzS2vt3Y5qKM6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-1Ji2bZFOMDK2EgJ9mau0YQ-1; Tue, 26 Oct 2021 10:10:24 -0400
X-MC-Unique: 1Ji2bZFOMDK2EgJ9mau0YQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C24D580DDE1;
 Tue, 26 Oct 2021 14:10:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E8CF5F4EB;
 Tue, 26 Oct 2021 14:10:17 +0000 (UTC)
Date: Tue, 26 Oct 2021 16:10:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 1/2] tls: add macros for coroutine-safe TLS variables
Message-ID: <YXgMSFJhfE6mdVIq@redhat.com>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <20211025140716.166971-2-stefanha@redhat.com>
 <YXa7zMZG2saNHInI@redhat.com>
 <YXgFg0aHtvXNorUS@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YXgFg0aHtvXNorUS@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MBaMJdUkSw0XWWci"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fweimer@redhat.com, Fam Zheng <fam@euphon.net>, thuth@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MBaMJdUkSw0XWWci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Am 26.10.2021 um 15:41 hat Stefan Hajnoczi geschrieben:
> Actually, nevermind what I said about the callback scenario. I don't
> think that is a problem because the compiler cannot assume the __thread
> variable remains unchanged across the callback. Therefore it cannot
> safely cache the value.

And additionally, I think callbacks are never coroutine_fn (especially
not if they come from an external library), so they must not yield
anyway.

> So I think only the header file scenario is a problem.

The mere existence of a __thread variable in the header file isn't a
problem either, but if QEMU accesses it, we would have to implement
wrappers similar to what you're proposing for QEMU's thread local
variables.

Kevin

--MBaMJdUkSw0XWWci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmF4DEgACgkQfwmycsiP
L9Z8hQ//XubbHmIJZr0Cxgr+XIYq4W1oAD+mFnhBYU2hL69gFLJu5tTbkdsmIpOU
kL/JTfyaoJUoqnaF5RCuR7N/Mf/WBJcLc7cRFO3vG34QZdimqDrIF0LYgiv1Fx3+
VOY/6TY46m5SIHjt/P9fdBxMmH3cO222xGeELUW655ZYg2fQODnW0rL2DVunD5+b
NuqjfGhly2Ut3FSNqqKjkMWncakX6cl1nYI+v1CaaU8klsmw8NpZ705E4XIwyIOe
4OwxzsTFz6A5qKfm9BwjuZmwNP/Sd9RVkzrl/iLFE55SRALgF8LEgMxHSBkiFvdN
bbnYpIis40XhKVaOoh6dyRuTQg8UUGXgp8afLoaFqSAfIRSVEIjd8qmE1y9683AZ
L/HbI0jdOGyNlfOUHrpJBt8GtAxLEwCsaZyg/ksavCNteB9GFWUqaD7ge8G0kHQB
qI9g3a0zW8921nlltx/XLZeIAw6aM5O2/axkAsOdCWp8xXPSx3OgQvx2NkehYNps
gpen23+7w8a1nC2uyXbMwUPEoR7C42p7mXUL071vNqfP3By+2/MJq68vDHj5wIT1
WOmGc2kPiEmycZ/FdUly21sJ9dV8PNFunhjyLtfMiOHJni5umLIOfB1b1GfXEIPc
kuHw4PgXEzg9nWNt0Jn/tlEJCbto6iluoMuJRqQrH9+zEHC9KSM=
=lnpP
-----END PGP SIGNATURE-----

--MBaMJdUkSw0XWWci--


