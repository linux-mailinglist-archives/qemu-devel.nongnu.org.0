Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A63EB48A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 13:28:19 +0200 (CEST)
Received: from localhost ([::1]:49020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEVMI-00061Q-9a
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 07:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mEVKZ-0003Al-TQ
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:26:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mEVKX-0004ey-VR
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628853989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfQAzrKxjRuJBWe/tqbh1NmyCNL6bF3yTkYktgk4knk=;
 b=BafFKRrpj82p9qXFxTSJzNQVFHJU67YHNR0GV5+JCW88C4BdpjJ7yMQPu9WR9+ca0WkHr1
 LMb+LQf4/hdfzRYhxJhZ+sl2qvS7ZaCJrVhRBP8/8hFVHxgMyZRqWUtz6QrVyatVSVdi6x
 hjDt6HRAiJdAGstJhJ/QithIa5kSh4I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-V_AlkRVcPFqi7JRlZdTW4A-1; Fri, 13 Aug 2021 07:26:25 -0400
X-MC-Unique: V_AlkRVcPFqi7JRlZdTW4A-1
Received: by mail-wr1-f71.google.com with SMTP id
 k15-20020a5d628f0000b029015501bab520so2816936wru.16
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 04:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wfQAzrKxjRuJBWe/tqbh1NmyCNL6bF3yTkYktgk4knk=;
 b=Ekungs/PtgEtNP1rAF9+i+CFJ2hCHqx1r1cv2+AHRA/lWozD8PZl2o/FB8z4R1t/1b
 8T/QBZqcCiRzK82lcPeKQIaWnPFSYBQE4KkkpjiFvzd6iQkRCbLydbeOxhPaDRSCkwaB
 rAte7TLDfA/G/UBi4GKPpGkzUk73RlAoqvEHSINhmwkkA+K5KpOeCWfr28jiiy9rTEU/
 Z+c+6OGxX7LdR/Rh46vCK4d1vgWS6+UrjhIxc84lljxmWVX1jmOKn0xME4G+iCo9Qos4
 n8PKu8hzNzjWUrFoxgQZDSveIVM96OWmjdLDmJ3dbj9cGE9zzzodSG0K+yuV+HQ0Hm1d
 Z26Q==
X-Gm-Message-State: AOAM532OOLzUgGUU7aF4EKIJvNOESVLhMtBB1cUK60Co7nGU8W3wp1D5
 SNlBw11AIM4uPbkIjPvvFSHHuoyjvnA19UpgDg9lmMzg6N/+T3AHB4/YIX5eJDY2dAU8szpEBOm
 KI57qKOVwSKfUBLBFfoEjsmjH8ck514VuX+edtTU8oIsW0UNmaJ8r781xVzYnppYk
X-Received: by 2002:adf:cd04:: with SMTP id w4mr1976927wrm.119.1628853984444; 
 Fri, 13 Aug 2021 04:26:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAFnQOwbTdw+3Y1TWppFVvARxX7xWxjwZWDH3bVaNn30JkwTxQIhgOdnlCFeCruw/Q/2Df6Q==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr1976908wrm.119.1628853984270; 
 Fri, 13 Aug 2021 04:26:24 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 q75sm1254983wme.40.2021.08.13.04.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 04:26:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1? v2 3/3] hw/core: fix error checkig in smp_parse
Date: Fri, 13 Aug 2021 13:26:08 +0200
Message-Id: <20210813112608.1452541-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813112608.1452541-1-philmd@redhat.com>
References: <20210813112608.1452541-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The machine_set_smp() mistakenly checks 'errp' not '*errp',
and so thinks there is an error every single time it runs.
This causes it to jump to the end of the method, skipping
the max CPUs checks. The caller meanwhile sees no error
and so carries on execution. The result of all this is:

 $ qemu-system-x86_64 -smp -1
 qemu-system-x86_64: GLib: ../glib/gmem.c:142: failed to allocate 481036337048 bytes

instead of

 $ qemu-system-x86_64 -smp -1
 qemu-system-x86_64: Invalid SMP CPUs -1. The max CPUs supported by machine 'pc-i440fx-6.1' is 255

This is a regression from

  commit fe68090e8fbd6e831aaf3fc3bb0459c5cccf14cf
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu May 13 09:03:48 2021 -0400

    machine: add smp compound property

Closes: https://gitlab.com/qemu-project/qemu/-/issues/524
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210812175353.4128471-1-berrange@redhat.com>
[PMD: Check MachineClass::smp_parse() returned value]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/machine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 159c6b098e2..29edf655140 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -834,8 +834,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    mc->smp_parse(ms, config, errp);
-    if (errp) {
+    if (mc->smp_parse(ms, config, errp)) {
         goto out_free;
     }
 
-- 
2.31.1


