Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7622800A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 14:36:08 +0200 (CEST)
Received: from localhost ([::1]:60064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxrV9-0004uf-EO
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 08:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jxrTC-0001jS-Rx
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 08:34:07 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49270
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jxrTA-0003do-De
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 08:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595334841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EtLAg+K0EQAaXJU2A2eT3o6MgPDgfEZvZT/8IO6y8ZU=;
 b=GopUIbQLR/BEsV3/BNpK+ERh+Iw4tfPpijKWMId4C5rUl1juwVih/YwK4OeHYomHkAqIS9
 jZDdJREMmvS/q9KXBMw2kOteoPf+OQYi0kVkdFsNn3rBfmIcSVaBOse0epQm6mk90v2ae5
 WQnM686eVSfV9Ym9hhtvqYEWsP6B768=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-oAEtMT3XPTOaEaiVhAtXFw-1; Tue, 21 Jul 2020 08:33:58 -0400
X-MC-Unique: oAEtMT3XPTOaEaiVhAtXFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6E0C58;
 Tue, 21 Jul 2020 12:33:57 +0000 (UTC)
Received: from localhost (ovpn-114-133.ams2.redhat.com [10.36.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C2DD1002397;
 Tue, 21 Jul 2020 12:33:57 +0000 (UTC)
Date: Tue, 21 Jul 2020 13:33:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH v2 1/4] scripts/tracetool: Fix dtrace generation for macOS
Message-ID: <20200721123356.GB183198@stefanha-x1.localdomain>
References: <20200717093517.73397-1-r.bolshakov@yadro.com>
 <20200717093517.73397-2-r.bolshakov@yadro.com>
MIME-Version: 1.0
In-Reply-To: <20200717093517.73397-2-r.bolshakov@yadro.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 01:26:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 12:35:14PM +0300, Roman Bolshakov wrote:
> dtrace USDT is fully supported since OS X 10.6. There are a few
> peculiarities compared to other dtrace flavors.
>=20
> 1. It doesn't accept empty files.
> 2. It doesn't recognize bool type but accepts C99 _Bool.
> 3. It converts int8_t * in probe points to char * in
>    header files and introduces [-Wpointer-sign] warning.
>=20
> Cc: Cameron Esfahani <dirty@apple.com>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  scripts/tracetool/format/d.py | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8W4LQACgkQnKSrs4Gr
c8hZLggApFqzsbxaMChhgN8uaT/DjpZ3by2I3QhjX64k0h+QM3s8b6B1+uW+5Z0d
Vm6OT8/FqSKKde9FiK9msBMtu8aQH8Y1IGjI0Ms3oKAvsYC0Cr3Sr7i9DFJgb+AE
gejXMB/YoWhKEt+C5nmq6+AZHAiVJVnoRe332Wf9arRV938vmS5Z351lFbI7y2R1
GebIrY7kBGod1A3aP0H70wmpGRSfjDznXQQqpPaW+D6M9hDVNXdaO+c0SSbC18Aq
tsFoQYhCgLAQjenP8mRfQdl5JuVmHjrD1n+NGuCqn65KuLyaSYaZifTljZoGqwUG
Ho46itdpkIJISy0CbWeiGVng6rX41w==
=TOq5
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--


