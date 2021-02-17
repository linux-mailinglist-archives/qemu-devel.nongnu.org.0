Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65FB31D4AF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 05:45:31 +0100 (CET)
Received: from localhost ([::1]:56144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCEiQ-0002ev-Rz
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 23:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEhd-0002AA-L9
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:44:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEhc-00057E-8v
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613537079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eAjz7C79bQ1UeftK4QBRhnaRrMtCiO/3xVwHxOv7mXM=;
 b=V7zzERtvVG+6lltqcF1+CIvQ3AngaHOWCDW+RSHEbHF0a2rJGEIQx95qkI9WUFQMe+GN/0
 OA/tKXeDtad7V8miRT1XI2jTIpfncBEL7xjcsOZB+YLJJ6pWtFXkhGj2GaWSdt+dOJixJG
 ghE1qDh/ZvS+3bBDEOlv4exn2vpKUmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-F1cAYJxCMHC73IbgLFlvIw-1; Tue, 16 Feb 2021 23:44:37 -0500
X-MC-Unique: F1cAYJxCMHC73IbgLFlvIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C614803F47;
 Wed, 17 Feb 2021 04:44:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B49DF5C648;
 Wed, 17 Feb 2021 04:44:31 +0000 (UTC)
Date: Tue, 16 Feb 2021 23:44:29 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 16/24] python: move .isort.cfg into setup.cfg
Message-ID: <YCyfLTRkIB4hEUSU@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-17-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-17-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eK7KRpG5K9ZYl0Ls"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--eK7KRpG5K9ZYl0Ls
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:48PM -0500, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/.isort.cfg | 7 -------
>  python/setup.cfg  | 8 ++++++++
>  2 files changed, 8 insertions(+), 7 deletions(-)
>  delete mode 100644 python/.isort.cfg
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--eK7KRpG5K9ZYl0Ls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsnyoACgkQZX6NM6Xy
CfNjwxAAsZp9bRjtgR1V1yffqZb7HTHlwPf/C4gf195Knr0SYUDpRiei8fOZKHiB
PGUHO4CW9L7tWie1BWm/cFYi5TwExDCgJUctR2uXo/zBNRsuwgC5SfQhtYAHKiTb
XBewhDFU4anBsqQifSaDIrjhTO+SHOxVuu9OKCLygB1+DVTRc9WIX3CltXPjlqM9
D50Wlu19jc+cr8Bp5ay3609EByDVEH58nMizIDzOXHUL1SzbzQztE2+3kBit+w2m
9OK05EpHkyRn5/6sAs3vTbBp5yY2/sEnUnqWWKov+OyFeSnpYKq3Q3H3zQGyVK2h
gdWDY4WpLWBh+LwZBczSpGpGvUJge1RVz6PZyL3X8paTmaKaCuHbG75AEqLVar4p
s36CRCBoJYszrkQxIHQ1l3yzGzFoJOVW8c2yxlmvsX+732mq7OFtjZNDvlrR/uX7
RR+42kyBt/l0GtYVtPQmx+xVoJ87t+g+8z0x/sL7JTtLSlVAnR5Fd+OuKbNMppSm
StF4Ig48ShDk17jZiJAMAI8uxBBMwCfPsHCN5aibRoPxjN0n5v5PZbCpCUMzKIHu
D54o5YoBcx3cqBbWGFMxdCjCdC1+7o0PRscF1dxXZuUZLx7dXgJxf5katJQjqr3W
we/mIUdU9w1GuHZt7COc6/0nreuWAN2rh557J+br8wG7vu16lAk=
=eX3E
-----END PGP SIGNATURE-----

--eK7KRpG5K9ZYl0Ls--


