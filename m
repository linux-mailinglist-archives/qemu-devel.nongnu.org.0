Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D5D618A89
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 22:27:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqhkC-0004UF-Ou; Thu, 03 Nov 2022 17:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqhkA-0004Tc-GU
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqhk9-0006xG-56
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667510840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CHvCZP5nDP1DGiwBc5lJ0s96unJ4QaAOV8Od2JK9yVw=;
 b=Gep4BU82ovQpUo5ct1+te7ewPm5joliBaCY1ZuGWJW/1JZmpnniM6Kzt2mUupVAVvkBEEN
 uqUmPcYcIaRiVHbxn5V+ylEao/V0Xg01u9lWaB+XDcw+JKFdAhyKY/ww5NyH4xks90DVPE
 BGzmlyOhofCxAKsht56CbubRTuIYaVE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-do3jiXG4NQyik-Vx017x2A-1; Thu, 03 Nov 2022 17:27:18 -0400
X-MC-Unique: do3jiXG4NQyik-Vx017x2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A395F800186;
 Thu,  3 Nov 2022 21:27:18 +0000 (UTC)
Received: from localhost (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 059D7C2C8C5;
 Thu,  3 Nov 2022 21:27:17 +0000 (UTC)
Date: Thu, 3 Nov 2022 17:27:16 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 0/4] Linux user for 7.2 patches
Message-ID: <Y2QyNCvmKFRh91Pl@fedora>
References: <20221103084925.3860524-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+5y85AoNMBnS846D"
Content-Disposition: inline
In-Reply-To: <20221103084925.3860524-1-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--+5y85AoNMBnS846D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--+5y85AoNMBnS846D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNkMjMACgkQnKSrs4Gr
c8g+LAgAmNVLNEnRn0t0hseMb/PXtenBiw/B0TfZ1oFL/PUaGD2TcPUUFH3xJFmP
9qXaX+fztxd5kUZP71ng7qGcHjy9HzgI0TWqMvELn1ASqn+T4RyLckqByFSs+Nm2
po4ChAfVBGCT7oRYUkHH0yIVxMb3mMHf/qbcjrm6vcHRklJdKtP7pAJv4J6WfgDF
ePVseh06BzXFBkwA8uW7KECNhv9aCJPNDYxBTYgI8Mdqpv0tQYcY3loH2WMnPErL
15dvYcnWSs84bbBJyNb3uXebaqEHi1kAlbmkLve0rpLkGSNKV4dak8HmOt/HorG2
txy9WiedEEVWmcypLNIpI3G/rMG5BQ==
=CGwR
-----END PGP SIGNATURE-----

--+5y85AoNMBnS846D--


