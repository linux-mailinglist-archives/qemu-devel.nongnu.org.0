Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A2C42080E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:14:59 +0200 (CEST)
Received: from localhost ([::1]:58012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXK3k-0001ss-SO
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNL-0000kz-Qd; Mon, 04 Oct 2021 04:31:07 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:51613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNJ-0003PL-Rc; Mon, 04 Oct 2021 04:31:07 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MidPj-1n2mRf24Ix-00fjqG; Mon, 04
 Oct 2021 10:31:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] target/sh4: Use lookup_symbol in sh4_tr_disas_log
Date: Mon,  4 Oct 2021 10:30:54 +0200
Message-Id: <20211004083055.3288583-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004083055.3288583-1-laurent@vivier.eu>
References: <20211004083055.3288583-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4uI2WHJk9zyqMIbJrZ9W7KItDwGSsCuYd+MssQ7tlhIWre6M5AV
 FxGokRYjXOUJN8IkIp/ubMvF/qTtcyH/HkcNauBoLSpAXR6VpCB5WmVQykDawu1Cg+amK6B
 gEAWYIN3nbtZ3A3bcj2vurkcag/6lI9ZEed6IgWQW6YXI3ALbAd5q/dPLpfdeSTlIEfDgyU
 OSBI6P/blIaN8IyAX/Lew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wJoxhJ4bvkU=:NxIgQnvRuxUVZq94gkj/3R
 1s0uyMuwgdup0L2dl7CuE3UQZeKvfNkF4r9Srp4zkrd/uDPpweRuF5ctzZjHjMCUyn/wDVRw2
 RNZI6Ad+XAa9uB+6fUYfttfe79WmG6014RCGThZ57vMsSXn6M0YSGM0gy9CMxBhgM9ykc7dRE
 5cnwRCcDnU+RJnrZNWZFcMKGI78CaTDKoolChrGGDxFN4kghT6F1/CbceCjMUr5o4U9HjP4pU
 4QnOiSnbUtqRn9xhnLH9eN+eb5WKMvpWJeS/2I8fIupFIeeFwMZjquIUdKmQlfs11saBngvXD
 aSarjtRPKEd/clzYyvvnR8YX+DqukgEFlA0R0J6ycEILRPDk+84dplcqHDeFcS5HCXi823a3B
 jO/smKItspJpnke5d4gi+iZ60HNErc430HTqIGhrcxvD+FPvlJfrRNNrYhTNF+7L6dVDH5CEs
 m0CaoqZxKPN/naxkzgmhWpG4FnwkoujZ8nHvHJr2VBryAQp3UoWvqqIkRErwFznHufEUfJl1q
 tUOy1mVAumCFmhle67kFGDncoeCmTHA+lIPQdhEAPz0ThaNCjaDqvuiwK8hnCx/rB1wZ/4Hpb
 UV5o9I4ULsYph5R7F8jxdkrPJFaiQkTd1Vp2SFSnUMgKFSHlZ52F1YOPj0/YB9Stoc/pqxtpu
 nCsEUipIo3qQZvT5UZtU/5OmsqeseTvqkK9xjvdE/Z5gIFxqhkFChIH8Tg4GJUgeasLEuF9BB
 3+UI03p46bDeaJjuKobxGoJcP6WzfuOmQHP4Vw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The correct thing to do has been present but commented
out since the initial commit of the sh4 translator.

Fixes: fdf9b3e831e
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210929130316.121330-1-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/sh4/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index cf5fe9243d6c..d36305027240 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2344,7 +2344,7 @@ static void sh4_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 
 static void sh4_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
 {
-    qemu_log("IN:\n");  /* , lookup_symbol(dcbase->pc_first)); */
+    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
     log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
 }
 
-- 
2.31.1


