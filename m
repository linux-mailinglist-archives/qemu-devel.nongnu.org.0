Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F3768AF14
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:46:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObZi-0003Sy-9N; Sun, 05 Feb 2023 04:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3f3rfYwgKChgGACGHy3y4CC492.0CAE2AI-12J29BCB4BI.CF4@flex--smostafa.bounces.google.com>)
 id 1pObZg-0003SJ-6W
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:44:40 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3f3rfYwgKChgGACGHy3y4CC492.0CAE2AI-12J29BCB4BI.CF4@flex--smostafa.bounces.google.com>)
 id 1pObZZ-00016g-UO
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:44:39 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 l31-20020a05600c1d1f00b003deab30bb8bso4588088wms.2
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=di6n3s8XJp9c3hUNu18fxGHG7njnSIxXVr67hNdV8+o=;
 b=JXRtmpdF6SFugFolWqmC0L4VkzEhkGfeimPXstQmHd3gtRXiHwemEuuel3uOX95LIJ
 HPhEZtkkrm+qXkY5OphU2VFjp2vkiFL+x0zWcSlOD4E8iUALVkPfHki3gKwz5XzYsma2
 pgyuHHGR/3UGgyXkehU9Zf92dfzk/jJphTJ/DYv9Jsnfin/5S8QGwG67oRkgfHYzOhfK
 oKEXE1yCU+Csg7mNgQSuLsEO0C3xKbAwYJNc3Hk/w40aT0Ib8pCDYkM/46wz/Jbz3jeX
 ZA/CLdsk0oeiAtn4UeNBGCebxqoXq7e/oePiHSAH6DuFHO/2SwiEI7bfbsjRFJDOHEzV
 m1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=di6n3s8XJp9c3hUNu18fxGHG7njnSIxXVr67hNdV8+o=;
 b=3CD7zqQt7ebprVZgQWCg83MeRywvip0OrLdRUYlgbnhF+SgqBX9ZyarbB25be+2RLT
 /znGro2k3stuhBZtcJcHrzecf8xjLdiOztopkU+DbfIonGSLJwklEtWTuyngTpPw0w7O
 d82UGPNgIuQEwLYflWQyJlr4RqU27IR1c6TKKr1Rea9UhLjeCS7lgk3SAfsvdfun0J4E
 ntNbx/lsHiGY2Rs/Dyhk1dcIxWjknRIUU7hlYVSioTE8nEcy7OLigxr24OdcfzHEIg+R
 2qYxinqLyISO2WkOwJ22rANTQe//SOBqKj64b8YjE2ElSvAjaFyRpxmBUpaLFY3WwaIe
 hyxA==
X-Gm-Message-State: AO0yUKXG+Rlhi9zqRZDIfa4GnXAf1JVi8XAjXg5QtN2NUrEUrdOLPP2P
 HS6btIGwJSGgyplXwEy8KyrTxMiQE3KOtI6DCLyXlT93wyu5MtRHD7OJ5eoHoZAdcKoHPd55HH2
 Ie6CLmslHAYHAJvD0xUQSXHQ5jV9TQNNBbTJ0ys9ndWhAlD9zc/Xv3FBUSn3Gls8Isg==
X-Google-Smtp-Source: AK7set+2xxi4bKGHvLCqdFtV7ChNR9YKBsv5HIHd4voNiiruGqrVv/xHBkQ7FMxAXzvmb8I/340SNXsNH0WNuQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a1c:4b0a:0:b0:3da:f8a:5b01 with SMTP id
 y10-20020a1c4b0a000000b003da0f8a5b01mr113212wma.2.1675590271522; Sun, 05 Feb
 2023 01:44:31 -0800 (PST)
Date: Sun,  5 Feb 2023 09:43:56 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-2-smostafa@google.com>
Subject: [RFC PATCH 01/16] hw/arm/smmuv3: Add missing fields for IDR0
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3f3rfYwgKChgGACGHy3y4CC492.0CAE2AI-12J29BCB4BI.CF4@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

In preparation for adding stage-2 support.
Add IDR0 fields related to stage-2.

VMID16: 16-bit VMID supported.
S2P: Stage-2 translation supported.

They are described in 6.3.1 SMMU_IDR0.

No functional change intended.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index bce161870f..170e88c24a 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -34,10 +34,12 @@ typedef enum SMMUTranslationStatus {
 /* MMIO Registers */
 
 REG32(IDR0,                0x0)
+    FIELD(IDR0, S2P,         0 , 1)
     FIELD(IDR0, S1P,         1 , 1)
     FIELD(IDR0, TTF,         2 , 2)
     FIELD(IDR0, COHACC,      4 , 1)
     FIELD(IDR0, ASID16,      12, 1)
+    FIELD(IDR0, VMID16,      18, 1)
     FIELD(IDR0, TTENDIAN,    21, 2)
     FIELD(IDR0, STALL_MODEL, 24, 2)
     FIELD(IDR0, TERM_MODEL,  26, 1)
-- 
2.39.1.519.gcb327c4b5f-goog


