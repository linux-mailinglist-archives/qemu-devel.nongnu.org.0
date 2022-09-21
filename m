Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098215C0560
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 19:36:28 +0200 (CEST)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob3e6-0002RJ-Ke
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 13:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ob3bG-0007tW-Gv
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:33:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ob3bD-0006BU-MU
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663781606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VHGIRGlUJhyCJ0EfZreYoUB3IgezPHZb4z7UbTg02vI=;
 b=ax/SbZzXikxH1JeNvl5S6zscEDUhdNEpktBaBB82VjKDcb5yamHX4qcmjGvMlNR5txzReK
 nOsKmy2Om4oa4c/6BmVLh50UDFLpBN47tMfqlBguLNg0ogxZKujgRYU5tNqTcxapscRw61
 ACYVBcmrvlmK4RMPaf++FOcJ5q39gXk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-gY0_KpOZOR-gSiowrIvSfQ-1; Wed, 21 Sep 2022 13:33:22 -0400
X-MC-Unique: gY0_KpOZOR-gSiowrIvSfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 619AC3C1068F
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 17:33:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D37221121314;
 Wed, 21 Sep 2022 17:33:21 +0000 (UTC)
Date: Wed, 21 Sep 2022 13:33:19 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/21] Misc patches for 2022-09-19
Message-ID: <YytK39w0pmrLQ2y7@fedora>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5hipvI/5pQr7TLRk"
Content-Disposition: inline
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


--5hipvI/5pQr7TLRk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--5hipvI/5pQr7TLRk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMrSt4ACgkQnKSrs4Gr
c8jvnQgAxrfuCBIRanZBhi90FQduXm+wXzUW5MUf6REB4sKth0fBpU5tTjvxj9CI
SJ4ajbdOIFnsPutsEktHFmnTskrijsQabq2IemXH9p6vw/sgpDSk+4wV23qKcix0
sgRnkcxxL3pOLB/ywUE67qXi9QEQJcHkDe4omlR1gw720bEcBMnmZ2Xo5qbRnB0v
wT5f2foiHOY6YcjFdC9jvckHlf8/K7ae7HVROrJchJU+CmI/dZtakzy4XTAj0cQp
wmDMtrlvWr4I3dZdqwG4mNFT7VTygFx0RUT2+pp4D1qZlLVSk8zozM+qjCW8Eqj6
8bmgcJv3MhifozbAsMPw6hT46e1XNA==
=l3LD
-----END PGP SIGNATURE-----

--5hipvI/5pQr7TLRk--


