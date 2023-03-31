Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD66D2BD4
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 01:52:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piOWB-0007UJ-AN; Fri, 31 Mar 2023 19:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <31XEnZAsKCn4cemgtng0vpiiqqing.eqosgow-fgxgnpqpipw.qti@flex--ackerleytng.bounces.google.com>)
 id 1piOW9-0007U8-Lm
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 19:50:49 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <31XEnZAsKCn4cemgtng0vpiiqqing.eqosgow-fgxgnpqpipw.qti@flex--ackerleytng.bounces.google.com>)
 id 1piOW7-0000Vr-Os
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 19:50:49 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 c2-20020a62f842000000b0062d93664ad5so7029985pfm.19
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 16:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680306645;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MX7MCqmj1YYihUkBpAVlEeGMviJT2cJPKDZIN4OR+eI=;
 b=rs2Oji081/y9n1X5EoKWy+YAnL83qBuCdumcenLPrxwfD9FhAIw4hlVj4XP7/Y5Csq
 lU5b9UIB/trmNN3L2g1BONn/YlWj6kHwCJvT6fd05AaijB3WMTF8/D+hd3HfgCkafQDu
 NbHJ0a1bnlAMC3KxpgtTUZNOqAMxuDxYtesuddpHrX/ENLS89CzH5G+JzzOmQK4jvnd5
 5mTrfkQj806FnvEE68QrxmzAe0mZ26vs2memR3hQ+yGRR4Hz54qvdF34OtXX2se9Qkq6
 yuJZ+avzEi827lI5ZZjCExL+izen0tkcmYbNDaEC2FQNPb5gMHAwJLc2JI7bg+7pOI5w
 M4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680306645;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MX7MCqmj1YYihUkBpAVlEeGMviJT2cJPKDZIN4OR+eI=;
 b=NCKGMXqziVJGOgLcs/ZHmy1lcwzjmh1bHAlAGjtf2CJyGPZIEXAF/MEo8HOuoNCJni
 PkdlenJMdWT0oC0elsNQMTnGi+g7h6J8+yk7JamR+IHyvAclxdrKaXNgyZ9uuwdi8wRK
 q61LMfBDybMpfFDPJhcTVibB/jeCXR8bkxPSMo6EQwk2fcj8sz1gBMMLjv9ewe7EpF3z
 dU6Gb1htQMDi9fy7BKPOFZ7c2y1DMR/A+syVO/Hrzh4B1XGP8OUsuMVQbq4Qir2A10aU
 Ek9MpmcGovCoXMO1dabXV99gLkmPMTLfDiYMez+VWJtvNiy58ioqz44oihMxOFmun/9t
 zN1Q==
X-Gm-Message-State: AAQBX9csUtRxo5mGCus7340/AePDW3/lQVqmvycGXIb16jTvgq+W2Rht
 x1E/wZ3zTPtZ2yrIzyy+IHQa/VHqU2kpyGcd4A==
X-Google-Smtp-Source: AKy350ZJqTbZ16YecPSOF6v5SkmsCRDk16kOZmltq0SjCslWgUg34hFI5HGJzZ+7T5IgczsqwP1P6KdxKJ0KIpzgeg==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a05:6a00:a12:b0:62d:9bea:2a0c with
 SMTP id p18-20020a056a000a1200b0062d9bea2a0cmr8375791pfh.4.1680306645245;
 Fri, 31 Mar 2023 16:50:45 -0700 (PDT)
Date: Fri, 31 Mar 2023 23:50:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <cover.1680306489.git.ackerleytng@google.com>
Subject: [RFC PATCH v3 0/2] Providing mount in memfd_restricted() syscall
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org
Cc: aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org, 
 arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, 
 chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com, 
 david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, jmattson@google.com, joro@8bytes.org, 
 jun.nakajima@intel.com, kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, 
 luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com, 
 michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com, 
 pbonzini@redhat.com, qperret@google.com, rppt@kernel.org, seanjc@google.com, 
 shuah@kernel.org, steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com, 
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org, 
 yu.c.zhang@linux.intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=31XEnZAsKCn4cemgtng0vpiiqqing.eqosgow-fgxgnpqpipw.qti@flex--ackerleytng.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This patchset builds upon the memfd_restricted() system call that was
discussed in the =E2=80=98KVM: mm: fd-based approach for supporting KVM=E2=
=80=99 patch
series, at
https://lore.kernel.org/lkml/20221202061347.1070246-1-chao.p.peng@linux.int=
el.com/T/

The tree can be found at:
https://github.com/googleprodkernel/linux-cc/tree/restrictedmem-provide-mou=
nt-fd-rfc-v3

In this patchset, a modification to the memfd_restricted() syscall is
proposed, which allows userspace to provide a mount, on which the
restrictedmem file will be created and returned from the
memfd_restricted().

Allowing userspace to provide a mount allows userspace to control
various memory binding policies via tmpfs mount options, such as
Transparent HugePage memory allocation policy through
=E2=80=98huge=3Dalways/never=E2=80=99 and NUMA memory allocation policy thr=
ough
=E2=80=98mpol=3Dlocal/bind:*=E2=80=99.

Changes since RFCv2:
+ Tightened semantics to accept only fds of the root of a tmpfs mount,
  as Christian suggested
+ Added permissions check on the inode represented by the fd to guard
  against creation of restrictedmem files on read-only tmpfs
  filesystems or mounts
+ Renamed RMFD_TMPFILE to RMFD_USERMNT to better represent providing a
  userspace mount to create a restrictedmem file on
+ Updated selftests for tighter semantics and added selftests to check
  for permissions

Changes since RFCv1:
+ Use fd to represent mount instead of path string, as Kirill
  suggested. I believe using fds makes this syscall interface more
  aligned with the other syscalls like fsopen(), fsconfig(), and
  fsmount() in terms of using and passing around fds
+ Remove unused variable char *orig_shmem_enabled from selftests

Dependencies:
+ Sean=E2=80=99s iteration of the =E2=80=98KVM: mm: fd-based approach for s=
upporting
  KVM=E2=80=99 patch series at
  https://github.com/sean-jc/linux/tree/x86/upm_base_support
+ Proposed fixes for these issues mentioned on the mailing list:
    + https://lore.kernel.org/lkml/diqzzga0fv96.fsf@ackerleytng-cloudtop-sg=
.c.googlers.com/

Links to earlier patch series:
+ RFC v2: https://lore.kernel.org/lkml/cover.1679428901.git.ackerleytng@goo=
gle.com/T/
+ RFC v1: https://lore.kernel.org/lkml/cover.1676507663.git.ackerleytng@goo=
gle.com/T/

---

Ackerley Tng (2):
  mm: restrictedmem: Allow userspace to specify mount for
    memfd_restricted
  selftests: restrictedmem: Check hugepage-ness of shmem file backing
    restrictedmem fd

 include/linux/syscalls.h                      |   2 +-
 include/uapi/linux/restrictedmem.h            |   8 +
 mm/restrictedmem.c                            |  74 ++-
 tools/testing/selftests/Makefile              |   1 +
 .../selftests/restrictedmem/.gitignore        |   3 +
 .../testing/selftests/restrictedmem/Makefile  |  15 +
 .../testing/selftests/restrictedmem/common.c  |   9 +
 .../testing/selftests/restrictedmem/common.h  |   8 +
 .../restrictedmem_hugepage_test.c             | 486 ++++++++++++++++++
 9 files changed, 599 insertions(+), 7 deletions(-)
 create mode 100644 include/uapi/linux/restrictedmem.h
 create mode 100644 tools/testing/selftests/restrictedmem/.gitignore
 create mode 100644 tools/testing/selftests/restrictedmem/Makefile
 create mode 100644 tools/testing/selftests/restrictedmem/common.c
 create mode 100644 tools/testing/selftests/restrictedmem/common.h
 create mode 100644 tools/testing/selftests/restrictedmem/restrictedmem_hug=
epage_test.c

--
2.40.0.348.gf938b09366-goog

