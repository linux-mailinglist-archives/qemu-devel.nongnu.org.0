Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC365B05D0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 15:56:22 +0200 (CEST)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVvXR-0004YE-B4
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 09:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVvUt-0000jm-GP
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:53:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVvUp-0001du-7g
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662558817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8UuP7BuzhzvIZhQovh8nl33Ggwq6BP75DgIN9+YbkI=;
 b=bjodZ3rpGtnxDvvfWbdPZcYBkuY81iZIw1W8+sIFAX9+LnWZi4xCG9usIjxLaBcjh7qYnV
 wnU390NzyDr+etU/6UAg+Iu65BjenCTXLqa0swIfUxKZt64AnpJoLb74+XsgILOfextWI6
 x6FFnDxErYkuToe67UGQ1dNRQJ2XGDA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-Nc4-9vgCN8yIz_VCz1FLow-1; Wed, 07 Sep 2022 09:53:34 -0400
X-MC-Unique: Nc4-9vgCN8yIz_VCz1FLow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96BDE29DD984;
 Wed,  7 Sep 2022 13:53:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D58E2026D4C;
 Wed,  7 Sep 2022 13:53:32 +0000 (UTC)
Date: Wed, 7 Sep 2022 09:53:30 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com
Subject: Re: [PULL 00/44] riscv-to-apply queue
Message-ID: <YxiiWiCTc6rQlCdE@fedora>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+AnFiTyJ2Rv36uW4"
Content-Disposition: inline
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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


--+AnFiTyJ2Rv36uW4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--+AnFiTyJ2Rv36uW4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMYoloACgkQnKSrs4Gr
c8gxYQf/Qz0IEr68y6JYtou6/CD0QVxASRywd0n39hc6XodzHMWKh3s0633fNwVR
1jPalsdPk/MmyVE/y+Jszlc7N3/mU0L4B/+Hi/xoMrWEh5ZUrIqvqRi4hMiOnYhe
rZLSLIu46Efmc7WNcaRbYd8ZmiOohMiEX3F5a8vphX6iDUyNIinGJnPPizUyroQ2
9wCO5ax05MK5Hq7wMhBLUboCVbnMIAJddYErMjypvZU1Z0ERzFKPRmGpbDZ91mji
AgC6TbptnWNafitC/FG7g9N8+xDObdNGFzUruEQXJ4fd8Y6CeQ8P/ZvLxvRGnwh4
sOXFvkR4ve0R0kwNAe0x1Lj2jFWhfg==
=22VX
-----END PGP SIGNATURE-----

--+AnFiTyJ2Rv36uW4--


