Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B97425175
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:48:17 +0200 (CEST)
Received: from localhost ([::1]:50154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQwi-0003gN-3o
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYQtS-00082l-DN
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:44:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYQtQ-0003LX-49
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633603490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lkd7Te4nMMzzHAEzIvfm5HZGcS7E+EfJCfoXmvRWpy8=;
 b=MqmIFOZNsdzNM/cbajkWlSTVM/ly2m5+yCDIEziuTu+UZF45O8FVExEZAGcSxW808+lovz
 qtkFhO8tOklUFrlUN32PWej00lpEPcirVX2YpbZrDvDNax346bANNYcUWZZXBhgPuk5llu
 Fdc1IpWoRrNqThiG4Q5c9ChbIFj6uzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-Cf1Zm8-hPxKqw78TJgzJaw-1; Thu, 07 Oct 2021 06:44:35 -0400
X-MC-Unique: Cf1Zm8-hPxKqw78TJgzJaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E9441006AA4;
 Thu,  7 Oct 2021 10:44:32 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 496D35D9DD;
 Thu,  7 Oct 2021 10:44:31 +0000 (UTC)
Date: Thu, 7 Oct 2021 11:44:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 05/25] assertions for block global state API
Message-ID: <YV7PjjP1DRJU8Bee@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-6-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="utm+W13xifAI83KO"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--utm+W13xifAI83KO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 10:31:55AM -0400, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c        | 135 +++++++++++++++++++++++++++++++++++++++++++++++--
>  block/commit.c |   2 +
>  block/io.c     |  20 ++++++++
>  blockdev.c     |   1 +
>  4 files changed, 155 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--utm+W13xifAI83KO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFez44ACgkQnKSrs4Gr
c8gHIggAp7IGuLAEga9tpNAY4QltyyhWhN8Cqawv4fFQ2bwFvYf3CyqBNxDVDifM
+aTMIT0kWlszx4UHeMMpCFu8t2Ie0pGpuIMTjVQCQ+CjAk+CpLh7HoqaSDgY9Qsg
UfCxA0QXjJHUd0DlTOAC2M5GCARy1x6cZq88aZQeOyjQNGWut7nLuEC6bNh3YRyN
66CR5w5xo4n0UxBXHBNRPIEDwyOxgLPqmGM5gO2FAUfEeXcnsnyTaKtxNRq4B31a
+sP+KKjA/QkUpfHKUm1t8j49on/0UUZpq8JUjIoduy8LspkbVAdgc8/0kwU52S1J
5F0zghf/8rwm1+ltNrnoMIBKr3BvSw==
=bC7s
-----END PGP SIGNATURE-----

--utm+W13xifAI83KO--


