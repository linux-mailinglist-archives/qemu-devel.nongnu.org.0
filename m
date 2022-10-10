Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40DE5FA024
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:24:07 +0200 (CEST)
Received: from localhost ([::1]:45890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohthO-0001bf-Sx
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ohtez-0005m5-MD
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ohtey-0004cd-70
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665411695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e3NUxF1+Tzq2ok79UpX3/5w8gQ7pafVbkvz8kbZnNrM=;
 b=BrzeSnNRH48mc36PkXC8pSkXeNkRHATFsSx8ceCMWrdIcG87PLuFFwvTDzH17nEaAnG0pB
 Ee8yaxsB90whhZhwWN96bDluP5x5NTtEfjse+owRPqg/rkU7Z4uCF0uDYwfjRtd81GZUFY
 iNOW1GPGHyq7UZVXI2ctthAe6qUiNxo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-i9zxCofaM1-G6u4MhOt05w-1; Mon, 10 Oct 2022 10:21:34 -0400
X-MC-Unique: i9zxCofaM1-G6u4MhOt05w-1
Received: by mail-ed1-f69.google.com with SMTP id
 h15-20020a056402280f00b004590868099cso9013731ede.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3NUxF1+Tzq2ok79UpX3/5w8gQ7pafVbkvz8kbZnNrM=;
 b=q0Af3t1G8RNN6aOwG+ry2HWdwlfg9kXfTFvwlrt+71McKmYOgNpapjQneBJ9eydasx
 thFs2cClN2IEC0+/BTixJogbtwsprbZtgGYnqkVkEvAQ+J2zJ4bbuVMJwXZau8tAwLlM
 tFIPhmbKyIjbcfqSYSXjUPr/oqu9ozEyZt81NwgRLi6+QW9ymH4vAEJMQ+6kLHdQtI+1
 JX8wDD/HxmDZ940hlOZ1PkV6PvVe5Ey2xmCO34SaYrvBzox+ekalLQbVJ4EIRV4yMEia
 h9y4d9pclv32j99n5hNkJXl6QndXuwwkXL/kHM7SW5rjDcJwuZBwJBR0LRoWlS5zkrYJ
 WPEw==
X-Gm-Message-State: ACrzQf3OJA3sVOZKT/GySlfLdPU3iVdhS+YCExObVAiLRS2Giv84RpBB
 QsciEaEa25HNAAbbfuO8ZdmTSclA4iQkcliA3E0aa+oimDDQsLQUjyzijS5lMC75hUQ8BE5/WXY
 oIK0QdAOZ5xWfX4qM5Lfg8cAZfleIfN28YGe3Xprh8ZFNX9e9F4q7vu45iVryHbr/IwE=
X-Received: by 2002:a05:6402:148a:b0:459:2eab:9b0a with SMTP id
 e10-20020a056402148a00b004592eab9b0amr18159484edv.139.1665411692560; 
 Mon, 10 Oct 2022 07:21:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5pjJNdIqXGht5fxb/x65ZWABl055JMmEy9FRZzfkFDssl1ePhI4uxrQmZHMlBXpTntpRuwNw==
X-Received: by 2002:a05:6402:148a:b0:459:2eab:9b0a with SMTP id
 e10-20020a056402148a00b004592eab9b0amr18159450edv.139.1665411692241; 
 Mon, 10 Oct 2022 07:21:32 -0700 (PDT)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1709060cc100b007402796f065sm1121845ejh.132.2022.10.10.07.21.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:21:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] linux-user: i386/signal: move fpstate at the end of the
 32-bit frames
Date: Mon, 10 Oct 2022 16:21:25 +0200
Message-Id: <20221010142127.295676-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010142127.295676-1-pbonzini@redhat.com>
References: <20221010142127.295676-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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


