Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6FF60694F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 22:04:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olbmX-00044u-1R
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 16:04:45 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olbmC-0003GG-An
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 16:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1olbm4-0002sm-3k
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 16:04:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1olbm2-0006YR-8I
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 16:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666296252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXww4SkFJsrkMIrF40r2KpYp6Ifz/WQGL6wQ76BQNhY=;
 b=ZUxsuY4MumI7/E0UqKBvyAI6QJxzuYOQuEKXUNPMCzjSGP8UWGRGmglZ1i40bF22gWBPEQ
 LVbEkEld+ags8SlL6a30XgqXdueT03q6VG88pb3xERqXZyaYte78JEmMOzlOxU4JwqgaTV
 KxxSpFK82zIEBcKnXj5jGzoJEQAuKbw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-yZQkurBHNkKOfuR53gXzOw-1; Thu, 20 Oct 2022 16:04:10 -0400
X-MC-Unique: yZQkurBHNkKOfuR53gXzOw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49080804187;
 Thu, 20 Oct 2022 20:04:04 +0000 (UTC)
Received: from localhost (unknown [10.39.192.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9B7C4047A7;
 Thu, 20 Oct 2022 20:04:03 +0000 (UTC)
Date: Thu, 20 Oct 2022 16:04:02 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/24] target-arm queue
Message-ID: <Y1Gpsj0btN9/O3kp@fedora>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9QlUW0K0zX7sqt6a"
Content-Disposition: inline
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9QlUW0K0zX7sqt6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--9QlUW0K0zX7sqt6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNRqbIACgkQnKSrs4Gr
c8isrggAxc7ZL4gXUwXw+PLrV75KuBwlvPEweuDqqlbhju+eS3lSDURz1s1i65Sy
3y8/BCRMCqIBtMct8GhJZ1WZDfvZRPt6NwKfg7tvFer/T7QEfZa4YqLRAro6LVoO
ARV6kX9xnyzaS8IofEPZFbvqNqqQjKO8Ae9yIJc2qUzdFoFRK1zDNHTM3P6iu7AL
qs4qMVstOyuAswFil4LCno62Yn2llO14oNFISWkHiQQedZ7wyilxQLOYsnaQCTEE
Pzc1GS/GaXcmpcLcdmyQDFgHX0OkEpTkHKyTUZI0L3tpc2h78e/OT0HhugR/KbeU
k7ahrUBZBXwGE4RkxbQ3UB7QYAwV7g==
=GhDF
-----END PGP SIGNATURE-----

--9QlUW0K0zX7sqt6a--


