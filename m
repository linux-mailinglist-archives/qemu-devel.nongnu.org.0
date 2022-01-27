Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C254C49E810
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:52:10 +0100 (CET)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD80H-0005Ps-RM
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:52:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1nD6vS-0000DH-Nw
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:43:10 -0500
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142]:22849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1nD6vP-0007h7-PA
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1643298183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oymZ3/Ow10YoheTCQoRnp50sCbp3qWaFIJhqLWEz4aw=;
 b=TD3DAMjxGsdz0w9Cv0FkrdVtpNYJBgEiO3jsg0EbUxvOvfcGFv0A0iUR
 muJz5r8wbDe83Obu5fZr9kF/yt9fwwFOX4z1eb6nq2+GJ646GsIeuf3J/
 VB4UdL3dvs/w5I/ObWmePCEUg/9r6Gm39pynjFa5RhVwt1ILeGVA67R7t I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: AQALnPXtu59be1MFubJ7C3HhMz7PGmN/WjnNW7h6F+CVMFRWvJQ/7ehj21PWjZdqo6PCUss1mR
 6cmUSK+o2hn0xB3gU/Y6BehbOvQK0m5+trHsKVCzsWlXYQ4vfCtBC66g93kYX9OuhePFTowwXX
 SpwhvpimfcI+D7zy4UExAbYRfBbS0eKzSTtPRUmLoHFh4W9By/X+wY7Ob47wNEfVKAUlAfvBhM
 TIAyTSM7tDaarUNJ0ftMctpVU4l14CH88qHSrRMzJiLmhMINTT90JiCC1rBkadMED2M9kWcwlM
 R8Qdl9MWVCVtl8zWF4kkE+AM
X-SBRS: 5.2
X-MesageID: 63313159
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sxzo2q7lgZFZvo5473w5OgxRtOrAchMFZxGqfqrLsTDasY5as4F+v
 mZLUDqBO66Ka2CgLdBzOo/n/EoB757Qn9ZgTwRr/i8yHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2NEw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 9tDtJ+SVloQD47JnM8YeANAKDxiFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQRq2HP
 JNEOFKDajz6TkNwZGUKB6lvp760vkfmVSJVuG2K8P9fD2/7k1UqjemF3MDuUt6DQ8lPj1ubj
 m3D9mX9RBodMbS30TeZ/2jqg+bekS7/XKoWFbux7Pksh0ecrkQKBRgLEFe2v/S9oki5Xd1ZN
 goT4CVGkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwFqDxKvXwRnEP1knSzpqbfc8rPQrWRV/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmtm
 2jikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsK4owGWxFADpU
 J04dy62tr1m4Xalz3TlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYImWyO
 BSN5FsMtfe/2UdGi4ctPepd7OxxlcDd+SnNDKiIPrKinLAvHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n5jdK2OSDEIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkX2zpsWkPHmOmWPSRHhXRUUG6Wfe8pwOKbXbc1M4QQnMyZb5mNscRmCspIwN/s+gw
 513chYwJIPXiSKVJAOURGpkbb+zD59zoWhiZX4nPEqy2mhlaoGqtf9Ne5wydLgh1epi0f8rE
 KVVJ5TeWqxCGmbd5jAQTZjht4g+Jh6lsh2DYni+az8lcp8+GwGQoo34fhHi/TUlBzassZdsu
 KWp0w7WGMJRRwlrAMvMRuioyle94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrtZsotfThK2Co4O4KMdEHxJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbiquMIzglgG3mXPV2nBqk5fyuD1MhL8KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+OvVWEpfCBCAlShBIeYnK4gi2
 +og5JYb5gHXZsDG6TpaYvS4L1ixE0E=
IronPort-HdrOrdr: A9a23:UbyXTKsrl+w8N0nBa3TLsilf7skDFNV00zEX/kB9WHVpm6uj9v
 xG/c506faasl4ssR0b8uxoW5PufZq/z/NICOAqVItKNzOLhILHFutf0bc=
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; d="scan'208";a="63313159"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Jason Andryuk
 <jandryuk@gmail.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 1/2] xen-hvm: Allow disabling buffer_io_timer
Date: Thu, 27 Jan 2022 15:42:45 +0000
Message-ID: <20220127154246.6281-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127154246.6281-1-anthony.perard@citrix.com>
References: <20220127154246.6281-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.142;
 envelope-from=anthony.perard@citrix.com; helo=esa1.hc3370-68.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

From: Jason Andryuk <jandryuk@gmail.com>

commit f37f29d31488 "xen: slightly simplify bufioreq handling" hard
coded setting req.count = 1 during initial field setup before the main
loop.  This missed a subtlety that an early exit from the loop when
there are no ioreqs to process, would have req.count == 0 for the return
value.  handle_buffered_io() would then remove state->buffered_io_timer.
Instead handle_buffered_iopage() is basically always returning true and
handle_buffered_io() always re-setting the timer.

Restore the disabling of the timer by introducing a new handled_ioreq
boolean and use as the return value.  The named variable will more
clearly show the intent of the code.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Message-Id: <20211210193434.75566-1-jandryuk@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/i386/xen/xen-hvm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 482be95415..cf8e500514 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1087,10 +1087,11 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
     }
 }
 
-static int handle_buffered_iopage(XenIOState *state)
+static bool handle_buffered_iopage(XenIOState *state)
 {
     buffered_iopage_t *buf_page = state->buffered_io_page;
     buf_ioreq_t *buf_req = NULL;
+    bool handled_ioreq = false;
     ioreq_t req;
     int qw;
 
@@ -1144,9 +1145,10 @@ static int handle_buffered_iopage(XenIOState *state)
         assert(!req.data_is_ptr);
 
         qatomic_add(&buf_page->read_pointer, qw + 1);
+        handled_ioreq = true;
     }
 
-    return req.count;
+    return handled_ioreq;
 }
 
 static void handle_buffered_io(void *opaque)
-- 
Anthony PERARD


