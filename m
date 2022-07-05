Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C4D5664B2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:07:22 +0200 (CEST)
Received: from localhost ([::1]:52110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dab-0007gO-Vk
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dTw-0003FK-Ce
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dTt-0006sH-9q
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dVK5ztQVfiocw/v3zXWJzQDu814D8k1ZWldlkk69uY0=;
 b=HDOq6rjmWTDwZQTDsA+k637qoQDcn/aBTTxVic2LDs0dTr8s3cXGMWPN2GOmwD1KOt+TUm
 D+S//h4but/Bfqz42W1CBYimMICvP0kMVJ5ZJhRpF964/eGcM5deZ0vJMzVrLEYg/ixqIc
 X00SoGcnXoBWJa+DZeH08q6UuLwuVFU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-O5igAI7ROeyCHrHEvYKsrA-1; Tue, 05 Jul 2022 04:00:15 -0400
X-MC-Unique: O5igAI7ROeyCHrHEvYKsrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1445685A582;
 Tue,  5 Jul 2022 08:00:15 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD1501415108;
 Tue,  5 Jul 2022 08:00:14 +0000 (UTC)
Date: Tue, 5 Jul 2022 09:00:13 +0100
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
Subject: Re: [PATCH v8 09/20] blockjob: rename notifier callbacks as _locked
Message-ID: <YsPvjYnW+/Uf8eQ3@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-10-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jzTaJiMbmgprgjzF"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-10-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jzTaJiMbmgprgjzF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:27AM -0400, Emanuele Giuseppe Esposito wrote:
> They all are called with job_lock held, in job_event_*_locked()
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--jzTaJiMbmgprgjzF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLD740ACgkQnKSrs4Gr
c8hrLggAirGqZDIzo8flJGN/uo332np9keahOEH81cZffpDyJi6u7elgTdBXEMez
gzcTDc8DKmGwGVRSM4PP3R7GLipSR5HQRBzWtSERS9zni/CLVKE3C5wwpXxFDgD2
WGyTc6StTQOQerFEG0iXXOV7Cf0dPD62SzeIITXA1LUIjzYcIIcGwqMeI1YgvBJ+
GoTqhwet2zz8vy5w3Hq8nyZMg3HAkdqYYnGTJ0Vf+0u71Tmk5nNWe6BdL37gDznV
KqTN3xwU8q5JlqRD+DYSHHbDw66V+2Qcd+h9qLxpXj/hragbv0Rv9i6UDueDo+OU
bKaufvx+kgcUD4oOtwscLWwT87KvCQ==
=ffTO
-----END PGP SIGNATURE-----

--jzTaJiMbmgprgjzF--


