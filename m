Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B835F56EE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 16:58:42 +0200 (CEST)
Received: from localhost ([::1]:42038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og5r7-0002AJ-FF
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 10:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og5Ar-0000lk-B6
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 10:15:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og5Aa-0006fS-Jp
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 10:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664979283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z1xp3m0B3raXTA2Ul7qlJxxgpFD8rAJ0UOTbRFN1h7k=;
 b=TPu2fuNCtaZPo9wCFSqdSWxYGiGVfhEatl+aSOsChAZsr246rIfeG9y4oiMbqdEsEdOYVk
 0jQROeOMDd6LVK4FdK/prMII1vcIfunLK6uWERCq9OTv5tRzgQ0Gzs0rGCbkSesIbuYhUW
 S7Lgkv80VO8ZuqVo52ZvjpVTR6BjNz4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-LWIeERb0PaCxmAz2_a17VA-1; Wed, 05 Oct 2022 10:14:40 -0400
X-MC-Unique: LWIeERb0PaCxmAz2_a17VA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65C5D29DD9A5;
 Wed,  5 Oct 2022 14:14:40 +0000 (UTC)
Received: from localhost (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB94B483EFB;
 Wed,  5 Oct 2022 14:14:39 +0000 (UTC)
Date: Wed, 5 Oct 2022 10:14:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 0/8] Trivial branch for 7.2 patches
Message-ID: <Yz2RTkfl45oU59xp@fedora>
References: <20221003221345.1324140-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KbIwE7KlM2J+t8dv"
Content-Disposition: inline
In-Reply-To: <20221003221345.1324140-1-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


--KbIwE7KlM2J+t8dv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--KbIwE7KlM2J+t8dv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM9kU4ACgkQnKSrs4Gr
c8icnwf/XuiY4oAGo2fthpGBrfsAJpJGZJ0uJrOVz9jjbcuqEmxSQfb5shKyezEb
3Glj4slky9tkK3RzeItXNXev8NIpU2icrGTbLyLwB+fjDnVuL3vfG4lBXHZiw6cf
82yjhhyn7jnn20Jv1IrOXn/IhBe6FKattkpblcWHMtuvKO+aoZUrW5bTOZnuxYwd
g8yyhyVcrDgRmNMoxLQ74uU74Z+8+y5h9X8o2D5kGsepNFUmyH8YOkPQHALMt5xy
aU4q5PEX/TnjTxU1yyzPdfYK7FGcLXfIE1GZfadbTvIaB7hpf03tfGrygqJ+5Gl7
9zmRp8y0L10o3naEf0A3AMl6xb4nMw==
=gmhX
-----END PGP SIGNATURE-----

--KbIwE7KlM2J+t8dv--


