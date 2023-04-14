Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3ED6E18D6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 02:13:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn72t-0007go-Vr; Thu, 13 Apr 2023 20:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UJo4ZAsKCo8tv3xA4xHC6zz77z4x.v759x5D-wxEx4676z6D.7Az@flex--ackerleytng.bounces.google.com>)
 id 1pn72q-0007gY-KC
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:12:04 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UJo4ZAsKCo8tv3xA4xHC6zz77z4x.v759x5D-wxEx4676z6D.7Az@flex--ackerleytng.bounces.google.com>)
 id 1pn72o-00038E-Ml
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:12:04 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 h64-20020a638343000000b0050760997f4dso6818602pge.6
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 17:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681431120; x=1684023120;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=LGz+M9nFtzHbGGbLaqDB42+XLCRk5tnoOBaeHE6w0dg=;
 b=S5LluL5NFzRfMffvrC48pA8vM9jBztEWtYOdVu6RC2ufBdtUUSqD+XyBpvK1yq+IN2
 IHnZhiT1W0yssxQ4r7Y9clMkV6zvB2ogiOPODlbRwrRyDr07/qDDpZBBDVLk/N65uZzy
 CN1ozoAyt0GCn/Q/UB/ZvGZUO3F2PMmedv6i9jH6jJ0uY0cAH01PJa7G0h1cPoPbYq3f
 IdXBPJH4a6Ro/C6Sct1ltwBhbcLCAMsdz4Y30Y2jgpBNq+x1h2YwjODMyjFmoi8MJRCf
 dDhFwUgzHhEfG/8I1Qg7KrBG7Crz9lPVWk5qe+WYi0MTtv3ZN9nLmsTMDMwmdbsD2L57
 OQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681431120; x=1684023120;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LGz+M9nFtzHbGGbLaqDB42+XLCRk5tnoOBaeHE6w0dg=;
 b=HVoy6hIpE5iFT6y/TSWmZ4YcZnlv7OKY3b5zoLzvxq8YDfytXo/ZtXY1NbNRVKRVbU
 2NYfeKr7uHPyaBvkEr/741X31ZwoWD4Jlf0ScPRpI77rHTGsR3lnANsdcyjuZgm9+bEq
 WAA+BnbpAcUgik5ffFlD1mslnqlDkpd3H5Yuvjyvr7lOd+nfUdFZxkZmsT4BbroZsiAp
 n/+9U+/ciwC1dpLz7Z8N7EnKcRLVXMO7qsBRKp1cvE5pEWcC5NhnrkX3zAqOIlG6CT8T
 KbWT8At5ARH+ZsUlOYs3EJvlWUJ42LFDb/YiLuu00UtVzEO5Y8kK3tJfj8RvtR+s4303
 +X0w==
X-Gm-Message-State: AAQBX9cRdfD0S6bF3r17ONqxcfXwCaVP96b5bpCYhI9U0f0wJVoHyBzd
 lKD0L4VmLc6k7AzqCsXuyjD9dpHjJcN23J8MFg==
X-Google-Smtp-Source: AKy350YIYIzzkTKMTgAPyGCMhA2HHi565MHAj4RU3xofJGGDi/ggUb7Aj3J6+1abX8zL+AMGXGGHN+6shLHAP2f2mA==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:902:bd90:b0:19a:f9d9:28d4 with
 SMTP id q16-20020a170902bd9000b0019af9d928d4mr282396pls.3.1681431120479; Thu,
 13 Apr 2023 17:12:00 -0700 (PDT)
Date: Fri, 14 Apr 2023 00:11:50 +0000
In-Reply-To: <cover.1681430907.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1681430907.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <476aa5a107994d293dcdfc5a620cc52f625768c2.1681430907.git.ackerleytng@google.com>
Subject: [RFC PATCH 1/6] mm: shmem: Refactor out shmem_shared_policy() function
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
 yu.c.zhang@linux.intel.com, muchun.song@linux.dev, feng.tang@intel.com, 
 brgerst@gmail.com, rdunlap@infradead.org, masahiroy@kernel.org, 
 mailhol.vincent@wanadoo.fr, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3UJo4ZAsKCo8tv3xA4xHC6zz77z4x.v759x5D-wxEx4676z6D.7Az@flex--ackerleytng.bounces.google.com;
 helo=mail-pg1-x54a.google.com
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

Refactor out shmem_shared_policy() to allow reading of a file's shared
mempolicy

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 include/linux/shmem_fs.h |  7 +++++++
 mm/shmem.c               | 10 ++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index d9e57485a686..bc1eeb4b4bd9 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -134,6 +134,13 @@ static inline bool shmem_file(struct file *file)
 	return shmem_mapping(file->f_mapping);
 }
 
+static inline struct shared_policy *shmem_shared_policy(struct file *file)
+{
+	struct inode *inode = file_inode(file);
+
+	return &SHMEM_I(inode)->policy;
+}
+
 /*
  * If fallocate(FALLOC_FL_KEEP_SIZE) has been used, there may be pages
  * beyond i_size's notion of EOF, which fallocate has committed to reserving:
diff --git a/mm/shmem.c b/mm/shmem.c
index b053cd1f12da..4f801f398454 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2248,20 +2248,22 @@ unsigned long shmem_get_unmapped_area(struct file *file,
 }
 
 #ifdef CONFIG_NUMA
+
 static int shmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpol)
 {
-	struct inode *inode = file_inode(vma->vm_file);
-	return mpol_set_shared_policy(&SHMEM_I(inode)->policy, vma, mpol);
+	struct shared_policy *info;
+
+	info = shmem_shared_policy(vma->vm_file);
+	return mpol_set_shared_policy(info, vma, mpol);
 }
 
 static struct mempolicy *shmem_get_policy(struct vm_area_struct *vma,
 					  unsigned long addr)
 {
-	struct inode *inode = file_inode(vma->vm_file);
 	pgoff_t index;
 
 	index = ((addr - vma->vm_start) >> PAGE_SHIFT) + vma->vm_pgoff;
-	return mpol_shared_policy_lookup(&SHMEM_I(inode)->policy, index);
+	return mpol_shared_policy_lookup(shmem_shared_policy(vma->vm_file), index);
 }
 #endif
 
-- 
2.40.0.634.g4ca3ef3211-goog


