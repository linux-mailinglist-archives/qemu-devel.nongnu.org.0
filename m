Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB1B3B403A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:21:37 +0200 (CEST)
Received: from localhost ([::1]:44874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwi1o-0005J5-UC
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuc-0000pn-Oj
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuZ-00030D-Tt
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:10 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a13so9767948wrf.10
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RiwmsClorkbOaoMh5w64DCeHLBIUZwprnnwBrOgDzNU=;
 b=nRlUPV+7ZN08c3ssbxwozBxsO9uN+MKSRnNZOW0koGD48BXPAX2FlmEf7U3C4VDYF6
 yJo5Jcb9rjtG8RZRWFPKAkI3Ajv3KeOtMNLdL60elVaNzHC3QwgOxgF4M62g6d87k/q+
 umDDFf4LENpooSG+FFphdqrSB+tyQrCw0DZoO8GQv5HCQ5+QOEIfRrxV9jfhbMu2Jqfh
 HP+r1oeKChtG+GJ8kSkVOcN1HYEQq1LfizNI3GvuLfZSd3/JRaNXtmRDLoXSQ6pd/jkW
 bAzyOlZK35vBqZ0QL8yIp/nnmU7Q70He4jwAaHA/QJTDz/QImFSD/SEiiEYwmBzB5aKr
 f3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RiwmsClorkbOaoMh5w64DCeHLBIUZwprnnwBrOgDzNU=;
 b=TsKRSbZpw7WhpLgD3TSv8Vy1ujdG1SR7fz+cQkIvwU/q6+CkQnFxl/WxFrTSVUAn3y
 umVlkR2tzqK+dVYQJiSTaBadJDGEE1nxYnarD9TbWMIx1N/fJBd3coUFKtYD9oh7CZEN
 Vnn386NZi79WALGQqsdq29acynykNsTq4UCfCy1fG4mfoMsWf4Y0hxe/WOZiUKUehe4X
 cRn1YL5JpEpcVpk5nT4jrymEtxNM0DbsdGgCJe4b46KhCvaV0DQsiaUJrRwy/E7VfuNe
 LoM7zgaP0M6OP9g/nLy1rlatpTXkPW1PVA9EDdiuurFfAonUKNxgHZ62eCjr4GSYo5Zz
 HuFQ==
X-Gm-Message-State: AOAM532K9/rYSh451PkpmmaqKBXOjFER6R8yR4G9TZXcMifx1/wb2SDD
 yRH6AyC+WXVCtjvz8zLwRxLcvQ==
X-Google-Smtp-Source: ABdhPJxMaGyarBirZAvwE/S01e4b2uf0+ytNFLbrN+VZtKw4RXfNYZxBDlyEyy3gJrWVO0TnlWcgZg==
X-Received: by 2002:a5d:538f:: with SMTP id d15mr9763412wrv.408.1624612446575; 
 Fri, 25 Jun 2021 02:14:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 2sm10738368wmk.24.2021.06.25.02.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:14:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF9341FF92;
 Fri, 25 Jun 2021 10:13:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 6/7] tests/tcg: skip the signals test for hppa/s390x for now
Date: Fri, 25 Jun 2021 10:13:54 +0100
Message-Id: <20210625091355.25673-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625091355.25673-1-alex.bennee@linaro.org>
References: <20210625091355.25673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are fixes currently in flight but as this is getting in the way
of a green CI we might as well skip for now. For reference the fix
series are:

  linux-user: Move signal trampolines to new page
  20210616011209.1446045-1-richard.henderson@linaro.org

and

  linux-user: Load a vdso for x86_64 and hppa
  20210619034329.532318-1-richard.henderson@linaro.org

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210623102749.25686-7-alex.bennee@linaro.org>

diff --git a/tests/tcg/hppa/Makefile.target b/tests/tcg/hppa/Makefile.target
index 8bf01966bd..71791235f6 100644
--- a/tests/tcg/hppa/Makefile.target
+++ b/tests/tcg/hppa/Makefile.target
@@ -4,3 +4,7 @@
 
 # On parisc Linux supports 4K/16K/64K (but currently only 4k works)
 EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-16384 run-test-mmap-65536
+
+# There is a race that causes this to fail about 1% of the time
+run-signals: signals
+	$(call skip-test, $<, "BROKEN awaiting vdso support")
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 241ef28f61..0036b8a505 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -8,3 +8,7 @@ TESTS+=exrl-trtr
 TESTS+=pack
 TESTS+=mvo
 TESTS+=mvc
+
+# This triggers failures on s390x hosts about 4% of the time
+run-signals: signals
+	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups")
-- 
2.20.1


