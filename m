Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC117442B8F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:22:45 +0100 (CET)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqwH-0002N4-2i
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhqta-0006fV-NW
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhqtX-0007zn-EN
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635848394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bvbR4kzU9SDQKDlwckgRwIpCLAawlQ8qF55kUOXDvHE=;
 b=FYUW3p7XX6o+yluMiujrDSMkqK8TQFkrEx7sKUOkuU5FUxR4zaM5yan/SoYBCrJhfpYY3n
 4WCpSHm4jExpDT6S4erDYaH8mBnopnouLpl76NpNNmrkQAZ9itBrOXHmCj/p8nn9bvi4SO
 4oSXlGjJ0Y1f78Va4WneNDaKrZ0ZAT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-7-GHeEfTPgm-VfxeU3isHQ-1; Tue, 02 Nov 2021 06:19:51 -0400
X-MC-Unique: 7-GHeEfTPgm-VfxeU3isHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A04DF1808318;
 Tue,  2 Nov 2021 10:19:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C60475D9DC;
 Tue,  2 Nov 2021 10:19:24 +0000 (UTC)
Date: Tue, 2 Nov 2021 10:19:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 03/15] job-common.h: categorize fields in struct Job
Message-ID: <YYEQq2mb3eAcEspz@stefanha-x1.localdomain>
References: <20211029163914.4044794-1-eesposit@redhat.com>
 <20211029163914.4044794-4-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211029163914.4044794-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L4XOtNcW3anNzl1k"
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

--L4XOtNcW3anNzl1k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 29, 2021 at 12:39:02PM -0400, Emanuele Giuseppe Esposito wrote:
> Categorize the fields in struct Job to understand which need
> to be protected by the job muutex and which not.

s/muutex/mutex/

          (__)
  `\------(oo)
    ||    (__) .o( moo-tex )
    ||w--||

BTW "which ones need ... and which don't" reads more naturally.

--L4XOtNcW3anNzl1k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGBEKsACgkQnKSrs4Gr
c8jiCggAjz45gDcgET22rSHUtVh+1JqwenMd2NntyAP9Elu3N0KRz7IUd4jxNTZV
T1wHTwq6GbW8NDAQo8qAt8LCrLUdvuwfThnb23jxNxgdOgHO85ZSBYMeu7XZMbef
SyTzoBZxwZb1Z8LyHJ/QjnuZfh7EYxrly8v+8s7FtctHaMdhXb5P72g5hKLtGKUY
izIwcxQAVrkcXR/bJpVLGoSWXLwshLFzCpYQJpeA7ej2iLsdhtVuOih8LYfm0x0/
vE/8s+Ply778H6Rz9lPCz+iYjt0GFu46fZIhuwgL7KtJiMvppGPXWIQqKUGvsjhW
nfFAE8RLdNpnnz7RJcYxzzYMEkcq9A==
=Xc5H
-----END PGP SIGNATURE-----

--L4XOtNcW3anNzl1k--


