Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09FD2CA657
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:53:55 +0100 (CET)
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk72Q-0006B9-Nu
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1kk70C-0004tE-BD
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:51:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1kk708-0001sn-MJ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606834291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jUYMEoXsmsQdWg2k5N+4qigUxT63dixyGlZha2ZqM7c=;
 b=WdGqU9EnJi8gRkEgNeXjARtt8h9oqeph3fI1NQjDIPGClEwhfT5AOUjl/NfqabrGNETk1x
 +9uDJZcB5AD9Zn8TlVViqgjigFS8bziCAxhdeWuLzt/BrR2onZlhDNdsVyr0WATatpAu3R
 vjja+kAEtAQffY+Rls6CW+z5Cz1MhWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-9taMk0YuMzWhDIm06gXT1Q-1; Tue, 01 Dec 2020 09:50:20 -0500
X-MC-Unique: 9taMk0YuMzWhDIm06gXT1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6396F8558FD;
 Tue,  1 Dec 2020 14:50:10 +0000 (UTC)
Received: from lpt (unknown [10.40.208.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15C9C19CB6;
 Tue,  1 Dec 2020 14:50:00 +0000 (UTC)
Date: Tue, 1 Dec 2020 15:49:58 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] target/ppc: Remove "compat" property of server class
 POWER CPUs
Message-ID: <20201201144958.GA79432@lpt>
References: <20201201131103.897430-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20201201131103.897430-1-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jtomko@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jtomko@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Tuesday in 2020, Greg Kurz wrote:
>This property has been deprecated since QEMU 5.0 by commit 22062e54bb68.
>We only kept a legacy hack that internally converts "compat" into the
>official "max-cpu-compat" property of the pseries machine type.
>
>According to our deprecation policy, we could have removed it for QEMU 5.2
>already. Do it now ; since ppc_cpu_parse_featurestr() now just calls the
>generic parent_parse_features handler, drop it as well.
>
>Users are supposed to use the "max-cpu-compat" property of the pseries
>machine type instead.
>

For libvirt:
Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

We use the new option as of libvirt commit:

commit 2b041dc8c7b70e762d99b6bd7805daa9961740f6
Author:     Shivaprasad G Bhat <sbhat@linux.vnet.ibm.com>
AuthorDate: 2018-01-05 19:18:00 +0530
Commit:     Andrea Bolognani <abologna@redhat.com>
CommitDate: 2018-01-05 17:12:14 +0100

     qemu: Add support for pseries machine's max-cpu-compat=3D parameter

Jano

>Signed-off-by: Greg Kurz <groug@kaod.org>
>---
> docs/system/deprecated.rst      |  7 ----
> target/ppc/translate_init.c.inc | 59 ---------------------------------
> 2 files changed, 66 deletions(-)
>

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE7DTm0WabvfIr7YZ4Ak1z5KIMl5QFAl/GWBEACgkQAk1z5KIM
l5ScMggAhU/jxNNAWiYMPbCDJQIOvYrYMLHg+KbN8Wq3L2m0bS40T9yAsXaEn8P6
Q3s7D/XhiYel20xzOWyx7y0VH2AZ70UaHPQsOFwCR3G76vD8Umhsv5cq8vPYFRuq
x6UXhC4fHjjWbHe3zP50V+QseG43lviOo3bPSucG0bRSFU5u1xCd3YrIaTU5NXhy
ZLVtNLbXAVafF9D9OS2/JXFkTGZNY1LnM8g/mV335kju8JQ+N7MpoNxtIS+HREUa
rw47VzCsk600zy4sHFvzpsajTFgFLwyFUX/heWfcaJ3nvsr/6FljBvc6Hs5h2vyS
PFsFAX+iwAIJkgHJcxK6iWgB0mSF7Q==
=sEXf
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--


