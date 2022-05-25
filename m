Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343FE5341AE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:49:04 +0200 (CEST)
Received: from localhost ([::1]:56014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntuBz-0006kZ-20
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nttWv-0003UM-FH
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nttWt-000519-US
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653494795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NBgTMZKuPcmkVq7BDEOyBA1SUsbEzKg68NpXARbNCHQ=;
 b=S3UhgrFCKdUsnXIaRu5ZVhxLAparZWkxqzNm7oJ3x1ZoTN7EwG9YnUXF9o1fxio+0F/XGE
 9EPTVjjWgzKr6bPMnBdBNmVVz1xPHwLhN3BbRCzHh8/jrSH1bQawe6ztSBENj74W3xogDB
 7dL9USDWvvx4QeBl1MJzhHSMx19I78I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-YRhGsNfONMSPsnP9u_D6zA-1; Wed, 25 May 2022 12:06:30 -0400
X-MC-Unique: YRhGsNfONMSPsnP9u_D6zA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53DAC29AB3EF;
 Wed, 25 May 2022 16:06:30 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3FC72166B26;
 Wed, 25 May 2022 16:06:29 +0000 (UTC)
Date: Wed, 25 May 2022 17:06:28 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org
Subject: Re: [PATCH  v2 03/15] include/hw/virtio: document vhost_get_features
Message-ID: <Yo5UBFHo6G7AOwt0@stefanha-x1.localdomain>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <20220524154056.2896913-4-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9idEHU6DJLfwK62a"
Content-Disposition: inline
In-Reply-To: <20220524154056.2896913-4-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9idEHU6DJLfwK62a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 04:40:44PM +0100, Alex Benn=E9e wrote:
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  include/hw/virtio/vhost.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--9idEHU6DJLfwK62a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKOVAQACgkQnKSrs4Gr
c8iz0gf9FDLPheOlpVKPAy2I5y4hxDYki3GF2QF+cmmZLEAUj8P/dwspRmCKVlkP
rK/ktKvPC5tu7zkYp05lTBVT7cTe2jRR6oRPfcRr9z3nvOvea7bBV5J9NMd3wGh9
Fyc7zrdfYFqcROWch6hsBIasS93kCQ7iOjEOGJuvVlGsjYXmNUd//uvs1Kqlzuzw
xzoCoVt7RrZnTPRHifaKz5ekofwIB2SZkQtZaT4/1zhTisdbrHEiXmuZIN+0OeSk
0sXPkYep+ekj3Z9dRNgt2gTZJBdbWb/8wM32ZAkyNcQ6CvSdXmZBhQpalbb3fiI6
XlRj3ODjTuLKZvxu4347Kt7ALgQtTA==
=zs9r
-----END PGP SIGNATURE-----

--9idEHU6DJLfwK62a--


