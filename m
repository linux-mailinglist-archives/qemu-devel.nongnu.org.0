Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8564E405FEC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 01:14:26 +0200 (CEST)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOTFR-0005c8-Ke
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 19:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3opM6YQgKCsM53qjx21qpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8X-0004Ys-6N
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:17 -0400
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:46658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3opM6YQgKCsM53qjx21qpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8V-0003Y7-H3
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:16 -0400
Received: by mail-qv1-xf49.google.com with SMTP id
 et12-20020a056214176c00b0037279a2ce4cso216716qvb.13
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 16:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=K4LYlOvUZzLd9MOez1R3zFl12BIZBDW+14pZOtD/xoo=;
 b=VX3HW05I+YxfQAsGO89DDgpNXRYqBBX2p13O0pWGm1WXsq3XcSxL/fzkpWLRjvQVmb
 lxz29uLSU+1hlzCWPsMZKBZtnAaHyC//GHqtWGH69mEBsm9A/o8jYZNlG2n/JDAzCLzT
 xNh/9RYPOo3U64lEkws/+G8m+M3C/yn800X6u8PJV3MZadGBo2Fv/zGWRZe9Mjp0pT3G
 I0kDSC+9RWP9Fbq8Fhzk+mZQxrC+JtEIwu+KuZToPSXpdNbxT3BFZPq1yV8m6axGDeRR
 mcE5EiJ6qw3o0x+nfdhBcLHDfpdV0W7rfY5NEYRL41z8wQZLyGGTMetGMXY6CSdUgDGy
 jHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=K4LYlOvUZzLd9MOez1R3zFl12BIZBDW+14pZOtD/xoo=;
 b=2ge8HL+lkpxQt467yX43RlpCIpg/12Q0ErrNKWCk2/VIGQ6DfpgjEN1ezhnxY9NJ7l
 RauZtBPntHP2twqDXn6ylsWuMy/cVHOJvtBaapj2KN0UpxXylL3POfIqOcaUMLybtRwE
 kqLGy//pcSkBTD14R11Gae+NnBVlkH5jcbMkj3vVZhDq2wCbfWi8n7D318cmc9410Jdp
 LfeNFM8uc8ziAj7EeIQy9uZEIT0uc019lIKdvpsuGLkYa3CXqUy8Hib/X9vCHC2gbRwI
 O5CNhyM47e3lTDZLiqlGv1quVISKTABsGqZkzS90QQFOUMy/bTwDA/OoTNCPcmfwp74s
 akng==
X-Gm-Message-State: AOAM530rPFGr525CpUQAnSDlSeLkkS2ppM3yHUOxBZbH1Ux1r7QMBFz/
 OwnjrEkJd8LXIhmnIQNa2Exthn4L5DqCmA==
X-Google-Smtp-Source: ABdhPJyo736Kxk15b1XTVQFfloeCCaqxHNKwpkG8I1LeQMCQDv5Nz1yUC3JtZBGw0vH7c5A1I/az4B3jclULAw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6214:268e:: with SMTP id
 gm14mr5543839qvb.51.1631228834083; Thu, 09 Sep 2021 16:07:14 -0700 (PDT)
Date: Thu,  9 Sep 2021 16:06:15 -0700
In-Reply-To: <20210909230620.511815-1-wuhaotsh@google.com>
Message-Id: <20210909230620.511815-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210909230620.511815-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 3/8] docs/specs: IPMI device emulation: BMC
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3opM6YQgKCsM53qjx21qpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--wuhaotsh.bounces.google.com;
 helo=mail-qv1-xf49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

From: Havard Skinnemoen <hskinnemoen@google.com>

The IPMI document is expanded with a proposal to emulate BMC-side IPMI
devices. This allows a QEMU instance running server software to interact
with a different QEMU instance running BMC firmware, which should
closely model how a real server system works.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/specs/ipmi.rst | 70 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/docs/specs/ipmi.rst b/docs/specs/ipmi.rst
index adb098b53d..b5fe362043 100644
--- a/docs/specs/ipmi.rst
+++ b/docs/specs/ipmi.rst
@@ -91,6 +91,76 @@ further delegated to an external emulator, or a real BMC. The
 ``ipmi-bmc-extern`` device has a required ``chardev`` property which specifies
 the communications channel to the external BMC.
 
+Baseband Management Controller (BMC) emulation
+==============================================
+
+This section is about emulation of IPMI-related devices in a System-on-Chip
+(SoC) used as a Baseband Management Controller. This is not to be confused with
+emulating the BMC device as seen by the main processor.
+
+SoCs that are designed to be used as a BMC often have dedicated hardware that
+allows them to be connected to one or more of the IPMI System Interfaces. The
+BMC-side hardware interface is not standardized, so each type of SoC may need
+its own device implementation in QEMU, for example:
+
+* ``aspeed-ibt`` for emulating the Aspeed iBT peripheral.
+* ``npcm7xx-kcs`` for emulating the Nuvoton NPCM7xx Host-to-BMC Keyboard
+  Controller Style (KCS) channels.
+
+.. blockdiag::
+
+    blockdiag bmc_ipmi {
+        orientation = portrait
+        default_group_color = "none";
+        class interface [color = lightblue];
+        class host [color = salmon];
+
+        host [color="aquamarine", label="External Host"]
+
+        group {
+            orientation = portrait
+
+            group {
+                orientation = portrait
+
+                bmc-interface [class = "interface"]
+                npcm7xx-ipmi-kcs [class = "interface", stacked]
+
+                bmc-interface <- npcm7xx-ipmi-kcs [hstyle = generalization];
+            }
+
+            group {
+                orientation = portrait
+
+                bmc-host [class = "host"];
+                bmc-host-sim [class = "host"];
+                bmc-host-extern [class = "host"];
+
+                bmc-host <- bmc-host-sim [hstyle = generalization];
+                bmc-host <- bmc-host-extern [hstyle = generalization];
+            }
+
+            bmc-interface <-> bmc-host
+        }
+
+        bmc-host-extern <-> host [label="chardev"];
+    }
+
+IPMI Host
+---------
+
+Mirroring the main processor emulation, the interface devices delegate
+emulation of host behavior to a Host device that is a subclass of
+``ipmi-core``. This type of device is called a Host because that's what it
+looks like to the BMC guest software.
+
+The host behavior may be further delegated to an external emulator (e.g.
+another QEMU VM) through the ``ipmi-host-extern`` host implementation. This
+device has a required ``chardev`` property which specifies the communications
+channel to the external host and a required ``interface`` property which
+specifies the underlying IPMI interface. The wire format is the same as for
+``ipmi-bmc-extern``.
+
 Wire protocol
 =============
 
-- 
2.33.0.309.g3052b89438-goog


