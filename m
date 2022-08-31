Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B76C5A89A5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 01:56:17 +0200 (CEST)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTXZ9-00012t-Q2
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 19:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oTXXg-0007w0-St
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 19:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oTXXd-0003Nq-8N
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 19:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661990080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kUfdy358H7Z1VERvqHj8xCIH76haP1nM5P014eM0e/Y=;
 b=RZ7JtHGN8drR1x9BxPr9MjCUH00td4GgNdcxoqw8y1ZTMfo7APGJyknsy+EILoy1aZ5/V7
 DRfsFsuzyGJqvGyXxc77vpS2Gl20pRIeOt0DtP1fXgKXZ0f8iGyCGoLYdYG4pZs5uj7OK0
 u1NM8zdjJrYgSlm8G3A1OiW7cu9PH9E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-V6nEsXQlN66rn2SMmMy9oA-1; Wed, 31 Aug 2022 19:54:39 -0400
X-MC-Unique: V6nEsXQlN66rn2SMmMy9oA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 982AC85A585;
 Wed, 31 Aug 2022 23:54:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0268540D282E;
 Wed, 31 Aug 2022 23:54:37 +0000 (UTC)
Date: Wed, 31 Aug 2022 19:54:35 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/23] First testing patches for QEMU 7.2
Message-ID: <Yw/0u/jv98HKXrt7@fedora>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+eI4eMIz1VFNypCf"
Content-Disposition: inline
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--+eI4eMIz1VFNypCf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--+eI4eMIz1VFNypCf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMP9LsACgkQnKSrs4Gr
c8gQGQgAj6DUfs94+kEbrwlr7G15FgGTsNUl4tmv8V9LH0gV/gl5khJNcEkMYQCY
xGOzNNvopJ32Smc6N5F+NvdS5QpBOveRbfWUdUAU74lpjC6i+zCN2vx4XMc6xav1
WoD44LJuxPGBHq+0ixFbMn+UZKTar1WXbtsSGJWflvp2pLRUpKL+q3EfzKNxc+aO
WkXQNwAW3OOLaaZXbyGZzmW86AAnitwlKPpcJF82IUws0kbi5SuSHo1WauvcKopS
VlhnjYvFn37T6+C6OdgAbznHzKCWaNJlaJ/FSKUiI9ZMMpPlY9weY/CIxts/yXeI
nGtDU0UNoEn3DkSCpncYKnboPLOW3g==
=+bys
-----END PGP SIGNATURE-----

--+eI4eMIz1VFNypCf--


