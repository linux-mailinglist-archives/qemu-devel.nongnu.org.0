Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82672FD412
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:34:06 +0100 (CET)
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FUj-00028N-PI
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FGj-0001lp-NC
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FGg-00084n-Dg
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bIzIHiAlzXr+hmN6jUsWEgwkDjP+yZMnPWbxbL20yM=;
 b=QX6qXcOF9IyOF5AEpy7+l9uwTm6WEDHvVoZKh7ZcTL0DQ4CGeeNWu9ppwHermBByh0sgMN
 Lp0QCl3qKfMW3HkT6D/qblIfQoRNKVeFZU5xfJcM5vZW9sylAHLiUeH3BykM6Oc2UD+jp9
 mI/9x/Qg83tApew1/0+MEemfEfaAfPU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-J9JjQbnXOQW7Dox5Yuftag-1; Wed, 20 Jan 2021 10:19:30 -0500
X-MC-Unique: J9JjQbnXOQW7Dox5Yuftag-1
Received: by mail-ej1-f69.google.com with SMTP id d15so3324520ejc.21
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 07:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2bIzIHiAlzXr+hmN6jUsWEgwkDjP+yZMnPWbxbL20yM=;
 b=lmo5Zr+0YOZknRL14mQwYgg4eSjsFyywOhXBfcBJ4+tzSAxg3yKCT75Tz16om8aYtx
 wvcgXFfdmnKccI5pxbcn7yxoPmbxjNw65eezn0t4cnkdGWd0q8A1+k9UD9Nr9V/k7D/8
 xd3p6cBXSsk+ovgEy6W8qWFX+VAJlo6o16dV4sHlCxjhD9MciL1hkyYdYAhQkM2x/Fmu
 y3F5zlar2+9Ju8qkRx+RjJvrPgSImyaJjIExdYl1i72Aur7LITBXvvfGSIy8r+hgOorc
 mWqtABEmbWhfrgWVo5eqfhD0qkA8WUAKPL5a+knDWt6HSJHR9hhbFLQMku5G7oeSAyz4
 wYZg==
X-Gm-Message-State: AOAM531bTeNUw9ED10jRoqTDQCsJUSdsactJUXbpIYaOr7tS9fD4iSPz
 cOUmst1t8lIGz0Kyn0aLc/nOHesEcp27bsRketStQJ+KC700K0LnFbagTOENtexp2DV1na4UH6j
 o8YVndt8Mj2BSB/a5KXFOQtET30dvyyWth5SpAx0QZx4rZ88UyD1SqTdCJVOokfLm
X-Received: by 2002:a05:6402:2c5:: with SMTP id
 b5mr8133632edx.258.1611155969290; 
 Wed, 20 Jan 2021 07:19:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztOTjvZwUE8WXM4I2PX2GsNpEacKVuneZqvc0k68X/wcYgIgTuZTIL3LE7Tnk7wCYnILScrQ==
X-Received: by 2002:a05:6402:2c5:: with SMTP id
 b5mr8133598edx.258.1611155968797; 
 Wed, 20 Jan 2021 07:19:28 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k6sm1011340ejb.84.2021.01.20.07.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 07:19:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] configure: Do not build/check for capstone when emulation
 is disabled
Date: Wed, 20 Jan 2021 16:19:15 +0100
Message-Id: <20210120151916.1167448-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120151916.1167448-1-philmd@redhat.com>
References: <20210120151916.1167448-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The capstone library is only used by system and user mode
emulation. When it is not required, do not check for it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configure b/configure
index 012c527e3cd..a5159157a49 100755
--- a/configure
+++ b/configure
@@ -2291,6 +2291,11 @@ if [ "$tcg" = "auto" ]; then
     fi
 fi
 
+# if neither system nor user emulation requested, capstone is not needed
+if [ "$softmmu" = "no" ] && [ "$linux_user" = "no" ] && [ "$bsd_user" = "no" ]; then
+    capstone="disabled"
+fi
+
 feature_not_found() {
   feature=$1
   remedy=$2
-- 
2.26.2


