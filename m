Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F35533B06
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 12:56:01 +0200 (CEST)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntogK-0001pr-TI
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 06:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoS1-0005pV-4o
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:13 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRz-0002GA-Fv
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:12 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MXpQA-1oLR441HY4-00Y8qu; Wed, 25
 May 2022 12:41:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 3/8] linux-user/elfload: Remove pointless non-const
 CPUArchState cast
Date: Wed, 25 May 2022 12:40:52 +0200
Message-Id: <20220525104057.543354-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525104057.543354-1-laurent@vivier.eu>
References: <20220525104057.543354-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bM+WLcsGlPlls6hjfH/3Osg94oevRBi2qkgbU/olCcYs5YRXl2+
 YTOkXx7Qf+79cim4ll+0Q7zMC2J/FsEp5+kE76abf/1DrysjW0o0fRHMX/JQWrQbnLLOCza
 hqfe9vRw4eSEIiUa9zpF4vrH1NGe4C8ma37Sy4AHL+KwsiuhJa2OqDS3Oab62s2XM9Tb0Ep
 FhO7Wrv0/VPYkFZ0Rp27g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:czYOaR77KBo=:9hA3B5tyWZBuLLvyjikYhq
 GufDfNbQavHkNC9XUnPFFpmu+w62/T2aXCzQKfUYLUkrSU3d5cH/eCqSGEInw21FSZldPfbU+
 gRf1adN5iZ+4pw0TwqKaOYRIJd2tvoPrJ8xPOvURlfFnyc24bv6PdzG4QLSfmW5gGqj6gDTgS
 WaUBjUgFKpnYoqnYNbg1k1iHmfmXn3ue+ODnJEY0xePlUnVy1Fu2ICA7bpwT9Q3YyGC7IVt7g
 zjEdtN9lGRM8NO2tTa8VRVkIMmzgyYir81gk7vVnaO/WUVI7Vy+EL7hw6qphH/sEh9RgPBKTJ
 PaRxQu8hFe46DKr3xibcbLG1XU7mrv6WBARmLQV7En2VAOpDuu8XJiUTaz3KPaJTX8lR28xoF
 giRzViXPzOKUWx11KdvVvSzx1urwONCminN4CJYneNE8p4pd1pssoze3O8jgALDhtTWSvey4i
 RyQUHxzA1SwtKWtDab3PbK+z2EjjdUg/deKSmc9Ha/P3maRPao5dNmg+xGe9B9g180XISj7sL
 VuDh1lEOZlchbv3YJ+/TuURmTP7aALWyyE5HjOqUntD2+0998AVSUNawCYVAMHNIY4ifAkmAK
 mVQRKTLg5ppChO2nvrbA73RMrEShZBfCOfh6TwTumr7UOyOBHIUF5CO2W9fdb+WquJxm24ztI
 nHzIbx4OHXKxrDRv2Wjf9/VB5AbOIt3tG3R5UQ8BZlIbF2lIgfgFr6ClcWoPa7edT9wFLNDbz
 9QtyFEg76eysVD9zJP+435kPK2AvfWZ6HmMx8Q==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

fill_thread_info() takes a pointer to const.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220509205728.51912-2-philippe.mathieu.daude@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 8c0765dd4b12..acc21748f993 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3973,7 +3973,7 @@ static int fill_note_info(struct elf_note_info *info,
         if (cpu == thread_cpu) {
             continue;
         }
-        fill_thread_info(info, (CPUArchState *)cpu->env_ptr);
+        fill_thread_info(info, cpu->env_ptr);
     }
     cpu_list_unlock();
 
-- 
2.36.1


