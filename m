Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8C42F5C7C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 09:34:41 +0100 (CET)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzy5Y-0002Ex-76
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 03:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1kzxyN-0004PY-Ds; Thu, 14 Jan 2021 03:27:15 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1kzxyI-0006bs-Ka; Thu, 14 Jan 2021 03:27:15 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DGcpb1PQGzj6R0;
 Thu, 14 Jan 2021 16:26:15 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Thu, 14 Jan 2021
 16:26:56 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <kraxel@redhat.com>
Subject: [PATCH 3/6] audio: foo* bar" should be "foo *bar".
Date: Thu, 14 Jan 2021 16:10:56 +0800
Message-ID: <20210114081059.19632-4-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20210114081059.19632-1-zhanghan64@huawei.com>
References: <20210114081059.19632-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhanghan64@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Transfer "foo* " to "foo *"

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 audio/coreaudio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 6ca0d79c1f..b7c02e0e51 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -421,12 +421,12 @@ COREAUDIO_WRAPPER_FUNC(write, size_t, (HWVoiceOut *hw, void *buf, size_t size),
 /* callback to feed audiooutput buffer */
 static OSStatus audioDeviceIOProc(
     AudioDeviceID inDevice,
-    const AudioTimeStamp* inNow,
-    const AudioBufferList* inInputData,
-    const AudioTimeStamp* inInputTime,
-    AudioBufferList* outOutputData,
-    const AudioTimeStamp* inOutputTime,
-    void* hwptr)
+    const AudioTimeStamp *inNow,
+    const AudioBufferList *inInputData,
+    const AudioTimeStamp *inInputTime,
+    AudioBufferList *outOutputData,
+    const AudioTimeStamp *inOutputTime,
+    void *hwptr)
 {
     UInt32 frameCount, pending_frames;
     void *out = outOutputData->mBuffers[0].mData;
-- 
2.29.1.59.gf9b6481aed


