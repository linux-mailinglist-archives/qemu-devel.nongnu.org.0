Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E400D2D4779
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:09:27 +0100 (CET)
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2xy-0004Xz-Uw
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2q3-0006Zb-IU
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:17 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2px-0000ra-Sc
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:15 -0500
Received: by mail-wr1-x441.google.com with SMTP id i9so2534935wrc.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxNIt5plYdOKFCx5JryMY8PTARCk/pBAH37rhtHgN+o=;
 b=U8HcXfQrcB3+4tI+3S8C8O70g8rMv6zchI0xWBmMIZwNDuLyQJ6Zbt+li8bjMIjuOf
 2Ure8R5cs+j2EZ+hLcS3ZpG7dijAJ3NqDaucbpiQeq3BVJAS8pKINHPl57d16xR3V0u6
 apyi0mF0QO08rA/J3pR4fli4u7V7+A/FLCPsXMvnRhzir64xBAH972rnaFu/mpYqj215
 LvZHUXMvzvTuh/CQ1i/X0ihKPgKmuuHhns1NNN0fQLjMxTQqXJfk9FYViyWo++oG1iAL
 7VXLC7dZgLGWk/5GA+G4puxRLC/FGpVk1gTB6leIE18uT0bJVCm5KfqyrynjJi/0I9xu
 aJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OxNIt5plYdOKFCx5JryMY8PTARCk/pBAH37rhtHgN+o=;
 b=pToZNkYUCCp788mK+61xAoeNUfNLrudKS+iM7ZsDATcQK9rE0Sk4Hd6mru3J5WctPX
 zYPNAD3nVD1w3gIcb5BCQ4NwG/A9Amr2afbel02E+djIG0Qc5ttxrtWo7qpeRf1w+cg2
 Jkdf5EgbJeV/oyqSaQaWJiZxSwZVPktTNDrBN71i/9gVgViwDkFY4NuB4bRjfos6g1CT
 Yz0L/xBHMMz+dFlvvgY90QzR/8grJjElStzadMdXigFnlzB+z3h41WRnhRqDMjIorrA0
 XrKocTFvFgQ58EH8BgUcTPt62OR/VJTiiMHJaLcotWIabvAs/ZON632K6pxJnAsMmCgV
 7m0g==
X-Gm-Message-State: AOAM533KAuqs5xPEY1b1VG2YRcClg9ipEOED2XktA53rw0x6BhodTpZ4
 xuaXOE5vlP9jiZg5pPwsHIlICg==
X-Google-Smtp-Source: ABdhPJz8ekeE7ibAP8xmAgF7zqqMgYHD2BrLzuu6lDDYxtNSEGabI+JLsitcUMVYs1gUHh9YD1OVRg==
X-Received: by 2002:adf:f607:: with SMTP id t7mr3667749wrp.169.1607533267836; 
 Wed, 09 Dec 2020 09:01:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b83sm4156373wmd.48.2020.12.09.09.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 09:01:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 913F11FF90;
 Wed,  9 Dec 2020 17:00:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/6] python: add __repr__ to ConsoleSocket to aid debugging
Date: Wed,  9 Dec 2020 17:00:57 +0000
Message-Id: <20201209170059.20742-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201209170059.20742-1-alex.bennee@linaro.org>
References: <20201209170059.20742-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, Willian Rampazzo <willianr@redhat.com>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, richard.henderson@linaro.org, f4bug@amsat.org,
 John Snow <jsnow@redhat.com>, cota@braap.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While attempting to debug some console weirdness I thought it would be
worth making it easier to see what it had inside.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>

---
v2
  - make more pythonic
---
 python/qemu/console_socket.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
index f060d79e06..ac21130e44 100644
--- a/python/qemu/console_socket.py
+++ b/python/qemu/console_socket.py
@@ -45,6 +45,13 @@ class ConsoleSocket(socket.socket):
         if drain:
             self._drain_thread = self._thread_start()
 
+    def __repr__(self) -> str:
+        s = super().__repr__()
+        s = s.rstrip(">")
+        s = "%s,  logfile=%s, drain_thread=%s>" % (s, self._logfile,
+                                                   self._drain_thread)
+        return s
+
     def _drain_fn(self) -> None:
         """Drains the socket and runs while the socket is open."""
         while self._open:
-- 
2.20.1


