Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360F563A5C6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:12:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozb6f-000132-Ls; Mon, 28 Nov 2022 05:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ozb6K-0000zW-NH
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:11:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ozb6J-000477-2U
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669630257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+34wfLERkrUT2wLp5PZ7bh/hRb99wI0pOCI/0RTCuU=;
 b=H0V8IEvB+JFgOQiKjvVwyf88MD5fp6pSGKgQjXjElBwXavqCFUEGUp8H9oYa91oD+vmZA1
 OaWVW1OeJFMnyIKIEaI4PeEiVFmfEokFyYm8yz8NUGfc03KFMKJypDobAlckQlczVz28Bj
 TlQ/habZCti4WI+4vndWqO75mqvnbAc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-UwKPSd8JNfqb2UhVLlVrqw-1; Mon, 28 Nov 2022 05:10:56 -0500
X-MC-Unique: UwKPSd8JNfqb2UhVLlVrqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 015C23C0F222
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 10:10:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C26C040C2088;
 Mon, 28 Nov 2022 10:10:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E26371800081; Mon, 28 Nov 2022 11:10:51 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 1/2] update seabios source from 1.16.0 to 1.16.1
Date: Mon, 28 Nov 2022 11:10:50 +0100
Message-Id: <20221128101051.1609044-2-kraxel@redhat.com>
In-Reply-To: <20221128101051.1609044-1-kraxel@redhat.com>
References: <20221128101051.1609044-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

git shortlog rel-1.16.0..rel-1.16.1
===================================

Gerd Hoffmann (3):
      malloc: use variable for ZoneHigh size
      malloc: use large ZoneHigh when there is enough memory
      virtio-blk: use larger default request size

Igor Mammedov (1):
      acpi: parse Alias object

Volker Rümelin (2):
      pci: refactor the pci_config_*() functions
      reset: force standard PCI configuration access

Xiaofei Lee (1):
      virtio-blk: Fix incorrect type conversion in virtio_blk_op()

Xuan Zhuo (2):
      virtio-mmio: read/write the hi 32 features for mmio
      virtio: finalize features before using device

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/seabios | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/seabios b/roms/seabios
index d239552ce722..3208b098f51a 160000
--- a/roms/seabios
+++ b/roms/seabios
@@ -1 +1 @@
-Subproject commit d239552ce7220e448ae81f41515138f7b9e3c4db
+Subproject commit 3208b098f51a9ef96d0dfa71d5ec3a3eaec88f0a
-- 
2.38.1


