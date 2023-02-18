Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B488869B708
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 01:44:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTBK3-0006GN-Kl; Fri, 17 Feb 2023 19:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3KR_wYwsKCk4qs0u71uE93ww44w1u.s426u2A-tuBu1343w3A.47w@flex--ackerleytng.bounces.google.com>)
 id 1pTBK1-0006GE-Dm
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 19:43:25 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3KR_wYwsKCk4qs0u71uE93ww44w1u.s426u2A-tuBu1343w3A.47w@flex--ackerleytng.bounces.google.com>)
 id 1pTBJz-0003L6-M1
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 19:43:25 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 v74-20020a252f4d000000b0087f69905709so2651785ybv.10
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 16:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9mwmDPnm22mSNSwTn0VodViIvXaPz9XlM8QDWYhbyM8=;
 b=eMm01hnumElMl3UotGf8lJtLmKUjjLEmp4ZHK0o1H0LRyNA5w7x33BZeE7ifCfM7pg
 Cd3CBejXIUZT0dDASkiYet2Q11r1oqaxT2jWL7729gQTvNyIV+Z3A265SCXl8KKZFvM6
 J2aSWma9rqTSDwyH7vONqfORZObAwWA+6hRLW5QjldLuMtFrDr6CiZLUw313wtVBTkEY
 Uql860ZaIf2fzbiPBXmxv8De94uhU4jaykP5woFVxM5M2xVs65vFvbC27a8oelqLROik
 ucodFnqa/c0QR5Ark7refIrmAYAsOKE19K26vuVEVEq0bwodrw1HGi4stiNrcoXlrrSh
 sdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9mwmDPnm22mSNSwTn0VodViIvXaPz9XlM8QDWYhbyM8=;
 b=cY27fW1NBAcrhgnsxT2h5zV8gsCx54nQyR/L1xhY70pqKj8r0xyUv+uQmuw7jKDly2
 PR8EzDar6T3nl8w8foNqun5qs0VFIsnvl++puorE5GAVgu2/0JXRke5KmQb2snDen+9R
 O0LXMPUGdHNEEA5e4xGsW58yPDD8sRDmDWLuus7pJ1WwAWNTtY1KL5hCd5IoF4UExU8C
 RwP5PTvOkxMDe/djsUB0Yj9TXBI8t5UpCD0+TnC5Z2uYkJX30UyptjdXkqvxYTOUm51X
 1y6s3GGHRvJcvndXvo8F1pUjkyrlteChsqS/s96h1E1NqVkFqtQYlbGOXBww96erUXYK
 wwlw==
X-Gm-Message-State: AO0yUKWp6rM5v4MWJ8Hrh5SGyOHtKt0OyW+vPswZnxmCPhCZm+CL/Prr
 Kag1LjexTtjqENJUQKvJuuF+bor5+YufeMgFVw==
X-Google-Smtp-Source: AK7set8GCw+l6Q5gppx0SI7xgHF70UCy3j05OUIa+XJfbCoB3vIVoiRjffivwnfUze8k0uHuDZvSsWzxIhc/w0Mo2w==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a05:6902:10e:b0:95d:6b4f:a73a with
 SMTP id o14-20020a056902010e00b0095d6b4fa73amr5895ybh.8.1676681001601; Fri,
 17 Feb 2023 16:43:21 -0800 (PST)
Date: Sat, 18 Feb 2023 00:43:02 +0000
In-Reply-To: <cover.1676680548.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1676680548.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <67956539824ea9dd66a94d67b046b2f4bb0aa6f2.1676680548.git.ackerleytng@google.com>
Subject: [RFC PATCH 2/2] selftests: restrictedmem: Add selftest for
 RMFD_HUGEPAGE
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3KR_wYwsKCk4qs0u71uE93ww44w1u.s426u2A-tuBu1343w3A.47w@flex--ackerleytng.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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

Tests that when RMFD_HUGEPAGE is specified, restrictedmem will be
backed by Transparent HugePages.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../restrictedmem_hugepage_test.c             | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/testing/selftests/restrictedmem/restrictedmem_hugepage_test.c b/tools/testing/selftests/restrictedmem/restrictedmem_hugepage_test.c
index 0d9cf2ced754..75283d68696f 100644
--- a/tools/testing/selftests/restrictedmem/restrictedmem_hugepage_test.c
+++ b/tools/testing/selftests/restrictedmem/restrictedmem_hugepage_test.c
@@ -180,6 +180,31 @@ TEST_F(reset_shmem_enabled, restrictedmem_fstat_shmem_enabled_always)
 	close(mfd);
 }
 
+TEST(restrictedmem_invalid_flags)
+{
+	int mfd = memfd_restricted(99, NULL);
+
+	ASSERT_EQ(-1, mfd);
+	ASSERT_EQ(EINVAL, errno);
+}
+
+TEST_F(reset_shmem_enabled, restrictedmem_rmfd_hugepage)
+{
+	int mfd = -1;
+	struct stat stat;
+
+	ASSERT_EQ(0, set_shmem_thp_policy("never"));
+
+	mfd = memfd_restricted(RMFD_HUGEPAGE, NULL);
+	ASSERT_NE(-1, mfd);
+
+	ASSERT_EQ(0, fstat(mfd, &stat));
+
+	ASSERT_EQ(stat.st_blksize, get_hpage_pmd_size());
+
+	close(mfd);
+}
+
 TEST(restrictedmem_tmpfile_no_mount_path)
 {
 	int mfd = memfd_restricted(RMFD_TMPFILE, NULL);
-- 
2.39.2.637.g21b0678d19-goog


