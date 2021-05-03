Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15BB3715C5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:11:40 +0200 (CEST)
Received: from localhost ([::1]:40260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYMN-0000Le-Lx
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1ldY6l-0003LJ-RS
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:55:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1ldY6i-000615-MP
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620046525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4nQsapsBpXSSymKszRfN2S8SWE1IkxN3X9xZbH+ZQGw=;
 b=WbY8Lnrmy8ASuMPXeFTZCAfwiwSjsmx0i1jEsBwix55XGatDYB3qxkoqAiiVOjqvAZgwyv
 bZSzmbY2E7d66bFeKEyjThfzfydeJH6MoE30c+vZAI4BqjwUl1z68JG0ECCdonO9n64dpd
 B/TYJgABgOaQC4dhejKa1apqhOUQQsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-mMx_TZnsNk6jlIUyZXAD8g-1; Mon, 03 May 2021 08:54:16 -0400
X-MC-Unique: mMx_TZnsNk6jlIUyZXAD8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E10218B63FF;
 Mon,  3 May 2021 12:54:15 +0000 (UTC)
Received: from lpt (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D1E1B5C3;
 Mon,  3 May 2021 12:54:08 +0000 (UTC)
Date: Mon, 3 May 2021 14:54:05 +0200
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
Message-ID: <YI/ybV9NhvWWlZXn@lpt>
References: <20210503105747.703149-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210503105747.703149-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jtomko@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/0PqKeDb6AHPxb6G"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jtomko@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 03 May 2021 09:08:57 -0400
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/0PqKeDb6AHPxb6G
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Monday in 2021, Philippe Mathieu-Daud=E9 wrote:
>Remove the raspi2/raspi3 machine aliases,
>deprecated since commit 155e1c82ed0.
>
>Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>---
> docs/system/deprecated.rst       | 7 -------
> docs/system/removed-features.rst | 7 +++++++
> hw/arm/raspi.c                   | 2 --
> 3 files changed, 7 insertions(+), 9 deletions(-)
>

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--/0PqKeDb6AHPxb6G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE7DTm0WabvfIr7YZ4Ak1z5KIMl5QFAmCP8mUACgkQAk1z5KIM
l5Qgtwf/UaEGRx2c2+y0uNY6HpM2lWPzPr7r+vaIiuuvo/ULeE9sCYEVYwJW4oua
Vp7xVqKbcRNex4p/V/VNdVHkpaWtp6wJnOWLiH8ioT8sTHM/fnYe4aFocnl7uXsw
eoGSkgFbQFyoVQgonTSA11M1ulPpJOGV8mwwWyFqxvSLiFqM9AYVFeeQiTphMNYr
HmdDA1SfizZT4G3064WF5ti0oX1jXikyqcjv8zcp1h75AlN4RtiCz+O9oc25/pdz
06+oD9eWAW5iKL0BFrtxTZ5V1a0VbK8e23y+6+DxoYCDI4AGyL/uF8hDiVELMLPe
qySwS5/E4FuXM7ToVOQrmUpvyRjXxg==
=7zim
-----END PGP SIGNATURE-----

--/0PqKeDb6AHPxb6G--


