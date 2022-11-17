Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8946163247E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:57:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox7Hl-0000a2-QO; Mon, 21 Nov 2022 08:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox7Hi-0000Vi-Lk
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:56:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox7Hh-0003v9-4M
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669038988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KHE5p4h4Dy7zD9rPBdnU5nUsIJCBI4chxk1PHEBoSEM=;
 b=eK42ee0V/b4ud8oFUF1/9zVDapZZhVHT/xyHeZCTSgjrWiDdswgYVU37dnr/oRzWaz/7Gu
 jkw5j2jkVBgZcwsIGbYF7TxiLkvcobK6cgR5LAnEravGLAG0ThW447dMIPuzZwOQ+K9WeZ
 jFkIAtFImistDmTdOlQGQ0J2MGK/67Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-CeJv3NnwOw-lJV4JV_VlAg-1; Mon, 21 Nov 2022 08:56:26 -0500
X-MC-Unique: CeJv3NnwOw-lJV4JV_VlAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E893811E7A;
 Mon, 21 Nov 2022 13:56:26 +0000 (UTC)
Received: from localhost (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9AB6111E41D;
 Mon, 21 Nov 2022 13:56:25 +0000 (UTC)
Date: Thu, 17 Nov 2022 15:08:01 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PULL 0/1] ppc queue
Message-ID: <Y3aUoRLbASdjz5d7@fedora>
References: <20221117151657.182061-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ACPe7LLwt2AzpZNE"
Content-Disposition: inline
In-Reply-To: <20221117151657.182061-1-danielhb413@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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


--ACPe7LLwt2AzpZNE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--ACPe7LLwt2AzpZNE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN2lKEACgkQnKSrs4Gr
c8jMwAf9HFc8HfCuy2aiIXwgeCrlacB7nGGw1BEo9QaPVT7CGoCn0PpRrx1dhlIh
lSb96AuJafO6LxqEKwvG+9TpDpF7qYMqCl0W2NKLY+XOWwwMkev3SZrZoVefM+es
oQJVASv07nWKkpqgiRmDxZBDkb0HqakkzNqD3LqWtMopn9kZjmzWQGocxgC6yRlJ
PuXYe3flVB0EP4iJQkUCQuvnGSHWn/IVoRhEm6tiA2WOytDdP4dayryDWAgehW9v
pYQ8YHuwGIdgVaMXRI8d2ZrwfpkabvTOlpaNXbSq3yQLFlDpxz5vR50VDnKp49Fb
Ht9rOh5fT2lxO3+XTSPUJcblBKrT1A==
=HL93
-----END PGP SIGNATURE-----

--ACPe7LLwt2AzpZNE--


