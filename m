Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471F8544B0E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:53:54 +0200 (CEST)
Received: from localhost ([::1]:41078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGjP-0003zo-7U
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzEg0-0001jG-D4
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:42:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzEfx-0002yP-Ux
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654767721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P69Jr+sofIfo2lHRIuYFdZHSEy/FFhkO7CaAL3/8rlU=;
 b=bVUmYXcPPs8dlNI2QMeI2tO1A1D9b0R6jThAM4721q4PIK7yHT5EXcaQ7cj1nzX9a4Yl6F
 ZQPWjeVfdHvxFXWXSPcs0D8vhBVnEcCKZDEJFpUFjWEjUF0otCARZqQ3jlik1xWIJ6+doL
 x3nl5+zgxJ6yEE7VcvC6gLCctBQL9nk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-Hrw4XPSOMz2FKpvsp_xFSw-1; Thu, 09 Jun 2022 05:41:58 -0400
X-MC-Unique: Hrw4XPSOMz2FKpvsp_xFSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95BEF1C14496;
 Thu,  9 Jun 2022 09:41:57 +0000 (UTC)
Received: from localhost (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49B5E40EC002;
 Thu,  9 Jun 2022 09:41:56 +0000 (UTC)
Date: Thu, 9 Jun 2022 10:41:54 +0100
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
Subject: Re: [PATCH v6 13/18] job.h: define unlocked functions
Message-ID: <YqHAYrb4+e6Kje7J@stefanha-x1.localdomain>
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-14-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iHuM33k2u/xXPr/X"
Content-Disposition: inline
In-Reply-To: <20220314133707.2206082-14-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--iHuM33k2u/xXPr/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 14, 2022 at 09:37:02AM -0400, Emanuele Giuseppe Esposito wrote:
>  /**
>   * @job: The job to enter.
> + * Called with job_mutex *not* held.
>   *
>   * Continue the specified job by entering the coroutine.
> + * Called with job_mutex lock *not* held.

A similar comment was added just a few lines above.

--iHuM33k2u/xXPr/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKhwGIACgkQnKSrs4Gr
c8i3LwgAx1uzY0pofQmx17xlZT/4gF/Gcjx8SlCFvRlKezL/GfBfHlP6S67ZTFua
cUbEkm+uOLav5FvyuC5uwt/wh+PvliGIkbnPjjXFYk7la0kOIz2uouJVgu1NMXLh
gZ2c5z3AUV2efI+ZHOHA46gXGy7qp6FOMgVwV1c3TLgWRnOLdaywq2EUX9fFeYNP
ScdjJ+wWX5hVghwWKzMyiBsb/5YrGRsqd9rx5EMjPshMQ457q/u0KozkkEDgBHeg
RYz4T1sW8EkyvVIrmeO9Eo55Oe0S4tV9MHIcMRYSE1ZrnGnhzreMWjeDj5qqvESA
2gVee3Bhu0NObhyCFIU9BHFPFdBXJg==
=O00B
-----END PGP SIGNATURE-----

--iHuM33k2u/xXPr/X--


