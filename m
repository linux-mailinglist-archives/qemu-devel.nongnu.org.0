Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283D21CC71B
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 08:17:22 +0200 (CEST)
Received: from localhost ([::1]:47808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXfH6-0001Vj-Oz
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 02:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jXfGB-0000fy-UX
 for qemu-devel@nongnu.org; Sun, 10 May 2020 02:16:23 -0400
Received: from m12-18.163.com ([220.181.12.18]:49196)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jXfG7-0000vn-BL
 for qemu-devel@nongnu.org; Sun, 10 May 2020 02:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=jzP0oPBFmljOzdAK/L
 GrQkQ/bd75PxvARP1LDCL4ymQ=; b=UhmZUPGSiNa2qUZDUYfIEb5gxHz/tV6q7v
 xGtIH9x8lEBRF9jZcN6VDuYgO1FhPEPJHNMhrdarAE8WxO7YqFJ8cWzLwDwpGoI0
 q5CcuEj3yCTjIoJPnwl/V/VeJR9u8Y/3VndGGkUTqq/+PQd8b4mfHJKpWsaB302E
 QkvkFVV40=
Received: from localhost.localdomain (unknown [103.235.247.137])
 by smtp14 (Coremail) with SMTP id EsCowADH7trXm7dehaPQBA--.17000S5;
 Sun, 10 May 2020 14:15:38 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: berrange@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 kwolf@redhat.com, armbru@redhat.com
Subject: [PATCH v3 3/3] qemu-options: updates for abstract unix sockets
Date: Sun, 10 May 2020 14:14:22 +0800
Message-Id: <20200510061422.24841-4-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200510061422.24841-1-zxq_yx_007@163.com>
References: <20200510061422.24841-1-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowADH7trXm7dehaPQBA--.17000S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47Zry8ZrW3tw1DGF48JFb_yoW8AFy8pr
 90gF98t34kJ3WFvrsxJ3W8KryFka1kXFs7G3y3Ww1kt39rW398ta4DKwn8Z34UArZ7WFyS
 vrZYyFy2vF4Yy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5nYrUUUUU=
X-Originating-IP: [103.235.247.137]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEAEgxlUMQ9DEYwAAsa
Received-SPF: pass client-ip=220.181.12.18; envelope-from=zxq_yx_007@163.com;
 helo=m12-18.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 02:16:04
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 xiaoqiang zhao <zxq_yx_007@163.com>, kraxel@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add options documents changes for -chardev

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 qemu-options.hx | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 292d4e7c0c..ce73014f8e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2930,7 +2930,7 @@ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "         [,server][,nowait][,telnet][,websocket][,reconnect=seconds][,mux=on|off]\n"
     "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
     "-chardev socket,id=id,path=path[,server][,nowait][,telnet][,websocket][,reconnect=seconds]\n"
-    "         [,mux=on|off][,logfile=PATH][,logappend=on|off] (unix)\n"
+    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,tight=on|off][,abstract=on|off] (unix)\n"
     "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
     "         [,localport=localport][,ipv4][,ipv6][,mux=on|off]\n"
     "         [,logfile=PATH][,logappend=on|off]\n"
@@ -3097,9 +3097,14 @@ The available backends are:
 
         ``nodelay`` disables the Nagle algorithm.
 
-    ``unix options: path=path``
+    ``unix options: path=path[,tight=on|off][,abstract=on|off]``
         ``path`` specifies the local path of the unix socket. ``path``
         is required.
+	``tight`` whether to set @addrlen to the minimal string length,
+        or the maximum sun_path length. defaults to true. ``tight`` is
+        optional.
+	``abstract`` whether use abstract address. defaults to false.
+	``abstract`` is optional.
 
 ``-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr][,localport=localport][,ipv4][,ipv6]``
     Sends all traffic from the guest to a remote host over UDP.
-- 
2.17.1



