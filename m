Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D631F6AD1A4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:34:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJOQ-0004Gw-BS; Mon, 06 Mar 2023 17:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJON-0004GS-OK
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOM-0003RA-9b
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678141993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pzwMwDPVWynFOpp5F6tPbqeas2eM5cw5RtygWl5QGAU=;
 b=Y9JM39H24mOhX2BokF5S5SX5+9sMfD5CB/aCakmNZnrd3iIZgj3SJd0p7MOIsNWANP5wpb
 VkGuDGhMSXWo0UgA2NmcrDK97mqtogh6WJvpbFerHBfewHd2jVck+7Ef3VvinJd/kp2rOg
 Je/AvX2AYqODHWKf5HepF9W45/sm81A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-m8lQUjydO7ygcCzZUyvJ3A-1; Mon, 06 Mar 2023 17:33:11 -0500
X-MC-Unique: m8lQUjydO7ygcCzZUyvJ3A-1
Received: by mail-ed1-f70.google.com with SMTP id
 b7-20020a056402350700b004d2a3d5cd3fso10669515edd.8
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678141990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pzwMwDPVWynFOpp5F6tPbqeas2eM5cw5RtygWl5QGAU=;
 b=cYoEfZvjiLKdHHkmWSowl+CT8sbnAUJ6Hueq+EgZB+N3hBEEWG6rnUIC30chD6bZ/1
 rX4U3kN4BZII1FP7r0+olqpv3hqAZXZ6qeubNo4Zin8LeivjyCVuIkxNWrEeqkvbqltY
 K2BHBSIS+YY1sAAkXyxXYrqSYzKnW01xNcdWG2+iTYG11ctnhrmGdc7NRjASDR6fK92o
 pXDQ8xN1iE8PFRD7gju6f3dz6+0TvFzC5jfm9b3Q/ReFIo8eWWuCcW4/6EyUVWGtfq6f
 ruAFYOPCshaxOIkfuVBiEZWNpDu4y24O9Ni5HK0PuZmMxqxpB4HrNEQeCV+ZlPKb579R
 f1ig==
X-Gm-Message-State: AO0yUKXLmaOehrgIq+b9xZ9IrW/1G2M2Dhn1SZDwPNTvUyNt+qU3d2M5
 L0ZtqzdlonHy6FLtQ8D5vCsbwlBo0+fvbZ6RSjKaePYLm3BCOTXtcXf4ASpZrmYM+aYKG/HuCS+
 1M85L+i2PXJnHxwfvHzn4tof93blT68nJl5mN2xiF52h9gCA/33rx8LyhmXETLurhLgwBi5wZbv
 A=
X-Received: by 2002:a17:907:94c5:b0:8b1:3821:1406 with SMTP id
 dn5-20020a17090794c500b008b138211406mr15982063ejc.45.1678141990144; 
 Mon, 06 Mar 2023 14:33:10 -0800 (PST)
X-Google-Smtp-Source: AK7set90q6c5RDPydtbQx1ilSmLTbtnxqjn3YAtVj2PHlFB+U+y5BN1vdwR2nOgol5csEAc/x9FnaA==
X-Received: by 2002:a17:907:94c5:b0:8b1:3821:1406 with SMTP id
 dn5-20020a17090794c500b008b138211406mr15982021ejc.45.1678141989512; 
 Mon, 06 Mar 2023 14:33:09 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a1709063bc500b008c327bef167sm5107183ejf.7.2023.03.06.14.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:33:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com,
 richard.henderson@linaro.org
Subject: [PATCH v2 0/9] Fix missing memory barriers on ARM
Date: Mon,  6 Mar 2023 23:32:57 +0100
Message-Id: <20230306223306.84383-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

This series fixes more instances of the problem fixed by commits
5710a3e09f9b ("async: use explicit memory barriers", 2020-04-09) and
7455ff1aa015 ("aio_wait_kick: add missing memory barrier", 2022-06-24).
This is an interesting case where ARM's memory ordering is somewhat 
stronger than what you would expect.

On ARM, seqcst loads and stores (which QEMU does not use) are compiled
respectively as LDAR and STLR instructions.  Even though LDAR is
also used for load-acquire operations, it also waits for all STLRs to
leave the store buffer.  Thus, LDAR and STLR alone are load-acquire
and store-release operations, but LDAR also provides store-against-load
ordering as long as the previous store is a STLR.

Compare this to ARMv7, where store-release is DMB+STR and load-acquire
is LDR+DMB, but an additional DMB is needed between store-seqcst and
load-seqcst (e.g. DMB+STR+DMB+LDR+DMB); or with x86, where MOV provides
load-acquire and store-release semantics and the two can be reordered.

Likewise, on ARM sequentially consistent read-modify-write operations only
need to use LDAXR and STLXR respectively for the load and the store, while
on x86 they need to use the stronger LOCK prefix.

In a strange twist of events, however, the _stronger_ semantics
of the ARM instructions can end up causing bugs on ARM, not on x86.
The problems occur when seqcst atomics are mixed with relaxed atomics.
Here is how the two are compiled on ARM:

                   load              store
   relaxed         LDR               STR
   seqcst          LDAR              STLR

QEMU's atomics try to bridge the Linux API (that most of the developers
are familiar with) and the C11 API, and the two have a substantial
difference:

- in Linux, strongly-ordered atomics such as atomic_add_return() affect
  the global ordering of _all_ memory operations, including for example
  READ_ONCE()/WRITE_ONCE()

- in C11, sequentially consistent atomics (except for seqcst fences)
  only affect the ordering of sequentially consistent operations.
  In particular, since relaxed loads are done with LDR on ARM, they are
  not ordered against seqcst stores (which are done with STLR).

QEMU implements high-level synchronization primitives with the idea that
the primitives contain the necessary memory barriers, and the callers can
use relaxed atomics (qatomic_read/qatomic_set) or even regular accesses.
This is very much incompatible with the C11 view that seqcst accesses
are only ordered against other seqcst accesses, and requires using
seqcst fences as in the following example:

   qatomic_set(&y, 1);            qatomic_set(&x, 1);
   smp_mb();                      smp_mb();
   ... qatomic_read(&x) ...       ... qatomic_read(&y) ...

Bugs ensue when a qatomic_*() read-modify write operation is used instead
of one or both stores, for example:

   qatomic_<rmw>(&y, ...);
   smp_mb();
   ... qatomic_read(&x) ...

Code that was written when QEMU used the older GCC __sync_* builtins
(which did provide a full barrier with loads on either side of the
operation) might omit the smp_mb().  That's exactly what yours truly did
in qemu_event_set() and qemu_event_reset().  After a27dd2de68f3 ("KVM:
keep track of running ioctls", 2023-01-11), this showed up as hangs due to
threads sleeping forever in qemu_event_wait().

This _could_ also have been the cause of occasional hangs of rcutorture,
though I have not observed them personally.

In order to fix this, while avoiding worse performance from having two
back-to-back memory barriers on x86, patch 1 introduces optimized
memory barriers smp_mb__before_rmw() and smp_mb__after_rmw().  The usage
is similar to Linux's smp_mb__before/after_atomic(), but the name is
different because they affect _all_ RMW operations.  On Linux, instead,
they are not needed around those RMW operations that return the old value.

The compiler does the same when compiling __sync_* atomics, i.e. it adds
an extra memory barrier after the STLXR instruction on ARM but it does
nothing on x86.

The remaining patches add them everywhere they are needed.  In the
case of QemuEvent (patches 2-3), I reviewed the algorithm thoroughly,
dropping barriers that were not necessary and killing optimizations that
I wasn't entirely sure about.  For the other cases, instead, the changes
are minimal.

Note: I have a follow-up set of patches that gets rid completely of
atomic_mb_read(); atomic_mb_set() instead can remain and mimic Linux's
smp_store_mb() operation.  A glimpse of these changes is already visible
in patches 6 and 7.

Thanks to Emanuele Esposito and Gavin Shan for help debugging and
testing the changes!

Paolo

v1->v2:
- fix documentation in patch 1
- do not add barrier to util/async.c, update documentation for the
  existing ones
- leave acquire barrier in qemu_event_wait()

Paolo Bonzini (9):
  qatomic: add smp_mb__before/after_rmw()
  qemu-thread-posix: cleanup, fix, document QemuEvent
  qemu-thread-win32: cleanup, fix, document QemuEvent
  edu: add smp_mb__after_rmw()
  aio-wait: switch to smp_mb__after_rmw()
  qemu-coroutine-lock: add smp_mb__after_rmw()
  physmem: add missing memory barrier
  async: update documentation of the memory barriers
  async: clarify usage of barriers in the polling case

 docs/devel/atomics.rst     | 26 +++++++++---
 hw/misc/edu.c              |  5 +++
 include/block/aio-wait.h   |  2 +-
 include/qemu/atomic.h      | 17 +++++++-
 softmmu/physmem.c          |  3 ++
 util/async.c               | 43 ++++++++++++--------
 util/qemu-coroutine-lock.c |  9 ++++-
 util/qemu-thread-posix.c   | 69 ++++++++++++++++++++++----------
 util/qemu-thread-win32.c   | 82 ++++++++++++++++++++++++++------------
 9 files changed, 186 insertions(+), 70 deletions(-)

-- 
2.39.1


