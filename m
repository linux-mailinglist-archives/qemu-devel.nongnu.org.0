Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B806F248F
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:17:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjW2-0007LU-QV; Sat, 29 Apr 2023 08:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVq-0006W2-Je
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVn-0004xs-TP
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t3JYSL71/jrUO57UK1NBG3ZDARVXsuJxlKqthvDRR88=;
 b=J0RGCz0i2964i1wPsCKyF05h7NGStTV7wpKQQ25KKztjNuC+53gNSh/y436kHHwirQey9t
 o/5Ca54wRi9jtLY8xfO37CRogBMGIcxXKlRjhLEGwcpSY3dQemH7f2nBfgVFWiDaMUoKtZ
 agluXxddvK57+kUiSJUoWc0VSvKXmBU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-8MjjKOgvPb22Ir1p0zDsTQ-1; Sat, 29 Apr 2023 08:17:09 -0400
X-MC-Unique: 8MjjKOgvPb22Ir1p0zDsTQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-505b696f254so641041a12.3
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770628; x=1685362628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t3JYSL71/jrUO57UK1NBG3ZDARVXsuJxlKqthvDRR88=;
 b=C/B46dEQrT4McSwgyvE0trgKhys1J4LVji6sADGnlEemFte+gI4ZkRkXgDDUo+OULW
 kzD7eGusnEPZABKisW6DFe0HdTUnp4Man52MXnNxVp5Z5OryilvAatEZiU8YXANcsZTU
 F/z4TuJIKGY02MuDx/bZ11BUFcS3/f6LJ1Nw+wS6e3u2tTBO+5M5x3oxLa4BYPuxMWx9
 7gOXtRXac1V+qPs3PZmAALOp7fIhtMvtJi9r4JlfzQGaaw2ZwQsJB8al4rf758HBLl3N
 BwbKEb3PAu/LbNWJKscaSLEGxkqx+JNFVaMcMv9DVch8ZtEHP0bbj39QitLHgJ0Ec2Ui
 fBbw==
X-Gm-Message-State: AC+VfDytTaRDoDns1QfwnB1gT/JPBwyuB206lsjzOxXEMYrW0vEPMcR2
 ESli7Gyp0u7/KP/B+/QCY4qxXfo5xlf3kWx0k0FxZKZQO3xFtiAYVK5W+W2E69KVTFo2iOnW8dN
 2DGo/Or+l3ABDPzR38yB0XEYPktBCnLKYXKQQRyOLcr7nElXBxToYlYG2g9x8PI0AbATM62x12I
 c=
X-Received: by 2002:a17:906:7307:b0:958:489f:d050 with SMTP id
 di7-20020a170906730700b00958489fd050mr8126340ejc.43.1682770628042; 
 Sat, 29 Apr 2023 05:17:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yzEOI5ljzWYkfeJr/5QBSPYLZtp6AJk5qEH2cnLWnt/ng1RvcrIo5s+2pTZwpGPvFh5Q+Ow==
X-Received: by 2002:a17:906:7307:b0:958:489f:d050 with SMTP id
 di7-20020a170906730700b00958489fd050mr8126315ejc.43.1682770627783; 
 Sat, 29 Apr 2023 05:17:07 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jt11-20020a170906ca0b00b00958434d4ecesm9914872ejb.13.2023.04.29.05.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:17:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 16/17] async: Suppress GCC13 false positive in aio_bh_poll()
Date: Sat, 29 Apr 2023 14:16:35 +0200
Message-Id: <20230429121636.230934-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429121636.230934-1-pbonzini@redhat.com>
References: <20230429121636.230934-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Cédric Le Goater <clg@redhat.com>

GCC13 reports an error :

../util/async.c: In function ‘aio_bh_poll’:
include/qemu/queue.h:303:22: error: storing the address of local variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ [-Werror=dangling-pointer=]
  303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
      |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
  169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
      |     ^~~~~~~~~~~~~~~~~~~~
../util/async.c:161:17: note: ‘slice’ declared here
  161 |     BHListSlice slice;
      |                 ^~~~~
../util/async.c:161:17: note: ‘ctx’ declared here

But the local variable 'slice' is removed from the global context list
in following loop of the same routine. Add a pragma to silent GCC.

Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20230420202939.1982044-1-clg@kaod.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/async.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/util/async.c b/util/async.c
index 21016a1ac7c1..856e1a8a337a 100644
--- a/util/async.c
+++ b/util/async.c
@@ -164,7 +164,21 @@ int aio_bh_poll(AioContext *ctx)
 
     /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
     QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
+
+    /*
+     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
+     * 'slice' is being stored in the global 'ctx->bh_slice_list' but the
+     * list is emptied before this function returns.
+     */
+#if !defined(__clang__)
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wpragmas"
+#pragma GCC diagnostic ignored "-Wdangling-pointer="
+#endif
     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
+#if !defined(__clang__)
+#pragma GCC diagnostic pop
+#endif
 
     while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
         QEMUBH *bh;
-- 
2.40.0


