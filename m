Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1993E8A4C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:43:55 +0200 (CEST)
Received: from localhost ([::1]:44140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDhxy-0007Vf-U6
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhvr-0004y7-Ng
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhvq-0006aJ-4I
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628664101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9imqI9oKG05AOneXsyCSLw187r/zkFlyVrOYNG+JuoA=;
 b=YCX9D+YrWiDOboCWwzo7X6haDcy7GR1NE9apjneZHLIlcpNhYcA+SfEo5pXcKxkeYkwz1J
 hOwbC2nGPPDzRw25CCAkk5wmi9r6IFubPHM4xWikTst7L1N4hpELRZG0HgR9A734ahOUYu
 iils9RMmlUDPyTkAeeZfsmd0RJ6GTqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-gq4NCeKBO9-DnGc97eX67Q-1; Wed, 11 Aug 2021 02:41:39 -0400
X-MC-Unique: gq4NCeKBO9-DnGc97eX67Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 052588799EB
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 06:41:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E8285D9CA;
 Wed, 11 Aug 2021 06:41:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 70D0B180063A; Wed, 11 Aug 2021 08:41:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Maintainers 20210811 patches
Date: Wed, 11 Aug 2021 08:41:21 +0200
Message-Id: <20210811064128.2776317-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71=
:=0D
=0D
  Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/maintainers-20210811-pull-request=0D
=0D
for you to fetch changes up to a4de5e8a0667e3ee43ca9953ec7fd11ff19f2c92:=0D
=0D
  MAINTAINERS: update virtio-gpu entry. (2021-08-11 08:39:16 +0200)=0D
=0D
----------------------------------------------------------------=0D
MAINTAINERS: update kraxel's entries.=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (7):=0D
  MAINTAINERS: update edk2 entry.=0D
  MAINTAINERS: update sockets entry.=0D
  MAINTAINERS: update audio entry.=0D
  MAINTAINERS: update spice entry.=0D
  MAINTAINERS: update usb entries.=0D
  MAINTAINERS: update virtio-input entry.=0D
  MAINTAINERS: update virtio-gpu entry.=0D
=0D
 MAINTAINERS | 16 ++++++++--------=0D
 1 file changed, 8 insertions(+), 8 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


