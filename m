Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF76A43C9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:09:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe7K-0002ow-TE; Mon, 27 Feb 2023 09:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7I-0002bO-CK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:36 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7G-0007zp-NT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:36 -0500
Received: by mail-wr1-x430.google.com with SMTP id t15so6342858wrz.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L/MEORMaWwsIW0OPJMEmwpwT73YawX+aPFL1yN3FA/c=;
 b=KSl5dTDth1soWlS4XeTFdFL85g1ju4W2aYC8sabeYe/GgRaoKE5e8XmkB8AVGYrYaI
 MvaEnmz/q24gU3gLAF340V5+sU7bc5ioU8X7adzLGk4YEx0mgYalyMrV+EDZZS9GNg/m
 usjJDtZTlSs+GP7EQMK6wDyLxlFSzAigF8sSv6Pt8RA7cb2lyhNCt0jVgCJnvexFa38N
 iDmf8/+WESScK+mxO6uLmdPstuz9rQPPowUvdDyiZM9aG4va7niUhpiZg/irCxDidsZC
 IxsC76yvGwNur2U9aYkD2LGL6/sMqwPYzBVicC25caK4qzxC5W9aPAdHqv6/jraNXYNJ
 6U+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/MEORMaWwsIW0OPJMEmwpwT73YawX+aPFL1yN3FA/c=;
 b=Z+WP+/oYp2iqwRVlBJInAyKVvY+WtoIYjD4KxQWih+zpux61tGOt5aXM0ksSc2iy9w
 btPmEZROLVHPI+R4Cfujg+2+R1wB9Qyl3w6RkbCkcqMDUnsnb9FD9c/M3QqhWixFYZ9a
 Mw4oAboGlFhuzfjOSMw2KGpUUI/PBBldhA3NR9gJ3+zD/jdGlEmbP2DmR2q02f95IpRN
 /KEXAsDRpemKdUvufwriLI1O3zUPDPdy5lV0MJ3+mxeWRO7xlMKNZIsR1/vyDbKyEByh
 8xozLYTOJn6Zrkh4lZs61jzJTPZumWF7wqSCBTNR3KuMWdA9p33khj37xLUt0eVPq8LW
 tVuQ==
X-Gm-Message-State: AO0yUKWq18hK/C4gWynU6RJqO138Xm6yc7DN/e7kL4Go93zoAr5RZc84
 tJV0OJ8xQpS+Ot6JxP+8kDRQJz68dKsOkg6x
X-Google-Smtp-Source: AK7set9VEgms6yx2v/agfcx+f9m7iqvXOaT7C1DrRWbQ9OecnWoB0B+Se4kpb1X0rT0JsX1Dt88bhg==
X-Received: by 2002:a5d:4a50:0:b0:2c8:d399:1645 with SMTP id
 v16-20020a5d4a50000000b002c8d3991645mr6711073wrs.37.1677506672838; 
 Mon, 27 Feb 2023 06:04:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a0560001b0300b002c70e60abd4sm7282177wrz.2.2023.02.27.06.04.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:04:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 035/126] qemu/typedefs: Sort in case-insensitive alphabetical
 order (again)
Date: Mon, 27 Feb 2023 15:00:42 +0100
Message-Id: <20230227140213.35084-26-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Following the recommendation added in commit a98c370c46
("typedefs: (Re-)sort entries alphabetically"), and similarly
to commit 64baadc272 ("Sort include/qemu/typedefs.h"), sort
again the type definitions (in case-insensitive alphabetical
order, using 'sort --ignore-case').

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230217141832.24777-2-philmd@linaro.org>
---
 include/qemu/typedefs.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index c7c8a85315..df4b55ac65 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -49,6 +49,7 @@ typedef struct DeviceState DeviceState;
 typedef struct DirtyBitmapSnapshot DirtyBitmapSnapshot;
 typedef struct DisplayChangeListener DisplayChangeListener;
 typedef struct DriveInfo DriveInfo;
+typedef struct DumpState DumpState;
 typedef struct Error Error;
 typedef struct EventNotifier EventNotifier;
 typedef struct FlatView FlatView;
@@ -56,6 +57,7 @@ typedef struct FWCfgEntry FWCfgEntry;
 typedef struct FWCfgIoState FWCfgIoState;
 typedef struct FWCfgMemState FWCfgMemState;
 typedef struct FWCfgState FWCfgState;
+typedef struct GraphicHwOps GraphicHwOps;
 typedef struct HostMemoryBackend HostMemoryBackend;
 typedef struct I2CBus I2CBus;
 typedef struct I2SCodec I2SCodec;
@@ -90,10 +92,10 @@ typedef struct PCIDevice PCIDevice;
 typedef struct PCIEAERErr PCIEAERErr;
 typedef struct PCIEAERLog PCIEAERLog;
 typedef struct PCIEAERMsg PCIEAERMsg;
-typedef struct PCIESriovPF PCIESriovPF;
-typedef struct PCIESriovVF PCIESriovVF;
 typedef struct PCIEPort PCIEPort;
 typedef struct PCIESlot PCIESlot;
+typedef struct PCIESriovPF PCIESriovPF;
+typedef struct PCIESriovVF PCIESriovVF;
 typedef struct PCIExpressDevice PCIExpressDevice;
 typedef struct PCIExpressHost PCIExpressHost;
 typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
@@ -106,6 +108,7 @@ typedef struct QBool QBool;
 typedef struct QDict QDict;
 typedef struct QEMUBH QEMUBH;
 typedef struct QemuConsole QemuConsole;
+typedef struct QEMUCursor QEMUCursor;
 typedef struct QEMUFile QEMUFile;
 typedef struct QemuLockable QemuLockable;
 typedef struct QemuMutex QemuMutex;
@@ -132,9 +135,6 @@ typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef struct VMChangeStateEntry VMChangeStateEntry;
 typedef struct VMStateDescription VMStateDescription;
-typedef struct DumpState DumpState;
-typedef struct GraphicHwOps GraphicHwOps;
-typedef struct QEMUCursor QEMUCursor;
 
 /*
  * Pointer types
-- 
2.38.1


