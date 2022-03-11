Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327044D5ABD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 06:46:08 +0100 (CET)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSY6J-0003Ua-8Q
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 00:46:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nSY0V-0005n4-HE
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 00:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nSY0U-0003UX-1v
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 00:40:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646977205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJUNnFsQxzYHudrEaXM1TJHbY6T0G2wGDqBjzLP64Xo=;
 b=TaMO+9sMTVgGEBsqSVDSo8Ont2/obzHihLXKLsJgzqraPqw57etuc5OvlGjL3nR9Qn2Rkp
 JwlQQpVUF+BgJlS/gCmuP/CFj0Wd3xdWUlB+j+taD0lG/CxWgemji3T2bNfalCaVPM3RT3
 oZV1FpzsSf9E52XjYb3h/lhc+AHOVdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-0Xk7efX4OHmkqOZhYY30fA-1; Fri, 11 Mar 2022 00:40:02 -0500
X-MC-Unique: 0Xk7efX4OHmkqOZhYY30fA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2032B824FA6;
 Fri, 11 Mar 2022 05:40:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB593646C6;
 Fri, 11 Mar 2022 05:40:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 04A8B180079E; Fri, 11 Mar 2022 06:38:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/11] edk2/docker: install python3
Date: Fri, 11 Mar 2022 06:37:57 +0100
Message-Id: <20220311053759.875785-10-kraxel@redhat.com>
In-Reply-To: <20220311053759.875785-1-kraxel@redhat.com>
References: <20220311053759.875785-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

python2 is not supported any more,
so go install python3 instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/edk2/Dockerfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/edk2/Dockerfile b/.gitlab-ci.d/edk2/Dockerfile
index 13029310f6d6..7484b3846d71 100644
--- a/.gitlab-ci.d/edk2/Dockerfile
+++ b/.gitlab-ci.d/edk2/Dockerfile
@@ -20,7 +20,7 @@ RUN apt update \
         iasl \
         make \
         nasm \
-        python \
+        python3 \
         uuid-dev \
     && \
     \
-- 
2.35.1


