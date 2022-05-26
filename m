Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1AF534C78
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:24:53 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu9jg-0003fz-8a
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9CO-00011l-Vm
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9CM-0005EB-KM
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653555026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lg1zJSKZ1vJOwMVRhzeW0l68vrkB8F4eH2rPaOdrg+M=;
 b=OzSGLmTEUV7iuZiiH9dRmPvjaXTcFxnj1cEoJvzeHFaxTJrrS5Q5HIjqbzlDLaFjTAapSw
 bq+hUF5f268EZzVYAfp2joUXYgdbNHMjPTjWZ0lgFLuX25wo8ZXsQWGOZt0jQgpVMYnzeB
 8uV/wTOWHn4T71N9ghbACUh1F3TIfz0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-yz1IvLasMzW8dlG5DgFRkA-1; Thu, 26 May 2022 04:50:21 -0400
X-MC-Unique: yz1IvLasMzW8dlG5DgFRkA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9966F3802B89;
 Thu, 26 May 2022 08:50:20 +0000 (UTC)
Received: from localhost (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29B29400F38;
 Thu, 26 May 2022 08:50:19 +0000 (UTC)
Date: Thu, 26 May 2022 09:50:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>,
 Ari Sundholm <ari@tuxera.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 03/10] block: Make bdrv_{pread,pwrite}() return 0 on
 success
Message-ID: <Yo8/Ssojaqjmkv7L@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-4-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BpPccMe1s7yUjsYH"
Content-Disposition: inline
In-Reply-To: <20220519144841.784780-4-afaria@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--BpPccMe1s7yUjsYH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 03:48:33PM +0100, Alberto Faria wrote:
> They currently return the value of their 'bytes' parameter on success.
>=20
> Make them return 0 instead, for consistency with other I/O functions and
> in preparation to implement them using generated_co_wrapper. This also
> makes it clear that short reads/writes are not possible.
>=20
> The few callers that rely on the previous behavior are adjusted
> accordingly by hand.
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/cloop.c                    |  2 +-
>  block/crypto.c                   |  4 ++--

Ah, I see you did the block/crypto.c read_func/write_func conversion in
the next patch. Great!

--BpPccMe1s7yUjsYH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKPP0oACgkQnKSrs4Gr
c8h/vwgArzEufbj/rm7ZxbNFq1wTRVLGMITHrVkNVs2o+oIX3g9HL4XL1qpyaw0u
Dx3qkzPkyhHxWQEhiJiZ2LjT1ST15r3OWkv2Yg6DlQKx/UptQGFLyZggRp38cg1e
jOr5c/nJ9DtUNpaqrlepxioDIYCzJK75wDsTco/NrooGYCxXQUaWGtmJmbW0cDFc
0QPysoDG+p9A4pRmwrB+gb9Jgy/zxq7HZQe59lVN5CD1KUulCGdP9CT+9rN1MJpt
ju7eeqD70wfLQearB3ishy/0CnRvpVvbGsUHPnvET1bEbpQ4cW3CgGA7hxY2a5pU
njXGAACD0hCHwcSKbVVdSE5nhQ7vQQ==
=FyhV
-----END PGP SIGNATURE-----

--BpPccMe1s7yUjsYH--


