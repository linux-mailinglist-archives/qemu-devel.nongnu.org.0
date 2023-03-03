Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08C6A9D0D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:21:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY94S-0005VT-Oc; Fri, 03 Mar 2023 12:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94P-0005UL-8p
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:19:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94N-0003Pw-6G
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677863985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y24Wch2BvMAZnf2zpdp4YbrNlGbs42VTZAE2zi4pLR0=;
 b=aJTQg96IcS7e5ESkvuPDqq+BS5HIHSf2u3YL/pylNAGImxQFVonDWWoJDa3eT9+3O4QMad
 kUZfSlh65aa+2mwo5AGAls4ZpD1jKWZnNp4GJqkxDrZMsMhVQFt4iMDPl9XfAKdNz6iEhW
 Xzwh9GKuk8G66gn0qIlYutC51Z1Gl+0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-dFRcYS5pMdGfyMucHWNjFA-1; Fri, 03 Mar 2023 12:19:44 -0500
X-MC-Unique: dFRcYS5pMdGfyMucHWNjFA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a05600c1d1000b003e77552705cso1286045wms.7
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y24Wch2BvMAZnf2zpdp4YbrNlGbs42VTZAE2zi4pLR0=;
 b=xNxGtYvdcpC76A0zeFuW5kEt4EWEiAVthgnWbCBpWYEJJfwGbqHdvOEej8RYvPnAcn
 gEMZ/omL5MfH9ngde5XqJ3XyeepC37nBVfpzpdA4bptJCMRjsvCDC0rMOSCWaQms4h6H
 2zmBuuWnBfdxQobKLz1LmE37UMvLN4vezOmKHTWBK2slScDm462RJruv322e1tXKP9+6
 m3Qfk4MWiu+Wlt/Q6zRsQTWzopja5TqPuXnMKS9RLYGQ8vbgrlqkchAKWQTdX9QRCPqL
 7RxNNx135+gdWFRWCcnMMIQg/rZEL/yqRt3rdbfz3gYGQW/gUegrp95P0yKVZ9lC8a5S
 kCXQ==
X-Gm-Message-State: AO0yUKUF9n9rVnqqBV9+rTNu2FeozQrOY5p6ebkY7rCTB45iYfevWb/d
 80wWY8qQcRpx53uPXKF+P9GTtcNd1FbeWbtGA/I9w6r4bNohxBZ+wBpDsVNB53ddfAuhg2Sam8d
 qq07QqgFNF1q8EzkG2B4Nfq9XKHSm5953Rlg4dd8RUWp7Bsno6aYaJtTYAh3OTgkpwUWf3n93
X-Received: by 2002:a05:600c:a09:b0:3ea:c100:e974 with SMTP id
 z9-20020a05600c0a0900b003eac100e974mr2550055wmp.26.1677863982982; 
 Fri, 03 Mar 2023 09:19:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8g/tABLooPOJOK6omZ3TIqLXNDLF8nzSIDyaCWgCBBaptXePbARCji+m1emfggHyaDy+iCBg==
X-Received: by 2002:a05:600c:a09:b0:3ea:c100:e974 with SMTP id
 z9-20020a05600c0a0900b003eac100e974mr2550030wmp.26.1677863982633; 
 Fri, 03 Mar 2023 09:19:42 -0800 (PST)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b003e20970175dsm7564933wms.32.2023.03.03.09.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 09:19:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Subject: [PATCH 0/8] Fix missing memory barriers on ARM
Date: Fri,  3 Mar 2023 18:19:31 +0100
Message-Id: <20230303171939.237819-1-pbonzini@redhat.com>
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
respectively as LDAR and STLR instructions.  Even though STLR is also
used for store-release operations, STLR followed by LDAR provides
store-against-load ordering, which is stronger than a store-release.
Compare this to ARMv7, where store-release is DMB+STR and store-seqcst
is DMB+STR+DMB.

This means that on ARM a sequence of

  qatomic_store_release(&y, ...);         // STLR
  a = qatomic_load_acquire(&x);           // LDAR

provides stronger ordering at the processor level than the two MOV
instructions you'd get on x86.

Likewise, on ARM sequentially consistent read-modify-write operations only
need to use LDAXR and STLXR respectively for the load and the store, which
is weaker than the LOCK prefix used on x86.

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

Developers that are more familiar with the Linux API may be tempted
to omit the smp_mb() and that's exactly what yours truly did in
qemu_event_set() and qemu_event_reset().  After a27dd2de68f3 ("KVM:
keep track of running ioctls", 2023-01-11), this caused hangs due to
threads sleeping forever in qemu_event_wait().

This _could_ also have been the cause of occasional hangs of rcutorture,
though I have not observed them personally.

(As an aside, GCC's older __sync_* builtins *did* provide a full barrier
between the RMW operation and loads on the side of the operation.  The
difference between seqcst C11 atomics and __sync_* atomics is exactly
an extra memory barrier after the STLXR instruction).

In order to fix this, while avoiding worse performance from having two
back-to-back memory barriers on x86, patch 1 introduces optimized
memory barriers smp_mb__before_rmw() and smp_mb__after_rmw().  The usage
is similar to Linux's smp_mb__before/after_atomic(), but the name is
different because they affect _all_ RMW operations.  On Linux, instead,
they are not needed around those RMW operations that return the old value.

The remaining patches add them everywhere they are needed.  In the
case of QemuEvent (patches 2-3), I reviewed the algorithm thoroughly,
dropping barriers that were not necessary and killing optimizations that
I wasn't entirely sure about.  For the other cases, instead, the changes
are minimal.

Note: I have a follow-up set of patches that gets rid completely of
atomic_mb_read(); atomic_mb_set() instead can remain and mimic Linux's
smp_store_mb() operation.  A glimpse of these changes is already visible
in patches 7 and 8.

Thanks to Emanuele Esposito and Gavin Shan for help debugging and
testing the changes!

Paolo

Paolo Bonzini (8):
  qatomic: add smp_mb__before/after_rmw()
  qemu-thread-posix: cleanup, fix, document QemuEvent
  qemu-thread-win32: cleanup, fix, document QemuEvent
  edu: add smp_mb__after_rmw()
  util/async: add smp_mb__after_rmw() around BH enqueue/dequeue
  aio-wait: switch to smp_mb__after_rmw()
  qemu-coroutine-lock: add smp_mb__after_rmw()
  physmem: add missing memory barrier

 docs/devel/atomics.rst     | 26 ++++++++++---
 hw/misc/edu.c              |  5 +++
 include/block/aio-wait.h   |  2 +-
 include/qemu/atomic.h      | 17 ++++++++-
 softmmu/physmem.c          |  3 ++
 util/async.c               | 13 ++++---
 util/qemu-coroutine-lock.c |  9 ++++-
 util/qemu-thread-posix.c   | 64 +++++++++++++++++++++----------
 util/qemu-thread-win32.c   | 78 ++++++++++++++++++++++++++------------
 9 files changed, 160 insertions(+), 57 deletions(-)

-- 
2.39.1


