Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4CB392CAF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 13:29:32 +0200 (CEST)
Received: from localhost ([::1]:42902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmECg-0000Gj-Pd
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 07:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmDdi-0000da-IV
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:53:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmDdf-0003r3-Kl
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622112798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7fucvi8dBMNNJHLcNAsZVhC9rrtnB4YodPH/GjUeErg=;
 b=VoN9awJgH5QlIkUZaapb+/g18Vr7oQCPNdyPlwS3B8zYnP4XpaZBeTOS/H/Wc83xRjvYEu
 eCC4zO2nXumsKul7gqq6Et/uw4/I7Ean8F8TXfPuayy8vo2KPQu4FCFpTkZ1nnPehPvr2h
 OAMwS3cs11LT0+g8Hz0oCgYkoATLD6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-OttP6gkkNN-3zGaEKGNalg-1; Thu, 27 May 2021 06:53:16 -0400
X-MC-Unique: OttP6gkkNN-3zGaEKGNalg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE975106BB29;
 Thu, 27 May 2021 10:53:14 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D8581349A;
 Thu, 27 May 2021 10:53:14 +0000 (UTC)
Date: Thu, 27 May 2021 12:53:13 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 14/19] arm/hvf: Add a WFI handler
Message-ID: <20210527105313.bj7luz7sud7enfqr@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-15-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-15-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vkcvbfdgfewgm3at"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vkcvbfdgfewgm3at
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:48PM +0200, Alexander Graf wrote:
> From: Peter Collingbourne <pcc@google.com>
>=20
> Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> up on IPI.
>=20
> In this implementation IPI is blocked on the CPU thread at startup and
> pselect() is used to atomically unblock the signal and begin sleeping.
> The signal is sent unconditionally so there's no need to worry about
> races between actually sleeping and the "we think we're sleeping"
> state. It may lead to an extra wakeup but that's better than missing
> it entirely.
>=20
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> [agraf: Remove unused 'set' variable, always advance PC on WFX trap]
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
>=20
> ---
>=20
> v6 -> v7:
>=20
>   - Move WFI into function
>   - Improve comment wording
> ---
>  accel/hvf/hvf-accel-ops.c |  5 ++-
>  include/sysemu/hvf_int.h  |  1 +
>  target/arm/hvf/hvf.c      | 68 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+), 3 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--vkcvbfdgfewgm3at
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvehgACgkQ9GknjS8M
AjUa/A/+M0UefiTT6qZbvzTRNEC0FAT/aHrWnzQynZjFiSu74SeJcE6Vh1e0PQ/X
AkXb4insl1qokLGZbJgU44E3ugdR5/CEgPTJm4LoziGb/yFDtWGyN1py8Eowc3X3
trbx3+9Z+6DK7pDTIsVLHS0XGa/AXvwEisAD56oqrqUQl0/FeoQIfKLBvJPmslr+
wN/YAhycRDhtyZCPs8eLfO7NAVEtGyovEvkRkNlq5vosKCl4QxtXNZE4tHvIcZ/j
zq+2H8oidEESMRZQT43+jYwF3MnDX/BkulS7fNnSG0C0D66qkykBby7/RLULlVbQ
5eX677FUKTfzgiFXjLB5VKxqkOebZVuPq3S10B4UyiGlDhprx4qTxsrjEz9oU9RB
Dh3UY8P9h8+Oj71JTgKrJ7c9DKlxCbgihfAGlzMn4RuVJu/pZaN1Z4fxOONj5WWX
N5MnMacEaaogurrvqk9f+wcGsmu2T2fAsjsV7vwkcrFo04NgkHLsDmp/eE+Z8jRg
elmri3s5Ihwp+QQnSILOMWCyzUzhAw7eWznTuL7xzsjAIEzR7PDwIhRR9H0nHsYz
i0o1DECDzBYOQR056VTjCkwAEYJ0GYFP+fXr4BtZtdTt68bSl98kDlX0ZFUuR+tJ
ck6g2f1K0fQHuMX4KTMC23OEXgtHPsUycnRhlvldaOX9XOAN/7Y=
=W4aj
-----END PGP SIGNATURE-----

--vkcvbfdgfewgm3at--


