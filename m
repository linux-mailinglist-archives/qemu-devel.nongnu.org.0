Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90362566EFA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:10:49 +0200 (CEST)
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8iKG-0005yq-2S
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8iHz-0004Sb-Em
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8iHv-0007QA-JB
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657026502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VMWGsG4Ho4ldrtoMlMPvd36db3HkOJYDJmBIxCRlZEw=;
 b=eQ1m52LYauoNX8JKNb5y+ln1g699EV+31hs8O1pu4aUZ0iGuexHfYtjkfd0x0saXiav8w1
 pGyEpX9jyPNzqlkKWZpCjO9uF6ekbX7Rm/f0BEIZT6Iw1vtgaIjWtmCoL54BKGYiTqjfwb
 sUUH3yRONVzlyhztJllVw3f/nUWEF68=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-OlVC8xLQNn6XqbqoK_CNzw-1; Tue, 05 Jul 2022 09:08:01 -0400
X-MC-Unique: OlVC8xLQNn6XqbqoK_CNzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C9C1811E80;
 Tue,  5 Jul 2022 13:08:01 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE5AD1121315;
 Tue,  5 Jul 2022 13:08:00 +0000 (UTC)
Date: Tue, 5 Jul 2022 14:07:59 +0100
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
Subject: Re: [PATCH v8 17/20] job.c: enable job lock/unlock and remove
 Aiocontext locks
Message-ID: <YsQ3r398HXi9B92H@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-18-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zDaEhvfEkfB7l/b9"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-18-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--zDaEhvfEkfB7l/b9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:35AM -0400, Emanuele Giuseppe Esposito wrote:
> Change the job_{lock/unlock} and macros to use job_mutex.
>=20
> Now that they are not nop anymore, remove the aiocontext
> to avoid deadlocks.
>=20
> Therefore:
> - when possible, remove completely the aiocontext lock/unlock pair
> - if it is used by some other function too, reduce the locking
> section as much as possible, leaving the job API outside.
>=20
> There is only one JobDriver callback, ->free() that assumes that
> the aiocontext lock is held (because it calls bdrv_unref), so for
> now keep that under aiocontext lock.

This discussion shouldn't hold up the patch series, it's a separate
issue:

Why does bdrv_unref() need the AioContext lock? The reference count
itself is protected by the BQL (bdrv_ref() is GS too). I/O requests
should be using fine-grained locks now, so I'm not sure if we still need
to hold the AioContext lock to drain them?

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zDaEhvfEkfB7l/b9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLEN68ACgkQnKSrs4Gr
c8hsYQf9HrOIhB3oq+LrIhKr6xHDv567N6U+HS7uCPl1T+aCQPRL1OOD1nZdYtKa
5av71HRiDSe1Idxelr8pO4iMjsVKQcjYlKGINIOlXhgUIjUMexSHj17o1oaW5JQs
SS2HAqe1ZeiwrBJe1GJ2RAUw263J9CvmCT3u5Z+BsF1KJUQ7C2gHvL83GNnTAbpf
VuQwSHul4nrPOHUTuNSqwuO/Qupe/CISdRHzJgA/mlvkp4wYBhQaQ94PUY7FKiNK
RXYfP1dE4v56hAcG76BPxoktqtttLPYzrYGl6WMhTr2Cft/YTA4XwvEDmlqcwL3E
qFAewggT6pky1kMOpbidFiCmk1R5jw==
=V4QD
-----END PGP SIGNATURE-----

--zDaEhvfEkfB7l/b9--


