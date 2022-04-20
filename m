Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39A508AF1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:42:34 +0200 (CEST)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBXN-0004yV-7z
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhAzF-0005xr-0y
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhAzB-00034W-Hb
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650463632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D4HBr2ahdS3PTrluDarepWEU1qJtBFHdtjcu7sbwx+I=;
 b=RwCVpFvKIyFXbVPOGVMfqre4qti5PK5iRdZDO37ZEap2Ll6+wpZZraJzcWWQ9BofMnWK6s
 WV0sHm8rWVrogLZ9soowBS1FUhY7L/uT9IJEpLoi84jhCGeQ2wVeke8mF30Znbp3T9zHjo
 d93fwH66OiRHfAYi8dU6qc4oOnqztRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-LfOHzUsLPGevZBdGmq6CnQ-1; Wed, 20 Apr 2022 10:07:04 -0400
X-MC-Unique: LfOHzUsLPGevZBdGmq6CnQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6BE61014A64;
 Wed, 20 Apr 2022 14:06:49 +0000 (UTC)
Received: from localhost (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 892C354C72B;
 Wed, 20 Apr 2022 14:06:49 +0000 (UTC)
Date: Wed, 20 Apr 2022 16:06:47 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: introducing vrc :)
Message-ID: <YmATdyzyPBS2PDB1@stefanha-x1.localdomain>
References: <dd5a574f-a475-a704-a827-03a014f5a586@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X9fed8n2pIqUfDeq"
Content-Disposition: inline
In-Reply-To: <dd5a574f-a475-a704-a827-03a014f5a586@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--X9fed8n2pIqUfDeq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 04:39:13PM +0200, Paolo Bonzini wrote:
> Hi all,
>=20
> a while ago I looked at tools that could be used too build a call graph.
> The simplest but most effective that I found was a small Perl program
> (called "egypt", which is rot13 for "rtlcg" aka RTL call graph) that used
> the GCC dumps to build the graph.
>=20
> I have now rewritten it in Python and extended it with a lot of new
> functionality:
>=20
> - consult compile_commands.json to find/build dumps automatically
>=20
> - virtual (manually created) nodes and edges
>=20
> - query call graph in addition to generating DOT file
>=20
> - interactive mode with readline + completion
>=20
> The name is unfortunately not rot13 anymore, it stands for visit RTL
> callgraph.
>=20
> Here is an example (run vrc from the root build directory of QEMU):
>=20
> 	# load files
> 	load libblock.fa.p/*.c.o
>=20
> 	# introduce virtual edges corresponding to function pointers
> 	node BlockDriverState.bdrv_co_flush
> 	edge bdrv_co_flush BlockDriverState.bdrv_co_flush
> 	edge BlockDriverState.bdrv_co_flush blk_log_writes_co_do_file_flush
> 	edge BlockDriverState.bdrv_co_flush preallocate_co_flush
> 	edge BlockDriverState.bdrv_co_flush raw_co_invalidate_cache
> 	edge BlockDriverState.bdrv_co_flush cbw_co_flush
> 	edge BlockDriverState.bdrv_co_flush quorum_co_flush
> 	edge BlockDriverState.bdrv_co_flush throttle_co_flush
> 	edge BlockDriverState.bdrv_co_flush blkdebug_co_flush
> 	edge BlockDriverState.bdrv_co_flush blkverify_co_flush
> 	edge BlockDriverState.bdrv_co_flush bdrv_mirror_top_flush
> 	# apply filter
> 	only --callees bdrv_co_flush
> 	# draw graph
> 	dotty --files
>=20
> The filtering functionality is a bit rough in the presence of mutual
> recursion, but hopefully this can be already useful to find the root calls
> of bdrv_*, which are the places where the graph lock has to be taken for
> read.  Continuing the previous example:
>=20
> 	# apply another filter
> 	reset
> 	omit --callees bdrv_co_flush
> 	keep bdrv_co_flush
> 	# example of query
> 	callers bdrv_co_flush
>=20
> already gives a reasonable answer (not entirely correct, but the actual
> analysis must be done on all callbacks at once):
>=20
> 	qed_co_request -> bdrv_co_flush
> 	qed_need_check_timer_entry -> bdrv_co_flush
> 	blk_log_writes_co_log -> bdrv_co_flush
> 	bdrv_co_flush_entry -> bdrv_co_flush
> 	bdrv_co_flush -> bdrv_co_flush
> 	blk_co_do_flush -> bdrv_co_flush
> 	bdrv_driver_pwritev -> bdrv_co_flush
> 	blk_co_flush -> bdrv_co_flush
> 	bdrv_flush -> bdrv_co_flush
> 	bdrv_co_do_pwrite_zeroes -> bdrv_co_flush
> 	blk_aio_flush_entry -> bdrv_co_flush

Cool, thanks for sharing. I will keep this in mind when I need to
analyze call graphs.

Stefan

--X9fed8n2pIqUfDeq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJgE3cACgkQnKSrs4Gr
c8hPKQf+IeqhKLbLC+cTFErsHKxCDa8VBT9gMzVQ2gXH2rg0q2pzsYKTSLqHikyp
9VVtrUoebw1BuByz5e0BUh4Bh8T6VyFHNMbDsN+zJdeVeVFaUN9//SS4I7uqeLWm
Egs8H1efe771HMP9WcX5k2d0+U0A38HrVK2Ojdp7sXytVTBUw2Q9MXE1yZxM6tCQ
jux6bR4Pfxk8XUYHULlI/VFO3oGJX75YwxwOOVuih1v/oTX0LXX4/nfXjnWiRVrA
AoFyGpLr/wquXdXAF2YYh0pjFrUDzmyEDNxXzS2qAkb7+B3MS9Cp71ZRSKIqg1w9
sj97J4Lhf+SR/EhW6SYcOn1pnlnU1g==
=PQ8S
-----END PGP SIGNATURE-----

--X9fed8n2pIqUfDeq--


