Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F214191EB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:00:11 +0200 (CEST)
Received: from localhost ([::1]:37382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnQg-0005FQ-JM
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJs-0005PF-0G; Mon, 27 Sep 2021 05:53:08 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJo-0004JE-T1; Mon, 27 Sep 2021 05:53:07 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M8QNs-1mQNSq4BOq-004WrK; Mon, 27
 Sep 2021 11:52:57 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] hmp: Unbreak "change vnc"
Date: Mon, 27 Sep 2021 11:52:50 +0200
Message-Id: <20210927095252.2374148-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927095252.2374148-1-laurent@vivier.eu>
References: <20210927095252.2374148-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WQdunHgrRwhppeaDZE8VrWF5M+DuoKjqcv6wMQ0AGIakeY66KMK
 siGHES0mBC9rVzvGC/NJFXVfBqlGVUZ84MM1X5kLD8ciH/pqU0G2u0HghVpfdhfrxDcekji
 rD8/21/wU8Mq1U9aPtTKuJEeKqEraHf8eLgonb2TAAR6vytH3Te+qGDt+D7Xn6Y9BzA/Xol
 B9s5YUrx3+tLr418LVqig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1nuZL+1EACI=:hSxNSYER5I7JpZXIxjn1aN
 8HCLXB0TfclqrsB/E0N963ZjtQEh0I1X8vzLyy63a7ZUXXXraemSlqjML+IJsCUATBf0gehPP
 EzIHvPIghOFB1xmFEVSN1vV2mjHROKeY5X9ShiiUMLHSC0OBWovDiiAAG9GLnG2RyxXSr2amx
 f/TpIu7kM+XxPOSFDV7nrsMIO5d4zEM9P7h03H/TPvjRtMq8ZnpLq7gJRXe4nkaop9pTvaicY
 Uuh9ytahx0QNNf1+zH+OolEQBm4M3TR6gUgXoFB+2vJqlfazL9YT/KqrjfCu8PfjhMJJ3wHIx
 f3lshB6zskiS0lOnMrRagoQdDzIWr25T+YPlVFB2TWSaW41/yLrM3M7Y4UNB8Tfidohoxgldv
 FbkPdCb1frQjKhrSW7JYHYaH7OfORLBZnafMOCP2T7lVOWLUIK5DvtzwclZW2ABEifM2GKn2T
 7c0f3s1kZzW3aunukn3ksYxT5IhdvFTMQVFVG7CMuvhkYF0A9+wHZMQ8e+9aUJ+DpSDMRTeKJ
 MiPEqytSAQgNxOClcE6T2wbRl35QZrVmst3mveb7ZmIN16pkCuhm8OFDH6jnPyT66E5mT9OaI
 Y2+w67a65QwUOkyNzXCcg1shpNnFDSBDXCcRpwcgZpxYwu2eUdCw+1ZAsgbMTIlddg1X2eiKe
 DVIQhMKvP2Qebk2tP0L1h1lTfFCWwGYd0iR1uI1DB/UCwP5ZI9iOzSshGR7vI3JTs/XIJJVCD
 cUc0avPjG5zcrKdk2JYqVufOR2xt2i21gNGRuA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-stable@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

HMP command "change vnc" can take the password as argument, or prompt
for it:

    (qemu) change vnc password 123
    (qemu) change vnc password
    Password: ***
    (qemu)

This regressed in commit cfb5387a1d "hmp: remove "change vnc TARGET"
command", v6.0.0.

    (qemu) change vnc passwd 123
    Password: ***
    (qemu) change vnc passwd
    (qemu)

The latter passes NULL to qmp_change_vnc_password(), which is a no-no.
Looks like it puts the display into "password required, but none set"
state.

The logic error is easy to miss in review, but testing should've
caught it.

Fix the obvious way.

Fixes: cfb5387a1de2acda23fb5c97d2378b9e7ddf8025
Cc: qemu-stable@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210909081219.308065-2-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 monitor/hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e00255f7ee70..a7e197a90bf7 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1496,7 +1496,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
         }
         if (strcmp(target, "passwd") == 0 ||
             strcmp(target, "password") == 0) {
-            if (arg) {
+            if (!arg) {
                 MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
                 monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
                 return;
-- 
2.31.1


