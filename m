Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5721351501
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:14:18 +0200 (CEST)
Received: from localhost ([::1]:40906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRx9N-0003H1-OV
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7h-0001k8-8f
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7f-0004MV-Lx
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lFIvyaO+OrPEtD1EeBWJfOzbcWcU5D8oR0F/NILTNF4=;
 b=N7kQ6TTuNo+Dc/glVcWynOeG8mec9bXMK8/ChJaHHy9iC+esHXxM+VB7ui2uA7GGsukNcA
 uOIV4AfWqaMzqSq9MHt8Devc7Wi8Ytvbl11fjmz5L4/wA4KLHt0orM5THDAp02z7tCMlg0
 9ennYhWqROfZEdf6aWY82eied2b01Xg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-MeEG-kJGNZqDLNh9ihEvFA-1; Thu, 01 Apr 2021 09:12:29 -0400
X-MC-Unique: MeEG-kJGNZqDLNh9ihEvFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2893D81658;
 Thu,  1 Apr 2021 13:12:28 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 902B31378E;
 Thu,  1 Apr 2021 13:12:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/13] MAINTAINERS: Fix tests/migration maintainers
Date: Thu,  1 Apr 2021 15:12:08 +0200
Message-Id: <20210401131220.3252320-2-thuth@redhat.com>
In-Reply-To: <20210401131220.3252320-1-thuth@redhat.com>
References: <20210401131220.3252320-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?=
 <huangy81@chinatelecom.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

when executing the following scripts, it throw error message:
$ ./scripts/get_maintainer.pl -f tests/migration/guestperf.py
get_maintainer.pl: No maintainers found, printing recent contributors.
get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.

add the tests/migration to the "Migration" section of MAINTAINERS

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <91d5978357fb8709ef61d2030984f7142847037d.1616141556.git.huangy81@chinatelecom.cn>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 554be84b32..670132f7fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2727,6 +2727,7 @@ F: tests/vmstate-static-checker-data/
 F: tests/qtest/migration-test.c
 F: docs/devel/migration.rst
 F: qapi/migration.json
+F: tests/migration/
 
 D-Bus
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
-- 
2.27.0


