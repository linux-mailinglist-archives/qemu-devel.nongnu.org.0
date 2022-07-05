Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415685664AB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:02:33 +0200 (CEST)
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dVv-0002ne-Ug
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dSJ-00016e-1y
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:58:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dSH-0006ZR-Jq
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657007925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qbPYnOH24EgScvgF98Hl8V10vGZaF/ZW649p1mWv4x0=;
 b=LN99+QhDGg1HrARTZGZ4kKz7ju1OK7CApfzGpQUChiQ/xKfY2W5/9papQhqbAXdCWVojsS
 7gt6Uj4FkTHbhwlK6O595pK75A7Qdj+WlnU+ZYNpwKKfN9J70HxNQL6NpuctRDeQyg2IBE
 wyNPe2FJjJPoV26VMyKQVAdeAOi+9W4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-bK3mVIMTPt-c007wvxc4UA-1; Tue, 05 Jul 2022 03:58:41 -0400
X-MC-Unique: bK3mVIMTPt-c007wvxc4UA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5AE03C0CD4D;
 Tue,  5 Jul 2022 07:58:39 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FA12492C3B;
 Tue,  5 Jul 2022 07:58:38 +0000 (UTC)
Date: Tue, 5 Jul 2022 08:58:37 +0100
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
Subject: Re: [PATCH v8 08/20] blockjob.h: introduce block_job  _locked() APIs
Message-ID: <YsPvLS+c3SNPO7Qw@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-9-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W97u+twT0VF9nsZc"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-9-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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


--W97u+twT0VF9nsZc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 29, 2022 at 10:15:26AM -0400, Emanuele Giuseppe Esposito wrote:
> +BlockJob *block_job_next(BlockJob *bjob)
>  {
> -    Job *job = job_get(id);
> +    JOB_LOCK_GUARD();
> +    return block_job_next_locked(bjob);
> +}

This seems unsafe for the same reason as job_ref(). How can the caller
be sure bjob is still valid if it doesn't hold the mutex and has no
reference to it?

Maybe the assumption is that the next()/get()/unref() APIs are
GLOBAL_STATE_CODE(), so there can be no race between them?

--W97u+twT0VF9nsZc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLD7y0ACgkQnKSrs4Gr
c8i8mAgAubcfJ3Y1wo9WMWAWiwG/Q1/74efVAE8FA23DYYwP3+zdKK/JHKjOLuod
5+OpcetRSowUaghinO5CKvVzeBrIkpbf+BUWNbDjmMMtQKgjLzdP7hFEd1rbbYW0
6z6slBt8IP9kH/hBperD7tWO2Qd/5rVOL+5+CWZ5agD4tFGZbAI56IdR3iRq2RwB
OW8ASXK0ikpBwz6MnaMKgr6CaeNP5/dpFlPAv2KqQdVW2IpkiggPAEu1ti6kANqb
bjleBvlApiXMq4i2NOBxzsZod+XlrKqkS9ywVCBb8sMttXfDB+FEubGpxr/rs3bT
4qmFMI/Cqdatm6XP1jeg+mGQBCu61A==
=4Pb2
-----END PGP SIGNATURE-----

--W97u+twT0VF9nsZc--


