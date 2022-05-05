Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A4B51BBF6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:26:43 +0200 (CEST)
Received: from localhost ([::1]:49498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXkw-0005dQ-PK
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmX3z-0001zB-JG
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:42:19 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:51675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmX3x-0005IJ-SD
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651740136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rub30gitfmXm/MKIQrxgKC8XJcqGYXRKgOmj2sKKxd0=;
 b=gc97AIE8ey1Y3rGf9bxA8sHy2qKy1bdkVibX0iWaagqy/oXzE/hUIlOQOekivDcFQo8v4+
 SYOcOu85eXIIVvtfIkeEdsoP334KRkfujh8Ji3URtLD0LI+CSsiY5gh72SMVBCKE4/BCFh
 DroUhv4cYp+iDlQAvEWmjLs4mWg9W34=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-GcMLqqFRPyOMF8rmrx1uCA-1; Thu, 05 May 2022 04:42:15 -0400
X-MC-Unique: GcMLqqFRPyOMF8rmrx1uCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E230833964;
 Thu,  5 May 2022 08:42:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB9402166B17;
 Thu,  5 May 2022 08:42:09 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 0/3] Block patches
Date: Thu,  5 May 2022 09:42:05 +0100
Message-Id: <20220505084208.2338968-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.74; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 9cf289af47bcfae5c75de37d8e5d6fd23705322c:

  Merge tag 'qga-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-04 03:42:49 -0700)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to bef2e050d6a7feb865854c65570c496ac5a8cf53:

  util/event-loop-base: Introduce options to set the thread pool size (2022-05-04 17:02:19 +0100)

----------------------------------------------------------------
Pull request

Add new thread-pool-min/thread-pool-max parameters to control the thread pool
used for async I/O.

----------------------------------------------------------------

Nicolas Saenz Julienne (3):
  Introduce event-loop-base abstract class
  util/main-loop: Introduce the main loop into QOM
  util/event-loop-base: Introduce options to set the thread pool size

 qapi/qom.json                    |  43 ++++++++--
 meson.build                      |  26 +++---
 include/block/aio.h              |  10 +++
 include/block/thread-pool.h      |   3 +
 include/qemu/main-loop.h         |  10 +++
 include/sysemu/event-loop-base.h |  41 +++++++++
 include/sysemu/iothread.h        |   6 +-
 event-loop-base.c                | 140 +++++++++++++++++++++++++++++++
 iothread.c                       |  68 +++++----------
 util/aio-posix.c                 |   1 +
 util/async.c                     |  20 +++++
 util/main-loop.c                 |  65 ++++++++++++++
 util/thread-pool.c               |  55 +++++++++++-
 13 files changed, 419 insertions(+), 69 deletions(-)
 create mode 100644 include/sysemu/event-loop-base.h
 create mode 100644 event-loop-base.c

-- 
2.35.1


