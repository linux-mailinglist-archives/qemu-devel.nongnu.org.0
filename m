Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9391632474
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:56:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox7Hk-0000YC-Uf; Mon, 21 Nov 2022 08:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox7Hh-0000QE-E8
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:56:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox7Hf-0003uz-LP
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669038986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZRHQNCT/APIGrHuivW1Fro0IPRmZIL/vDs+eJUWrwSw=;
 b=J6bKHkqYL7tbMNBHVw9WdbL5QcYj0NS4PYaIXqIS8H6VYRgJHBp+j+VnjZcgjEayH4YeiZ
 bcL1DrRRR42jrrnjj2jzXNQlDsA/p9M2X5kST+Y6e5LVg94Ca1S4PVa/XhKGmbRUjUjJ7v
 k71QCIXFnXBjLG8+S0AhPRa2SC85EhY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-ebsRlmvbOMiq1bI0SlurAA-1; Mon, 21 Nov 2022 08:56:22 -0500
X-MC-Unique: ebsRlmvbOMiq1bI0SlurAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A0D687B2A4
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 13:56:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13F7C17585;
 Mon, 21 Nov 2022 13:56:21 +0000 (UTC)
Date: Thu, 17 Nov 2022 15:07:49 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 0/4] Some small s390x and testing fixes
Message-ID: <Y3aUlVhy2lEtNXzE@fedora>
References: <20221117091006.525072-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6dShjj9Y+wwW59EP"
Content-Disposition: inline
In-Reply-To: <20221117091006.525072-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--6dShjj9Y+wwW59EP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--6dShjj9Y+wwW59EP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN2lJUACgkQnKSrs4Gr
c8iOfwf+NY4Fo+R+aDTeQyga/f993rxd+iSNckswmM+IVxzc0rqh582BAumg1sB7
vNJcbIITTmmBDJLWC0W9sQ7B+BaXv01NPx6K2tMuYRpN/NA2EpF/a8z3T/60p+yq
PX2DXDHNHwxIvD6hwZ6b0whICBxzUAqnf0PuBuDn6Q+gOorZ3qdrgqGQE++6dE2l
wJUtl7V9S2uACqXa4QjgS2yZF3403fzGjEavTpriI2DctbALAB25qbwz7wRLs73Q
awHMPfr/C6D4jShCeuLfv+pD+j4qc1IXpU2xS+fu6iRatGZ4VOc9kgT4Uhmr+LhU
mRA2ndZ7xoZ6SJTWU+cyYSu28cvqmQ==
=GmHX
-----END PGP SIGNATURE-----

--6dShjj9Y+wwW59EP--


