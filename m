Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0605D4B15B8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 20:03:18 +0100 (CET)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIEir-0000YL-5X
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 14:03:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIBeZ-00047U-MX
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:46:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIBeV-00026B-N3
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644507994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2hdSAlk9L+XeKCXQR9zHeFdOaXL6MXMUhfvXOIqeaZQ=;
 b=Ub+391gS1/ZpMjjpYXtbaJVYHgBC4BYxJEP/sfUc6IAZxfuQX5VD5ryfb3rbABgP0yeeEj
 5I/c76cx/EWApr+EXNlPRCi0qxK8I0QwbOdpGXXO9Yklg+U+oOUeV4ASFAyL/dLciJ8Jfg
 6KZWwt6gl6rF7uVVkZ1Dx+JMFG8+lLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-M5GQiqVPMSyzVPfxDgv9Pg-1; Thu, 10 Feb 2022 10:46:30 -0500
X-MC-Unique: M5GQiqVPMSyzVPfxDgv9Pg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 665C261195;
 Thu, 10 Feb 2022 15:38:21 +0000 (UTC)
Received: from localhost (unknown [10.39.195.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E97792B59A;
 Thu, 10 Feb 2022 15:38:19 +0000 (UTC)
Date: Thu, 10 Feb 2022 15:38:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 01/20] job.c: make job_mutex and job_lock/unlock()
 public
Message-ID: <YgUxap+8eWQVM+TN@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z/TeX53vXRV7W6/C"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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


--Z/TeX53vXRV7W6/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:34:54AM -0500, Emanuele Giuseppe Esposito wrote:
> job mutex will be used to protect the job struct elements and list,
> replacing AioContext locks.
>=20
> Right now use a shared lock for all jobs, in order to keep things
> simple. Once the AioContext lock is gone, we can introduce per-job
> locks.
>=20
> To simplify the switch from aiocontext to job lock, introduce
> *nop* lock/unlock functions and macros.
> We want to always call job_lock/unlock outside the AioContext locks,
> and not vice-versa, otherwise we might get a deadlock. This is not
> straightforward to do, and that's why we start with nop functions.
> Once everything is protected by job_lock/unlock, we can change the nop in=
to
> an actual mutex and remove the aiocontext lock.
>=20
> Since job_mutex is already being used, add static
> real_job_{lock/unlock} for the existing usage.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 24 ++++++++++++++++++++++++
>  job.c              | 35 +++++++++++++++++++++++------------
>  2 files changed, 47 insertions(+), 12 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Z/TeX53vXRV7W6/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIFMWoACgkQnKSrs4Gr
c8hGbAf/fYVpd2s4kfz3jQodoffX6BeFUDv3cGZxpe8e1Vixp29A3ru2jfcPKGy5
lbC8hEfOQy8NgYpOb3jLfbF0UCiQvoIvj63yJIrjfp4c0W8RGvhvNmjTeF0dkkPL
skjY2UJvxB/2imdO2SLJX7btxt6LeSS+iFdNeUowCMwtF6PTa3fzRcGvsLemrSAM
wWlRbfmJnENVfqTvCe1gWVeQ00H/C3o6xtkvNQ4fV+oKv5bI6JZ3JYOs5wKfkAtk
GY21zunjK2fLorP+dKi+c3Ttg0ZQdINg/kMkyU57J5VTzd0AOa68rp6Z3Kaz8LiB
KDQzmhxCO7u1XmE74E286xvqtpfCLg==
=el3x
-----END PGP SIGNATURE-----

--Z/TeX53vXRV7W6/C--


