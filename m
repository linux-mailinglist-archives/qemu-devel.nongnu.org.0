Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF23E41C1F4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:47:36 +0200 (CEST)
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWBb-0002dg-SR
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtT-0001ou-AY
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:51 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:33041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtR-0005jC-MD
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:51 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MaIrN-1mHVer3cvd-00WGFa; Wed, 29
 Sep 2021 11:28:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/20] nubus: add comment indicating reference documents
Date: Wed, 29 Sep 2021 11:28:24 +0200
Message-Id: <20210929092843.2686234-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fe1X3G9jb9xFYa04BvNzVbHiIU2YtVenE6Ax2PczgEcfVO+Pjpa
 w1KN5MmUTvYRQAFRHkDWy1BsVI5Crji6y7cBUTMKaVFGiKXggJAvKaYet55vlntrTCrB8Z3
 Ulft5KL2L7Tt4zC28QNZkneytLpYZDXWwarKd1XVmqDg5kMY9s6ieriRk4fG7C3NiH+9eA1
 G0O24IvOKW7PP+JLMBD2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1W1C5T37d6c=:y4ZJXRlV9l+cEnqolRFJn0
 8hO3WxKgxgo25E2p1fv5g8fKty+ZLBukDkdT7k44Lsi+AjGgaP+neUhFH7s06o6vQAm3dE1WN
 6mjWC5Nioox/HKLH9ceYPmXSQpLHWGfM+YziEu197JtygFe711szSWykRhgUaPdVYVpnsARJL
 P/LTvAglvC1bPLaKJwVY+zdF9h9mPG5Q2mNExV3tZaOP3p5q2EBLY5BxfxkuXEaBKift1YtP9
 il5MBvQoGSQz6oNMxsGJoZ/vjLAKqIqE3rV5pTJqXaTEJpn5dqAQ0VXEtzHVF/m87kihEbJbg
 4lpbJSmCRIJgh0LQJITq+Y2BtWYbjg3NlK3/gRQJoWB5BgdZJXdNT7HXUNN0pcqK1pEYvMfLI
 lB0jukwIzvrtot45h3w6qrGBtDmjEm2qK0cEUOaqTudJ3syv+tnYAc42++5YGVsiSWTwBN+NB
 R9MY51oVFzE8yHcnNCizywo/Os3on8N5xCFpkkg3JwvQu+swut3NGLqcTLMYWmkDqy4kJKcsV
 U/YUYetejS2zCayL40fHgqUcOwRU29uJCRApqJILIUOcRIRLTPCwljegL4gOn9V3AW4RLLhD1
 BTsgTd7JhQNs71tcebh3ivmmX/EONU5eFHbG7QL2XIMTMXTTLnf8iO4hNodP/JrC7QaF1QQuN
 phB260TdLSKsmJig6jYk7kgtKbi3sIc55m9yu8nchavigeZjD8ob2WpU8trLe2mtw84z+DLQs
 U0xpXOFWdTV2u1HDerL6x5+JqjQL774Q4N608A==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nubus/nubus-bus.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 5c134523082e..f4410803fffe 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -8,6 +8,14 @@
  *
  */
 
+/*
+ * References:
+ *   Nubus Specification (TI)
+ *     http://www.bitsavers.org/pdf/ti/nubus/2242825-0001_NuBus_Spec1983.pdf
+ *
+ *   Designing Cards and Drivers for the Macintosh Family (Apple)
+ */
+
 #include "qemu/osdep.h"
 #include "hw/nubus/nubus.h"
 #include "qapi/error.h"
-- 
2.31.1


