Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4141A10B1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 17:54:47 +0200 (CEST)
Received: from localhost ([::1]:49690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLqYo-0000AN-80
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 11:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43686)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jLqVf-0003UE-8t
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jLqVe-0004Mg-AP
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34733)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jLqVe-0004Lt-4h
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id 65so4506025wrl.1
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j8FdPU/oaPxbpC8XFRmXIv/XBHTSg+RMGViKj8kJEZw=;
 b=im2/Gh9Hxw0EKBnx3wf00FbaA4avWtSg5SUZZLF+t+ggQJqi0XzkuiFQTjWIHQri40
 gtPfUzbSbgZsCYcdGnip4B22aq+y8QEH3OKtcB+XBz61GEFj5aA2oJtEjMI1wqM+oFyD
 bmNOrDtLib0s9SvtyC5jujraGOtCBn9p+s7OUOfg7TV6IKBpuNCQpXFjjsOIqrlD6Lp0
 Iy0Vnq+wcdjFpod/FI3je8SVBZhNWt3rqTMbCmIiAxKiWJtniucq4vzxzSYEPsuMXAYm
 EPsABRbTU+KPnBA5v+zbXrHLuK/FkAZkmkcbeq4VC7fFi8qUQVDfg9ntXEYH0Ah5oXlX
 Jn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8FdPU/oaPxbpC8XFRmXIv/XBHTSg+RMGViKj8kJEZw=;
 b=qoA0UoCezi8vD20hHsuR1bENyJrjshLR9GNxOhA/ubTxVD9IkFVT2ASchi7L0Mj/ZR
 3Zw/+w52kAhl6Y36YN2f9wO4hlL++JEUpGEkczkxWVKBwxdc8ErHKeydkGB5MJcf31fL
 G2izyqJFPKR4gbaDTnwQ/haTGhquxq8b1Ud4HB4K78Il3XmtsphsjzGyBwSlNOOSQuEG
 lPchirUpAUqjJ72ut0wh84gAuCY3zWOexJtG7k0EpNYnwHS/N/F2Q/5s2nCewWCiT6g3
 lkMOoy46gaNqGTr6l61gMjcb7flzodE5ypubf773APA9mkFseNSpN7sQPcmdqe+uJU9A
 9ktg==
X-Gm-Message-State: AGi0Pub81vVN3PuoWQP4GWJSKzCBrfqmMQNjekXTolsn14SxxcqxNcfl
 xrDvA7IosLf+6gHTssBdIbRgsA==
X-Google-Smtp-Source: APiQypICSKzQFOuf/Uzaliq7T18bt7H9bzWK+z0dTArpLf5JJ9tcbl0i4ysGORz1Vl6MmxvMWqYOfw==
X-Received: by 2002:a5d:5707:: with SMTP id a7mr3392347wrv.108.1586274688989; 
 Tue, 07 Apr 2020 08:51:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s13sm15474804wrw.20.2020.04.07.08.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 08:51:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C71061FF92;
 Tue,  7 Apr 2020 16:51:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/13] target/xtensa: add FIXME for translation memory leak
Date: Tue,  7 Apr 2020 16:51:11 +0100
Message-Id: <20200407155118.20139-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200407155118.20139-1-alex.bennee@linaro.org>
References: <20200407155118.20139-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42a
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dynamically allocating a new structure within the DisasContext can
potentially leak as we can longjmp out of the translation loop (see
test_phys_mem). The proper fix would be to use static allocation
within the DisasContext but as the Xtensa translator imports it's code
from elsewhere I leave that as an exercise for the maintainer.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Message-Id: <20200403191150.863-6-alex.bennee@linaro.org>

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 8aa972cafdf..37f65b1f030 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1174,6 +1174,11 @@ static void xtensa_tr_init_disas_context(DisasContextBase *dcbase,
     dc->callinc = ((tb_flags & XTENSA_TBFLAG_CALLINC_MASK) >>
                    XTENSA_TBFLAG_CALLINC_SHIFT);
 
+    /*
+     * FIXME: This will leak when a failed instruction load or similar
+     * event causes us to longjump out of the translation loop and
+     * hence not clean-up in xtensa_tr_tb_stop
+     */
     if (dc->config->isa) {
         dc->insnbuf = xtensa_insnbuf_alloc(dc->config->isa);
         dc->slotbuf = xtensa_insnbuf_alloc(dc->config->isa);
-- 
2.20.1


