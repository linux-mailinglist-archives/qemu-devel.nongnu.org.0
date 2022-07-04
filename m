Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E78564F56
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:10:02 +0200 (CEST)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8H9d-00022u-PN
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzw-0002IZ-3t
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:00:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzu-0007fW-L1
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656921597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewcJYKM5Fj+KWKp7jngHLW2pOaNxIRxCy6xMfuDFrjg=;
 b=NKvBQtN29dmF+oSRlFaL2eMGRskixOudcZtgQlR4ocOSqTmgblgaov1sDYetcrN27E3yRr
 SkJv4hjrpH2+ftnOW8I5T4cQqEt4xfnwYX2rGJZ3sh1EojsKbsjiRrngfUIR/WkJfqhHhY
 kjeeb4AKMeOBB2VEqm0H1IC9Ll+gxg0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-pzURgfQcPwaMfL5aHqqJng-1; Mon, 04 Jul 2022 03:59:53 -0400
X-MC-Unique: pzURgfQcPwaMfL5aHqqJng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F5A81C18263;
 Mon,  4 Jul 2022 07:59:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B7282166B29;
 Mon,  4 Jul 2022 07:59:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E650218007A5; Mon,  4 Jul 2022 09:59:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Canokeys.org" <contact@canokeys.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>
Subject: [PULL 7/8] docs/system/devices/usb/canokey: remove limitations on
 qemu-xhci
Date: Mon,  4 Jul 2022 09:59:45 +0200
Message-Id: <20220704075946.921883-8-kraxel@redhat.com>
In-Reply-To: <20220704075946.921883-1-kraxel@redhat.com>
References: <20220704075946.921883-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YqcqeIpY4h7ZQPWH@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/system/devices/canokey.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
index 169f99b8eb82..c2c58ae3e7cb 100644
--- a/docs/system/devices/canokey.rst
+++ b/docs/system/devices/canokey.rst
@@ -146,16 +146,6 @@ multiple CanoKey QEMU running, namely you can not
 Also, there is no lock on canokey-file, thus two CanoKey QEMU instance
 can not read one canokey-file at the same time.
 
-Another limitation is that this device is not compatible with ``qemu-xhci``,
-in that this device would hang when there are FIDO2 packets (traffic on
-interrupt endpoints). If you do not use FIDO2 then it works as intended,
-but for full functionality you should use old uhci/ehci bus and attach canokey
-to it, for example
-
-.. parsed-literal::
-
-   |qemu_system| -device piix3-usb-uhci,id=uhci -device canokey,bus=uhci.0
-
 References
 ==========
 
-- 
2.36.1


