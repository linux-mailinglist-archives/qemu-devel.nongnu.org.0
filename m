Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA36351507
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:17:36 +0200 (CEST)
Received: from localhost ([::1]:48804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxCZ-0006cI-I6
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7p-0001t5-KX
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7n-0004RC-KD
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rA/o/XKTsvHS3blLtpoZ9zaGS3NupSLgOTyIppc67I0=;
 b=deQ0Cxu4/tAgqXPmOkSq1iOuWTnjVCBt7qsYqHkAyS6UPLHVsM3juVxRXuSxRWiW+pJpEt
 gQubU4owOfA7ih5do23ptC/BJTisuzVXmk7zxXpzNEscv0IqWb8QphJYDVdWyXDwB+sl2+
 AUUiBjFdbGSYLI0LgKhN3YTHt4EIadY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-mPw_Hmk0Oz619YpBQ7Y3Cg-1; Thu, 01 Apr 2021 09:12:36 -0400
X-MC-Unique: mPw_Hmk0Oz619YpBQ7Y3Cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CC6B107BEF5;
 Thu,  1 Apr 2021 13:12:35 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 103F31378E;
 Thu,  1 Apr 2021 13:12:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/13] MAINTAINERS: Drop the line with Xiang Zheng
Date: Thu,  1 Apr 2021 15:12:12 +0200
Message-Id: <20210401131220.3252320-6-thuth@redhat.com>
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

Message-Id: <20210401065343.3197791-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4dab272320..f237ea313d 100644
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


