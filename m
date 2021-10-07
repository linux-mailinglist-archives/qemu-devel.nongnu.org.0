Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE7B42553E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:21:39 +0200 (CEST)
Received: from localhost ([::1]:51608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUHC-0008HF-3q
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUFi-0007Rq-Rn
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUFh-0003LT-FN
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633616404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4UGWhR7ZlTY+MJQBWYjqqVRL/ibf+HAKZzbZGtutJaE=;
 b=fFNJ9N3vAF7iwN1uW7lPQcQ1RSEEePCfYGoY8NhWhvViUDhPKF9hAjrGVzQRzLCYhrT8nS
 LzPpj0SZqq/RhN76OxTTmF/DFI6B15QQWL/ioTvECyQS9yZnSNwkkqZOajuyUI5W/IDDyQ
 sQbKCJBslPndATPxoXgtykGOH4RgLSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-a56YH6tHPc-ycuHy1ifTRA-1; Thu, 07 Oct 2021 10:20:01 -0400
X-MC-Unique: a56YH6tHPc-ycuHy1ifTRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 866738010ED;
 Thu,  7 Oct 2021 14:20:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CA2160C05;
 Thu,  7 Oct 2021 14:19:40 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:19:39 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 07/25] assertions for block_int global state API
Message-ID: <YV8B+0jxEqlwiQPH@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-8-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-8-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+oLNzSIXXhBd54aV"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+oLNzSIXXhBd54aV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 10:31:57AM -0400, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c                         | 17 +++++++++++++++++
>  block/backup.c                  |  1 +
>  block/block-backend.c           |  3 +++
>  block/commit.c                  |  2 ++
>  block/dirty-bitmap.c            |  2 ++
>  block/io.c                      |  6 ++++++
>  block/mirror.c                  |  4 ++++
>  block/monitor/bitmap-qmp-cmds.c |  6 ++++++
>  block/stream.c                  |  2 ++
>  blockdev.c                      |  7 +++++++
>  10 files changed, 50 insertions(+)

Except copy_range:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+oLNzSIXXhBd54aV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfAfsACgkQnKSrs4Gr
c8jGtAf+LZrXSb0Fk3cGRfHUrlmDzgxNuUssELVbDfVMKoUJfDnVTZHJapR+Zzq6
Anzahdyzxnemqn4UXTMFz0szF6t891TTFUdK6VVvepXQAQC6msCnnXNa6pDRsDKP
Go0/UBUotoXqHEnDPTaOsNP0+F0RE28L9MZyiB3EGFz2qOFJ7g1klkpY+1reKIxR
rSDAOMSeCKaq3/9CkRCCHWhxR1bOUkf68c+dsPKm08d8VZHLbDlIay6tIUEedXkl
Qc3KN4v7dSwxB2Upp92oEgQPAgH4fwyQFmcKZC8B0lSDCztMEZn+JUuxAAFn3B8p
JI98BoLPvqawN48U6cfUn7g4MCIJSQ==
=BkdS
-----END PGP SIGNATURE-----

--+oLNzSIXXhBd54aV--


