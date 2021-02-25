Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5576932582C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:59:20 +0100 (CET)
Received: from localhost ([::1]:41268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFNjD-0007jk-CI
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aladjev.andrew@gmail.com>)
 id 1lFNfF-0004i6-Sn
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:55:18 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aladjev.andrew@gmail.com>)
 id 1lFNf8-0000kt-2v
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:55:13 -0500
Received: by mail-ej1-x630.google.com with SMTP id r17so11091980ejy.13
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 12:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vKKNb3uwDd4pwsQR3fJfIdzlRS+OJVaEog8q+T3DnCk=;
 b=PM3DzGaKgLIoSF7iL6DwrmOWSJ3Df1c687vo9liZc9VTNTFlPQRPF+ph+B29RkQ+wo
 wPrHrsejoHG9hHAqjDWCCShRpu8TqEsdtDcDOCaJL2axLCL78aHdUwF8BdmIFvX9SI1Q
 lBVadKdr5oy6OnIE1ybxWLUzkRjZSQPZFIXV2M3CbLgOeNFmUvtmwLLCso7NCDNao/LK
 Ab4J8reWxicBXOKORmuWS4hPNBiCNTvvfL86dybjgKUWtoDSVxWC4ASXgydIr81/b6KP
 lCq9vsDkkKyTheqjlkDPC/u1D5m5v4ubpmfhH1pKNo+WpA/IEsDKtpk1PmQ3MGgkNWxK
 zYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vKKNb3uwDd4pwsQR3fJfIdzlRS+OJVaEog8q+T3DnCk=;
 b=kgtTEBY4FN2or3buonsuDl+YbZCze+8I4WqWpLzGVqqZc37xvVEU8qUINK6FWrbGPI
 M3OYdvbQ72mhWlF8adDJZIyZApoLxgcb6Jv9NKWLTnIgbHzOgza8lUPr8mqHT0xRlIsd
 iNLVVUgxUJlqaREq6PUX7wIyCpfOucfNECISqp6n9o9hOWXF5ZMrF6AB968KEio8i656
 HPGWgxV57lKz16lq4SSn8pxp1/OA1mZcpBHkXZmI+GOE9dWMcWm2huGgkkud1cFBt20h
 8yw+dgnF2G4UYqQO7oSlf5iWjU13vuWb0RE3BGZEsLbEmUhbOGZb+7QYqVBeW8UbFvaU
 Fjxw==
X-Gm-Message-State: AOAM530Kf5maEuFFWgqCN6RaqdvoMswyJQJRXgBALnfY/Kut3RuTzF/+
 bpDOYDrjpf+LKSA7TyZRIZPi6DhAj78fpQ==
X-Google-Smtp-Source: ABdhPJzm/u0MAOqR1mj9q0eAw3nU5TUHbhuGMZj9y0voJ6wUTLiW+a7n74g5WmlROm8oN443vMx6NQ==
X-Received: by 2002:a17:906:4b02:: with SMTP id
 y2mr4525473eju.475.1614286502051; 
 Thu, 25 Feb 2021 12:55:02 -0800 (PST)
Received: from mini.lan (ns331963.ip-37-187-122.eu. [37.187.122.190])
 by smtp.gmail.com with ESMTPSA id c17sm949472edw.32.2021.02.25.12.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 12:55:01 -0800 (PST)
From: aladjev.andrew@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] linux user: added tests for proc myself
Date: Thu, 25 Feb 2021 23:54:48 +0300
Message-Id: <20210225205448.10624-4-aladjev.andrew@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210225205448.10624-1-aladjev.andrew@gmail.com>
References: <20210225205448.10624-1-aladjev.andrew@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=aladjev.andrew@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Aladjev <aladjev.andrew@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Aladjev <aladjev.andrew@gmail.com>

---
 tests/tcg/multiarch/linux-test.c | 85 ++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux-test.c
index 96bbad5..4918d45 100644
--- a/tests/tcg/multiarch/linux-test.c
+++ b/tests/tcg/multiarch/linux-test.c
@@ -517,6 +517,89 @@ static void test_shm(void)
     chk_error(shmdt(ptr));
 }
 
+static void test_proc_myself_file(void)
+{
+    int fd1, fd2;
+    char link1[PATH_MAX], link2[PATH_MAX];
+    char buf1[PATH_MAX], buf2[PATH_MAX];
+    int buf1_length, buf2_length;
+
+    /* We can open any file that will always exist. */
+    const char *file_path = "/proc/self/comm";
+
+    char file_realpath[PATH_MAX];
+    if (realpath(file_path, file_realpath) == NULL) {
+        error("proc myself: invalid file");
+    }
+
+    fd1 = chk_error(open(file_path, O_RDONLY));
+    sprintf(link1, "/proc/self/fd/%d", fd1);
+
+    /* Lets try to open same file by first link. */
+    fd2 = chk_error(open(link1, O_RDONLY));
+    sprintf(link2, "/proc/self/fd/%d", fd2);
+
+    /* Two links should point to the same file path. */
+    buf1_length = chk_error(readlink(link1, buf1, PATH_MAX));
+    if (strlen(file_realpath) != buf1_length ||
+        strncmp(file_realpath, buf1, buf1_length) != 0) {
+        error("proc myself: invalid link");
+    }
+    buf2_length = chk_error(readlink(link2, buf2, PATH_MAX));
+    if (strlen(file_realpath) != buf2_length ||
+        strncmp(file_realpath, buf2, buf2_length) != 0) {
+        error("proc myself: invalid link");
+    }
+
+    /* We should be able to read same data from each fd. */
+    buf1_length = chk_error(read(fd1, buf1, PATH_MAX));
+    buf2_length = chk_error(read(fd2, buf2, PATH_MAX));
+    if (buf1_length == 0 || buf1_length != buf2_length ||
+        strncmp(buf1, buf2, buf2_length) != 0) {
+        error("proc myself: invalid file content");
+    }
+
+    chk_error(close(fd2));
+    chk_error(close(fd1));
+}
+
+static void test_proc_myself_exe(void)
+{
+    int fd1, fd2;
+    char link1[PATH_MAX], link2[PATH_MAX];
+    char buf1[PATH_MAX], buf2[PATH_MAX];
+    int buf1_length, buf2_length;
+
+    const char *exe_path = "/proc/self/exe";
+
+    char exe_realpath[PATH_MAX];
+    if (realpath(exe_path, exe_realpath) == NULL) {
+        error("proc myself: invalid exe");
+    }
+
+    fd1 = chk_error(open(exe_path, O_RDONLY));
+    sprintf(link1, "/proc/self/fd/%d", fd1);
+
+    /* Lets try to open link once again. */
+    fd2 = chk_error(open(link1, O_RDONLY));
+    sprintf(link2, "/proc/self/fd/%d", fd2);
+
+    /* Two links should point to the same exe path. */
+    buf1_length = chk_error(readlink(link1, buf1, PATH_MAX));
+    if (strlen(exe_realpath) != buf1_length ||
+        strncmp(exe_realpath, buf1, buf1_length) != 0) {
+        error("proc myself: invalid link");
+    }
+    buf2_length = chk_error(readlink(link2, buf2, PATH_MAX));
+    if (strlen(exe_realpath) != buf2_length ||
+        strncmp(exe_realpath, buf2, buf2_length) != 0) {
+        error("proc myself: invalid link");
+    }
+
+    chk_error(close(fd2));
+    chk_error(close(fd1));
+}
+
 int main(int argc, char **argv)
 {
     test_file();
@@ -532,5 +615,7 @@ int main(int argc, char **argv)
 
     test_signal();
     test_shm();
+    test_proc_myself_file();
+    test_proc_myself_exe();
     return 0;
 }
-- 
2.26.2


