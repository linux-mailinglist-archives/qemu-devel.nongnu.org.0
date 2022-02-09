Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD054AEFE1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:19:00 +0100 (CET)
Received: from localhost ([::1]:42520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHkzy-0007SI-WE
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:18:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1nHkwK-0005NY-25
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:15:13 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:40232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1nHkwF-0000qP-4m
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:15:11 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 554C03FFD8
 for <qemu-devel@nongnu.org>; Wed,  9 Feb 2022 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644405302;
 bh=u6LMG6TUm9R8RX8YtQaeIXNRUtYuIdIDH+I3h1/zcJc=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=SB+x7eY+ZmcMDH/ji0pU5lSLmPW+ZWTkdoI15Er8nRd4cStfR52tyqgfHTz8GFYky
 4J6KlnJXdrt5Y4Vy/H/lXPtyiSLKmRwipFIaNKDEbmX/oqgqMJsCNAwhkSvxwXhncf
 LHsXeU660ed7l//hjoUEgIH0q5tu0d7Vt9Zbx1+SBuXIKZq9aODXlh37Scw55QayQH
 pje7iUNOC6yN5EMD8s3BQbyOV0B66cbDQk5xUkAUTt38gkR5t4INoqML56+0d5abeV
 GfH6AFOlOnzRFtd/jUklKQqHo/Kft/hv8F5wWzO5VKCLtrNac/PQQ66n7yle9GQSMa
 yo8Hx6zZT6H+Q==
Received: by mail-wm1-f72.google.com with SMTP id
 c7-20020a1c3507000000b0034a0dfc86aaso2495034wma.6
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 03:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u6LMG6TUm9R8RX8YtQaeIXNRUtYuIdIDH+I3h1/zcJc=;
 b=3+5C00TCRiF4NRXyPZoDzEnnU9G2P37lRsnjjJbJ30sIbbzSaXXsS+puyeLFHaamou
 HXrHoeIZ5E+zz17zMGFTf4k1mOK9QYhJRJKfARtcAj1FP5zduiERQYaiu57LDkXm8nTL
 veeqUV/6i/SMUDptLNQY3vBOJD9+FkRRItLZCKmzmqg5alCe9emAorFXy8dlh0N69O9x
 7FFM0vAiurOXTPT3jKmRi+ezK9RqMqpDrBngN7CRZ+9jEYojY4BAJ+GEXGJnKQETxoGA
 O+nhF6gJMMsbBspa30Z+MrQo1+6FPUaB/lOjS0ND2fAm8Znm4VNryVDL3sSj7zRamyUB
 dDrA==
X-Gm-Message-State: AOAM532i/CLQhBM34EKPC1Z4mxHv7pqCmz1lekaayNtH0K9VbS8znciA
 2RBJWrBw/JEvFWFlVAnQAFxBqoOSTTOVaQOl98xY8xAke/JTfI9pvXfwkZ7SK4eKjf9DILv/vNd
 7vk8FMBxEoeK4GpoZ+j2NIKGtQwl6XtwB
X-Received: by 2002:a05:600c:b59:: with SMTP id
 k25mr1614682wmr.170.1644405300559; 
 Wed, 09 Feb 2022 03:15:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6ZS+k5Q1VIYm8PE2wQU8Z8Qz7WhUdwXDb+eMqwSD8GkMW8VVxakQnaNKP7oqi0fSScoH0ZA==
X-Received: by 2002:a05:600c:b59:: with SMTP id
 k25mr1614660wmr.170.1644405300287; 
 Wed, 09 Feb 2022 03:15:00 -0800 (PST)
Received: from localhost.localdomain (068-133-067-156.ip-addr.inexio.net.
 [156.67.133.68])
 by smtp.gmail.com with ESMTPSA id o16sm3165744wmc.25.2022.02.09.03.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 03:14:59 -0800 (PST)
From: christian.ehrhardt@canonical.com
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] tools/virtiofsd: Add rseq syscall to the seccomp allowlist
Date: Wed,  9 Feb 2022 12:14:56 +0100
Message-Id: <20220209111456.3328420-1-christian.ehrhardt@canonical.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=christian.ehrhardt@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Hudson-Doyle <michael.hudson@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Ehrhardt <christian.ehrhardt@canonical.com>

The virtiofsd currently crashes when used with glibc 2.35.
That is due to the rseq system call being added to every thread
creation [1][2].

[1]: https://www.efficios.com/blog/2019/02/08/linux-restartable-sequences/
[2]: https://sourceware.org/pipermail/libc-alpha/2022-February/136040.html

This happens not at daemon start, but when a guest connects

    /usr/lib/qemu/virtiofsd -f --socket-path=/tmp/testvfsd -o sandbox=chroot \
        -o source=/var/guests/j-virtiofs --socket-group=kvm
    virtio_session_mount: Waiting for vhost-user socket connection...
    # start ok, now guest will connect
    virtio_session_mount: Received vhost-user socket connection
    virtio_loop: Entry
    fv_queue_set_started: qidx=0 started=1
    fv_queue_set_started: qidx=1 started=1
    Bad system call (core dumped)

We have to put rseq on the seccomp allowlist to avoid that the daemon
is crashing in this case.

Reported-by: Michael Hudson-Doyle <michael.hudson@canonical.com>
Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
---
 tools/virtiofsd/passthrough_seccomp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index a3ce9f898d..21b8f53bd9 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -116,6 +116,9 @@ static const int syscall_allowlist[] = {
     SCMP_SYS(write),
     SCMP_SYS(writev),
     SCMP_SYS(umask),
+#ifdef __NR_rseq
+    SCMP_SYS(rseq), /* required since glibc 2.35 */
+#endif
 };
 
 /* Syscalls used when --syslog is enabled */
-- 
2.35.0


