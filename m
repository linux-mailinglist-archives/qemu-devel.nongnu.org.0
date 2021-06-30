Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417183B8192
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 14:02:28 +0200 (CEST)
Received: from localhost ([::1]:47392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyYvD-0005XX-0Z
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 08:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyYpP-0005mp-Vi
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyYpO-0000aL-9W
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625054185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zo60/A7wBx+SKwWFYJymE3Hufb7g65Xr8TcrehrXveo=;
 b=QyCvr8qm/mUf7DzTCWoNPYqSUjJZDlt0+9xFBIkUHhetkOw+CaSHa1h0hW2WWtaoszO5RJ
 cD5jQ2V9zqKx2O0LzMWPbkRWvkgya8j7OFdp9SHMwbhbh1Tw2KA4rwFcCM0J0SGqmdkQsh
 V+uhMTdt0bbx7ggAkETGU2YdlVki/70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-3A771TbCPQ2W5UPIkbR65w-1; Wed, 30 Jun 2021 07:56:24 -0400
X-MC-Unique: 3A771TbCPQ2W5UPIkbR65w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D7445074C;
 Wed, 30 Jun 2021 11:56:23 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-116.ams2.redhat.com
 [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50AE25D6AD;
 Wed, 30 Jun 2021 11:56:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] crypto patches
Date: Wed, 30 Jun 2021 12:56:05 +0100
Message-Id: <20210630115612.827664-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 13d5f87cc3b94bfccc501142df4a7b12fee3a6e7=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-axp-20210628' =
into staging (2021-06-29 10:02:42 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/tls-deps-pull-request=0D
=0D
for you to fetch changes up to 678bcc3c2cf22262d0a72b52da57737c4a40e040:=0D
=0D
  crypto: Make QCryptoTLSCreds* structures private (2021-06-29 18:30:24 +01=
00)=0D
=0D
----------------------------------------------------------------=0D
Hide build time dependancy on gnutls fom non-crypto code=0D
=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  crypto/tlscreds: Introduce qcrypto_tls_creds_check_endpoint() helper=0D
  block/nbd: Use qcrypto_tls_creds_check_endpoint()=0D
  qemu-nbd: Use qcrypto_tls_creds_check_endpoint()=0D
  chardev/socket: Use qcrypto_tls_creds_check_endpoint()=0D
  migration/tls: Use qcrypto_tls_creds_check_endpoint()=0D
  ui/vnc: Use qcrypto_tls_creds_check_endpoint()=0D
  crypto: Make QCryptoTLSCreds* structures private=0D
=0D
 block/nbd.c                        |  6 ++--=0D
 blockdev-nbd.c                     |  6 ++--=0D
 chardev/char-socket.c              | 18 ++++--------=0D
 crypto/tls-cipher-suites.c         |  7 +++++=0D
 crypto/tlscreds.c                  | 12 ++++++++=0D
 crypto/tlscredsanon.c              |  2 ++=0D
 crypto/tlscredspriv.h              | 45 ++++++++++++++++++++++++++++++=0D
 crypto/tlscredspsk.c               |  2 ++=0D
 crypto/tlscredsx509.c              |  1 +=0D
 crypto/tlssession.c                |  1 +=0D
 include/crypto/tls-cipher-suites.h |  6 ----=0D
 include/crypto/tlscreds.h          | 30 ++++++++++----------=0D
 include/crypto/tlscredsanon.h      | 12 --------=0D
 include/crypto/tlscredspsk.h       | 12 --------=0D
 include/crypto/tlscredsx509.h      | 10 -------=0D
 migration/tls.c                    |  6 +---=0D
 qemu-nbd.c                         | 19 +++++--------=0D
 ui/vnc.c                           |  7 +++--=0D
 18 files changed, 108 insertions(+), 94 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


