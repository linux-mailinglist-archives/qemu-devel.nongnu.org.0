Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82DC636CAA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 22:58:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxxka-0004Xy-DW; Wed, 23 Nov 2022 16:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxxkY-0004Xm-Pm
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 16:57:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxxkX-0001mB-8c
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 16:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669240664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ARIucx206nIYUcl6m6qGRUSNI42xjDFmFy3EEOl5gWk=;
 b=UVJ/vrpGPmQ4Gt+EF7vZT6z5K1e9cIj15aTTXUQ8i6PtvGrhkmKRmULVPxuzl+o61ZtXky
 QkRN3dI+OG+REJusl5HpgAB1Mb4NISG9SypamENhNjmuD1fshPB4LED0O5l6YOAzLpp8aQ
 MS8l1rsNFJHi5Ew+ErUfbJ65cLAH0Yo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-HKQIi4rQOCiNMEf-EwH8oQ-1; Wed, 23 Nov 2022 16:57:43 -0500
X-MC-Unique: HKQIi4rQOCiNMEf-EwH8oQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8497811E7A
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 21:57:42 +0000 (UTC)
Received: from localhost (unknown [10.39.194.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B060111E413;
 Wed, 23 Nov 2022 21:57:42 +0000 (UTC)
Date: Wed, 23 Nov 2022 16:57:40 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PULL 0/3] Avocado tests and qtests improvements
Message-ID: <Y36XVE1Y1xvHtf/8@fedora>
References: <20221123142843.346105-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZRTHWUlXg7pevj8V"
Content-Disposition: inline
In-Reply-To: <20221123142843.346105-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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


--ZRTHWUlXg7pevj8V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--ZRTHWUlXg7pevj8V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN+l1QACgkQnKSrs4Gr
c8gbjAf/ZhkUJNeuOA2KR340qpOGIrT+5YdxqRUqkojR7uZ64wn+BCLzJDdJqrZG
NAdyXZd41fjx6N/fsip6aCO2Cibs5ZKr60Swsw+2TDjpffbv79000+wy5Pmqg49O
CjyOo+5Q/HpsgTnigyZFtKan4A+G7RetAMprLfKDLPdA1nOwy7O/01+Xn0P5vlIA
a5NJrUgfkeiah1oH66BPJWEIwn3Lk07s1a5wLWWaecRz5+cMGAxaB0cQ+3n8dWQb
EbPyL+Vgr50mkv+tBdAGhfO5MKnywbzKw6G+OuF8SqZDeVlm/WesFdOh0YL62gXj
74bxUEkxwIDVAqv83yBh+QHJkVSVMw==
=znPD
-----END PGP SIGNATURE-----

--ZRTHWUlXg7pevj8V--


