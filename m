Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E552F33EFCB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:50:48 +0100 (CET)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUhM-0006sr-0P
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMUgH-0006PR-8m
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMUgF-00088n-MG
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615981777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=l/ExN+Xvq+hBgoPAXYjqV/Yy5tSYobFom4wQ15iKhzw=;
 b=g7lpGOcEjgsFIDsijsZ6Dp/NNM4ydu+0oK4MrUYDceyntFYy3nQxfCQu/2klHnOZ/dNR6/
 rdCJ90viDUN4zbhHFHSU86ijZDXyUnhINJWXeXPdqSB+D59Z1OpUO97slMl5RoctsQJZ0x
 6bS1+B9/S4VjTSXnbSO9Ko3hrkvbIpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-tagz0UhsMHq5mLyCfT8QJA-1; Wed, 17 Mar 2021 07:49:34 -0400
X-MC-Unique: tagz0UhsMHq5mLyCfT8QJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A22FD83DD29;
 Wed, 17 Mar 2021 11:49:33 +0000 (UTC)
Received: from localhost (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EC3660C13;
 Wed, 17 Mar 2021 11:49:32 +0000 (UTC)
Date: Wed, 17 Mar 2021 11:49:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vishal Verma <vishal.l.verma@intel.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Ross Zwisler <ross.zwisler@linux.intel.com>,
 Haozhong Zhang <haozhong.zhang@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Jeff Moyer <jmoyer@redhat.com>
Subject: Microsoft and Intel NVDIMM ACPI _DSM interfaces status?
Message-ID: <YFHsy8599w7KT1SB@stefanha-x1.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rW0AJdusovTaGGFy"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--rW0AJdusovTaGGFy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
Microsoft and Intel developed two different ACPI NVDIMM _DSM interfaces.

The specs for the Intel interface are available here:
https://pmem.io/documents/NVDIMM_DSM_Interface_Example.pdf

This is the interface that QEMU emulates. It has been reported that
Windows 2016 Server and 2019 Server guests do not recognize QEMU's
emulated NVDIMM devices using the Microsoft driver.

I'd like to understand the path forward that will allow both Linux and
Windows guests to successfully use QEMU's emulated NVDIMM device
(https://gitlab.com/qemu-project/qemu/-/blob/master/hw/acpi/nvdimm.c).

Are/have these two interfaces being/been unified?

Should QEMU emulate both of them to make running Windows guests easy?

Thanks,
Stefan

--rW0AJdusovTaGGFy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBR7MsACgkQnKSrs4Gr
c8iz3QgAveO30F4nzdYcAN9wIMbNndhWezS8ydz3TYBKI0pGgAkA8IlHJSG7Z0p2
7OcJZg1zn9tqHBFO9KxTFJUFjUhXG/pmY5FtcLA3xprji75h0o5KJspjN1q/oOnG
bGAmL4mGvSccxvXQj60vY2uY+Ccqpir5xEhRpDdMkLHAcTpkWSqZyEjpTr9zuuY0
NIHAktqNYzTXVnTuSqzp2fYpqZ7Oxv1l4NIvnE/pooBxPu6NwZHaunHMfmCk99GB
aNz6d04Do03LKhOefwHbvUgFZCYPeIVdCZYmPDXmcTd6t3diNt6gzTbwgTSKf9+H
IBZV4FRN2c9tHH8QeoOJz1mpL8WvRw==
=VLvQ
-----END PGP SIGNATURE-----

--rW0AJdusovTaGGFy--


