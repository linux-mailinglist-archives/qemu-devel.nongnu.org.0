Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4485EC9AC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:37:42 +0200 (CEST)
Received: from localhost ([::1]:47904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDaW-00019E-Po
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odC8S-0006DP-Ue
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odC8P-000813-Uy
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664291072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+lr0lq37fPUfgqiasybK9i9pDYPdb3zUSvxIy8be5Ak=;
 b=Sc3ebhVqXxDl3hNotwIabW2DlFR6CqM2SUhUmHeRPgRFs9cp0HOo8rSRvidMaSxrb3+xWi
 wKjEzcxjWXQZVh1bKgnYv9AHNBjCxLuUOtJ43rHp3BzPRps8U84tg3LFLe/SbEB6rf+JMr
 YA6Xc6hS9I9nqWXk+4ieARNxaeNA/5k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-3IzSIU6EO3KtiD4NsBk9ow-1; Tue, 27 Sep 2022 11:04:28 -0400
X-MC-Unique: 3IzSIU6EO3KtiD4NsBk9ow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 828D2811E87;
 Tue, 27 Sep 2022 15:04:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1CFB40C6EC2;
 Tue, 27 Sep 2022 15:04:25 +0000 (UTC)
Date: Tue, 27 Sep 2022 11:04:23 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/24] Kraxel 20220927 patches
Message-ID: <YzMQ97/OkHDZ72VL@fedora>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RI/uwxQXBCFb4wAC"
Content-Disposition: inline
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


--RI/uwxQXBCFb4wAC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--RI/uwxQXBCFb4wAC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMzEPcACgkQnKSrs4Gr
c8i7PAgAuUS1vsWD5zVTwa+0e2Z0ix3t9Yn68kwUNw45dLtd3lQ87ZkdvxiHOmyZ
1723TZGEYx82qVDT++oRaZXaGGTu4nZo6cxhygq2D/GzUb7pM/NnuPIwtKlEhcL1
2R1EjGKHqtTu9FemIfee882Gci1VKF2pHjD1AjCUQCiDMy7xQdblHm6Fs+3vlaMB
uvKvarRtcTrbY+0uno4cUjpJa4+/5ks7onffnrJg28koAW6weZKYoVAeBuvyooyF
WELOycESV2mvkpmKwNhin+Bn8mmJ6dnp2XE2JDn5CD2mz0T95nXH10nVsX2JItaE
+zsIOSOERJO/DyayA9ElQ1VBX2uYbQ==
=NfiB
-----END PGP SIGNATURE-----

--RI/uwxQXBCFb4wAC--


