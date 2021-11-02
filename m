Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E99442B5E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:08:29 +0100 (CET)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqiS-0006lW-Qq
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhqgq-0005i5-DK
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:06:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhqgn-0000eN-7k
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635847603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FV/e4q+qJNN/aVdKwlWfA9SWGxP/MeHQiPmO+obWFDw=;
 b=XiZIvJGuXD/hEsocC+tVRiUhAxLryFXA7bHyDh8FV7S+32LiCv2qUDpdnMyTu7PKcrJpa4
 gdUyMaW8Z0Xd2VkpX6p7OLK1DXaIyzYUG/7SqSfcmFijvtk4Hit0qNpyJMyxVO41RBX52D
 pUum66D5lTNtqn6xYH6/+mrfdwRlzt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-B0TdCQHHO7iPdMdMWf2PAw-1; Tue, 02 Nov 2021 06:06:40 -0400
X-MC-Unique: B0TdCQHHO7iPdMdMWf2PAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 147458042DF;
 Tue,  2 Nov 2021 10:06:39 +0000 (UTC)
Received: from localhost (unknown [10.39.194.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DFEA60C0F;
 Tue,  2 Nov 2021 10:06:38 +0000 (UTC)
Date: Tue, 2 Nov 2021 10:06:37 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 00/15] job: replace AioContext lock with job_mutex
Message-ID: <YYENrb7Cas3eAsUT@stefanha-x1.localdomain>
References: <20211029163914.4044794-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211029163914.4044794-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p6SpuYV8QDkH0QJQ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--p6SpuYV8QDkH0QJQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 29, 2021 at 12:38:59PM -0400, Emanuele Giuseppe Esposito wrote:
> RFC: not sure if the current patch organization is correct.
> Bisecting in patches in between this serie would cause tests
> to deadlock.

Patch series must be bisectable. It will be necessary to fix this.

Stefan

--p6SpuYV8QDkH0QJQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGBDa0ACgkQnKSrs4Gr
c8is+wf/QdyN5vWkC4Rk5v6rp0nni2EjPyXe8jWPnVsK7j0PwbZAN++lWjX+yv3Y
+lE0r14BeOlPHgWN4nSdE8dyTFacWJlA0ND3NAiBaBd5kIobeGfUe++yVrxZtkip
Cthz1nNQtmmVjS+Jz+AZpvqI7Jz1AyfljJngqnWUuFemuu94uls9sRS9jQS63dE7
ZcnJfRBDvG4ZOU/ymfoP10mskqof5m6yzLeGt1u4bRoYOtCrs6QpWvmB3J2wGPqG
5WRCqUKvwTDuARfMCF8c/oWczwGKLsr8EoD/u4o92fPIjXKmshKxZtMP3ohhc5ge
lIesDHhs8pK6Kxw3Mtlai5uLQCq1hw==
=4zJS
-----END PGP SIGNATURE-----

--p6SpuYV8QDkH0QJQ--


