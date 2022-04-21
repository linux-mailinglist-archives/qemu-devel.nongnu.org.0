Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACCB50A00C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:52:40 +0200 (CEST)
Received: from localhost ([::1]:50296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWIZ-0001eN-9F
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWEu-0005nM-Bj
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:48:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWEq-00037T-Kx
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650545323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Lu9ht8ZwpW2IlCNygUl5XV/JJNrRqgZnHJwDl1Q2pgQ=;
 b=d9+6xomD13vs7EQOblVtGJpqkl8Ea5BDi8VqTmqmwJGLGPCtQQq4mBgHjzoYrtqVzOuOlc
 1iEi7RX4xN5IqgXaYN5ydYXEbQMi4erRGtD4bmZkiBtuuP6wKs8IWvjvNH2qGlAzfybBpR
 lhSxUBytMCjd2wHvnflhHM3/PypTGVE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-P6BG47jWM9eRuhXO9wrsUA-1; Thu, 21 Apr 2022 08:48:40 -0400
X-MC-Unique: P6BG47jWM9eRuhXO9wrsUA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE6EA1C0E0F1;
 Thu, 21 Apr 2022 12:48:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB90E415F50;
 Thu, 21 Apr 2022 12:48:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] Dump patches
Date: Thu, 21 Apr 2022 16:48:22 +0400
Message-Id: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 viktor.prutyanov@redhat.com, richard.henderson@linaro.org,
 frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 9c125d17e9402c232c46610802e5931b3639d77b:

  Merge tag 'pull-tcg-20220420' of https://gitlab.com/rth7680/qemu into staging (2022-04-20 16:43:11 -0700)

are available in the Git repository at:

  git@gitlab.com:marcandre.lureau/qemu.git tags/dump-pull-request

for you to fetch changes up to 6df5f4c69ac5143e5f468123e6336c46da164bce:

  dump/win_dump: add 32-bit guest Windows support (2022-04-21 16:43:06 +0400)

----------------------------------------------------------------
dump queue

Hi

The "dump" queue, with:
- [PATCH v3/v4 0/9] dump: Cleanup and consolidation
- [PATCH v4 0/4] dump: add 32-bit guest Windows support

----------------------------------------------------------------

Janosch Frank (9):
  dump: Use ERRP_GUARD()
  dump: Remove the sh_info variable
  dump: Introduce shdr_num to decrease complexity
  dump: Remove the section if when calculating the memory offset
  dump: Add more offset variables
  dump: Introduce dump_is_64bit() helper function
  dump: Consolidate phdr note writes
  dump: Cleanup dump_begin write functions
  dump: Consolidate elf note function

Viktor Prutyanov (4):
  include/qemu: rename Windows context definitions to expose bitness
  dump/win_dump: add helper macros for Windows dump header access
  include/qemu: add 32-bit Windows dump structures
  dump/win_dump: add 32-bit guest Windows support

 include/qemu/win_dump_defs.h | 115 ++++++++++-
 include/sysemu/dump.h        |   9 +-
 contrib/elf2dmp/main.c       |   6 +-
 dump/dump.c                  | 372 ++++++++++++++++-------------------
 dump/win_dump.c              | 299 ++++++++++++++++++----------
 hmp-commands.hx              |   2 +-
 6 files changed, 478 insertions(+), 325 deletions(-)

-- 
2.35.1.693.g805e0a68082a


