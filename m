Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D853F3032
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 17:53:38 +0200 (CEST)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH6pt-00061M-Na
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 11:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH6ob-0005LA-GO
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH6oZ-0007Nd-Ve
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629474735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JyvK/4+u0ni2k4EpGGoUzxSNQskts9xhrmwBcCNWJFA=;
 b=Teg4Om6NrA517ssgGdxUb66zTtNs2lgyo/soWW8kf3kkXaSnz97ppQ7cq9xqEROR8gComV
 5nynncQebUoNHtbUWKRnOpJHDROSLUpGGhkMEP2O6bjw9ZbmJOkjfU4znVTAxd5WfdHZo+
 I9eiFQoIOD2UTjP5yW1S+nrinGWfcNE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-GrBgBEvGMgSPisxTUBIRpQ-1; Fri, 20 Aug 2021 11:52:13 -0400
X-MC-Unique: GrBgBEvGMgSPisxTUBIRpQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020adfce0a000000b001572d05c970so803706wrn.21
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 08:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyvK/4+u0ni2k4EpGGoUzxSNQskts9xhrmwBcCNWJFA=;
 b=b9T50LnYRu2huw275RGa6fo4ef9fNDQY8oHPKxbPNEfNlRuY2LcULfarPETBLRcmsN
 rTyNVoO46efZ/G3wl8iJ62ofbbKxIkwe9NJYwA+0YiZRB861gieuewqHkAiFX6HBK6oL
 eezYyyNNhhUvKx2zUuMt1Kn9mva2+Cn/jpmi1FaavO9tk+x3vjv1ZeQSTfO9W4KuIvCv
 0YRWvFCrzLoi9lYrU4E/PQHqi2Lv/oD10It7RfwEP6gODN0YVBG2KfbyMH6YOQoAi41f
 6TCI6k2ql7vLnYJmlfpxBoEnrdX1h6Gf7UFJ6T7lIZsXaqTCojO9JA29j8lA1cw1smgn
 Cy5A==
X-Gm-Message-State: AOAM532fzLbBaL7+2kgGONzgG5HFZbN8hEn+DUhSvDT8YAez40qb7C1U
 00LbpVrxnU/yoPSDpyFwIF3roJBnJxo55nNefsJu2tD7ckpqcDwTGKAkZ1TUIIE0rdcpijYPejC
 bdhM3OSFbVz0DNcHrO0V636xNgD4A8s8mQnjbNLwkoHd+5/tm+tuvr6dl+5JfpPbI
X-Received: by 2002:a05:600c:21ce:: with SMTP id
 x14mr4724557wmj.187.1629474732688; 
 Fri, 20 Aug 2021 08:52:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCA+O25wQBlacZxERuhJsXx7iKFrV8+hpeoFCPdQkXxx06eAFgZLbBTC44Fj1QxpUUZFC3uA==
X-Received: by 2002:a05:600c:21ce:: with SMTP id
 x14mr4724539wmj.187.1629474732459; 
 Fri, 20 Aug 2021 08:52:12 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l2sm6163811wrx.2.2021.08.20.08.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 08:52:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
Date: Fri, 20 Aug 2021 17:52:11 +0200
Message-Id: <20210820155211.3153137-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When Linux refuses to overcommit a seriously wild allocation we get:

  $ qemu-system-i386 -m 40000000
  qemu-system-i386: cannot set up guest memory 'pc.ram': Cannot allocate memory

Slighly improve the error message, displaying the memory size
requested (in case the user didn't expect unspecified memory size
unit is in MiB):

  $ qemu-system-i386 -m 40000000
  qemu-system-i386: Cannot set up 38.1 TiB of guest memory 'pc.ram': Cannot allocate memory

Reported-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/physmem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 2e18947598e..2f300a9e79b 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1982,8 +1982,10 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                                                   &new_block->mr->align,
                                                   shared, noreserve);
             if (!new_block->host) {
+                g_autofree char *size_s = size_to_str(new_block->max_length);
                 error_setg_errno(errp, errno,
-                                 "cannot set up guest memory '%s'",
+                                 "Cannot set up %s of guest memory '%s'",
+                                 size_s,
                                  memory_region_name(new_block->mr));
                 qemu_mutex_unlock_ramlist();
                 return;
-- 
2.31.1


