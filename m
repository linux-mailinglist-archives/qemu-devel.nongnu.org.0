Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07FB5EC9D3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:44:41 +0200 (CEST)
Received: from localhost ([::1]:46614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDhI-0003BF-H2
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odC8Z-0006F2-6Y
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odC8X-00081c-G1
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664291080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mjJBgPaZX3LvN7HG92S29pSHTq22RD0cj1wjCLSClkc=;
 b=VLJo/IOZ+BSfsLtrC5OXdIZOVJYOXfXGIO1S0+JLunmC6xwRyBaZ4YXsrd1bSEgpQrNo5h
 sctQldtapfEtNGaeN8lrnxwOog7NZ77RfiWe6vpFtx7rIkvgyyrEjANrPZ7EaEhgYVgiSd
 TKVvnHCE8JIZCCSeXrDCUkcnMFhNK90=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-rrLbcVFZPiKzbUQ5b47Tpw-1; Tue, 27 Sep 2022 11:04:37 -0400
X-MC-Unique: rrLbcVFZPiKzbUQ5b47Tpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00CA7101E148;
 Tue, 27 Sep 2022 15:04:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7910A40C83C5;
 Tue, 27 Sep 2022 15:04:36 +0000 (UTC)
Date: Tue, 27 Sep 2022 11:04:34 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com
Subject: Re: [PULL 0/1] Block patches
Message-ID: <YzMRAhiJN0d8W9or@fedora>
References: <20220922171447.166958-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9mgj/r1alEjyP0IH"
Content-Disposition: inline
In-Reply-To: <20220922171447.166958-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--9mgj/r1alEjyP0IH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--9mgj/r1alEjyP0IH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMzEQIACgkQnKSrs4Gr
c8iq/wf+Nl2IjjUe+MslZPdQRgrkfUp3EXN7ritGI3AQ7PGTrjtaVI7qwI3tr2U/
garAYbyXEhvSyyd6FXarV3QynB79+KIsJFes/+cr1N/a9nIauWitjV8+V/Wtc1Ot
TfGV+ABbkAPafvr8DsuT+FFX31JfaXUTOUMsV8kDbCrW+tPszMMK8XpBFOlLsubC
lsWZjWjAnNvuK+3wek0HuZAYKiWhxDTUInwnYstj1OpB3VRYxAuyfesA2ppFPEOd
dnAFOwp3xKKYQN22E6PFzi4HIWsz4/W71yaJzi6PdmY6/W8CBSYBTmQj4jJYvQ0i
eCpYoRnxq7IsM31YyvlNJxR8M+D6Og==
=up4J
-----END PGP SIGNATURE-----

--9mgj/r1alEjyP0IH--


