Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D1396121
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 16:34:14 +0200 (CEST)
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnizd-0003av-VI
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 10:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lnivv-0001Fu-A6
 for qemu-devel@nongnu.org; Mon, 31 May 2021 10:30:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lnivq-0001CA-JN
 for qemu-devel@nongnu.org; Mon, 31 May 2021 10:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622471417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ljiSCxxuNtE+YmhWEYxJpaE5bf5C055fmfNnImKPKO0=;
 b=i+KtwPJl8UwepmmcI9WMu9V1JGKDF00XP+Lvs0YE5cXxP59YwYiEQpK1/pdZZSwHMYtsxv
 YUfNa9rRpUklhFdIPFCk0OyDM0N1jPqSizRJsfVoxtuV7aV6dze9wT3gW1wVx9nrl71J21
 6WKdJz1TE5GIU1y4PvS5E8hhLjU752k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-Czykhf2VNYmoG6d2Z32kTQ-1; Mon, 31 May 2021 10:30:15 -0400
X-MC-Unique: Czykhf2VNYmoG6d2Z32kTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FF38107ACF8;
 Mon, 31 May 2021 14:30:14 +0000 (UTC)
Received: from localhost (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CFFA5D9C0;
 Mon, 31 May 2021 14:30:08 +0000 (UTC)
Date: Mon, 31 May 2021 15:30:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Subject: Re: GSoC 2021: Request for WIKI account to update project details
Message-ID: <YLTy8CoIchkUr4aU@stefanha-x1.localdomain>
References: <CAN6ztm-8A5Dt4xnzO7RM1rSGgsKyy9yB0AwrqQzCK1HVr0Z0Yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAN6ztm-8A5Dt4xnzO7RM1rSGgsKyy9yB0AwrqQzCK1HVr0Z0Yg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0j8tWf9z4vHxyd7x"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0j8tWf9z4vHxyd7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 27, 2021 at 12:35:48AM +0530, Niteesh G. S. wrote:
> I kindly request the admin to grant me access to the wiki through the below
> credentials

Hi Niteesh,
I have created an account for you and sent you the details privately.

Stefan

--0j8tWf9z4vHxyd7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC08u8ACgkQnKSrs4Gr
c8gp5wf9GST7pN8LiE0Zcar9ztHC/hkCHQ0mcGHAi//K2oEYNeyQGnS8mUPPCD9k
hLrVmqvonCz/jv2PGjaeX6AcH4NJ0CGbt11AE57stOqZF6VTHfTBI4HMyklLp0gC
Av/hogaYNG6iiU1qvRtUu/jSHZXMIl4hRqpW1RRDGUXVhdS4Ulolc5M71ogqoDSp
tWn+51ftiycnCASkcZ9yB6JxCLtzRcJe4vDDQ7CbCAIt5Jk2EnAlFY+LRdY1YIfD
hG4BNRzYH80BE2MeR+Lwc2Q8D6ESzt7VtGjMei0WQ1JADsKWdY3/K9ZHe4f0T8G3
dGKJ8scMrnEh0ITNDtq2Lx3lTWFpcA==
=8tZd
-----END PGP SIGNATURE-----

--0j8tWf9z4vHxyd7x--


