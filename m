Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53AA2B07B8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:44:22 +0100 (CET)
Received: from localhost ([::1]:37728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDpl-0003eV-9g
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmP-0000hp-Bd
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:53 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmN-0003lM-JI
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:52 -0500
Received: by mail-wm1-x32c.google.com with SMTP id a3so5712224wmb.5
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HTkXZpa//4S3/tOAaPxnmr1m6zG2tRZdpuS79qs0LsA=;
 b=D1mqkC1k1vrl03AzPXC/HXdb7kKIIZ8gNRuY4qQHc3GBpmbUfLgL2b8HvliFVocj37
 ywHsE2okSQB5399DtV0wFVqfrlIHGoBQnTFZKE73LrJObgIw7FiXPDgHVJAkUNS/Eze5
 /23V4SoWc718scz8uinmHXpFCd28pzkdvswDKFcAbdhPByx2SbXShMWpRTe1YHOd/mEU
 +ChdVXecUoU3kx+eHnz7xGK46mp6CyOBGdGmR8eEDFQdkxmr+RXvOusBP2R38iwDZ4EE
 N7k+BuW+SN7HLMo/+NkKPGlPE7J17QyFc/0A8D7FXHNWwu3aiKlLZgSFZ0CJohzbiRHP
 etBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HTkXZpa//4S3/tOAaPxnmr1m6zG2tRZdpuS79qs0LsA=;
 b=lVzdYQtanpAhbOgwnbdkVaxRrOSHibQZ+N7gd5yt0HtwtI9D7h8taXLPvxo7rlQ0vw
 jPJy7QckgNOFYp3nDo28KHx7ILnYkyVPk3gW1VcH7kYgXKZKvuHX408d2nnPW3ljABiT
 LBq6lPJar/EUyeW5XPJ0d34I4tJja3EhQD5PEEKjEihQnFXun2/bOzIpYjmBZ7iyFEfP
 jkNzNjk/4RtK9XZUuN/nTfEL8jrT2WaVDLMlaWSIxxtDhio1zNe0DieReAV2A5pZXuF4
 f77I+L5f2p3+nJeFhsB6DLOWFym57sFlYrOiIEKDDQx3WGNicS9xQoT10I9BqjnPa44k
 ebNg==
X-Gm-Message-State: AOAM531Z0oJ64wzOmvQCmjA0g8dcNyrvwPfWUKZuoiE/meEUZ3mMuLO8
 MgvEJn31eVqwGX+3Tm8cpsfjOZnoEuQEWw==
X-Google-Smtp-Source: ABdhPJzXVjdt+ZwJeMOdSoVfOBcpT0LtBrWHo6MjVzx16U4q5WBeVM5183I4GK0rzC7Bm0BoxaJCMQ==
X-Received: by 2002:a7b:c391:: with SMTP id s17mr65810wmj.66.1605192049810;
 Thu, 12 Nov 2020 06:40:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k16sm7410907wrl.65.2020.11.12.06.40.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:40:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [for-5.2 5/9] docs: Split out 'pc' machine model docs into their own
 file
Date: Thu, 12 Nov 2020 14:40:37 +0000
Message-Id: <20201112144041.32278-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112144041.32278-1-peter.maydell@linaro.org>
References: <20201112144041.32278-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Currently target-i386.rst includes the documentation of the 'pc'
machine model inline. Split it out into its own file, in a
similar way to target-i386.rst; this gives us a place to put
documentation of other i386 machine models, such as 'microvm'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/i386/pc.rst     |  7 +++++++
 docs/system/target-i386.rst | 18 +++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)
 create mode 100644 docs/system/i386/pc.rst

diff --git a/docs/system/i386/pc.rst b/docs/system/i386/pc.rst
new file mode 100644
index 00000000000..d543c11a5cd
--- /dev/null
+++ b/docs/system/i386/pc.rst
@@ -0,0 +1,7 @@
+i440fx PC (``pc-i440fx``, ``pc``)
+=================================
+
+Peripherals
+~~~~~~~~~~~
+
+.. include:: ../target-i386-desc.rst.inc
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 51be03d881f..1612ddba907 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -1,14 +1,22 @@
 .. _QEMU-PC-System-emulator:
 
-x86 (PC) System emulator
-------------------------
+x86 System emulator
+-------------------
 
 .. _pcsys_005fdevices:
 
-Peripherals
-~~~~~~~~~~~
+Board-specific documentation
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-.. include:: target-i386-desc.rst.inc
+..
+   This table of contents should be kept sorted alphabetically
+   by the title text of each file, which isn't the same ordering
+   as an alphabetical sort by filename.
+
+.. toctree::
+   :maxdepth: 1
+
+   i386/pc
 
 .. include:: cpu-models-x86.rst.inc
 
-- 
2.20.1


