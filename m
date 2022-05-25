Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEE65341BC
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:52:38 +0200 (CEST)
Received: from localhost ([::1]:60868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntuFR-0002E5-NA
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nttbT-0008O7-L1
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nttbP-0005nH-Be
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:11:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653495074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sdZWKX3KUCZdkX7a1FK8xlHxFN3eDaO+Bgdwe+BSLTQ=;
 b=BWCUEW9Ap2Z5HNK8xxO9LOH1Nr6MhLu5CUlqWADXaUDQz/KAOLGUVBQq5/c80DjkxhyrdZ
 5JDZhvdGDkI5lUnQGNg1bvSdCoujNYXDJqoxqXxvhRAPRqdF4NiZzlh75J9Q4tjmWYhdiP
 nFM34cwhsT4jEpTd57xggeW1jN9mEkk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-SBfE2CvFOnyDNOeS-TbJ1Q-1; Wed, 25 May 2022 12:11:10 -0400
X-MC-Unique: SBfE2CvFOnyDNOeS-TbJ1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C558180B2A2;
 Wed, 25 May 2022 16:11:09 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5987B2166B26;
 Wed, 25 May 2022 16:11:09 +0000 (UTC)
Date: Wed, 25 May 2022 17:11:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org
Subject: Re: [PATCH  v2 04/15] include/hw/virtio: document vhost_ack_features
Message-ID: <Yo5VHDhEu8ZQWBMD@stefanha-x1.localdomain>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <20220524154056.2896913-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RFDCQ5Oqpv3LB9XJ"
Content-Disposition: inline
In-Reply-To: <20220524154056.2896913-5-alex.bennee@linaro.org>
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


--RFDCQ5Oqpv3LB9XJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 04:40:45PM +0100, Alex Benn=E9e wrote:
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  include/hw/virtio/vhost.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--RFDCQ5Oqpv3LB9XJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKOVRwACgkQnKSrs4Gr
c8gycgf/apvR5y2o7QA/W9/h59oRFlbNy5JChYmFGb/2KrwsElVFnmeORg9PkeFm
aru5RpC26FQJ9uKCNWD/qiBQjjNGVRcBr+gZNt4MVby3pTRyFRJviGHNF7Rd+NKo
mHCc/9xVYsIu6mEQni0A8RVAMaXPY4BBK/VRWh4+mq4zkoFJ5Crks0LUFy2HH9wo
MFatqry8U4y4BsU9cyaRso/hbZ0KZsUKSG32i09uHZ/QChanU9Rl1qqLDuJitgfZ
sYMhMZampagTFNOuZrFOH8GHAWKUqldWygLIPEEJIxMdvxcXgLGKBAMMmikkcaTn
oa4Tip1wlIMKkv1WPBhUhZmQWgeCYg==
=f9KV
-----END PGP SIGNATURE-----

--RFDCQ5Oqpv3LB9XJ--


