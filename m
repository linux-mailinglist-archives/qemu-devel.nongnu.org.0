Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B88530E7E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 13:02:21 +0200 (CEST)
Received: from localhost ([::1]:49678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt5pL-0002RA-UR
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 07:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1nt5iL-0005Zo-Ui
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:55:09 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1nt5iK-0003fH-2T
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:55:05 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u3so20796592wrg.3
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 03:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27MNjIwIqzw8UU20vNPY6Z6WLQg0LeR47nmbgO2v/CQ=;
 b=pyl5um+YSWjIdCJphE+m4TsoQGegPLJg7hZvCzjiudYei5f1aYvBa0gUBqtqz0K6o/
 8+jjbZYsm8Tc405EzTiuMydvo8GlHNM5eAQvc1ouXbA7jIFIOM1Mlc58c7wfK2Le+OIu
 xQpQwmS/x81gq7UXKbg7DSxhTNRIVJtiCCx3LvQGXVg/qGH53kuz9oduopxOPt91Z5Qj
 c82CCmVpUAovcu19PmeiJU7n6z/+reemZTsawcgWpFQLmqMWUUGzY3a4RNshSWXk1sZh
 W1Gxh1hvUXZNlQD9c1BCEDqXcqlx88jyzD4jqA/CPQgHmhm95OGqydum8nZfDKplTEP/
 RoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27MNjIwIqzw8UU20vNPY6Z6WLQg0LeR47nmbgO2v/CQ=;
 b=O5z8DEtD7aAMAiaI0D5bYzNId+/QnW+Hv2F0NjC5AWQeL2gfQC8ugS2nm/2KNFklLE
 llYdgD1Rg5SEzTnWMzJDonJ4ve7WiScEnM/oILhYZwCDeyEC+Cjspq0S1UeoQnW+v/Q1
 TTpPphLhCUuj9tsOPWUIIlFDHP7vZtCqvaSI72uQaQncmKWQgwPSiKOmTYAxbKyE2sC1
 9lfw1hLkB4sk/prbzNbZtLWoqZZTfVcfaVsmva2BL5D4YomaUD24UuwOJwQjELW2DQGf
 izSgiVksK8b50ZOYCwR1yqJOrW6ArDGdXN/rmPb8VQmRE+huf4++orewYccyg4ABB8Vi
 MPCA==
X-Gm-Message-State: AOAM531JLsqQ537cSFs9/QqMMwomLEr0vgQgM8OPdmW0p92CAjqWW94B
 n0DL7o9+ClFjd0SZus2E7F4=
X-Google-Smtp-Source: ABdhPJzBt6xZUGh+nEkhbFDs/HJw5W5RVGsOuPmw/FeEtc/YLzWvLxlZOmnf1lkKWzxfrSJ2VvjoFw==
X-Received: by 2002:adf:f807:0:b0:20d:4c77:3567 with SMTP id
 s7-20020adff807000000b0020d4c773567mr18417119wrp.118.1653303300771; 
 Mon, 23 May 2022 03:55:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1731-179.w86-253.abo.wanadoo.fr.
 [86.253.43.179]) by smtp.gmail.com with ESMTPSA id
 m15-20020adfc58f000000b0020fcf070f61sm5335378wrg.59.2022.05.23.03.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:55:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
	Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: [PATCH v2] linux-user/syscall.c: fix build without RLIMIT_RTTIME
Date: Mon, 23 May 2022 12:52:39 +0200
Message-Id: <20220523105239.1499162-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RLIMIT_RTTIME is not provided by uclibc-ng or by musl prior to version
1.2.0 and
https://github.com/bminor/musl/commit/2507e7f5312e79620f6337935d0a6c9045ccba09
resulting in the following build failure since
https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:

../linux-user/syscall.c: In function 'target_to_host_resource':
../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
 1057 |         return RLIMIT_RTTIME;
      |                ^~~~~~~~~~~~~
      |                RLIMIT_NOFILE

Fixes:
 - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Laurent Vivier):
 - Use an ifdef block instead of defining RLIMIT_RTTIME

 linux-user/syscall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index dd0d92ba4e..488facb356 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1053,8 +1053,10 @@ static inline int target_to_host_resource(int code)
         return RLIMIT_RSS;
     case TARGET_RLIMIT_RTPRIO:
         return RLIMIT_RTPRIO;
+#ifdef RLIMIT_RTTIME
     case TARGET_RLIMIT_RTTIME:
         return RLIMIT_RTTIME;
+#endif
     case TARGET_RLIMIT_SIGPENDING:
         return RLIMIT_SIGPENDING;
     case TARGET_RLIMIT_STACK:
-- 
2.35.1


