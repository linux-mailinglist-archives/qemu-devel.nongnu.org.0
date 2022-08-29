Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB255A5467
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 21:20:07 +0200 (CEST)
Received: from localhost ([::1]:34240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSkIm-0002vu-4i
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 15:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oSkGB-0000dI-Az
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 15:17:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oSkG7-0005en-NI
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 15:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661800638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=muBIu+SHyI6qh5FLp+1tMxYY06RxOiATN0KEkApvYU4=;
 b=JgBX5htVYIJlpMEoIsHL1xFyR77THDBfxYphyytZBB+swtOBhhz/3LnovpvUjyo7xHpvLB
 JLvyEOMChVHRvrk2ygpMOVHHKtNbbRmtTT2M0bH1QmTyclmU6z3qkjvATV5m1P8qOTqe8y
 AfRGqwscLS3ArHLZETqqdQnAtN9cIRQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-0HBavWecOKWM04ugL3T2GA-1; Mon, 29 Aug 2022 15:17:13 -0400
X-MC-Unique: 0HBavWecOKWM04ugL3T2GA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ABBE3801F4D;
 Mon, 29 Aug 2022 19:17:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5328C492C3B;
 Mon, 29 Aug 2022 19:17:12 +0000 (UTC)
Date: Mon, 29 Aug 2022 15:17:10 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com,
 Dmitry.Fomichev@wdc.com, hare@suse.de, qemu-block@nongnu.org,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 fam@euphon.net, kwolf@redhat.com
Subject: Re: [PATCH v8 2/7] file-posix: introduce helper funcations for sysfs
 attributes
Message-ID: <Yw0QttDY+9xJhOd3@fedora>
References: <20220826161121.7691-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6Rkj3fI3YbWcT7HJ"
Content-Disposition: inline
In-Reply-To: <20220826161121.7691-1-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--6Rkj3fI3YbWcT7HJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 27, 2022 at 12:11:21AM +0800, Sam Li wrote:

If you send another revision please fix the "funcations" typo in the
commit message.

--6Rkj3fI3YbWcT7HJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMNELYACgkQnKSrs4Gr
c8hL2wgAqh8WLcTCWYE1/RZzASv5M0vIWaxQBfyPftQHB3JfR/oaKuEYsf8E1JF6
qlPy2QSKTtA9dX8LZoTG7nKuUF7vwPi8P0AcoW1HX2ItjhwN7QDDAO4w6EnCUExZ
YnX40CM0CaYDl5rWxsjOILXlggUgx2QFLURQO9iBujWBGIQvXdl95tcfNkNyIK3R
FgWcughPAfljrr/0EyrvhhM4M1W83frch5yRyEcJqbt8AEWFrjaSa0OIBoL9vRMf
THzBSAYgAdymVEj/BbjQg/U5WAAVC26PIY6I2XtdMnIUTkYAW6p9SAGU6g052Kuw
bAwtVnkRBP8pa6SdOQ+yqgL1/a3CbQ==
=4/sx
-----END PGP SIGNATURE-----

--6Rkj3fI3YbWcT7HJ--


