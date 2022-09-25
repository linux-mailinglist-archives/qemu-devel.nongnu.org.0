Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227C25E92D0
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:50:29 +0200 (CEST)
Received: from localhost ([::1]:51342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQ9U-00045Z-4h
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqZ-0002aW-H8
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:30:56 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqX-0006Ic-MR
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:30:55 -0400
Received: by mail-pg1-x529.google.com with SMTP id 3so4237734pga.1
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ptPSCcbuG++AcglR+Ify0H9lkcBvjcAqRFsbcccQhHg=;
 b=JRrGE8zCoW8iODFwX8r6CjMN9/8Qjd0GMphUuuvu13la6TH5AxF6ETefFqMvMTFcOG
 5A3BHJhEA+hig3nmiwA6xGceVL4GHMgh5+HSkHD58licsBJf6Vbxy/Nq5IDhPjfF3GSb
 hzpEOAUKwUQAtCRDCMrSAcza6ZsvNon0x0ANhFWD8zV/0ZCyw+/Gv0+Op6JNJXZKsUfR
 OWbsAtD9T5gddexVbw1Pk4WcWfHG96osqWDjmfMb8C61Y+rvopf4VzBXO7zakTBdHV2S
 QKSpiuCl0i0Nx5xvaj3kzMD6B1ZMNdBe3AFNotRBXrTAPQWgCf9AVZ6drPwCIhw2XnV5
 ObrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ptPSCcbuG++AcglR+Ify0H9lkcBvjcAqRFsbcccQhHg=;
 b=GaBErD8LdT/zhzOzTLOkjeEQf276Ep1KUVtkzaAKpQqiPWkZiuzKlGfym2w+NCGRLB
 A4/9qyqFmtA67VnRT3LiH6Ruuj1yn76eNbuo5WPX3qymB1VRugrrwZGt+HxIpxw2pVTB
 sqQBpgp00GAmD1K3TOpwiESniOM9JBRB3RcMD52pI4fr6PTWtlkD6JSI+EAdgSKJUCjb
 CCGd8HHQoRXzMyaKXMLvnKO8wbZ3/pl/uOPCoEja7UpquQD+Q1B842xU8KpNT9N+leOh
 0NWXHxRe4PIa5svqj9F99ED34aP8lSzVc0oDQoOGrbZyvWQiKeBpIDy7Xeeg7CMmwaVP
 UUoA==
X-Gm-Message-State: ACrzQf0oadxq/VqzpLHKUU1zbQ0/EUBhelwmCcXvJCAEvDGjXWGrXCBk
 Z5jxJ1c5PrXySeqCnY6x8CsMzadcRBs=
X-Google-Smtp-Source: AMsMyM7I7SNO8WRhF+QSPJwJBxRWG1cI/y5rV1S8CCA+Gnc6+Xisom0lvo00TakuplLJ03ukwfmVlA==
X-Received: by 2002:a63:188:0:b0:43c:22e9:2d10 with SMTP id
 130-20020a630188000000b0043c22e92d10mr13362459pgb.12.1664105452324; 
 Sun, 25 Sep 2022 04:30:52 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:30:52 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 04/54] util/qemu-sockets: Use g_get_tmp_dir() to get the
 directory for temporary files
Date: Sun, 25 Sep 2022 19:29:42 +0800
Message-Id: <20220925113032.1949844-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Replace the existing logic to get the directory for temporary files
with g_get_tmp_dir(), which works for win32 too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 util/qemu-sockets.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 83f4bd6fd2..0c41ca9e42 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -919,9 +919,8 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
     if (saddr->path[0] || abstract) {
         path = saddr->path;
     } else {
-        const char *tmpdir = getenv("TMPDIR");
-        tmpdir = tmpdir ? tmpdir : "/tmp";
-        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX", tmpdir);
+        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX",
+                                         g_get_tmp_dir());
     }
 
     pathlen = strlen(path);
-- 
2.34.1


