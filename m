Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8CF37FB3D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:08:56 +0200 (CEST)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhDtP-0002oC-41
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhDnZ-0004Nw-08
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhDnV-0004X2-NG
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620921768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HRvHfK2jLl+Z2A1I0d1+X/Q7oVSEJgoAKtkCG4r8Qhg=;
 b=aMPj4fVD3Ts90jq9UZUYiLiZjF9CvEZXD8wiF6Qz3FPHirszWVolmP5xTGmOxoxLqU+twF
 Q7vekwypiVO+pBfsVOIY8MaIDTgxoja7iTY5Vp7gkVDwi3ZGIIMKK7kSJbDVf8mODNIylx
 D7W94BQSDq4ikzHC1zyDH9ZuXKPZSX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-UqeK6fxmOaqolhxfHwh2HQ-1; Thu, 13 May 2021 12:02:46 -0400
X-MC-Unique: UqeK6fxmOaqolhxfHwh2HQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7FF6801AD9;
 Thu, 13 May 2021 16:02:44 +0000 (UTC)
Received: from localhost (ovpn-113-21.ams2.redhat.com [10.36.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60368189A5;
 Thu, 13 May 2021 16:02:44 +0000 (UTC)
Date: Thu, 13 May 2021 17:02:43 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH] multi-process: Avoid logical AND of mutually exclusive
 tests
Message-ID: <YJ1No5yAiEY458EA@stefanha-x1.localdomain>
References: <1620402803-9237-1-git-send-email-jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1620402803-9237-1-git-send-email-jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OqV+ohI/72aH4J9l"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--OqV+ohI/72aH4J9l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 11:53:23AM -0400, Jagannathan Raman wrote:
> Fixes an if statement that performs a logical AND of mutually exclusive
> tests
>=20
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/mpqemu-link.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--OqV+ohI/72aH4J9l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCdTaMACgkQnKSrs4Gr
c8g/Fgf+J8/d2Xh8xziuD2afbtB+hQYAMXlscC28QtadA249od1CvFTSmdBuqdww
WBkVRduRC3H4/v7LbtM1guzYnCUn1iDZYxofVw4fbIZ0aN0vhpd02rF/ZKgUh1kL
Bi6IrM5OyjzMf7h64QVcDnrrWWbHx/c4WqGwFCNrS73MIjeWrSHHVlq2i6vNxptz
zZu4Q/DVs40MFUugSpVDLKguoF3iY12djpiiciM9UfUTn60xJUgWxGjV0CCWBJrK
njoAT5FfAO4Q1BRG++wT1Kke1qizHttHfPC3330SVHhu9IsE24yMtAiTRatlirbL
RJ+Oe8mvc2DN3F4UwCXwsLjWl4GikA==
=QlLB
-----END PGP SIGNATURE-----

--OqV+ohI/72aH4J9l--


