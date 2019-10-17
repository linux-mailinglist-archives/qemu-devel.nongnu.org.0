Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1751DB33E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 19:26:00 +0200 (CEST)
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL9XD-0004xt-Po
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 13:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iL91B-00018S-KK
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 12:52:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iL91A-0006ay-Jn
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 12:52:53 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52233)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iL91A-0006ag-E0; Thu, 17 Oct 2019 12:52:52 -0400
Received: by mail-wm1-x341.google.com with SMTP id r19so3298738wmh.2;
 Thu, 17 Oct 2019 09:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fw8En6w1n23AXCLCPcsRW4J3X8Ym/DLL6U1eg1A662Y=;
 b=i1djodDcuYTdG28urBgXgCbYwElAubJwRUaf83f9I5LhoP0Xy9vYJ4IpFcbh48dAfr
 FcIK8AVS05/+eNalZFOBYXK8HGJA0zsCL7g+pLsr11iIIAaiS2xtFeXf/JP5yhUgRCrj
 24aBglX5gF1TSWiZNflg3rWP4n+EOTd+AJQ+UKl+5A2cXAO5K2wFt7bupK+nlKfU1sDu
 jc5Y+H1ODTSbNhXDCROWdQ8kxFIgjVUNrfRrl2IdW3OfobKm4vVNR+4Fqnt5eEwFnOR/
 HIxRMVbaoNvOEEnRLGpG6489WyqMduIWIHaSmLElqKvLxATV3Utx+Ii5i3RaxOTxjSmM
 8LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Fw8En6w1n23AXCLCPcsRW4J3X8Ym/DLL6U1eg1A662Y=;
 b=hORUhw06pqozwXCxXJ9hGUIETUte0v3hSy1MK7maD4m53eOc2k/yBRCw7fYtaPStQB
 QgxrR9aFnXMXTazBMvSnPn87JlKcETizC/wzOh2WDlTqjXGcbKIMDRoEFBXuX5f6FsPH
 dWFItwvtray0P0CNNsG287e3XHC+y3f7wB1yZSMsah9+UJljR0ukKh5VWY0pMTnYo24w
 5U6jsZN0ExHY5ny99zstq6CPNMPufWi7ocx6zvfZDAoxotU3529Rtx93QEC9p7o9rZeV
 KZoYZSEwKmy1uucbHvC2SMH348Uxal8Kzp9rA4xeEFAB6bjKGUQF6m3dQh6vv4nAZi0E
 pkqQ==
X-Gm-Message-State: APjAAAVKgj2qDHkrfz6FPeiVNWeAcwIWHK0ZbVertRX+l8KxnblvADjF
 SzpfGHigdVUhdzXxyifq0T6v1IfRHDg=
X-Google-Smtp-Source: APXvYqxAUt6M0DTBolt+Uie0MwJXpaR+X8GTIikvt7JZU/w0Ypc9aa7hYAJYuqtBq+ZZ4hf6TkL12w==
X-Received: by 2002:a7b:c930:: with SMTP id h16mr3690875wml.163.1571331171138; 
 Thu, 17 Oct 2019 09:52:51 -0700 (PDT)
Received: from x1w.redhat.com (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id w22sm2557363wmc.16.2019.10.17.09.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 09:52:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 2/9] tests/acceptance: Fix wait_for_console_pattern()
 hangs
Date: Thu, 17 Oct 2019 18:52:32 +0200
Message-Id: <20191017165239.30159-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191017165239.30159-1-f4bug@amsat.org>
References: <20191017165239.30159-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Because of a possible deadlock (QEMU waiting for the socket to
become writable) let's close the console socket as soon as we
stop to use it.

Suggested-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index a0fe16e47f..39f72945cd 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -75,6 +75,7 @@ def wait_for_console_pattern(test, success_message,
         if success_message in msg:
             break
         if failure_message in msg:
+            console.close()
             fail = 'Failure message found in console: %s' % failure_message
             test.fail(fail)
 
-- 
2.21.0


