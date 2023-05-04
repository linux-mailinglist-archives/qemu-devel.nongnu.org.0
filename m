Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF66F694C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 12:53:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWZv-000287-R7; Thu, 04 May 2023 06:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puWZu-00027c-Do
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:52:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puWZs-0006au-IT
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683197567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hS1hUXjaZ1Q9dJY5Q4L54w06sGn6mocRZpugd2cD6A8=;
 b=CLXAzSvTFviT9A5vrwnf/Cj4n6slGeEawA7RMC/ywUDLdrj+SlWln0irV+FYiVz4Ygvu0z
 hJzIbn98cl0uzvDsrlx1bqpzQY0rMt0tL20yExYcVsL8zRTWk6gDQNBnE13UHlE1l99Rn+
 RW/wAV6Oo279RkYOM0X+v6HEg9luhg8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-nsgWlWKqNXSxUQvB0zG9MQ-1; Thu, 04 May 2023 06:52:43 -0400
X-MC-Unique: nsgWlWKqNXSxUQvB0zG9MQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BA6E101A531;
 Thu,  4 May 2023 10:52:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B108940C2064;
 Thu,  4 May 2023 10:52:42 +0000 (UTC)
Date: Thu, 4 May 2023 12:52:41 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 13/20] block: Mark bdrv_co_get_allocated_file_size() and
 callers GRAPH_RDLOCK
Message-ID: <ZFOOeZO1RKxctFzG@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-14-kwolf@redhat.com>
 <20230501190305.GO14869@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TxO4QAu635hgKKvE"
Content-Disposition: inline
In-Reply-To: <20230501190305.GO14869@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--TxO4QAu635hgKKvE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 01.05.2023 um 21:03 hat Stefan Hajnoczi geschrieben:
> On Tue, Apr 25, 2023 at 07:31:51PM +0200, Kevin Wolf wrote:
> > @@ -5778,6 +5779,7 @@ int64_t coroutine_fn bdrv_co_get_allocated_file_s=
ize(BlockDriverState *bs)
> >  {
> >      BlockDriver *drv =3D bs->drv;
> >      IO_CODE();
> > +    assert_bdrv_graph_readable();
>=20
> Is there a need for runtime assertions in functions already checked by
> TSA?
>=20
> I guess not. Otherwise runtime assertions should have been added in many
> of the other functions marked GRAPH_RDLOCK in this series.

I guess we're a bit inconsistent with this. Emanuele started adding the
assertions everywhere before I added the TSA annotations. Since then,
I've tended to leave the assertions from Emanuele's patches (such as
this one) around, but didn't add assertions in new patches.

The point in favour for still having assertions is that people using gcc
won't see TSA failures, but runtime assertions will still work for them.
I don't think we should have them in every GRAPH_RDLOCK function, but
having them in one central place in each call chain (i.e. the block.c
wrappers for BlockDriver callbacks) does make sense to me. So if we
stick to this standard, we'd keep this assertion.

But if you prefer, I can drop it. I assume that enough developers run
with clang that the additional assertion doesn't buy us that much. And
I compile with clang anyway when applying patches.

Kevin

--TxO4QAu635hgKKvE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmRTjnkACgkQfwmycsiP
L9Z1ZQ/7B/vldsSU5cvpOzrosgtBji69IS8gOnlOnOa7dfhgEGgjM0NQ1IkSe/Ew
Va2rERT18ZYUPalNSjOvIqA4qggPSC3DzQC7ohauaxoPChwpsQJrVh445uSwCDxr
TlLC64DBapbQoBmJRrlgu5r+JbKs4AtlT89W4fPmRxcFEcfKkABoyGUD3AnyFfRm
lRWhEFern8Hse93xOzFleCCS2vCVGH1ysyShIyu5LyviHNL2zaMC4V2ZxiJkpOys
DoMIz/ZfSKHyc1I1/VCgPBN3CB468b0znKu4rfBOZoTgjHX/GyoSIOxfq2Sa9zwI
Iu2wkCud1NjEeWmqEzci4lKR2YdqZCOWzDZ9Wqz0p3pKdmLwsDlHrfi57g+W6ENq
YOZJu+TNBoEKbb95J+FjkoKfCx7iW6siy7jAerUToS4aOQ+Y5rguq+1R0svsliKF
p/hA/kRgUMWaindtoba1RFGps0hVVkdfKrLw6FFsFQkw6/d4ShWjA2zglU/gxhhT
ncOJ0nfqG01iYmKAYBi47C3NnJKuAnMFEFE+cOuVtIaG79pWnQWDiXPNCPpFBLgx
pyrfPi9uK94dviLVA5Vmgs5gyxxGtM9A8ZYxVsRQQucSS7e4pE7+wphJMYiSiJCK
OJ08M002LyO7XsplCP04olctGHOYHxAyjf4QTcQIYaBQUcKRRE0=
=fzWP
-----END PGP SIGNATURE-----

--TxO4QAu635hgKKvE--


