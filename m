Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7F58ADE7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 18:10:29 +0200 (CEST)
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzu8-0003Qr-JP
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 12:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeX-0007Vj-Nj
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:54:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeV-0004nZ-U3
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:54:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q30so3671769wra.11
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=k/xzRy6n6kryMDsLlFXQYpE8ENmkU+xTgBLizNQ4axM=;
 b=VCbM1SuFksRv50tsWgQAocIb7lLKRe0Rj05acF8vAjax+hZAQAC0dCxxbSbo4/6sUv
 yC4oOt5UVo6+aJfUxNf3FCHmCQ+Q5OhB9kD8AidTvpVLbInR1vDplRStniKhs8BviImS
 V+bNyZw02DfIDSAIPRC4/D8PN/GPZtl5acTv2Mwj1xul8/yJpG386+zQAUryEyGT3eFv
 P4su4iW4iyaXbhMY7iDADPBN51dTgzTHuqFCLBvWuHarR9fuMGv/ZWcSUGJx7L4fHkA9
 RsdAS11TIVgqBEwM+uQL26fSu22xkR12FZanVZPrqiXmg7JnYKTrYd5AVjR9yvd2Ksqs
 N4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=k/xzRy6n6kryMDsLlFXQYpE8ENmkU+xTgBLizNQ4axM=;
 b=K8SjwK9QUQfhOYgdRbyWctAnj12ww7uofPPCmeLCtdTB19wNcqftt4bCn1pVGidwUc
 aD3WfCvIjf9yOsOU4eLrMj098R1D4ldo3mBDkssW9gQ8aFOAIdAK4gSYZuB7FMfkP7U8
 oA+wtS/xT4DtoJD8OVthbwJKSOx1XabWgRaIwIq0WmvST9Ndrs1ygfJEB65FU1OJ0jXF
 0Zo4SWSl/RDr7vu76ad+QPiNtFdJgwk0Wawzuji+LzUU9pev6NMWN0IN33dO9+LT0Obw
 RpsH5HW+RiP04RHuoLapYB2hGGFo38J3y26KDmqRDL7CQJ3mBDXIFLVcmqj/uLG3Y4WD
 V/oA==
X-Gm-Message-State: ACgBeo0hbnR39twCep7bYmypqSJbNaq0d7UhSjKvKQhVnfQm9ECa86vy
 hmse/2RmpS1d68Be2ZznvvliiQ==
X-Google-Smtp-Source: AA6agR5mcr2sQ/sALCUIzgWdKT5088DtbcOo38FdmnmtJqGqH8Fzuys8fOyttlA0Op+TFIdqvZxLOg==
X-Received: by 2002:a05:6000:693:b0:221:7a12:8d6a with SMTP id
 bo19-20020a056000069300b002217a128d6amr1570978wrb.290.1659714858342; 
 Fri, 05 Aug 2022 08:54:18 -0700 (PDT)
Received: from henark71.. ([93.107.66.220]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 08:54:17 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 1/5] target/riscv: Ignore the S and U letters when formatting
 ISA strings
Date: Fri,  5 Aug 2022 16:54:01 +0100
Message-Id: <20220805155405.1504081-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805155405.1504081-1-mail@conchuod.ie>
References: <20220805155405.1504081-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 Aug 2022 12:00:40 -0400
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

From: Palmer Dabbelt <palmer@sifive.com>

The ISA strings we're providing from QEMU aren't actually legal RISC-V
ISA strings, as both S and U cannot exist as single-letter extensions
and must instead be multi-letter strings.  We're still using the ISA
strings inside QEMU to track the availiable extensions, so just strip
out the S and U extensions when formatting ISA strings.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
[Conor: rebased on 7.1.0-rc1 & slightly tweaked the commit message]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 target/riscv/cpu.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac6f82ebd0..95fdc03b3d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1122,7 +1122,23 @@ char *riscv_isa_string(RISCVCPU *cpu)
     char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
     for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
         if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
-            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
+            char lower = qemu_tolower(riscv_single_letter_exts[i]);
+            switch (lower) {
+                case 's':
+                case 'u':
+                    /*
+                    * The 's' and 'u' letters shouldn't show up in ISA strings as
+                    * they're not extensions, but they should show up in MISA.
+                    * Since we use these letters interally as a pseudo ISA string
+                    * to set MISA it's easier to just strip them out when
+                    * formatting the ISA string.
+                    */
+                    break;
+
+                default:
+                    *p++ = lower;
+                    break;
+            }
         }
     }
     *p = '\0';
-- 
2.37.1


