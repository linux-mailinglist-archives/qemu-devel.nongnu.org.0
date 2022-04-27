Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF9511C99
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:27:24 +0200 (CEST)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlRj-00061T-Hz
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMW-00063K-T1
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:22:03 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMS-00017a-AW
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:22:00 -0400
Received: by mail-pg1-x532.google.com with SMTP id t13so1952041pgn.8
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 10:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bGdf3FwOGjWRTyOF5PKxGS+BnP/iTZPo4BrF0TVWr5A=;
 b=VkZrifBSo/XyOq/wmUzuOuZ1sehJih060Ryc+mtVZq2MpJ/7zU7laN+36XL6OfH/oF
 F0f/CU1bDR4heSmk1s/24p6e0KgmMNIpX0Zour2rcvvQ8VQyUZryNKiMFm9APeOEl7eW
 56nojGSeCb/HvHubU4Xi28uEUxAYOZcst8cGJnonMpOkFSbaM6oxVGRtnl3gD+2vPeQj
 nE8BTutY2rE9pFsKZgkUclRPQz0rrSWHUtREZEBXtBNzyWdp0G/EqzplFbz1p3uF4EaI
 1Kd7hr4OOEAk42vqNjYs4uGUXNYi2/eYKMLN0jmdJFJFf7aghiTjGktRs9MV8NjxJKfC
 cefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bGdf3FwOGjWRTyOF5PKxGS+BnP/iTZPo4BrF0TVWr5A=;
 b=YQGiJTHQ3m9sWH7CmdqWmlO/BAaXn6B+9AsuJEbeG6Wp/YiyhNcKj3Taie1CnCF/ev
 Jp3/nUoYg0jDSYfgzmMAGzVdsjSzJCkhyn4qJVu5RsDgYxAj0/HcwRR/r/FIEM1u3v5D
 2Z9ytALTZST9afVY6dsPZwJiR8CtaL+bRaYH3FlcJ2ib7BJsqL2PUB0SryLwCRhAnJ+z
 4tuhBs7rkxCFPdboVfW3ar37it0WDI9Nsm2Cv6I47GhbAHa02n8KmgnVMFommZwFFU9P
 NXJAMmL2GO8YmT8gvL8wkoHg551T1AoUtC/L3fna1Q9vOShMFN7THVy42fJmJfIvvEHe
 eg9w==
X-Gm-Message-State: AOAM532CcF/RzJNKFWR/ZnzCTxBATw2AjgZcubN+PHzduE/qV0myV01Y
 H4N/xtCqUhr8OUqCJvFwGUhu5a7tqL0=
X-Google-Smtp-Source: ABdhPJw2eBk4M8aTbyEByPfHrUtAPF/OcDuTpceKkk2ha9I4e3mjMEjCA0s6BDL3p0aVcK0CB4Waxg==
X-Received: by 2002:a65:604b:0:b0:398:ebeb:ad8f with SMTP id
 a11-20020a65604b000000b00398ebebad8fmr25366548pgp.89.1651080113805; 
 Wed, 27 Apr 2022 10:21:53 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:76e8:b785:3fb9:b6d6])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm21202124pfc.41.2022.04.27.10.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 10:21:53 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] tests/tcg/xtensa: restore vecbase SR after test
Date: Wed, 27 Apr 2022 10:21:35 -0700
Message-Id: <20220427172140.1406059-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
References: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Writing garbage into the vecbase SR results in hang in the subsequent
tests that expect to raise an exception. Restore vecbase SR to its
reset value after the test.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tests/tcg/xtensa/test_sr.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/tcg/xtensa/test_sr.S b/tests/tcg/xtensa/test_sr.S
index b1a91a0637ee..34441c7afff7 100644
--- a/tests/tcg/xtensa/test_sr.S
+++ b/tests/tcg/xtensa/test_sr.S
@@ -221,6 +221,8 @@ test_sr_mask /*scompare1*/12, 0, 0
 
 #if XCHAL_HAVE_VECBASE
 test_sr vecbase, 1
+movi	a2, XCHAL_VECBASE_RESET_VADDR
+wsr	a2, vecbase
 #else
 test_sr_mask /*vecbase*/231, 0, 0
 #endif
-- 
2.30.2


