Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAD24439B4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:28:29 +0100 (CET)
Received: from localhost ([::1]:60930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3Ce-0000h9-S5
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mi36s-00069w-Ga; Tue, 02 Nov 2021 19:22:30 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:42217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mi36p-0006NE-Fi; Tue, 02 Nov 2021 19:22:29 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MN67J-1n0PTJ0TS9-00IzEu; Wed, 03
 Nov 2021 00:22:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] MAINTAINERS: Split HPPA TCG vs HPPA machines/hardware
Date: Wed,  3 Nov 2021 00:22:11 +0100
Message-Id: <20211102232212.2911638-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102232212.2911638-1-laurent@vivier.eu>
References: <20211102232212.2911638-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:inS8CtjNlwZN4cDbdUd+BAzLk/ume97wbLwIAFEWcghQpKR/sRq
 Fq7FaoWcOsL4wz7xbv7SvfrTghALc3lKNN1JKb1RHLg/Ao/zxMlhVLVudy6nCZdp85rGTCj
 fg+T4XjwFZqcWjWhIRkBmuHi5tuxryg8BeLj3J5InGA6wcXdWAtKOCN5BYjgHDKe4/FTvga
 mBaemwAZBthEC4ErkR7Aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rnQTg6SxeeI=:JQ3NXbmQH2XihSPKlQOkEX
 bqMpI1vhT2P8+pD4BCuCLCdnR9hLE3lTdN4ejg09BwsRbJqg0XZV/viY5fcB2JFQQAxhcFuHj
 OceuJOMJBIXSTH6JyPSmCQfPMFaC/GPN5CTD0V05YNPA9Xc/3a279RCnNeYs7UGCfPH9nImLB
 AhGch1XgifKqudBCwltMEd275KuQxkNZoCeTtKAP9hRhGjRcMhda5UDLtoS2pYLxL1jzM5UOm
 KXF6cXt4zq3mTzaafCO0oziTNQhRg/zU4eQiwppsWWQ/bppZRY8NE8QqloSMPidSggva85Yi1
 FMn4ova2UqO7Ro2eYan0BNdNsU5sXQBCGpm/QrWgCvpDeLeAYhl3W86TwX49xiJbTIdPc7YrF
 gw2eJzDS1Es0fQBEBPZD0xtbX0wbaVzow/7aX9VuupOpt15JHv3opazFx684MLUsNnAnkFj5D
 ktUVL461XpaTSkLTUD15DCvZhZGws10HJ5nsAykcg9YEu8HXObkY6188ozTz2ItJn4UZAdl2V
 9N3c2ovBoqcLUsqOZkxoRJdf2aOUmcUVCEKteVe3i1tGC6uczeKax3uAf2mZAm/yBujft63RA
 Fz2vm0kYRLK/BaCPeSY6Ue2IPNfG4uk2l9hCG1I5kATqx2pKCeOIUquub+iryW13HQj6tEah2
 RJs+o4AsJnWXRuzhANlGAXoJeXOHwtfJTXUJsfQcE9bpwCtEhYtgWOyX/sFoOWoPXkBg=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Hardware emulated models don't belong to the TCG MAINTAINERS
section. Move them to the 'HP-PARISC Machines' section.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Helge Deller <deller@gmx.de>
Message-Id: <20211004083835.3802961-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 894dc4310526..6f2b20078032 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -205,10 +205,7 @@ HPPA (PA-RISC) TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 F: target/hppa/
-F: hw/hppa/
 F: disas/hppa.c
-F: hw/net/*i82596*
-F: include/hw/net/lasi_82596.h
 
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
@@ -1099,6 +1096,8 @@ R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
 F: configs/devices/hppa-softmmu/default.mak
 F: hw/hppa/
+F: hw/net/*i82596*
+F: include/hw/net/lasi_82596.h
 F: pc-bios/hppa-firmware.img
 
 M68K Machines
-- 
2.31.1


