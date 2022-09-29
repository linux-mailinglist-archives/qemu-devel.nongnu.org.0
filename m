Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D95EFB0E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:39:39 +0200 (CEST)
Received: from localhost ([::1]:55930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwZV-0003sd-W3
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odwLQ-0004gJ-5b
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odwLO-0001aD-QW
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664468701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PCIE/RNt+oexsr/oR4pKAhOrNFALFCLp91A1g9Wk85M=;
 b=Vbc00O82UnXO4MTRMH5JWO0nLmx34FAC5VP92P44LNb6wzYa8LMgdGhBntDQO/eJfD5bzH
 Zdh5sBtvQg2Cbqk5+yDn5WmrgqBrYVKwmE/MQlw1cyZDduS1nXZ+P309IreRGHvK0kAG4/
 5dmP920oORDuODOfNGGQjJFvFUtjtJg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-EzG-sXvDM9eN2buRLaGqCg-1; Thu, 29 Sep 2022 12:24:58 -0400
X-MC-Unique: EzG-sXvDM9eN2buRLaGqCg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB211803481;
 Thu, 29 Sep 2022 16:24:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 658E34B3FC6;
 Thu, 29 Sep 2022 16:24:57 +0000 (UTC)
Date: Thu, 29 Sep 2022 10:48:40 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 00/37] Linux user for 7.2 patches
Message-ID: <YzWwSGbrH1T/qwff@fedora>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uDxd5Ie3IOsYiO36"
Content-Disposition: inline
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
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


--uDxd5Ie3IOsYiO36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--uDxd5Ie3IOsYiO36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM1sEgACgkQnKSrs4Gr
c8gl0QgAq7NM1jt6DbXlo2SQ8JkgOqSC77Rh5fs5+WNwev792kP94NR46GC+VBco
btbVDFW+tpqY43Fo1v+d9iflnNZpANXK+d4zHdNzBwpzIYtUbt27MMkiaBT3m00k
d3975lsfnfv6hUU98b7IaEQ9rFNknzhGUSKcRF84yapoUM6FCD4APtDemIOs0R39
M7NmLF/Hzc6z6ME398gWi0F2ffupLg9p+hghc2bG8q9VjVxc/d+grTh9kmwO6O9H
odeN3Xt+kjQQh0vy/aoa/OuI6dFmecqIK3O1Jd8Ec/qYHHOFC0oxfftUJS9ByUDE
oQG70UzrIyYnmqCj/+YMgcNRnzxHgQ==
=A+xu
-----END PGP SIGNATURE-----

--uDxd5Ie3IOsYiO36--


