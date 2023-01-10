Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73F1663A06
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:32:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF97a-0007Sb-WF; Tue, 10 Jan 2023 02:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pF97Y-0007R0-Cp
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:32:32 -0500
Received: from sonic314-21.consmr.mail.gq1.yahoo.com ([98.137.69.84])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pF97V-0007Dm-RB
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1673335946; bh=MlYqfxn4vwPKUpewBFfsPqn045LoqxLP6nhibRvkmMQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=E/1qai2PiOIqbUTF+XBOHFQuXUBMbVzW1ho8Ij2gjZ27xRD1dwjXCtNrNQ4E0unkmGIUM3s8WmahRg0TmTsyf4yQMF2t1SpFRc3gh5fUOS6Mijgvqp4JcPgWC/3Uw/0puNm2BNIrF26KL/OwkwKFiwnWU29U9Or0WK1uj75QiHplwK8ho9cMZiFmmi5Jko0yavTTPJa3jHOY3KFr5sZoyLo2LY4CH4jllmRO0630p210u+u2NSTbj7atbAJAM0dseG9/9MGkWMRqwYhC37K4NB7tUvweCDC/cKsQ5Kif53rXB/aQIV5VV+B+iidUvyby/jUEV/l3ysCP3mMmsbaf3Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1673335946; bh=LQMlvZQo4JgVkUeUOy2EtUHA3/Ts7yg0JQfMLc1ODBG=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=beDqLG/dZStPkhBKkGVBGhI6zDoDXQyqQKA8cmNBIWiB9Omm6MFO/BIE63xINC/+2lowa2lyXFhXBVaR9pvEm45TmpGaZJlgdonwD4LggH3kdzy+ji5+M+keoV0WS0ABPIX3YR79EUq4M+Y//skWtGKY+WDiaQfImZMkUhYE4/u9U+GJImKG+0gCm8RpdraoON62pKwrfgm9j/rf/roST/Z5BypVOR2kuzaxeIaMjglqaZyoHifWYf68zNB9bDvbSSI0I4wUVy3aWM6BFF6/TRRvbX7PlMQHDv/7KJRS90ZR1J8IaSW4k+ns0Qo6uTw9NqRDtQ+3rdYPTkZ3mQjQMA==
X-YMail-OSG: NoXoiVwVM1kCuc.PBP0ELv0IIHyBv1HK6yJ2Lb_Fz4clgpQN0YG76Zddmac7_wE
 gpkPS9B_wOnXL8pAzvaCN.zNUKJP8cB6x0aW9l1HF1isRiT8qqQnue2kFc_lRJ5mTteg.y48E9Aq
 GYBT29zIY7VV7kW1o32BWktJpw7WeCla6YHPvbgh.2Nn5ZM0GDr3ndaVJmE0vWlHLJrgfcuYv0.L
 HsU2SKoU400M5oJFNdlYhMHTyroMhWjsnYeHbM1sct8bahMzUkcyaYAZmUdYkwukPMo0svsgg6AS
 RUbq_sWRLmRSixhUP1MwuIzniBITSnImNcyCbtt_roM9ghP3bStEolgGKXTZvpztFPMo8UOaXM7Y
 E.5StQWhJzLDg8Oip0zZG6bH3XJ8j3ECh07NkVAjkuDxR72Nt4KkTXrd2YypaW4N5lzi5uMr5F3a
 OoZy7Qn.PZHHdPX_6vq6mnRz1tNe05lm8TBU.OcUCnonIpaztC8aXIHKgmIQA2Xiw8iVQLNtM9C2
 28zX41nMJXB.JNbPJ94Q6YGq.D_U5HyBArYs63x8M3FyIohVkSiAbWJrQ4jEzO.cb.UESZM5LfrX
 alBUsclrwrmJRV1LvSJwVyglIhmMrt04YUF0LOcdtGrvX9cdqGFO4QuTVjdBTcXn7RgstJjwVfSB
 kiJd7r6a2lWUDfgar6s7YVYwHJ0pk20R0zeVUnuwTcQsI7rSu4xS0VL2JI00vpPXsLpXoKGbKPVn
 q_1zKTpQfq9n3D1ES9HSQD_3XuEgI3Upj123ZaCRgV1mrpalLR9NBfsUPUYSfA.L8Cl_aGa8uGxc
 OMAPtIFDY9efAPC3Zp_HlHvWmW78HCxg4DK07Q7HvLS_BHcMm_ci3zhgXZrrle7XpagyMYLOtOsx
 m18kjlhJSRhPB30I8i8ENOKx7j9HoarE2vq_Xl_11S4LJObtjJhuoJpIa3k19BzJqLV9tLLHNsMx
 i_IPHj3oQzhW3Jf8xf0LNnk8JdIhEU5w07FRDDM_6VimJPwqo3E_HWpTk3yDvPQWQ.7lb0pLJlvt
 0sAjTrep.pQn.giv_Hmd89zC72hk_4hZ9af9oaVeyQ8dXuctLkcAQRR5x51dlSU2vPY2uPSZNt5.
 B2kDGecbM9epAIDdLDgrDAC8haTbZn4vyYW_zrhYDyCC3VwxmiX4Fi2V6PQ.l2gXDH5x80V7NM1P
 3hrsXFqUgFtu_cOYiQ3a3JbIIb59LZQydW0QQ4CwQ2umXq8.0.EsR4ij1mm.2hUR9I.cHSo.IOzF
 rOa.dFPnYnhStCVBnG1MLhouPMisnYTuBLcKcrTy0yzYRRaoBpq8dRwTOXze4njJm2wSiDxrzSfX
 r8qk_TyNN1kB6h.cdkIwMxzFbtQF7bKp4xNdk_ECLFwq2lUZETLfTO89K1Avi1TxVGPagXHkJKLv
 _UpNNamE48S7i58YRPeOdwCzxm831xnjrTsBF8xz5s0VSxx8NM5dV9TDI16131NsYBPY6RUeW4.b
 eRWDNK96BUZ1R5lYze7x2F3sG7OuzXCIWbuvmzbbHBOr9lbWbdrxugDIj08qoFbFdB_38mZvxhYz
 93vUjhUXEosfadOst79puBRaSOm0pTTNXe2myi.RbO2jIPfF9upgFPkSUQljgmNCEYBBFFsBTrtY
 so96vfCP71FeP5c6kevt0_FhRjUCRjGJEcU1rzxlI.jaCo6Oj6LiGF_c5s9647dm9PAVHWrePYH4
 oNTV98kNV1CsB76YWAI8bS1Q1oLiqZVPjxjX8aCm2yn4RXc82SqNJwe2n9Z.1F2EHQ.HCUcfQmNE
 fK5Bsw3_twAjydKfRgpHWCnCeA.eKLDwF9_KR1RP15av78qzqgq8rRZkFoTONYn6fEXJoMja8O4C
 ItrN.NM1y72uYwIwiHH84SGjP.V0kVyYPLIrnyOngIyX5Fe3gUIaZZ4XExVwQ2KcWLR4GHiXyicB
 TmvoTVH04sRXtrq3SXEjl4khM1tyz0xXpXONjoxQmD.JXsRgy01l8zLeowf32n7ACsGCn8nMc4LB
 cJlSgeKNgzjTtJbidSO5tuGBlp2qARmzPYLcVavbUL3noLUPDsdEuzAYzmkPcS37ANV0hAcFsRtH
 KJVt3WeZoDSM.MghiRdv01.NZRsLVtO148we1u6dT12SdC9QmMz8B0zza8ht383rutR9W2eY_WWK
 s2xAYRSQp7AciLUKiNHfO9Vpe6hXALoz5N3Kh2L51YNzKvGVUeZAsuTGjd5kHt7CSqyy4arVRclg
 -
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Tue, 10 Jan 2023 07:32:26 +0000
Received: by hermes--production-ne1-7b69748c4d-bxfkx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 00995f78f0d4fd001b9b8f1699ee7ed7; 
 Tue, 10 Jan 2023 07:32:22 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, qemu-devel@nongnu.org
Subject: [XEN PATCH v2 1/3] libxl/dm: Use "pc" machine type for Intel IGD
 passthrough
Date: Tue, 10 Jan 2023 02:32:02 -0500
Message-Id: <a38db9a2b829add5612e1bce44ae54ecd96e96b7.1673300848.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673300848.git.brchuckz@aol.com>
References: <cover.1673300848.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.69.84; envelope-from=brchuckz@aim.com;
 helo=sonic314-21.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.096,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The default qemu upstream "xenfv" machine type that is used when an HVM
guest is configured for Intel IGD passthrough assigns slot 2 to the
xen platform pci device. It is a requirement that slot 2 be assigned to
the Intel IGD when it is passed through as the primary graphics adapter.
Using the "pc" machine type instead of the "xenfv" machine type in that
case makes it possible for qemu upstream to assign slot 2 to the IGD.

Using the qemu "pc" machine and adding the xen platform device on the
qemu command line instead of using the qemu "xenfv" machine which
automatically adds the xen platform device earlier in the guest creation
process does come with some degredation of startup performance: startup
is slower and some vga drivers in use during early boot are unable to
display the screen at the native resolution of the monitor, but once
the guest operating system (Windows or Linux) is fully loaded, there
is no noticeable difference in the performance of the guest when using
the "pc" machine type instead of the "xenfv" machine type.

With this patch, libxl continues to use default "xenfv" machine type
with the default settings of xen_platform_pci enabled and igd
gfx_passthru disabled. The patch only affects machines configured with
gfx_passthru enabled.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Reviewers might find this patch easier to review by looking at the
resulting code in the patched file instead of looking at the diff because
it is hard to follow the logical flow of the resulting code in the diff
because the patch moves the check for igd gfx_passthru before the check
for disabling the xen platform device. That change was made because it
results in a more simplified logical flow in the resulting code.

v2: No changes to this patch since v1

 tools/libs/light/libxl_dm.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index fc264a3a13..2048815611 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1809,7 +1809,26 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             flexarray_append(dm_args, b_info->extra_pv[i]);
         break;
     case LIBXL_DOMAIN_TYPE_HVM:
-        if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+        if (libxl_defbool_val(b_info->u.hvm.gfx_passthru)) {
+            enum libxl_gfx_passthru_kind gfx_passthru_kind =
+                            libxl__detect_gfx_passthru_kind(gc, guest_config);
+            switch (gfx_passthru_kind) {
+            case LIBXL_GFX_PASSTHRU_KIND_IGD:
+                /*
+                 * Using the machine "pc" because with the default machine "xenfv"
+                 * the xen-platform device will be assigned to slot 2, but with
+                 * GFX_PASSTHRU_KIND_IGD, slot 2 needs to be reserved for the Intel IGD.
+                 */
+                machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on,igd-passthru=on");
+                break;
+            case LIBXL_GFX_PASSTHRU_KIND_DEFAULT:
+                LOGD(ERROR, guest_domid, "unable to detect required gfx_passthru_kind");
+                return ERROR_FAIL;
+            default:
+                LOGD(ERROR, guest_domid, "invalid value for gfx_passthru_kind");
+                return ERROR_INVAL;
+            }
+        } else if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
             /* Switching here to the machine "pc" which does not add
              * the xen-platform device instead of the default "xenfv" machine.
              */
@@ -1831,22 +1850,6 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             }
         }
 
-        if (libxl_defbool_val(b_info->u.hvm.gfx_passthru)) {
-            enum libxl_gfx_passthru_kind gfx_passthru_kind =
-                            libxl__detect_gfx_passthru_kind(gc, guest_config);
-            switch (gfx_passthru_kind) {
-            case LIBXL_GFX_PASSTHRU_KIND_IGD:
-                machinearg = GCSPRINTF("%s,igd-passthru=on", machinearg);
-                break;
-            case LIBXL_GFX_PASSTHRU_KIND_DEFAULT:
-                LOGD(ERROR, guest_domid, "unable to detect required gfx_passthru_kind");
-                return ERROR_FAIL;
-            default:
-                LOGD(ERROR, guest_domid, "invalid value for gfx_passthru_kind");
-                return ERROR_INVAL;
-            }
-        }
-
         flexarray_append(dm_args, machinearg);
         for (i = 0; b_info->extra_hvm && b_info->extra_hvm[i] != NULL; i++)
             flexarray_append(dm_args, b_info->extra_hvm[i]);
-- 
2.39.0


