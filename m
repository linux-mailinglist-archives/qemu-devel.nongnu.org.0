Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB964F45A2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 00:52:34 +0200 (CEST)
Received: from localhost ([::1]:53574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbs2M-0007QS-2E
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 18:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <308RMYggKCqgecPIWbaPOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--wuhaotsh.bounces.google.com>)
 id 1nbroZ-0004J5-7t
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:23 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:36370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <308RMYggKCqgecPIWbaPOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--wuhaotsh.bounces.google.com>)
 id 1nbroT-000333-1f
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:18 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 77-20020a621450000000b004fa8868a49eso440966pfu.3
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 15:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=cQAtXLk+vnJziUx/LaxkPrSrO8UZcGwhEX8GD52xKdk=;
 b=HBl5dllVLdVJWA3Y9bbBVwzHXK/iIGltDFW1Cg+nZEjjqgrfiJfb9EAjHXbROuSdJn
 zJVjR5CGn5GnIHAnpbN6XBlaEqF0oB7zJhqZOG9OE4olRX7Jqh/eEOB+Nq6D6S0pOO9s
 UPlZHQHGKIfped3sauTgCNkj6oLvUG6swZzJtck+tJVpauFDIOFC1vhHpl19ZFxgp47l
 0wO+TmY85sM8JF3fMibIOFAGwr3UXgJwE3Ma17WY/2vAjKoIqMvQv2sBnRgpD4UEMAmN
 5GFxJDFC1rQCk2pSY3tao5dOjIqCic/ET5EGY/sI0ADD9Jxo3ZMtOqsE1zhjEe7+i0CN
 Y8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cQAtXLk+vnJziUx/LaxkPrSrO8UZcGwhEX8GD52xKdk=;
 b=PH0aEehEuCAl4mXOBw9WZjpINeF7dcofCukSKYxUH/ossCo1DINj2ivSViYXKm22ou
 JfOUdZP2Tja/aCDJj0scMzPebmenwyPIbrXivsDuNoMMtUPvqJyUvpXf0/DabohMA3K2
 Kvn0fH4x1ozILFFCUkmzoDjSWh6N9BfAGuNBmoQOEW2tyMlymA3lAqkwiadQkM/o1med
 46f+s9Gt4E+T66qpuWndLhvNEq5lD4xR64GhtdOGspo6NPq6ZUhPlN9wL2sWGbhE198O
 C8O5aUSagrZXAjLajkjmv2WFW1GMDdFarOhcFNYBXLzUFrOQitLkCgey7GFfT9JmwDU3
 TupA==
X-Gm-Message-State: AOAM530T4/YWnVj9pHK2THLQxXWDCiITfaPehl2PdMfanfivke50AVMJ
 CES0MBbIBbgWKeqrBXPHCxFHgYA8Ki5v+A==
X-Google-Smtp-Source: ABdhPJwNRs4lcKdWfUByvIG1dcrwnc3O6wjSDoIrVDVmGQKVys+7p/geLvbxUsqMVbjrWlGealClKa30yuBTDQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:4f88:b0:1c9:b632:9462 with SMTP
 id qe8-20020a17090b4f8800b001c9b6329462mr6442611pjb.54.1649198291416; Tue, 05
 Apr 2022 15:38:11 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:38 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-10-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 09/11] pc-bios: Add NPCM8xx Bootrom
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=308RMYggKCqgecPIWbaPOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

The bootrom is a minimal bootrom that can be used to bring up
an NPCM845 Linux kernel. Its source code can be found at
github.com/google/vbootrom/tree/master/npcm8xx

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviwed-by: Titus Rwantare <titusr@google.com>
---
 pc-bios/npcm8xx_bootrom.bin | Bin 0 -> 608 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 pc-bios/npcm8xx_bootrom.bin

diff --git a/pc-bios/npcm8xx_bootrom.bin b/pc-bios/npcm8xx_bootrom.bin
new file mode 100644
index 0000000000000000000000000000000000000000..6370d6475635c4d445d2b927311edcd591949c82
GIT binary patch
literal 608
zcmdUrKTE?<6vfX=0{*3B5ET?nwWA^;qEk()n=Xb9-4dxoSBrz#p|QJQL~zokn{Eyc
z?PBXUkU+aB?k?IbNQftG5ej|*FC2c{bKkr7zLy3jhNxj`gc_y5h&V=Ru)PgZC)Y`f
zTqA9Am28qL<U6@cMtA>Hlr*^&hT#;re-)dpxT0U42|O+cWOcx=B;{6xXH04vx?cjm
z+%U{oFx!aPpV3>ZKz0i$XA-yq{f}<H?{MHBq+VwIvR9WmcL(xr1vuIRGELcRC-S+P
zl3%RlR5(6+1;xg_<~xR#bPItDN1*Hp^{JyNs7o*BMq0Q9q1#>x4;|pb<NWIbQ8wb1
zTac^<ebj^E^Ig<?U?(PO-w>w;l#@9zGd|z-rs*H@V-o%PEV)D-)8n2%DyH5@w_^Y8
LH5R3RMV#gjxYTW}

literal 0
HcmV?d00001

-- 
2.35.1.1094.g7c7d902a7c-goog


