Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906F68AE43
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWfS-0007AW-Mz; Sat, 04 Feb 2023 23:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfL-00079f-Qb
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:14 -0500
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfH-00063U-AB
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:11 -0500
X-IronPort-RemoteIP: 209.85.222.200
X-IronPort-MID: 257704559
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vO3A16wMFFtqOC0hW656t+eJxCrEfRIJ4+MujC+fZmUNrF6WrkUFy
 DNNUGyFOPqJa2SmLowlOd7n80MOucXRmoBlSAc9qy00HyNBpPSeOdnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9j8kkPnSHdIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz18B56r8ks156yo4G9A5TTSWNgQ1LPgvyhNZH4gDfzpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZGBiuFIPM0SRqkEqShgJ70oOHKF0hXG7Ktm+t4sZJ
 N1l7fRcQOqyV0HGsL11vxJwSkmSMUDakVNuzLfWXcG7liX7n3XQL/pGBk03D7EG/fRMEHB/z
 eY7DzM0Xx2AmLfjqF67YrEEasULKcDqOMYGuSglw2uBVbApRpfMR6iM7thdtNsyrpoWTLCOO
 oxDM2ApNkyYC/FMEg5/5JYWleO4gHXlWzdF7l+ZuMLb5kCJkVMuiOSwbYu9ltqid4J5hEzFh
 jj/zWGkLTMFF9q+9jGl/Sf57gPItWahMG4IL5Wh+/t3xVGe2GEXIBsRU1S9vL++kEHWZj5EA
 0kd+y5rtKtrsULxFoG7UBq/r3qJ+BUbXrK8DtEH1e1E8YKMiy7xO4TOZmcphAAO3CPueQEX6
 w==
IronPort-HdrOrdr: A9a23:r06DVq9xobFp8TqxeCZuk+ACI+orL9Y04lQ7vn2ZhyYlFvBw8P
 re5sjzsCWftN9/YgBHpTntAtjjfZq+z+8P3WBuB8baYOCOggLBR/AA0WKL+V3d8kbFh4lgPM
 lbAs1DIey1J3RByejB3CmEP+AJ/OSnmZrY+Ns2DE0AceipUcxdBstCZDpzancGPDWuzKBXda
 ah2g==
Received: from mail-qk1-f200.google.com ([209.85.222.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:30:02 -0500
Received: by mail-qk1-f200.google.com with SMTP id
 s7-20020a05620a0bc700b006e08208eb31so5907988qki.3
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rvP5k1rmAXfh7JYQij3FrIYNCTHOmqDDIiNwc9PzRPU=;
 b=bUZtyw74uVyLABtfdJL473f562O5cM2/4ow8K8al7NP+3J1OccuZN3n1qCxCmsZsjg
 PRY38nDTO2eiDl05mDRm/HTqmPytvCO1rnqAzkO/RCnABkDb2ukVgseOrT0KsaraTGss
 q5N3CJEluTfDSKrVFrjTdLmpqHd3bncIzYb6IlsMWhWvHG5qrYlPoKPabJt4nuKHV0qD
 MYh+/9we54Xdv3n14xsAYZfTlOklLqhEuaSECRERziwBVtZjr7unCepaZInBgJECLldQ
 4toZWyQiGhJ36bUCIDNtTLuizg6ebTwZUO8RGWYIYTGlIi19Vy14GVsYn1JS2+BHkfuX
 Qvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rvP5k1rmAXfh7JYQij3FrIYNCTHOmqDDIiNwc9PzRPU=;
 b=nUW5LOTwepMkT/zvIYhlpTNNoZzQ6oGJniNzvnicp+MdIH+R+WnF8aA2aShh0lD2VH
 VZmycl/6a73s6eYY4aqrkP/RjqVwD2Vp6MDPlV6cJ7KTvHKkdZQTj3zE7+z9vik4IDpI
 nBANIgtEYMng2tQVcyWYFVRTNi5njh3LEon5VK0YN1TDje1fazrF9Dju8UfAagL3bWPK
 cTc5TbTNl4rJToaFzE0jhRRYzsd4wmhQdOFu5/QvBI2slzR7/j5FPHvRc55OgX/IU62F
 67G5+wkbX0VSKKMfeKAK3LtGXWZDqRSBcQw16wWs+tqgBT3Z6yiC0JOlkxp9i1AZcGG4
 reBQ==
X-Gm-Message-State: AO0yUKU9P+p01fzeNllmUh2v6shDUb1M5b5/PNGF6XoS9EK8YmOcxa9w
 fxpzQHDStvYvXHLNdhODtzUNYoOjmF41SYXi6W0JvrxTybMkBOzdlXnrZ/DlwfgMu9so3OwTS7R
 cMvnYt6RLdynNQleORNCwA2g1YO9nzA==
X-Received: by 2002:ac8:4e81:0:b0:3a5:d1a:8f1d with SMTP id
 1-20020ac84e81000000b003a50d1a8f1dmr28743017qtp.27.1675571401648; 
 Sat, 04 Feb 2023 20:30:01 -0800 (PST)
X-Google-Smtp-Source: AK7set/DbkMmyqMlkTWDGD6BOj25aainzoPjihffVFkv19crQ1D3bIa7bRg5FW/Pra7bQ6i8gXtk9Q==
X-Received: by 2002:ac8:4e81:0:b0:3a5:d1a:8f1d with SMTP id
 1-20020ac84e81000000b003a50d1a8f1dmr28742991qtp.27.1675571401337; 
 Sat, 04 Feb 2023 20:30:01 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a05620a16b900b0072ed644bb0dsm4116119qkj.97.2023.02.04.20.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:30:00 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 00/10] Retire Fork-Based Fuzzing
Date: Sat,  4 Feb 2023 23:29:41 -0500
Message-Id: <20230205042951.3570008-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hello,
This series removes fork-based fuzzing.
How does fork-based fuzzing work?
 * A single parent process initializes QEMU
 * We identify the devices we wish to fuzz (fuzzer-dependent)
 * Use QTest to PCI enumerate the devices
 * After that we start a fork-server which forks the process and executes
   fuzzer inputs inside the disposable children.

In a normal fuzzing process, everything happens in a single process.

Pros of fork-based fuzzing:
 * We only need to do common configuration once (e.g. PCI enumeration).
 * Fork provides a strong guarantee that fuzzer inputs will not interfere with
   each-other
 * The fuzzing process can continue even after a child-process crashes
 * We can apply our-own timers to child-processes to exit slow inputs, early

Cons of fork-based fuzzing:
 * Fork-based fuzzing is not supported by libfuzzer. We had to build our own
   fork-server and rely on tricks using linker-scripts and shared-memory to
   support fuzzing. ( https://physics.bu.edu/~alxndr/libfuzzer-forkserver/ )
 * Fork-based fuzzing is currently the main blocker preventing us from enabling
   other fuzzers such as AFL++ on OSS-Fuzz
 * Fork-based fuzzing may be a reason why coverage-builds are failing on
   OSS-Fuzz. Coverage is an important fuzzing metric which would allow us to
   find parts of the code that are not well-covered.
 * Fork-based fuzzing has high overhead. fork() is an expensive system-call,
   especially for processes running ASAN (with large/complex) VMA layouts.
 * Fork prevents us from effectively fuzzing devices that rely on
   threads (e.g. qxl).

These patches remove fork-based fuzzing and replace it with reboot-based
fuzzing for most cases. Misc notes about this change:
 * libfuzzer appears to be no longer in active development. As such, the
   current implementation of fork-based fuzzing (while having some nice
   advantages) is likely to hold us back in the future. If these changes
   are approved and appear to run successfully on OSS-Fuzz, we should be
   able to easily experiment with other fuzzing engines (AFL++).
 * Some device do not completely reset their state. This can lead to
   non-reproducible crashes. However, in my local tests, most crashes
   were reproducible. OSS-Fuzz shouldn't send us reports unless it can
   consistently reproduce a crash.
 * In theory, the corpus-format should not change, so the existing
   corpus-inputs on OSS-Fuzz will transfer to the new reset()-able
   fuzzers.
 * Each fuzzing process will now exit after a single crash is found. To
   continue the fuzzing process, use libfuzzer flags such as -jobs=-1
 * We no long control input-timeouts (those are handled by libfuzzer).
   Since timeouts on oss-fuzz can be many seconds long, I added a limit
   on the number of DMA bytes written.
 

Alexander Bulekov (10):
  hw/sparse-mem: clear memory on reset
  fuzz: add fuzz_reboot API
  fuzz/generic-fuzz: use reboots instead of forks to reset state
  fuzz/generic-fuzz: add a limit on DMA bytes written
  fuzz/virtio-scsi: remove fork-based fuzzer
  fuzz/virtio-net: remove fork-based fuzzer
  fuzz/virtio-blk: remove fork-based fuzzer
  fuzz/i440fx: remove fork-based fuzzer
  fuzz: remove fork-fuzzing scaffolding
  docs/fuzz: remove mentions of fork-based fuzzing

 docs/devel/fuzzing.rst              |  22 +-----
 hw/mem/sparse-mem.c                 |  13 +++-
 meson.build                         |   4 -
 tests/qtest/fuzz/fork_fuzz.c        |  41 ----------
 tests/qtest/fuzz/fork_fuzz.h        |  23 ------
 tests/qtest/fuzz/fork_fuzz.ld       |  56 --------------
 tests/qtest/fuzz/fuzz.c             |   6 ++
 tests/qtest/fuzz/fuzz.h             |   2 +-
 tests/qtest/fuzz/generic_fuzz.c     | 111 +++++++---------------------
 tests/qtest/fuzz/i440fx_fuzz.c      |  27 +------
 tests/qtest/fuzz/meson.build        |   6 +-
 tests/qtest/fuzz/virtio_blk_fuzz.c  |  51 ++-----------
 tests/qtest/fuzz/virtio_net_fuzz.c  |  54 ++------------
 tests/qtest/fuzz/virtio_scsi_fuzz.c |  51 ++-----------
 14 files changed, 72 insertions(+), 395 deletions(-)
 delete mode 100644 tests/qtest/fuzz/fork_fuzz.c
 delete mode 100644 tests/qtest/fuzz/fork_fuzz.h
 delete mode 100644 tests/qtest/fuzz/fork_fuzz.ld

-- 
2.39.0


