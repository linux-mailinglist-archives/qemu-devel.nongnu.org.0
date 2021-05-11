Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A237AB39
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:58:27 +0200 (CEST)
Received: from localhost ([::1]:37394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUmA-0000cw-JA
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUiT-0005nS-L9
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUiR-0001h1-2i
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620748474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vunbBRw+U/6ax0uN6oOttuDVMii7IpFlwPeXrKqEuKQ=;
 b=cH4NtPbXC/KVjZ6mQKsmsAkSmHcdflJOLAzf+xqQG4JQ1Dw4vKo7lDxndw0TiR+xzjaG8+
 u1FA9dtaSi4f+gDUfNsUTf6HkaA9k824S2OZGJ5p2VnXeZrhCCF+nca9c2pAqYQAFZMSYj
 c7qZsD1lPH5GaCaDUuTLUsz17iu5zPQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-tdhU8RlLOTa5usN1ESvPoQ-1; Tue, 11 May 2021 11:54:33 -0400
X-MC-Unique: tdhU8RlLOTa5usN1ESvPoQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso8895156wrf.11
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vunbBRw+U/6ax0uN6oOttuDVMii7IpFlwPeXrKqEuKQ=;
 b=Cw5ivRIWIMywZeNHMp+MdZgtA+Va4wapTSlINUg6uM8NqrNgd99WHsltwHqM91+QOO
 FxY6SVCTFPXNvGYmKS1D8GhO2nCS702Ef68u0fKeygsPW1ZxWqufGqF5j8W72hZtTOy4
 dqKs38JOfX9rayh6khGVc0DY+eRR1YHBYp0pQ6whUro7K1uKYHOyLNlzYaqepoPPcXtr
 +GF5q0SsV4Pn5ELV/O0rX3a3CgorhNJlmOHUUe+P+WAwkGFVCFc/aHDuB2KtzdFf2VM/
 WnsjQazx3ENKar19hmWJshW4PgpgKDEPEIWdE/4mDG9rnehK4mLCmB80lG9XosJcC486
 YzVA==
X-Gm-Message-State: AOAM533oMtXFYbpqvquJXJkINKgdXxL8ZmemWXb9WhhMI976IiLcw6Bh
 y4lpjrGYxogeMr9p7K8IV4cyCdzTlgzOOeKiTsfGeHbUnkqe0cVXh36wjU194Gdqn7/j5kMuvyV
 +4iNTMaLJdaMzYPPTbKaSHfYGV2k/DzxRY+ZUs2V6bPKUndDSssjQX/kZW2Gd3BYK
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr3296585wrw.362.1620748471785; 
 Tue, 11 May 2021 08:54:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1yfEZ2edg++3E+Xq4CvpeNF71PwTsgeaNSLNW2ez2L2OOj7Z3+r9Fpxz/pFmIEDc/XnrxTQ==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr3296556wrw.362.1620748471586; 
 Tue, 11 May 2021 08:54:31 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n123sm3894585wme.24.2021.05.11.08.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:54:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/5] hw/ppc/fdt: Drop dependency on libfdt
Date: Tue, 11 May 2021 17:53:53 +0200
Message-Id: <20210511155354.3069141-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511155354.3069141-1-philmd@redhat.com>
References: <20210511155354.3069141-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hw/ppc/fdt.c defines the ppc_create_page_sizes_prop() function,
which is unrelated to the libfdt. Remove the incorrect library
dependency on the file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index e82a6b4105b..580e6e42c8a 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -3,9 +3,9 @@
   'ppc.c',
   'ppc_booke.c',
 ))
-ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: [files(
+ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: files(
   'fdt.c',
-), fdt])
+))
 ppc_ss.add(when: 'CONFIG_FW_CFG_PPC', if_true: files('fw_cfg.c'))
 
 # IBM pSeries (sPAPR)
-- 
2.26.3


