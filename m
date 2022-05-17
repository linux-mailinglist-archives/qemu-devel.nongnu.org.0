Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32A52A68E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:28:21 +0200 (CEST)
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqz7U-0003wH-FN
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqyzm-00023x-9y
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqyzk-00005f-Sf
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652800819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yrzOO0Q6yF7lI5xKhSiP8LS+E3AWfUrBuA7yAty3Ruw=;
 b=OQOTdj95mlm9WMH4/F0GA0N5pBaKBgplLcv7kVdpRU19v3BfUs9L687nD1JyR2eg0vIQkg
 ijujLzRZA7ziN3CXZJWlSfVNGA5oOsnB7MNuUTLR/6JiuKkW006oBW2c53+M8ksUjQhlFu
 iw6OBNbZiGr8PMifeNT9Nt90ZDtTdX8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-tAybZlblNGCj5bdl5uuU5Q-1; Tue, 17 May 2022 11:20:18 -0400
X-MC-Unique: tAybZlblNGCj5bdl5uuU5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1429F18A658D
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 15:20:18 +0000 (UTC)
Received: from localhost (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B4A11121314;
 Tue, 17 May 2022 15:20:12 +0000 (UTC)
Date: Tue, 17 May 2022 16:20:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, nsaenzju@redhat.com
Subject: Re: [PATCH v3 3/3] thread-pool: remove stopping variable
Message-ID: <YoO9K3nw4sSDwXHa@stefanha-x1.localdomain>
References: <20220514065012.1149539-1-pbonzini@redhat.com>
 <20220514065012.1149539-4-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VTiZvkCqLR5Mpk7L"
Content-Disposition: inline
In-Reply-To: <20220514065012.1149539-4-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VTiZvkCqLR5Mpk7L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 14, 2022 at 08:50:12AM +0200, Paolo Bonzini wrote:
> Just setting the max threads to 0 is enough to stop all workers.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/thread-pool.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--VTiZvkCqLR5Mpk7L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKDvSsACgkQnKSrs4Gr
c8hovgf+NZMtpOH1mOiYKDKVyZpQ6qBvqCHUfokpZLu5iloPb5xgpHPs8Bl0fLYv
DsupaHY2MHmnAedS6YhXMTt0MnF8dSnW/8jwA4uvLBMeDGaahWuJs1Rekp0tbo7l
2VTddq1yzP305Jj5X9X4AabuPCX/n2PZ1vX58Y5UVZZ2EF8NBsKlmWdRucfOOIXY
dLuH+CgWwtJmhENVbSI2lirqVD7k/Vv6iu+Pz5NhUm8ZMHKZ4dB4jBqPp/rF/wib
3ogdK/SYrzJU5rB85lN82Fijx4cHRTC8kLUdHqEI2UtTYFKg4Z6jGtz5tZ9ZuKZL
d15EE6wA1v9au311u28oL1GJ8U2TLg==
=j4/K
-----END PGP SIGNATURE-----

--VTiZvkCqLR5Mpk7L--


