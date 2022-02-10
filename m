Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026164B149E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:53:32 +0100 (CET)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDdL-0006Kt-2k
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:53:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIBea-000481-GV
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:46:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIBeV-000266-CP
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644507993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zFsD69wKextybj40GJBY+j2m8qQGyDcvDCT3rLGzmAQ=;
 b=Tc88g8oiIv3I0au1magdm8Y/eyCqRfhJdgqHtXnUtHUK6cjEdvD+xAZCMAU4HgGGjCf2nx
 tI+9AxI9UUIG2NSf0IXnQ19VMFoOdlcSQyN+6ukwobyz7iPOqzjUrjLy5yKdwba5XM8DEm
 +bPM0coCBGm7TVQ/AqRkytWVVB7jIBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-_BgCsXD2MCiT-XkGt_IxmA-1; Thu, 10 Feb 2022 10:46:32 -0500
X-MC-Unique: _BgCsXD2MCiT-XkGt_IxmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 021F81B18BEA;
 Thu, 10 Feb 2022 15:40:41 +0000 (UTC)
Received: from localhost (unknown [10.39.195.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 471107CAF7;
 Thu, 10 Feb 2022 15:40:29 +0000 (UTC)
Date: Thu, 10 Feb 2022 15:40:27 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 02/20] job.h: categorize fields in struct Job
Message-ID: <YgUx60M7dB+VLi3p@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZvEE6H0UwAtyNIKI"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZvEE6H0UwAtyNIKI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:34:55AM -0500, Emanuele Giuseppe Esposito wrote:
> Categorize the fields in struct Job to understand which ones
> need to be protected by the job mutex and which don't.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 59 ++++++++++++++++++++++++++--------------------
>  1 file changed, 34 insertions(+), 25 deletions(-)
>=20
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index d1192ffd61..86ec46c09e 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -40,27 +40,50 @@ typedef struct JobTxn JobTxn;
>   * Long-running operation.
>   */
>  typedef struct Job {
> +
> +    /* Fields set at initialization (job_create), and never modified */

Is there a corresponding "Field protected by job_mutex" comment that
separates fields that need locking?

--ZvEE6H0UwAtyNIKI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIFMesACgkQnKSrs4Gr
c8iUqwgAnunEf5VndWFbcB3pi7ttiY4l/qbLypjuisr3pGc2APttQcaafoUcFPo3
6Sg+8ySjNJ3CeoZ8JErTyKdBMHb81QXF1ie9bbBn2ztpHSGF+67BpbSZ+ReankSy
iH2cXiKAmsZHl5cfZZZ3XbVFyyNQOpfVT9ogAx8f3O9dhFaVd4YNARvJjIz742FD
/Kbn7QiKWHr5x0eQ5tmChAHhSxIyM/RnO4ll/NTNiKIoR1TqA+9P/NYhQJX2obXI
kZh8PupDOlDkMaqE439GeDxS3tHJjBxxizPDrdALqWQYeOaWj4cKmHTEkrg49c6M
AZAc+0+LczCnPjOnDEGWbCpnNM3pCw==
=II9+
-----END PGP SIGNATURE-----

--ZvEE6H0UwAtyNIKI--


