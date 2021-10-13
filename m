Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D9842BBB3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:34:41 +0200 (CEST)
Received: from localhost ([::1]:59482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaem-0004qz-Ro
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEt-0002UQ-Nl
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEo-0005sM-F8
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:55 -0400
Received: by mail-ed1-x534.google.com with SMTP id g8so7268409edt.7
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ep7UvjMq3uUV10FUcwpkD1q3h/E0ThEAGvGre/JUM6Q=;
 b=k/wXIa/XZJB3fFds1H8UAiS5/ngl2UkR06El6TIS1EpYwZ189EwXvsEC8eYCDV22tb
 qHBDFB8Xu+KzKn/bOd/w3m0R4X3w7CtafHwfXxZi7FAHwQzg7DHTx02svqJNDsbj9TDZ
 XwXxYvk6QWmKQU2t+NnYHuv5ESS5DKwZqcXitt51Gnj7qqVwOhDNEUV9LHgtAnFmhiiE
 YqriwGm7Nvm03k3r0NRAn4uHKkojob/F71Pt8a85meoOCf0L/MVj5MRpdtmA5fHSFlc1
 Wn/AhqhJ3lg1BBxdLnukNZqzTBRkGrw2ZpwOCb8AzRBFkvPMCSemJ2nCzLITGYKU3RoL
 8sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ep7UvjMq3uUV10FUcwpkD1q3h/E0ThEAGvGre/JUM6Q=;
 b=Xf4vNoyuZLlerkXHQNqH9nj0A4Nu+1BEIwnFMBgjhlLFE6e97YuUJQgDKEM9sPsBrl
 /kgIARg+fpTSMMHV2+3RekrQPeJEAq1oy7BdHCzhcmh3rosDSkQP4DcGg1xj4Fupw7GJ
 R8Uxo5EegxaWu+VLbnToYlyigl9RGcl6B3l+S+g+OM0AN7ZdMJ1++iIiE3IeT2GIkU83
 T0UkMiC9AqKbAViObNMXOxUzdc5X+dMdy4y8coJXr9TBbRQQhhB2kBsVJTRf6E8XeGeC
 PhPkeRcKT176vKpeiXXXpIpVcykiDa2jq2r4mT76QcX7BHa0/tmwOdqWcYqAgaqRoyGU
 llOw==
X-Gm-Message-State: AOAM530ZZz6NqhrGN8se5cZQcQS0+cEfLFN4eqCZ7/531Ufs8IOKBCSA
 alycYJos1R5+nZATbihzDQbT7SXyomk=
X-Google-Smtp-Source: ABdhPJyEwnok4rzEJD/Qf53VwFZ7md8isjjzHSCClGghEk8Fj+38Ls/vQVWnNnig5O1HdXbXUv+uXw==
X-Received: by 2002:a17:907:f83:: with SMTP id
 kb3mr41144206ejc.453.1634116069150; 
 Wed, 13 Oct 2021 02:07:49 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/40] MAINTAINERS: Cover SEV-related files with X86/KVM section
Date: Wed, 13 Oct 2021 11:07:16 +0200
Message-Id: <20211013090728.309365-29-pbonzini@redhat.com>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Complete the x86/KVM section with SEV-related files.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-24-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32b668e92f..e31c190b47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -417,7 +417,9 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 M: Marcelo Tosatti <mtosatti@redhat.com>
 L: kvm@vger.kernel.org
 S: Supported
+F: docs/amd-memory-encryption.txt
 F: target/i386/kvm/
+F: target/i386/sev*
 F: scripts/kvm/vmxcap
 
 Guest CPU Cores (other accelerators)
-- 
2.31.1



