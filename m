Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4622F7018
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:42:54 +0100 (CET)
Received: from localhost ([::1]:52562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0E8b-0004Ww-VI
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1l0E6X-00038Q-As; Thu, 14 Jan 2021 20:40:45 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1l0E6V-0006Mq-51; Thu, 14 Jan 2021 20:40:45 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DH3kX47krzMKbR;
 Fri, 15 Jan 2021 09:39:16 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 15 Jan 2021
 09:40:30 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <kraxel@redhat.com>
Subject: [PATCH v2 2/7] audio: Add spaces around operator/delete redundant
 spaces
Date: Fri, 15 Jan 2021 09:24:26 +0800
Message-ID: <20210115012431.79533-3-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20210115012431.79533-1-zhanghan64@huawei.com>
References: <20210115012431.79533-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhanghan64@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, alex.chen@huawei.com,
 zhanghan64@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix problems about spaces:
-operator needs spaces around it, add them.
-somespaces are redundant, remove them.

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 audio/audio_template.h | 2 +-
 audio/coreaudio.c      | 2 +-
 audio/dsoundaudio.c    | 2 +-
 audio/jackaudio.c      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index 236db7136b..6d42fa7011 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -208,7 +208,7 @@ static void glue (audio_pcm_hw_gc_, TYPE) (HW **hwp)
         QLIST_REMOVE (hw, entries);
         glue (hw->pcm_ops->fini_, TYPE) (hw);
         glue (s->nb_hw_voices_, TYPE) += 1;
-        glue (audio_pcm_hw_free_resources_ ,TYPE) (hw);
+        glue (audio_pcm_hw_free_resources_ , TYPE) (hw);
         g_free (hw);
         *hwp = NULL;
     }
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 408b587126..6ca0d79c1f 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -270,7 +270,7 @@ static void coreaudio_logstatus (OSStatus status)
 {
     const char *str = "BUG";
 
-    switch(status) {
+    switch (status) {
     case kAudioHardwareNoError:
         str = "kAudioHardwareNoError";
         break;
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index ba201898e1..38ae2471f6 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -133,7 +133,7 @@ static void dsound_log_hresult (HRESULT hr)
         break;
 #endif
 #ifdef DSERR_GENERIC
-    case DSERR_GENERIC :
+    case DSERR_GENERIC:
         str = "An undetermined error occurred inside the DirectSound subsystem";
         break;
 #endif
diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 3b7c18443d..821d4060c0 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -277,7 +277,7 @@ static int qjack_process(jack_nframes_t nframes, void *arg)
         if (likely(c->enabled)) {
             qjack_buffer_read_l(&c->fifo, buffers, nframes);
         } else {
-            for(int i = 0; i < c->nchannels; ++i) {
+            for (int i = 0; i < c->nchannels; ++i) {
                 memset(buffers[i], 0, nframes * sizeof(float));
             }
         }
-- 
2.29.1.59.gf9b6481aed


