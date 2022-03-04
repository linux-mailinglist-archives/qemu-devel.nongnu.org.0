Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778334CD679
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:33:30 +0100 (CET)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8zp-000290-7e
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:33:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Bo-00045D-Tj
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Bn-0001CX-Bf
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRo1oLzj8z655SYF1zAVR80J4AJJ+nuqJ/mStJU6s7s=;
 b=YH3vaNGwnRT4tl8v75X6XOG5QZ9usZwS3Ks/lik8w5uv0zgnasdnb+qADarAxmoqjsm7cy
 2FHGsSZgT5iG2F7HSHgs1sDof7cd0w8LdcPmWTQe0j3CioumPV/K+Wy/L7BidMQmnlbNxc
 ciS+krbl6Po9C8YIEI1A0ZdGoj9z0u4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-9g4rs4-CO9qSGRjSyFxzVg-1; Fri, 04 Mar 2022 08:41:45 -0500
X-MC-Unique: 9g4rs4-CO9qSGRjSyFxzVg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l2-20020a1ced02000000b0038482a47e7eso2825901wmh.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KRo1oLzj8z655SYF1zAVR80J4AJJ+nuqJ/mStJU6s7s=;
 b=YykJZCAzxYPiZGNpT8E4xPSQGVSg0ir0QoPstbj4sZW+Mc9RfHmtXnzFJQVf2zBEw5
 TAqINioomnLd2FSO0GQ/dUgk6SpIGphFp/vtTEbF3oyj/zgR8OnO6Ta7Xg9elalhPzaQ
 zVjqPguubjbSyB9EtWmfI8D1v5+80BcDBU1V8pXsJLr7s5GmzPMMo0Nf5gskTkqMOzCi
 JYnSKKP387kfUTG16ppi0LFv8DOu7VMh09FLP1cCLt+S5HZbHuN4m5fWVnm35bEAjePH
 NrLiaDsrpHNNSXpmH1NLtmCCCfhMl0KpmKYV1u7kPrW+4cmBayfGwkry4hPeO50Jms5G
 Zfyw==
X-Gm-Message-State: AOAM532Je5ZoHwlWw+VL52ZjjFY7ZQztD+nusw9YZU6gYJAb6e331KHA
 czMT3wvRJ976y2TS6aNMvjQZP5gw0UpQ7bNSA80OiLQC1Pg++DNBWwsCbtVcGKvDO7U2NISvRzP
 8kpZwVkqX2dWOEB6yaZz0gtOKgWnqVaIIhaGUNqf4isMVlBTh06eYYinqaTK1
X-Received: by 2002:a05:6000:101:b0:1f0:2381:7feb with SMTP id
 o1-20020a056000010100b001f023817febmr11341565wrx.10.1646401303979; 
 Fri, 04 Mar 2022 05:41:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy11lLVbxwP7056+U/QeHtd5cRAT3ZOIH9YBsx0ZVis+TvzJppWpX2v6qJj7awPluy83lwb1Q==
X-Received: by 2002:a05:6000:101:b0:1f0:2381:7feb with SMTP id
 o1-20020a056000010100b001f023817febmr11341547wrx.10.1646401303739; 
 Fri, 04 Mar 2022 05:41:43 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 f17-20020adffcd1000000b001edbf438d83sm4441885wrs.32.2022.03.04.05.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:41:38 -0800 (PST)
Date: Fri, 4 Mar 2022 08:41:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/45] headers: Add pvpanic.h
Message-ID: <20220304133556.233983-35-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


