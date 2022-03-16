Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A14DAFE1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:39:47 +0100 (CET)
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUSwM-0005cP-NL
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:39:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUSpk-00017d-Qq
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUSph-0002hh-SM
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647433973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ezLL7nJJwr2MESdr3amriUAXaiAu0DamyS9IXElRaE=;
 b=fGtazJZ2HlvUEfidNSx7Y6bXawDGzS+YhjNLxy1bZJQUXMDRpWILOvusCojZO+eIVWe6KJ
 vN4ZBJ5mPB+gVae8bbcAB58PPOpsPlTPmIyV4gwyK6owOPzB8GyWO0JMtaRObyoYHdugN4
 WV+eZe6VPtOPEDt7j4X/3QWx8OUHpus=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-BHKNiNXyOCCUdsJrYOjzDg-1; Wed, 16 Mar 2022 08:32:49 -0400
X-MC-Unique: BHKNiNXyOCCUdsJrYOjzDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 874BB1C05EBA;
 Wed, 16 Mar 2022 12:32:49 +0000 (UTC)
Received: from localhost (unknown [10.39.193.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 408A740D2820;
 Wed, 16 Mar 2022 12:32:49 +0000 (UTC)
Date: Wed, 16 Mar 2022 12:32:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjHY8GA52MzjBxLK@stefanha-x1.localdomain>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <CAFEAcA8zongmSfDAgorr=RfKK6Qsgyi1xNz5KBzdB0RGeSBSWA@mail.gmail.com>
 <dca7d15b-2f24-cfb2-9a31-47b5ffd9c3d5@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="luXXlw5oHqtNyDAv"
Content-Disposition: inline
In-Reply-To: <dca7d15b-2f24-cfb2-9a31-47b5ffd9c3d5@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 hreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--luXXlw5oHqtNyDAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2022 at 06:29:50PM +0100, Paolo Bonzini wrote:
> On 3/15/22 15:24, Peter Maydell wrote:
> > On Tue, 15 Mar 2022 at 14:09, Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > > Also, once C++ is available people will
> > > start submitting C++ patches simply because they are more comfortable
> > > with C++ (especially one-time/infrequent contributors).
> >=20
> > This to my mind is the major argument against using C++
> > for coroutines...
>=20
> I agree on the need for a policy, but _what_ C++ are they going to be
> contributing that we should be scared of?  We're talking about:
>=20
> * major features contributed by one-time/infrequent participants (which is
> already a once-in-a-year thing or so, at least for me)
>=20
> * ... in an area where there are no examples of using C++ in the tree (or
> presumably the maintainer would be comfortable reviewing it)
>=20
> * ... but yet C++ offer killer features (right now there's only C++
> coroutines and fpu/)

You are assuming people only choose C++ only when it offers features not
available in C. I think they might simply be more comfortable in C++.

In other words, if an existing file is compiled using a C++ compiler or
they are adding a new file, they don't need a reason to use C++, they
can just use it.

You can define rules and a way to enforce a subset of C++, but I think
over time the code will be C++. A policy that is complicated discourages
contributors.

For these reasons I think that if code runs through a C++ compiler we
should just allow C++. Either way, it will take time but that way no one
will feel betrayed when C++ creeps in.

That said, I hope we find an option that doesn't involve C++.

Stefan

--luXXlw5oHqtNyDAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIx2PAACgkQnKSrs4Gr
c8gy6Af+OCKUUTyAjCCY4lcCHRCImjGn71rx+sGlhhlw0GOS6g5oVYW/mp9utnx9
Meugm1B1zWuK07faRSUQ4l3Sau8lARsI00+U2UjK5IJZZw/CmufsutR/nW7ocmgE
jgBqs9AoMxpiM4Stym3YgrIVqnwAkNtHJRvLlwKZcKHnCXl4kpKjHBKf4p+e/8+p
e+ko3eg66RZlZmKwoEwOTpY8xtgjuCHFsj/WT0CIZfhkj3WSQHaWjwlloljBsII1
EycAJZ1ZkFsCqawI3558J/qN180O/GaMny6bfmXO6wgP6x1PTfXle/fynzt304I5
XVCbpaosohS7Zxwdjx6y2xNpMuRDWQ==
=ErUb
-----END PGP SIGNATURE-----

--luXXlw5oHqtNyDAv--


