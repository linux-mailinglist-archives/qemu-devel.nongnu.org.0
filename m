Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130355FB1D6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:52:55 +0200 (CEST)
Received: from localhost ([::1]:35168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDob-0006gL-Qx
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCVH-0003Bv-1l
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCVD-0004lK-Md
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0ETrR474s4xPN6ye/nO2hHT6WBlhAAr4sx3ZXCNoqY=;
 b=JPlFRCCEZmntOo5o1RoIUKwXyXKg6rPfW4aK8VEvQF+tXPIvOhiMfd8iom1wAD+1FQ3b9n
 6w4AKovEk7xV8pe6b3w+/u5dzr3il3X/Y76VBS4uI7fWSQz66VHK2dqqE1gByC6HRnGSIw
 gSRe9mmAhWqD5KnBXknTZP6RuMyoPI4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-Z5JgA9rGPXKRgVil0S4-gg-1; Tue, 11 Oct 2022 06:28:43 -0400
X-MC-Unique: Z5JgA9rGPXKRgVil0S4-gg-1
Received: by mail-ej1-f72.google.com with SMTP id
 nc4-20020a1709071c0400b0078a5ceb571bso5625264ejc.4
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0ETrR474s4xPN6ye/nO2hHT6WBlhAAr4sx3ZXCNoqY=;
 b=17rm6pNVUDHouZ3a7uElNtTAL2QW00bTHL1yN8jOfg2UdTj8k6C4Rpb+HpMhqYxwsI
 tc+LpFPXhLzZgNCiKmQ6Mkwl1YoTXPL+410+rPayaa+/yBF7J6AUTrvOB3e8oDiFh9n5
 ZLMZa5cHArRuU2ctAIE7YKiZM7oSqgvJqr3yKlfCj9RSeh8zhjvD7F7kDbN0lAFGRkPp
 yFH4lAl8RiIbwWUvClbmPaSjI0GEbKSIbcqd85vOXyp2SgYJR1I4QGiVUVGbNIRWqNcn
 uZzWI0+7KBx46oXMPoYReVRO42f/3zJSjXTpXdCXJkp+ZqnEpCHhhsm2VwilygMJyRqw
 CV7Q==
X-Gm-Message-State: ACrzQf0tZaovz94H0PBt4XANrt93AEpjqmGQBa2ElMY09Mid4LZ/etnt
 1hHgXbrsjBNrTAf8PDRpgmzMLSlniLC7ZwQfdGib+xACO5GNJmiib7ZkrA5/QQMsO1MittsDN5E
 KER48cvm+wa2KMJLckVbfgWU0pGx3y/K6Qo9CLGLQEVU/c/XxnDluWGEs5Qrdba4rzK0=
X-Received: by 2002:a17:907:2daa:b0:78d:4dca:43e with SMTP id
 gt42-20020a1709072daa00b0078d4dca043emr18289275ejc.134.1665484121736; 
 Tue, 11 Oct 2022 03:28:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6mpMiqU+kH9eNCCh/VwOP2EPm1ATO1Xpm7tMX+7fjCYxvsTien8xa/Pr3f88qWBYTKBItlqQ==
X-Received: by 2002:a17:907:2daa:b0:78d:4dca:43e with SMTP id
 gt42-20020a1709072daa00b0078d4dca043emr18289254ejc.134.1665484121418; 
 Tue, 11 Oct 2022 03:28:41 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170906c08c00b0073cd7cc2c81sm6734490ejz.181.2022.10.11.03.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 35/37] linux-user: i386/signal: move fpstate at the end of the
 32-bit frames
Date: Tue, 11 Oct 2022 12:26:58 +0200
Message-Id: <20221011102700.319178-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Recent versions of Linux moved the 32-bit fpstate towards the end of the
frame, so that the variable-sized xsave data does not overwrite the
(ABI-defined) extramask[] field.  Follow suit in QEMU.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 linux-user/i386/signal.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 4372621a4d..76317a3d16 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -163,9 +163,16 @@ struct sigframe {
     abi_ulong pretcode;
     int sig;
     struct target_sigcontext sc;
-    struct target_fpstate fpstate;
+    /*
+     * The actual fpstate is placed after retcode[] below, to make
+     * room for the variable-sized xsave data.  The older unused fpstate
+     * has to be kept to avoid changing the offset of extramask[], which
+     * is part of the ABI.
+     */
+    struct target_fpstate fpstate_unused;
     abi_ulong extramask[TARGET_NSIG_WORDS-1];
     char retcode[8];
+    struct target_fpstate fpstate;
 };
 
 struct rt_sigframe {
@@ -175,8 +182,8 @@ struct rt_sigframe {
     abi_ulong puc;
     struct target_siginfo info;
     struct target_ucontext uc;
-    struct target_fpstate fpstate;
     char retcode[8];
+    struct target_fpstate fpstate;
 };
 
 #else
-- 
2.37.3


