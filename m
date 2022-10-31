Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F32613795
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:14:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUVY-0001qx-PJ; Mon, 31 Oct 2022 09:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTh-0008EI-Qt
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTe-0007jF-2k
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667221517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U0Pr9Vx/6ujCEsanAr9Q0tQRxnmGZEO6c7EKSHZCQk0=;
 b=dQMgQ8Uy6SWCCm3gefxMg7UL6MRHCPn/CJLZkvzei76z5PEdrnBH7PzW0JcfLtfGv1xPuV
 7/v4bbYj1wVwqH2A1tEhmVNQm35CibsPbYCL+a6h7IhAeHXHo6uRyqcMsw8uCHLzbeyXSB
 sPd59ChPK+mEjiv23GBO/r1RvmAK9LI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-pu8bwxGvOueAfWKI25JuWA-1; Mon, 31 Oct 2022 09:05:15 -0400
X-MC-Unique: pu8bwxGvOueAfWKI25JuWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CE6E1012472
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 13:05:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C1132166B29;
 Mon, 31 Oct 2022 13:05:14 +0000 (UTC)
Date: Mon, 31 Oct 2022 06:14:05 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL 0/4] Error reporting patches for 2022-10-28
Message-ID: <Y1+f7blD8+5eAwAZ@fedora>
References: <20221028060816.641399-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Fp1aIe82PSPCp9Qk"
Content-Disposition: inline
In-Reply-To: <20221028060816.641399-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--Fp1aIe82PSPCp9Qk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--Fp1aIe82PSPCp9Qk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNfn+0ACgkQnKSrs4Gr
c8jGPAf/Z5mPTLLnctW3TcDcU64ZmCJtBSVdKPfMihJIwmQj4nUoSvcgo3UMIvkv
XfKcrpbSMo028qajw5icrjrNcmpilchVAF6IKNgcm3pZUcSOMiCKjEWb8LVW0+UV
Okvu0ONmlvCxWiK4kqr1nEL0l6XmoDxqkNAXMZU77pMUxgr/DU5CnKEaajFLx2aC
Dj+EJFPxrEKLC/oYDTj8plYP7TW4+K5d7/2oaJDQNP9hl9khQEQJAcbK6haLQHUi
mRc9buTpWVC0Ggu0MmmvuiRjUNhQEoV0VhCOCKjm/k3GidtBAnWgfESGLMCDEdVE
+Fl4Ff7g0rGO+Y31kkhPtwVlf9DNqw==
=wmL0
-----END PGP SIGNATURE-----

--Fp1aIe82PSPCp9Qk--


