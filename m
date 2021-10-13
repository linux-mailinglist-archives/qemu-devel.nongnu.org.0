Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956A242BB59
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:18:52 +0200 (CEST)
Received: from localhost ([::1]:43064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaPT-0000Ca-K8
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEn-0002GA-2R
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:49 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEj-0005hs-41
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:48 -0400
Received: by mail-ed1-x534.google.com with SMTP id g10so7368841edj.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i5Q7ravtNv+LMTi+DPhAh6MiXPOowmkPtgZBEGRvYxw=;
 b=UU7SB4gpAd6W5zpYb2XNv3qd4I0ApCL5ICNX1zbXDhLdH0neOH12371u4bG3lMetXq
 NqCmSyRTMvoUnI2mLBSqCe2gX9XeRRAbHkjyDlwVQ1Gqs3lhap6G9Jkdb9w7zgNA7w2y
 tEtTifHHzDtG6CvEF7CAHatJxTeEwr/zn/DTquSlbj6l7lkDBxT1WcBbodBaZNXWUZVW
 4JqPIzJQRZQQBtjVJMOcplrP0MbFjtIAQ8In59+nHjACKiTXw7QMcaUi7/jg92QR7KwI
 lIdiGBFWNhoW6NPyBb8o/3oxoT11VwxnegqCNSjOcKgCIY7xb/ZefNUygBGcqJE1Wd0i
 1IXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i5Q7ravtNv+LMTi+DPhAh6MiXPOowmkPtgZBEGRvYxw=;
 b=B66VhRgwTUfGJi7SxShT0h4hQIj+Tv5wTulYUNPhqevmnUXEHKdZaDP0uTlREKWM8J
 FkGnqglngZ4tIiQJwNOXd3/dknUfm6emJHIyuwZ+1U6QobWG7fzNeizpfjAQAm1ujeV/
 5zGByJnFyLGsjrENruZWRAnpxokrveFQlT2pZTnW4/H/CY6+diTuEJOO3C5mma0393Yk
 TW2VwHpScORS4qGLDRoGas9B35RT3bKojCU2k/3YEc7H0oxbZ+qWG2G7rQXx/GBRvsr4
 mvMunhowvq1QpUszguaoV28hdkMu6BTphxylBaeZfMHe3qsmo9ieBg7mL+OOxmmXquVv
 lt5g==
X-Gm-Message-State: AOAM5321MLkv+h4uo2o9UKHKHm3zOCUJrj5IADVCjdYj3unjbxXGBUDD
 Lf2iEvY7Sj2pduKhf/NYZzPmQEow2lA=
X-Google-Smtp-Source: ABdhPJwxzUko1PGQ/mRLHHvFIh05S+ZpMb2kdFvgffXnlG6JD+6mKsfEWosfkWcK15iPXxHOsAn3xw==
X-Received: by 2002:a17:907:629b:: with SMTP id
 nd27mr38773630ejc.24.1634116058275; 
 Wed, 13 Oct 2021 02:07:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/40] target/i386/cpu: Add missing 'qapi/error.h' header
Date: Wed, 13 Oct 2021 11:07:00 +0200
Message-Id: <20211013090728.309365-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Commit 00b81053244 ("target-i386: Remove assert_no_error usage")
forgot to add the "qapi/error.h" for &error_abort, add it now.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-8-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a7b1b6aa93..b54b98551e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -27,6 +27,7 @@
 #include "sysemu/hvf.h"
 #include "kvm/kvm_i386.h"
 #include "sev_i386.h"
+#include "qapi/error.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-commands-machine-target.h"
-- 
2.31.1



