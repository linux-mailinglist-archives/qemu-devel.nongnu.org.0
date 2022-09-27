Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA885ECC3B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 20:43:06 +0200 (CEST)
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odFXr-000278-0N
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 14:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odFV7-0007Ul-83
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:40:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odFV3-0004aN-NG
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664304008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=to7r21HbHdgMsHlv/8ZGwnucJKm0M3gtRPCiBjyeCmg=;
 b=B3iLJAYtzwDFgRRySWLrnFAZ3zAC9q6h5+/A+glB0VAQLi67VjAyQeyFZjQROSYuJyxVf7
 cmct+HH3n6usVEUJLJ/eE/W5vCSxc3/Jg8jxTrtLZ51Lh0Kpnm7JnrRNMHfijbMyWXCE1G
 48G+A8MPedlwDjVe9dmrmlGg+4nWdps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-5sSI7eNCNxC-odVDIRvUIQ-1; Tue, 27 Sep 2022 14:40:06 -0400
X-MC-Unique: 5sSI7eNCNxC-odVDIRvUIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3187800186;
 Tue, 27 Sep 2022 18:40:06 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D36740C6EC2;
 Tue, 27 Sep 2022 18:40:05 +0000 (UTC)
Date: Tue, 27 Sep 2022 14:40:03 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 0/3] M68k for 7.2 patches
Message-ID: <YzNDg2hMoJNFlrdl@fedora>
References: <20220927062633.618677-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GOAZ3bK2BdS1uWy6"
Content-Disposition: inline
In-Reply-To: <20220927062633.618677-1-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


--GOAZ3bK2BdS1uWy6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--GOAZ3bK2BdS1uWy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMzQ4IACgkQnKSrs4Gr
c8ippggAiDPRKpq81Cr5lol8bn5ckC2C+gKQEFDsLBF5rMQRfR6vUWgNzR1XkZdd
8A+39LjFZSRaF3Iy1tUIUXRCCwwgz6EsCzxjeDfmK/8Ghl8/9oAyVpxRlMUH7D/O
XaMeJ0J4bogB+eE7w2W883d9VplSzGwjGdSlBwxATiuIEb6UDWxR+j4HS+0b81Gp
5KQ7ahUVFT4S2Nx32eWsSyJ3yQ5J3rRQ08vAe86tgJQbVJXIpLfyzideUXZt9ras
jSIEtK97c1GJt6B1qE7sij3RFRLTQIy4a2cuPBNMzcDkU3ErbUs/rI/O5tgjJVyC
G+nywsoQpqo/mEZA+xjq9b3beRUdwQ==
=kVhZ
-----END PGP SIGNATURE-----

--GOAZ3bK2BdS1uWy6--


