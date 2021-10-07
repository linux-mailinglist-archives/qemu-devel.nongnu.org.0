Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2484425555
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:24:07 +0200 (CEST)
Received: from localhost ([::1]:55626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUJZ-0002hR-LK
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUHv-00018T-42
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUHs-0004rU-2d
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633616538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=805SQxblT9TdPj2zWnOlWMbQHm9HuuXUH4qygekWiUM=;
 b=BnRuz9CgZ1tIIPFfEOiV9m1gouhVjizPcMJmP6PLHIQ3ClidZLdM5PuSiuAd4AX8gnLyOj
 aqiB1nvXswoASk8vXasnprFBDo0M8WwiSnJq3b3Mbpn2DXkI/wGu5hoppkXuGg9NqwS6IA
 R7/QD22JDU+xnnK3dNgxLe0XT0GVN+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-jMuRTLGOM0OI0IhV3dUZ-g-1; Thu, 07 Oct 2021 10:22:17 -0400
X-MC-Unique: jMuRTLGOM0OI0IhV3dUZ-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68CC2100C609;
 Thu,  7 Oct 2021 14:22:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEEB1652AD;
 Thu,  7 Oct 2021 14:21:48 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:21:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 10/25] assertions for blockjob_int.h
Message-ID: <YV8CfLL4YpBTrP/8@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-11-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-11-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/JeTfW9oQNY4aAjl"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/JeTfW9oQNY4aAjl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 10:32:00AM -0400, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--/JeTfW9oQNY4aAjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfAnsACgkQnKSrs4Gr
c8gfLggAtg5Bt7P2dhY30Lb0EaUNcOgNxDd8wLddZrTQLIue4G8pMfn2RCx3YtnE
n7SAmqD2wTswzd4g3C+zWvizyW4aUVjbWZtUiQuGldtBTaGrc82cYuPjOVMio+7Y
WX/rFb/olxdORE94p5Q7qB6hfGea04jQhrx+Lk2agq8IyZkZCI0Fh/Cid09F8QKT
Pjw+crEcDkAAibYpyI3sJH2Wqeg4TC9A7+6b99bwhu1aaXCHw3pe1wVj9NkiY643
eGd+pMPm0SHsg7RCN40ZcBoaE5ZMtMN6++Sa6j4blfjl7RM3czhdzY+1ah72D/yG
k3mi0XFNC80MR7zjgeIa4bC2PURW2Q==
=3KQM
-----END PGP SIGNATURE-----

--/JeTfW9oQNY4aAjl--


