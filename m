Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF74C86C8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:43:04 +0100 (CET)
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOy63-0006O3-F3
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:43:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy2o-0003Pv-6v
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy2l-0007qV-6D
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646123977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/g58+GVN1EbODgj3QIgtR0/F+psN2KrBGDqJJ5494wk=;
 b=KZtzUzBHIAC8Ts/meeedyohRJizf8lY3apvg35N28UBMihEjKpdJ0HoYXQJS+hZAF+jTpW
 cTmW76ATDQoGM3O0FzlFVfABv0Ed1qsw/iZLEDWyAg6Jxkt5DoHOsadVfmAmRClN5jW5vH
 3VqsnCIWC+q0ulU45EinXj+oRXa+fvM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-YvkmZLZtOX6wbQBVtYQJuw-1; Tue, 01 Mar 2022 03:39:34 -0500
X-MC-Unique: YvkmZLZtOX6wbQBVtYQJuw-1
Received: by mail-pj1-f69.google.com with SMTP id
 e7-20020a17090a4a0700b001bc5a8c533eso1208193pjh.4
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:39:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/g58+GVN1EbODgj3QIgtR0/F+psN2KrBGDqJJ5494wk=;
 b=3FhISJ882XVHCC9M7U9f4R3osTYFmdsoGyYFzF79QEuCcyt3RCXeT65mcAXa1vdsJe
 j2z2UGj8jwxzi0vprSdOK9kKuyy88bH48XweZR+zs8iu9efNJO+OR+Tv+0q42NWeSiIe
 iW+gA8nv0V0CaXW2vNc4yQH8yl7VmIz1pPYbAfDh8/CxNxmmGYvSR4GBfRarP3HD+Xsl
 TN3U9fKjauEmBV3jJM0j6kNoKWQLb5pbK6KS4x1dm5X5wl4VZ5pdM/7jOP08w7cO7TtL
 HDl7MeH0+JQIb9RlJBjLzVAqJ7T+qGtVBrhLIWvI0eCOy9GA8t1oR8EZiV1rMGeDAvLA
 aNdg==
X-Gm-Message-State: AOAM533IL9iNRah8sp2c1iTv1jeBKSd53xXyu8CcHdWSPv3LEWxpuT/p
 jO4UaidGN7+HDeRrLoN+gwiRI87KB80dHgMPb1XBuYAw3JDTUrk5hvftVm0n0GcnR9mPPLSS2La
 wOaMH8y1WcCii7WWph4ruVavQ3wbTMw0hm75sXTVqYwJWphplte5jyZBmviKrkNoY
X-Received: by 2002:a17:90a:c782:b0:1bc:dac0:88e with SMTP id
 gn2-20020a17090ac78200b001bcdac0088emr20814887pjb.172.1646123973507; 
 Tue, 01 Mar 2022 00:39:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzddXaxGyafW5tOMImJL7L2srEqrdvhMCNcfUDo0wShejJ9HlXnvZtqn/GatIoWTg00rXKsqQ==
X-Received: by 2002:a17:90a:c782:b0:1bc:dac0:88e with SMTP id
 gn2-20020a17090ac78200b001bcdac0088emr20814849pjb.172.1646123972930; 
 Tue, 01 Mar 2022 00:39:32 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.39.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:39:32 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/25] migration: Postcopy Preemption
Date: Tue,  1 Mar 2022 16:39:00 +0800
Message-Id: <20220301083925.33483-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v2 of postcopy preempt series.  It can also be found here:

  https://github.com/xzpeter/qemu/tree/postcopy-preempt

RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com

v1->v2 changelog:
- Picked up more r-bs from Dave
- Rename both fault threads to drop "qemu/" prefix [Dave]
- Further rework on postcopy recovery, to be able to detect qemufile errors
  from either main channel or postcopy one [Dave]
- shutdown() qemufile before close on src postcopy channel when postcopy is
  paused [Dave]
- In postcopy_preempt_new_channel(), explicitly set the new channel in
  blocking state, even if it's the default [Dave]
- Make RAMState.postcopy_channel unsigned int [Dave]
- Added patches:
  - "migration: Create the postcopy preempt channel asynchronously"
  - "migration: Parameter x-postcopy-preempt-break-huge"
  - "migration: Add helpers to detect TLS capability"
  - "migration: Fail postcopy preempt with TLS"
  - "tests: Pass in MigrateStart** into test_migrate_start()"

Abstract
========

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

TLS support
-----------

I only noticed its missing very recently.  Since soft freeze is coming, and
obviously I'm still growing this series, so I tend to have the existing
material discussed. Let's see if it can still catch the train for QEMU 7.0
release (soft freeze on 2022-03-08)..

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

Patch Layout
============

Patch 1-3: Three leftover patches from patchset "[PATCH v3 0/8] migration:
Postcopy cleanup on ram disgard" that I picked up here too.

  https://lore.kernel.org/qemu-devel/20211224065000.97572-1-peterx@redhat.com/

  migration: Dump sub-cmd name in loadvm_process_command tp
  migration: Finer grained tracepoints for POSTCOPY_LISTEN
  migration: Tracepoint change in postcopy-run bottom half

Patch 4-9: Original postcopy preempt RFC preparation patches (with slight
modifications).

  migration: Introduce postcopy channels on dest node
  migration: Dump ramblock and offset too when non-same-page detected
  migration: Add postcopy_thread_create()
  migration: Move static var in ram_block_from_stream() into global
  migration: Add pss.postcopy_requested status
  migration: Move migrate_allow_multifd and helpers into migration.c

Patch 10-15: Some newly added patches when working on postcopy recovery
support.  After these patches migrate-recover command will allow re-entrance,
which is a very nice side effect.

  migration: Enlarge postcopy recovery to capture !-EIO too
  migration: postcopy_pause_fault_thread() never fails
  migration: Export ram_load_postcopy()
  migration: Move channel setup out of postcopy_try_recover()
  migration: Add migration_incoming_transport_cleanup()
  migration: Allow migrate-recover to run multiple times

Patch 16-19: The major work of postcopy preemption implementation is split into
four patches as suggested by Dave.

  migration: Add postcopy-preempt capability
  migration: Postcopy preemption preparation on channel creation
  migration: Postcopy preemption enablement
  migration: Postcopy recover with preempt enabled

Patch 20-23: Newly added patches in this v2 for different purposes.
             Majorly some amendment on existing postcopy preempt.

  migration: Create the postcopy preempt channel asynchronously
  migration: Parameter x-postcopy-preempt-break-huge
  migration: Add helpers to detect TLS capability
  migration: Fail postcopy preempt with TLS for now

Patch 24-25: Test cases (including one more patch for cleanup)

  tests: Add postcopy preempt test
  tests: Pass in MigrateStart** into test_migrate_start()

Please review, thanks.

Peter Xu (25):
  migration: Dump sub-cmd name in loadvm_process_command tp
  migration: Finer grained tracepoints for POSTCOPY_LISTEN
  migration: Tracepoint change in postcopy-run bottom half
  migration: Introduce postcopy channels on dest node
  migration: Dump ramblock and offset too when non-same-page detected
  migration: Add postcopy_thread_create()
  migration: Move static var in ram_block_from_stream() into global
  migration: Add pss.postcopy_requested status
  migration: Move migrate_allow_multifd and helpers into migration.c
  migration: Enlarge postcopy recovery to capture !-EIO too
  migration: postcopy_pause_fault_thread() never fails
  migration: Export ram_load_postcopy()
  migration: Move channel setup out of postcopy_try_recover()
  migration: Add migration_incoming_transport_cleanup()
  migration: Allow migrate-recover to run multiple times
  migration: Add postcopy-preempt capability
  migration: Postcopy preemption preparation on channel creation
  migration: Postcopy preemption enablement
  migration: Postcopy recover with preempt enabled
  migration: Create the postcopy preempt channel asynchronously
  migration: Parameter x-postcopy-preempt-break-huge
  migration: Add helpers to detect TLS capability
  migration: Fail postcopy preempt with TLS for now
  tests: Add postcopy preempt test
  tests: Pass in MigrateStart** into test_migrate_start()

 migration/channel.c          |  10 +-
 migration/migration.c        | 235 ++++++++++++++++++++-----
 migration/migration.h        |  98 ++++++++++-
 migration/multifd.c          |  26 +--
 migration/multifd.h          |   2 -
 migration/postcopy-ram.c     | 244 +++++++++++++++++++++-----
 migration/postcopy-ram.h     |  15 ++
 migration/qemu-file.c        |  27 +++
 migration/qemu-file.h        |   1 +
 migration/ram.c              | 330 +++++++++++++++++++++++++++++++----
 migration/ram.h              |   3 +
 migration/savevm.c           |  70 ++++++--
 migration/socket.c           |  22 ++-
 migration/socket.h           |   1 +
 migration/trace-events       |  19 +-
 qapi/migration.json          |   8 +-
 tests/qtest/migration-test.c |  68 ++++++--
 17 files changed, 983 insertions(+), 196 deletions(-)

-- 
2.32.0


