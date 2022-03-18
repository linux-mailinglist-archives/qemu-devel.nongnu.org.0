Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732A74DDA73
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:25:43 +0100 (CET)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCbu-0000aj-I2
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:25:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZZ-000693-6u
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:17 -0400
Received: from [2a00:1450:4864:20::42d] (port=40689
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZX-0002AW-Ji
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:16 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d7so11724655wrb.7
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JKtif+TYuN8uHF9F8OrENpLieeGqAT6wfgiqLUoWSVk=;
 b=Rf+tDPeQfJm5LJsOlsCr05YfLg8nfa1kpzEYhIEn4GBPXubNvXIABJFe8O8EsIIwWN
 KYotSshQM21xemFOFlNl/0/546bs7/IVTNIdBj5wetzs9f1YYj9U3DH45mrrls8nKQXM
 xJTtkujVFcEDmYgzre9KsxshfeUb2k8JIoZYIJB44l8k1uomLvvKs3voKTnvKT4ez00x
 wkKzLAgiUIp1iFK/G+EP/UAbtnl2MbtzE/zpci5xs7QMFzEd2E31iLZAbV85LCpdYVKS
 /0BPWst85/FhznPhgBMGVfmwo9MEdf7+B83RVLeF/lIW6ssue/H35WP2AoYWENozXUhU
 r9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JKtif+TYuN8uHF9F8OrENpLieeGqAT6wfgiqLUoWSVk=;
 b=7+k3xI6r94W/xcChaa0iSRJNKHJdWlE/xvmM6oPve9iA60llhFTAALbvBUGXkxVi+H
 9OA1s10HL0kY5AE46JOl7LtoOf6kNvlvwmppeSsFVnlT4Izs2V0Wu+ZL0fqisiW9Xu3t
 Sb1ngwMRRjjlQWw5Lp52mWt99KpyaoZ3jqs3DtiEvm0o1ReklqpvmvwugIK5yFRdiQn+
 MDhHA3U/MifXn/Q9qfktecRO7iXpqeFHY8dsj5B+d++9YzTX7wes8KwiS6SkHhN84otu
 qehcFsfcP+Sm5MwER4nN64Shb/kx1jg2gxnX65RPoHPR81ueClmWsLatTugyaHKMtmMb
 89AA==
X-Gm-Message-State: AOAM53310VRfaudiHBY2GQJgZMPWOcf6WIB3auYyy9nL/M14NpFIqolX
 oQinhYnW4WBeRlYpTlX+BOUZfrU7YnqrhA==
X-Google-Smtp-Source: ABdhPJyxhkfIsV39eqv595j6kl1U1RfQLbo8O5/mKdQhobKNFXhBGUAZ6CDdH+S5rYL1bURmsorVKQ==
X-Received: by 2002:adf:dd0e:0:b0:1ed:d3c2:6f23 with SMTP id
 a14-20020adfdd0e000000b001edd3c26f23mr8525902wrm.277.1647609794234; 
 Fri, 18 Mar 2022 06:23:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] target/arm: Fix handling of LPAE block descriptors
Date: Fri, 18 Mar 2022 13:22:48 +0000
Message-Id: <20220318132306.3254960-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LPAE descriptors come in three forms:

 * table descriptors, giving the address of the next level page table
 * page descriptors, which occur only at level 3 and describe the
   mapping of one page (which might be 4K, 16K or 64K)
 * block descriptors, which occur at higher page table levels, and
   describe the mapping of huge pages

QEMU's page-table-walk code treats block and page entries
identically, simply ORing in a number of bits from the input virtual
address that depends on the level of the page table that we stopped
at; we depend on the previous masking of descaddr with descaddrmask
to have already cleared out the low bits of the descriptor word.

This is not quite right: the address field in a block descriptor is
smaller, and so there are bits which are valid address bits in a page
descriptor or a table descriptor but which are not supposed to be
part of the address in a block descriptor, and descaddrmask does not
clear them.  We previously mostly got away with this because those
descriptor bits are RES0; however with FEAT_BBM (part of Armv8.4)
block descriptor bit 16 is defined to be the nT bit.  No emulated
QEMU CPU has FEAT_BBM yet, but if the host CPU has it then we might
see it when using KVM or hvf.

Explicitly zero out all the descaddr bits we're about to OR vaddr
bits into.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/790
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220304165628.2345765-1-peter.maydell@linaro.org
---
 target/arm/helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 088956eecf0..b5c8caafe84 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11706,11 +11706,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             indexmask = indexmask_grainsize;
             continue;
         }
-        /* Block entry at level 1 or 2, or page entry at level 3.
+        /*
+         * Block entry at level 1 or 2, or page entry at level 3.
          * These are basically the same thing, although the number
-         * of bits we pull in from the vaddr varies.
+         * of bits we pull in from the vaddr varies. Note that although
+         * descaddrmask masks enough of the low bits of the descriptor
+         * to give a correct page or table address, the address field
+         * in a block descriptor is smaller; so we need to explicitly
+         * clear the lower bits here before ORing in the low vaddr bits.
          */
         page_size = (1ULL << ((stride * (4 - level)) + 3));
+        descaddr &= ~(page_size - 1);
         descaddr |= (address & (page_size - 1));
         /* Extract attributes from the descriptor */
         attrs = extract64(descriptor, 2, 10)
-- 
2.25.1


