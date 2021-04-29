Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343B636E719
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 10:35:37 +0200 (CEST)
Received: from localhost ([::1]:34400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc291-0001Sk-Od
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 04:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc27b-0000d9-4N
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc27R-0002H7-Pr
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619685237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SfYxm6198t4TsEULWDMVtjn7nCBc76Ie7q84cSmTHDA=;
 b=gV1qVa1EkvXaeqiktPkzX9pLlnKwVfAlcE4pF/EPqaCaRLbu+VtydmTzKgAU1T00RmBdQW
 TN8NfGkP15BWnaqv8Is5C9YUjxi0wkZJ0sho1dNcOcHXln15HwS2INM3fhx6n/fqvT5pey
 sV3CCLWi6ckVGiUfZfzSmQk+5Zc4jBo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-XYQ6coHPMOuIfJy4B_c_Ow-1; Thu, 29 Apr 2021 04:33:55 -0400
X-MC-Unique: XYQ6coHPMOuIfJy4B_c_Ow-1
Received: by mail-wr1-f71.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so21049620wrb.9
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 01:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SfYxm6198t4TsEULWDMVtjn7nCBc76Ie7q84cSmTHDA=;
 b=n1HTHELgelYcsRG36jUZJBm7+s+Q/GKc0zHNe4sfesYfzWRslfVZ6RaTOnJeTKriuf
 pj9AF6cdKp4YZEV23Wf96wta+5SqoF6rQIIfzEM1Q5ED3AeZfCN749XI82IPIfNc2NVz
 SKS4NxCt6ptDogfclkB4SvQYNKu/uZ1lWCWiusSETOmm8N7ePQlLwznkMkvp6OHldzBb
 032AUaVTHp5WWtQvdaUxIaEtST34opQgB+aastDfT38bcwopOtn96TbG5Z3cgdEKnz3v
 SPhoK15iUYBSJxMg1qxfCJ3afCRA8Lp3xZXxhAfBlKkIZbYntR16uVGIstyKFUBHToyN
 +9vw==
X-Gm-Message-State: AOAM531GL9k0DTURiQFT+VPSUD3GY5NDKZX1l/VYvSZGaRqZhMVJqh6k
 gmlsUOkZqJBXzxdNrfJpZsvxDcoRwsma0wpMwUmH2+VbA4Pu4nUG63oDqFqFFV8ktrOYE6SsTX2
 vNjmrDUootxxg/DmBlMhkAyZ0QoBo9mfS70BxaU0o5OKv3tbZn2GDl1wCM56BawSE
X-Received: by 2002:a7b:c841:: with SMTP id c1mr35774208wml.123.1619685233879; 
 Thu, 29 Apr 2021 01:33:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoP2NwyT7hM6Adtca/0dWeJKDAuKDqKOQbsPNAcm/5E1OiBwdQwLjzQ4W8XsIDBYRvdVg23A==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr35774182wml.123.1619685233689; 
 Thu, 29 Apr 2021 01:33:53 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id z14sm3859294wrs.96.2021.04.29.01.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 01:33:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] meson: Select 'have_system' when virtiofsd is enabled
Date: Thu, 29 Apr 2021 10:33:45 +0200
Message-Id: <20210429083346.61030-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210429083346.61030-1-philmd@redhat.com>
References: <20210429083346.61030-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When not explicitly select a sysemu target and building virtiofsd,
the seccomp/cap-ng libraries are not resolved, leading to this error:

  $ configure --target-list=i386-linux-user --disable-tools --enable-virtiofsd
  tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd requires libcap-ng-devel and seccomp-devel

Fix by enabling sysemu (have_system) when virtiofsd is built.

Reported-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index c6f4b0cf5e8..f858935ad95 100644
--- a/meson.build
+++ b/meson.build
@@ -51,6 +51,8 @@
   have_system = have_system or target.endswith('-softmmu')
 endforeach
 have_tools = 'CONFIG_TOOLS' in config_host
+# virtiofsd depends on sysemu
+have_system = have_system or not get_option('virtiofsd').disabled()
 have_block = have_system or have_tools
 
 python = import('python').find_installation()
-- 
2.26.3


