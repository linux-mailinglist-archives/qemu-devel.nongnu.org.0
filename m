Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D696629D85B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 23:31:41 +0100 (CET)
Received: from localhost ([::1]:33222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXtym-0000KB-FC
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 18:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kXtxD-00088s-OZ
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 18:30:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kXtxB-00011P-83
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 18:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603924200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vXu8uWfG3j/iWxrvG6jHNbk329pWpt88M97mmF5sL2E=;
 b=L+KcTfY+anDzBDGaIjSZ2i5v1XvyPlk7iqfz6G9QSrF6nEqCs2U4syk+cCW7sAjGZ0yOY6
 mBca319jmyLQ4a1iK694oCEgAphzCq9ZrIe+U79nL/X/x2ao5LhJxXETpyfbq2HFYHFnoa
 LiWZPRvaiCqpNy+0tbTu+MBp3qpZc/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-Om5BNj7YMOe5b483GeD6rQ-1; Wed, 28 Oct 2020 18:29:55 -0400
X-MC-Unique: Om5BNj7YMOe5b483GeD6rQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6EBB188C127;
 Wed, 28 Oct 2020 22:29:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 000AE5B4B2;
 Wed, 28 Oct 2020 22:29:48 +0000 (UTC)
Date: Wed, 28 Oct 2020 18:29:47 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 07/15] python: move pylintrc into setup.cfg
Message-ID: <20201028222947.GK2201333@localhost.localdomain>
References: <20201020193555.1493936-1-jsnow@redhat.com>
 <20201020193555.1493936-8-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201020193555.1493936-8-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ah40dssYA/cDqAW1"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ben Widawsky <ben@bwidawsk.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Rohit Shinde <rohit.shinde12194@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Ah40dssYA/cDqAW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2020 at 03:35:47PM -0400, John Snow wrote:
> Delete the empty settings now that it's sharing a home with settings for
> other tools.
>=20
> pylint can now be run from this folder as "pylint qemu".
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--Ah40dssYA/cDqAW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl+Z8NsACgkQZX6NM6Xy
CfMgqA//UbczR5AQoM9U82Kqg3sx+fPYP3yQJUrMrdg/pZJ9Z0pTSMa/x2pQrdvi
0xnISLVHevgFakrjM5gpsJbtiYYknR+vWR8pYUHHhvYJzXRuiMjL+RWDSr18Y4uR
yITET+hUpUGc5lPwI7k91eYPXHTY0YnmOAtrGiooZnAJbdSCH2zqmhCEdCFgq6P7
NijhQC7n7Gc671LX3cx+OQmN/bIfDGqacM4ADXIy9Ytpy4qvKTDyqXi2fasLcDPs
/SAqegKLW61G2lxyhnhWgCEUrUvGCgz3Z5/CFEZqkeQgJSrdRoyyS1ChAkhxM9n/
JKszrOIiAgg2V2ninqt6Bn9Y40nTgmB4sf/xNtSveNmQ/1fXwM8JB9Vcyj1kb1bd
CmGuxIrm31WUKKvF5LFTqIQNv+UH0A069SKB3pzir0c4RI6GiWlRcN/VqxfJjpmX
57SuJkoqO8H/xpfG72z0Vq0p+K9L3HjglGbI6gF/bzzhw3eEp9DfyP7Gs6FAuX52
zx56o2KANOY5wjB/FgIZhjlNMZPTe4UPgdQVMfjB4BsSsY06FDYW5cawZcbco2zu
msIfxcc1K3bfBPyHzQTI5KZ6v6iWdTWbTd7VH8u3ax0/xUFP6T/uMgbaKlWoxAJD
HHUGWKxCIZ7VH4BeLR+PTQai6iR0LiOnGhXT82IyAZ5H2+JyQ5Y=
=PUtV
-----END PGP SIGNATURE-----

--Ah40dssYA/cDqAW1--


