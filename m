Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54182544B67
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:12:11 +0200 (CEST)
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzH1F-0004HP-TY
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzElM-00047M-LC
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:47:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzElL-0004D2-7X
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:47:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654768054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gkZeV9f0ry4tgN3rhZj0d++IziB5RQvorXbHUtl1K28=;
 b=e5lMomVaL0Ycdz0FnTsUmej/E3YXMbvn1YwBGlepBpfdjhu96DpXxG/6cHpTVm3qf/PQZJ
 77IfW6nVuXjYm4DSrwFeDQzgc/AYXzsCdRGl4pMSjTNG2iT3P5LphShuGjc9b9JsulyqjM
 XXXAXYmW70OmFUXR2RLNLw4+ZUKwMdA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-Mu5hxQO_NCmGFS5xPBy6eg-1; Thu, 09 Jun 2022 05:47:31 -0400
X-MC-Unique: Mu5hxQO_NCmGFS5xPBy6eg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE60D294EDD4;
 Thu,  9 Jun 2022 09:47:30 +0000 (UTC)
Received: from localhost (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 854322166B26;
 Thu,  9 Jun 2022 09:47:30 +0000 (UTC)
Date: Thu, 9 Jun 2022 10:47:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 10/18] jobs: rename static functions called with
 job_mutex held
Message-ID: <YqHBsadJ/fUdRZk0@stefanha-x1.localdomain>
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-11-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AaIB+k5UIFATwh2j"
Content-Disposition: inline
In-Reply-To: <20220314133707.2206082-11-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--AaIB+k5UIFATwh2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 09:36:59AM -0400, Emanuele Giuseppe Esposito wrote:
> @@ -530,20 +540,24 @@ void job_enter(Job *job)
>      job_enter_cond(job, NULL);
>  }
> =20
> -/* Yield, and schedule a timer to reenter the coroutine after @ns nanose=
conds.
> +/*
> + * Yield, and schedule a timer to reenter the coroutine after @ns nanose=
conds.
>   * Reentering the job coroutine with job_enter() before the timer has ex=
pired
>   * is allowed and cancels the timer.
>   *
>   * If @ns is (uint64_t) -1, no timer is scheduled and job_enter() must be
> - * called explicitly. */
> -static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
> + * called explicitly.
> + *
> + * Called with job_mutex held, but releases it temporarly.

s/temporarly/temporarily/

--AaIB+k5UIFATwh2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKhwbEACgkQnKSrs4Gr
c8jfQQgAnT0GfKEcbiT9CQM6K57bKj7ppAJ0M7PNgDbzE2UnJ1dA+5Dmw1UlK6PN
a5ikkT/Y3CO15Ap1Ut6H9FkZwfbPqQUpOkS9bmp7/uYZzTrxTgCrKTJkLZ0CBlCr
9kpvMbFL+ZpGsylxmCRF9iUGOlH4tA8mrQVV6jxdZ4uwbi+jTg1gOxFvdZMF1Tp7
9ufWpSgkqAp+BmkYmCcpAlrefDxNNKoJrFkXm7hXZGF76MuDcDMKLu1KKWXGi6iF
/iaYAKvt8aTPZFyG3Kld5SK9viD+cf7fM0V9CXkYgsmGx21uHNw1Pd9Wb/u9ALHO
HANInXmLKXpM8Grv5u1wl/7Y1lL1+w==
=ud57
-----END PGP SIGNATURE-----

--AaIB+k5UIFATwh2j--


