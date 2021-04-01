Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A132435150D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:19:31 +0200 (CEST)
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxEQ-0000qP-Lp
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7z-0002C7-NI
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7y-0004XU-3Y
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKRgCZ0hN4oSs5R4TqPfn8an0S3SsO5Z6jIfmsmET28=;
 b=QNV3nE5qFLyuMy5Locy3kVVwAAHZ5W/3JjsRWgpFoor/A4Vk0GjTSnRgYeEziaD4T1oUBs
 gqX7/2TE7OT6q+526jHxIoluY5reBvUIRgZ0PCKlEaLnVEFLAp9YAcyvYWahqUPA7nENGk
 YOn+lsJFSzIt7GBGHn+zlUgL/Xa4F5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-ZEa_MJy5MamXSXfzyHZ_vw-1; Thu, 01 Apr 2021 09:12:45 -0400
X-MC-Unique: ZEa_MJy5MamXSXfzyHZ_vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AC0E10C40C0;
 Thu,  1 Apr 2021 13:12:44 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8928F1378E;
 Thu,  1 Apr 2021 13:12:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/13] util/compatfd.c: Fixed style issues
Date: Thu,  1 Apr 2021 15:12:17 +0200
Message-Id: <20210401131220.3252320-11-thuth@redhat.com>
In-Reply-To: <20210401131220.3252320-1-thuth@redhat.com>
References: <20210401131220.3252320-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Fixed two styling issues that caused checkpatch.pl errors.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210315105814.5188-2-ma.mandourr@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 util/compatfd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/compatfd.c b/util/compatfd.c
index ee47dd8089..174f394533 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -20,8 +20,7 @@
 #include <sys/syscall.h>
 #endif
 
-struct sigfd_compat_info
-{
+struct sigfd_compat_info {
     sigset_t mask;
     int fd;
 };
@@ -53,8 +52,9 @@ static void *sigwait_compat(void *opaque)
 
                 len = write(info->fd, (char *)&buffer + offset,
                             sizeof(buffer) - offset);
-                if (len == -1 && errno == EINTR)
+                if (len == -1 && errno == EINTR) {
                     continue;
+                }
 
                 if (len <= 0) {
                     return NULL;
-- 
2.27.0


