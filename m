Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30445FE35B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:34:43 +0200 (CEST)
Received: from localhost ([::1]:51338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj4ug-0003Ln-3A
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj4pX-00073U-RL
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj4pV-0001Rs-Kp
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665692960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B3lTfP4pqWvS0lNWBKGPb9ysz4ETO91qqY0+p62sXBM=;
 b=ETyCYOUDQIs79PaqHMve/gqAiGbb6wpggeLkfxZ5QLDWtN7rf6uPTQ2p+iPTlSs/S2nTRj
 PZtoIRRVNZP1cOnitwysYTt0d0jNdiRWgGu5D3NjPg/sGw5VjRmPBqCaHnrcWcwa9mKMnM
 88dWOvsYUNKEac7w3Q+9eWofrsVK1iM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-QGn-DA8tO4qkPCDxcmhtbQ-1; Thu, 13 Oct 2022 16:29:14 -0400
X-MC-Unique: QGn-DA8tO4qkPCDxcmhtbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CA8E3C1014F;
 Thu, 13 Oct 2022 20:29:14 +0000 (UTC)
Received: from localhost (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3525F20A8DC1;
 Thu, 13 Oct 2022 20:29:12 +0000 (UTC)
Date: Thu, 13 Oct 2022 16:29:11 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PULL 00/26] Kraxel 20221013 patches
Message-ID: <Y0h1FwTmebJz9olY@fedora>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CAbhMSMATS0U/92S"
Content-Disposition: inline
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--CAbhMSMATS0U/92S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--CAbhMSMATS0U/92S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNIdRYACgkQnKSrs4Gr
c8inFAf8C8o6tV9m8u2zfi0Co686Vx9HvhcVE9a/rt9s5fhvtkyMZzwb/fBRZ9z7
l+fG7NbWd4PaQLwRLdsf2C2fWlfcGSvvF4WzymTmN3qygfZ10tDcjoPxbjX4Z2hl
lPJkC7+dqVbQgeIUfK634Km0bZP0JHPADOK30pDiYU6/NSFJQ+X9uZQ5+vnakfUr
P2A+Arq+aoU4R1059Vq8JZHFDwRYsQyCZvm5UXxUe6UB0hDDMb+LXVoyslTq1K56
10dd42Le8eJQ1eUp1/PPShMnpD008ll7oKPfXQOGPFgYAz5AnZqIIjlLbg/tdon+
xmT1fC5HHFecaCaYY+VzCeWUVrYSFA==
=xKyn
-----END PGP SIGNATURE-----

--CAbhMSMATS0U/92S--


