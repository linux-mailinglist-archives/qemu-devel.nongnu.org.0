Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1A6634D8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 00:09:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF1Fw-0008J9-WE; Mon, 09 Jan 2023 18:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pF1Fv-0008IF-1G
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 18:08:39 -0500
Received: from sonic315-55.consmr.mail.gq1.yahoo.com ([98.137.65.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pF1Fs-0003d1-Oc
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 18:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1673305714; bh=6KQQVKXjX5bPI5/yTS20Ov1Ty8T7qISVmf3UrSeOprM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=PEM0aNGEXQPaqvoOKMU9QyD96JQr5zHZqkD3XdTeUDsr8UOaeO2eUCcfQC8eUzj6YvlHwhREB8BQeTAA/fQhhnLV0bKpwkosy3XaDR0++D6Wq93pLvBsp+lRLNsFhCuWe3S83y3GIsiZEoApYIhP38XFQgkU+V+71RWck/3sk4kRGGMqtlH6sKiY363PxXu0Pp6blaUbHk86dzsEIsJFAniHkUC4t6o9EUP0FenDRBc96qq8e1/py4lFl3kNKV8Uqbxi+kTSq/tFpbRpA7+M1GnZe1jb8gvYAevKFVGgBhSszHjhIDGF8HSfj4sU+V0J9DwCKKpmQ016z3jZHkau7Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1673305714; bh=TWHL1z/CiE8ohTN0zQTQknjD74chjKnA+HPUBhabmew=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=I437GwK+vEuJyjpv7CsRTSm8h0S7JdolI9aSALXd3nUkdhdF0+9Rw+S3/c17bfn02+Y5ASvsOvQtH3sCGgDN5YQui32Fwk2uF4YB7bwAHB5oBhaYbLqJSIIWY+tf527R72vhgT8WtiEXzgFI/fBkgXYzw7oQtnd6Ol627Da5KIO5w23DDfeK6CIGwR1BWaFCoRVXVV/6MZjS+vVeyk9rYAAcDUKK1iWBX2HbRAFODD0C3RbeKWslcXDmab4ENB9jJ3WKua2B4tKlT9787hAHNbi3rANRTgSvQ+DU7jxNLxMtocnfpavdKqWTUA+PNkNwUZZMttoQXtgD9tHKNa8sqg==
X-YMail-OSG: TbIfoPMVM1nDGed1NwkTCQurEHl4PZPKruQylL5Hfy_lsaQ34xXGdbcXGGcz8am
 8KJ3zw1NlRjxXHSr1eJ2CCCcc8cQXw9nuJOxp.Y4tDdG9CilO4rrYXGde8Dfq1reHiJI_i.yqRCx
 XH6.YOOuxme2R5T.xbG0cSV.Tumu_kxNn9.WFFwc.TSc.29n0butPjuBbKl3.txxAnvr4sDB62h2
 3C7eLySTsMLflK5qUt.kXrUVnHscxQP5tuInMo3Va6QDqqaL6I2O9pP8kZmLQg8NHETXfDmfNsyE
 NoMlZ2bInDyLN83vRWmC.fjInk6BU6f7eIsBe0OimYgnJEDZr8rv8VSTdi4rZspZNKQ9pX8P7Vjd
 d26N6Eoq4q_SvEgRukC4zGKG3w4.0pwgDOGAm73WrglGtDStfxu1jIH.G0zlp.IK_6JT6d6ScOxA
 qBCDD2crReqSBoNN_TzI6kWyaOdFEzEsMb.8gSrdmllucEwAIQ.fPLAgG262ujb6dOR84CwPygqX
 XjGFubEyFEWcmqiCADQ1FNwfWatojDAkTExNRDXdUxzb.Xlxnd_sXWRaukLy9MFuKN5SeKlGta85
 KsHUJtjeC6azaYF2f0UpwaQCgunfxGsKdWgIeSTfBOp0mv.laMaeWZIpyrHsKJMbMzRdmAZDPkK6
 tetP.YQw0kFRdANd_dr.._hfKRwQNDMvcA9QpL6Fs2elpdZb5iOLD7yZKa2rGIjhUwdLP.ctmqXB
 pIVDGknG5jbjwWtkJ9eHu5vImPnyYrRosnL.bv6KYZ10UbhQvOis2r14LSOmYG9QGg8crk4DCX0J
 YpU6RQlIDSb9rYQfrZ1.47Al3y7xSUPJjGZNxBdwF6NvpbbxM_v3N8ke2r_HEDuLqw9xxbmV3bfk
 Lj1N7rit_LaGiBkEJ.fVR5leLuFP.3bhp35g3PErXf_3ZkQcsu3mMjHbr0JXPCuOIkc4rhha4yBj
 08LJUWfGhkWbtunQ6sEroWoB6QksKPI9ONH6y7e9btZE0dkzcXylmSFec8Y22Rm0d.kM0aJzd0yH
 wpyq.aNkTmKVyu394N17gULzDAHnO23jRsss6c5BN6AVZyrnxnYn._HJItmMaW5BrOSiebL4mlFa
 rs4zckGkbgNP8tfoc1ox6fSKVqB3ss9r8aW4OpXTgviIfLtQOda85apY02DCIq_lgukBHdNocZKC
 WM2fw8XlHdgm.vOTjHZGqmXbOPL27Mdw7HdyxGRHZMHIDpSRFhrH8JuFdJ_L.nc8kIFaBponEOAV
 OLbC_jieWUmMdKXlWv7j1bJnl84nPcawtY6T4ajxMdnBOtEy6QfBF.dNM1mHTeZdKm4xUtevFTec
 ntLNdcVkRs1SFJH6S5KjAiIFQbgSUSdSJ14FN2H9PyeYUGgHTddjB6pQ27KfnR5z1gupN8WN.esE
 UCY098ePhnithkcajn.c_tABPP4HIe_jNXZXH0PDLDEEVeQS95xIsEPIzyxfYizHF56kuq60KYe4
 h9WcjhSXPLtidm_fyK0dbdKhiimScIsrirgxSy6WZ8sHYFJ0IX1SsjYiMeq7lox.lNEk8CREHM92
 bgcOG88uyw.KsK2cFD.lj0TFlfG2Rpb2s0UJwrco7Nnpr.lCpn.ByvGSr.C6HVRCT530cLhI_vUs
 EqdwmNCasN.zcYmqUVH4LD7_zM07vZju7CkxHfP__3pWP.Q8bcX4oRWUgTxlZOQuK5e9iVzPElLO
 bzTHZzlbLc.0v7dX5dV95Zba9M395Yo0HdgyKGR7NUnF1VGd7Y0qFlC5tJ7ei5c_vkq6fGvP6E04
 s2b7n7IgIMZgq_WJ2_kFQ1i5t7tmpqNjOsqn5.yQz3KL1d555sYEuku.aqF1sbBwDQNF9M.Tfjkw
 UsW1h6xASufEA_XmYbd4eQuRz3UJF551d.qvx.DiWZyXxP39hJhXnk_IGsArpAsI2MGxd_CngflA
 o8b4LEfjVUjev696HkHyZD0UG_Ydm.58C8_5km2VzkCOdKQM8Ula61X.ld84oFv83N3Gxcf82MXW
 mN0lwv9_y8DoWZoL6Kq5AtcAEjx5CNQRD2vz2GFNd8D5XgsxqZrV3JaR0B6RAG84OKk1v4.6FVvT
 EDyCdVXuhrqTy7RWME1YAyMfWQHxrhOqZ4dpxw7uTBG367fnglB1.JdIKvdS6C9EC3wXmBolmi1y
 XEwACp5xf8ktCagD_XZauILSdQ7gL46G_f2W3EDrW9EcleRLg083XsJAc6sxAYSNMy5yKEanA3rc
 -
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Mon, 9 Jan 2023 23:08:34 +0000
Received: by hermes--production-ne1-7b69748c4d-bgkrh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 21a3ec8339abfccbadeaea4f5ef812e7; 
 Mon, 09 Jan 2023 23:08:30 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, qemu-devel@nongnu.org
Subject: [XEN PATCH 2/3] libxl/dm: Manage pci slot assignment for Intel IGD
 passthrough
Date: Mon,  9 Jan 2023 18:08:12 -0500
Message-Id: <76d06f5d01e01df316230def4f31037695f11c1a.1673300848.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673300848.git.brchuckz@aol.com>
References: <cover.1673300848.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.65.31; envelope-from=brchuckz@aim.com;
 helo=sonic315-55.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.096,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

By default, except for the ich9-usb-uhci device which libxl assigns to
slot 29 (0xid), libxl defers to qemu upstream's automatic slot assignment
process, which is simply to assign each emulated device to the next
available slot on the pci bus. With this default behavior, libxl and
qemu will not configure the Intel IGD correctly. Specifically, the Intel
IGD must be assigned to slot 2, but the current default behavior is to
assign one of the emulated devices to slot 2.

With this patch libxl uses qemu command line options to specify the slot
address of each pci device in the guest when gfx_passthru is enabled
for the Intel IGD. It uses the same simple algorithm of assigning the
next available slot, except that it starts with slot 3 instead of slot 2
for the emulated devices. This process of slot assignment aims to
simulate the behavior of existing machines as much as possible.

The default behavior (when igd gfx_passthru is disabled) of letting qemu
manage the slot addresses of emulated pci devices is preserved. The
patch also preserves the special treatment for the ich9 usb2 controller
(ich9-usb-ehci1) that libxl currently assigns to slot.function 29.7 and
the associated ich9-usb-uhciN devices to slot 29 (0x1d).

For future maintainance of this code, it is important that pci devices
that are managed by the libxl__build_device_model_args_new function
follow the logic of this patch and use the new local counter next_slot
to assign the slot address instead of letting upstream qemu assign the
slot if the guest is configured for Intel IGD passthrough, and preserve
the current behavior of letting qemu assign the slot address otherwise.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
The diff of this patch is easier to review if it is generated using
the -b (aka --ignore-space-change) option of diff/git-diff to filter
out some of the changes that are only due to white space.

This patch is difficult to verify for correctness without testing all
the devices that could be added by the libxl__build_device_model_args_new
function. There are 12 places where the addr=%x option needed to be
added to the arguments of the "-device" qemu option that adds an
emulated pci device which corresponds to at least 12 different devices
that could be affected by this patch if the patch contains mistakes
that the compiler did not notice. One mistake the compiler would not
notice is a missing next_slot++; statement that would result in qemu
trying to assign a device to a slot that is already assigned, which
is an error in qemu. I did enough tests to find some mistakes in the
patch which of course I fixed before submitting the patch. So I cannot
guarantee that there are not any other mistakes in the patch because
I don't have the resources to do the necessary testing of the many
possible configurations that could be affected by this patch.

 tools/libs/light/libxl_dm.c | 168 ++++++++++++++++++++++++++++++------
 1 file changed, 141 insertions(+), 27 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 2048815611..2720b5d4d0 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1205,6 +1205,20 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     const char *path, *chardev;
     bool is_stubdom = libxl_defbool_val(b_info->device_model_stubdomain);
     int rc;
+    int next_slot;
+    bool configure_pci_for_igd = false;
+    /*
+     * next_slot is only used when we need to configure the pci
+     * slots for the Intel IGD. Slot 2 will be for the Intel IGD.
+     */
+    next_slot = 3;
+    if (libxl_defbool_val(b_info->u.hvm.gfx_passthru)) {
+        enum libxl_gfx_passthru_kind gfx_passthru_kind =
+                        libxl__detect_gfx_passthru_kind(gc, guest_config);
+        if (gfx_passthru_kind == LIBXL_GFX_PASSTHRU_KIND_IGD) {
+            configure_pci_for_igd = true;
+        }
+    }
 
     dm_args = flexarray_make(gc, 16, 1);
     dm_envs = flexarray_make(gc, 16, 1);
@@ -1372,6 +1386,20 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
 
         if (b_info->cmdline)
             flexarray_vappend(dm_args, "-append", b_info->cmdline, NULL);
+        /*
+         * When the Intel IGD is configured for primary graphics
+         * passthrough, we need to manually add the xen platform
+         * device because the QEMU machine type is "pc". Add it first to
+         * simulate the behavior of the "xenfv" QEMU machine type which
+         * always adds the xen platform device first. But in this case it
+         * will be at slot 3 because we are reserving slot 2 for the IGD.
+         */
+        if (configure_pci_for_igd &&
+            libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+            flexarray_append_pair(dm_args, "-device",
+                        GCSPRINTF("xen-platform,addr=%x", next_slot));
+            next_slot++;
+        }
 
         /* Find out early if one of the disk is on the scsi bus and add a scsi
          * controller. This is done ahead to keep the same behavior as previous
@@ -1381,7 +1409,14 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                 continue;
             }
             if (strncmp(disks[i].vdev, "sd", 2) == 0) {
-                flexarray_vappend(dm_args, "-device", "lsi53c895a", NULL);
+                if (configure_pci_for_igd) {
+                    flexarray_vappend(dm_args, "-device",
+                        GCSPRINTF("lsi53c895a,addr=%x", next_slot), NULL);
+                    next_slot++;
+                } else {
+                    flexarray_vappend(dm_args, "-device", "lsi53c895a",
+                                      NULL);
+                }
                 break;
             }
         }
@@ -1436,31 +1471,67 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             flexarray_append(dm_args, "-spice");
             flexarray_append(dm_args, spiceoptions);
             if (libxl_defbool_val(b_info->u.hvm.spice.vdagent)) {
-                flexarray_vappend(dm_args, "-device", "virtio-serial",
-                    "-chardev", "spicevmc,id=vdagent,name=vdagent", "-device",
-                    "virtserialport,chardev=vdagent,name=com.redhat.spice.0",
-                    NULL);
+                if (configure_pci_for_igd) {
+                    flexarray_vappend(dm_args, "-device",
+                        GCSPRINTF("virtio-serial,addr=%x", next_slot),
+                        "-chardev", "spicevmc,id=vdagent,name=vdagent",
+                        "-device",
+                        "virtserialport,chardev=vdagent,name=com.redhat.spice.0",
+                        NULL);
+                next_slot++;
+                } else {
+                    flexarray_vappend(dm_args, "-device", "virtio-serial",
+                        "-chardev", "spicevmc,id=vdagent,name=vdagent",
+                        "-device",
+                        "virtserialport,chardev=vdagent,name=com.redhat.spice.0",
+                        NULL);
+                }
             }
         }
 
         switch (b_info->u.hvm.vga.kind) {
         case LIBXL_VGA_INTERFACE_TYPE_STD:
-            flexarray_append_pair(dm_args, "-device",
-                GCSPRINTF("VGA,vgamem_mb=%d",
-                libxl__sizekb_to_mb(b_info->video_memkb)));
+            if (configure_pci_for_igd) {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("VGA,addr=%x,vgamem_mb=%d", next_slot,
+                    libxl__sizekb_to_mb(b_info->video_memkb)));
+                next_slot++;
+            } else {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("VGA,vgamem_mb=%d",
+                    libxl__sizekb_to_mb(b_info->video_memkb)));
+            }
             break;
         case LIBXL_VGA_INTERFACE_TYPE_CIRRUS:
-            flexarray_append_pair(dm_args, "-device",
-                GCSPRINTF("cirrus-vga,vgamem_mb=%d",
-                libxl__sizekb_to_mb(b_info->video_memkb)));
+            if (configure_pci_for_igd) {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("cirrus-vga,addr=%x,vgamem_mb=%d", next_slot,
+                    libxl__sizekb_to_mb(b_info->video_memkb)));
+                next_slot++;
+            } else {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("cirrus-vga,vgamem_mb=%d",
+                    libxl__sizekb_to_mb(b_info->video_memkb)));
+            }
             break;
         case LIBXL_VGA_INTERFACE_TYPE_NONE:
             break;
         case LIBXL_VGA_INTERFACE_TYPE_QXL:
             /* QXL have 2 ram regions, ram and vram */
-            flexarray_append_pair(dm_args, "-device",
-                GCSPRINTF("qxl-vga,vram_size_mb=%"PRIu64",ram_size_mb=%"PRIu64,
-                (b_info->video_memkb/2/1024), (b_info->video_memkb/2/1024) ) );
+            if (configure_pci_for_igd) {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("qxl-vga,addr=%x,vram_size_mb=%"PRIu64
+                    ",ram_size_mb=%"PRIu64, next_slot,
+                    (b_info->video_memkb/2/1024),
+                    (b_info->video_memkb/2/1024) ) );
+                next_slot++;
+            } else {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("qxl-vga,vram_size_mb=%"PRIu64
+                    ",ram_size_mb=%"PRIu64,
+                    (b_info->video_memkb/2/1024),
+                    (b_info->video_memkb/2/1024) ) );
+            }
             break;
         default:
             LOGD(ERROR, guest_domid, "Invalid emulated video card specified");
@@ -1496,8 +1567,15 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         } else if (b_info->u.hvm.usbversion) {
             switch (b_info->u.hvm.usbversion) {
             case 1:
-                flexarray_vappend(dm_args,
-                    "-device", "piix3-usb-uhci,id=usb", NULL);
+                if (configure_pci_for_igd) {
+                    flexarray_vappend(dm_args, "-device",
+                        GCSPRINTF("piix3-usb-uhci,addr=%x,id=usb",
+                                  next_slot), NULL);
+                    next_slot++;
+                } else {
+                    flexarray_vappend(dm_args,
+                        "-device", "piix3-usb-uhci,id=usb", NULL);
+                }
                 break;
             case 2:
                 flexarray_append_pair(dm_args, "-device",
@@ -1509,8 +1587,15 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                         i, 2*(i-1), i-1));
                 break;
             case 3:
-                flexarray_vappend(dm_args,
-                    "-device", "nec-usb-xhci,id=usb", NULL);
+                if (configure_pci_for_igd) {
+                    flexarray_vappend(dm_args, "-device",
+                        GCSPRINTF("nec-usb-xhci,addr=%x,id=usb",
+                                  next_slot), NULL);
+                    next_slot++;
+                } else {
+                    flexarray_vappend(dm_args,
+                        "-device", "nec-usb-xhci,id=usb", NULL);
+                }
                 break;
             default:
                 LOGD(ERROR, guest_domid, "usbversion parameter is invalid, "
@@ -1542,8 +1627,15 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
 
             switch (soundhw) {
             case LIBXL__QEMU_SOUNDHW_HDA:
-                flexarray_vappend(dm_args, "-device", "intel-hda",
-                                  "-device", "hda-duplex", NULL);
+                if (configure_pci_for_igd) {
+                    flexarray_vappend(dm_args, "-device",
+                        GCSPRINTF("intel-hda,addr=%x", next_slot),
+                                   "-device", "hda-duplex", NULL);
+                    next_slot++;
+                } else {
+                    flexarray_vappend(dm_args, "-device", "intel-hda",
+                                      "-device", "hda-duplex", NULL);
+                }
                 break;
             default:
                 flexarray_append_pair(dm_args, "-device",
@@ -1573,10 +1665,18 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                                                 guest_domid, nics[i].devid,
                                                 LIBXL_NIC_TYPE_VIF_IOEMU);
                 flexarray_append(dm_args, "-device");
-                flexarray_append(dm_args,
-                   GCSPRINTF("%s,id=nic%d,netdev=net%d,mac=%s",
-                             nics[i].model, nics[i].devid,
-                             nics[i].devid, smac));
+                if (configure_pci_for_igd) {
+                    flexarray_append(dm_args,
+                        GCSPRINTF("%s,addr=%x,id=nic%d,netdev=net%d,mac=%s",
+                                  nics[i].model, next_slot, nics[i].devid,
+                                  nics[i].devid, smac));
+                    next_slot++;
+                } else {
+                    flexarray_append(dm_args,
+                        GCSPRINTF("%s,id=nic%d,netdev=net%d,mac=%s",
+                                  nics[i].model, nics[i].devid,
+                                  nics[i].devid, smac));
+                }
                 flexarray_append(dm_args, "-netdev");
                 flexarray_append(dm_args,
                                  GCSPRINTF("type=tap,id=net%d,ifname=%s,"
@@ -1865,8 +1965,15 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
         flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", GCSPRINTF("%d", guest_domid));
 
-        if (b_info->u.hvm.hdtype == LIBXL_HDTYPE_AHCI)
-            flexarray_append_pair(dm_args, "-device", "ahci,id=ahci0");
+        if (b_info->u.hvm.hdtype == LIBXL_HDTYPE_AHCI) {
+            if (configure_pci_for_igd) {
+                flexarray_append_pair(dm_args, "-device",
+                            GCSPRINTF("ahci,addr=%x,id=ahci0", next_slot));
+                next_slot++;
+            } else {
+                flexarray_append_pair(dm_args, "-device", "ahci,id=ahci0");
+            }
+        }
         for (i = 0; i < num_disks; i++) {
             int disk, part;
             int dev_number =
@@ -2043,7 +2150,14 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         switch (b_info->u.hvm.vendor_device) {
         case LIBXL_VENDOR_DEVICE_XENSERVER:
             flexarray_append(dm_args, "-device");
-            flexarray_append(dm_args, "xen-pvdevice,device-id=0xc000");
+            if (configure_pci_for_igd) {
+                flexarray_append(dm_args,
+                GCSPRINTF("xen-pvdevice,addr=%x,device-id=0xc000",
+                           next_slot));
+                next_slot++;
+            } else {
+                flexarray_append(dm_args, "xen-pvdevice,device-id=0xc000");
+            }
             break;
         default:
             break;
-- 
2.39.0


