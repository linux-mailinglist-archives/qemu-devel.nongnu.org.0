Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F4393B90
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:47:15 +0200 (CEST)
Received: from localhost ([::1]:42864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSWo-00049f-K3
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKR-0003LK-5X
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKO-0000JH-P3
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lx+BzRHkg0849WZRXBQmDvIaAP2oJo6bOn5YqeMib2s=;
 b=IiNSsIbbweirw7i4ixj6L7H3J4vun7dWqX5hgbAiRab/LXsJKy7nOTgNwyZI1NnE4kfwL5
 AWNj4wZS17s6SgkFRBdcDewl81paeW/xBS0n5FMXxNtum3MroSyd0ro5dF5UH868fHtspf
 d5d/oQhSdwaN/MHd3wHN0Kh1+O/Hvpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-fGZHXOs5N0qWRao3dfwWRw-1; Thu, 27 May 2021 22:34:20 -0400
X-MC-Unique: fGZHXOs5N0qWRao3dfwWRw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A83B8180FD65;
 Fri, 28 May 2021 02:34:18 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62C6E1F0C0;
 Fri, 28 May 2021 02:34:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/44] python/machine: Trim line length to below 80 chars
Date: Thu, 27 May 2021 22:31:56 -0400
Message-Id: <20210528023220.417057-21-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One more little delinting fix that snuck in.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210527211715.394144-8-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 5d72c4ca369..a8837b36e47 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -97,7 +97,7 @@ def __init__(self,
         @param args: list of extra arguments
         @param wrapper: list of arguments used as prefix to qemu binary
         @param name: prefix for socket and log file names (default: qemu-PID)
-        @param base_temp_dir: default location where temporary files are created
+        @param base_temp_dir: default location where temp files are created
         @param monitor_address: address for QMP monitor
         @param socket_scm_helper: helper program, required for send_fd_scm()
         @param sock_dir: where to create socket (defaults to base_temp_dir)
-- 
2.31.1


