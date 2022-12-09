Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C496486F8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:49:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gXh-0003SN-6Z; Fri, 09 Dec 2022 11:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3gXP-0003QG-2c
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:47:58 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3gXL-0007d2-Tz
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:47:50 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o5so5798914wrm.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KXcnC2HdtbJZG+XR6H67a6m9QATJvma6IbMUc6ov2JA=;
 b=l6sTpTsLI9DkRuTt3Ef6PBy6ENXU9tNO1gPUfUkdFMLOP2lGilR9eTusT44oQ8juiz
 BZQjidAqxYErwrGAR/p+b9m/AjF8zobxdzWA3IQXSOJkY7LdFbOI+/8KH7affHee1hMA
 Mntqf45eMiOROzQkgnfSLZJenxFY3/ZyaQdx9cVEUbNoaDcbjw9KKPVg6YLBHjRBVOOt
 G/K4kAhYF2aesnEThqTWA0VfDfesY2754Yp//ea85N/pEY2Pf4Bv6NWd2E1sL5q7ti8i
 VgNSHW1CFbYxwslkBwfw+3+fp9AR1pW4Jh7HzBtNHicG9zpq+aAgwVFLKwBP4tiJC+or
 H/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KXcnC2HdtbJZG+XR6H67a6m9QATJvma6IbMUc6ov2JA=;
 b=NM0NgomD9y/w7m4KMgCvHpDtoCKBk3gXeGuKZP0vfMkAI9AKPCc48Q88IeZe0ic0bz
 pBd5jJUPx6NdOme26lKE/VIH+posRcBtfBfsU2vCD2p24XI5fkWuSf2sxa4DNCS0xgwO
 DEj8isrom7M9x2tCktgGiwFZFU98LlwKP8l+6dednFdoaRzct9pRfixTUqh/nC3xuDlp
 D5wpLvZfjT/h4oNdhorXgRAt8icL/k2woKkGaAlOw0j5JAZZcxjbJRADG4c3UV1j6KFr
 0elOJ0G4BTGcKkS+nPyxy9a4t+Hm4U5iRQZoAVEmGSoX/in5FWz97noeaf2ZAJFsyWET
 NDeg==
X-Gm-Message-State: ANoB5pk1+TMna7V8/zTvPBslAkcW/iz+VKu97mLB+L9PQd0eU7NepaQ5
 Y7rLDHtz8WQ4bFwQWjqlHVF2+OSI/K5EIENqBg8=
X-Google-Smtp-Source: AA0mqf5uO+wJs72lNMe6kMjBARIzbN2SsGgBFBTzYs8KrRyAnEdPVkh9oRyTYnG3Ccf94Ra0Q3rcqA==
X-Received: by 2002:adf:a743:0:b0:242:1c1a:37ec with SMTP id
 e3-20020adfa743000000b002421c1a37ecmr3665332wrd.17.1670604465914; 
 Fri, 09 Dec 2022 08:47:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d538f000000b00242442c8ebdsm1776147wrv.111.2022.12.09.08.47.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 08:47:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH-for-8.0] tests/vm: Update get_default_jobs() to work on
 non-x86_64 non-KVM hosts
Date: Fri,  9 Dec 2022 17:47:43 +0100
Message-Id: <20221209164743.70836-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On non-x86_64 host, if KVM is not available we get:

  Traceback (most recent call last):
    File "tests/vm/basevm.py", line 634, in main
      vm = vmcls(args, config=config)
    File "tests/vm/basevm.py", line 104, in __init__
      mem = max(4, args.jobs)
  TypeError: '>' not supported between instances of 'NoneType' and 'int'

Fix by always returning a -- not ideal but safe -- '1' value.

Fixes: b09539444a ("tests/vm: allow us to take advantage of MTTCG")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/vm/basevm.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 2276364c42..23229e23d1 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -569,8 +569,7 @@ def get_default_jobs():
                 # more cores. but only up to a reasonable limit. User
                 # can always override these limits with --jobs.
                 return min(multiprocessing.cpu_count() // 2, 8)
-        else:
-            return 1
+        return 1
 
     parser = argparse.ArgumentParser(
         formatter_class=argparse.ArgumentDefaultsHelpFormatter,
-- 
2.38.1


