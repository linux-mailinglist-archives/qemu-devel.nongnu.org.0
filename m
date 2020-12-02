Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0DE2CBC42
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:03:51 +0100 (CET)
Received: from localhost ([::1]:43384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQrO-0001fG-3c
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:03:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1kkQoE-0000DF-2n
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:00:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1kkQo8-0006Iz-Eh
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606910427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mEF7S45SD1ZqkT/D5tSwgR98sR2oPa4RgDC/Gc6dntg=;
 b=DULVvg2NhLII3OZ4BVgLpAWfQFJzXwb7ygyySWbwPo9mgBFKen1VHEv8QOvjuwiWgZDQUu
 8twzNSvSzBGGPNd2DkW78orlDpE7vRj+L9x9/n8HknyMa9oWkQQcmzbtssI5GSY2wld0xI
 OG9EJmkRXzsTOuq7vL4LGT5YLTXu82o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-nfVRpG8tPuSPbE-oYpksCg-1; Wed, 02 Dec 2020 07:00:23 -0500
X-MC-Unique: nfVRpG8tPuSPbE-oYpksCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7441C101AFA7;
 Wed,  2 Dec 2020 12:00:22 +0000 (UTC)
Received: from lpt (unknown [10.40.208.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB01610023B0;
 Wed,  2 Dec 2020 12:00:16 +0000 (UTC)
Date: Wed, 2 Dec 2020 13:00:13 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] accel/tcg: Remove deprecated '-tb-size' option
Message-ID: <20201202120013.GD111663@lpt>
References: <20201202112714.1223783-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201202112714.1223783-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jtomko@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jtomko@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vni90+aGYgRvsTuO
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Wednesday in 2020, Philippe Mathieu-Daud=E9 wrote:
>The '-tb-size' option (replaced by '-accel tcg,tb-size') is
>deprecated since 5.0 (commit fe174132478). Remove it.
>
>Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>---
> docs/system/deprecated.rst | 12 +++++-------
> accel/tcg/translate-all.c  |  2 +-
> softmmu/vl.c               |  8 --------
> qemu-options.hx            |  8 --------
> 4 files changed, 6 insertions(+), 24 deletions(-)
>

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE7DTm0WabvfIr7YZ4Ak1z5KIMl5QFAl/Hgc0ACgkQAk1z5KIM
l5Q+dwf9Gr7X1VKb5q73p5n1tghq/xN216npfvcbLHOI681T5Zo/vGJSdETWup+S
OUNH4a42stAbaWgEzw+N5Ki95+Z2E0SEKKI6kPbrgyqrMJsw47k9ZQRN4WpJfgtO
95zWAMefaAOBXkaRrxHjc3tfUvMwAybzHezFN1NnsUYUTaNYIPE0PMuuIO7IJ65s
4nFrbngzX+HR6MVDJq3IfrtzNHHxQt6lpJRMAlbQXlnyr+Cf5/Ne9gQ0nNOHPm9O
YhkV5YLUa8oGJ2lcMGv43BlhahnxwIyFZU9ztlI16n0pXM456iOC1vTVpYvDKhyX
LhhiLXLjoaFjTD44uLBEP10iSzkfQw==
=pRHf
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--


