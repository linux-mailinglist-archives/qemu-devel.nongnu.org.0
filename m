Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4330D4D0499
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:53:23 +0100 (CET)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGbq-0005lV-Co
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:53:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW2-0001cm-KZ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:22 -0500
Received: from [2a00:1450:4864:20::32d] (port=54005
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW1-0007ka-0s
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:22 -0500
Received: by mail-wm1-x32d.google.com with SMTP id 19so9301644wmy.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uwF139MRa/ui3lWjCgZadSTEZfoUO9damBLTd17IfOk=;
 b=o3RMUUxiOJv65VQuPTkA4plC6vqEKnqwELwGthRYYsMOb97IeZG5r8HkHsrk19WPrC
 pL85KVuCV6EJQ/GljECP0JNKWi96ascudzorEQxl1K+uD5Ts07BJfBzR00+Zq4FFpUGW
 gjZO8/gNhQchtMzzBKvC1gzw0DLLojbhTefdlPzipWMeJLswaDWu7MnM2KBFO4zE9YNO
 ATEwYr998+ZWH/lt4CE72I8MpplbzJH/I92FDFNSyjgSS6TMlRM004lMu3dSH2MeDLZY
 t+4EX/Pw/g8tt0uDlZJHNImE3yG5OPdDdc+gC0dm/3UlV9Ep1/VN5FIJrLYhmwPuhjPF
 ebgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uwF139MRa/ui3lWjCgZadSTEZfoUO9damBLTd17IfOk=;
 b=IANND6hb/w76F8edJxutdcrIu3h72JNSMnabjIOLm8LDE4Ily25ZmNgeic6jD9h7QP
 iSsQqB0fwxbdquLK0qvrZYEdXroYMmFaDyrqJb/jsfaoJHFKpQTo49YAMNCvF7tiQ2d4
 h4laDJhMX19nooz8Jqfo6dETh/8hW4itYGKTSLWgqe3MpDhH376eim8CfBOyPZkJYg8j
 H7AMbOoUKifXLcz6kT2BzSD6P6Sj8kw17+rd2U+ddAidFeLkC3rCD/rMxycPpAqZIzFV
 tIlqZKtgxLdVoPWpBWOCGkkuKIWUeoRtas6Fw2z6X+/f11kB+VC6pVfaNuoO9C1JMAtL
 i1ew==
X-Gm-Message-State: AOAM531Pt/wzQVXy7MR5fLnv1a7TA8GMv40cmMSS6OpW70TJU1aIxQGf
 YtltpxH8HVZz9dAQsBvMmOPDvaqg9BuoqQ==
X-Google-Smtp-Source: ABdhPJwZ3SgXz/hUrwwiMngr+MzN6/RvEh1rN6DwLqQHSuRUfWlOkS2EAcNPYrxlN4XHBEzP+VWUeg==
X-Received: by 2002:a05:600c:4e56:b0:389:bc4e:6ffb with SMTP id
 e22-20020a05600c4e5600b00389bc4e6ffbmr2223398wmq.63.1646671639710; 
 Mon, 07 Mar 2022 08:47:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/18] target/arm/translate-neon: UNDEF if VLD1/VST1 stride
 bits are non-zero
Date: Mon,  7 Mar 2022 16:47:00 +0000
Message-Id: <20220307164709.2503250-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

For VLD1/VST1 (single element to one lane) we are only accessing one
register, and so the 'stride' is meaningless.  The bits that would
specify stride (insn bit [4] for size=1, bit [6] for size=2) are
specified to be zero in the encoding (which would correspond to a
stride of 1 for VLD2/VLD3/VLD4 etc), and we must UNDEF if they are
not.

We failed to make this check, which meant that we would incorrectly
handle some instruction patterns as loads or stores instead of
UNDEFing them. Enforce that stride == 1 for the nregs == 1 case.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/890
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220303113741.2156877-2-peter.maydell@linaro.org
---
 target/arm/translate-neon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 3854dd35163..072fdc1e6ee 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -657,6 +657,9 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     /* Catch the UNDEF cases. This is unavoidably a bit messy. */
     switch (nregs) {
     case 1:
+        if (a->stride != 1) {
+            return false;
+        }
         if (((a->align & (1 << a->size)) != 0) ||
             (a->size == 2 && (a->align == 1 || a->align == 2))) {
             return false;
-- 
2.25.1


