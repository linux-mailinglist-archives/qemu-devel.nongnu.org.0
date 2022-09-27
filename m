Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597055EC836
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:39:45 +0200 (CEST)
Received: from localhost ([::1]:38470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCgS-0004g4-CO
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odC8n-0006M5-J8
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odC8m-000833-1h
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664291095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AEFme32BN6vImHteH5/Yb6lZJz9IhGFu+lAyTQBRVgo=;
 b=DhAmTa+aS+0v/k7dhlR6NDbRhkAoL3uTyXmLo2jxk07wKiZr1XmQbNYAUYqEkOofZDd+BJ
 Iy1X10OW5cI0tNUCz3oeNRAbdVrT0YRo1QQX2zkTKTemsiYnX3LEX35Zk0m7LqiaKPjTUE
 N5XuGQCIeM2sDvhZKFV4hu9Br/NR/xs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-B8_s12aQO1m1nCm2EfqF-g-1; Tue, 27 Sep 2022 11:04:51 -0400
X-MC-Unique: B8_s12aQO1m1nCm2EfqF-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD98A1C20AE0;
 Tue, 27 Sep 2022 15:04:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FCB32027061;
 Tue, 27 Sep 2022 15:04:49 +0000 (UTC)
Date: Tue, 27 Sep 2022 11:04:48 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PULL v2 00/22] riscv-to-apply queue
Message-ID: <YzMREOqWwN2iFhDF@fedora>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DC5Yy0SXFyw2Bgck"
Content-Disposition: inline
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DC5Yy0SXFyw2Bgck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--DC5Yy0SXFyw2Bgck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMzERAACgkQnKSrs4Gr
c8iJZgf+Ne+E0PU+XeXpNKxWo264UspffusMaEHww17bZvZYID8Y80vv3cgikr4b
2yvJSYP4Khb80GQ+ja5RUhOunT/At8kWaZV/OPwTFerluCbF4PQ6CXdgeSHW7pHe
T/2c6PFdX4nCjFHwxQqbU67H3j33tk2hkRqswM2o00ckGQKgi1/nzlnJxxPdZq0J
stlGQcMyx8/3rwaoC+8vyGoh8ZorMDXU6oe9uh6OY0uj+wHpsK15t0CsnLEeE+v5
R+JB1VjYOyS45IVUj1tKKYrkhLcitSVQ2Sso68jaXstzYS1blpmp/OCOHihsnCl1
UfD4YMKIswNKDGK/bBke6e+s3mUshg==
=BSRr
-----END PGP SIGNATURE-----

--DC5Yy0SXFyw2Bgck--


