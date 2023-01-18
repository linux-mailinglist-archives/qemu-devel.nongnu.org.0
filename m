Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552867157F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:54:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Fp-00023m-Lv; Wed, 18 Jan 2023 02:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3Fj-000217-5P; Wed, 18 Jan 2023 02:52:59 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3Fh-00027b-AD; Wed, 18 Jan 2023 02:52:58 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mn2iP-1opYOe01NH-00k7WC; Wed, 18
 Jan 2023 08:52:47 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 15/15] hw/ssi/sifive_spi.c: spelling: reigster
Date: Wed, 18 Jan 2023 08:52:34 +0100
Message-Id: <20230118075234.2322131-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8IOtGP+vbaAePoN+OxJvGgl45idpuCXX94Db5P6rqRcAyCnfeGA
 HQb46dKtNSq+JAIvI1i7vuUr6X3W+pUB638G0ZcTvtAwDPjFvHXHVcdQghkrZcDVNsaHCp8
 /26XztZfxhcIAlSQ+rUBV0+x6KdzjiNbiK5QVwlbu9nYnUGdiEDS36XbvNurm/hi1aQRT8c
 j8gO0CxDWsOvktg47Y/ag==
UI-OutboundReport: notjunk:1;M01:P0:A0qiVFCfwFg=;MVraoifNtVXaX/xqa4I3dia3XPv
 37IBxJtiDYlkpacwMN7424GgnRPyEiIZodZQYncAhAn7Caro6HEEsAHPIZwO3BdkEF0zAyzfs
 +ZfKd9CO6uH1ppRoZYz7HfyQY/3gRHcxTfTlVE9QNYHKA0jOz6i69bEdYdmtFxlW7ZJjMTAyb
 1wpmpqCy1hxWAMbyeLLYAUiBi+MSkPrIoVNKGX70GHMKCE/A921ssJfX3peXCS2t+K5CbstSy
 Ez6RAvR36Hjcva9Nd5ZpBTijgGvk/lgrH3NpcP7nU6Sjv+VmrrjAYGYXImQ8nclJGOIXVuYu3
 xPMDi8YjrFli+GilPsyatmaIwSv3fhG1dUKhRVUKJme8GPUwZsCxzRcwP5s3jB4MDj2IsHo2N
 hoGk88pPgY+q1Psye4Cz+Vp7b2J1I5a2jYCiLsqCcrrApyKoOrqczWSxW+5RNG2tA+UfxYqIv
 /aKJlXD/5tu5+HnybEJbKRwl2Vw5+deQN1fLLi2cGWBVBat3Xy/S7/GljvgbM9mKe9jdWZ7sJ
 85E34fga9DSZuKA4JCdkpWiDrZhFhunqgaOo0+N1jmLndXGerzQQr2SwK8sgAfTIe35yuDrN6
 TrcUCKkh/miqFJ3MxTe2f0ptXMuHIUksvXrJ7+r0ImtpiY0romlONmNV3JwoNOeDvk9C+VcZ4
 kAdAQB5learGuB/EWbij0vujUyiymKS4JyKjPYmxag==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michael Tokarev <mjt@tls.msk.ru>

Fixes: 0694dabe9763847f3010b54ab3ec7d367d2f0ff0
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Message-Id: <20221105115329.306527-1-mjt@msgid.tls.msk.ru>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/ssi/sifive_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/sifive_spi.c b/hw/ssi/sifive_spi.c
index 03540cf5ca66..1b4a401ca18a 100644
--- a/hw/ssi/sifive_spi.c
+++ b/hw/ssi/sifive_spi.c
@@ -267,7 +267,7 @@ static void sifive_spi_write(void *opaque, hwaddr addr,
     case R_RXDATA:
     case R_IP:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid write to read-only reigster 0x%"
+                      "%s: invalid write to read-only register 0x%"
                       HWADDR_PRIx " with 0x%x\n", __func__, addr << 2, value);
         break;
 
-- 
2.38.1


