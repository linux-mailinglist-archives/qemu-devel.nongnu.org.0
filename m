Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42CF2778BB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 20:52:47 +0200 (CEST)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLWMI-0006yI-GH
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 14:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kLWK0-00068L-GK
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 14:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kLWJw-0001uu-IP
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 14:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600973418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=17GTyx17/bHErAKdzJpdR5WlLJjg8y3M5IV9IVpmNgk=;
 b=ZoJt/4DFE8jtSQ97AvN2ERDO7hP9HCRWTEVaWgVBA0SZstuL6/EDiRJpzxXugOe5uf74yp
 p3bNhGDdfHND8Zquw4ZbC5J51zNnf0Sdh6u01QBViuBCQ6IcGBgo1vyyin+/P7JZjP5FxI
 gop7K0iPkvsiHPfnfcvugFMFfZq738E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-c-BRM6YQM2mDvAvHNuD_Ew-1; Thu, 24 Sep 2020 14:50:16 -0400
X-MC-Unique: c-BRM6YQM2mDvAvHNuD_Ew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5EEF104D3E3;
 Thu, 24 Sep 2020 18:50:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BA165D9D2;
 Thu, 24 Sep 2020 18:50:14 +0000 (UTC)
Date: Thu, 24 Sep 2020 14:50:12 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 34/38] qapi/types.py: add type hint annotations
Message-ID: <20200924185012.GF191229@localhost.localdomain>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-35-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922210101.4081073-35-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4VcSvkf+hAuPXtVJ"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
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

--4VcSvkf+hAuPXtVJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 05:00:57PM -0400, John Snow wrote:
> Annotations do not change runtime behavior.
> This commit *only* adds annotations.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--4VcSvkf+hAuPXtVJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl9s6mIACgkQZX6NM6Xy
CfO4jg//RN47UrvSVgxwtDgR0XHCsywpRpyxDFPHRJ3r3hue5NQyo1vX6Qw1ljJy
uYSAuvuYouBf/WehZDF7AqYzoZQ+PFQ2KL9hUGG4nELzCdZl1ER3/Yj96l9nNKfp
zXGIWVU+XlGrVGG9WUgJpzNaXvhwxZ1x47CpG/dZHFmxx7ZK0dVRdiLQJuFI0kji
wHHKK7Tt0SefTE3jxZXEQNY3A7qBFuVeLCPnktrJ/omB8HXFJXFJb2sWHZaxHkDN
t8B+BI0V6NMYObZrCUT0jhdWswR4aVDqDVMdlsT8X+aSKzrBHVOPuTUJNtAaZBoa
Y05ijBBqcaymEtiwCWSRqyjqAKHjdOyYuDmuFpb3/Ym3k4Z8gtVkAs4jlLYnaySs
CYzULq7Bl6r19+/UsJtRjQ2tb37wmjiTiwcQXkCSPm5rHV9cae27zr1KSkZGtQ6/
xv+qF1KrtubNEcB9wv6f1igFj/yIU4bix/Pm6lpqhmHNtxYJITkZT11q+g8x7yBp
ss66ATmF826QDdYjBZGa3U5gaoh7xCJNsUfSDR7nYmX4atmS8BW9yD9whBI4icrF
bSuYJ3IybnSi6oABcT73sknuzN78yQ6C0jAoRFbwhitxmhP+gG+wix0BkuFqCg1G
S5lnijvlfNb2wMai8hHPhUpkFeTTV4qVw1kT/ZYTaXhOfCwN55k=
=8KHh
-----END PGP SIGNATURE-----

--4VcSvkf+hAuPXtVJ--


