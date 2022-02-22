Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BBE4BF416
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 09:52:49 +0100 (CET)
Received: from localhost ([::1]:54282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMQue-0005cp-Bd
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 03:52:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMQog-0003rB-Er
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:46:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMQof-0007Hk-0S
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645519596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f5Hc93J4tzb1WdgnUaEDaEc6CmCs3XJD3HmmH09LU7w=;
 b=ivZxbjyGpDYcomAFFzxscwoIKdrxscG9XsiPZWR+QqrP90vlUz9+gasnbFhnkGbM+L/G6p
 Gw35uQwI/MmR57/QL/5MrcbSPxUb0+UTp3Z/ZsS1z7Y3h0PBd4iowX1S5AY3nwweUSOs1O
 y7iuuicpSelZtDI6oYhRhHhWwl/bxr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-zawAFOLRPzeZ39G--fIvrw-1; Tue, 22 Feb 2022 03:46:30 -0500
X-MC-Unique: zawAFOLRPzeZ39G--fIvrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45A811091DA2;
 Tue, 22 Feb 2022 08:46:29 +0000 (UTC)
Received: from localhost (unknown [10.39.195.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FAE129991;
 Tue, 22 Feb 2022 08:46:28 +0000 (UTC)
Date: Tue, 22 Feb 2022 08:46:26 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v1] aio-posix: fix build failure io_uring 2.2
Message-ID: <YhSi4hUpWLg0UzBC@stefanha-x1.localdomain>
References: <20220217161627.45351-1-haiyue.wang@intel.com>
 <YhOnmC5EDOK0D5/D@stefanha-x1.localdomain>
 <CAFEAcA_JXxiX-k_bu+uk9SpewxzU4qOPmTE-eVVZ6-gDTN9P-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NFOS+hcySWD7BkVj"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_JXxiX-k_bu+uk9SpewxzU4qOPmTE-eVVZ6-gDTN9P-Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Haiyue Wang <haiyue.wang@intel.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, "open list:Block I/O path" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NFOS+hcySWD7BkVj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 03:54:57PM +0000, Peter Maydell wrote:
> On Mon, 21 Feb 2022 at 15:02, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > So the QEMU add_poll_remove_sqe() function would do:
> >
> >   io_uring_prep_poll_remove(sqe, (__u64)(uintptr_t)node);
>=20
> __u64 is a linux-kernel-ism -- we should use uint64_t, I think.

<liburing.h> and QEMU's util/fdmon-io_uring.c are Linux-only. I think
it's fine to use __u64 here exactly as defined in the liburing API.

Stefan

--NFOS+hcySWD7BkVj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIUouIACgkQnKSrs4Gr
c8hUswgAwS7IuyLqWRcuXDOr/9OibzWLSa2RhkhIO1wytvPG9w7ISfQcUzXuFY0d
Fcqk+ObfxjABwJJEd1rgpDvhD52sRc9Q34scQ591Zk9BqjVuwWMi6+ZR1Zsoa2D7
J8TIkPf2oHGxr29sERK0V8jXrC8lmA+C1rO4kE1FCG85f7n+IReiSp+9v3APkJOs
OwNenBG1WrwLJsVVEdQvfQzqBDJnRj40C7Zf6dfZ3RVOM81WC3jfYWK++iS+ACB4
CmzWkvosdUgMspPUKE/Bk7Xu9c4GtYwoYwrZ/Yz9CrugujtFduiireK9N70p4QBs
UgJ7YXGgIMv+VX2nZYy5FMvS+qriog==
=BLoW
-----END PGP SIGNATURE-----

--NFOS+hcySWD7BkVj--


