Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8327C350F7B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 08:55:19 +0200 (CEST)
Received: from localhost ([::1]:47526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRrEc-0002ZQ-2z
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 02:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRrDK-0001iV-9r
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 02:53:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRrDH-0007r2-JZ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 02:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617260033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oJHy8E9tt/D+9SgDYnsrx+OAdBPTYbMxqPRTYOx+zq4=;
 b=bkpJ74Dh/lCm95GyAHIqul1vDvvWpAwXWh9Nt2t9LnjvKRGZo9SqpGeWIKslkfVUY/wHE5
 mWmC1GstPZcGqyoyK3IrnXh8rjx1nbrP2r+cg7hZuEtc2IF3AEmft4TUg5yZqX6f+CtvIZ
 9uzI5ojYXhaM+zSWxSpM3O37WX1WXlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-qY124g_wNmmKOm36ZmSiWQ-1; Thu, 01 Apr 2021 02:53:49 -0400
X-MC-Unique: qY124g_wNmmKOm36ZmSiWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05DBD190B2A0;
 Thu,  1 Apr 2021 06:53:48 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78A8C19C44;
 Thu,  1 Apr 2021 06:53:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Xiang Zheng <zhengxiang9@huawei.com>
Subject: [PATCH] MAINTAINERS: Drop the line with Xiang Zheng
Date: Thu,  1 Apr 2021 08:53:43 +0200
Message-Id: <20210401065343.3197791-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: yubihong@huawei.com, alex.chen@huawei.com,
 Dongjiu Geng <gengdongjiu1@gmail.com>, zhang.zhanghailiang@huawei.com,
 xiexiangyou@huawei.com, zhengchuan@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When sending a mail with CC: to zhengxiang9@huawei.com I got a mail
back saying:

 Your message couldn't be delivered

 The message you sent to zhengxiang9@huawei.com couldn't be delivered due to:
 Recipient email address is possibly incorrect.

 Further information

 5.1.1 <zhengxiang9@huawei.com>: Recipient address rejected: Failed recipient
 validation check.: host 127.0.0.1[127.0.0.1] said: 554 5.7.1 recipient verify
 from ldap failed (in reply to RCPT TO command)

Looks like this address does not exist anymore, thus drop it from the
MAINTAINERS file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a45b836c2..d73a92c992 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1726,7 +1726,6 @@ F: tests/data/acpi/
 
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
-R: Xiang Zheng <zhengxiang9@huawei.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/acpi/ghes.c
-- 
2.27.0


