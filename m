Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC0A40F44B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 10:41:04 +0200 (CEST)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9Qd-0000Cr-Tb
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 04:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mR9AW-0008VI-As
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mR9AU-0007JN-K8
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631867061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x3c0bXHT6Vb7ulX35KxhmZjUNyossZFsL4Jntgkn0NI=;
 b=Tuidl2sN4GgXJ8evTKeDFJ23sG2yB71uQMZblYnrWjBE0F67vElQSiPsIXHbxAWUWqW4Ft
 K3tjAOOS+Jau4KtGDd1Ddstgme9AmmqJTHjjLL6ChJvIVPYJliSOlK9CFWISvzMAu9BOk8
 hKT5Hso+Uy7Sz49C7j6hrd8OqVPfamU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-DkuRAxuPMVqpFV-f_4nrww-1; Fri, 17 Sep 2021 04:24:17 -0400
X-MC-Unique: DkuRAxuPMVqpFV-f_4nrww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1022D835DE0;
 Fri, 17 Sep 2021 08:24:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-234.pek2.redhat.com
 [10.72.12.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6C825D6B1;
 Fri, 17 Sep 2021 08:24:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 0/2] Net patches
Date: Fri, 17 Sep 2021 16:24:10 +0800
Message-Id: <20210917082412.75470-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d1fe59377bbbf91dfded1f08ffe3c636e9db8dc0:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.2-pull-request' into staging (2021-09-16 16:02:31 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to bedd7e93d01961fcb16a97ae45d93acf357e11f6:

  virtio-net: fix use after unmap/free for sg (2021-09-17 16:07:52 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Jason Wang (1):
      virtio-net: fix use after unmap/free for sg

Paolo Bonzini (1):
      ebpf: only include in system emulators

 ebpf/meson.build    |  2 +-
 hw/net/virtio-net.c | 39 ++++++++++++++++++++++++++++++++-------
 2 files changed, 33 insertions(+), 8 deletions(-)


