Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75285698969
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 01:42:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSSLB-0004uc-Rj; Wed, 15 Feb 2023 19:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3uXvtYwsKCowqs0u71uE93ww44w1u.s426u2A-tuBu1343w3A.47w@flex--ackerleytng.bounces.google.com>)
 id 1pSSL8-0004tv-HU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 19:41:35 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3uXvtYwsKCowqs0u71uE93ww44w1u.s426u2A-tuBu1343w3A.47w@flex--ackerleytng.bounces.google.com>)
 id 1pSSL6-0006QJ-Og
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 19:41:34 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 y15-20020a1709029b8f00b00198e0564d73so192038plp.22
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 16:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KyDL7aG5vadqxs1ZDVMtNmlMp6h+pTwRitO0Vsd+xXA=;
 b=UlyGz18Rq6eKdsAzT90nvKAGzObDlWojIa+4RUu1raCFtQqRUYcy3SspX0jxdJ9rb0
 Nw7weHMdrBLZ31wvo1gRWxGi06bUObPJDZmDnyE3qo/jMx6/HDaZTvkl6TQazEiCG569
 utifp/LkZIaUBLsxN8fp/8hujvgldojhDyaXNaI8MeFAbY3JeVjvD0NkW2/MUJ28e42V
 ZMWfGCIgfQWx7Q2YfH7HNWCie5aE+GUgO/fc5leiKryY6MB/sRZht4uh4VjIQkc1sgzj
 o5tcKSvOUm3vBr0kx5kdnMHT1xneMoUIuFwr5LQO2CkBOhtS2iifTcqrX4jc6sGsYjIC
 IkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KyDL7aG5vadqxs1ZDVMtNmlMp6h+pTwRitO0Vsd+xXA=;
 b=kEOyt6zPaWeGmxqHhENaQRZ4qJRaNyySnYZBTnnKrivTk5rqWwxBl9TTTzCjEzRU63
 EqLF21PoLvIAM/wbDNbpu4Lvo+AwGZ9iy4Mvk+SJ1X11CM1UhaQw+AS+mo06wkl1M6y7
 8XU2/gRP8NlxQxxGtEJXQSjzzK3SJvg5ULa3AFutBH0QB53ikn28MadRjUBU7EYsU559
 OxujwKsiTAUqa24+8hSz7kyuuWsDGwHbEShLK++cJWdB+NPnmvAA+FExuDw3Cs9a8m+D
 AXzQaKCcuhDth594lZ3JXigxP/ykEdaqYgyURuRQVQxm8aU+cB2jTYE4SRNPWk12+OlO
 Vehg==
X-Gm-Message-State: AO0yUKWSejl/YfyFgORYFqexpAPHmlX/YkjBZsHcG0CmcE1YmQuYEO5E
 SwN0Ul7Fll5a51qCOzdQ7/6z/+3X3qqJE583Jg==
X-Google-Smtp-Source: AK7set9ULYqZvTPKnXy7w+XwzeOZWCcMQ4uqZfm4qVlxGYvM8N3GKtC4fbQQyb++BnxdRdIQAt0St6aX14Ha/b9zJw==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a63:7a1c:0:b0:4fb:ab27:fa7 with SMTP
 id v28-20020a637a1c000000b004fbab270fa7mr637750pgc.0.1676508089776; Wed, 15
 Feb 2023 16:41:29 -0800 (PST)
Date: Thu, 16 Feb 2023 00:41:15 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.637.g21b0678d19-goog
Message-ID: <cover.1676507663.git.ackerleytng@google.com>
Subject: [RFC PATCH 0/2] Providing mount for memfd_restricted() syscall
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org
Cc: chao.p.peng@linux.intel.com, aarcange@redhat.com, ak@linux.intel.com, 
 akpm@linux-foundation.org, arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, 
 corbet@lwn.net, dave.hansen@intel.com, david@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, hpa@zytor.com, hughd@google.com, jlayton@kernel.org, 
 jmattson@google.com, joro@8bytes.org, jun.nakajima@intel.com, 
 kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, luto@kernel.org, 
 mail@maciej.szmigiero.name, mhocko@suse.com, michael.roth@amd.com, 
 mingo@redhat.com, naoya.horiguchi@nec.com, pbonzini@redhat.com, 
 qperret@google.com, rppt@kernel.org, seanjc@google.com, shuah@kernel.org, 
 steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com, 
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org, 
 yu.c.zhang@linux.intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3uXvtYwsKCowqs0u71uE93ww44w1u.s426u2A-tuBu1343w3A.47w@flex--ackerleytng.bounces.google.com;
 helo=mail-pl1-x649.google.com
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

This patchset builds upon the memfd_restricted() system call that has
been discussed in the =E2=80=98KVM: mm: fd-based approach for supporting KV=
M=E2=80=99
patch series, at
https://lore.kernel.org/lkml/20221202061347.1070246-1-chao.p.peng@linux.int=
el.com/T/#m7e944d7892afdd1d62a03a287bd488c56e377b0c

The tree can be found at:
https://github.com/googleprodkernel/linux-cc/tree/restrictedmem-provide-mou=
nt-path

In this patchset, a modification to the memfd_restricted() syscall is
proposed, which allows userspace to provide a mount, on which the file
will be created and returned from the memfd_restricted().

Allowing userspace to provide a mount allows userspace to control
various memory binding policies via tmpfs mount options, such as
Transparent HugePage memory allocation policy through
=E2=80=98huge=3Dalways/never=E2=80=99 and NUMA memory allocation policy thr=
ough
=E2=80=98mpol=3Dlocal/bind:*=E2=80=99.

Dependencies:
+ Sean=E2=80=99s iteration of the =E2=80=98KVM: mm: fd-based approach for s=
upporting
  KVM=E2=80=99 patch series at
  https://github.com/sean-jc/linux/tree/x86/upm_base_support
+ Proposed fixes for these issues mentioned on the mailing list:
    + https://lore.kernel.org/lkml/diqzzga0fv96.fsf@ackerleytng-cloudtop-sg=
.c.googlers.com/

Future work/TODOs:
+ man page for the memfd_restricted() syscall
+ Support for per file Transparent HugePage allocation hints
+ Support for per file NUMA binding hints

Ackerley Tng (2):
  mm: restrictedmem: Allow userspace to specify mount_path for
    memfd_restricted
  selftests: restrictedmem: Check hugepage-ness of shmem file backing
    restrictedmem fd

 include/linux/syscalls.h                      |   2 +-
 include/uapi/linux/restrictedmem.h            |   8 +
 mm/restrictedmem.c                            |  63 +++-
 tools/testing/selftests/Makefile              |   1 +
 .../selftests/restrictedmem/.gitignore        |   3 +
 .../testing/selftests/restrictedmem/Makefile  |  14 +
 .../testing/selftests/restrictedmem/common.c  |   9 +
 .../testing/selftests/restrictedmem/common.h  |   8 +
 .../restrictedmem_hugepage_test.c             | 344 ++++++++++++++++++
 9 files changed, 445 insertions(+), 7 deletions(-)
 create mode 100644 include/uapi/linux/restrictedmem.h
 create mode 100644 tools/testing/selftests/restrictedmem/.gitignore
 create mode 100644 tools/testing/selftests/restrictedmem/Makefile
 create mode 100644 tools/testing/selftests/restrictedmem/common.c
 create mode 100644 tools/testing/selftests/restrictedmem/common.h
 create mode 100644 tools/testing/selftests/restrictedmem/restrictedmem_hug=
epage_test.c

--
2.39.1.637.g21b0678d19-goog

