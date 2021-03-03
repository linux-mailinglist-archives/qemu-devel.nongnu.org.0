Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6ED32BC7C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:04:19 +0100 (CET)
Received: from localhost ([::1]:52456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZbO-0002RC-JR
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZNE-0007BD-4W; Wed, 03 Mar 2021 16:49:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZNC-0002hh-MH; Wed, 03 Mar 2021 16:49:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e23so6328393wmh.3;
 Wed, 03 Mar 2021 13:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=thZpYEs3ORtBK7nisq+USWMtn89YjLX4bCvj3GSE47w=;
 b=mkP6p9uiQajrOH2sw9/hu/XEYG69bOwqb06XtRpvogIUyzs/80G7oxXFzln5SM5g5W
 Qoy9Lr+OQJT4RDzMBqPnVWtAfXK863wSrkwRefO3fJOI3yn11sp21rwIYcV6YX+vOW6B
 QTqrnZZpotMGJ/O6kuNCpfDJZgjCh1pDZuyvu9nOhFKPjlabCMZIV5514UvBnPU8XkPu
 NGUC1QHfgWDIgMkgoqKJbmbzNsoMfZll8PLZ4nvsYYIb2OEQ6zED0jUC3lCm9BOi7f1u
 jwx1cEXNVROlPZhqPQc+rvFBNItrzyCjNvYLAGqXraBzFhstquC0pvMSamn+QRkNRHwd
 ZMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=thZpYEs3ORtBK7nisq+USWMtn89YjLX4bCvj3GSE47w=;
 b=TIKL/mWYrznR5pAvuMrlCOL8XULawLp0ruxcI5IM1nzoI3uHQ4MY26/bozXd+g7Xgf
 yOjYAAyYR2RG+nM132bzQ8pFhy9P/ZvYiv7syq0ZoYZG6gOGmBg1p+rwCE8G9bna93hd
 8CcMwvDEQjkbcQbGWZ0oBXZoSp4yP0dLnUPDibUxT1LFC2dW0B8eO+zhQ9JXpePhecSl
 XQD+1oau2MfG0f1EDl5RvpMhX80wRo6yQH6d8/PUQyVfNhigZde5DwXEbX4G+YU3YVfM
 nkmZki/0SONYcYpVeogSl2wrMOaIK5iGwC4KvZATt8/BV4dNYnw5yDU69MzDO36oTgIN
 DRZw==
X-Gm-Message-State: AOAM532IWqZUPHSDcOuI7uXJX8JiDTS4pbx4H6Dd1p84+yLVBjU4SI+W
 HExlXW6Vi2+Ie56j/mqwPSSlR5E/imE=
X-Google-Smtp-Source: ABdhPJyVSlK14c0CczyHFZYx/XdOuM8JjnuE33R8uVycsbyotkDZItB77zBGfhNGQkSu9yOWAq3N5w==
X-Received: by 2002:a1c:1d82:: with SMTP id d124mr851659wmd.1.1614808176266;
 Wed, 03 Mar 2021 13:49:36 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 4sm7508807wma.0.2021.03.03.13.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:49:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/28] cpu: Fix code style for checkpatch.pl
Date: Wed,  3 Mar 2021 22:47:07 +0100
Message-Id: <20210303214708.1727801-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b708f365a7a..79dcc9a4e42 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -558,7 +558,8 @@ hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
  */
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
-/** cpu_asidx_from_attrs:
+/**
+ * cpu_asidx_from_attrs:
  * @cpu: CPU
  * @attrs: memory transaction attributes
  *
-- 
2.26.2


