Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB990529E61
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:46:03 +0200 (CEST)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtmF-0006j1-0r
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTR-00086O-BN
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTP-0003Yb-Ov
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nN7r0beIl23EOwo34aiCMtclrAAwX19cFP3sQ4Uv6ZI=;
 b=MjeAHkANJAoRz5WfeVGcV8d3jwsjSnPjSiPqaXQ+Lxz/ptka927zTibhDrDTpwLzOp19WN
 EsQUx1VSXSplloIK1e0QwKM2jdqatOMxHu8M9BlAFY1o4zxFE67i+kTFCmkHmuuct1Q/cK
 F+A7FB/F9+xK/RfohBmlWrJg2EuZa58=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-xMOi9-dhNYKJ-gb-MOq6Ag-1; Tue, 17 May 2022 05:26:33 -0400
X-MC-Unique: xMOi9-dhNYKJ-gb-MOq6Ag-1
Received: by mail-ed1-f71.google.com with SMTP id
 h11-20020aa7c60b000000b0042ab2287015so3456338edq.3
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nN7r0beIl23EOwo34aiCMtclrAAwX19cFP3sQ4Uv6ZI=;
 b=UpFha58xXVHx/1yUEEEGRXreD12EJzFddZxfgEjMZLB2r8vFBsHBY3u802guHV6vFT
 PfyaFLPAO1iVAlz9dgI6prRv2Y0wceE2nnW0eEQdjn0mKbM/6q4NTtYkBKjmgA1r+cIJ
 gBaMJ/2JmrWqWZCFjIcMYWwwGpHLc2KgKmMNaDt+n93G3W6Y+hcuSWbAIHZV5L6Kvtqb
 b5X2dZIOTDWDQi9mDd6W5+c9RC/N2+mj8ey0N9zW36/oTmOjazTILv9rjw6llsk94cej
 BYv91A/GTuO5PfC43mE5htUpWYf1epxil4TTD/eXsCU/A2ED3tU49G0TXZy3Prx6ruVY
 SNtw==
X-Gm-Message-State: AOAM532jp6yJ2rRZ3ZRViOaEarYOOerxSb5m+XCfS6d8GubDzlJQmfWD
 ZEgCmOrWeaZOcxkb7OqD4AhCdjhJr887CLlBHkGMReoshZJ3ECipXGZozSH+OS+UBQ7w1gd37PH
 7XTnZ9ijQ5IMAU+FifFlKZ4r5NgNlCfCwRsZWxOw76y86U8SoB7mqqKdMFKRjRXyRKYM=
X-Received: by 2002:a17:907:7b92:b0:6db:71f1:fc20 with SMTP id
 ne18-20020a1709077b9200b006db71f1fc20mr18308609ejc.343.1652779592407; 
 Tue, 17 May 2022 02:26:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUnwe+aPpRggwNeE0I86tw9YeC7bxXQuv/xPOiVNYOqk2SBtC89sz8hIxyeeLbrWOg8Df73A==
X-Received: by 2002:a17:907:7b92:b0:6db:71f1:fc20 with SMTP id
 ne18-20020a1709077b9200b006db71f1fc20mr18308588ejc.343.1652779592134; 
 Tue, 17 May 2022 02:26:32 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170907910700b006f3ef214dabsm816755ejq.17.2022.05.17.02.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 06/16] tests/tcg: correct target CPU for sparc32
Date: Tue, 17 May 2022 11:26:06 +0200
Message-Id: <20220517092616.1272238-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We do not want v8plus for pure sparc32, as the difference with the V8 ABI
are only meaningful on 64-bit CPUs suh as ultrasparc; supersparc is the
best CPU to use for 32-bit.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/configure.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 691d90abac..59f2403d1a 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -70,7 +70,7 @@ fi
 : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-: ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
+: ${cross_cc_cflags_sparc="-m32 -mcpu=supersparc"}
 : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
 : ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
-- 
2.36.0


