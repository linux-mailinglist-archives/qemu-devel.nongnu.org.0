Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702C3FFD32
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:34:45 +0200 (CEST)
Received: from localhost ([::1]:41332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5au-0001cg-6H
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F9-000417-Vv
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:16 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F8-0003zK-0J
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:15 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so3314171wmi.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MwNqOLSs/h4JpB6SVAu+PmQQX3OyOVghXZoT0dCYuZo=;
 b=r/xX7dI2LKz71yY4ubyTkV2/Tws3xi9hkxxNsGm2N42ZVbTr8sqDX245dJZKGwcT91
 Rd7q+8dCsvgQx39MY3750HAN2yqUdk2LnTpi7jkMr4cmuW1txlIscl2zHN5u16EccRrp
 kt/XpIqRN/5w6f2Zmwj7iiaS2khpzPO+PoY7oGuf+HwOeZDinROsIErGJqXNXab3Gzm+
 ZZQW6F09Kler1BpTIaERsXSZ0cR9xL6ZEltZjEqx+RCt0vS9Iu6MvFmfvJaFau1yBE5J
 P4cnqscV4VtjmkeLPcAy0anFKrhwkNCN+VhTIGfDmw85G/FoaDXchWEW/fnyzU55XZci
 9nFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MwNqOLSs/h4JpB6SVAu+PmQQX3OyOVghXZoT0dCYuZo=;
 b=J3IVLu8ZGi/njiaC8YATFdsAAI++bz0w6XwpzROORO4jSShrBaNJ0YZt4sVXTrRej5
 ILbEHXxgisBakClLJDbcX8uYPAnjAn7HayKyb1Qmgrs44IcAsrgvemKqInVc0QvFU1Ji
 U497syZwktjPiziIh2Bh3kwwKoXwbq8shE5ki9LanCd7AwUm+MUw4/a7JIjxicZNQ0Pf
 0aoq4FeERVSSxZNQZdkIR+qWyMkbpv0OVxUeNQCpIbFXZvKIgFeLvr/GY4rsdOpspmMw
 LmEn6cyacD+ewqBilJnL/uY+OqIj7s2BarVRX2xLWEtmkJJa399NNZ9AzAWFAvYnEgJE
 3uyw==
X-Gm-Message-State: AOAM533Jzj7pqcJ2i6IwGOO7lu8sn3AhoO0G1zSE1ONZJ+nXEE7Tby5j
 RFA9N/w/xa4/jywBg7Jz5yrr0A==
X-Google-Smtp-Source: ABdhPJzNGqqp0kf9nbDoAzTw9/9tPKM1r5m7V5VtfPlZ5H9iCZN01ddOtZpKhcdGCR6GpRW0cPyJSg==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr7346299wmi.131.1630660332619; 
 Fri, 03 Sep 2021 02:12:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h15sm1209356wrc.19.2021.09.03.02.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:12:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B1ED1FFAF;
 Fri,  3 Sep 2021 10:03:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/22] docs/tcg-plugins: new passing parameters scheme for
 cache docs
Date: Fri,  3 Sep 2021 10:03:33 +0100
Message-Id: <20210903090339.1074887-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210730135817.17816-9-ma.mandourr@gmail.com>

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 7b1dece024..fcc460bf7b 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -389,34 +389,34 @@ will report the following::
 
 The plugin has a number of arguments, all of them are optional:
 
-  * arg="limit=N"
+  * limit=N
 
   Print top N icache and dcache thrashing instructions along with their
   address, number of misses, and its disassembly. (default: 32)
 
-  * arg="icachesize=N"
-  * arg="iblksize=B"
-  * arg="iassoc=A"
+  * icachesize=N
+  * iblksize=B
+  * iassoc=A
 
   Instruction cache configuration arguments. They specify the cache size, block
   size, and associativity of the instruction cache, respectively.
   (default: N = 16384, B = 64, A = 8)
 
-  * arg="dcachesize=N"
-  * arg="dblksize=B"
-  * arg="dassoc=A"
+  * dcachesize=N
+  * dblksize=B
+  * dassoc=A
 
   Data cache configuration arguments. They specify the cache size, block size,
   and associativity of the data cache, respectively.
   (default: N = 16384, B = 64, A = 8)
 
-  * arg="evict=POLICY"
+  * evict=POLICY
 
   Sets the eviction policy to POLICY. Available policies are: :code:`lru`,
   :code:`fifo`, and :code:`rand`. The plugin will use the specified policy for
   both instruction and data caches. (default: POLICY = :code:`lru`)
 
-  * arg="cores=N"
+  * cores=N
 
   Sets the number of cores for which we maintain separate icache and dcache.
   (default: for linux-user, N = 1, for full system emulation: N = cores
-- 
2.30.2


