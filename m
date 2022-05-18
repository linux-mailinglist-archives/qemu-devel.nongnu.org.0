Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A744B52BBAB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 16:00:01 +0200 (CEST)
Received: from localhost ([::1]:35720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrKDY-0000gX-IR
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 10:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrK5N-0007lO-OK
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrK5K-0006b1-AU
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652881888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zo2fPVdDg17Cfi9kxcDhBzqWD/j+16U7AZmZdwrp45w=;
 b=TnRijvBFR5QWm9Vte6VYoAFt4vh/NDuPv2lb/cSDhldUmGDXU5nW5U5F3+XkeqHwXxb8Zb
 W/NfgBJxkiPkowUNWOwG3i4QhKqAjPOboQ3Jw3QVo7OaDRXP7a2ZCqB/oVproMK1FnpCMF
 VKPp8tv4ekSrIpDXFuv/oKlyZ1plxYw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-uimVPuPeOUyqcPNdnXaVcw-1; Wed, 18 May 2022 09:51:24 -0400
X-MC-Unique: uimVPuPeOUyqcPNdnXaVcw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C1CA185A7B2;
 Wed, 18 May 2022 13:51:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD29940CFD00;
 Wed, 18 May 2022 13:51:23 +0000 (UTC)
Date: Wed, 18 May 2022 14:51:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 7/8] vduse-blk: Add vduse-blk resize support
Message-ID: <YoT52tPPVoWfeKwG@stefanha-x1.localdomain>
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-8-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yfqgBy7XLWJP8tlv"
Content-Disposition: inline
In-Reply-To: <20220504074051.90-8-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


--yfqgBy7XLWJP8tlv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 03:40:50PM +0800, Xie Yongji wrote:
> To support block resize, this uses vduse_dev_update_config()
> to update the capacity field in configuration space and inject
> config interrupt on the block resize callback.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/export/vduse-blk.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--yfqgBy7XLWJP8tlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKE+doACgkQnKSrs4Gr
c8h9Sgf8COeMhF7u33x8gQFpSjbbYmuIflui/j0Htki4lC9rEDn8qdv3+TlpzL5e
A22UarY9z3zcUWhdhm8QdEdukpPOzVBiGZ5McEF6Gz0m97DhQXwZqsxLjVbi9cYl
HnXzEBhYAFgHU08Jk+8wNWQu5PY7pozfInXGy66rgvYScDMhoREFyGfyd7uEeIrZ
tURA4EYK7OH/illDAtgEtQYrgNM/RyI6jI7AotMt1l8nbYPkfHSovb9CcpfDrKo8
VK5Xxux++YQRWAbsFhAk/tLRfmyeMK+ZCq1tpaeDBvevvgbuPKWTPKRNQ97UgxXN
DK7tTKITtdJjnOUQF/w4GfSoJZB53g==
=0hb1
-----END PGP SIGNATURE-----

--yfqgBy7XLWJP8tlv--


