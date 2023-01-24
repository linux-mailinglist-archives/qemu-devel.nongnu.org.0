Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C7E679B9F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 15:21:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKKAh-00008M-2v; Tue, 24 Jan 2023 09:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pKKAN-00006c-AV
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 09:20:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pKKAL-00015W-2m
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 09:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674570028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6cWDHk/y/VJUEE1RUKKpd8SaACWWZAhY2cE6ExWS4qU=;
 b=K03qlHF/rqYYCZjENeoGj2BwDrQcnaP8+ZmrlZ1MlF+Rs4jIMMPBSpfyyY14RdiXd9Akle
 2D40O+0iFv7pB7a6U9VLq9flEV9rcLbglzJy1M+rzI5DfvIJhXY7YiXzzOv14365jAZtX2
 B25G014l0G18zc6Om5+gbMy4dCen8Fs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-jsj2nUkaN_-dm3XyiBX0zA-1; Tue, 24 Jan 2023 09:20:27 -0500
X-MC-Unique: jsj2nUkaN_-dm3XyiBX0zA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EDD8104F0A5;
 Tue, 24 Jan 2023 14:20:22 +0000 (UTC)
Received: from localhost (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1F2F2166B37;
 Tue, 24 Jan 2023 14:20:20 +0000 (UTC)
Date: Tue, 24 Jan 2023 09:20:18 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, marcandre.lureau@redhat.com,
 dgilbert@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, jasowang@redhat.com,
 jiri@resnulli.us, berrange@redhat.com, thuth@redhat.com,
 quintela@redhat.com, stefanb@linux.vnet.ibm.com,
 kvm@vger.kernel.org, qemu-block@nongnu.org
Subject: Re: [PATCH 12/32] block: Factor out hmp_change_medium(), and move to
 block/monitor/
Message-ID: <Y8/pItzIfhSWnJW6@fedora>
References: <20230124121946.1139465-1-armbru@redhat.com>
 <20230124121946.1139465-13-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l92TCpcURoee1JvY"
Content-Disposition: inline
In-Reply-To: <20230124121946.1139465-13-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--l92TCpcURoee1JvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 24, 2023 at 01:19:26PM +0100, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/monitor/hmp.h          |  3 +++
>  block/monitor/block-hmp-cmds.c | 21 +++++++++++++++++++++
>  monitor/hmp-cmds.c             | 17 +----------------
>  3 files changed, 25 insertions(+), 16 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--l92TCpcURoee1JvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPP6SIACgkQnKSrs4Gr
c8g3YwgArdB3/ODHjD1ToOqSKAz3da9RVdUPPuG5ejF0EZmO7knbNQ4LOwFommEE
SO5VfVKxxsYKg+mBgVO774n4URlf05CLQRZFgKEt533iqGa4kZMZNuB0gGvCfGxQ
PdFAP/Yeu/h0S/jq9Z0Ky8Onwhn8xmhNuZWxGtnzV49xow82mLLko5SzPzrq5l7X
r2n2XJf0VccqIK6HnYH4Lz2cNxfq0sa9GQO+xNVSwfKOmCa/xURJxpYhqiIN6vMz
7hpetoJ5Fm2SF8MHlxhhvy8I03qc9pBvBkrKZ9eNhTT2ZmtnwFAMhsXwtD2qGPYX
NSD6h/xu+RoyzdcU2vf5hc0+0Sh5QA==
=SAHS
-----END PGP SIGNATURE-----

--l92TCpcURoee1JvY--


