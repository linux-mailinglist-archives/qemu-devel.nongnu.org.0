Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C02DFD22
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:00:03 +0100 (CET)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMfK-0005GW-2x
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRI-0004u1-6B
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:32 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRC-0007mX-Hb
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: by mail-wm1-x32b.google.com with SMTP id v14so10095287wml.1
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lh7IRMrgTGCLn22WAhKDgSov3MsoKDobeP7waDosJsw=;
 b=pBr+RH6Gy64+ZzEin5FcW8wQeK1/CPcFdHnkypEsHhGce5g9Le70GMTEJeeDmajuQS
 kf2Z4angZanmvc8fmbL5qTnNivWDc40vFb214ZhFDu0BeFTVMmo0+BS9DAFLJmFqWqA7
 0dMFsxUfHLZquQ1zja9faLq+Zsz7y2v296KIKCM5lRje3UIyRekb8FpE1pbRrQ8wd32+
 VlZEF9Z+6ajTXh1AzXBL8OGF4mmVknNNNu+/XgtrrnZKLSZ1CaNbhzgxetCwMXZN8ojh
 cc83CZn58VKabw/n65T0hvyR8jkBZcxemIwM3+Tju7cljeyDfgSMZZxO5q3B+Bd+Fy+V
 0cBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lh7IRMrgTGCLn22WAhKDgSov3MsoKDobeP7waDosJsw=;
 b=mSmTivl4MzdnV1I3PSV2wkzG27ObwaXLS8zcE9I+EBPjxrRFh4DieO2tD0RnLSn/9Y
 4m19Htp0lbhWubGFXGhd1dFUgmXVRaUK5eKPOv134MzCC33QHpOvGbYbZdyF+fDb3f8G
 F8drGlqrKAhFRyyvB3OWbqb9vz8B1IbOKTSPyimtaVbNfig8WKE+MaV2tcKQI2QYmwln
 FyJCD2t7Kfmrr9zjZJ3Qvoo9zCrGYyfMMgvXOadU21DBOEN9fUISwVIkbPns+DXqAuF8
 7i9aLAokKaGy09yR/hPSANYLqyDwscM2IwuDzMJ2WtZJbjyFxnbLDLMZIHABMtoJGOB/
 WJqA==
X-Gm-Message-State: AOAM530W5kzEsOzCp346RmE0KrX12o2UIyrgq6lDmifaWGR9SYDomL1u
 RaaGZ8/2CiyhgcjlHPtKq1hARhlzNK0=
X-Google-Smtp-Source: ABdhPJweytDT9jaDt7tb80kMStIw+0fZ+ukaZ9wGD+Q8rxcxIuewikBewTtd5Gj+omLdeR3RwQth+g==
X-Received: by 2002:a1c:2c4:: with SMTP id 187mr17252334wmc.187.1608561918600; 
 Mon, 21 Dec 2020 06:45:18 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/55] configure: remove variable bogus_os
Date: Mon, 21 Dec 2020 15:44:25 +0100
Message-Id: <20201221144447.26161-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The condition can be tested also from $targetos, clean up.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index ca8496b607..d5d630c0ee 100755
--- a/configure
+++ b/configure
@@ -466,7 +466,6 @@ gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
 
-bogus_os="no"
 malloc_trim="auto"
 
 # parse CC options second
@@ -619,7 +618,6 @@ else
   # might be going to just print the --help text, or it might
   # be the result of a missing compiler.
   targetos='bogus'
-  bogus_os='yes'
 fi
 
 # Some host OSes need non-standard checks for which CPU to use.
@@ -2014,7 +2012,7 @@ if test -z "$werror" ; then
     fi
 fi
 
-if test "$bogus_os" = "yes"; then
+if test "$targetos" = "bogus"; then
     # Now that we know that we're not printing the help and that
     # the compiler works (so the results of the check_defines we used
     # to identify the OS are reliable), if we didn't recognize the
-- 
2.29.2



