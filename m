Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5918566EFC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:13:37 +0200 (CEST)
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8iMy-0002Mq-TP
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8iKj-00089R-Dv
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:11:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8iKh-0008E0-EI
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:11:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657026674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1WHE87/enZ/Y9oLaj48uv7OBuwfnzhjhz5vmTqsNI90=;
 b=CfRfvrY7JOXAlDE+99f7MMPCKi1Que28pVNikjExmE9jmJCrHUaz5o1OnCagXZI+24JKyU
 MGer7dILrylveFICt41dDLkxuCtMUhz9h9FjJfjrf5dU6B2FKRzwHV7N2TbfAnCEnXrsZl
 U/62uVYTqfc7ljbwhEfG/uWJRqJw8iA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-zFJcIci6ND63ESeHkoEBNQ-1; Tue, 05 Jul 2022 09:11:11 -0400
X-MC-Unique: zFJcIci6ND63ESeHkoEBNQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC1798339B7;
 Tue,  5 Jul 2022 13:11:10 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CD6C1121315;
 Tue,  5 Jul 2022 13:11:10 +0000 (UTC)
Date: Tue, 5 Jul 2022 14:11:09 +0100
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
Subject: Re: [PATCH v8 20/20] job: remove unused functions
Message-ID: <YsQ4bQAdAc4j8Rvm@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-21-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CBcIGt+K4+tIpiQK"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-21-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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


--CBcIGt+K4+tIpiQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:38AM -0400, Emanuele Giuseppe Esposito wrote:
> These public functions are not used anywhere, thus can be dropped.
> Also, since this is the final job API that doesn't use AioContext
> lock and replaces it with job_lock, adjust all remaining function
> documentation to clearly specify if the job lock is taken or not.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h |  97 +++++++++++++----------------------
>  job.c              | 122 ++-------------------------------------------
>  2 files changed, 40 insertions(+), 179 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--CBcIGt+K4+tIpiQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLEOG0ACgkQnKSrs4Gr
c8jIBgf+Lot6ivDRMs7J738qWSia3WQxCKr6VcZVabZIs/GSx1Gv5qjsQGCSWwcu
Uz5KTCujBQhk+FgpkUlLg6QORCQaGm7wnodzhO48u6C2lxvTn5u9Y9WvoDLY+LZI
ALAQKsmUnH6jK5Irmm/fsZEzZPxIMCEGetfHPpi/8oEGQt9sVa6SV7R0uKRjDyNQ
VwQfnU+aL6J1UFbcucYtyayVoIiISlsiYkUfD1mwxS4SjqZp+1fySovu8qWNhSz8
9ugxlr+1m9g/qn2GorN/jvgQE1ibYXRf4Uj9RVkrg0WYyakcezsNNroVvg3+fUZE
XErixzOvf6LBAhWCH72f4tNtD9yiuQ==
=gdqE
-----END PGP SIGNATURE-----

--CBcIGt+K4+tIpiQK--


