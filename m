Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8723067CF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:27:10 +0100 (CET)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uDN-0005i7-Mc
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:27:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4uAS-0004Ch-2h; Wed, 27 Jan 2021 18:24:08 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4uAQ-0006OU-Jw; Wed, 27 Jan 2021 18:24:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id i9so3070806wmq.1;
 Wed, 27 Jan 2021 15:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KywAJi1iH990IONXYtUf0Z5t6U0xeQ+Rtz6RmnWHa7s=;
 b=GOJJW/soREUnQo7GCsikbGCSD7sPfSAM/izTUfneUirHM7BJi3eXBzpxbnDptZX9Ps
 V5ZyxI5w00UUBQJ5kvj1bIk9P8MBk5yPmYTokptp1IS2UAy6VKU0b8iO1jUwUgQUat21
 i9tbZJRdNNvKJhPVOmxTCOZK9m9I9aDbCz4f3cysyhpMsWgdj0sbBLMjs39wraJ+GkET
 VrLcWAMCod//yOSkTUnxG4sIZq8QeQiU1+RBdbwox0QmUVcBLCZKDb4CqSIXRb6V3a/5
 /LDDpxOiAvJd8t/9TcYOaIUTcHC2LLRQJLItcQR56ngrQi4pJxWkQeJCPvMMZjAuaqOj
 uh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KywAJi1iH990IONXYtUf0Z5t6U0xeQ+Rtz6RmnWHa7s=;
 b=hU4T1WVBGZaqhEubv55835PiRcpwpqZddSK3Uqa0GsmU7PCc3PJI9yHOBluJYIjEDm
 hbUZxtOVoifdk643RL9wkdr87Q1AZzGvQGhmMIliA9itXAx9wqkgzZfJ3H1YT/gffBZI
 vLZZigpt49KO02WLnY57i893MmmaDWQa3JEQfu8YmgLd/MAL+SsRWj+IPQb7mUfKwniy
 oKJJuPfTiox5N45KZAdvIzfcJddEpI2kKuCwdujZwhpuUNgcqdY0+LFQ8KlObRDTF3Vo
 lFwBGw2y+j1mjGjojApVngTjXt1yJ3b9O+3NoxSH59KeyjjVuGsth2gcmmcQKU9ommYm
 1vOQ==
X-Gm-Message-State: AOAM5337jBX9HXgH1HhUQLJVI/brLkzNX5ybX4BINx2ejXLo5VdcfnZK
 TTa58zWwuCdPBSx7Pl/eEloOIoLoPhY=
X-Google-Smtp-Source: ABdhPJxdlpS649dHwZCjECtfKBjnh2pYgjVjkh3gyxehFOxYxVbbiRd4Esv3S5EXMlvMApWGlyabXQ==
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr6081182wmq.139.1611789844667; 
 Wed, 27 Jan 2021 15:24:04 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f13sm18075wmf.1.2021.01.27.15.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:24:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Remove unused MMU definitions
Date: Thu, 28 Jan 2021 00:24:01 +0100
Message-Id: <20210127232401.3525126-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Joe Komlodi <komlodi@xilinx.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove these confusing and unused definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/cpu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2609e4082ed..cb002102888 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2205,9 +2205,6 @@ enum {
  * may be needed for precise access rights control and precise exceptions.
  */
 enum {
-    /* 1 bit to define user level / supervisor access */
-    ACCESS_USER  = 0x00,
-    ACCESS_SUPER = 0x01,
     /* Type of instruction that generated the access */
     ACCESS_CODE  = 0x10, /* Code fetch access                */
     ACCESS_INT   = 0x20, /* Integer load/store access        */
-- 
2.26.2


