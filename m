Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54669896B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 01:42:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSSLI-00050r-Pr; Wed, 15 Feb 2023 19:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wXvtYwsKCpQy082F92MHB44CC492.0CAE2AI-12J29BCB4BI.CF4@flex--ackerleytng.bounces.google.com>)
 id 1pSSLG-0004xM-5o
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 19:41:42 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wXvtYwsKCpQy082F92MHB44CC492.0CAE2AI-12J29BCB4BI.CF4@flex--ackerleytng.bounces.google.com>)
 id 1pSSLD-0006b6-V8
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 19:41:41 -0500
Received: by mail-pg1-x54a.google.com with SMTP id
 r126-20020a632b84000000b004393806c06eso160063pgr.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 16:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=RwSw3tYb5bXq9fGeFYVzZ4Uji8t9bzNp02Nu0wqGVr8=;
 b=a6/aZwZMKgM9Qwg+eZcRGVXefYnK2gekXci5+402C9kYjaRKvCntG9/9UB64dqHJj4
 utKOg+syvAUy0EV4DBkBSn9lMSketoQ/IKXaOt1Z/yjVFG1HfWHMlNFXX4aNcRKANnmH
 eAPnL1XgdbYfIT8hZYQ8fObP+OEaQS1UkFxrNAsWasJb6HEbZXTNCOF/s33NcZRZ+OQk
 BqNQ/CyZLmfjBzr7r1oNqVmOkPA5/8tV65euXIZEud6Iazk/zMeKJDYccPllrwFkPAEO
 ukqjTuuwoXWvGYWEq+OSuWeuT3TY7Y2Z+KS2DU57mQtp8rwmzmbo5nddYHr9bU6Se8r/
 J7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RwSw3tYb5bXq9fGeFYVzZ4Uji8t9bzNp02Nu0wqGVr8=;
 b=UQEckRblVuXO7/u5ZoPysWF3bymHTEMHlKjJPzJlDxmvf/a4pUaN8aWPLZm7AMFcgu
 fHUqR2cZm+VKZZ1JD+8RJQkmYullL4pMW5V2ZS5/KYhRlPU2UKIuD2WWsqnG18XTyX8P
 my7x30R8t2C/WEHP9IEpqPzYqyNHvGibkknn91/K5sZLE6NPCxA9MrxgkDexYC9ew4wV
 RHoASCTw6ZjnzCLkpVYukK9A5NPZ9Hij16Q2GWtDKd4O1d7t6wjaKqEcGMmrjNQuf9VT
 nsRPzRit3CrRwuRPpHxuzfMfdnMtLzq9rke3ONJwFdm41A0tAQKfqDBUSCg695PXfM3b
 /HVA==
X-Gm-Message-State: AO0yUKWu9OzlsrgbO/vdYlC6fAftBc8wAWxqFN7Zj+BP9PaHC7Y6QbVB
 DaGerdMEXydXp85RDEtnZDVeUCiuPDqG8qfHJA==
X-Google-Smtp-Source: AK7set+Z1QsboPNl7B2dUCqzJnv4n3cQF2QXtmZ8FpQ59D9VPXhoYAFz0KibJoYgA3wgebXfV3oTbIw8kSpaDzjaOg==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:903:2594:b0:19a:b107:bd11 with
 SMTP id jb20-20020a170903259400b0019ab107bd11mr951631plb.29.1676508097502;
 Wed, 15 Feb 2023 16:41:37 -0800 (PST)
Date: Thu, 16 Feb 2023 00:41:17 +0000
In-Reply-To: <cover.1676507663.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1676507663.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.39.1.637.g21b0678d19-goog
Message-ID: <06098450437ba5ed2011090d95f6ccb817728710.1676507663.git.ackerleytng@google.com>
Subject: [RFC PATCH 2/2] selftests: restrictedmem: Check hugepage-ness of
 shmem file backing restrictedmem fd
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3wXvtYwsKCpQy082F92MHB44CC492.0CAE2AI-12J29BCB4BI.CF4@flex--ackerleytng.bounces.google.com;
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

For memfd_restricted() calls without a userspace mount, the backing
file should be the shmem mount in the kernel, and the size of backing
pages should be as defined by system-wide shmem configuration.

If a userspace mount is provided, the size of backing pages should be
as defined in the mount.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/Makefile              |   1 +
 .../selftests/restrictedmem/.gitignore        |   3 +
 .../testing/selftests/restrictedmem/Makefile  |  14 +
 .../testing/selftests/restrictedmem/common.c  |   9 +
 .../testing/selftests/restrictedmem/common.h  |   8 +
 .../restrictedmem_hugepage_test.c             | 344 ++++++++++++++++++
 6 files changed, 379 insertions(+)
 create mode 100644 tools/testing/selftests/restrictedmem/.gitignore
 create mode 100644 tools/testing/selftests/restrictedmem/Makefile
 create mode 100644 tools/testing/selftests/restrictedmem/common.c
 create mode 100644 tools/testing/selftests/restrictedmem/common.h
 create mode 100644 tools/testing/selftests/restrictedmem/restrictedmem_hugepage_test.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index f07aef7c592c..44078eeefb79 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -60,6 +60,7 @@ TARGETS += pstore
 TARGETS += ptrace
 TARGETS += openat2
 TARGETS += resctrl
+TARGETS += restrictedmem
 TARGETS += rlimits
 TARGETS += rseq
 TARGETS += rtc
diff --git a/tools/testing/selftests/restrictedmem/.gitignore b/tools/testing/selftests/restrictedmem/.gitignore
new file mode 100644
index 000000000000..2581bcc8ff29
--- /dev/null
+++ b/tools/testing/selftests/restrictedmem/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+restrictedmem_hugepage_test
diff --git a/tools/testing/selftests/restrictedmem/Makefile b/tools/testing/selftests/restrictedmem/Makefile
new file mode 100644
index 000000000000..da9665718c8a
--- /dev/null
+++ b/tools/testing/selftests/restrictedmem/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+
+CFLAGS = $(KHDR_INCLUDES)
+
+TEST_GEN_PROGS += restrictedmem_hugepage_test
+
+include ../lib.mk
+
+EXTRA_CLEAN = $(OUTPUT)/common.o
+
+$(OUTPUT)/common.o: common.c
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c -ffreestanding $< -o $@
+
+$(TEST_GEN_PROGS): $(OUTPUT)/common.o
diff --git a/tools/testing/selftests/restrictedmem/common.c b/tools/testing/selftests/restrictedmem/common.c
new file mode 100644
index 000000000000..79b2ac98cc89
--- /dev/null
+++ b/tools/testing/selftests/restrictedmem/common.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <sys/syscall.h>
+#include <unistd.h>
+
+int memfd_restricted(unsigned int flags, char *mount_path)
+{
+	return syscall(__NR_memfd_restricted, flags, mount_path);
+}
diff --git a/tools/testing/selftests/restrictedmem/common.h b/tools/testing/selftests/restrictedmem/common.h
new file mode 100644
index 000000000000..5d59edc4f23f
--- /dev/null
+++ b/tools/testing/selftests/restrictedmem/common.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef SELFTESTS_RESTRICTEDMEM_COMMON_H
+#define SELFTESTS_RESTRICTEDMEM_COMMON_H
+
+int memfd_restricted(unsigned int flags, char *mount_path);
+
+#endif  // SELFTESTS_RESTRICTEDMEM_COMMON_H
diff --git a/tools/testing/selftests/restrictedmem/restrictedmem_hugepage_test.c b/tools/testing/selftests/restrictedmem/restrictedmem_hugepage_test.c
new file mode 100644
index 000000000000..0d9cf2ced754
--- /dev/null
+++ b/tools/testing/selftests/restrictedmem/restrictedmem_hugepage_test.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "linux/limits.h"
+#include <errno.h>
+#include <limits.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+
+#include "linux/restrictedmem.h"
+
+#include "common.h"
+#include "../kselftest_harness.h"
+
+static int get_hpage_pmd_size(void)
+{
+	FILE *fp;
+	char buf[100];
+	char *ret;
+	int size;
+
+	fp = fopen("/sys/kernel/mm/transparent_hugepage/hpage_pmd_size", "r");
+	if (!fp)
+		return -1;
+
+	ret = fgets(buf, 100, fp);
+	if (ret != buf) {
+		size = -1;
+		goto out;
+	}
+
+	if (sscanf(buf, "%d\n", &size) != 1)
+		size = -1;
+
+out:
+	fclose(fp);
+
+	return size;
+}
+
+static bool is_valid_shmem_thp_policy(char *policy)
+{
+	if (strcmp(policy, "always") == 0)
+		return true;
+	if (strcmp(policy, "within_size") == 0)
+		return true;
+	if (strcmp(policy, "advise") == 0)
+		return true;
+	if (strcmp(policy, "never") == 0)
+		return true;
+	if (strcmp(policy, "deny") == 0)
+		return true;
+	if (strcmp(policy, "force") == 0)
+		return true;
+
+	return false;
+}
+
+static int get_shmem_thp_policy(char *policy)
+{
+	FILE *fp;
+	char buf[100];
+	char *left = NULL;
+	char *right = NULL;
+	int ret = -1;
+
+	fp = fopen("/sys/kernel/mm/transparent_hugepage/shmem_enabled", "r");
+	if (!fp)
+		return -1;
+
+	if (fgets(buf, 100, fp) != buf)
+		goto out;
+
+	/*
+	 * Expect shmem_enabled to be of format like "always within_size advise
+	 * [never] deny force"
+	 */
+	left = memchr(buf, '[', 100);
+	if (!left)
+		goto out;
+
+	right = memchr(buf, ']', 100);
+	if (!right)
+		goto out;
+
+	memcpy(policy, left + 1, right - left - 1);
+
+	ret = !is_valid_shmem_thp_policy(policy);
+
+out:
+	fclose(fp);
+	return ret;
+}
+
+static int set_shmem_thp_policy(char *policy)
+{
+	FILE *fp;
+	size_t len = strlen(policy);
+	int ret = -1;
+
+	if (!is_valid_shmem_thp_policy(policy))
+		return ret;
+
+	fp = fopen("/sys/kernel/mm/transparent_hugepage/shmem_enabled", "w");
+	if (!fp)
+		return ret;
+
+	if (fwrite(policy, 1, len, fp) != len)
+		goto out;
+
+	if (fwrite("\n", 1, 1, fp) != 1)
+		goto out;
+
+	ret = 0;
+
+out:
+	fclose(fp);
+	return ret;
+}
+
+FIXTURE(reset_shmem_enabled)
+{
+	/*
+	 * Expect shmem_enabled to be one of always, within_size, advise, never,
+	 * deny, force
+	 */
+	char shmem_enabled[12];
+};
+
+FIXTURE_SETUP(reset_shmem_enabled)
+{
+	memset(self->shmem_enabled, 0, 12);
+	ASSERT_EQ(0, get_shmem_thp_policy(self->shmem_enabled));
+}
+
+FIXTURE_TEARDOWN(reset_shmem_enabled)
+{
+	ASSERT_EQ(0, set_shmem_thp_policy(self->shmem_enabled));
+}
+
+TEST_F(reset_shmem_enabled, restrictedmem_fstat_shmem_enabled_never)
+{
+	int mfd = -1;
+	struct stat stat;
+	char *orig_shmem_enabled;
+
+	ASSERT_EQ(0, set_shmem_thp_policy("never"));
+
+	mfd = memfd_restricted(0, NULL);
+	ASSERT_NE(-1, mfd);
+
+	ASSERT_EQ(0, fstat(mfd, &stat));
+
+	/*
+	 * st_blksize is set based on the superblock's s_blocksize_bits. For
+	 * shmem, this is set to PAGE_SHIFT
+	 */
+	ASSERT_EQ(stat.st_blksize, getpagesize());
+
+	close(mfd);
+}
+
+TEST_F(reset_shmem_enabled, restrictedmem_fstat_shmem_enabled_always)
+{
+	int mfd = -1;
+	struct stat stat;
+	char *orig_shmem_enabled;
+
+	ASSERT_EQ(0, set_shmem_thp_policy("always"));
+
+	mfd = memfd_restricted(0, NULL);
+	ASSERT_NE(-1, mfd);
+
+	ASSERT_EQ(0, fstat(mfd, &stat));
+
+	ASSERT_EQ(stat.st_blksize, get_hpage_pmd_size());
+
+	close(mfd);
+}
+
+TEST(restrictedmem_tmpfile_no_mount_path)
+{
+	int mfd = memfd_restricted(RMFD_TMPFILE, NULL);
+
+	ASSERT_EQ(-1, mfd);
+	ASSERT_EQ(EINVAL, errno);
+}
+
+TEST(restrictedmem_tmpfile_nonexistent_mount_path)
+{
+	int mfd = memfd_restricted(RMFD_TMPFILE,
+				   "/nonexistent/nonexistent/nonexistent");
+
+	ASSERT_EQ(-1, mfd);
+	ASSERT_EQ(ENOENT, errno);
+}
+
+TEST(restrictedmem_tmpfile_not_tmpfs_mount)
+{
+	int mfd = memfd_restricted(RMFD_TMPFILE, "/proc");
+
+	ASSERT_EQ(-1, mfd);
+	ASSERT_EQ(EINVAL, errno);
+}
+
+static bool directory_exists(const char *path)
+{
+	struct stat sb;
+
+	return stat(path, &sb) == 0 && S_ISDIR(sb.st_mode);
+}
+
+FIXTURE(tmpfs_hugepage_mount_path)
+{
+	char *mount_path;
+};
+
+FIXTURE_SETUP(tmpfs_hugepage_mount_path)
+{
+	int ret = -1;
+
+	/* /tmp is an FHS-mandated world-writable directory */
+	self->mount_path = "/tmp/restrictedmem-selftest-mnt";
+
+	if (!directory_exists(self->mount_path)) {
+		ret = mkdir(self->mount_path, 0777);
+		ASSERT_EQ(0, ret);
+	}
+}
+
+FIXTURE_TEARDOWN(tmpfs_hugepage_mount_path)
+{
+	int ret = -1;
+
+	if (!directory_exists(self->mount_path))
+		return;
+
+	ret = umount2(self->mount_path, MNT_FORCE);
+	EXPECT_EQ(0, ret);
+	if (ret == -1 && errno == EINVAL)
+		fprintf(stderr, "%s was not mounted\n", self->mount_path);
+
+	ret = rmdir(self->mount_path);
+	ASSERT_EQ(0, ret);
+}
+
+TEST_F(tmpfs_hugepage_mount_path, restrictedmem_fstat_tmpfs_huge_always)
+{
+	int ret = -1;
+	int mfd = -1;
+	struct stat stat;
+
+	ret = mount("name", self->mount_path, "tmpfs", 0, "huge=always");
+	ASSERT_EQ(0, ret);
+
+	mfd = memfd_restricted(RMFD_TMPFILE, self->mount_path);
+	ASSERT_NE(-1, mfd);
+
+	ret = fstat(mfd, &stat);
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(stat.st_blksize, get_hpage_pmd_size());
+
+	close(mfd);
+}
+
+TEST_F(tmpfs_hugepage_mount_path, restrictedmem_fstat_tmpfs_huge_never)
+{
+	int ret = -1;
+	int mfd = -1;
+	struct stat stat;
+
+	ret = mount("name", self->mount_path, "tmpfs", 0, "huge=never");
+	ASSERT_EQ(0, ret);
+
+	mfd = memfd_restricted(RMFD_TMPFILE, self->mount_path);
+	ASSERT_NE(-1, mfd);
+
+	ret = fstat(mfd, &stat);
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(stat.st_blksize, getpagesize());
+
+	close(mfd);
+}
+
+TEST_F(tmpfs_hugepage_mount_path, restrictedmem_umount_rmdir_while_file_open)
+{
+	int ret = -1;
+	int mfd = -1;
+
+	ret = mount("name", self->mount_path, "tmpfs", 0, "huge=always");
+	ASSERT_EQ(0, ret);
+
+	mfd = memfd_restricted(RMFD_TMPFILE, self->mount_path);
+	ASSERT_NE(-1, mfd);
+
+	ret = umount2(self->mount_path, MNT_FORCE);
+	ASSERT_EQ(-1, ret);
+	ASSERT_EQ(EBUSY, errno);
+
+	ret = rmdir(self->mount_path);
+	ASSERT_EQ(-1, ret);
+	ASSERT_EQ(EBUSY, errno);
+
+	close(mfd);
+}
+
+TEST_F(tmpfs_hugepage_mount_path, restrictedmem_provide_mount_subdir)
+{
+	int ret = -1;
+	int mfd = -1;
+	struct stat stat;
+	char subdir_path[PATH_MAX] = {0};
+
+	ret = mount("name", self->mount_path, "tmpfs", 0, "huge=always");
+	ASSERT_EQ(0, ret);
+
+	snprintf(subdir_path, PATH_MAX, "%s/%s", self->mount_path, "subdir");
+	ret = mkdir(subdir_path, 0777);
+	ASSERT_EQ(0, ret);
+
+	/*
+	 * Any subdirectory of a tmpfs mount can be provided to memfd_restricted
+	 * as a reference to a mount
+	 */
+	mfd = memfd_restricted(RMFD_TMPFILE, subdir_path);
+	ASSERT_NE(-1, mfd);
+
+	ret = fstat(mfd, &stat);
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(stat.st_blksize, get_hpage_pmd_size());
+
+	/*
+	 * shmem file is created at the mount, so the subdirectory can be
+	 * removed without issues.
+	 */
+	ret = rmdir(subdir_path);
+	ASSERT_EQ(0, ret);
+
+	close(mfd);
+}
+
+TEST_HARNESS_MAIN
-- 
2.39.1.637.g21b0678d19-goog


