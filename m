Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CD7288F91
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 19:06:33 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvqi-00027G-52
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 13:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQvJl-0000ZV-Gf
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:32:30 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQvJZ-0005D4-IU
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:32:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id d3so10431316wma.4
 for <qemu-devel@nongnu.org>; Fri, 09 Oct 2020 09:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4VovwnTMcS5+WdcMCaUSE0KwDjBLH5CKbzqMLRRPZHs=;
 b=meh33rFT+lPXxOyDC7RqosDsmiVTx0qBOSeZF1fMsz+zjENjZBtdRFZ2Yind0kdJzs
 EZjNP37kbcQit9hM9NVxeY7KHg5ibDGJEPrnwoVdBxENF752Q9KCGa2lQFGEg318GJ5e
 5JO+Rq7BLQ3LkcoY+zrtLI1GBCL8aw8+tm35iJ+OvoF0VJFbetMHe9neTaiw3yiTQZA9
 rfEHokYGucNufffKWJqPEMDB13kTIg3z+Qu3O76y7jl5xQzB+ZhMv2bzslKL8yN+AJK4
 7zRe28Po/5iu3SOW7AhbWkiPg63l76JkGhKqLbUMlJ9zeWLqKTf+329CRr/QDGmch5YS
 ZNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4VovwnTMcS5+WdcMCaUSE0KwDjBLH5CKbzqMLRRPZHs=;
 b=Iji1Z9CWlEgxA6g96QXYKj6JXhzcQzQucUhrydyQyIrr1wk7++9ZWH9bJuvQsa/fK1
 ApoOoNWcp7V88/Pt8wxr3s6Wj1spzp+t+1vTlm0f4sukgt3i7CC2WE/hfPLT5MgBp/jm
 S99HtXCWt+SPBxG2dJUuig07LOG1Jivj3NxEcb8IRhhnVPl/ayrar5LSMI7FGPkqQ9L+
 G+nrKMibjITeKE7b8VDtoU/EZAUF4t5Nb8ynxO4tsVmKPigIy4u4jWFRFIifA3LmLf0r
 67Q9Q2PeqojUI6WqAwl+FVV8zO4o+xASLk8CMeY1haW+0U58mJUqwftVi4biuW054/Jb
 VuYQ==
X-Gm-Message-State: AOAM530YMoF3KUg/aDkX+5QReH1Zujf7i8v/ELdCdd1HC7EDyUPbgoXI
 Y1ViikY+z7xESFEbSVx4XLJtCA==
X-Google-Smtp-Source: ABdhPJwkcHZOJpjwf/jvsOfCidxo9KzgBOdZo82129eaInO56G7rAnqilK3u0V7p9sVshJl/t2Hwtw==
X-Received: by 2002:a1c:238e:: with SMTP id
 j136mr15122649wmj.176.1602261134630; 
 Fri, 09 Oct 2020 09:32:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 88sm13268943wrl.76.2020.10.09.09.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 09:32:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 14C351FF9A;
 Fri,  9 Oct 2020 17:31:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/22] contrib/gitdm: Add Google to the domain map
Date: Fri,  9 Oct 2020 17:31:36 +0100
Message-Id: <20201009163147.28512-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201009163147.28512-1-alex.bennee@linaro.org>
References: <20201009163147.28512-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Erik Kline <ek@google.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

There is a number of contributors from this domain,
add its own entry to the gitdm domain map.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Erik Kline <ek@google.com>
Message-Id: <20201006160653.2391972-6-f4bug@amsat.org>
Message-Id: <20201007160038.26953-12-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index ae5d149434..72dc65f2b5 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -9,8 +9,9 @@ baidu.com       Baidu
 bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
-greensocs.com   GreenSocs
 fujitsu.com     Fujitsu
+google.com      Google
+greensocs.com   GreenSocs
 huawei.com      Huawei
 ibm.com         IBM
 igalia.com      Igalia
-- 
2.20.1


