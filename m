Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5871318B04
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:42:08 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABIM-0000iK-DB
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABEK-0006jR-E2
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:37:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABEH-0007yK-R4
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:37:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613047072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zRF+AlM0cISS5a+titYFrnfNcEc6o+NzHbzOQdBMYT0=;
 b=B3UDXedNKLnMBDElwHgYoKBRPOt2qSro9aKTmanqIHZdJj6sZkX/d6bFmf/gKepgqXYoWa
 2cmArLQxW823BcmIeNQI58QVk4auVJEsjezYX81RFyyKfiGcGxgVyhUYErX/cWCqApNU3I
 VyFdJWeo1LLFqc49+LXZ3jidS793Y3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-y7x_MMZsPgaZ8VPd6izZ_w-1; Thu, 11 Feb 2021 07:37:50 -0500
X-MC-Unique: y7x_MMZsPgaZ8VPd6izZ_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78BD0801975
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:37:49 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1B985D9DC;
 Thu, 11 Feb 2021 12:37:39 +0000 (UTC)
Date: Thu, 11 Feb 2021 12:37:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 10/24] DAX: virtiofsd: Add setup/remove mappings fuse
 commands
Message-ID: <20210211123738.GK247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-11-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-11-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z9t8O/5YJLB6LEUl"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Z9t8O/5YJLB6LEUl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 09, 2021 at 07:02:10PM +0000, Dr. David Alan Gilbert (git) wrote:
> +static void do_removemapping(fuse_req_t req, fuse_ino_t nodeid,
> +                             struct fuse_mbuf_iter *iter)
> +{
> +    struct fuse_removemapping_in *arg;
> +    struct fuse_removemapping_one *one;
> +
> +    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
> +    if (!arg || arg->count <= 0) {

arg->count is unsigned so < is tautologous.

> +        fuse_log(FUSE_LOG_ERR, "do_removemapping: invalid arg %p\n", arg);
> +        fuse_reply_err(req, EINVAL);
> +        return;
> +    }
> +
> +    one = fuse_mbuf_iter_advance(iter, arg->count * sizeof(*one));

arg->count * sizeof(*one) is an integer overflow on 32-bit hosts. I
think we should be more defensive here since this input comes from the
guest.

--Z9t8O/5YJLB6LEUl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlJRIACgkQnKSrs4Gr
c8i8awf/RhrbE9cnGzWrshMc17CgNSicST+cxDf3GUa1GdIdf+/fuxm0hfXfN1D5
zLUlrCUyTMw15HF/mWfEiT/oGt9PdOcj5S+51KCyLDEthQOVuxKomnPhR+1kvCs7
lSqQw1Z1SiIaeb7sQirS5mpPr1jnPSkjgrbvKrzVAwQ6ZgxGT3sCJME/D/0migTA
zxy0vzbyxp3P8sGFq2zvPb/x96KC9TTOc6koqnctXE5bQuFmlK630zEBgyFUr47b
1bG+JwV04luqE8m8p6vwyHOXG5muidz4hvh4SWWjJuqK1dOOEvGD0ElaTU5vRcuV
Q/B9WBCSdjQA2bZrO8YewZLj2Pi6NQ==
=ndWR
-----END PGP SIGNATURE-----

--Z9t8O/5YJLB6LEUl--


