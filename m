Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7980C6203E9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osBnm-0007bv-PF; Mon, 07 Nov 2022 18:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osBnk-0007bZ-CX
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osBnV-0000Ia-1O
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667864695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJ0rRAbekgznuGYfkqgNeN7bnf5bf46QqFqCBgCmJY8=;
 b=Yt8Oooya0fTccm3N1yAoOJEQSGWv3luELgtYaluxQLWwo3oV4wwL/rLANGfLacJjEpmE2U
 rvOUPS8pGyMaWkefu2kIy4796fzvo0XQGJ6E9bIipqu/6ZPHWoAsgd2RaomK7u1jsHf9T3
 /9Wh+RFlBaLofbSLppFS2lxlI5DLHK4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-QJdJMjzMODqzu9a0o1aRRg-1; Mon, 07 Nov 2022 18:44:52 -0500
X-MC-Unique: QJdJMjzMODqzu9a0o1aRRg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC4BF85A583;
 Mon,  7 Nov 2022 23:44:51 +0000 (UTC)
Received: from localhost (unknown [10.39.194.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34780492B05;
 Mon,  7 Nov 2022 23:44:50 +0000 (UTC)
Date: Mon, 7 Nov 2022 18:44:49 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, stefanha@gmail.com
Subject: Re: [PULL 0/2] loongarch for 7.2 patches
Message-ID: <Y2mYcX1YigQdSq0U@fedora>
References: <20221107033250.4163885-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="T3JnR2HkcA2iTxTT"
Content-Disposition: inline
In-Reply-To: <20221107033250.4163885-1-gaosong@loongson.cn>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


--T3JnR2HkcA2iTxTT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--T3JnR2HkcA2iTxTT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNpmHAACgkQnKSrs4Gr
c8iEkgf/aC0b7HCR4wl6COmjLFCTgpfwHKVTsqgA+GySAkAMtR/WpYrRsBahx7B8
Xif4xK0sDerRf//lsyt+36Ku7BERk79tbnJCKb1VkRYMR3haYih8FMaN5qMj07lZ
cfo240xXQVxjhpn2Trz1BXqPeVGxuSIGxpMP5Jl2FAz6FK8nh13Wa9URqt1+UXCV
LVAgo8h9ujWTuleAaYo/KSt5o9osxCfj/NkB/u6/IzQTbwmwYeWXxQMO7K3WGGYa
WCS8QN7woIQQeSLlU5XUC70PdU7qmuL8wiYL6O8iK4zNjA+0OrT7WS3CfzBU38T9
p93SmwoMKhzMATKQzHbrqxtRXUjWow==
=B1Rc
-----END PGP SIGNATURE-----

--T3JnR2HkcA2iTxTT--


