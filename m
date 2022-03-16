Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650344DADFD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 10:58:40 +0100 (CET)
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQQR-0006pj-GJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 05:58:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQKe-0008WK-QO
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:52:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQKd-0007i2-BQ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1ZsewxfCxucBd12dzHEKfdUGMdUKHoJ31HvJ7FLPL4E=;
 b=Kq5JYmVol7T4pPgVZVqVLl+jf35ztEFpvGu+Dyt6aqGobHvWLhMbQuAvu/ddRhmUL5A/k+
 w2kAZ4cIQpgxOR1xrdI9BkAcU29+U0ld6o8X9lONowy7FWfRNlqiJGGHO6cC7Ui/vR1Sp6
 3ceHY+5ScAHEEDM8LSudxadtN15A7Rk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-EcOPtsoeNMmmxM8gcoDlXw-1; Wed, 16 Mar 2022 05:52:35 -0400
X-MC-Unique: EcOPtsoeNMmmxM8gcoDlXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94CB41C05EB0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:52:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 690E040E7F1E;
 Wed, 16 Mar 2022 09:52:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 04/27] meson: add util dependency for oslib-posix on freebsd
Date: Wed, 16 Mar 2022 13:52:31 +0400
Message-Id: <20220316095231.2613560-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

kinfo_getproc() requires it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/util/meson.build b/util/meson.build
index f6ee74ad0c85..bb0b010662d7 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -11,7 +11,11 @@ util_ss.add(when: linux_io_uring, if_true: files('fdmon-io_uring.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('compatfd.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('event_notifier-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('mmap-alloc.c'))
-util_ss.add(when: 'CONFIG_POSIX', if_true: files('oslib-posix.c'))
+freebsd_dep = []
+if targetos == 'freebsd'
+  freebsd_dep = util
+endif
+util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'), freebsd_dep])
 util_ss.add(when: 'CONFIG_POSIX', if_true: [files('qemu-openpty.c'), util])
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('qemu-thread-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('memfd.c'))
-- 
2.35.1.273.ge6ebfd0e8cbb


