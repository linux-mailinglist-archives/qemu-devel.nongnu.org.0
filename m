Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBAD2B6B0C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:06:15 +0100 (CET)
Received: from localhost ([::1]:60576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Qo-00042k-43
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EX-0002M2-Q0
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:33 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:34858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EW-00077S-60
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:33 -0500
Received: by mail-ej1-x643.google.com with SMTP id f23so30459567ejk.2
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=socdrf4cdKgttDc16JUa8TlM2QzhUy6/DdThoPbbylU=;
 b=a1JE0VkkvPLVH1y1zfE6YAQIk8yFfO21H5iJD56nwE0/gMHNdH2NUVORo/ppUObc4a
 eqKl6ea8IETDaA1GKfQzKs+WIfX3vXTyf0QnHGUkwn7M5urBFMq1D388FSxiB2uf+ree
 L4xEzPNps7Y2n/Yq9j9I6mE0Y2zXpUVaYyD/cagkIayVxa9pTLAR1g2sFDR18FAJn1sH
 azL/37qWsWuLtWzIV1EP6xicFFJRGBnygVzeUrDJMZxzqzudI8+Ax7/mcigutCDVIMuS
 wHc7dMk5maW+qvoqM0DqunxbOYvR9gXZ+IirxC5gv+cuq9sr5zhHoVIL4XIoadl+nYMW
 BOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=socdrf4cdKgttDc16JUa8TlM2QzhUy6/DdThoPbbylU=;
 b=h4dL/SQSALMj4NksPMDtQCXd8Y8J6MBzEultmj0VxL42rTvaxlGNS0spWW3gu+Z3uZ
 vB+8g/GFklnzhKUidMHQyh3KLBtVN+YDAtATNNt2QwPhDgzgk3olT0TueTgRJOuqhVhR
 JPaZ2VWGBKPYvgCAHOV+33vQUDVYvF0ijiKAe12ZoVzZOz9N0tJ8CEHju84m+HPoi0yS
 Z/BQaZYhHqWfw4x/k4SNTVNwKFNTRBvaOZJOR4w4Spva/BeDWh2O4iC7gLi8cFJ5DejZ
 fA61ZKaC9mMdClOpclcu/ds6Gy/HHg6piMXZid7lQkyD6fD4qua7b0P0+whFykAzOVMs
 RvSw==
X-Gm-Message-State: AOAM530iEE1pGrZdCYxpjTSxjeAHx/3bIBT7a352iLRC4reEsasclWjT
 ZSqrpY8iOyeyYLPKIAL+jBP6n8pBTkg=
X-Google-Smtp-Source: ABdhPJxS7R17Iec9AiBKhbBmWM5y31BNxZZIEJ17vaHRuBIh+k67LnxkOcQrgQroUkYXpKu/SCRTOg==
X-Received: by 2002:a17:906:868b:: with SMTP id
 g11mr20502918ejx.263.1605632010403; 
 Tue, 17 Nov 2020 08:53:30 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/29] Revert "scripts/kerneldoc: For Sphinx 3 use c:macro for
 macros with arguments"
Date: Tue, 17 Nov 2020 17:52:57 +0100
Message-Id: <20201117165312.118257-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 92bb29f9b2c3d4a98eef5f0db935d4be291eec72.
We will replace the commit with the fix from Linux.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 073f72c7da..cb603532ed 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -860,23 +860,7 @@ sub output_function_rst(%) {
 	output_highlight_rst($args{'purpose'});
 	$start = "\n\n**Syntax**\n\n  ``";
     } else {
-        if ((split(/\./, $sphinx_version))[0] >= 3) {
-            # Sphinx 3 and later distinguish macros and functions and
-            # complain if you use c:function with something that's not
-            # syntactically valid as a function declaration.
-            # We assume that anything with a return type is a function
-            # and anything without is a macro.
-            if ($args{'functiontype'} ne "") {
-                print ".. c:function:: ";
-            } else {
-                print ".. c:macro:: ";
-            }
-        } else {
-            # Older Sphinx don't support documenting macros that take
-            # arguments with c:macro, and don't complain about the use
-            # of c:function for this.
-            print ".. c:function:: ";
-        }
+	print ".. c:function:: ";
     }
     if ($args{'functiontype'} ne "") {
 	$start .= $args{'functiontype'} . " " . $args{'function'} . " (";
-- 
2.28.0



