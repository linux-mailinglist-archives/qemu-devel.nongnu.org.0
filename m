Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B323C3D73C9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:54:27 +0200 (CEST)
Received: from localhost ([::1]:51256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8KjC-0005DY-Nz
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd6-0001eZ-Pb
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:08 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd4-0004rX-7B
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z4so2770648wrv.11
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=edA1RNYgOFly+i9RBpVHMeRVmmpNDBfy3uWbiQZdfpU=;
 b=VmF1XuWExZrFWAWfFVb+c+V7SJqJQ0b6UYMjnnOGgt31KImI8fDXJLmdKUWV9Udwha
 WISxKZmqUxm2J7YXtnRxCqDFwgznHx9oNqrng/9vERtX1HK88FU5gQKa5oTNGxyzf8rr
 ruUgOrR84mtPxe8GxcWf09Ivyo7RtbF/57UuOcmSqM9/7q7QIwZrxgQ68AinmNMPE62A
 XjdFx/KthPgvwbJ0MC1ePgnCnAMVUKKZmWNtT223/UC1uR+5yWyhhA72l0+lMb+oqjoP
 tkc5hXqs/IF5QAzaE+M0J866s3H2A0qAX3BN5Uhl0RY2Ew5I+RtqrSHiuvh+MW9WEetU
 I04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edA1RNYgOFly+i9RBpVHMeRVmmpNDBfy3uWbiQZdfpU=;
 b=EocQc2Ty6vQsaHl4NflNxXgoHT8F71P24esZjF8aknM4NUldXUsbNrWxrQwZg0n4bE
 AhcoNKBwEz1A8YB9j/shh+Cz5ZtqwIQpCB6Rh0vGYGf4zgbyVULek+hoiNQQDyuM2Sbg
 yZZO2/VqbZYkfqdLuryZV68ntOT0BS3ZMHB2H4b9hKsfnbnqYbhMphCsdN7hp+oFQGZO
 jAj9gVpkTP7xDHaIzWcJ11t194kc+F8sP5rNEwXoTLKp2u0Fo3QebJiIxRnNHuZpVbwP
 Ug7Np5fKR+R3pUobUg9b2kGFqstEDnGAKM+oHg676KlwMOXuGVDRxIhLsnZSxJFYn4q7
 5fjw==
X-Gm-Message-State: AOAM533gWCnCEbsd/jEVsu44op6qCW9j+LLeL5nSDV1R5FSCBYonwUu/
 aoeP2OMoRrSSoHpS9+zGHR6badVexIsBLw==
X-Google-Smtp-Source: ABdhPJxXDYhNnNGGEMW0rEJUmB91TNRVfqrCiRM1jQyqR6I1CNJkVov+vC6b2sxz1rshO8m3cr/Lwg==
X-Received: by 2002:adf:f288:: with SMTP id k8mr6012290wro.350.1627382884771; 
 Tue, 27 Jul 2021 03:48:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/14] qemu-options.hx: Fix formatting of -machine
 memory-backend option
Date: Tue, 27 Jul 2021 11:47:49 +0100
Message-Id: <20210727104801.29728-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The documentation of the -machine memory-backend has some minor
formatting errors:
 * Misindentation of the initial line meant that the whole option
   section is incorrectly indented in the HTML output compared to
   the other -machine options
 * The examples weren't indented, which meant that they were formatted
   as plain run-on text including outputting the "::" as text.
 * The a) b) list has no rst-format markup so it is rendered as
   a single run-on paragraph

Fix the formatting.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20210719105257.3599-1-peter.maydell@linaro.org
---
 qemu-options.hx | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 99ed5ec5f15..83aa59a920f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -98,28 +98,32 @@ SRST
         Enables or disables ACPI Heterogeneous Memory Attribute Table
         (HMAT) support. The default is off.
 
-     ``memory-backend='id'``
+    ``memory-backend='id'``
         An alternative to legacy ``-mem-path`` and ``mem-prealloc`` options.
         Allows to use a memory backend as main RAM.
 
         For example:
         ::
-        -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
-        -machine memory-backend=pc.ram
-        -m 512M
+
+            -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
+            -machine memory-backend=pc.ram
+            -m 512M
 
         Migration compatibility note:
-        a) as backend id one shall use value of 'default-ram-id', advertised by
-        machine type (available via ``query-machines`` QMP command), if migration
-        to/from old QEMU (<5.0) is expected.
-        b) for machine types 4.0 and older, user shall
-        use ``x-use-canonical-path-for-ramblock-id=off`` backend option
-        if migration to/from old QEMU (<5.0) is expected.
+
+        * as backend id one shall use value of 'default-ram-id', advertised by
+          machine type (available via ``query-machines`` QMP command), if migration
+          to/from old QEMU (<5.0) is expected.
+        * for machine types 4.0 and older, user shall
+          use ``x-use-canonical-path-for-ramblock-id=off`` backend option
+          if migration to/from old QEMU (<5.0) is expected.
+
         For example:
         ::
-        -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=off
-        -machine memory-backend=pc.ram
-        -m 512M
+
+            -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=off
+            -machine memory-backend=pc.ram
+            -m 512M
 ERST
 
 HXCOMM Deprecated by -machine
-- 
2.20.1


