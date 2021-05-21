Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E039C38C50A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 12:36:39 +0200 (CEST)
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk2WE-0002yy-PA
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 06:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk2UD-0001KK-5Z
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk2UB-00081p-0d
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621593270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y2zUMjfiqJQZLSQRM+1tfkQFEDkIuExBkp9si0rOSRA=;
 b=CYQtLgHV1amfpYdx/fiqRsnw6V8CdunuHHD6csSLRhA4m0W8zbAVjkSJ24Yc8SwsP63CCq
 9ZSICtBxGW6c3qzLRr+HDGufVXtnxw9ChzsvoJ0cBrZKSrRKZVOaFqwNil14IONIs25Naw
 GU9TSGnGi7yZkOxFcvlLtu3jWk2ra34=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-vBJ1H22-N5Wp6FdHXd8c1w-1; Fri, 21 May 2021 06:34:27 -0400
X-MC-Unique: vBJ1H22-N5Wp6FdHXd8c1w-1
Received: by mail-wr1-f72.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so9191541wrm.13
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 03:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y2zUMjfiqJQZLSQRM+1tfkQFEDkIuExBkp9si0rOSRA=;
 b=ThM1A8ekSvcKPKDD5EZ1QgvUEntbDNcVq9QgR4dXWfz91tcZt6sxt/gXqJAbmYg/yx
 iGE5cVfzSy31+N4n71Wx337YJIMQ0aFmbRRsQ32ej/tC9RojkxoKdbrWHijW+oPZUCGx
 GaPCLLRL70jCJTGw7EaUhuI7qjGSCJYG+4FyU2UR315+MzbFbeDR7SWZOndQdPsZwf/I
 HdHq86kUaDOjS+dKgxyXoJDEFp5WpsmoYmROt3Y+iSnV3bgDinXo53Ve7NKdcJ7uvgUM
 dd4tAX6GmQ3SFf+7lUjosabKjfDFb++tM2AhiPnN+U6FTVf4V03Jym+vJdex8okdLRWL
 SnFg==
X-Gm-Message-State: AOAM530oGTiMbQdk5BY1IVMO03r/XUVSshu+3oryjYOMsCI2jMtF/96G
 ib9tIYejkdh38UP7fk21sb5/W5sd2uQSS7t1bXQFg0Jqov6JKrFpX7MzSqYOz5bbfz9MIsPG42Z
 rkauUFlHtb8E4wBWHR5VJbQEWZ8boH6ubfb/pDgQ7kt197A4YwicUVR9C09BS3Q//
X-Received: by 2002:adf:d231:: with SMTP id k17mr8607278wrh.78.1621593265805; 
 Fri, 21 May 2021 03:34:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzACT4oQx/HMD5anNqL5Z5wMDFPKbgoePMCG57Qc1HWr3R0IRttxi6d/QCoJGm154sHsK6Vrg==
X-Received: by 2002:adf:d231:: with SMTP id k17mr8607258wrh.78.1621593265586; 
 Fri, 21 May 2021 03:34:25 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id o8sm1624630wrs.60.2021.05.21.03.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 03:34:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: Fix 'interpretor' typo
Date: Fri, 21 May 2021 12:34:23 +0200
Message-Id: <20210521103423.2780345-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo from commit fa2f7b0b9b7 ("meson: Warn when TCI is
selected but TCG backend is available").

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 1559e8d873a..230a0e4b558 100644
--- a/meson.build
+++ b/meson.build
@@ -247,7 +247,7 @@
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
   elif get_option('tcg_interpreter')
-    warning('Use of the TCG interpretor is not recommended on this host')
+    warning('Use of the TCG interpreter is not recommended on this host')
     warning('architecture. There is a native TCG execution backend available')
     warning('which provides substantially better performance and reliability.')
     warning('It is strongly recommended to remove the --enable-tcg-interpreter')
-- 
2.26.3


