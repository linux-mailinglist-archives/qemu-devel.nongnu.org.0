Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE6F275D69
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 18:29:13 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL7do-0007fm-DE
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 12:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kL7U5-0004pX-31
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 12:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kL7U3-00085P-FR
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 12:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600877942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L/4652nGhVSUlXTkkZwjnkIh9wEGtjKBtHuHZklE5t8=;
 b=OuxWP2yWVkj9WYg9lq5XMqKfCJmdUdh5YtO0ZZXcTfDnMKK4GNgQ8OmtHvogjWhbjgCepT
 Oaa12jkzwAzqGIMGdtZpv9qCuOBFyz66unHEUG4KQjusrnYTGe+Kb0TOKKpodF0PocHc3w
 QAC2ZHiSj3CQ1sZ0H1Xdrva1UkxiSYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-68NzTkd3MqG0yGKu4Sqs-A-1; Wed, 23 Sep 2020 12:19:00 -0400
X-MC-Unique: 68NzTkd3MqG0yGKu4Sqs-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D42C18B9F28;
 Wed, 23 Sep 2020 16:18:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F5B378823;
 Wed, 23 Sep 2020 16:18:58 +0000 (UTC)
Date: Wed, 23 Sep 2020 12:18:56 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 12/38] qapi/common.py: check with pylint
Message-ID: <20200923161856.GL191229@localhost.localdomain>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-13-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922210101.4081073-13-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WkHPBKJ2pKcVUM5H"
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

--WkHPBKJ2pKcVUM5H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 05:00:35PM -0400, John Snow wrote:
> Remove qapi/common.py from the pylintrc ignore list.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>

   $ pylint scripts/qapi/ --rcfile=3Dscripts/qapi/pylintrc

   --------------------------------------------------------------------
   Your code has been rated at 10.00/10 (previous run: 10.00/10, +0.00)

I still think we should record (and maybe I'm missing it) the pylint
version used though.  Anyway:

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--WkHPBKJ2pKcVUM5H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl9rdXAACgkQZX6NM6Xy
CfMoZA//TdePJ/HFV5yOl1B1CcQ7yjinxwU9WnUIJk3STq8VtsSTaYhuWmlfpVMo
WhxCl+J3bVcgxzuOXDRNnsbaJN1f30xAeYtJYyYm8whRRlLFKgJKLFPTgxOJ74Ul
qnQCmrOStlXmGw5eAXCSRo6PW5xSwjrmjw4RoVbdsYlYma1HAieTu6/FJ/SCqBC0
VoYYnT6cXX02pAbq+X0N9FkRfLhTCjuj2sBxPTKoCmEKqNCiILQMkGgjpXTfMOYs
xCZJyfuBPtkAcoRTdRH2k6nXiC05Hdr6CiYwHCG91c8TtbGLaneTrvLCM+zaod3y
5+BZNJCsYZQKQFmiZELnjmX5N7U+Bm1Md9g0GXvsfw8kb8sEJhf3Va9NQiOAdFVu
CXkQlNUdffU6yx9BGVU03lUsZCPGdGim2o4VJUJMTZuobqm21/FXeXa0Oc7xTPAX
xWaDJwl9qXCUCU3jb34JIGCdsh3BMmZIS+B6X7iJjBKW/HRRQTKD8qhlVJ76A+fS
F+r8JsobMSoEiYWRubmUqeUa269vtOSKjt9QsxlWGUi0v4aV7OAJD4VS10o/VUwq
fhKgKplIBpsaJL7A+ZpY89Hcui8OwLUA+ixC9XcDYXSNfxePK08pSW45xpPUi/dk
X68EUktXSRiv3kzX7bmzqr8ikjZBLxoFg6Z1JQEyWFfSRPgjH2w=
=n70g
-----END PGP SIGNATURE-----

--WkHPBKJ2pKcVUM5H--


