Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29951FA20
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:40:14 +0200 (CEST)
Received: from localhost ([::1]:57806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0oH-0004k0-J3
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0f6-0004Yw-JO
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0f5-0002nN-3W
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bt/lCu7Al/ofhqAsL2EZtmQPYAWx6O0kFoKyJZvt56k=;
 b=VxxCi65oocog38ybMs58w3sIb22zAE/2g00oWQpFDKk5FKlLXpXAhpTPo858wjl1MgWtno
 kyT7rpCaOxgLQq2YGgdv8X3mukrSbgZ+B/193vZXoyXo3kRnnGRABOxyX68kLpgY1jmqaE
 LhU0E000QiVpLgppYmvS+N+42r+e734=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-2n1VyYNEMEWjM9IfCKXweA-1; Mon, 09 May 2022 06:30:41 -0400
X-MC-Unique: 2n1VyYNEMEWjM9IfCKXweA-1
Received: by mail-wm1-f69.google.com with SMTP id
 26-20020a05600c021a00b003940660c053so4095119wmi.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bt/lCu7Al/ofhqAsL2EZtmQPYAWx6O0kFoKyJZvt56k=;
 b=cfVI10c4oBEAK/6iaGh+je4XcXNzZYUKCZnB0HUVaqrRztqnYqrj0hQJIpWMB7rryj
 7MrSAMPwengYSCpj3UmD5AOg26IiK60uxhY8wUoeFc0yeXGUdGPDmCRoMS7h+osJXfJn
 XrRxkMgzZqwu4jMzZ72cZTTBLXLJ0z4rr9FW7lpQjkoJpPgELZ34NYxHBpkaCCb9CxIi
 8OlCarwmE24cEGEVDfiLa8G+Tm916PaZwjIiMym2U+brH+/D3dfdgnzrV3fTCEDxkrFO
 HJQrcaQ+qjrzLYEzzPj6GFLTdbKejzujISyliC+xu21PGASV+UdT9UjCX8G8T92w05AU
 BvBQ==
X-Gm-Message-State: AOAM532R0aOwFCfg+0bpT9drLGOT0jArwBjzb8bfHEinrI0nI/h/x+SH
 fu8xUuoB6tdNRi7Mjk4nO7UaWdZfG6VE0zoI5X6r/LfSn5rtRqAkO0r+YFdqQ/A5i8UTdpVw6Qy
 FThSOrKStwRmIBNjZ3pxNyCi9lI9cisKsqj8EoR9uYW3INJej36qdPV52XEmSfGlALwA=
X-Received: by 2002:a7b:c3c2:0:b0:394:9229:3b40 with SMTP id
 t2-20020a7bc3c2000000b0039492293b40mr3504683wmj.195.1652092239690; 
 Mon, 09 May 2022 03:30:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXsasSXXQPdXKSaw9809OtyqO9Z6rhjNrVUK6Ddkpt2DVmtLlUuDxOjPahnR7qkAZDXqrPgw==
X-Received: by 2002:a7b:c3c2:0:b0:394:9229:3b40 with SMTP id
 t2-20020a7bc3c2000000b0039492293b40mr3504652wmj.195.1652092239247; 
 Mon, 09 May 2022 03:30:39 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c00da00b00394517e7d98sm11839221wmm.25.2022.05.09.03.30.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/26] iscsi: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:02 +0200
Message-Id: <20220509103019.215041-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/iscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index d707d0b354..b33eeec794 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -290,7 +290,7 @@ iscsi_co_generic_cb(struct iscsi_context *iscsi, int status,
     }
 }
 
-static void iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
+static void coroutine_fn iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
 {
     *iTask = (struct IscsiTask) {
         .co         = qemu_coroutine_self(),
-- 
2.35.1


