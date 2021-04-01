Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E9351502
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:14:22 +0200 (CEST)
Received: from localhost ([::1]:41268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRx9R-0003Q7-6h
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7n-0001pj-7g
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7l-0004Pr-Jo
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjbkdQ+/B2DS8pxinviXpTRfd4g0obj6QWiiNLdPXDk=;
 b=U6vUEdi94kPTyC/si61OnA0pr0JKz1fgWl4dJMk7Uh5yl+paD/owWBviETMC1zzSasajyw
 GPoR4+tioZNM66R9dB19VLVddmmbGnEnfR8JtNHyy/O+yfYSBrGxt31VP4qk13dW68gI4V
 5MulbbHt/df7/DwfWdeKMc7efZBvj5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-PbE0dqryNzuekknQEfYSOQ-1; Thu, 01 Apr 2021 09:12:34 -0400
X-MC-Unique: PbE0dqryNzuekknQEfYSOQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A34BE83DD52;
 Thu,  1 Apr 2021 13:12:33 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97E801378E;
 Thu,  1 Apr 2021 13:12:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/13] MAINTAINERS: replace Huawei's email to personal one
Date: Thu,  1 Apr 2021 15:12:11 +0200
Message-Id: <20210401131220.3252320-5-thuth@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: Dongjiu Geng <gengdongjiu1@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dongjiu Geng <gengdongjiu1@gmail.com>

In order to conveniently receive email, replace the Huawei
email address with my personal one.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Message-Id: <1615462144-10864-1-git-send-email-gengdongjiu1@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0abe6182e5..4dab272320 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1725,7 +1725,7 @@ F: tests/qtest/acpi-utils.[hc]
 F: tests/data/acpi/
 
 ACPI/HEST/GHES
-R: Dongjiu Geng <gengdongjiu@huawei.com>
+R: Dongjiu Geng <gengdongjiu1@gmail.com>
 R: Xiang Zheng <zhengxiang9@huawei.com>
 L: qemu-arm@nongnu.org
 S: Maintained
-- 
2.27.0


