Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9763B4EDC6C
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:12:03 +0200 (CEST)
Received: from localhost ([::1]:52142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwSw-0004of-N7
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:12:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQ5-00021v-6O
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQ1-0001KC-QT
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MaagUnOYMsm1IOrg+ktfU3DTY+xUNRkItFQ+06OKeqE=;
 b=NC4E8CFILXGBjNmTssyFQJJHwEfom6HCzA7DjP1yN3uGt6cN52dFN0f6N/lQ/vAvA75zbV
 Ha1c2++waRQEe0JJ0SqdifCP0bQBQwLAt1LvSwka+AvrgF9JqhOTP+r2xC6TDbHJEAK2F0
 wgd4S4sDEz+Pnhg27GomNDywv5OAUlw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-t620ZGSGOeOyiw9kY9hWNA-1; Thu, 31 Mar 2022 11:09:00 -0400
X-MC-Unique: t620ZGSGOeOyiw9kY9hWNA-1
Received: by mail-qv1-f69.google.com with SMTP id
 ba7-20020ad45527000000b0044105fb3d5fso18756957qvb.8
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MaagUnOYMsm1IOrg+ktfU3DTY+xUNRkItFQ+06OKeqE=;
 b=vJetGvN3uI584dlFCnlq4uMUqzdCDJ+Xw7glB5RfyyEvzrJ+VXv8marXNe1WU6qhjM
 7R7kNTZq6SsqAWjXjpxwVnxkJCvDK/4vvUtYZG9ujnOSIXleRRNvX9y9Ug+v8cuduPtr
 a4vuXiUO39TbfEz52vWRFig6j6KDRJAc1xO6FO+9uG7lPMjE+WHV46o/4RPOspcRg2V0
 y+NtSeSmKz3K7jCl3lCAFuyI98yuWy9/UfjyEPuLXN8jJZRe/VCW8W1QxnIwILxDwDKN
 059aboU6G7pdSIFJ8nhYsL+Lsm/f0vFLmeTZeeYhphSHuBSsGICPqvXeAcjZhODzvGfv
 4e4A==
X-Gm-Message-State: AOAM531783YdMclJ5CD3j0HyWdFmB75fDHxbvL5nfPE76KVDsQOsJdC7
 BJv3HbR345G07D5zNgtWWdCAqW+R3P3xg7nHfDPwOBY9t6DFQ7zrPIhlR/6xqnBDz8JVS9GNwjB
 4TMMP2FrtLd2IuDDstK+VNl0qRfSElfn7XiHsUINHwr5Gqy5d8lVD//e0ZlF1k1ly
X-Received: by 2002:a05:622a:52:b0:2e2:3248:c8 with SMTP id
 y18-20020a05622a005200b002e2324800c8mr4637859qtw.519.1648739339069; 
 Thu, 31 Mar 2022 08:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAyFyoFP++eeqF0sotXbK94QoQQ5rOsSm/yNlp3oTjpU+e2yneCAh9nbgPWelKirhggwJO2Q==
X-Received: by 2002:a05:622a:52:b0:2e2:3248:c8 with SMTP id
 y18-20020a05622a005200b002e2324800c8mr4637809qtw.519.1648739338627; 
 Thu, 31 Mar 2022 08:08:58 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.08.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:08:58 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/19] migration: Postcopy Preemption
Date: Thu, 31 Mar 2022 11:08:38 -0400
Message-Id: <20220331150857.74406-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v4 of postcopy preempt series.  It can also be found here:

  https://github.com/xzpeter/qemu/tree/postcopy-preempt

RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
V2:  https://lore.kernel.org/qemu-devel/20220301083925.33483-1-peterx@redhat.com
V3:  https://lore.kernel.org/qemu-devel/20220330213908.26608-1-peterx@redhat.com

v4:
- Fix a double-free on params.tls-creds when quitting qemu
- Reorder patches to satisfy per-commit builds

v3:
- Rebased to master since many patches landed
- Fixed one bug on postcopy recovery when preempt enabled, this is only
  found when I test with TLS+recovery, because TLS changed the timing.
- Dropped patch:
  "migration: Fail postcopy preempt with TLS for now"
- Added patches for TLS:
  - "migration: Postpone releasing MigrationState.hostname"
  - "migration: Drop multifd tls_hostname cache"
  - "migration: Enable TLS for preempt channel"
  - "migration: Export tls-[creds|hostname|authz] params to cmdline too"
  - "tests: Add postcopy tls migration test"
  - "tests: Add postcopy tls recovery migration test"
- Added two more tests to the preempt test patch (tls, tls+recovery)

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

Peter Xu (19):
  migration: Postpone releasing MigrationState.hostname
  migration: Drop multifd tls_hostname cache
  migration: Add pss.postcopy_requested status
  migration: Move migrate_allow_multifd and helpers into migration.c
  migration: Export ram_load_postcopy()
  migration: Move channel setup out of postcopy_try_recover()
  migration: Allow migrate-recover to run multiple times
  migration: Add postcopy-preempt capability
  migration: Postcopy preemption preparation on channel creation
  migration: Postcopy preemption enablement
  migration: Postcopy recover with preempt enabled
  migration: Create the postcopy preempt channel asynchronously
  migration: Parameter x-postcopy-preempt-break-huge
  migration: Add helpers to detect TLS capability
  migration: Export tls-[creds|hostname|authz] params to cmdline too
  migration: Enable TLS for preempt channel
  tests: Add postcopy tls migration test
  tests: Add postcopy tls recovery migration test
  tests: Add postcopy preempt tests

 migration/channel.c          |  11 +-
 migration/migration.c        | 218 ++++++++++++++++++++------
 migration/migration.h        |  52 ++++++-
 migration/multifd.c          |  36 +----
 migration/multifd.h          |   4 -
 migration/postcopy-ram.c     | 190 ++++++++++++++++++++++-
 migration/postcopy-ram.h     |  11 ++
 migration/qemu-file.c        |  27 ++++
 migration/qemu-file.h        |   1 +
 migration/ram.c              | 288 +++++++++++++++++++++++++++++++++--
 migration/ram.h              |   3 +
 migration/savevm.c           |  49 ++++--
 migration/socket.c           |  22 ++-
 migration/socket.h           |   1 +
 migration/trace-events       |  15 +-
 qapi/migration.json          |   8 +-
 tests/qtest/migration-test.c | 113 ++++++++++++--
 17 files changed, 918 insertions(+), 131 deletions(-)

-- 
2.32.0


