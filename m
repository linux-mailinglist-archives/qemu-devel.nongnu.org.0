Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63E6A8630
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:21:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlf8-0005rJ-Gb; Thu, 02 Mar 2023 11:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlf4-0005aL-1P
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:20:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlf1-0001Ae-JI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IaJVYGTgDnYhj3pDxPsXjQBKpeEv1wv6K4l4+FiScLY=;
 b=fCuMal+/5dErSUeS34kBk0NP6y4wPPCqUtDAbY1kkiJ9uBMn/ZOvQel9gml77ZGFPUfOpL
 EsY1F5GbgPZyQu1r8vndwZ5gNfD4HCam7cyod5H4/arIT8n9lGwLucBzX3yHcL+RUG+T8Z
 QZbG37WaQ4GILfc+1mPlVHfmAQ6y+zk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-LAhZj0VsP_mYB6Jkjw0XpA-1; Thu, 02 Mar 2023 11:20:01 -0500
X-MC-Unique: LAhZj0VsP_mYB6Jkjw0XpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A290C87A388
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:20:00 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1272540C6EC4;
 Thu,  2 Mar 2023 16:19:59 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 0/2] Migration 20230302 patches
Date: Thu,  2 Mar 2023 17:19:57 +0100
Message-Id: <20230302161959.9844-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

The following changes since commit 262312d7ba6e2966acedb4f9c134fd19176b4083:

  Merge tag 'pull-testing-next-010323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-02 13:02:53 +0000)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230302-pull-request

for you to fetch changes up to c31772ad6883533757d2a7dfe9ce24325e3ec16c:

  Fix exec migration on Windows (w32+w64). (2023-03-02 17:06:27 +0100)

----------------------------------------------------------------
Migraiton Pull request

Hi

This pull requests include:
- use-after-free in test-vmstate (eric)
- fix exec migration in windows (berberian)

Please apply.

----------------------------------------------------------------

Eric Auger (1):
  test-vmstate: fix bad GTree usage, use-after-free

John Berberian, Jr (1):
  Fix exec migration on Windows (w32+w64).

 migration/exec.c          | 24 ++++++++++++++++++++++++
 tests/unit/test-vmstate.c |  5 ++---
 2 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.39.2


