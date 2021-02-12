Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D217D319953
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 05:49:14 +0100 (CET)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAQOH-0006P8-Cb
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 23:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAQNG-0005uo-Sf
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 23:48:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAQND-0003O0-Rr
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 23:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613105286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YQGT9JsWLMaQ9l0epNqN34mB9a/NiBl5WtJvHUyN+Xk=;
 b=E7JHXbudIqD0golcLAtSBWOI3NQlhJniaJDjBWsy6UraZ2DBU9EQxewZqpcGg5zA6HAlhj
 TYtC+NK8Ddyb2EVlBsuWfcP54Yjl/bGuDUmCiGYxYkOQIAx3cn+1futASFE8h4t85aCnW1
 2MV+qid2ZD9IbJocI7duSBL3Pyheg24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-7CdmMVI8OpG-cpa-9YmJuQ-1; Thu, 11 Feb 2021 23:48:02 -0500
X-MC-Unique: 7CdmMVI8OpG-cpa-9YmJuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9ABA1005501;
 Fri, 12 Feb 2021 04:48:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-146.rdu2.redhat.com
 [10.10.112.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B624260BF1;
 Fri, 12 Feb 2021 04:47:54 +0000 (UTC)
Date: Thu, 11 Feb 2021 23:47:52 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 01/24] python/console_socket: avoid one-letter variable
Message-ID: <YCYIeGvFwiQHkVHV@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-2-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oId+JFMv/GMK9HQv"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--oId+JFMv/GMK9HQv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:33PM -0500, John Snow wrote:
> Fixes pylint warnings.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/console_socket.py | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--oId+JFMv/GMK9HQv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAmCHUACgkQZX6NM6Xy
CfM2pxAAliAUV/pL/Mo7AdPsjhfZIRCLub7/wEL2e7bDAgltvh/T2bvL3VAHMBuH
+AqTo/IeoTHkc5En2xmBdEVzdGe8Ir6rMg1jufaQxiJXmg3WEPCVJvN5TFzMJdoO
elQze2vLBZ3LYQ3xGclTMCTqsgMawpRpPHw7X0HQSgUs9m+4fiZ/iqTjq3IcuAg1
BE6hq9VWcB/KnSdkcK4n7D9kpSw8+VQL2PSGF9fZ/DxEyK+0zxGr9no5VCuvOssV
itMA1/0M3/+9lEHWSpPkCwoSLShCPPmm9blC4ME5L+HR/4mCRoR+zuNtuUUNHTTu
ItaQEGOgbSFEhRlMh7nHBQdwv9K+AIxeURZCmiSBOfhJ2caGFDq9/yEyqK9dWt2Z
8ryCMkSgWZRXoU7i2bYhFUevI2MuKUKbu/lLcaGIpmKnpudj8S6XYgY5dR3h4K4P
k2HRUfAL2ZtKEiaXWUJCrvNv7bEQ+ZYY3qfsK971bM5yqGZIXs47BGO3+27Ni+NR
AKgnyRtEjtmnNkyF/bfsebdfy2oqHUgkvEi5JH+vWiVz+usquVIPXw6AECjyhmVl
fVQkqRqklpkVMV1yGhIAALCJrBpPv+VRIAH/pGI+ePaMN7uQrVerSq6gu4+mynov
2HJdYUq3xh/lSNhRMT9vglrknu434XzYY+n+lDiRxwd/ulDnxl4=
=2LMa
-----END PGP SIGNATURE-----

--oId+JFMv/GMK9HQv--


