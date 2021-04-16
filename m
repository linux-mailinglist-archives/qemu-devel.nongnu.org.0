Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F503625AF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:32:10 +0200 (CEST)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXRO5-0006MV-Fs
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRJB-0000mm-Dn
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:27:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRJ9-0000g4-TR
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618590422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rBTrWV/HBjKeFXu3U37Ev7bEBFR9yDZsAqACV5LAR5I=;
 b=RCJ0NViJctyB8HOtm+jMtpwbOcX6WRFGogULMVmIuzT5iF/ozrnc85WI4ZW4bdaPz7J6Hp
 sblgGmzZtjiMCYYw9Hb09GbGAE/F0ffrD4lnIudgzIwXbhS25Q1i4id/PkffwDOwqIpHFg
 rCWxRYiPQdMxc6Jqfx3CwFx2kbmJeoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-o5TU8qLGO9CP9sE8-btJJQ-1; Fri, 16 Apr 2021 12:26:59 -0400
X-MC-Unique: o5TU8qLGO9CP9sE8-btJJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4806CC623;
 Fri, 16 Apr 2021 16:26:57 +0000 (UTC)
Received: from localhost (ovpn-116-207.rdu2.redhat.com [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 341932619A;
 Fri, 16 Apr 2021 16:26:48 +0000 (UTC)
Date: Fri, 16 Apr 2021 11:43:56 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/8] tests/acceptance/linux_ssh_mips_malta.py: drop
 identical setUp
Message-ID: <20210416154356.GB1914548@amachine.somewhere>
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-4-crosa@redhat.com>
 <229a10ef-b912-2191-c670-a2c74a0870a4@amsat.org>
MIME-Version: 1.0
In-Reply-To: <229a10ef-b912-2191-c670-a2c74a0870a4@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 07:26:05AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 4/15/21 11:51 PM, Cleber Rosa wrote:
> > These tests' setUp do not do anything beyong what their base class do.
> > And while they do decorate the setUp() we can decorate the classes
> > instead, so no functionality is lost here.
>=20
> This is what I did first when adding this test, but it was not working,
> so I had to duplicate it to each method. Did something change so now
> this is possible?
>

It did, but quite a while ago:

  https://avocado-framework.readthedocs.io/en/87.0/releases/76_0.html#users=
-test-writers

It could have been updated much earlier, but, better late than never.

Cheers,
- Cleber.

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmB5sLwACgkQZX6NM6Xy
CfO6lA//VZYEHUfyZEAbvwODFwGSRSeUVu3O69W33tD1Qt53nJYk0jdJqcNt6tQp
2eMb6rJ/sKV9GN+kN7vwKjGByJ6DT2w4ouIEobqRL3Al39jAMUMW0Fy+0CWqjS7Y
DaZX2E7zExpUTD/uiZkACAP2AFd4CVclTo9/S4EjKLLEPgcCBW9ciDdF7Z+6jDYj
gTGc1bUmxcjMpvYfPYhCHNgu7yi+vbp/9+IqKwyT3DkB9QM3y0VlqwFvwFVFovwN
UX3ff95MJCo3LBHFFL6+ZWxrk6mnMQHAUek5cHh+2WxBfKbKRz9v2nb0bDonFfZh
+AM/e0VBAPaZMCGSQLXV0eLMkXYS2yMJ3d2xMscFezCPpCODZll7rUHu3KGizmeX
U825Wyl2Aonqe6DVweEar1EHPNiuWwzMiaNqkry5srvKznflIqhqPb5+kCrvFAw9
q+Nd0AR6beWXfkf9DJ0/8KyWhpNNo7CEL5EOsuD9Mw+cqECbxlIIMEGrntghkhF8
0mXBtbrG6WPU+WBqhB7aqa/tKVJhIEJHTBjJFGb8+CESLOPGgvw4ooWv/khN2WnS
yqQk7GqIW5pxDfK80dqnsyPRLIHmsQM7Cl6DAmC+luimxkdEw0b/YMAy9hHBw794
LZIv0d8njr7lAm1PgeH+jfIjlelUm+ulxvEw/n3mGcdObAAbKac=
=htKo
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--


