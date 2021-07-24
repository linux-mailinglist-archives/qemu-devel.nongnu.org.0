Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1483D4685
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 10:59:53 +0200 (CEST)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7DVg-000343-Bj
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 04:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DR0-00034D-Mx
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:05 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQz-0002wQ-5P
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:02 -0400
Received: by mail-ed1-x533.google.com with SMTP id q13so4687681edr.6
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VUJlrWl+4FB407CX+X2TbXRleCCYnj6iPIcXEGt1Hfc=;
 b=nE6o0tmGp3skkWH3OkhYhFd79YchpuoOMEUVfki4sVVy5sO8Fy6LGZU84+a03CWbHZ
 6e02x9TdsUeB8Xy7X6K4NMPTUr08WYFnejFhWrCmGCZb1bc4bvmiQE093uJwWhbIOFO4
 G9lc4HzLKtG3GMMFjRdXmuCgOVKVtODX9gbBCRGYZe7cX+7ldhcWjGS4iJra1tmQFGn2
 su/Gtmbqwayk8HGnxHPU1GQy8FmGI1TE2MeyNuikYnpMhZ/+epM7TIw/Qz7D3SGPNvuu
 x2GSx7wN2WRVNUQuTL5y6i9U3z93am2gHmRXSdCPPIJDZxWacpyDqe+nqTrBjMqwQ96d
 otOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VUJlrWl+4FB407CX+X2TbXRleCCYnj6iPIcXEGt1Hfc=;
 b=rlQjQW7RjlBo1B4wSwzWEGXxCR+UxiXRglnuaEXkdfnUo0qWtsvIWis1OVOkAVkUYH
 5xCq+pRua6zbNWZ34fAj1XoSHbdSmHwhLPGQKACOqh5RiZ948wSyX9d+RffYj5nmViL0
 Q28nkIZyF0KZ89NXXT9zDIB8P7tvi7rk0/+3rX829Tn+rP/XPXT8eem7dIqiPd4tzxv+
 m458vDsLSKThFlpb8aWDEn9g0A5OJ7w9/F6y/oA5wxxV+aArHYokcKrTeF+sHfSNX+t/
 EZ4ca/U+sN2Q8+D1bUEMUWMgsWwCeAIDV3LNuglw4cnhkTXWLuNA0tmsLB6c9DTEwFHT
 LuXA==
X-Gm-Message-State: AOAM533S6DoWKvwqRBL0ittQGbhq0VwJXvKj37PaIR6R8qs6r8NPEXhV
 0pN+0ViWVdczRjFFI4s22WfNh4kC4oqTJQ==
X-Google-Smtp-Source: ABdhPJxWKWzi7ERLRsDotpdgiCek1gRNLj/Zgrt6M7ruUdn45BVSsdJY4Csn5ChIWReEUF7MFxYoLQ==
X-Received: by 2002:a05:6402:1385:: with SMTP id
 b5mr10178708edv.276.1627116899934; 
 Sat, 24 Jul 2021 01:54:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j21sm15723881edq.76.2021.07.24.01.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 01:54:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] MAINTAINERS: Add memory_mapping.h and memory_mapping.c to
 "Memory API"
Date: Sat, 24 Jul 2021 10:54:50 +0200
Message-Id: <20210724085453.16791-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724085453.16791-1-pbonzini@redhat.com>
References: <20210724085453.16791-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Both files logically belong to "Memory API" and are not yet listed
anywhere else explicitly. Let's add them to "Memory API".

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210723100532.27353-4-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 190a90b541..445f7fe2d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2460,9 +2460,11 @@ F: include/exec/memop.h
 F: include/exec/memory.h
 F: include/exec/ram_addr.h
 F: include/exec/ramblock.h
+F: include/sysemu/memory_mapping.h
 F: softmmu/dma-helpers.c
 F: softmmu/ioport.c
 F: softmmu/memory.c
+F: softmmu/memory_mapping.c
 F: softmmu/physmem.c
 F: include/exec/memory-internal.h
 F: scripts/coccinelle/memory-region-housekeeping.cocci
-- 
2.31.1



