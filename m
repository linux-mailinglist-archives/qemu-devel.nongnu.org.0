Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5084B28BCF4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 17:53:11 +0200 (CEST)
Received: from localhost ([::1]:58880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS08M-00064o-CH
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 11:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqo-0007Hp-RN
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:35:02 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqe-0007N9-EA
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:35:02 -0400
Received: by mail-wm1-x342.google.com with SMTP id p15so17503210wmi.4
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZETMc4CfZhy2eJWBeDKW9CaWM4uEKiDWd22Cf9UUe+4=;
 b=vHuergGqTQF/IwNUwneX8OnCvtqnJm9nqZW/mdXcDH4epnbcgjhO0QhuDO5V2HbxoQ
 Hfm1tmaRqjFcttGcfHV47BPAJSsiXHA/btiIr/JLPXQ6/mrAiQsq6diOa8Q6pe4a79Pd
 7CpU9pmzpSB++BeedrpU0F6hFVIdPkYVJF0RiQ7GKqa8fE2HG/uPZRJ8pYiMKgWt6JDy
 4GmisitabxDBAooyhUe+05iVsCB8qIgy8rTkKYhoJVp+t/LkKujBJSO9WhtTdoJNcofd
 2tnQfkb6fDoGE+a/o6lwhyarUwdZ47tohAPeIlvQyRBNfCCLf2p/B8EFs/mUIB/7ExFi
 62tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZETMc4CfZhy2eJWBeDKW9CaWM4uEKiDWd22Cf9UUe+4=;
 b=jWEa94LMajmsUDFZ0j51BFyTtOwgACqQdnkuIXHE1jniRSSmkk5jYEhW87RjSwk2oe
 LLNmUAtHirt81XdnVhSqQ02HSYtk66JuQ+JqIM2lRjQAkW0cYxAxyZHV/SNleVl16HT3
 KWFxsj3PhLzZtoGFgcFZdaJKqlZtZXn0slX17jH9WhwND1iOetODpNJ78S/FoDQ3UFev
 Wm1BvWSEqpAniqEMYMpo9vmNSiY6h/t+zOS7b2ej2qe64tuajDjbqQakEZyu1epXfuah
 MHvALTekrB6+1G8sbGtBraM3Vmq+cKSVBF8nFhzwXJNvnuhBtMKQofvUsLsB6cfJzLtg
 BbbQ==
X-Gm-Message-State: AOAM532OWIjdsMMm2A6PaAkeBU7bv5WqFs4fYVAhHw6aj+UvTwV5xE64
 kaMXcNYyq+Wc5VPhoqR23abb/VUtlxcXEpPS
X-Google-Smtp-Source: ABdhPJzN642iTil2DjhIzNczYCC53MEGWhHB34BWfVg/Cz6M7NoOElCu+h594WX7iTwa5Q6LkDdMvw==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr12018508wmi.56.1602516884046; 
 Mon, 12 Oct 2020 08:34:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Delete unused ARM_FEATURE_CRC
Date: Mon, 12 Oct 2020 16:33:52 +0100
Message-Id: <20201012153408.9747-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 962fcbf2efe57231a9f5df we converted the uses of the
ARM_FEATURE_CRC bit to use the aa32_crc32 isar_feature test
instead. However we forgot to remove the now-unused definition
of the feature name in the enum. Delete it now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9e8ed423ea1..9d2845c1797 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1950,7 +1950,6 @@ enum arm_features {
     ARM_FEATURE_V8,
     ARM_FEATURE_AARCH64, /* supports 64 bit mode */
     ARM_FEATURE_CBAR, /* has cp15 CBAR */
-    ARM_FEATURE_CRC, /* ARMv8 CRC instructions */
     ARM_FEATURE_CBAR_RO, /* has cp15 CBAR and it is read-only */
     ARM_FEATURE_EL2, /* has EL2 Virtualization support */
     ARM_FEATURE_EL3, /* has EL3 Secure monitor support */
-- 
2.20.1


