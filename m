Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA36634238
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 18:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWm6-0006ov-Ff; Tue, 22 Nov 2022 12:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxWm5-0006om-AM
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxWm3-00082R-NA
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669136970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tMju6+Kf0x5P14hHHIyjsPt/HZwnoNvDbYk4dEm2ctg=;
 b=iJ/1EVBc4jZY5st6+ZWzNs0EY7jdHP3xDAO2z4MOrxweOxFj48q7HBLKHoGjk2OjlCqxj8
 72FtV+ibJ5rVCUgZqkLrL1nfjv0ILujHAdFkKPlOx+Gy1wfFsDUAhCsnMSypBio9fAlxzb
 c5o6iTqy+Z88IuGZiLaKuwsMLpqpUlg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-8QOkN6pAMEaIKSQ4-S4sCA-1; Tue, 22 Nov 2022 12:09:28 -0500
X-MC-Unique: 8QOkN6pAMEaIKSQ4-S4sCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CD383C0E214;
 Tue, 22 Nov 2022 17:09:28 +0000 (UTC)
Received: from localhost (unknown [10.39.194.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A66A2024CBE;
 Tue, 22 Nov 2022 17:09:27 +0000 (UTC)
Date: Tue, 22 Nov 2022 12:09:26 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/8] pc,virtio: regression, test fixes
Message-ID: <Y30CRtVTnLmNDAYj@fedora>
References: <20221122102227.6603-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ruRQ+NOCES6ENiYf"
Content-Disposition: inline
In-Reply-To: <20221122102227.6603-1-mst@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--ruRQ+NOCES6ENiYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--ruRQ+NOCES6ENiYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN9AkYACgkQnKSrs4Gr
c8i2wwgAhh6+u+YvwMhxAOHDfKK4Pco5Vq+rN6RP22lOeBL/TQufL3eh1XDp4nw1
KRvvTKTaoRI2zgxm8t9sJvxgOiHQwIIV87RShUyxJOCfmVney4gtldS+wl6rIQH4
3igUqXyVG9JWIRo5U2ttSgXyryqrK/fDqqie79qVoHJk+VWRKuX/1ffNnWODHxVP
kLxIhYY9Y5TI1camm3XmOtYAKO8SMATCrTqbmarA+0uZGshc50k/uxyxTPGnYsIS
Q2spMt6oUxbZn2i1DnvbM020h7wQb2pv6DIAi9WZREcuQLwlC+B+/yyBJBevwtzg
PwgfYSASMpxRsjNSisR5eaI4dwC9vg==
=Ferm
-----END PGP SIGNATURE-----

--ruRQ+NOCES6ENiYf--


