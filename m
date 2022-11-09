Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5AD6234E0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 21:48:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osryT-0003DL-B1; Wed, 09 Nov 2022 15:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osryP-0003BE-KU
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 15:47:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osryK-00063C-AL
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 15:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668026814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nmZ4hLJKzNfBufvtN9NUdZ1cCeJub2/vyvpFg5eb4RI=;
 b=IcnH9TO41Bp6dE+awpG4Esr6QiAtd7KeAXMKQM1Xv1RwvZN3JSS0j4ESd+JDOR9pgAV4M6
 VvBJoQKENUiHMFicEU1PMn9cm+IlBVDfxqaF1Ugn1rY6lcZTa0THQBW2Ib+sqiUx4sBqgT
 CNOtNZIdGbRUieHTjCvVBCiHpCcoHWw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-6owTVWaWPzy26U4GEyFCXg-1; Wed, 09 Nov 2022 15:46:51 -0500
X-MC-Unique: 6owTVWaWPzy26U4GEyFCXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D77AD101A528;
 Wed,  9 Nov 2022 20:46:50 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B51E1121320;
 Wed,  9 Nov 2022 20:46:49 +0000 (UTC)
Date: Wed, 9 Nov 2022 15:46:48 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL for-7.2 0/2] tcg patch queue
Message-ID: <Y2wRuHurgB8w0/Vh@fedora>
References: <20221109070224.13073-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DexFvDn2+epLzk7k"
Content-Disposition: inline
In-Reply-To: <20221109070224.13073-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--DexFvDn2+epLzk7k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--DexFvDn2+epLzk7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNsEbgACgkQnKSrs4Gr
c8iG7wf9FJkC7ShzWLUNPeEH/gZFwhUfIUAeiVqayhlg3LnGuq9RczDXC7W3ymmr
QVSOfk0cMXkuykeij4dDkofnyEonOAS8gzrKy6npA9wAMOIEqWY2gNlmWt6eRDw8
14zfkfAqsklSpA4dInToVHSBmuML6d0YnOzMHDmlv9sFM1nPw8+f3QC4Da0+IOa9
yURX1NRzp6YprKJyBmWSK98odqOWxLkRlp5fmF3/8dKzV2/7vChicAg+DTqM9ZlQ
AW/lMvhN9wCQNWfJQ4pocvX8TxXV5Oj3sGTBMWn6of4lPse2R5uWQ4f+Skzkyceb
ubAiaVM+bwxq69cVMZQw29wzWYM35g==
=Melc
-----END PGP SIGNATURE-----

--DexFvDn2+epLzk7k--


