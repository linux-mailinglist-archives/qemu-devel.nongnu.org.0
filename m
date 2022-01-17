Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84B0490B63
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:31:45 +0100 (CET)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Tyy-00041j-RB
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:31:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TQW-0000b1-1L
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:56:09 -0500
Received: from [2a00:1450:4864:20::32e] (port=42822
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TQR-0001KU-H1
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:56:07 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so128146wmb.1
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 06:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nR/+SeDtRZlOw2NNPqgYfpYwLO60gXLrsx+m0ef5kJE=;
 b=XNIYzzuexVv6yMCYjLJCiGL/7MvUrRuP0MTkS6mZfY/MHPllZOshrUqQbaCaQdkT0V
 2SGDyMbFoka4OwT0xZM5ek21znCUjMh/8ssH4nkW97Y50C6m4kDU0IrxYgljgAJS8iUw
 ydKS4ClZjLvzE5waDP8WqQlMWun7o5lGTpJmMuLOs2ivqhbmi9zKs5m1tVEEmDl1B5H8
 OCVJLmYSUxIc3/6k1/57C/TquBkGAUd/rhQrAhKaROtDzPtTPBT45N1Qcyhgtwk29vFs
 V/5WndeFZ+zILDWz16y0stsd9MtzwZLv7Gbt5Uy5QzTOdMphOdV8NkrUgE91ngc48MmK
 WDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nR/+SeDtRZlOw2NNPqgYfpYwLO60gXLrsx+m0ef5kJE=;
 b=gZjBOzGSZrPFtBez4uvmoSIR+TmaHbb1ZEdytcH8YivOcyYiBKL3O13S9AvpR9Lo9J
 GRjQ8bM2yvBVaPHHEMqKK6nQTuKxEDm0iySee9lhaPvbiiTY/wvB89OYoD4XVLxkkOmH
 0jjg6jj6hQziY+hexmoR/ObGrr2/uEYlaMoDJBCsqYzbNCqCDHA7pJuEG/ORhxbi4H0b
 VRI65fmtCfJSV+cZfeO6UnjB4dfv7ly4OrENECKFUeEEQ1we4p3eRbzkOasnHk2mgLs4
 kjnUkdC44TXJM0jWhjTM1YiThzOHL6dYIjx9C8/h2XS14abvPer4QWcOwZDIP5OdMst4
 jSdA==
X-Gm-Message-State: AOAM532lcSZkM4pS7UPPX4ySQ80yUtlnARq5HiPWchRtCc8+Lzw+8JKJ
 s8eKoRH/qRjb7l8O1FuYOtI4U//uyJFMs/HR
X-Google-Smtp-Source: ABdhPJzKi66fiv4nr9fp8T3aUTwyGClMUnYxol+iqw5omRkqWDcH6iJ1WDxH3MefzGp98dIbQoV9Aw==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr5900080wrd.231.1642431361667; 
 Mon, 17 Jan 2022 06:56:01 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 8sm13895287wrz.60.2022.01.17.06.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 06:56:01 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH v2 2/2] hw/i386/sgx: Attach SGX-EPC objects to machine
Date: Mon, 17 Jan 2022 15:55:49 +0100
Message-Id: <20220117145549.145650-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117145549.145650-1-f4bug@amsat.org>
References: <20220117145549.145650-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Previously SGX-EPC objects were exposed in the QOM tree at a path

  /machine/unattached/device[nn]

where the 'nn' varies depending on what devices were already created.

With this change the SGX-EPC objects are now at

  /machine/sgx-epc[nn]

where the 'nn' of the first SGX-EPC object is always zero.

Reported-by: Yang Zhong <yang.zhong@intel.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/sgx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 5de5dd08936..d60485fc422 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -297,6 +297,8 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     for (list = x86ms->sgx_epc_list; list; list = list->next) {
         obj = object_new("sgx-epc");
 
+        object_property_add_child(OBJECT(pcms), "sgx-epc", OBJECT(obj));
+
         /* set the memdev link with memory backend */
         object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
                               &error_fatal);
-- 
2.34.1


