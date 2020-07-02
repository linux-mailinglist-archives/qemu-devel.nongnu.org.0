Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F8212B9D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 19:52:58 +0200 (CEST)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr3OL-000400-1e
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 13:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3Ad-00044A-Mj; Thu, 02 Jul 2020 13:38:47 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3Ab-0007QN-JK; Thu, 02 Jul 2020 13:38:47 -0400
Received: by mail-ej1-x636.google.com with SMTP id lx13so12069029ejb.4;
 Thu, 02 Jul 2020 10:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=knUh4HEooElhUu5Dw46r9l2QMh5qR/82JNmpOIww/Xs=;
 b=BuAM8iRlr+oOANYEqH3tyluudB8wPhPMfWaU9vGZicM1AZhLsSIFk/kcDvFODl60Xr
 M2AFhKgCYBJTZrAUZBkrPdtUQ5fQVAWxNw2q6vPFrfM8ceGBTiI078E9d9xdZYzc8BuX
 U+GTiWS3NGlsOvvxn7NWr2/mQL+qsHoSUpUeScrUiiv/WzBZXc6UzyrCbuqRmeUqE7d7
 U20R47Pbf0282w4Gb/gW7o5Fh/JT/yFVnUTSuhP4MSWNwX1Jyn+eeZSf1tJueKPaW/Cj
 rY57VfpPk/xUnKgzH8A6n7ue6wSPZOwwNj418ykiMrdcBVrOLnYQmrMN4+6zGhgOLe/M
 ylIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=knUh4HEooElhUu5Dw46r9l2QMh5qR/82JNmpOIww/Xs=;
 b=EvAWEtefJSEtQ5/BzDYaKDLy58z/EDH/iLvEdVkXYUvjgklOMuo3MDFx7VBeDHFEAC
 O4ucpPO6Y41xV/rousP2HVMg6V0dPlh2Elu0CfbL1hKlOTjJ03CQ+0VCjZEsa/jU3fKk
 55zHKglp+dHiBeD0sM0YxDaXnogWQP9MMko2tNnn+9F+VQhljhv2JgpnZDpbt9me4YFz
 x2rX04T1ZRQysSuUiCcMSlOjCU8Zq7JG7CTdXrGwevJahSswtUi5g7+dRGWogpOAbF/k
 hQNWQwuUTYpwg00559ik7oUzsg+u+jYXyKVbv1W4hN386kItWCets/GPHBec+GJ4KvOp
 CgLw==
X-Gm-Message-State: AOAM530QgroGPNR5bJtLnfIbWS6XhiCmfPXzj51+WCG0ggEruJjXtrnF
 dQkX891kQUA2Q5pV7GxTyD77dfs9Ieo=
X-Google-Smtp-Source: ABdhPJwQyp302U+ZAW2rWyA9rL93UqZtSu7S587zaNoauPXIqLwcmgSa/X+XNSXIHBhQSy7o5QJXSQ==
X-Received: by 2002:a17:906:f752:: with SMTP id
 jp18mr28275062ejb.538.1593711522470; 
 Thu, 02 Jul 2020 10:38:42 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id w20sm5710344eds.21.2020.07.02.10.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 10:38:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/19] .mailmap: Display Ying Fang name correctly
Date: Thu,  2 Jul 2020 19:38:18 +0200
Message-Id: <20200702173818.14651-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200702173818.14651-1-f4bug@amsat.org>
References: <20200702173818.14651-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correctly display Ying Fang name in the following commit:

  $ git log --author=fangying1@huawei.com
  commit 9e6f8d8aab3afe6d704054e3fd850bcba5aa20f7
  Author: fangying <fangying1@huawei.com>
  Date:   Tue Jun 16 10:32:29 2020 +0100
  ...
  Signed-off-by: Ying Fang <fangying1@huawei.com>

Cc: Ying Fang <fangying1@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index f5ca5aa37e..4352030af5 100644
--- a/.mailmap
+++ b/.mailmap
@@ -177,6 +177,7 @@ Xiaoqiang Zhao <zxq_yx_007@163.com>
 Xinhua Cao <caoxinhua@huawei.com>
 Xiong Zhang <xiong.y.zhang@intel.com>
 Yin Yin <yin.yin@cs2c.com.cn>
+Ying Fang <fangying1@huawei.com>
 Yu-Chen Lin <npes87184@gmail.com>
 Yu-Chen Lin <npes87184@gmail.com> <yuchenlin@synology.com>
 YunQiang Su <syq@debian.org>
-- 
2.21.3


