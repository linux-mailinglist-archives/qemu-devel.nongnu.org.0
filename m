Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011095685AC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:35:07 +0200 (CEST)
Received: from localhost ([::1]:39654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o92N8-0002eq-4b
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o91yT-0003AM-J0
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:09:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o91yS-0004I5-3I
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657102175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7Ebi7pnMb2Z+4uHHmihc543pTb6Y5IN+mPlNTxBplk=;
 b=MQB5D8hEVhY63NEO5I/kzRKG6LrimSG6ZHYYffoOJcme5y2aUNneYIqBlP0Zc+EDC5qW+9
 48pVUR+2GjNXb9xEReqwI1AzsFryfRhJf/9AXuc+dtlFALRfPs4NapOxSINDtgooBodnp6
 Dtn7P+BrWCdLOw4/d0Sprl8eP9I85nQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-3LABkKdzMXO4dCnjiC_YKg-1; Wed, 06 Jul 2022 06:09:30 -0400
X-MC-Unique: 3LABkKdzMXO4dCnjiC_YKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06A733C0D855;
 Wed,  6 Jul 2022 10:09:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EE0E2EF97;
 Wed,  6 Jul 2022 10:09:27 +0000 (UTC)
Date: Wed, 6 Jul 2022 11:09:26 +0100
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
Subject: Re: [PATCH v8 05/20] job.c: add job_lock/unlock while keeping job.h
 intact
Message-ID: <YsVfVnCPOvxOl8Pn@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-6-eesposit@redhat.com>
 <YsPqxG4//mc5DBn4@stefanha-x1.localdomain>
 <0c4ff18c-f12f-6955-09b8-8acd3126492e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p1wtWc0deZwvvkTM"
Content-Disposition: inline
In-Reply-To: <0c4ff18c-f12f-6955-09b8-8acd3126492e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--p1wtWc0deZwvvkTM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2022 at 10:07:40AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 05/07/2022 um 09:39 schrieb Stefan Hajnoczi:
> > On Wed, Jun 29, 2022 at 10:15:23AM -0400, Emanuele Giuseppe Esposito wr=
ote:
> >> +void job_ref(Job *job)
> >> +{
> >> +    JOB_LOCK_GUARD();
> >> +    job_ref_locked(job);
> >> +}
> >=20
> > You don't need to fix this, but just a note:
> >=20
> > This API seems dangerous. If we don't hold the lock, how can we be sure
> > job won't be unreferenced before we call job_ref()? We would need to be
> > sure there exists another reference that won't be released until
> > job_ref() returns...
> >=20
>=20
> I guess that's a drawback of using this new serie organization :)
>=20
> This function is just a temporary placeholder to avoid having _locked
> functions being called without the lock held (see previous serie
> suggestions from Vladimir and Kevin).

Ah, yes, I saw non-locked functions being removed after I reviewed this
patch. A comment would help explain this to reviewers but there's no
need to change it now.

Thanks,
Stefan

--p1wtWc0deZwvvkTM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLFX1YACgkQnKSrs4Gr
c8j10QgAm+TzHynZez++1PA54zAjT6V7KaAdQ5f07FBxx+bEYtbnJZtrNJiHPLIe
HM/BSsPpR457xuqw9FqIxvPKrQdD83b29wGp583EBMHEhs08toDaqyxGEU/ilMxW
BTMh+Wbso6CAUIOXki7ovrsbJpF/9FVz6hoATVRobC8hpmucTjJQav4uheymHYzQ
4/EAvTtyZQSSqUlYCbvkH+hq+5hEUuu6OvitntaufpIeBKm+aBmB/w0Bg2D5cRAc
YVtX1DN8UZ2L716e2ByLE0r82QrHsfYTtXA70btfX9BE3b2cmYBZ546f+KJgSmN2
8p7e7yN+IffmpCMtPD9yGVviSQxYmw==
=MrDN
-----END PGP SIGNATURE-----

--p1wtWc0deZwvvkTM--


