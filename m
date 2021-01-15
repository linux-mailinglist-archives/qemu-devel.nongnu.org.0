Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3D2F701A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:43:47 +0100 (CET)
Received: from localhost ([::1]:54130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0E9S-0005B5-7D
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1l0E6b-0003Dg-Gi; Thu, 14 Jan 2021 20:40:49 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1l0E6X-0006RV-IO; Thu, 14 Jan 2021 20:40:49 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DH3ky5CYyzj7wm;
 Fri, 15 Jan 2021 09:39:38 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 15 Jan 2021
 09:40:31 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <kraxel@redhat.com>
Subject: [PATCH v2 4/7] audio: Fix lines over 90 characters
Date: Fri, 15 Jan 2021 09:24:28 +0800
Message-ID: <20210115012431.79533-5-zhanghan64@huawei.com>
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

Fix the line width of code.

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 audio/dsoundaudio.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 38ae2471f6..1891a38bee 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -89,7 +89,9 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_ALLOCATED
     case DSERR_ALLOCATED:
-        str = "The request failed because resources, such as a priority level, were already in use by another caller";
+        str = "The request failed because resources, "
+              "such as a priority level, were already in use "
+              "by another caller";
         break;
 #endif
 #ifdef DSERR_ALREADYINITIALIZED
@@ -104,7 +106,8 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_BADSENDBUFFERGUID
     case DSERR_BADSENDBUFFERGUID:
-        str = "The GUID specified in an audiopath file does not match a valid mix-in buffer";
+        str = "The GUID specified in an audiopath file "
+              "does not match a valid mix-in buffer";
         break;
 #endif
 #ifdef DSERR_BUFFERLOST
@@ -114,22 +117,31 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_BUFFERTOOSMALL
     case DSERR_BUFFERTOOSMALL:
-        str = "The buffer size is not great enough to enable effects processing";
+        str = "The buffer size is not great enough to "
+              "enable effects processing";
         break;
 #endif
 #ifdef DSERR_CONTROLUNAVAIL
     case DSERR_CONTROLUNAVAIL:
-        str = "The buffer control (volume, pan, and so on) requested by the caller is not available. Controls must be specified when the buffer is created, using the dwFlags member of DSBUFFERDESC";
+        str = "The buffer control (volume, pan, and so on) "
+              "requested by the caller is not available. "
+              "Controls must be specified when the buffer is created, "
+              "using the dwFlags member of DSBUFFERDESC";
         break;
 #endif
 #ifdef DSERR_DS8_REQUIRED
     case DSERR_DS8_REQUIRED:
-        str = "A DirectSound object of class CLSID_DirectSound8 or later is required for the requested functionality. For more information, see IDirectSound8 Interface";
+        str = "A DirectSound object of class CLSID_DirectSound8 or later "
+              "is required for the requested functionality. "
+              "For more information, see IDirectSound8 Interface";
         break;
 #endif
 #ifdef DSERR_FXUNAVAILABLE
     case DSERR_FXUNAVAILABLE:
-        str = "The effects requested could not be found on the system, or they are in the wrong order or in the wrong location; for example, an effect expected in hardware was found in software";
+        str = "The effects requested could not be found on the system, "
+              "or they are in the wrong order or in the wrong location; "
+              "for example, an effect expected in hardware "
+              "was found in software";
         break;
 #endif
 #ifdef DSERR_GENERIC
@@ -154,7 +166,8 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_NODRIVER
     case DSERR_NODRIVER:
-        str = "No sound driver is available for use, or the given GUID is not a valid DirectSound device ID";
+        str = "No sound driver is available for use, "
+              "or the given GUID is not a valid DirectSound device ID";
         break;
 #endif
 #ifdef DSERR_NOINTERFACE
@@ -169,12 +182,14 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_OTHERAPPHASPRIO
     case DSERR_OTHERAPPHASPRIO:
-        str = "Another application has a higher priority level, preventing this call from succeeding";
+        str = "Another application has a higher priority level, "
+              "preventing this call from succeeding";
         break;
 #endif
 #ifdef DSERR_OUTOFMEMORY
     case DSERR_OUTOFMEMORY:
-        str = "The DirectSound subsystem could not allocate sufficient memory to complete the caller's request";
+        str = "The DirectSound subsystem could not allocate "
+               "sufficient memory to complete the caller's request";
         break;
 #endif
 #ifdef DSERR_PRIOLEVELNEEDED
@@ -189,7 +204,9 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_UNINITIALIZED
     case DSERR_UNINITIALIZED:
-        str = "The Initialize method has not been called or has not been called successfully before other methods were called";
+        str = "The Initialize method has not been called "
+              "or has not been called successfully "
+              "before other methods were called";
         break;
 #endif
 #ifdef DSERR_UNSUPPORTED
-- 
2.29.1.59.gf9b6481aed


