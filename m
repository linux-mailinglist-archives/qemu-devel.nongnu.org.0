Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39892DB714
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:22:33 +0100 (CET)
Received: from localhost ([::1]:35488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJeK-0002z7-O9
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHo-0004a6-Tn
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:59:16 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHn-0003tp-Az
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:59:16 -0500
Received: by mail-ej1-x62e.google.com with SMTP id q22so12296082eja.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LK9i50FxwiL3rNg7XdhCP+0wnCiZXodjB1KHibKvjIg=;
 b=C7+31wk0dn7nvtLlLbxQ4tdyPvFocz+jtQVbV6fd/Exq7EiiI1Vs35cDoR/f5NBMCj
 RJMJx/qMLe+sSU9/eg6XYz8vQaRJH1URYGtksIlkLf0lNyEYKvAV8w6MF0UhRvYhAzjf
 q+xXwE9N0zJW7KvCaM4qaJYOEBq6l1DX0UWNa4LNAg4ZKBHKuIm6NNAvD14mZLB5zdbg
 SoQLlCidIImoZC6Aokyp4xjMQ8kA/hykrPAmqCjOFlYQsTtznNZa8fQvau+NpOOlOeDJ
 DRRPas9CQnCp/CuW33x/Co5DZUGOXpMZyjJ5WBbPq9V63bMms/ivXFJMki9d8pX0Naab
 ha/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LK9i50FxwiL3rNg7XdhCP+0wnCiZXodjB1KHibKvjIg=;
 b=uduT/4J4hy2eBB1tkBz1xwVM4wKDxxQxsQ2g3YO/WdczMqofxTYhQmjiI3YbOIOGGn
 m2n9KvDWC1dWi6mjjmEGKV7fX5/zC4ETPteA1sKsXGh1yD7ZWdYnPt7XetQnYUQEf5uX
 5fPevyFCXA6+PwLRgzy1+LQhr85aogfXXzMHFA9YfigKkPoMV1mucW9ZjtFnYfy2sv+L
 sJy3vqFODHbqIBvlhizb8jUnbhvVi+ioUTarM41GRpi0FeUbvY+L8mDBaQdlOnf6Sx28
 WSbAca8enb4I/l76rt2vP/qn19I6pKdweDtYtVlkh0w3W+eg0j/GxmaTb/gUTF6HEJhu
 nNug==
X-Gm-Message-State: AOAM530UldIpx1WgNEThOHF6s/wJtxxQdQQWllXyS5S7RY+WolQarebr
 ZZapb3fBD9gHXCZU5y7MFpM=
X-Google-Smtp-Source: ABdhPJwQL9CCQxq3bPS0duIjRuCmTSMfE/3q2UjXzR60heKG3S98TXLkf8U9pAaYKT0+ILnrFYl6pw==
X-Received: by 2002:a17:906:9250:: with SMTP id
 c16mr29307186ejx.355.1608073153983; 
 Tue, 15 Dec 2020 14:59:13 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id cc8sm20203236edb.17.2020.12.15.14.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:59:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/24] target/mips: Rename msa_helper.c as mod-msa_helper.c
Date: Tue, 15 Dec 2020 23:57:46 +0100
Message-Id: <20201215225757.764263-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MSA means 'MIPS SIMD Architecture' and is defined as a Module by
MIPS.
To keep the directory sorted, we use the 'mod' prefix for MIPS
modules. Rename msa_helper.c as mod-msa_helper.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201123204448.3260804-4-f4bug@amsat.org>
---
 target/mips/{msa_helper.c => mod-msa_helper.c} | 0
 target/mips/meson.build                        | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename target/mips/{msa_helper.c => mod-msa_helper.c} (100%)

diff --git a/target/mips/msa_helper.c b/target/mips/mod-msa_helper.c
similarity index 100%
rename from target/mips/msa_helper.c
rename to target/mips/mod-msa_helper.c
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 596eb1aeeb3..05ed33b75ce 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -7,8 +7,8 @@
   'dsp_helper.c',
   'fpu_helper.c',
   'lmmi_helper.c',
-  'msa_helper.c',
   'op_helper.c',
+  'mod-msa_helper.c',
   'tlb_helper.c',
   'translate.c',
 ))
-- 
2.26.2


