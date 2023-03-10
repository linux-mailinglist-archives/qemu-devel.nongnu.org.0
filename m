Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289F96B4FA3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:56:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagxy-0003kQ-4S; Fri, 10 Mar 2023 12:55:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pagxw-0003jF-Fs
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:55:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pagxu-0002or-CZ
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678470936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mc5Y5YxCXsJsH0PQmAvF5KiZ/6RN/7RAGC4/mtM1NwA=;
 b=gAHqo2XFaDarR7VOtXu1eAYM8jxbvAPLUM0GSPygefs+RHnHBjZYUIYO1D4J+8BeEgwo4T
 01MZKPjdiwIN6J+tD0zKIWYZzcdEeSUz9ldqrid29/CX6UoY7NYl9SvgAVhEjpENEnmkDb
 H0FVU0SAegNsln+EkLqA2j/TKq/gLb0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-IQdAHu5xPSei-KMZLhljNg-1; Fri, 10 Mar 2023 12:55:33 -0500
X-MC-Unique: IQdAHu5xPSei-KMZLhljNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCE7285CBE2;
 Fri, 10 Mar 2023 17:55:32 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1507C1121318;
 Fri, 10 Mar 2023 17:55:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 0/3] Block layer patches
Date: Fri, 10 Mar 2023 18:55:26 +0100
Message-Id: <20230310175529.240379-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

The following changes since commit ee59483267de29056b5b2ee2421ef3844e5c9932:

  Merge tag 'qemu-openbios-20230307' of https://github.com/mcayland/qemu into staging (2023-03-09 16:55:03 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to ecf8191314798391b1df80bcb829c0ead4f8acc9:

  qed: remove spurious BDRV_POLL_WHILE() (2023-03-10 15:14:46 +0100)

----------------------------------------------------------------
Block layer patches

- fuse: Fix fallocate(PUNCH_HOLE) to zero out the range
- qed: remove spurious BDRV_POLL_WHILE()

----------------------------------------------------------------
Hanna Czenczek (2):
      block/fuse: Let PUNCH_HOLE write zeroes
      iotests/308: Add test for 'write -zu'

Stefan Hajnoczi (1):
      qed: remove spurious BDRV_POLL_WHILE()

 block/export/fuse.c        | 11 ++++++++++-
 block/qed.c                |  1 -
 tests/qemu-iotests/308     | 43 +++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/308.out | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+), 2 deletions(-)


