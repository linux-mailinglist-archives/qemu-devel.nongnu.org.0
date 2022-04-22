Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C292650B62C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:30:05 +0200 (CEST)
Received: from localhost ([::1]:59750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrUC-00074i-Bj
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqK8-0008Mt-Iy
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqK5-0004hj-Ro
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650622532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XEHOWFhnOobuBP/QVgCI6b9gQpK0YC9kNL97e/V+OoY=;
 b=bT1EIUQccJRTXhZ7VdMn3CMkfq3L1dSO8L3wruXm4ewa7RYnJJBXbL76eApoodm2i+kR0p
 fxQnR2PL/XwsJKbgtVfp6SNHBnnWI8YHBPsCKYgO1iXAloNZjHpZrHVl5wZM6RgjKM22dL
 akXHIOPTuC0UKhN2P1RzxALT6H29/Ws=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-2Gg4q_dgOHO9AVp6glMI2w-1; Fri, 22 Apr 2022 06:15:29 -0400
X-MC-Unique: 2Gg4q_dgOHO9AVp6glMI2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61BA738149B3;
 Fri, 22 Apr 2022 10:15:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6EAA145BA53;
 Fri, 22 Apr 2022 10:15:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/13] Dump patches
Date: Fri, 22 Apr 2022 14:15:12 +0400
Message-Id: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
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

The following changes since commit a74782936dc6e979ce371dabda4b1c05624ea87f:

  Merge tag 'pull-migration-20220421a' of https://gitlab.com/dagrh/qemu into staging (2022-04-21 18:48:18 -0700)

are available in the Git repository at:

  git@gitlab.com:marcandre.lureau/qemu.git tags/dump-pull-request

for you to fetch changes up to f5daa8293b292929cb429f154e926191ba8e040c:

  dump/win_dump: add 32-bit guest Windows support (2022-04-22 13:41:56 +0400)

----------------------------------------------------------------
dump queue

Hi

The "dump" queue, with:
- [PATCH v3/v4 0/9] dump: Cleanup and consolidation
- [PATCH v4 0/4] dump: add 32-bit guest Windows support

v2:
- fix compiler warning in "dump/win_dump: add 32-bit guest Windows support"

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
 dump/win_dump.c              | 305 +++++++++++++++++-----------
 hmp-commands.hx              |   2 +-
 6 files changed, 482 insertions(+), 327 deletions(-)

-- 
2.36.0


