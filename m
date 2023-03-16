Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2801C6BCD09
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:41:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcl2t-00069b-1i; Thu, 16 Mar 2023 06:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pcl2j-00068j-K4
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:41:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pcl2h-0004WL-LW
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678963266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L8tPkc4uFXLuJi0to2h73EKa3P/UMTNdBwP1HwObQO8=;
 b=cSoUFI35n46XujYdmp/TODoRVmTazjzx0zKjo9AKT+LGFoQCWCZ+Kyk8Y7akD0nophEEAk
 osn2RVhNBFjwy2c5EfY6bF7qydfB7tC22ePPKRhlw/8ldf8JHdMBW4JyXvIvPzaWQUGDmD
 gDFtxk5deCgTZfTcZrAI/CUbObQhILU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-6tr4EtlxNEibmPlzVsoHAA-1; Thu, 16 Mar 2023 06:39:59 -0400
X-MC-Unique: 6tr4EtlxNEibmPlzVsoHAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63FA4185A78B
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 10:39:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33EAF40C6E67;
 Thu, 16 Mar 2023 10:39:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A2A271801CF6; Thu, 16 Mar 2023 11:39:57 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 0/2] Seabios 1.16.2 20230316 patches
Date: Thu, 16 Mar 2023 11:39:55 +0100
Message-Id: <20230316103957.1665713-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

The following changes since commit 652737c8090eb3792f8b4c4b22ab12d7cc32073f:

  Update version for v8.0.0-rc0 release (2023-03-14 19:25:05 +0000)

are available in the Git repository at:

  https://gitlab.com/kraxel/qemu.git tags/seabios-1.16.2-20230316-pull-request

for you to fetch changes up to d80d761daa1674cfe86b79e1b2043fa21f010f8e:

  update seabios binaries to 1.16.2 (2023-03-16 11:04:18 +0100)

----------------------------------------------------------------
update seabios to 1.16.2

----------------------------------------------------------------

Gerd Hoffmann (2):
  update seabios submodule to 1.16.2
  update seabios binaries to 1.16.2

 pc-bios/bios-256k.bin             | Bin 262144 -> 262144 bytes
 pc-bios/bios-microvm.bin          | Bin 131072 -> 131072 bytes
 pc-bios/bios.bin                  | Bin 131072 -> 131072 bytes
 pc-bios/vgabios-ati.bin           | Bin 39936 -> 39936 bytes
 pc-bios/vgabios-bochs-display.bin | Bin 28672 -> 28672 bytes
 pc-bios/vgabios-cirrus.bin        | Bin 39424 -> 39424 bytes
 pc-bios/vgabios-qxl.bin           | Bin 39936 -> 39936 bytes
 pc-bios/vgabios-ramfb.bin         | Bin 29184 -> 29184 bytes
 pc-bios/vgabios-stdvga.bin        | Bin 39936 -> 39936 bytes
 pc-bios/vgabios-virtio.bin        | Bin 39936 -> 39936 bytes
 pc-bios/vgabios-vmware.bin        | Bin 39936 -> 39936 bytes
 pc-bios/vgabios.bin               | Bin 39424 -> 39424 bytes
 roms/seabios                      |   2 +-
 13 files changed, 1 insertion(+), 1 deletion(-)

-- 
2.39.2


