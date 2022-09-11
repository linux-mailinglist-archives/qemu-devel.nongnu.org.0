Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAA85B51CB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:10:30 +0200 (CEST)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXW5t-0007Ls-De
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0E-0000F0-Ju
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0A-0006yc-RZ
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63JWKeVT8M8PmHZsUE+N88zOM8RQl3zJTIbziTJXVyE=;
 b=P5jjJvu8OnB9bJ5KD8h6BndhawjtKaWt7wObbt+x6/CDiApVapddxQVnMhlKuDi3ptcCYJ
 hW5nWuA13nVH6S7RaY0X27rkN8q8ed3SfzABHJ8WQo0MPj587qWn/6w/fmPEsBI3ltJHJw
 1Z4adGlIBmjFP3WXVMvl7jOVUUZeZ2A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-47-LnkmA5myPmmdVs9UWaVSPg-1; Sun, 11 Sep 2022 19:04:32 -0400
X-MC-Unique: LnkmA5myPmmdVs9UWaVSPg-1
Received: by mail-ej1-f69.google.com with SMTP id
 qa33-20020a17090786a100b0077a69976d24so1608326ejc.7
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=63JWKeVT8M8PmHZsUE+N88zOM8RQl3zJTIbziTJXVyE=;
 b=HMgcYN4Z8rpvGVFNYV8htsXDTrsJGYM8v3cbaXnlugyg6I93FCiQD2aUBT+W7ZPMzm
 48Ese8V6dQbAAs8pFgZf+jRz6NR6Jdsle4uWgFN54dw3IJoANhMz9Gdj4M+UE/l8yWck
 Sea28I8PJSE8gozPkVaACrna8zV2UqBgpyKxBPkX96vbFiJSYpyIfYvlupKxSxWdgFLv
 AfdZmdJBm24VXxVvCiVQjEPNk79GVBFR84MSyjJz3mG15IdnT0NuBbBPuSOGT5EM886c
 eJMVEKhbMwJf5amzkcxc5ceGrDPytUj+z7hrMYmuxI6zI8rT4UiaYpC9evgaUI6OcWIA
 YeMQ==
X-Gm-Message-State: ACgBeo3+O2whrNDPZ7/GKE9mu8OWDwZGKqe6b2jhtQgyFnbW1pwLUNxz
 9u9TD5rZL033PsBnTGMn6JiASXCrICma8TAIwKyaCN/x0m/012ll/8w+InmvKz4VQgVmcs1X3gz
 kZSX+ZpN1jzQee7rCcCaT4Prg3ztYUrD+XnQ9A0cH0kkrX5ywEDOtNvs+0rGTH6Mwo1I=
X-Received: by 2002:a05:6402:5168:b0:44e:9ca8:bf6 with SMTP id
 d8-20020a056402516800b0044e9ca80bf6mr20078761ede.384.1662937471411; 
 Sun, 11 Sep 2022 16:04:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4fBzBxb9qXcHE+U1G+OyAoIWSCxGrSdxzPqt4ksamfpuBRE5ZR0xFq9IjSgTCY0zx5KIEnWQ==
X-Received: by 2002:a05:6402:5168:b0:44e:9ca8:bf6 with SMTP id
 d8-20020a056402516800b0044e9ca80bf6mr20078750ede.384.1662937471171; 
 Sun, 11 Sep 2022 16:04:31 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 kx24-20020a170907775800b0073d5948855asm3473448ejc.1.2022.09.11.16.04.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:04:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/37] target/i386: REPZ and REPNZ are mutually exclusive
Date: Mon, 12 Sep 2022 01:03:43 +0200
Message-Id: <20220911230418.340941-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The later prefix wins if both are present, make it show in s->prefix too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9a85010dcd..f8fd93dae0 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4737,9 +4737,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     switch (b) {
     case 0xf3:
         prefixes |= PREFIX_REPZ;
+        prefixes &= ~PREFIX_REPNZ;
         goto next_byte;
     case 0xf2:
         prefixes |= PREFIX_REPNZ;
+        prefixes &= ~PREFIX_REPZ;
         goto next_byte;
     case 0xf0:
         prefixes |= PREFIX_LOCK;
-- 
2.37.2



