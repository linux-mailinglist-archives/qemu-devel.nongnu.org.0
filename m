Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77CF17AA3E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 17:12:08 +0100 (CET)
Received: from localhost ([::1]:51884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9t6V-0003Nh-Oc
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 11:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jtomko@redhat.com>) id 1j9t5Q-0002j9-6t
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:11:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jtomko@redhat.com>) id 1j9t5P-0003pi-13
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:10:59 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41263
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jtomko@redhat.com>) id 1j9t5O-0003ou-Se
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583424657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wceFFuouHRbDK4kmnjcReNd+URosybCDAqBIP/RxU6s=;
 b=B4Kv8TshOWxMaikJNYkBUgGmV6Ti1aQPEoYx9Du/LMXJZ/6bTbhqtVLWaBXgevmxnCxVqt
 8xMCzaz3BdMBqNdxPkWcO052bTfgYFLB79JdN+mMFxbjiO5rymAqfIqwO/Bl5ol6wUHFpa
 s5+UgFtxiNZ7mm30MxlDdizWk6T+lTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-2IykAllsNZWr7Bon4Lu8Kg-1; Thu, 05 Mar 2020 11:10:55 -0500
X-MC-Unique: 2IykAllsNZWr7Bon4Lu8Kg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86DCADB3B;
 Thu,  5 Mar 2020 16:10:54 +0000 (UTC)
Received: from lpt (unknown [10.43.2.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEED450918;
 Thu,  5 Mar 2020 16:10:49 +0000 (UTC)
Date: Thu, 5 Mar 2020 17:10:47 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Jingqi Liu <jingqi.liu@intel.com>
Subject: Re: [PATCH] util: fix to get configuration macros in util/mmap-alloc.c
Message-ID: <20200305161047.GB3627464@lpt>
References: <20200305154142.63070-1-jingqi.liu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200305154142.63070-1-jingqi.liu@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Thursday in 2020, Jingqi Liu wrote:
>The CONFIG_LINUX symbol is always not defined in this file.
>This fixes that "config-host.h" header file is not included
>for getting macros.
>
>Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
>---
> util/mmap-alloc.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
>index 27dcccd8ec..24c0e380f3 100644
>--- a/util/mmap-alloc.c
>+++ b/util/mmap-alloc.c
>@@ -10,6 +10,8 @@
>  * later.  See the COPYING file in the top-level directory.
>  */
>
>+#include "config-host.h"
>+

According to CODING_STYLE.rst, qemu/osdep.h is the header file
that should be included first, before all the other includes.

So the minimal fix would be moving qemu/osdep.h up here.

> #ifdef CONFIG_LINUX
> #include <linux/mman.h>
> #else  /* !CONFIG_LINUX */


Introduced by commit 119906afa5ca610adb87c55ab0d8e53c9104bfc3

Jano

>--=20
>2.17.1
>
>

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEQeJGMrnL0ADuclbP+YPwO/Mat50FAl5hJIMACgkQ+YPwO/Ma
t538gwf+LT3KSYkVCZ3k+SenCh1fHVPuYC5UYh2GcIb3prxiVOa01B69UaZC6aqQ
YUUaoR/T5gnYr0fi/eu+AAHqvEqkYEC36tG70UO0qo82JXRzrOViKNri54+GJ/A1
iV+fo8A1ODUGWg53KyZfRr1bETLls6LgIWOJ2qmbS0i7SSimouN+LtBHaslk/sox
i76AtLihXQ2LcZy9FK4mJJ7CYVSvD+yFWL+6DqzaDml6sdEudP/IYbQK7BsVI2K2
uJzR45f/leJMkeo9fCagUIgpvfqcRFpAryTNPRuo8u+vhYsMV2BXEz7UbcDh/p1j
IeenHzcUDPv6XxQB3fNa+dlzg8XD9g==
=diQw
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--


