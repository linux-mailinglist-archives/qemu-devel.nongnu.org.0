Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD155F9D8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:00:05 +0200 (CEST)
Received: from localhost ([::1]:52636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ScF-0003n9-Sz
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1o6SZp-0002OD-Uv
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 03:57:33 -0400
Received: from sonic316-8.consmr.mail.gq1.yahoo.com ([98.137.69.32]:37958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1o6SZm-0002Mj-Rt
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 03:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1656489447; bh=E/3phgmr2on8518X6t5OCFyE0KA8ET1fzccg5b4q+lc=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=JEoGeVX+4RCazZkzR7rbzC90ELap/QvDOSJaDl2MFhbEW19ax8xuZ/H4p1GSSuT3GYdOxmoMsMHGmF0t0Hjh3MjBKjz4zGSYqO3MYMUt75Fz5ET9MHO1QSgGpGESFGZaI9o6DmUmkG2EcU0rb65Q+rHqvEuUdJ8n3g3lV+Bnuphuh86CYSe18fVSdqGcAqdYUq7qkgJbeSwMsyLwm4ZtLVVH26WX27yOL6xsptT92FYslEoi5xzMqA1hjKFRfAi0VtbmTAIBXQHTP5O8FqBCGyA9EA7JeWbojkN2FK7VmwAzixgMbU/8FeCfrwCjPBWz1tI5ZIcHdiMbvzS+0oAHeQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1656489447; bh=9xmbxlEBcekFxb9avc6m12xqUTk4rsQ5ESiPwqvGtL6=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=fV+GZyF/loXcp4VCRrrzyWF9hT4TCpaa2/fqM5xGBCCfS7DFujrJj03v7ycTqIZ13ivycmuYkXu3snjBWK2cXCB7B1q4DNhBSbL8hzR9y4R0rjrMFktkIt5gmwnqdMmd+t/Uwg0mzSXaNrSW1BKq9CpBtZK8UF1A4p7j85ZS+nWXPJh9Kqt9SRrZ1pESNDzfsn23bQjAwUBQMBZWoOmC5XsUCGiZNIo4GGg/FwzFwHacjIf1ASuuL6mbB/DQLSdrJuM+QN8LuB319L7JzCnv6j+SK/5KVaCxmz1dTqM9ViNfOsRltHptuGs80dU7ChEo9Ai0wMrzgE0sBGDxfel++w==
X-YMail-OSG: P1ITJT8VM1kOD6BJFWPGuO3YiZ36oJ0J50fInCaW3vIscfhBkNSOciRrz7Tk0xn
 3jroEq0ouCQAm4aC6_5QA49v8nWBzwmv4f3XrNKBGKHsAFpvlYG8xteXLtaR4nX2s5b9AtZZygI7
 jZYmLeBnPOy22i7ngQScoqUYnwksqC7x1RfmL4Dt1owOJWMDqqzsYJc.48iO07k_pqmQJHi77ANk
 GIvnLhem_4BQoMwxiEIwNpjEaP6rKKbvfDsZ5aq0GGFJjzLuU9S5SAPw2L49Oq7fxQGnEu2ELp1Q
 LUSduyifKJO10_on9u9tsuidVKgWBtsFUymL3RI_c9q55EgwaCFDVAJqkMyHQRzsFhENVB2A3lL_
 MqUVgYiZGczimyj5YMlQgK_YtKVK1O6I8mKT6RFwjJCXWbYdkgPt7FUPJlYeM.wIUZJcaDaaJy8i
 w19lnxQVAu3jaUhNWESq8YvSSv.k0Uo5q4eX7FdJ84UBpJmlQ84gMrcsvsahodAtg735sga6.HpN
 JgWLCf31PZNHFNrlSctxsBNb3qw7hWYl_DTiv0N6jKGVks8iNvk9Lg0UCxytkdraK.sVwchh0qAP
 IoNE1qxplpvQCRPywPX_V3cOKbkPNe4MRmSq2qmTiIGjIt36c4LoH_FNkhW4rmCrTWEyiTdV8x63
 D_nuQkHoxq686h1TLaerv0PMex6.7iDEPtl4WSf9iuTs0XlZ5xECQd_BMgW_GLIPbwFQnqFghf9q
 CfmvA.VuDeTztfBYnBSAiD531Hs67.QV4KqLggUuRBXlh1V6llR0ahvlHWN8biuv_Ts46jfJ_UBO
 rHHvHhIOpoWI4Q7zeeWHIsHp6pgjuOIRKpch.hXG.w3l8HSUMGF2hVi.0z_8g.bU_oGbgCL6OTc9
 gSbW3nRwDyIvMl3ihMz_NAKCmGpIRC3.KjsKzcBdjaGz2Qo7rMayQ98GUGudkbGA_KSp6ldCZVa3
 dj.IwAeN6jyrhuSYIY7WBCZXzYQCsdA56fPUUYTcgOYIzwvmp2bpcb4aD7.8_QWSHG9d4.0FHh9n
 Vs3aaHfSsDvbqC5129NVdCkLIDfAXmR0xpbW2bU_3GKvmn6NP7PDX_82CzU2KWV6gsEIoxDcLWfX
 1ul9ipFQ.7w4HjNGk7icoWywsGhkBHETCjYgvhcN7GK_nM8.bMg.PWCMXIYsam2UaFFDjhfu4n3y
 uHwJvuMLLY0svWBO2vzGu2Vi6a3l8NLDSGdePThadoqr_EaR3aWF8mdat1Ta5rPn4iN2xY8HW2TV
 phk9S4MBWHDddb3lv_.TraN5r3esj9nV32BzYoPVe61D27LASBWS4JDHIvNQia9c4dOnpreLlKPF
 lgW_S90W411cJkVfo4M6kFDfc.PMBrx_FHy4vbwnpkT9_5YNrO_ulajYJi5D2W_6GtON3NRUyqhu
 vBdA2bqrORb6fFex4x4kuLwj7X.Ae3TLYzf6lp_efT5RLI.LHRLM0YINiG_l7X1o4bMuNUVNGhqv
 YYZe69dHQULRPoRlbosU.IAamY7m7sBfkMtcpy_LDHZjBa8wEmcG.zdZxrrAsZ_DFSwQByNemc.b
 M6VquFrZZ2jGUp2nC8QnZhoQKeLt19VH4GsLZjpwddBtB4H8rj8pjJb_i2qyoL0R97vC5fEtb3B1
 De0iwUdfLom8cOG7geMdxQBVK7cUUJNYhQR6ekHaRFFT7jO1PdWu0mExWzf7WO9AX1vtICrERUXL
 2HhKa7RZ.ak4nDPp17fQut8BNY9aQINAwwVamEGuEe1aYTKLFXkN.G0IOhTTUoKIwFRqoYAl8yZt
 5F0G1fOZKq9L5Nj1O96aFm5AfoXwxSWpJJ6i67DHF2TTCHfZJF1vfUx1AI8w2gf7rXKwBkIPe9fA
 pZSluNYFU6s5WX41RdIGM9zpRJ3lfdoEpBtEZvRGMjQhfHDeqPz7bVtOmgXyj5ba.dUQpuHJ0nOO
 hJp8qnyh4WGrdQS.ZpNiulwtfpdzWfapAJJJByWbejUArCRptwSiYQKnG4PVLkOC2Itic_vdf42C
 V_am5cD.lGFxCFgYUqFuRK1grhV51uljmr.4k0GsRfRhkvu2jjqG3fNe9gWiq3u3WchvvH2uWTDO
 UkUKp_iaYegSNv_WbAZjmlmWhA13oI5qUI56CSktIp_QmXy1ywbeNOkjelKYPl_tDukjDBGGOxT6
 e.eS7ucjefi_pI8E43hfJnDzcKxJzL8CUirVr9eZ4BxUxHzHXMgcAPYepTt4wi4VsyIvS6aBjELV
 PNdDK
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 29 Jun 2022 07:57:27 +0000
Received: by hermes--production-bf1-58957fb66f-xc7t4 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 54da85cd042d010097af8a7b4a3a105a; 
 Wed, 29 Jun 2022 07:57:22 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 qemu-stable@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH v4] xen/pass-through: merge emulated bits correctly
Date: Wed, 29 Jun 2022 03:57:12 -0400
Message-Id: <5cd07587898cac43bf4b7a52489c380a44cab652.1656480662.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <5cd07587898cac43bf4b7a52489c380a44cab652.1656480662.git.brchuckz.ref@aol.com>
Received-SPF: pass client-ip=98.137.69.32; envelope-from=brchuckz@aim.com;
 helo=sonic316-8.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

In xen_pt_config_reg_init(), there is an error in the merging of the
emulated data with the host value. With the current Qemu, instead of
merging the emulated bits with the host bits as defined by emu_mask,
the emulated bits are merged with the host bits as defined by the
inverse of emu_mask. In some cases, depending on the data in the
registers on the host, the way the registers are setup, and the
initial values of the emulated bits, the end result will be that
the register is initialized with the wrong value.

To correct this error, use the XEN_PT_MERGE_VALUE macro to help ensure
the merge is done correctly.

This correction is needed to resolve Qemu project issue #1061, which
describes the failure of Xen HVM Linux guests to boot in certain
configurations with passed through PCI devices, that is, when this error
disables instead of enables the PCI_STATUS_CAP_LIST bit of the
PCI_STATUS register of a passed through PCI device, which in turn
disables the MSI-X capability of the device in Linux guests with the end
result being that the Linux guest never completes the boot process.

Fixes: 2e87512eccf3 ("xen/pt: Sync up the dev.config and data values")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1061
Buglink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=988333

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
v2: Edit the commit message to more accurately describe the cause
of the error.

v3: * Add Reviewed-By: Anthony Perard <anthony.perard@citrix.com>
    * Add qemu-stable@nongnu.org to recipients to indicate the patch
      may be suitable for backport to Qemu stable

v4: * Add Fixed commit subject to Fixes: 2e87512eccf3

Thank you, Anthony, for taking the time to review this patch.

Sorry for the extra noise with v4 (I thought the Fixed commit subject
would be automatically added).

 hw/xen/xen_pt_config_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index cad4aeba84..21839a3c98 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1966,10 +1966,10 @@ static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
         if ((data & host_mask) != (val & host_mask)) {
             uint32_t new_val;
 
-            /* Mask out host (including past size). */
-            new_val = val & host_mask;
-            /* Merge emulated ones (excluding the non-emulated ones). */
-            new_val |= data & host_mask;
+            /* Merge the emulated bits (data) with the host bits (val)
+             * and mask out the bits past size to enable restoration
+             * of the proper value for logging below. */
+            new_val = XEN_PT_MERGE_VALUE(val, data, host_mask) & size_mask;
             /* Leave intact host and emulated values past the size - even though
              * we do not care as we write per reg->size granularity, but for the
              * logging below lets have the proper value. */
-- 
2.36.1


