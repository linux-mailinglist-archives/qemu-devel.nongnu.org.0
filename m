Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D863F9B2D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 16:54:46 +0200 (CEST)
Received: from localhost ([::1]:39642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJdFb-0004E4-Vv
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 10:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1mJY0i-0003tv-1c
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 05:18:52 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:39438
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1mJY0f-00050Z-1h
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 05:18:51 -0400
HMM_SOURCE_IP: 172.18.0.48:36062.1589962076
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 3107F28011D;
 Fri, 27 Aug 2021 17:06:34 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id a61ef009a5e44161b92069b69bec3eec for
 qemu-devel@nongnu.org; Fri Aug 27 17:06:37 2021
X-Transaction-ID: a61ef009a5e44161b92069b69bec3eec
X-filter-score: 
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
To: Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
From: Guoyi Tu <tugy@chinatelecom.cn>
Subject: [PATCH] qapi: Set boolean value correctly in examples
Message-ID: <a21a2b61-2653-a2c9-4478-715e5fb19120@chinatelecom.cn>
Date: Fri, 27 Aug 2021 17:06:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.228; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Aug 2021 10:53:30 -0400
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
Cc: tugy@chinatelecom.cn, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
---
  qapi/trace.json | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/trace.json b/qapi/trace.json
index 47c68f04da..eedfded512 100644
--- a/qapi/trace.json
+++ b/qapi/trace.json
@@ -99,7 +99,7 @@
  # Example:
  #
  # -> { "execute": "trace-event-set-state",
-#      "arguments": { "name": "qemu_memalign", "enable": "true" } }
+#      "arguments": { "name": "qemu_memalign", "enable": true } }
  # <- { "return": {} }
  #
  ##
-- 
2.25.1

-- 
Best Regards,
Guoyi Tu

