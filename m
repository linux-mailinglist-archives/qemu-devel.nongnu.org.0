Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012463A5C4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:12:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozb6h-00015S-PQ; Mon, 28 Nov 2022 05:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ozb6K-0000zX-Vk
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:11:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ozb6J-000479-2P
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669630258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=373rFYTQearqzIa/iBArekdYagJPxJtQqb2ywjvyi2Y=;
 b=cRTyFXu9uRS90OLPq51WwpOg3X/fmjG0+PSY5HbAXZ2PbRH9Z0UH58GngD2PdqgFDQjJAC
 uujX5wgYMBgBErcKgCbFo72mmgM9OTw+wjIt+jpQezYm6QnhE18//KCe/UywPABCf6Sb5/
 6gJXjb59qHmw/IC60GS/vnGT+lERqd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-qKy9pAGUMMa_9GI803R-4Q-1; Mon, 28 Nov 2022 05:10:56 -0500
X-MC-Unique: qKy9pAGUMMa_9GI803R-4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05D8B811E75
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 10:10:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C07E9112132D;
 Mon, 28 Nov 2022 10:10:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D7E021800080; Mon, 28 Nov 2022 11:10:51 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 0/2] Seabios 1.16.1 20221128 patches
Date: Mon, 28 Nov 2022 11:10:49 +0100
Message-Id: <20221128101051.1609044-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 7c09a7f6ae1770d15535980d15dffdb23f4d9786:

  Update VERSION for v7.2.0-rc2 (2022-11-22 18:59:56 -0500)

are available in the Git repository at:

  https://gitlab.com/kraxel/qemu.git tags/seabios-1.16.1-20221128-pull-request

for you to fetch changes up to a704cb59fd87cd015177a823974ca2380aac6bfd:

  update seabios binaries to 1.16.1 (2022-11-28 11:06:05 +0100)

----------------------------------------------------------------
[for-7.2] update seabios to bugfix release 1.16.1

----------------------------------------------------------------

Gerd Hoffmann (2):
  update seabios source from 1.16.0 to 1.16.1
  update seabios binaries to 1.16.1

 pc-bios/bios-256k.bin             | Bin 262144 -> 262144 bytes
 pc-bios/bios-microvm.bin          | Bin 131072 -> 131072 bytes
 pc-bios/bios.bin                  | Bin 131072 -> 131072 bytes
 pc-bios/vgabios-ati.bin           | Bin 39936 -> 39936 bytes
 pc-bios/vgabios-bochs-display.bin | Bin 28672 -> 28672 bytes
 pc-bios/vgabios-cirrus.bin        | Bin 39424 -> 39424 bytes
 pc-bios/vgabios-qxl.bin           | Bin 39424 -> 39936 bytes
 pc-bios/vgabios-ramfb.bin         | Bin 28672 -> 29184 bytes
 pc-bios/vgabios-stdvga.bin        | Bin 39424 -> 39936 bytes
 pc-bios/vgabios-virtio.bin        | Bin 39424 -> 39936 bytes
 pc-bios/vgabios-vmware.bin        | Bin 39424 -> 39936 bytes
 pc-bios/vgabios.bin               | Bin 38912 -> 39424 bytes
 roms/seabios                      |   2 +-
 13 files changed, 1 insertion(+), 1 deletion(-)

-- 
2.38.1


