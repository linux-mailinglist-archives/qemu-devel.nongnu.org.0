Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FE14B2C69
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:07:11 +0100 (CET)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIaK6-0002XL-VX
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIaCS-0003Kb-Bu
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 12:59:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIaCN-0006ip-Kb
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 12:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644602351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cJIO192j2eNbBb2RiBlWsrKnpelYqYrKvXmF2xf/XsY=;
 b=YV6NhlNeOeVpVzxlUQgJFBZt6Zwk0urZkLEjW/uOlgT7WFbTpAInUyR+HBYGD4pU/zmT6+
 hyFul1FjNpOMgaQN99uTQMTNk+OUA7eCgGWY67fnA8HxNJ0qQSCGXsIsg7dZIgGzU3K7bF
 XoCIBbVdIrXjW/M0cvc1ugiUOrTRFKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652--O4OHx0BObyaXmSYk98b-Q-1; Fri, 11 Feb 2022 12:59:05 -0500
X-MC-Unique: -O4OHx0BObyaXmSYk98b-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E97181091DA0;
 Fri, 11 Feb 2022 17:59:04 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D34CD78ABC;
 Fri, 11 Feb 2022 17:59:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/3] Block layer patches
Date: Fri, 11 Feb 2022 18:58:51 +0100
Message-Id: <20220211175854.153798-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)

are available in the Git repository at:

  https://gitlab.com/kmwolf/qemu.git tags/for-upstream

for you to fetch changes up to fdb8541b2e4f6ff60f435fbb5a5e1df20c275a86:

  hw/block/fdc-isa: Respect QOM properties when building AML (2022-02-11 17:37:26 +0100)

----------------------------------------------------------------
Block layer patches

- Fix crash in blockdev-reopen with iothreads
- fdc-isa: Respect QOM properties when building AML

----------------------------------------------------------------
Bernhard Beschow (1):
      hw/block/fdc-isa: Respect QOM properties when building AML

Kevin Wolf (2):
      block: Lock AioContext for drain_end in blockdev-reopen
      iotests: Test blockdev-reopen with iothreads and throttling

 blockdev.c                 | 11 ++++++++++-
 hw/block/fdc-isa.c         | 11 +++++++----
 tests/qemu-iotests/245     | 36 +++++++++++++++++++++++++++++++++---
 tests/qemu-iotests/245.out |  4 ++--
 4 files changed, 52 insertions(+), 10 deletions(-)


