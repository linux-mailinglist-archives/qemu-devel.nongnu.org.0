Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A505E3D3E4A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:14:58 +0200 (CEST)
Received: from localhost ([::1]:41334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ylF-0006fC-LF
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybE-0000MT-Rx
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:36 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybD-0005Zn-A2
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:36 -0400
Received: by mail-wr1-x436.google.com with SMTP id z7so3037787wrn.11
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DdhiyG3Ap5qOGoxwCSdJAPdf0AmDzvCwhcSIcB81ztU=;
 b=kcv08TDOjRE/uHyuCCard4UnEj5xrFpqiE6QZHBjXZ7gD18yXRNeVQ3ePKO6IA/UvX
 OQFqoNYwVnU8SBa9JlILFRMXdIjQ9jEvnFTwn7areD29+UVYHGgZfzjz1EwioFTUI30h
 MClBEERcWqOfBLHQ7IuJZs0C+WybXWT2jfvUBS5DqKe1tFtRQBlO/MpncFNZPOGdzUji
 wWJ0y51D7TMvHBQxPFU8cgRtpUTZAHqiKKYPbKh77Eru3paiUj8y8gyloMGMT0z+UkOO
 6hyQlUvhNF206x7SSwHMZukfs89vlhAvdVNAtikw/teM17czWT9c259jWL60MRMEjsrj
 3gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DdhiyG3Ap5qOGoxwCSdJAPdf0AmDzvCwhcSIcB81ztU=;
 b=V4toeh6suZXTduitOheDOF8tVKzhNySyax/W7zCuEjlP3oosMtgaBhV1WcAVPlu6IX
 UZjayHJaVHTpgoL9xQsZuRMhbKXkvFDFEIC7eJgbEW5+zYLAnYiwFSN+DUPixVPs3hDx
 XLtEJnpTIEUadL9GKZR4w41ksAu4+zGSYKRv6igzidB8/2r8Mde65oWY/mPCzTCprg3L
 hVOIOmHKVYNpxiJQM10xW/xKputpJ89kl5M9FfBiwQJtP0AbLhhYpt253v37pZC4K8Vj
 F0otJ5ASRNWK7PblGmDBni6V0prESTmjTIpi4QhjEfYhsYxIHAlRtlaPEkqlxtBiwsIc
 t6jg==
X-Gm-Message-State: AOAM531Cf+yJliQAIQwc9ls9cyThmhHnqLjjTqEMnc9Pt2EZg1DT7WqD
 F+feumj6G6yYm4Qu+iZ4uYbXDQ==
X-Google-Smtp-Source: ABdhPJy9Eqbhw+pdcFcwDfJTXvveKpoDfCxU7Fx8w8dGQ2+YFI7k4K+ECk8tmQbzMmbWDEfWW17cXA==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr6441466wrr.92.1627059873905; 
 Fri, 23 Jul 2021 10:04:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm25600825wms.21.2021.07.23.10.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 004471FF96;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/28] contrib/gitdm: add a group mapping for robot scanners
Date: Fri, 23 Jul 2021 18:03:34 +0100
Message-Id: <20210723170354.18975-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This mostly affects Reported-by: tags

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210720232703.10650-9-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/group-map-robots b/contrib/gitdm/group-map-robots
new file mode 100644
index 0000000000..ffd956c2eb
--- /dev/null
+++ b/contrib/gitdm/group-map-robots
@@ -0,0 +1,7 @@
+#
+# There are various automatic robots that occasionally scan and report
+# bugs. Let's group them together here.
+#
+
+# Euler Robot
+euler.robot@huawei.com
diff --git a/gitdm.config b/gitdm.config
index c01c219078..7378238c20 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -43,6 +43,9 @@ GroupMap contrib/gitdm/group-map-janustech Janus Technologies
 GroupMap contrib/gitdm/group-map-individuals (None)
 GroupMap contrib/gitdm/group-map-academics Academics (various)
 
+# Group together robots and other auto-reporters
+GroupMap contrib/gitdm/group-map-robots Robots (various)
+
 #
 #
 # Use FileTypeMap to map a file types to file names using regular
-- 
2.20.1


