Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FC72F47A7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:35:39 +0100 (CET)
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzcZ0-0001mj-Hh
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcUk-0005jE-Es
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:31:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcUd-0002uk-Pm
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610530266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KvhlDdfBGWu6AhQ7NsEqQcf75MMZzJGduUWZpTAioDI=;
 b=grwqZDMwOZObcbcIU5DubDmqCWe/cQphRII15q3eT1cSPYmjKB5eTUQa/K/UQM4wvaz2S1
 nNmpWRNXEj8tNAnp0TmZqt5njMcYbuL2xosRONl48gDh28TuPOcc68t5OrEPrEvVBTmVJ3
 8Z/Ue7OOOeY6AAknsFkF8alk+904oKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-ji4ANzAEMqeNK0Oge6N_gw-1; Wed, 13 Jan 2021 04:31:04 -0500
X-MC-Unique: ji4ANzAEMqeNK0Oge6N_gw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B39C80A5C0;
 Wed, 13 Jan 2021 09:31:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F21C5100164C;
 Wed, 13 Jan 2021 09:31:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7E25F11386A7; Wed, 13 Jan 2021 10:31:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Yank patches patches for 2021-01-13
Date: Wed, 13 Jan 2021 10:30:54 +0100
Message-Id: <20210113093101.550964-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: peter.maydell@linaro.org, lukasstraub2@web.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This pull request is on behalf of Lukas.  Hope that's okay.

The following changes since commit f8e1d8852e393b3fd524fb005e38590063d99bc0:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210112-1' into staging (2021-01-12 21:23:25 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-yank-2021-01-13

for you to fetch changes up to 91d48e520a4a4f72e97aeb333029694f5d57cc93:

  tests/test-char.c: Wait for the chardev to connect in char_socket_client_dupid_test (2021-01-13 10:21:17 +0100)

----------------------------------------------------------------
Yank patches patches for 2021-01-13

----------------------------------------------------------------
Lukas Straub (7):
      Introduce yank feature
      block/nbd.c: Add yank feature
      chardev/char-socket.c: Add yank feature
      migration: Add yank feature
      io/channel-tls.c: make qio_channel_tls_shutdown thread-safe
      io: Document qmp oob suitability of qio_channel_shutdown and io_shutdown
      tests/test-char.c: Wait for the chardev to connect in char_socket_client_dupid_test

 qapi/qapi-schema.json         |   1 +
 qapi/yank.json                | 119 ++++++++++++++++++++++++
 include/io/channel.h          |   5 +-
 include/qemu/yank.h           |  97 ++++++++++++++++++++
 block/nbd.c                   | 153 ++++++++++++++++++-------------
 chardev/char-socket.c         |  34 +++++++
 io/channel-tls.c              |   6 +-
 migration/channel.c           |  13 +++
 migration/migration.c         |  22 +++++
 migration/multifd.c           |  10 ++
 migration/qemu-file-channel.c |   7 ++
 migration/savevm.c            |   5 +
 tests/test-char.c             |   1 +
 util/yank.c                   | 207 ++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   7 ++
 qapi/meson.build              |   1 +
 util/meson.build              |   1 +
 17 files changed, 625 insertions(+), 64 deletions(-)
 create mode 100644 qapi/yank.json
 create mode 100644 include/qemu/yank.h
 create mode 100644 util/yank.c

-- 
2.26.2


