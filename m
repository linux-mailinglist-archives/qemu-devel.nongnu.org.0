Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC27334A34
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:57:54 +0100 (CET)
Received: from localhost ([::1]:51910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6q0-0002QM-Ec
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6e6-0003Bh-PR; Wed, 10 Mar 2021 16:45:35 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:54173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dz-0004SD-EQ; Wed, 10 Mar 2021 16:45:31 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N6szR-1loDlw2LFP-018Mn1; Wed, 10 Mar 2021 22:45:19 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/22] virtio-gpu: Adjust code space style
Date: Wed, 10 Mar 2021 22:44:53 +0100
Message-Id: <20210310214504.1183162-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jtIHLvM0rzoNyJNruV+OaDD9miqzPrBvpDAa3meYeWE2QCyAvai
 BE+edA7l65OCnYH9RrrMwBRkIQmmoafpio5SDLrxCKBt/kpX8Uwnhn04p+M/FDk0D3Kfxzt
 RJGqODDW2a8p8Uwr5+rk2QzSvWt9SdHSPshjD+zRnvlhWxfZFDvpUIUGndz1jNXA7x3/hgW
 ydRTEYS3EEGqr6+31Q5PA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gwvaEEdYeQ4=:q2EY8HjIijEeL0/1I3nlu4
 6O9UxTmnfPLav4pcladrJ7cAtvS7eME7YKzAp0MvZvDdzmX5jGn7oTyTWfjN4/W4HICC1nHbJ
 pk17eCSrKqz1TKQGQ6GTx2etiWBH6wHNBR+9WDLsg3+PluCNxA7UsD0T0a8MKVElOkQU80P+z
 UVNovNfKCLPdx97INpYVVR+wrEJ29149JErz2JBEjG9RMM/qlGfCiqf2SzSJanwmc7eiml2eu
 BF+dBmy+9YBN4/Zkr1qNMbfgraqf1zXMgyK0khG04IJY5VSqvVUOeG3hSelKbTqbe4voEbwD8
 bz4XOQxzaCgsDDpbLzI1AsP6N3FuqXj7c4VklbeP7T+l7zklfxR06d/XoQTBn1vOLRYoxPpB6
 Gf1PZJA+S+hXzcGcSKLAw8IkZoonL5f4QlRt3RrCzQcr42E48J2KGwRbuZ62o
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, lijiejun <a_lijiejun@163.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: lijiejun <a_lijiejun@163.com>

Fix code style. Operator needs align with eight spaces, and delete line space.

Signed-off-by: lijiejun <a_lijiejun@163.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <1615292050-108748-1-git-send-email-a_lijiejun@163.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/virtio-gpu-3d.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
index 9eb489077b17..d98964858e13 100644
--- a/hw/display/virtio-gpu-3d.c
+++ b/hw/display/virtio-gpu-3d.c
@@ -438,7 +438,7 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
         break;
     case VIRTIO_GPU_CMD_RESOURCE_FLUSH:
         virgl_cmd_resource_flush(g, cmd);
-       break;
+        break;
     case VIRTIO_GPU_CMD_RESOURCE_UNREF:
         virgl_cmd_resource_unref(g, cmd);
         break;
@@ -456,7 +456,6 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_GET_CAPSET:
         virgl_cmd_get_capset(g, cmd);
         break;
-
     case VIRTIO_GPU_CMD_GET_DISPLAY_INFO:
         virtio_gpu_get_display_info(g, cmd);
         break;
-- 
2.29.2


