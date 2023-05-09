Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBE56FCCFE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 19:49:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwRRh-00023l-UV; Tue, 09 May 2023 13:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwRRf-00023T-I1
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:48:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwRRd-0006uq-TN
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683654492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CBEoZpD+eGT2yzkQdwAuFsN4Z2azfJNE6Ti4DWpdLAM=;
 b=gD9WiQ2wACBNwT9rANM5dit/mBaYCID230Ercl2h7VAsWUZV74DNAP6Sh8JN4+VqtdgEV4
 30ufaUCmplnMAGgAbx+9zver3ZDTuOqx8GxvuL1sJyx6MiSf3cMLPbLSvaZ7LSCKBMsZw8
 uHw6sb/CiouwHRvzJ7P2xER4yqZqaVM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-XAwOfRllPKq3xILj5K3GBA-1; Tue, 09 May 2023 13:48:10 -0400
X-MC-Unique: XAwOfRllPKq3xILj5K3GBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1E13101A55C;
 Tue,  9 May 2023 17:48:09 +0000 (UTC)
Received: from localhost (unknown [10.39.195.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3518DC16024;
 Tue,  9 May 2023 17:48:08 +0000 (UTC)
Date: Tue, 9 May 2023 13:48:07 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, eblake@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/20] Graph locking, part 3 (more block drivers)
Message-ID: <20230509174807.GB1018047@fedora>
References: <20230504115750.54437-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yjFtqMn+KhB3NXYU"
Content-Disposition: inline
In-Reply-To: <20230504115750.54437-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--yjFtqMn+KhB3NXYU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 01:57:30PM +0200, Kevin Wolf wrote:
> The first few patches in this series fix coroutine correctness problems
> that have existed for a while, but only actually start to make things
> fail in practice with stricter checks that we're going to introduce with
> the graph locking work.
>=20
> The rest of the series makes sure that the graph lock is held in more
> block driver functions that access the children or parents list of a
> block node. This is incremental work and more patches are yet to come.
>=20
> v2:
> - Rebased on current git master
> - Improved some commit messages
> - Patch 5: Added missing coroutine_fn annotations in test
> - Patch 7: Updated comments, too
>=20
> I didn't remove the assertion in patch 13 yet which Stefan was
> questioning. I can remove it while applying if we decide that we really
> don't want it.

That's fine, we can leave them for now.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--yjFtqMn+KhB3NXYU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRah1cACgkQnKSrs4Gr
c8ia0Af+JzoH9Ol85gmIjMXszVA/kvnnGY2E+0dBbYe7T4T9KZXsCkEM3C57HcG1
V5G+ZM7ds7cHtq3uOsvE9DywUD3OZOLg3GcKhlniFu6vGU9aHESC1b4fSGigyrWn
CHwFHlDwtxr75NiRJzMG3+7ca5g6JkrUD8g7mzafd60PeIFhlDeqzsXCfXGG9OE9
O8vACaNOuMfYRjLKNS4h+TZLXpamBHctiRZoKfJS5UCjJunhxha45do7LwKMvCu+
Sz0VSXxLL1flsMbpORn3le16W6EdaT9llsoGobPniiZaamTeVBROYDxxBMXk2cg7
WXG5uqR3IdO38pLBowF04VUSMsEwqg==
=HyN4
-----END PGP SIGNATURE-----

--yjFtqMn+KhB3NXYU--


