Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B3B12F72F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 12:26:59 +0100 (CET)
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inL6Y-0003X4-1Z
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 06:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1inL5R-0002sI-Vs
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:25:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1inL5Q-0004BZ-Tp
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:25:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45049
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1inL5Q-00047Z-Nh
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578050748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PnmGPtvQ66n3yPWeqkDr0rn0y0NIx7l35vrfAM6E9qI=;
 b=U415erPW4D7XS0c6vJCU+zYzZdkt7sGLHsNYGwJUNEAca43bDpuT/9uJijhheKWM1AUYJl
 kIbpUZ6YHwC20Mw9761nP3HD8uhxG70AF6v6FXSRep04Dp/anpyy5VqIkWOJxEMhMaJpCh
 7L+cle6AiGUhqzJYtlO9HNRh++yHE3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-XBbi0yZoM9i-v7Bo9aJIoQ-1; Fri, 03 Jan 2020 06:25:47 -0500
X-MC-Unique: XBbi0yZoM9i-v7Bo9aJIoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 114E8107ACE4;
 Fri,  3 Jan 2020 11:25:46 +0000 (UTC)
Received: from localhost (ovpn-116-102.ams2.redhat.com [10.36.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BFFD7A078;
 Fri,  3 Jan 2020 11:25:42 +0000 (UTC)
Date: Fri, 3 Jan 2020 11:25:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Subject: Re: [PATCH v6 15/21] fuzz: add fuzzer skeleton
Message-ID: <20200103112541.GK130240@stefanha-x1.localdomain>
References: <20191129213424.6290-1-alxndr@bu.edu>
 <20191129213424.6290-16-alxndr@bu.edu>
MIME-Version: 1.0
In-Reply-To: <20191129213424.6290-16-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HcXnUX77nabWBLF4"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HcXnUX77nabWBLF4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 29, 2019 at 09:34:49PM +0000, Oleinik, Alexander wrote:
> +static QTestState *qtest_setup(void)
> +{
> +    qtest_server_set_send_handler(&qtest_client_inproc_recv, &fuzz_qts);
> +    return qtest_inproc_init(&fuzz_qts, false fuzz_arch,

This line isn't valid C.  I guess a later patch fixes this compilation
error.  Please squash the fix into this patch.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--HcXnUX77nabWBLF4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4PJLQACgkQnKSrs4Gr
c8grxwgAuBSWknRLroF8spBSJQTh9Pewl1X6YbEs64TTCKjHLIcV5FM2gIF3doaW
Y/VNAYEDVv5pvMLF8f540zmJP3LQjznvRaveRQ2ra66xd3QRuwCGZryXg5IQyUN+
0v9OJx+ng+3vgaH9odtQc9tEuqEzpbv1KN2Y3WJzUjNKnm4P6EZieIQk3yaVhGTJ
/2SVJEZ5xM3CKTMSOxRhipQ0/wMDjS7HiGT+4E/cwTR5CmO5TIIEIJjAjATfreq7
yrXtlB3o1SCqvOFja3zIplOqc5thP9d+YQt1iixD2w8Q38aaQh71c7Crm+vfLrqp
SIRggAaECdS8E8FXYsnN230oPHLLcA==
=ZEVm
-----END PGP SIGNATURE-----

--HcXnUX77nabWBLF4--


