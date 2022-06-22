Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F71B555580
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 22:51:55 +0200 (CEST)
Received: from localhost ([::1]:46392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47KL-0004sa-RD
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 16:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47I6-0002HW-Vm
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47I3-0004EH-2a
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655930969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CAaGO0ZUbaEGaTXdyRCaUAXTSBwPqVTNM3ETqocHI98=;
 b=bT5wrf50HGqLW9GBpnwBR6wddkSfjhXOX8vq3mOUBadpN/xpTPWNGuj62J00UW7WbzPU9+
 te8iYkorphun7d0tc2qFk2K2tDxChFzZVVnVOScoFxgK5ZS4BfmHd2Y6hUgzyShqr6s3V3
 Dnrr4qSvYzsgVeILOSzckVOxqm0nZD0=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-U418MA0fNJ-p3hFL20r3Jg-1; Wed, 22 Jun 2022 16:49:28 -0400
X-MC-Unique: U418MA0fNJ-p3hFL20r3Jg-1
Received: by mail-io1-f69.google.com with SMTP id
 r9-20020a6b8f09000000b0067277113232so875491iod.18
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CAaGO0ZUbaEGaTXdyRCaUAXTSBwPqVTNM3ETqocHI98=;
 b=LAl4OmSKMONKjc12/4jr+zEV8b/fFypW5uEGUgCJv7LAuOFxcBTtYUOjCYlJJdoke0
 57per6N5n+R4t4aHBjWpOAMazyGUo8bbfDZ8/ff86xD/vcHl9JsuPOxL63Xzgj7QIek6
 4LcW0dR1cmi/tUeYu9hYY7AEwTvSPtxsu2Fx5JTAoJpvzK2NFuY1iG0wc5gbmNgV6e7V
 OOZCV76gY5Vgj079yTDWbStUW8Cv1bvPg1ZftWmQM9yv+1ROJXP8a0ZzGQjJ5oc02DK0
 ODzpr5W1BoY/YZefu/CzJg/Bq1pDiA2ImNFdwL0KX0luas7pdMSb8T+O59Iry9IBVG2s
 FVsg==
X-Gm-Message-State: AJIora/9xgsMhFKnd48GhuXlkBQsITdIG9Q5ResP+qfNya0bv7y99Twd
 YCLK3TU7FcjD0EmM8gzR5J5Nb6CslG3bY32zZy1YbhGjnvNmoQMnT7Qix3Y134O1D108N4LU8D5
 UWPOH1vpasNgwH94D7SboScXpN9sQ5/jefEx1amdVficaANrrltKHPq6Y+hKCE3+x
X-Received: by 2002:a05:6638:3297:b0:335:df89:8f46 with SMTP id
 f23-20020a056638329700b00335df898f46mr3373590jav.19.1655930967002; 
 Wed, 22 Jun 2022 13:49:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tnw4zUcQjWDhRzIIVjvHCTa3HYHXRkGu5BHIVsUJcQd0fXubNVADupIWkSe+H3xeLZ2xJO/A==
X-Received: by 2002:a05:6638:3297:b0:335:df89:8f46 with SMTP id
 f23-20020a056638329700b00335df898f46mr3373567jav.19.1655930966591; 
 Wed, 22 Jun 2022 13:49:26 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.49.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:49:25 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 00/15] migration: Postcopy Preemption
Date: Wed, 22 Jun 2022 16:49:05 -0400
Message-Id: <20220622204920.79061-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

This is v8 of postcopy preempt series.  It can also be found here:

  https://github.com/xzpeter/qemu/tree/postcopy-preempt

RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
V2:  https://lore.kernel.org/qemu-devel/20220301083925.33483-1-peterx@redhat.com
V3:  https://lore.kernel.org/qemu-devel/20220330213908.26608-1-peterx@redhat.com
V4:  https://lore.kernel.org/qemu-devel/20220331150857.74406-1-peterx@redhat.com
V5:  https://lore.kernel.org/qemu-devel/20220425233847.10393-1-peterx@redhat.com
V6:  https://lore.kernel.org/qemu-devel/20220517195730.32312-1-peterx@redhat.com
V7:  https://lore.kernel.org/qemu-devel/20220524221151.18225-1-peterx@redhat.com

v8:
- Added r-bs
- Patch 1: Remove the chunk to forbid postcopy on multifd [Juan]
- Rebased to https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220622b

Note that the 1st patch should be squashed into Daniel's corresponding
patch.

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

Peter Xu (15):
  fixup! migration: remove the QEMUFileOps 'get_buffer' callback
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
  tests: Move MigrateCommon upper
  tests: Add postcopy tls migration test
  tests: Add postcopy tls recovery migration test
  tests: Add postcopy preempt tests

 migration/channel.c          |   9 +-
 migration/migration.c        | 134 ++++++++++++--
 migration/migration.h        |  44 ++++-
 migration/multifd.c          |   4 +-
 migration/postcopy-ram.c     | 186 +++++++++++++++++++-
 migration/postcopy-ram.h     |  11 ++
 migration/qemu-file.c        |  29 +++-
 migration/qemu-file.h        |   1 +
 migration/ram.c              | 326 +++++++++++++++++++++++++++++++++--
 migration/ram.h              |   4 +-
 migration/savevm.c           |  46 +++--
 migration/socket.c           |  22 ++-
 migration/socket.h           |   1 +
 migration/tls.c              |   9 +
 migration/tls.h              |   4 +
 migration/trace-events       |  15 +-
 qapi/migration.json          |   7 +-
 tests/qtest/migration-test.c | 289 ++++++++++++++++++++++---------
 18 files changed, 992 insertions(+), 149 deletions(-)

-- 
2.32.0


