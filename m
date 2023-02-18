Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05B669B707
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 01:44:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTBJq-0006Dl-Vv; Fri, 17 Feb 2023 19:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HB_wYwsKCkEdfnhuoh1wqjjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--ackerleytng.bounces.google.com>)
 id 1pTBJp-0006Db-EY
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 19:43:13 -0500
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HB_wYwsKCkEdfnhuoh1wqjjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--ackerleytng.bounces.google.com>)
 id 1pTBJn-0003Ji-M7
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 19:43:13 -0500
Received: by mail-pf1-x44a.google.com with SMTP id
 h11-20020a056a00230b00b005a8c5cd5ae9so1479569pfh.22
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 16:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IBSmhJ9ipoo0Oy2qay0G1ptCUfzuQODOJj/hstMVcmk=;
 b=imEYDxwwEn/4CYQJK/xJbuIKiY4mo1+nmV8jIzdJV4eI/764dz2m+meDh01JJx5t6S
 UIDNGlzyUfdjUTeiAJzDkPKXM9ee8xLByXrj//WGSQK41Cv/mEvHlEm6RlwI6jwkSLed
 hos8h3ENVYDv87MnLgF7CM4L7vKUHazOqBLi/CiV+d+RzuXI890doOjYQvUc62aO48q7
 dm6NLSSGIcCfcUC2cr4b2EIp8NOescyaa3gXQ5KN84+KXumeahL4bqGEJcSFMld18wEW
 NhulrdZvIphBlSYDfp+H6ogHt67d94O36qMzB3gwpX83PL5ljNrIzL+GKkQGwlnPgWtv
 rrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IBSmhJ9ipoo0Oy2qay0G1ptCUfzuQODOJj/hstMVcmk=;
 b=4g/13bLLfRuNw9snt12qZE0Pgd4n/d+OJo6K2yUdwp8L8A6b/9TUvProDDBfVBAhkC
 G7GCAV303bsKGcIKALuwuIDlMqYR9YkyM5Sher5EkugPMJqHr7lLygJ57I9Y6V6a8jSY
 g7rGmlnr9YpW2Xnjvnwg+uN4lkVC+RLZKGG4ltBFFA775q0VM70JoNLGApti7S2D8Vwk
 Kkm6AKycDTdfz/DCXqk+clC0IYZNgwjIjyV/WDfvY6Qqrs8KOuQULmvolkuJLC9Vw2na
 jznYESKOgWdy79slO3+WnNNGVrc7n4IG9mwAMoxPxWyWnKBFdpzu6gXdPZm1s9aivbNs
 XKYw==
X-Gm-Message-State: AO0yUKW5lygbmuvPQHOVat3XJ5pScvBmDABogxz0GIge5+s1b8IirjUL
 ZIeSMJJ2aZmW0m8JNMOLCi7jtshwasVmwm5ALA==
X-Google-Smtp-Source: AK7set8P2InLokX7h6SGTjLxGcvTxlMTNEl08mJjOuceq+afgJzVx8eL5P++cDQs2DMPcv+E/m77nUCKI6PeSSOwnQ==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:902:f782:b0:19a:b627:b260 with
 SMTP id q2-20020a170902f78200b0019ab627b260mr419572pln.12.1676680988770; Fri,
 17 Feb 2023 16:43:08 -0800 (PST)
Date: Sat, 18 Feb 2023 00:43:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <cover.1676680548.git.ackerleytng@google.com>
Subject: [RFC PATCH 0/2] Add flag as THP allocation hint for
 memfd_restricted() syscall
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3HB_wYwsKCkEdfnhuoh1wqjjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--ackerleytng.bounces.google.com;
 helo=mail-pf1-x44a.google.com
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
https://github.com/googleprodkernel/linux-cc/tree/restrictedmem-rmfd-hugepa=
ge

Following the RFC to provide mount for memfd_restricted() syscall at
https://lore.kernel.org/lkml/cover.1676507663.git.ackerleytng@google.com/T/=
#u,
this patchset adds the RMFD_HUGEPAGE flag to the memfd_restricted()
syscall, which will hint the kernel to use Transparent HugePages to
back restrictedmem pages.

This supplements the interface proposed earlier, which requires the
creation of a tmpfs mount to be passed to memfd_restricted(), with a
more direct per-file hint.

Dependencies:

+ Sean=E2=80=99s iteration of the =E2=80=98KVM: mm: fd-based approach for s=
upporting
  KVM=E2=80=99 patch series at
  https://github.com/sean-jc/linux/tree/x86/upm_base_support
+ Proposed fix for restrictedmem_getattr() as mentioned on the mailing
  list at
  https://lore.kernel.org/lkml/diqzzga0fv96.fsf@ackerleytng-cloudtop-sg.c.g=
ooglers.com/
+ Hugh=E2=80=99s patch:
  https://lore.kernel.org/lkml/c140f56a-1aa3-f7ae-b7d1-93da7d5a3572@google.=
com/,
  which provides functionality in shmem that reads the VM_HUGEPAGE
  flag in key functions shmem_is_huge() and shmem_get_inode()

Future work/TODOs:
+ man page for the memfd_restricted() syscall
+ Support for per file NUMA binding hints

Ackerley Tng (2):
  mm: restrictedmem: Add flag as THP allocation hint for
    memfd_restricted() syscall
  selftests: restrictedmem: Add selftest for RMFD_HUGEPAGE

 include/uapi/linux/restrictedmem.h            |  1 +
 mm/restrictedmem.c                            | 27 ++++++++++++-------
 .../restrictedmem_hugepage_test.c             | 25 +++++++++++++++++
 3 files changed, 43 insertions(+), 10 deletions(-)

--
2.39.2.637.g21b0678d19-goog

