Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBAB6F32AD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:16:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVFV-0000nE-RO; Mon, 01 May 2023 11:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVFK-0000mr-MP
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:15:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVFI-0002hx-DU
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682954114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iw36/HHOkavxwjRf6SJjOY2TUtGLBOQYqDHMeMyVbas=;
 b=MvopK2tgOOJLXKV0ux1HDysTQA7pYwTVHfKfiteq++TbY5SHlzRnqNK7jietlifCpR5Q65
 Lq6Th7Hd6V8OWPuRW/mav/8IIm81P6BYICrrTutYgbm5LmMIPdtPQAXzJzDIVWB/F9WNCa
 RxicYY7e2yhAqSx7G3FCXDXBu8cAtDg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-1ZIhIugPO5S1XLkU4dZUqA-1; Mon, 01 May 2023 11:15:05 -0400
X-MC-Unique: 1ZIhIugPO5S1XLkU4dZUqA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A94CA0F393
 for <qemu-devel@nongnu.org>; Mon,  1 May 2023 15:14:51 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CADA492C13;
 Mon,  1 May 2023 15:14:50 +0000 (UTC)
Date: Mon, 1 May 2023 11:14:48 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] test-aio-multithread: simplify test_multi_co_schedule
Message-ID: <20230501151448.GB14869@fedora>
References: <20230428111941.149568-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QltaGwwy6HL9dE6e"
Content-Disposition: inline
In-Reply-To: <20230428111941.149568-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--QltaGwwy6HL9dE6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 01:19:41PM +0200, Paolo Bonzini wrote:
> Instead of using qatomic_mb_{read,set} mindlessly, just use a per-corouti=
ne
> flag that requires no synchronization.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/unit/test-aio-multithread.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--QltaGwwy6HL9dE6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRP12gACgkQnKSrs4Gr
c8jc1Qf/TfkYhIZqbkl6ry/PM/u7i7aFonmn3DRK+Qk730Vpg5ln/Ee6GR3GpKQa
+iJ4tkosbCspjawDLtzfg4rQgvn/JURh5AZCEYog/Snp4f5qkfXCKBmmnOhSnBC8
T5AuTkZOGmuezDIStUGKTJxLdNXyjcGl206pebARPcYvERUJ38uc5lXQkHkGkoee
UbFThcdR/NRKjspGex/SDf+7z0I2XFv2nRkTsrA+qcLKn3EnuEf6c9ztzuWC8pTf
8L0FkJqEfFx5HbRrp7/LPL75xx03vzC47msZ03DUbHp8BUbO5o3GpzmmBSX6CC+s
UwkPQWp9g52kR5rsoNBKLy833jLnXw==
=vJl3
-----END PGP SIGNATURE-----

--QltaGwwy6HL9dE6e--


