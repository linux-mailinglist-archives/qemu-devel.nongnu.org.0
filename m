Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A755D4CFB39
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:33:15 +0100 (CET)
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAfy-0005zO-IC
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:33:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACf-0002C7-L0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACe-0002ov-5I
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRo1oLzj8z655SYF1zAVR80J4AJJ+nuqJ/mStJU6s7s=;
 b=QyUksxJGoHuAYMvivcW1j89NJep/5JlUUwq6ObgI+1cfyM7rWPNc/7jmyWLQBVnQw7Afv1
 Urp+j4KuxsRgTV8b1Bw8wxOjdaQ4JU/6lgdGrlSRcGtVxdSK0BViqyU5M+mVk+qQqUlQDt
 QgjyXLY/OiV9d7ZGYgtsNkbT8A1z6fI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-8BnFHsPmNrWOR5q4Te1iGA-1; Mon, 07 Mar 2022 05:02:54 -0500
X-MC-Unique: 8BnFHsPmNrWOR5q4Te1iGA-1
Received: by mail-ej1-f71.google.com with SMTP id
 r18-20020a17090609d200b006a6e943d09eso6721731eje.20
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KRo1oLzj8z655SYF1zAVR80J4AJJ+nuqJ/mStJU6s7s=;
 b=1sZqj7jTL2o9bMe4fqzVA+2iswGUhsixJOcSQwAvTECH3mjUy1xCOAwyaAc3aycnzm
 9j6BcmLsW/i8IsPTvqHPckVkqIEgISN5S1cHgOCkEBixWp/z5xDgJpZ+mua25ZnXsyAe
 MxI+/1vYImnMPTMhJr4L3sAY3NQsYejvfTqNZ+Rwt67iWcTr2gJXpPaPcwMEOppZpgVq
 YOcrSg8teSFuQW3oXhtgsWmOgVCDcmBkIywlxCukF1twU+8CJ2fisNXyZIKI6AEQ3S1e
 v3AQgx0MWKw3v7SV/GugNWEiddR5SkuPlj5fh6CV9GtZHsx4FaYQj3kS5Jmy4gIjeKur
 B1XQ==
X-Gm-Message-State: AOAM5312D+hW/rEaqDU5U044gXIQ+Ad9Na58m+drwVx5G4s2BWMudusP
 GdpeV2KxDfUb8gNSSyTm3tnpsBCtAuoX/WaJu1OATHmF6REIH/Bv6CRaA6U/yNNIUiwkbVn7+ju
 TBNDEVIjSphxrlzWzEBnc4lNpWgRvFEhhirUOPxvG2VYRS1dh+OR/dGk+eyRE
X-Received: by 2002:a05:6402:2812:b0:416:46ab:818c with SMTP id
 h18-20020a056402281200b0041646ab818cmr4168773ede.258.1646647373098; 
 Mon, 07 Mar 2022 02:02:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyK7B3A+t8TLlNl1Df5emhjr4z3xFoczQx1eJDyOMCoUTn5tvLqJbR1JcAmBq0Hene1EXZX6w==
X-Received: by 2002:a05:6402:2812:b0:416:46ab:818c with SMTP id
 h18-20020a056402281200b0041646ab818cmr4168751ede.258.1646647372901; 
 Mon, 07 Mar 2022 02:02:52 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm6085028edt.80.2022.03.07.02.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:52 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 30/47] headers: Add pvpanic.h
Message-ID: <20220307100058.449628-31-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


