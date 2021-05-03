Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0772F37128A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:41:58 +0200 (CEST)
Received: from localhost ([::1]:45114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldU9N-0005bn-1v
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4G-0003GE-2A; Mon, 03 May 2021 04:36:41 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:57753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4D-0000hr-KV; Mon, 03 May 2021 04:36:39 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MnaTt-1lBXJP3umz-00jcwe; Mon, 03
 May 2021 10:36:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/23] accel: kvm: clarify that extra exit data is hexadecimal
Date: Mon,  3 May 2021 10:36:01 +0200
Message-Id: <20210503083623.139700-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k19JPG9/7Vvu6zVm2DiO1/UGS80Nfw8rq7UgJ8HZrt+dKrp/TXV
 dl9Vef0eaictX31ZTa1zeuG/TX5bUkRecbWdrYkXhATgrIkPrDKrGFb30ff/tIvCiMTenOV
 wucQ2dm1huY6ey797gxgRIqzE7sJxsDf9uNPnr4rnnsd+LnuJHzI3/BFenSdZAjVmpjf8SU
 VNe9hgOz1bB2q2iqaqwsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BXo17AdKBVo=:o1MnQEH3qc0VbyHNDpceKK
 rCtPesyvtQ6rivurQSWWryyEY0ZXYDY4vttWQm8vlPQjTliNQjE8SsCKQIek6Q5nYBkWK6dYx
 2gMnn7USUuceUcDFLiQbP6gKjHjglA1pOGAQuROkFHcAJd86ed4VVFPSdSBzo3LwjgEAHzA2E
 Vq6/zvI/D4/2oISKXP+C3rbR+fVxS0O289UrbF0SGVbxm9TDl1jTpalDYOeqgTPKrN8mIZCCx
 fvsrbA4sJSg9lMbn6kbMN5LBbctlju63AwyaAqgKKNxgRSZh8F3MGeuwCG5I177TIhxbw1xmH
 Pen0VYQhjruP6KT0D0zfEMVw+wWZN52om2M4ijqZ44fgc9klJ8C3ykVXyRWGedlPKfXPcC6XR
 /l471+zf5GbR4riLneL4/IRfGLrOr3ciMMmjb0OJ2XN3B8TfmbKKo8nWdqUoa0+IauZSj0T0o
 6kuzqDkY7RXl/it/O0Qpb/7NbPQF2ILUmyz1YDwB1h5tW34iWdQYR2GoWYEPPaEw/DpxSKDnQ
 EjmlJ/XHOTTvIi3XNjtrQU=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, David Edmondson <david.edmondson@oracle.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

When dumping the extra exit data provided by KVM, make it clear that
the data is hexadecimal.

At the same time, zero-pad the output.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210428142431.266879-1-david.edmondson@oracle.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 accel/kvm/kvm-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b6d9f92f1513..93d7cbfeaf88 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2269,7 +2269,7 @@ static int kvm_handle_internal_error(CPUState *cpu, struct kvm_run *run)
         int i;
 
         for (i = 0; i < run->internal.ndata; ++i) {
-            fprintf(stderr, "extra data[%d]: %"PRIx64"\n",
+            fprintf(stderr, "extra data[%d]: 0x%016"PRIx64"\n",
                     i, (uint64_t)run->internal.data[i]);
         }
     }
-- 
2.31.1


