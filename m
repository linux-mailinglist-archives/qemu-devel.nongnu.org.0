Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6527960CD26
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:14:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJig-0007y6-5z; Tue, 25 Oct 2022 09:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onJiS-0007Ll-Fq
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onJiN-0007fe-VU
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666703491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YYVmWPE3BUKetypsncbhbClq1lXu00lqy5dQ/rQHsR0=;
 b=MXCDwCIWZuo1zvXoJrBMjYcA+dpW0jP9h8gTO2hxkm8NWFTzubBj2tX8ONzK6T3/tys2xW
 XeWDT7M/fzCc6TUhXumY7RSiOC34Q5MsCr118tH9FGOicJga4J4IUUVUdYw/6t3BESJCIs
 DpyMd6dMrN2DQOas4N8KhUm/GaodUlM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-24_eWPbSMWedGT6DR9IuyA-1; Tue, 25 Oct 2022 09:11:27 -0400
X-MC-Unique: 24_eWPbSMWedGT6DR9IuyA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2B2B100F8BC
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 13:11:21 +0000 (UTC)
Received: from localhost (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BD8A4A9254;
 Tue, 25 Oct 2022 13:11:20 +0000 (UTC)
Date: Mon, 24 Oct 2022 17:07:27 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/4] x86 TCG patches for 2022-10-22
Message-ID: <Y1b+j4B+gyUx2TpU@fedora>
References: <20221022115608.152853-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tLdWEBf9vEH5QVm7"
Content-Disposition: inline
In-Reply-To: <20221022115608.152853-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.517, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--tLdWEBf9vEH5QVm7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--tLdWEBf9vEH5QVm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNW/o8ACgkQnKSrs4Gr
c8gJ2QgAxkTKkULj9OR7KULgEBtlP/lWZbywlVLsoXCc37ywJRmIGiFLYs0EFsfj
AC0h+CP0MZoVPWxAHmMGRl1/Qg7Vw0Fc73xwJ3Iy2WSeuEtVkmdJ4QVafYgVNZlr
oKBCH4k4Si5f2Nu+OENaxfvl7gPAz+pX0uVbB/IJ0sSESotySH1x+yjk+wD3LEAB
CCrSLAygAfLmJYAz/mXxMiA1i999+uR6/1Hyo+pUQIOJVCH+uWKc3SrvAXzqXOyS
Y2+43g0uZ0E+kBhNCu935tS8CKiYeoGaz9aQNTflp5iz4bc7mpMNpxWHGKSUi6T1
QFk0xd+mct9ql6WmucbY35eCxuLr3g==
=3+I6
-----END PGP SIGNATURE-----

--tLdWEBf9vEH5QVm7--


