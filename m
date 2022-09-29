Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4256F5EFA9A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:32:32 +0200 (CEST)
Received: from localhost ([::1]:60848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwSc-00064t-RI
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odwLO-0004di-QZ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:25:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odwLL-0001ZK-PZ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664468697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wSv7tlL0SB6dznOVHtLsimBMwlCYGjRAmvq9x0smyzc=;
 b=ahLI302R9EJ+h/LHMSwY56dUu5aFQTtj/dYKvNvLogRwDOC8zwwGuWdqTL1sjkxNvsDke0
 vxuugRLobHQKNDN3FODjnU1s/5MH3aZo4q8TQMdYeZt4BNQ5RaS0ngIATmDCeodbb755mF
 t8AYtPV/LwlYJVLYaZBgbelc2YG/Dzc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-DwuzXFjwPnKeBesFlWEetg-1; Thu, 29 Sep 2022 12:24:55 -0400
X-MC-Unique: DwuzXFjwPnKeBesFlWEetg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 745163826247;
 Thu, 29 Sep 2022 16:24:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0D0A40EFB15;
 Thu, 29 Sep 2022 16:24:54 +0000 (UTC)
Date: Thu, 29 Sep 2022 10:48:02 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/1] xen queue 2022-09-27
Message-ID: <YzWwIkhtjDPoEK0C@fedora>
References: <20220927133559.30223-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="brGH33VcM4vveD4N"
Content-Disposition: inline
In-Reply-To: <20220927133559.30223-1-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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


--brGH33VcM4vveD4N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--brGH33VcM4vveD4N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM1sCIACgkQnKSrs4Gr
c8ipegf/ewXnaG7sXkV2jxDV4/eXOM7oLLkPp4gwXBX/eZjCbrsKbZHGwrhDrIkm
OfBqBxk+9P4f5P5S1/CdKVmH83wZd915ruQQkAVcxmELXSGuI60/CSQTtOupEZuN
yEpi3IsDyrGcgYV1TomVjBsK+KFUsAFBR/uDzncAOoRpJucsZTWOIhVQlvDF4OuL
gILYMmUtp/41FvKcrZ+tQ/nbR1P5LBkm29eM2RUXPIxz7R5uiqgO/U3EvwoH9oj+
fwMx6CZAqE+AvAvgIcisnC5IRh2HhCHRpt+Mmp9cX2wi7tNIE+DxIqugb6Hxf5c1
cVylHijs2pVMAd/Dap/2NvwbVmGkXA==
=9A/y
-----END PGP SIGNATURE-----

--brGH33VcM4vveD4N--


