Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CA252AC55
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:00:05 +0200 (CEST)
Received: from localhost ([::1]:33520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3MK-0005cT-PL
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3K9-00031m-BG
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3K5-0002Kf-WF
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vWq2OYlD4yYV9t8i1p8Kv1yyUIQzXwfiDex54HSvV0s=;
 b=HzQ6jfSSUwS7Cib8lwbQoeMFZa20NvkTKbHe5jk2eIt+zYTkLHiYongBymQNsYTe/fSiuf
 RsMven4GiXyNl3yVZbSfpgQWsa1YKfHq7Ywf+0M/WBDymAhQNW+pmsKurnCg2iz3WidDUT
 ezAvLIcKjFL4Gt+fexYoiG+BeDxv0Xk=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-_cB0VCwcMpG-pvb0Bkf9Gw-1; Tue, 17 May 2022 15:57:35 -0400
X-MC-Unique: _cB0VCwcMpG-pvb0Bkf9Gw-1
Received: by mail-il1-f197.google.com with SMTP id
 k6-20020a056e02156600b002cf4afa295bso54262ilu.8
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vWq2OYlD4yYV9t8i1p8Kv1yyUIQzXwfiDex54HSvV0s=;
 b=KydAROGpKvHBxMEZXdbc7vG3MkzZdDPbJkuZQhO92hXDz2mqPNb5NZPy9mmpbGi+ON
 CLLjP4eBPlxn0l3EMmia4A/6CtuOudjcQVG3egUEmFdzxcZSqrfxLDp3PItrjKAtdQPR
 3bBn7/LrPIuzIZ5KNKtT/C4oLVeWa7aKsKIiF1r+GyyUJzadM3gmscK2QT0z088Ec4gu
 VARw0xR2gW7bi8Wf8nzcJqNkTseFof+ZIOvMMS5mv+HSZpixMsW0U2G06OfQN6uZc1Ud
 XWDUwZn6IXtAwOY1lJh4pS7CrG9a1QETqwIp1Bt9627LHhVrY3s3VwLOFdt9EzXDr4n9
 1BuQ==
X-Gm-Message-State: AOAM533HfPTSRiO4YZeC1BCQ/vkh9qa5pKm2m0ZHLjHbe0x9PO6s7Zcw
 zy6d+BO3lO50ExiEstToSogwRfzGWHs6ePRjXyPESd8M+Frwj9LMVxb6AcYkgUEgbuIerXOYwJB
 McV95F2aBsQxm5vaQlwLrcdMRBJ99hYJ35zBLgHcLtkf9YAx1chwzl7j5B7MPYjVT
X-Received: by 2002:a05:6e02:216b:b0:2cf:3f1c:fd63 with SMTP id
 s11-20020a056e02216b00b002cf3f1cfd63mr13064038ilv.141.1652817453970; 
 Tue, 17 May 2022 12:57:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIAKiWjTB2viHEFjtsuSt7J0rRmAHG7Ha0X9B74cswY1gyCUvCux3IiYqp7RqdRoc44Lzw0Q==
X-Received: by 2002:a05:6e02:216b:b0:2cf:3f1c:fd63 with SMTP id
 s11-20020a056e02216b00b002cf3f1cfd63mr13064017ilv.141.1652817453327; 
 Tue, 17 May 2022 12:57:33 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020b4f00b002d125725709sm59575ilu.28.2022.05.17.12.57.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 May 2022 12:57:32 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 00/13] migration: Postcopy Preemption
Date: Tue, 17 May 2022 15:57:17 -0400
Message-Id: <20220517195730.32312-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v6 of postcopy preempt series.  It can also be found here:

  https://github.com/xzpeter/qemu/tree/postcopy-preempt

RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
V2:  https://lore.kernel.org/qemu-devel/20220301083925.33483-1-peterx@redhat.com
V3:  https://lore.kernel.org/qemu-devel/20220330213908.26608-1-peterx@redhat.com
V4:  https://lore.kernel.org/qemu-devel/20220331150857.74406-1-peterx@redhat.com
V5:  https://lore.kernel.org/qemu-devel/20220425233847.10393-1-peterx@redhat.com

The major change of this version is one more patch to handle the corner
case when a postcopy request hits a preempted precopy hugepage.  That's
also my major test focus, to make sure that corner case will be triggered
and behave as expected - as long as there's a sequential dirty thread
spinning it's fairly easy to trigger the special condition.

v6 changelog:
- Rebased, picked up more R-bs
- Replace migrate_tls_enabled() with migrate_use_tls() that Leo just
  introduced in the zerocopy series
- Added patch "migration: Respect postcopy request order in preemption
  mode", per discussion with Manish.

Abstract
========

This series contains two parts now:

  (1) Leftover patches from Dan's tls unit tests v2, which is first half
  (2) Leftover patches from my postcopy preempt v4, which is second half

This series added a new migration capability called "postcopy-preempt".  It can
be enabled when postcopy is enabled, and it'll simply (but greatly) speed up
postcopy page requests handling process.

Below are some initial postcopy page request latency measurements after the
new series applied.

For each page size, I measured page request latency for three cases:

  (a) Vanilla:                the old postcopy
  (b) Preempt no-break-huge:  preempt enabled, x-postcopy-preempt-break-huge=off
  (c) Preempt full:           preempt enabled, x-postcopy-preempt-break-huge=on
                              (this is the default option when preempt enabled)

Here x-postcopy-preempt-break-huge parameter is just added in v2 so as to
conditionally disable the behavior to break sending a precopy huge page for
debugging purpose.  So when it's off, postcopy will not preempt precopy
sending a huge page, but still postcopy will use its own channel.

I tested it separately to give a rough idea on which part of the change
helped how much of it.  The overall benefit should be the comparison
between case (a) and (c).

  |-----------+---------+-----------------------+--------------|
  | Page size | Vanilla | Preempt no-break-huge | Preempt full |
  |-----------+---------+-----------------------+--------------|
  | 4K        |   10.68 |               N/A [*] |         0.57 |
  | 2M        |   10.58 |                  5.49 |         5.02 |
  | 1G        | 2046.65 |               933.185 |      649.445 |
  |-----------+---------+-----------------------+--------------|
  [*]: This case is N/A because 4K page does not contain huge page at all

[1] https://github.com/xzpeter/small-stuffs/blob/master/tools/huge_vm/uffd-latency.bpf

TODO List
=========

Avoid precopy write() blocks postcopy
-------------------------------------

I didn't prove this, but I always think the write() syscalls being blocked
for precopy pages can affect postcopy services.  If we can solve this
problem then my wild guess is we can further reduce the average page
latency.

Two solutions at least in mind: (1) we could have made the write side of
the migration channel NON_BLOCK too, or (2) multi-threads on send side,
just like multifd, but we may use lock to protect which page to send too
(e.g., the core idea is we should _never_ rely anything on the main thread,
multifd has that dependency on queuing pages only on main thread).

That can definitely be done and thought about later.

Multi-channel for preemption threads
------------------------------------

Currently the postcopy preempt feature use only one extra channel and one
extra thread on dest (no new thread on src QEMU).  It should be mostly good
enough for major use cases, but when the postcopy queue is long enough
(e.g. hundreds of vCPUs faulted on different pages) logically we could
still observe more delays in average.  Whether growing threads/channels can
solve it is debatable, but sounds worthwhile a try.  That's yet another
thing we can think about after this patchset lands.

Logically the design provides space for that - the receiving postcopy
preempt thread can understand all ram-layer migration protocol, and for
multi channel and multi threads we could simply grow that into multile
threads handling the same protocol (with multiple PostcopyTmpPage).  The
source needs more thoughts on synchronizations, though, but it shouldn't
affect the whole protocol layer, so should be easy to keep compatible.

Please review, thanks.

Peter Xu (13):
  migration: Add postcopy-preempt capability
  migration: Postcopy preemption preparation on channel creation
  migration: Postcopy preemption enablement
  migration: Postcopy recover with preempt enabled
  migration: Create the postcopy preempt channel asynchronously
  migration: Add property x-postcopy-preempt-break-huge
  migration: Add helpers to detect TLS capability
  migration: Export tls-[creds|hostname|authz] params to cmdline too
  migration: Enable TLS for preempt channel
  migration: Respect postcopy request order in preemption mode
  tests: Add postcopy tls migration test
  tests: Add postcopy tls recovery migration test
  tests: Add postcopy preempt tests

 migration/channel.c          |   9 +-
 migration/migration.c        | 139 +++++++++++++--
 migration/migration.h        |  44 ++++-
 migration/multifd.c          |   4 +-
 migration/postcopy-ram.c     | 186 +++++++++++++++++++-
 migration/postcopy-ram.h     |  11 ++
 migration/qemu-file.c        |  27 +++
 migration/qemu-file.h        |   1 +
 migration/ram.c              | 330 +++++++++++++++++++++++++++++++++--
 migration/ram.h              |   4 +-
 migration/savevm.c           |  46 +++--
 migration/socket.c           |  22 ++-
 migration/socket.h           |   1 +
 migration/tls.c              |   9 +
 migration/tls.h              |   4 +
 migration/trace-events       |  15 +-
 qapi/migration.json          |   8 +-
 tests/qtest/migration-test.c | 131 ++++++++++++--
 18 files changed, 917 insertions(+), 74 deletions(-)

-- 
2.32.0


