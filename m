Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E858E6634D5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 00:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF1Fy-0008Jp-Dw; Mon, 09 Jan 2023 18:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pF1Fw-0008Il-7q
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 18:08:40 -0500
Received: from sonic308-8.consmr.mail.gq1.yahoo.com ([98.137.68.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pF1Fu-0003dW-Fj
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 18:08:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1673305715; bh=ywgbO8lubWpnCassvIu6bBFzCJ/Z2sgLUfL80HdpzLE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=pxzV/H1HM06MpAMRVFL0ssYCJXP59bXc5GrKUx/QcQJz7S71dqm4BINX2rzahxX81MtJ3y6CVWoFA+Z+Yvgmo6ZVoj16k+n0jLXlMLmUGbVqJE84JQ4p85+kGNkvkZ+CV3G3IVhDqZXv8Dr2rU0tVBF9iP1z0HwzRVp6x8KAHGEMS7q2ZCfeFIysV2I3RHAkuX8M4I5xj4vKnkI7rl/dsIfHsF+8921Wr5K1wPt2gMyHI+eTg8B2Lwfenjxuz9UX2sw8CglGE+K7lJLFfjSPx6RSsEPaGgY5LceZhom1Eg4fk0O1PK2D4Q/HnAm9NnGscRgslm01AHt6AiaU1UA4ZQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1673305715; bh=keMjmw88+NB73GNZ0YN7HfypUkwkByV4+3fnszfn8CF=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=o5oc++gedcFxnVQru4ndLDTH+4PHQV48uZlZYgPEpbc9FMkTUtRJaY8ZIkTBLQ9efm7MNUoNRoYQnfOqkxARaYxTn/ztbDwwrODbc224H2IWyAX+TBSF1kLYjVlyGY6omgdm0a7VCaxl0USk+DiuFfy7uCVCauu1/xE9QsAb+cGlcbD+60pewrrq1aKWcKGuCZ2nPcelXtbFD9hyDybbZ/tCH1FtccsiuUBwWONs0gVITU8DORaBTRcDW9rQNQ5RCGYm5So2t35HzP30oAv5CjIuBFRrupoQ9UF26cgAB8YIBmCnsldzZZipBmKZq9RxiDZGaXsJ9YEBnZ0/lwvPCQ==
X-YMail-OSG: vQZpqCcVM1mUk8i0Yg6trsInc6cIWbw5_m7__7CkDb5NTL8YxNrrPG2YebLlzam
 cbBzvm1Qfug0CdK_EKzy9o7NDqNQ.oDx1dGzXpsW1UizBPvq8F5GwcOBS.9eepfelo2Hc068dSZg
 PFRNQRvtTcgxfA9dR.lOLBFOP25MpPq4pTWjtTC5DdLdlcdEDFg14WJHM_ruSYuLeOJMwtm8r6c9
 t0_IxRGikpcmywJ8l0GYmNert7SRfUAh_TwQKxpjYgoh0C5DBiJs.sXBqpZqmoCfw98iOO8F0B1v
 BDe8VwfbQ9LyLe6R9qNFsHW_4CylMgaDyfi6F1L6YUuHVzkGTL.zvCPjrPxZo1JhUkI9pbrlEjVq
 QZ07JAl9zztA3m_F9mdSrNIShZML8F7D8biOje2C.zDIdxp.wOwCMXbp5TAahcygh2q9AmJfItAd
 w3krBHXcXWT5UrE00TTFA_MVSoqQhqomFTu3x5VWZUSJGjXc4BEXiMxf.K_yT7uX4jtA.k0rAdHX
 jWw1b7zXKomaPLHmV3Hjg576CP0BeS.v2Owvv1ymlnWXvQNeWFVj10av1tH_9FXoT5BkGhNtGaxK
 q6aRWbSlcpT6lACd8EXQjUig6HuYvzGGYDIpm_L8R3wA_XKdCuzSxpFfHJ9oqaNyp0F_mNPQ7xfY
 H_OMYWsTwp0wIRtnUE3epufHf_ZwrqgVz7E.CVtvi_lQWBBMCO6zQsaaRWzver3NRHhDqJKzdllU
 Ki9Q6ypU1sKtHeCDN6uQivu0LUl3m3kXOLrDa8fIz4Hx23rrvtZ2y5feJ7mvXxEEqBRLjxBrSqBH
 usd0r_3usqyCBDIXyEU6yCm4G9lr8R1bhjdcdGEVxYbnGcQ22yqgQkisyrCjJhk2wlm1BnXFibeM
 bVIm6sis5av5BHgjo6FZkg02DT34K56H725bfkaGTGSm6hIsHYSTKa5TLoD3uLUtj.tObqcSdYuT
 mI4qH.3ADGN8fWZHaSnbmWl.S_5JucXWDsQrX.6eXSFhBX_anNtCFkCbUkihkXZV1Sva8EmqHs3R
 DBHRUidj68bGpq6rC6HGpakt55ONoI1_iiQGSAklpsBEaXB8GTqrBWQyEgy8mKdMHQn9.cDBkhn4
 YQQ8GIjjyzmbNWkNkTZmUw7F6lZ8Rsi8P4_RX1Cmg0h3AZ2o3DldWH8NUIIjzxVSAydONH8cYVCi
 _KCuEbj6K9MtQJtiAi8mWVIAHZMtngEcXb4vetP6QXoa3bscDARG8c3DrlrKeV0xWJh9IsPn_fO6
 lCKp7_j6NqmTG3oNlVhfZCpwNXDsWWmkw0zCBwxMxX_C0kDjoHK42ePacU4DtKyU5ggLQzPjoBZR
 8MIjGW9HtAzBnQyXoNK5iHTMx6hk8mDXEGvucUmkG6bSOk5iHb4bZuaDyibxfjnn1gu2vErd._91
 k8GmjuSozC_fApfkJ.yolqbPpOWW2dKb2vtwl3q78PlTqTbFzMGVVg.p_Zx8kt1ePl7x97FNTy1L
 YU5t77MmDasd5dfcapCgontTo.7eKb6EtANIjKOZF.IGxD0FSSPTKtRJiraMZrW1xThL3pjzBXy_
 idlDgeBz4V_.RbOd1GpUGTiZkTKP34mpwQ8aLNPXsEFSuX7yz4gPbrVSsRowIaus2sJxQnvbkQlf
 hG7JcMfmePc.u4hu7clkU23J3HU3KRyV8Zc3nJZLYXG8LFtWGYqdAdBDgjm0LV_KByE36kM3YgCW
 vrrmyF3IateQLwYucxGimj5zcjl8t9bAYDcEtIsZSg8DPWjty1LbAmJdxoj2WPbquYvnktxGBfdg
 0QznWRWZGIrkjLNC2QloR.OOMnb09ahDk9nJ9q9xtJ4voF05Q8c2Jvzg0FvkezRWl8LK2VhYpFs9
 W4M631i9xLc6yU5aZnWRrsB7joBr4FEDvkSxCzU_cBhRAjHfUTyoByUkBxTxMb9yt6ZM2ghZoX7M
 4X44tPVu604f.o9ZuWAJy7zhT2IAzwp1aYlqfKywOZ8iwK89zwurgxNux8odcJGe8wTK_NaFL1kI
 4UFtlTJ3XYeRL6fjGS6415Z5PVgwMpQ9qwVDnoW7fmctSGop.iWJO6ImljqeBecgMRDO0UFB.hbn
 rpzFDd3it6GvDxcNBoCdQDUkXIw_RwrNeqgzjAP2cKVqLBVt7Ft1u.ciEP9bWBj0_nhtGG.lPkDG
 y9c_Poj1g_5DWY9FwycTRu2KCaslyzwI2.DyIuP23TmQA0qm41xKWUkKkiK6wucoCyxzfS8lCYQ-
 -
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Mon, 9 Jan 2023 23:08:35 +0000
Received: by hermes--production-ne1-7b69748c4d-bgkrh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 21a3ec8339abfccbadeaea4f5ef812e7; 
 Mon, 09 Jan 2023 23:08:32 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, qemu-devel@nongnu.org
Subject: [XEN PATCH 3/3] libxl/dm: Assign slot 2 by default for Intel IGD
 passthrough
Date: Mon,  9 Jan 2023 18:08:13 -0500
Message-Id: <27bb3979f234c8de6b51be7bb8195e3cacb5181c.1673300848.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673300848.git.brchuckz@aol.com>
References: <cover.1673300848.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.68.32; envelope-from=brchuckz@aim.com;
 helo=sonic308-8.consmr.mail.gq1.yahoo.com
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

It is possible for the administrator to manually specify the virtual
slot addresses of passed through pci devices on the guest's pci bus
using the @VSLOT parameter in xl.cfg. With this patch, libxl will by
default assign the Intel IGD to slot 2 when gfx_passthru is configured
for the Intel IGD so it will no longer be necessary to use the @VSLOT
setting to configure the IGD correctly. Also, with this patch, libxl
will not override explicit @VSLOT settings by the administrator so
in that case the patch will have no effect on guest behavior.

The default behavior of letting qemu manage the slot addresses of passed
through pci devices when gfx_passthru is disabled and the administrator
does not set @VSLOT for passed through pci devices is also preserved.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
 tools/libs/light/libxl_dm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 2720b5d4d0..b51ebae643 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1207,6 +1207,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     int rc;
     int next_slot;
     bool configure_pci_for_igd = false;
+    const int igd_slot = 2;
     /*
      * next_slot is only used when we need to configure the pci
      * slots for the Intel IGD. Slot 2 will be for the Intel IGD.
@@ -2173,6 +2174,27 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     flexarray_append(dm_envs, NULL);
     if (envs)
         *envs = (char **) flexarray_contents(dm_envs);
+    if (configure_pci_for_igd) {
+        libxl_device_pci *pci = NULL;
+        for (i = 0; i < guest_config->num_pcidevs; i++) {
+            pci = &guest_config->pcidevs[i];
+            if (!pci->vdevfn) {
+                /*
+                 * Find the Intel IGD and configure it for slot 2.
+                 * Configure any other devices for slot next_slot.
+                 * Since the guest is configured for IGD passthrough,
+                 * assume the device on the host at slot 2 is the IGD.
+                 */
+                if (pci->domain == 0 && pci->bus == 0 &&
+                    pci->dev == igd_slot && pci->func == 0) {
+                    pci->vdevfn = PCI_DEVFN(igd_slot, 0);
+                } else {
+                    pci->vdevfn = PCI_DEVFN(next_slot, 0);
+                    next_slot++;
+                }
+            }
+        }
+    }
     return 0;
 }
 
-- 
2.39.0


