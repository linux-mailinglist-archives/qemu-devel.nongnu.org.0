Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F796474883
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 17:51:03 +0100 (CET)
Received: from localhost ([::1]:36560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxB14-0000WN-CR
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 11:51:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxAxx-0006or-PE
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 11:47:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxAxr-00080I-EI
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 11:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639500462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7rRS7f8lCA9XZ32QUw0qNZQ9Jf6l+0c6cG68Pe+117M=;
 b=Vpkm6CODHFckgV8kLsX/0H3YXx78b+42wC3ksupPPJupNqUL3bDNjqGSVuq322Ocs3a+D0
 LZ4sUkcXRNAWYc2JezmtPduaBWeOfGzT1P2tJNtMcdhlD+vPLqmqeDofBblW/JOgoOFm4Q
 GwHanq9jkOJjVqcpmf1XpcZJMmc2l9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-z3IsO3qSNVWKzSdhG9H6gg-1; Tue, 14 Dec 2021 11:47:38 -0500
X-MC-Unique: z3IsO3qSNVWKzSdhG9H6gg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB55D192D785;
 Tue, 14 Dec 2021 16:47:37 +0000 (UTC)
Received: from localhost (unknown [10.39.195.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E2761059A74;
 Tue, 14 Dec 2021 16:47:30 +0000 (UTC)
Date: Tue, 14 Dec 2021 16:47:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/6] Removal of Aiocontext lock and usage of subtree
 drains in aborted transactions
Message-ID: <YbjKoUiJtEKANm81@stefanha-x1.localdomain>
References: <20211213104014.69858-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211213104014.69858-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/avxeiQxahJxNZj/"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/avxeiQxahJxNZj/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ignore what I said about a missing aio_notify() call in
aio_disable_external(). Skipping the call is an optimization and it's
safe. We only need to call aio_notify() in aio_enable_external().

Stefan

--/avxeiQxahJxNZj/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG4yqEACgkQnKSrs4Gr
c8iyKAf/cUbvh725jNg90M0iXZNuA/MLpB/gAFVM4s2+nYdfO+AYC1hw3ESWZF9y
SvHrtIodAhfqqSBgDsz5rqFbiCYFhSxh3hb0ktFtXMzDpO2j7evDa7FN3hM4yZrm
9zeLDzse+Nvdc9Zs33RU8x3PFNEaLSEh0pVF+pLZs3XWX//xZCe96AFLnH6toiDQ
g/Y778lzfHUdHO3kOr/NsUUIP/djMfPBApsWCEfEzb66i+MtypNg5oHCyOD0CrNe
o4N+w4VXFwkbKyWAB1lHXeHFtQWlQQDvD4cKbusirVCEsh9SGg6avhShFmK2iEyt
oa/1JYk+xC7xjNHfWQHMHCixJddZ0w==
=8Qay
-----END PGP SIGNATURE-----

--/avxeiQxahJxNZj/--


