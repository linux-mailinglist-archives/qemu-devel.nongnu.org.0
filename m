Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A0324A23C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 16:58:13 +0200 (CEST)
Received: from localhost ([::1]:38268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8PXY-0003Rf-If
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 10:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8PWf-0002fo-O7
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:57:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47937
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8PWd-0004xs-JR
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597849034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2KNf8i6p6+YyfSipFc3GNX35uQHZV1i6ZKRC7a70Mg=;
 b=bDBjkpChHlrFT6KWsqU9mA86y1ictaayFa1V0kaaf6NR4ER9jaAroU5O5SfYgdOuA4HiZZ
 l820ynYepZurETLUWBAuqGt1S/BTAVGZw7Oj8jEs8lcOOYCaPGtlgk8j6oO9T9PZC4Vp96
 LcN47D3upNBYXpGhWiVtyw3cQmRCcfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-NbCnmGSrPiOEBm-jmg6Zow-1; Wed, 19 Aug 2020 10:57:11 -0400
X-MC-Unique: NbCnmGSrPiOEBm-jmg6Zow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 899831009BA4;
 Wed, 19 Aug 2020 14:57:10 +0000 (UTC)
Received: from localhost (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F7995C716;
 Wed, 19 Aug 2020 14:57:09 +0000 (UTC)
Date: Wed, 19 Aug 2020 15:57:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 07/12] block: introduce preallocate filter
Message-ID: <20200819145708.GH366841@stefanha-x1.localdomain>
References: <20200817091553.283155-1-vsementsov@virtuozzo.com>
 <20200817091553.283155-8-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20200817091553.283155-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G44BJl3Aq1QbV/QL"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 04:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--G44BJl3Aq1QbV/QL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 17, 2020 at 12:15:48PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index b052a6d14e..5bfa4f4116 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -952,3 +952,29 @@ on host and see if there are locks held by the QEMU process on the image file.
>  More than one byte could be locked by the QEMU instance, each byte of which
>  reflects a particular permission that is acquired or protected by the running
>  block driver.
> +
> +Filter drivers
> +~~~~~~~~~~~~~~
> +
> +Qemu supports several filter drivers, which doesn't store any data, but do some

s/Qemu/QEMU/

s/doesn't/don't/

> +typedef struct BDRVPreallocateState {
> +    int64_t prealloc_size;
> +    int64_t prealloc_align;
> +
> +    /*
> +     * Filter is started as not-active, so it doesn't do any preallocations nor
> +     * requires BLK_PERM_RESIZE on its child. This is needed to create filter
> +     * above another node-child and than do bdrv_replace_node to insert the

s/than/then/

> +     * filter.
> +     *
> +     * Filter becomes active the first time it detect that its parents has

s/detect/detects/
s/has/have/

--G44BJl3Aq1QbV/QL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl89PcQACgkQnKSrs4Gr
c8iMLAf+P1iM1FkheLfcS36PYo/ZzJIqUJmwDOl/vkNWUc0aIdjZ7L3NsU7QF6As
f/FufRh4miIgvbpt4PgDQ6bwpjtY3wqeC1zwF4Hpn4dPzvuQiDaQZX7imevKD2c5
krHqQKtThPCLL9AEzi7rP+FzciUsDatpCvhOkXTu0sPhmJmydZWNw2qhxU3zCFir
7PTO+c53mC4VEFLoSHAWYWT6QVWglOIKQXYB72yTlQshtmjD32JcKX9NteZ0Ax1j
xUlo2ANef17CBzk1tmtJZlRRV7Z+kSFBXaRq8R/kNLUmEjfiZjv6T65/EBc9rZB/
MOIGPyEW7b8IvmlK3/5ZP6iy/fgdVw==
=USL0
-----END PGP SIGNATURE-----

--G44BJl3Aq1QbV/QL--


