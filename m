Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276BB6063BB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:02:06 +0200 (CEST)
Received: from localhost ([::1]:46564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olX3c-000527-1I
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:02:04 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWy6-0005qF-G3
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU6A-0002ey-VF
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:44 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU64-0000pD-Ix
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so2244275wms.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQc1SBrI4p6uNk+295hOmy/KNXRMgePPxtVxT3Ps1H0=;
 b=hnccSpQeQ6wZkdD1D9Vc7uFt+DFjp1EUps8qmFy+3OceDeRgOMiKaW4ZVxu7254QKx
 DXDCkzQizkLz5K2yHx9sZnolp9FIHJPKF8vxxA8OsLKkkLEGOQYyv3CUSSy5Fwsvwbmv
 y3xZ4rvM1snLZerSzoGXygrDkrFmXdNw5YYhPQmYH6k18DW023foqIWx8p1hXlajUf2p
 7DUOmjicoReopb2R3dXK+L/hAsq2RUz8RqMgQTLEp+2YzHUWUdSGZYRgS5EmGRnODgyA
 98tyKOJkDQ8RLznH9I29CVSKuH0fC+4ufCDKxirnSKQPSobp6eiH1TvZfJOU8v3jrJbv
 Ni1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQc1SBrI4p6uNk+295hOmy/KNXRMgePPxtVxT3Ps1H0=;
 b=dPAsLjYMR05EaKwMFhfHumcPrn5X5tKk8kcdc9JdGTcLCjwWR7+dMNuVK7vjVBBac9
 S9fVigWWwvBP2bcIw4DAQsz3ucewlcRM4hoppW8r9u8E9wWVvW9qdxsyjE7U7XeRv7Z7
 lvksIs97LlCh0PbjdiAOXeX+rJfHrwWXPbhzAYeJVdmZ91FcowTubywF5fgvKQRlrIoY
 KBnZ1YqJSUPkk7vPmEN6xd839re6EG7TOcQSnV/NXuSOTiKQz09oYgnjcB/zVEBlWDq3
 W/5XAmqKwoC+TSHo0+NdYoE7yZPQuqkI2aB+B7C4whSmQuRmAg+sw7B7sIJ7CoP6aiIS
 UxLg==
X-Gm-Message-State: ACrzQf29D1EzzNupw9+xEfk++0sS7EBkXMUorFHfEzjuVlYKpIjnSCd6
 v8h+L6g0eE1pCwcLtTt49tTBwQ==
X-Google-Smtp-Source: AMsMyM6IT/sE4UQJ9CHR13LPeByy4qwXvE1xhJd1zmlmO5rchLVd58AY0ua83gODpdiAeZLKmkqcRg==
X-Received: by 2002:a05:600c:4448:b0:3c6:fb65:2497 with SMTP id
 v8-20020a05600c444800b003c6fb652497mr11422428wmn.124.1666266741915; 
 Thu, 20 Oct 2022 04:52:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c444e00b003c6f27d275dsm2919745wmn.33.2022.10.20.04.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 461461FFC4;
 Thu, 20 Oct 2022 12:52:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH  v3 13/26] fsdev/virtfs-proxy-helper: Use g_mkdir()
Date: Thu, 20 Oct 2022 12:51:56 +0100
Message-Id: <20221020115209.1761864-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Use g_mkdir() to create a directory on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221006151927.2079583-7-bmeng.cn@gmail.com>
---
 fsdev/virtfs-proxy-helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 2dde27922f..5cafcd7703 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 #include <sys/resource.h>
 #include <getopt.h>
 #include <syslog.h>
@@ -639,7 +640,7 @@ static int do_create_others(int type, struct iovec *iovec)
         if (retval < 0) {
             goto err_out;
         }
-        retval = mkdir(path.data, mode);
+        retval = g_mkdir(path.data, mode);
         break;
     case T_SYMLINK:
         retval = proxy_unmarshal(iovec, offset, "ss", &oldpath, &path);
-- 
2.34.1


