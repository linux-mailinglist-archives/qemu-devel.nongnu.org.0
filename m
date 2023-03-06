Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A306AC382
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:39:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBzZ-0005hv-Ka; Mon, 06 Mar 2023 09:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZBzW-0005hm-Gg
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:39:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZBzU-0006a9-VW
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678113543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KvwBrqlYLSgRYlLD9r1fbJPuh1IYkfg+rVXkMnOvXIM=;
 b=bKYG4dsjuPcatL+v+mj+7HsWjkBaOoWFxqGKb8BaroC01ymEs/Co2+IID01ZUECUsG4lmB
 HR4JeCfCEQmKqFSQnlY4BkTPJNOYDCGD6++b6iCPcVdKdNb1YqFGhNehA/zP7HQZaHYN0j
 lHeOI5f4+o7dB1mFiHq70vu3JzwA4GM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-msyQ8z72NMSy_1rJLYKqdg-1; Mon, 06 Mar 2023 09:38:59 -0500
X-MC-Unique: msyQ8z72NMSy_1rJLYKqdg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05854858F09
 for <qemu-devel@nongnu.org>; Mon,  6 Mar 2023 14:38:59 +0000 (UTC)
Received: from localhost (unknown [10.39.195.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DA7D2026D4B;
 Mon,  6 Mar 2023 14:38:58 +0000 (UTC)
Date: Mon, 6 Mar 2023 09:38:56 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, gshan@redhat.com, eesposit@redhat.com,
 david@redhat.com, cohuck@redhat.com, eauger@redhat.com
Subject: Re: [PATCH 6/8] aio-wait: switch to smp_mb__after_rmw()
Message-ID: <20230306143856.GA51288@fedora>
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-7-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+P2yTTlLIhP94FEM"
Content-Disposition: inline
In-Reply-To: <20230303171939.237819-7-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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


--+P2yTTlLIhP94FEM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 06:19:37PM +0100, Paolo Bonzini wrote:
> The barrier comes after an atomic increment, so it is enough to use
> smp_mb__after_rmw(); this avoids a double barrier on x86 systems.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/block/aio-wait.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+P2yTTlLIhP94FEM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQF+wAACgkQnKSrs4Gr
c8iJywf/dNocRuREiR1kReaxntPhqXfwH2jXfXNX8gq/Mq9CcBTF5VoU/pbcCt+5
+sdXQtyBjPJqlBrHTWdfOCPKE2NmR1ZKSKf0VrfQIFWhGmpIthsvLd4h31b7pY22
EEbtvw1peKF3k7r3X4CqHE3HphwlZnQWQepbnLDo51GrarIJxqVKr1OrAqpFE8wE
me5gdEEhYoaB8wNe8aPCp8HmY9O9GcHfYzD5W4HZbbVcF+CBFrYfDCQvlxPjKHrz
sAZgZJt8nkjZdPBKSb3un6XsIp7FluStguMDG4uCn0PHO9ipOh+1vODMalcgTeCJ
YlzKQyN0fzFurQXVXAkXlCiimtlH0g==
=FDHq
-----END PGP SIGNATURE-----

--+P2yTTlLIhP94FEM--


