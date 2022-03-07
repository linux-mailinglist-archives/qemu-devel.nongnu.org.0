Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54774D0BDA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:15:45 +0100 (CET)
Received: from localhost ([::1]:52022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMZs-0007vL-Np
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:15:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7K-00084w-9v
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7I-0005hb-NS
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRo1oLzj8z655SYF1zAVR80J4AJJ+nuqJ/mStJU6s7s=;
 b=FlWJlNM3j1esPxuWXtzc9nGvwDHaNZXXANDxf55VMkmfogF4AxGBH/sv/6uH/wt8y586uM
 nybd9gJMY2ZoG890fkFGMae3K1cEH1V89SZ1vl3nkisDzsQFAFBFdEprm3c26RETZDfNiM
 RI0/jOUqh/gKucNiRL2xkd7DnkqbPdo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-n7zspMA4O22ab9PAqdiS5Q-1; Mon, 07 Mar 2022 17:46:11 -0500
X-MC-Unique: n7zspMA4O22ab9PAqdiS5Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so4959407wri.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KRo1oLzj8z655SYF1zAVR80J4AJJ+nuqJ/mStJU6s7s=;
 b=wXKPysx9iKY+yQ/39mOnQZtVm5m+YN62w3I+HkyrVoHhwIEYVWd0avMlvpxB9wQFnp
 6bX5LLOb7stdYBQpmjK1kDza1dDUrPETo76JeVN/KLXM2OEDxbz5lZjW60MOD50zMbq0
 OmWFZR+Ei6KTOwQomaFWJMmbCl/9u5ych3EAQq1L/jHKAOgBGGfBsIZkeaZtXnv1iQ7I
 WoSWDPOTq5811Oq9oY0mcx/GRkOk+jK2uLw6u6D2AFWxY53oe2+0s6UhlL2NGUe4135P
 hiK1Invt4GVINvlutzkyd8eQy0Z5yLp8WIrHqOz9aJ+sPNMzrRk/FVv5o0K0PFcECPQP
 5f6A==
X-Gm-Message-State: AOAM53370GaAJfWbHMfatI5qxwKdNv4QigHUwr/+7+gJzejWfKOO9UrR
 mwtQ6GOkvOL/VPlOlugx6FNQTizlwqC6oHNYodaxmsB08FERA+SZtzh/n/vlxr1Jswa/Xy+umoP
 vXmjSPfqUNaUclIACj5E+AUtTcnmjDnLix7rZl52LJvMJvPg6Mh7lIsovg3oC
X-Received: by 2002:adf:f5c5:0:b0:1ed:bc44:63e4 with SMTP id
 k5-20020adff5c5000000b001edbc4463e4mr10064125wrp.236.1646693169484; 
 Mon, 07 Mar 2022 14:46:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMUk0t/O4P9udbQER/Hj8jD7z6oGclNHHaBlSikGKFU9Q57E407ov+L3Omg+pR5jb570yKDQ==
X-Received: by 2002:adf:f5c5:0:b0:1ed:bc44:63e4 with SMTP id
 k5-20020adff5c5000000b001edbc4463e4mr10064103wrp.236.1646693169167; 
 Mon, 07 Mar 2022 14:46:09 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 w10-20020a5d680a000000b001f1dabec837sm7438760wru.113.2022.03.07.14.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:08 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 30/47] headers: Add pvpanic.h
Message-ID: <20220307224357.682101-31-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 zhenwei pi <pizhenwei@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhenwei pi <pizhenwei@bytedance.com>

Since 2020, linux kernel started to export pvpanic.h. Import the
latest version from linux into QEMU.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20220221122717.1371010-1-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/standard-headers/linux/pvpanic.h | 9 +++++++++
 scripts/update-linux-headers.sh          | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 include/standard-headers/linux/pvpanic.h

diff --git a/include/standard-headers/linux/pvpanic.h b/include/standard-headers/linux/pvpanic.h
new file mode 100644
index 0000000000..54b7485390
--- /dev/null
+++ b/include/standard-headers/linux/pvpanic.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef __PVPANIC_H__
+#define __PVPANIC_H__
+
+#define PVPANIC_PANICKED	(1 << 0)
+#define PVPANIC_CRASH_LOADED	(1 << 1)
+
+#endif /* __PVPANIC_H__ */
diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index fe850763c5..839a5ec614 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -214,7 +214,8 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
          "$tmpdir/include/linux/const.h" \
          "$tmpdir/include/linux/kernel.h" \
          "$tmpdir/include/linux/vhost_types.h" \
-         "$tmpdir/include/linux/sysinfo.h"; do
+         "$tmpdir/include/linux/sysinfo.h" \
+         "$tmpdir/include/misc/pvpanic.h"; do
     cp_portable "$i" "$output/include/standard-headers/linux"
 done
 mkdir -p "$output/include/standard-headers/drm"
-- 
MST


