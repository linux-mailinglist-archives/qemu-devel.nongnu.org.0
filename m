Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD543A87FD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:45:15 +0200 (CEST)
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltD7i-0005fQ-Ld
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltD3T-00089i-4Z
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltD3Q-0003Nb-7G
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9b0ybEge0z0HM61Ta7DOgQNNNVeYzpITOTJ0BjcIIlI=;
 b=WN6iRVxtpWpsm6EshrT/aMwv+xVujB13BJ3XxqL9KYxAMFk8Zm2uZv0UCerUQgZceNekA9
 ibIXWyEJ0xaCWERt0TufNcETf8LZLqS2SQbrtgIQqo8bmQxHN48u/n8ciwPyXGavfTCsVq
 mcnafpSjnFPvSU8TrgUfZL54Qj4TDww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-E5OkwY8uPoadyAeAg2XX-g-1; Tue, 15 Jun 2021 13:40:41 -0400
X-MC-Unique: E5OkwY8uPoadyAeAg2XX-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACE16C7446
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 17:40:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C63315D6AD;
 Tue, 15 Jun 2021 17:40:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D130818000B2; Tue, 15 Jun 2021 19:40:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Vga 20210615 patches
Date: Tue, 15 Jun 2021 19:40:22 +0200
Message-Id: <20210615174025.3409518-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2=
:=0D
=0D
  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pul=
l-request' into staging (2021-06-14 15:59:13 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/vga-20210615-pull-request=0D
=0D
for you to fetch changes up to 4fa7b4cc500e1fbd8c11e65548b7713db81e75ff:=0D
=0D
  virtio-gpu: move scanout_id sanity check (2021-06-15 07:16:56 +0200)=0D
=0D
----------------------------------------------------------------=0D
vga: fixes for stdvga, vhost-user-gpu and virtio-gpu.=0D
=0D
----------------------------------------------------------------=0D
=0D
Dennis W=C3=B6lfing (1):=0D
  vga: Allow writing VBE_DISPI_ID5 to ID register=0D
=0D
Gerd Hoffmann (2):=0D
  vhost-user-gpu: reorder free calls.=0D
  virtio-gpu: move scanout_id sanity check=0D
=0D
 contrib/vhost-user-gpu/vhost-user-gpu.c |  2 +-=0D
 hw/display/vga.c                        |  3 ++-=0D
 hw/display/virtio-gpu.c                 | 20 ++++++++++++++------=0D
 3 files changed, 17 insertions(+), 8 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


