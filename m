Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5D408FD9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:46:42 +0200 (CEST)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmID-0007gB-VK
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPmCz-00010n-I5
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPmCx-0003Mu-Ht
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631540474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+W/sfkSJT4/FBH7F5PMTPz6/ak8ZaaKa7FSOGM4PN4g=;
 b=F83EK9ntuQawwYBUoL8qFLz6JkrgaUXoVJVs1f0cMRTafwRizdMJy05BxfPqSIs8OwETbE
 XL/4+9MHMU8rWfgN0d9msU2GF3fo7TAN6ZfH+Eo0VI1Q81EjjdvSXZbSJZqThbnZdWyCK2
 D+rYZdCvfpOBfej6Q/2WX6NC6nKWJWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-obaDRZTtMPmSPlOd7oCxtw-1; Mon, 13 Sep 2021 09:41:12 -0400
X-MC-Unique: obaDRZTtMPmSPlOd7oCxtw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A5116119B;
 Mon, 13 Sep 2021 13:41:11 +0000 (UTC)
Received: from localhost (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A508717258;
 Mon, 13 Sep 2021 13:41:10 +0000 (UTC)
Date: Mon, 13 Sep 2021 14:41:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 3/4] include/sysemu/block-backend: split header into
 I/O and graph API
Message-ID: <YT9U9cD+KrbDP30B@stefanha-x1.localdomain>
References: <20210908131021.774533-1-eesposit@redhat.com>
 <20210908131021.774533-4-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908131021.774533-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AnP0cbwSEyEQ6Lbu"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--AnP0cbwSEyEQ6Lbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 08, 2021 at 09:10:20AM -0400, Emanuele Giuseppe Esposito wrote:
> +/*
> + * Graph API. These functions run under the BQL lock.
> + *
> + * If a function modifies the graph, it uses drain and/or
> + * aio_context_acquire/release to be sure it has unique access.
> + *
> + * All functions in this header must use this assertion:
> + * g_assert(qemu_in_main_thread());
> + * to be sure they belong here.
> + */

It's important to note that not all of these functions are necessarily
limited to running under the BQL, but they would require additional
auditing and may small thread-safety changes to move them into the I/O
API. Often it's not worth doing that work since the APIs are only used
with the BQL held at the moment, so they have been placed in the graph
API (for now).

Stefan

--AnP0cbwSEyEQ6Lbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE/VPUACgkQnKSrs4Gr
c8hCnggAjiPUtiS9TXBpohZ77tLzt4wuc3Alzj3/bPnVfBlf61QO13QzEJcvDkh4
4t96c0Tv4iek7mM5UFuiS6dXNOa/2L7OtmR5IghA3u30hDqgMVMRQI9Q+xC0Ktnr
hbvdDPd9iAFe+bbRNfZs5p1aQ3/TpPmjHbw3zhjN3mjCf6i5vzC894IQEd8pycRq
fdze5DhmzKtT/ah+ICHSpM4vkQC5BTZDYL6MP6pihICpJRHKRtqjvTO1NP5+ihgn
emiK2i3lnGIoXvRAdb3Wa02OAg6coiw7qTuqTgoMokm8ehmEtMjqIkj11t3TWjr+
/QdJJ4fzmzR5delaIE4ZoqDHOZKGWg==
=puPF
-----END PGP SIGNATURE-----

--AnP0cbwSEyEQ6Lbu--


