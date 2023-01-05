Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FFA65EA0C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 12:36:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOWb-0007Az-6V; Thu, 05 Jan 2023 06:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pDOWZ-0007AC-8A
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:35:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pDOWX-0002tn-3U
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672918503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FPNWfiU1xvJWVnYaYEo5UIIlNs9tmNHXrtkYv7FH3zs=;
 b=atIMTCurca/LstDMspztRivCyHuQfZBRwmTfi+CqR/AiwQDY3GJZKQAPgF6XX15DD+dKKl
 PYHbY5LOsDFeN8E/EVc41G7f28IhDHha2NqMfP4HyActfTZoOskv9nrLCdgvBdR6R+WZpz
 Wq/fsxWIqrbZr3IxIrl0RQLV7J7kFXM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-Rt3so9tuOFCoueBPGYlSIw-1; Thu, 05 Jan 2023 06:35:00 -0500
X-MC-Unique: Rt3so9tuOFCoueBPGYlSIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02039101A55E;
 Thu,  5 Jan 2023 11:35:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E32553A0;
 Thu,  5 Jan 2023 11:34:58 +0000 (UTC)
Date: Thu, 5 Jan 2023 06:34:57 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Qing Wang <qinwang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH] block-backend: fix virtio-scsi assertion failure with
 blk_drain_noref()
Message-ID: <Y7a14QNkit3keLm1@fedora>
References: <20230104195633.86143-1-stefanha@redhat.com>
 <CABgObfZmc7YNCRQWqhuJSDxi-Pz7B1HJCEDmLZDaj_MPPm+83A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2ucAKDHUdIsjgMDD"
Content-Disposition: inline
In-Reply-To: <CABgObfZmc7YNCRQWqhuJSDxi-Pz7B1HJCEDmLZDaj_MPPm+83A@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--2ucAKDHUdIsjgMDD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 04, 2023 at 10:37:34PM +0100, Paolo Bonzini wrote:
> blk_root_drained_end is not thread-safe too. I started looking at that with
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg925670.html; that's
> certainly a prerequisite for this patch to be a full fix, but I have not
> checked if it's enough because I don't have the QEMU sources at hand right
> now.

Thanks for letting me know.

Do you think blk_drain_noref() makes sense at all, or should
scsi_purge_requests() avoid calling blk_drain() somehow?

Stefan

--2ucAKDHUdIsjgMDD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmO2teEACgkQnKSrs4Gr
c8ipdAf8DPfmDQ1Tkn8vvcFLqK84PNH6adwnWsjZUlUEqvUOD0rBkPSHCTsJOpQO
T2bWnZasQdDkUC5RmHozmGy4fSL2Wx9WVZTks4/8G0NMjmLArTAH9gmYZqG6kegR
LknQkuY04O6TpvqXXWaW5m1JtUBP9q2oJl7b6ceqU69+JoHvubtA7x8wPR4vaNxw
iHu4Dztpb4gyG1DUShWPEMWYR0TMxtJGrcXz/0FRh0OtyfwbGrveFy80wHPpsWyC
vn0eMTdWUSu85ZLv7dym8PsJSSnXf+Z5/15Tctlu80EZL4WYq5+ddAWU4RYyF0Qr
FaaoLgi+2m3CSfLqD0nFjOLEsgSLIg==
=MB1C
-----END PGP SIGNATURE-----

--2ucAKDHUdIsjgMDD--


