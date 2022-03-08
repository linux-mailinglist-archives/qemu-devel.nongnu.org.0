Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E44D1A08
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 15:08:21 +0100 (CET)
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRaVh-00077W-0Q
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 09:08:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRaTl-00052E-2Q
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:06:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRaTi-0008MI-ID
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646748377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MmHgnNh6JGBeuEDqY4eMZGsatfRIRB+/ILWnzD39gMg=;
 b=TLRBPdIexWN7/YRHBspkB+vCrAW53eDGB2oK0MKxTwMof1Lzl6TFrMyzAeLcRAPDKogG3c
 SisoBLcecuItv+1TPQkMdlfjeSga6/gSb+m/A+k/9izC4z9XepeJ9p4san6KdSbf/1o41H
 NjFOXDnrmUT0gqnMuJoodsKUZ3wbsBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-gKNnHjRUP0mAcqVeRb3ftg-1; Tue, 08 Mar 2022 09:06:14 -0500
X-MC-Unique: gKNnHjRUP0mAcqVeRb3ftg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB60E824FA8;
 Tue,  8 Mar 2022 14:06:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B53910640E8;
 Tue,  8 Mar 2022 14:06:08 +0000 (UTC)
Date: Tue, 8 Mar 2022 14:06:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 20/20] block_job_query: remove atomic read
Message-ID: <YidizwocphcWJpt+@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-21-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cmuWaIB02XDt9JwD"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-21-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cmuWaIB02XDt9JwD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:35:13AM -0500, Emanuele Giuseppe Esposito wrote:
> Not sure what the atomic here was supposed to do, since job.busy
> is protected by the job lock. Since the whole function
> is called under job_mutex, just remove the atomic.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--cmuWaIB02XDt9JwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmInYs8ACgkQnKSrs4Gr
c8hM0Qf8DyOBkRek30WQDZimOwDrGODV0AVH3yR9BdlWVS7eIiBijw75tCdyuzGd
KvCmOgqHBQzpO7xMOlyZ2ZaCNGg9v9WlPNnpvOX/lB+JqeoAJ8ckvlrINjbbMsJb
uKGtPyo2eOkKTLZ+y5Vs9EPiDANJxR65wnONVaAd0ZLsrczPe2RO6BCE2dQRovfg
Db6P0gTpPre62qPG9rCYQrrfAOcqBYcgheQx4ycRtlavKikktwG6c+6rPWzR0jvs
BAB6WoI1E/L5igmeFlBPBmiJ3bC5akGX/W7F8EAP68Ja42m114AlvXIfr9WPAsiE
Pi1qC7U6u79OUpX/gjpJaQFtjaQsGA==
=OnJi
-----END PGP SIGNATURE-----

--cmuWaIB02XDt9JwD--


