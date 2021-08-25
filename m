Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2393F7409
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:06:58 +0200 (CEST)
Received: from localhost ([::1]:42898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqk8-0008NP-7a
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGV-0004sy-Qk
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:15 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGU-0005hH-7B
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:15 -0400
Received: by mail-wm1-x336.google.com with SMTP id f10so14672005wml.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LLWtgW+9AQrEcf5IWz/pAYLJCA/RqHavinTg7t+HK3g=;
 b=CDAE0DSZLxTWYF0fcXXVfxgns8ixZaDZGbXfBJgf/AlagPwnVFnuNwyd+58Ro59xCZ
 1woQmZ8pH6tZASRCdpXdFo0MHNB23toAnyICKkrSaXq8b2qezFVevCJiBez0ghbncq0d
 pzLHsFkErQlT3CQ0hs5pcdX9pegl8ZhcYKbzZRkPQBNrx8fOcT6Auvu7bSWS4Cjs9PfP
 xlyWXtCYzyB1pDuKxWW8JBUEFbpQTSbfFlhMqiK2PlEO5hVqfFzRv/leq0Ff37qTN6eq
 fKdEhHZE7/Cung1s2b+WLtljm4q8LTlDkAaRR1C86NcQuDnp+C35UulyEhFW2XHEkygx
 wAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLWtgW+9AQrEcf5IWz/pAYLJCA/RqHavinTg7t+HK3g=;
 b=kIQ0L8N4RTanFvYfEdBfYRPXBakn8Qnrf1F8Hw6yO6oO8Kf30LcZlL+RtebpWUHpob
 g4pAxYgApEJUWOs9DLhQ7m2zFqs6xruN2TQ1fw3yUvFZciJIk8ART+W1/M9ldqTc9PbU
 CfLeBmmtPt+LdMYfzw3PlPiHVGQUf84iMmJpn8zQ3eBO4ZJlNl7cDW8FQiys9PC+Cqy9
 SvLsmPki0gz+IKleUw7XQPBlxSQZkYNGGiw+SON0QNG5PbInxRaYzI+Zg/hhSYJDjnvB
 KCrzDjAeNgoKdC3tQYabXSIxTagq2erxB418VsWNBhcGtaP+oQRa26/D4CQimua8/hPt
 WDkQ==
X-Gm-Message-State: AOAM530UPxk0T7IcIDht5PN66SJDw0q7C/ZcfdzWS5SIyA4tHkcMcvRl
 2JPdVj0wjHPazFGGulmVnFH5LmLd0h+iuw==
X-Google-Smtp-Source: ABdhPJyCLSWTx/rf2G9qvnUaCgIrP6+MMvVA0HCazE/CQdSYtkkNzVtkgR9SWMr6tJic9eY/+H58+w==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr8575581wmc.54.1629887772927;
 Wed, 25 Aug 2021 03:36:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/44] docs: Document how to use gdb with unix sockets
Date: Wed, 25 Aug 2021 11:35:34 +0100
Message-Id: <20210825103534.6936-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Sebastian Meyer <meyer@absint.com>

With gdb 9.0 and better it is possible to connect to a gdbstub
over unix sockets, which is better than a TCP socket connection
in some situations. The QEMU command line to set this up is
non-obvious; document it.

Signed-off-by: Sebastian Meyer <meyer@absint.com>
Message-id: 162867284829.27377.4784930719350564918-0@git.sr.ht
[PMM: Tweaked commit message; adjusted wording in a couple of
places; fixed rST formatting issue; moved section up out of
the 'advanced debugging options' subsection]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/gdb.rst | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 144d083df31..bdb42dae2fe 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -15,7 +15,8 @@ The ``-s`` option will make QEMU listen for an incoming connection
 from gdb on TCP port 1234, and ``-S`` will make QEMU not start the
 guest until you tell it to from gdb. (If you want to specify which
 TCP port to use or to use something other than TCP for the gdbstub
-connection, use the ``-gdb dev`` option instead of ``-s``.)
+connection, use the ``-gdb dev`` option instead of ``-s``. See
+`Using unix sockets`_ for an example.)
 
 .. parsed-literal::
 
@@ -100,6 +101,29 @@ not just those in the cluster you are currently working on::
 
   (gdb) set schedule-multiple on
 
+Using unix sockets
+==================
+
+An alternate method for connecting gdb to the QEMU gdbstub is to use
+a unix socket (if supported by your operating system). This is useful when
+running several tests in parallel, or if you do not have a known free TCP
+port (e.g. when running automated tests).
+
+First create a chardev with the appropriate options, then
+instruct the gdbserver to use that device:
+
+.. parsed-literal::
+
+   |qemu_system| -chardev socket,path=/tmp/gdb-socket,server=on,wait=off,id=gdb0 -gdb chardev:gdb0 -S ...
+
+Start gdb as before, but this time connect using the path to
+the socket::
+
+   (gdb) target remote /tmp/gdb-socket
+
+Note that to use a unix socket for the connection you will need
+gdb version 9.0 or newer.
+
 Advanced debugging options
 ==========================
 
-- 
2.20.1


