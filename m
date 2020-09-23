Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C9D2761F2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 22:22:35 +0200 (CEST)
Received: from localhost ([::1]:40830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLBHe-0002MX-Ih
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 16:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kLBGL-0001GH-Vy
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 16:21:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kLBGK-0005uL-4D
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 16:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600892471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UATYJiv1u1A3qAnHW1JL3aiJ1xJ/Doe1puarUlIqFbQ=;
 b=UzGdLx89YJTRBitFXd0P8PH0LdyIB5f6tsjCC41bDaLQrsj+RicxPsj7okPPsZ8bUFwVQZ
 NSJl6+frfu/D9DjeARR+7tVlOpX9KtNOJhCID9n5O30HyhGytMfbupoVmk9QVH/TCy9e4L
 4jsOEidIYRLLqH79B+DgytQ4/zjnJII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-qrSTF8YoNUeDlQMpaFad6w-1; Wed, 23 Sep 2020 16:21:06 -0400
X-MC-Unique: qrSTF8YoNUeDlQMpaFad6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA3F7801AF7;
 Wed, 23 Sep 2020 20:21:05 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05C35702E7;
 Wed, 23 Sep 2020 20:21:04 +0000 (UTC)
Date: Wed, 23 Sep 2020 16:21:03 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 19/38] qapi/commands.py: Don't re-bind to variable of
 different type
Message-ID: <20200923202103.GS191229@localhost.localdomain>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-20-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922210101.4081073-20-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l4+/aJnPlhOv5JVj"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--l4+/aJnPlhOv5JVj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 05:00:42PM -0400, John Snow wrote:
> Mypy isn't a fan of rebinding a variable with a new data type.
> It's easy enough to avoid.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--l4+/aJnPlhOv5JVj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl9rri8ACgkQZX6NM6Xy
CfPC7g//YCgT56+h9XF/zqjTkMBOaxVCS8TA7bAS90JKk9ta6+EKwQQn4qQxwp78
shktkQIgtApdvOVdHKkQ28YXZnBVOkaJfBR0F6EeD3xpmqim2lA9qbT1V8HHyvb6
LW31POdho0LaJqOVbcaaj/stmJGDokqntvaTfoz2ZUkyHKelMKgUR9YL5EhQIoFt
uuaOkZRRNQkDnZI1uMR/KopayuEolpLt4ByAcANFl44VTNO1P7T10BpqzOmFG+ZY
jBddsxAFSBsoBbpOr43FFK7z15Cjs+pe9eHJGZ4IpM7CiM8XjO+wpfuYaICl4/v5
qk+6xCRLXXctzaXZ2mYc7ilOPAcyA4PU4EWIhx9vfAFZbfecko5Kf2PhhIH9t7oq
bWsQKGiLSG48ERMXRxWVH4fQCcsG0kXx45xpyqiSAGPiLsQfGi8VwZoX/PaNpGkH
zbR6JdglzePCMqoMsoUGKpMlFCdBPhSgz1ZHXEOlrp2yfRMtE1F8tchjS1s/5vQJ
TXytrRPDOqupBK/qsQRRn5nfWiWkfvQiVfegxRAMnl/o0SIYTRPaf+O6cKWmBjY1
YEFSzhKsrvQBojZgcl8fdoSjwVHpjKdhlJVTcutzZYIh6NK4Hs1f9Nnd52PCRteS
975EXa8WTQtj7wVWS/Q+0KtuZ/sxjhor3kIjfSWpGgTJToxizK0=
=PIRP
-----END PGP SIGNATURE-----

--l4+/aJnPlhOv5JVj--


