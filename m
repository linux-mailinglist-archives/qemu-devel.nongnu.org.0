Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE238F241
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:27:51 +0200 (CEST)
Received: from localhost ([::1]:51728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEMn-0004Ye-T3
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeU-00054C-EI
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:02 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeJ-0004Om-6M
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:02 -0400
Received: by mail-ej1-x635.google.com with SMTP id n2so42775523ejy.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zJ+4ctxl9rJ2GoSUbpS/PEa40oPl9E9xb9BjzoxwX+g=;
 b=ebyYMXrKX69XMR00nud9wvIup/Hwvgb4wNNDEt5I+5l6g7LCevW7bt0dzRZnFKd6tK
 CxVs99nyQ/3tVlmf74u/aKGe5GeLTQm/CIn3TDyTTTW40wZ+E668z3FdbI7sXp6yLmg5
 oY5dojpNzzZ/x2xsaAC/rndrZngnXc2fOHMykRMUqAk2yJ93GOGOejkLTwmyAxAo7zbY
 gcgP7Ls+o4+0ANnuiXPDWJ3Ed77YMANtZJMDZaIsvJ4501ROkuBG7393D75uycgsECQ9
 K6xDAXGg8cLfauBMA3EPXizrRpyQxqgwznHYwXjkFrOFCqDN5THWNADC2MgcOlgs2EAA
 5LYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zJ+4ctxl9rJ2GoSUbpS/PEa40oPl9E9xb9BjzoxwX+g=;
 b=CY8ngKovf6H5QIcNUjXrbOJwua9JK3DFSg7GT8mxGhmDDLQvFhcJ2k0FQjGZOFP+0k
 9BYW0x5BdjNtMrbS2O2nh6brxqqAtrb3Dsw7K/T6YA9TmDZUFZFORJIEw/GX+UIxhyzr
 nyMZujhyjaDBFPRKOhd59fJotWqpcaf9SRQRU0TxHeynBau//tm1RLXIMaO8BdNuNENo
 ghKBFbzO4R29UDjpznwQdlrXHw6Ciyg9wZ6S1/8HxNqg+x6ICJiNTi/3Sm05zBeNomWb
 ME54M/Ha6rIRDLSloc0ThY49uhtNgmW8g1ucBg0/kOmFopeIb2NPDIm395OaXlZayzxe
 MtRA==
X-Gm-Message-State: AOAM532IzSO/+U6U+N0tbXWqmrrD4yYpdT7vNrlr8Usc2xscfpeyz5n7
 I+gtwjwj/2+rK1WZylH6j2yajZCNBTPR/w==
X-Google-Smtp-Source: ABdhPJzVn6AoFaQw7HZA6wPhN/wT49np5N9kdGSBfweicVHexuvai8RZS4KzmAl0FkiuUJGk9AMikg==
X-Received: by 2002:a17:907:7747:: with SMTP id
 kx7mr24449753ejc.400.1621874509754; 
 Mon, 24 May 2021 09:41:49 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/28] doc: Add notes about -mon option mode=control argument.
Date: Mon, 24 May 2021 18:41:28 +0200
Message-Id: <20210524164131.383778-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: Ali Shirvani <alishir@routerhosting.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ali Shirvani via <qemu-devel@nongnu.org>

The mode=control argument configures a QMP monitor.

Signed-off-by: Ali Shirvani <alishir@routerhosting.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <0799f0de89ad2482672b5d61d0de61e6eba782da.1621407918.git.alishir@routerhosting.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.hx | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8116f79818..14258784b3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3799,8 +3799,11 @@ DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
     "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
 SRST
 ``-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]``
-    Setup monitor on chardev name. ``pretty`` is only valid when
-    ``mode=control``, turning on JSON pretty printing to ease
+    Setup monitor on chardev name. ``mode=control`` configures 
+    a QMP monitor (a JSON RPC-style protocol) and it is not the
+    same as HMP, the human monitor that has a "(qemu)" prompt.
+    ``pretty`` is only valid when ``mode=control``, 
+    turning on JSON pretty printing to ease
     human reading and debugging.
 ERST
 
-- 
2.31.1



