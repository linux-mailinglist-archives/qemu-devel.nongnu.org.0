Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E220F4B8FD3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 19:04:39 +0100 (CET)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOfO-0006tB-FQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 13:04:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKONi-0001qW-4Z
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:46:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKONf-0001vC-Cc
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645033577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=aZcI1AU5O+0Naj5GQqhPrhWr9de+9Lkh6GuRVCnS2EA=;
 b=UIIsSmFRlggFn/YIjOa8sXsNTHNcqWpUp62b7UTMLxDOUB1vju3AHRRJ4yBYDIysNWMgho
 biBzVkvkywMcupa3witQrhrKQ2rwNnSJyyl05THjeQu4jWT61XKuDRUC/2hYvztIiy20xX
 u+vmc51R7NlOgcZS9uQgYLkNMMitEkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-xxV4X9VzP0KJjwXTgErUow-1; Wed, 16 Feb 2022 12:46:13 -0500
X-MC-Unique: xxV4X9VzP0KJjwXTgErUow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF153344AF;
 Wed, 16 Feb 2022 17:46:12 +0000 (UTC)
Received: from localhost (unknown [10.39.195.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CA6484637;
 Wed, 16 Feb 2022 17:46:12 +0000 (UTC)
Date: Wed, 16 Feb 2022 17:46:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Portable inline asm to get address of TLS variable
Message-ID: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WcLq8u038+5NJAps"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Florian Weimer <fweimer@redhat.com>, qemu-devel@nongnu.org,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WcLq8u038+5NJAps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
I've been trying to make the inline asm that gets the address of a TLS
variable for QEMU coroutines pass QEMU's GitLab CI.
https://gitlab.com/stefanha/qemu/-/blob/coroutine-tls-fix/include/qemu/coroutine-tls.h#L89

The code isn't -fPIC-friendly (R_X86_64_TPOFF32 relocations aren't
allowed in -fPIC shared libraries) so builds fail with ./configure
--enable-modules. While I was tackling this I stumbled on this:

  void *dst_ptr;
  asm volatile("" : "=r"(dst_ptr) : "0"(&tls_var))

What's nice about it:
- It's portable, there are no arch-specific assembly instructions.
- It works for both -fPIC and non-PIC.

However, I wonder if the compiler might reuse a register that already
contains the address. Then we'd have the coroutine problem again when
qemu_coroutine_yield() is called between the earlier address calculation
and the asm volatile statement.

Thoughts?

Stefan

--WcLq8u038+5NJAps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmINOGIACgkQnKSrs4Gr
c8g+XQf7Bc8OSmzjK6gp7kXrQhp94GjEERRSVknNVzynBz21FtXb01mIDouoKb72
7yI03Qh+B4ufY0atO60Lje8QHw7jyXaA6UeFHIQon84pWW7u3W9pdeHosgzIG/T+
AXtd9btSgUNuLrzHosg0Ou3RjZDfGUaBMyidHrPkUqsbJ80Wf70G4BcJq66BSzAH
37XA8RNaZx2xV3mew/gYrcHKj0WZgeAMBJbhNoMI+/fnoFaFFiz+xi8y1HDGaHnB
f1reXNxQ495jL2mpS+NRspQElL7oOXvfUE23N9CXuNzGdLvX4VJQrrW6nNSKbn+Y
S0vXbzRsv7+iqt8Rx00d6CDfWaKHUg==
=saIR
-----END PGP SIGNATURE-----

--WcLq8u038+5NJAps--


