Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE283B5EA8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:04:53 +0200 (CEST)
Received: from localhost ([::1]:60400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqwW-0001Nx-0c
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lxqtZ-0004zo-OW
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:01:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lxqtV-0004tO-Mv
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624885302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sJyOB8Xti1YMbLJWPfrgk07Z/fC68ZC91OjGZw2EJXQ=;
 b=YiCHVsx098YM7uzAmLpcJ76IKF6Rx8o//MG94Sq9sF8HDH/hSh1f4M9S09m/cGb7rhZBpJ
 iHrsuPWv/M2PlaVAsMuxO4wfC2vefvhUlaKRtei9BGdHf1VvaCs3qF542vLyzlsRdASXwK
 sa4yDJwm5zoxdYiwajGIpZjqnJpUxks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-61pH7_3WNDm2HWxtF8_mjA-1; Mon, 28 Jun 2021 09:01:41 -0400
X-MC-Unique: 61pH7_3WNDm2HWxtF8_mjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CC4C824F87;
 Mon, 28 Jun 2021 13:01:39 +0000 (UTC)
Received: from localhost (ovpn-112-170.ams2.redhat.com [10.36.112.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12E2718AAB;
 Mon, 28 Jun 2021 13:01:31 +0000 (UTC)
Date: Thu, 24 Jun 2021 10:38:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Qiang Liu <cyruscyliu@gmail.com>
Subject: Re: [PATCH v2] hw/audio/sb16: Restrict I/O sampling rate range for
 command 41h/42h
Message-ID: <YNRSgf91M1b3vyH1@stefanha-x1.localdomain>
References: <1624502687-5214-1-git-send-email-cyruscyliu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1624502687-5214-1-git-send-email-cyruscyliu@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gGL87LNFqRbTrChF"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIMWL_WL_HIGH=-0.375, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 f4bug@amsat.org, "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gGL87LNFqRbTrChF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 10:44:47AM +0800, Qiang Liu wrote:
> The I/O sampling rate range is enforced to 5000 to 45000HZ according to
> commit a2cd86a9. Setting I/O sampling rate with command 41h/42h, a guest
> user can break this assumption and trigger an assertion in audio_calloc
> via command 0xd4. This patch restricts the I/O sampling rate range for
> command 41h/42h.
>=20
> Fixes: 85571bc7415 ("audio merge (malc)")
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>  hw/audio/sb16.c              | 31 +++++++++++++++++++------------
>  tests/qtest/fuzz-sb16-test.c | 17 +++++++++++++++++
>  2 files changed, 36 insertions(+), 12 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--gGL87LNFqRbTrChF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDUUoEACgkQnKSrs4Gr
c8grOQgAxYH0lMRdfNv4IeG3enaBeb+6x9WyORfR+ctM3uz76VY3osEn02I1A7sz
AThfwb/hIsrI6976z83CQAfemqbO/B0m1wodgsBWdLfDr7ourzU7yt6go4QADuEY
si4IT3DsELSErwegmg9z/WDvp92X1zlKwfdJaJ/JPFkgFPgdfjO7SVZk7VzO0Iqh
jsLhUmudEHFCYcKQUDMSSGUoCj2CoWOGPMK513q7ohGl5EeKZToQCiGhkYpMGR5G
DahF36sJtwK32xLzLc/466WiQ/s09evEM8/QHlvJSrt1vxRxP5PXUlWEoVvNcup8
kDfXpXmgqAWE+Q34UxM2JEWkcK7NoA==
=nh6s
-----END PGP SIGNATURE-----

--gGL87LNFqRbTrChF--


