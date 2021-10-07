Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C08425001
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 11:23:36 +0200 (CEST)
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYPcl-00021k-E1
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 05:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYPZF-00080G-Q3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYPZD-0004CO-94
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633598393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D8cU27lq5klMAETnyUf7daQLc2+dsGARPgDFfJ3w2IQ=;
 b=VZEQBGXaHXRuK+6I0HdZzOwm8rm2jPnObAD6gI8V3GPLzHwVvxYFS97TBDQjkgDfQ2shM2
 UrQjvTrdVFtzP2w66mMV9Nd+P9j0jFmrAZLv5tZDNiQg4ruJBUygvY5JW/pu+7VtQ+B9Ya
 XK+3a3gWTlsosLOGebSCHblMn8WD4ZM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-OZbzcaTbN8K6NscicfsMWg-1; Thu, 07 Oct 2021 05:19:52 -0400
X-MC-Unique: OZbzcaTbN8K6NscicfsMWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so4165011wrg.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 02:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D8cU27lq5klMAETnyUf7daQLc2+dsGARPgDFfJ3w2IQ=;
 b=COv25zSoLflM8lLHUtgNUodaadzzBuWNZT9xsfJVXAUEf3eTa9z2FJZmRwBAuCnHYv
 I1q9MvJG6IO975/uGj7MTrPR8w9Ilth7VDtkUunDMC6ihQhWJ94Vd0kITkmPqPYgyUqA
 H8hCKgZzNTFE8KuDnWKokJRaT8NA6yZk9t0xVLSNioV1wJpao15NM8wSVH5f47Yk4LYB
 iUr+K09x+ZntazdjLwo/6SELzsgK/JfWf8SzPUKmmA9/bAzE6olou60y62uAG0WhURuf
 fwnhPp+eL31X2ZSAvDInfW6/jDQHLeplUXUzja/osD34Jz15tWAHAJHREfG/x9KlWO3s
 AGsg==
X-Gm-Message-State: AOAM5323V0sXCHDh2yM3jDTOTNy2X1HTsBagLK9ZWwDqWwxHjmF4R4qr
 xNuppe68W2eUSdqur8bha6iAD8no+3366wCEe0VmnM0VPMQkq1YE3rx/ScqJi3KmSOg5LvKEHqk
 kSCCM9w+0XJea+UA+Nc4ZD9vbinBDkMI2WkkPh1Yc846oOJNz2QFIvRrTk7YVp5S3
X-Received: by 2002:a1c:19c4:: with SMTP id 187mr3338383wmz.149.1633598391513; 
 Thu, 07 Oct 2021 02:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkhWFwluJccazTpjGz54OjIEM9xAXrw1Z0CsIEsUEhxehwJlKPisTk8X34W7qzHgFxsjQ7wQ==
X-Received: by 2002:a1c:19c4:: with SMTP id 187mr3338357wmz.149.1633598391174; 
 Thu, 07 Oct 2021 02:19:51 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o1sm10435677wmq.26.2021.10.07.02.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 02:19:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Add myself as reviewer of the 'Memory API'
Date: Thu,  7 Oct 2021 11:19:49 +0200
Message-Id: <20211007091949.319404-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having developed interest with the Memory API,
volunteer to review the patches.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f5..32b668e92fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,7 @@ Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
 M: Peter Xu <peterx@redhat.com>
 M: David Hildenbrand <david@redhat.com>
+R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Supported
 F: include/exec/ioport.h
 F: include/exec/memop.h
-- 
2.31.1


