Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8542D403C9C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:37:32 +0200 (CEST)
Received: from localhost ([::1]:54248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzdj-0006Lx-IW
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbs-0003g8-0z
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:36 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:33585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbp-0003nJ-0V
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:35 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M4Je5-1mOGiw16vZ-000OGc; Wed, 08
 Sep 2021 17:35:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/12] mac_via: move last_b variable into q800 VIA1
 VMStateDescription
Date: Wed,  8 Sep 2021 17:35:19 +0200
Message-Id: <20210908153529.453843-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908153529.453843-1-laurent@vivier.eu>
References: <20210908153529.453843-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xF590kpOC70RrIoDYCLhq6mtLt4v24IoTz3hRlqBHDI5ie6/JNL
 SgsVecf23ykYl/tyMGeUALN8Zl+KmGxowr6r5dt8wQt6zVDYgfeOkyGdWwWV3/1HOqGHrUK
 XXN3NiCg5szm9T29CD1pM9TihDRo2bZME4/yuSuwbHkSZpR2ESvGJtzPLIbwSm9rGuL3/UH
 v4RAhaeXINQyQU4nlnc1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mfpwD8it+Ks=:BF3BLLoWjgQP2fb1Ur3Zdl
 8S99euW31qkJxbe5GTdB706+mgKSD8DKypmLDM4CuLorfDRhBTdI/ZKmrv3IhVKtpl519S6v+
 cW9t1EHiwPGcTZRchCv49f8Gq6OXKRTIbjy/pJaYzlBJA4mzRYHKio/HPb6XUCSsc/jwR3+QM
 KLM6hJmFViHhB+2u6Xh1IeoekVGa721SzptIlAdF4wUY0e90ffY2VSVzwkp4WqZRLt4KyeGxg
 3j+OiF3LVF7CwPQPVsMYX3VQOERAXfGja9sWzsyZmsgT0DSX1yj3aSRGUMZtfWrLizAnYV7/i
 iewAcwMqDjYJATJJgDl9VjDunfVSWtuKWzp4mmQPKQJk1B4+U3/9zbgXVR987ZiwKnjcK4kqL
 omKmh0WeeETKiMuW2W1LhHciomtQYiE9Rq9MeDXquBGxhJGxeZQDCvch/2hoyt0pOjED/Gq9k
 ddfFyeZJE3P74T7JLavBd0QwwF8OU4tthnmI3A1sk+HaxWFBkA8qllLjCRYqrykeg4gZnhb72
 Kiesn56uvurUi/isYv9JVX94TefPfxK8VVFgvwWC38CDfW3CAGCOKrrSpRbVT+4PidGbSISKu
 Kv0I1z48tLhMdhDSlEzgfda54iAYRKZWJT+wzA+6VXS+SlSjdFjXl186YzclUnrNdKR0/gbi/
 DMP1CpRHeOWK+Vld3moGeGaIwcOWkGqPZYS1rpwhxaBulACnVIGBZw0U6Sme3oP9nvNjbZxlC
 g4WOhC5tExUX/bRAU4Q6rH7oF3ijANO34MNZoQ==
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This variable is already present in MOS6522Q800VIA1State and can be moved
immediately into the q800 VIA1 VMStateDescription.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210830102447.10806-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 46e65058e029..6fb0b9391d92 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1083,7 +1083,6 @@ static const VMStateDescription vmstate_mac_via = {
     .post_load = mac_via_post_load,
     .fields = (VMStateField[]) {
         /* VIAs */
-        VMSTATE_UINT8(mos6522_via1.last_b, MacVIAState),
         VMSTATE_BUFFER(mos6522_via1.PRAM, MacVIAState),
         VMSTATE_TIMER_PTR(mos6522_via1.one_second_timer, MacVIAState),
         VMSTATE_INT64(mos6522_via1.next_second, MacVIAState),
@@ -1159,6 +1158,7 @@ static const VMStateDescription vmstate_q800_via1 = {
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(parent_obj, MOS6522Q800VIA1State, 0, vmstate_mos6522,
                        MOS6522State),
+        VMSTATE_UINT8(last_b, MOS6522Q800VIA1State),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.31.1


