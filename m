Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B774207B3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:59:58 +0200 (CEST)
Received: from localhost ([::1]:54506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJpF-00050Z-0P
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNL-0000kj-Ob; Mon, 04 Oct 2021 04:31:07 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:38759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNG-0003Nd-At; Mon, 04 Oct 2021 04:31:07 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MJnnV-1mDqY43stt-00K5xC; Mon, 04
 Oct 2021 10:30:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] qemu-options: -chardev reconnect=seconds duplicated in
 help, tidy up
Date: Mon,  4 Oct 2021 10:30:51 +0200
Message-Id: <20211004083055.3288583-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004083055.3288583-1-laurent@vivier.eu>
References: <20211004083055.3288583-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NSwFYyndxpo26bv4xZYDLbAPPU6t3+ozi2a00x5tWkWhFwsi+bV
 ufaZVujMHh/vI+WzPcCr0tV3+s7dfsr35f25WXY8DFzeT7HoHbjmYNopSe3pYiW/zO1Qf96
 Bqd9oVCn/SNBSe287weWlLuRZ7naaU25d21qXOTdGIrKAE89Yj4j6MZzI13XGTMqd+k02zD
 b7B1SfszRVrfuZjN9Pfvg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zyDxUT+i+FE=:6/F23uucpGlWCpninbGW32
 1CH0QRgl4MAjkoVqQPfbMj8/fL2x0iYqofoe2MCSxoQ2Zyr5pFV3Giai/42/6BCr0oCt8sHFh
 XLLPeClIZQ7V7q6o0NFyOpNPkpeqK5D1EgMLSBEYMkSpsv3CH6tzggdHuLtmVrrSXC+DK6//q
 r27YprjsDYUKie5WgiUPzCfNfKgvOatZ7nknuRU+zRQxqRt5igrBFUOl2faX7uedKDFzkd8Ln
 eR5u6iWkuhtt56cPDK77/cBzlGWoMATjg54uPM2onk/tZq8Xi7nwMyMahEEfKqf6GQnXSrdo6
 Gtppx4zvP3EdUYrDy2VwSTJ18EBKdQ5QKHjvescZdoVRuYHO2lnI5BYzbfIQaoocStOzHAtlW
 CepfOPws3lM3PMb1w3G0+lnUVPj3ivAUWwhJY+jeSffu6CcaKNSmrfNUEqC3ylT+9HAynjv8m
 UwJ39bFHj9CttnfgbX9Yw/5gnResfg2JKYXx3ArWdpipuhUSsrlyku0V0HCina6BZZesOL7+w
 hl/l6LMEfZIChGC9Vlvpv06JcneMn6gpdmrAcd0+tiI7eTnp1tC09Q8XlerYHpjJf4ugXKVdv
 oKUubtjzhz0rR3V1/F6cxu12nM9jjm5W2Ekc+2R+MZv3UotbGyxHpaDez5iJkIUXrg5plXWI4
 Onnwc6SYqAyjJYrDELZ4WvtGlhyJhwc+h2GUq/4gzZ9JOPnkpGDjIBe+pmykKhMpbkRIUt0MV
 rbztc6XyakNHihoIqbCZTiEai2tofFHIuTGGwQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Fixes: 5dd1f02b4bc2f2c2ef3a2adfd8a412c8c8769085
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210928071449.1416022-1-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8ef178180db6..4f2dc91e0b27 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3202,7 +3202,7 @@ DEFHEADING(Character device options:)
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev help\n"
     "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
-    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off][,reconnect=seconds]\n"
+    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off]\n"
     "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
     "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
     "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
-- 
2.31.1


