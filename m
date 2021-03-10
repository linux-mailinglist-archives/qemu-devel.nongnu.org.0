Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D002334A20
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:51:17 +0100 (CET)
Received: from localhost ([::1]:32912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6jc-0001kj-4L
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6du-00035L-Iu; Wed, 10 Mar 2021 16:45:22 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:55883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dp-0004L7-Uv; Wed, 10 Mar 2021 16:45:22 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MauFB-1lrVaG22yB-00cNYB; Wed, 10 Mar 2021 22:45:11 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/22] hw/elf_ops: Fix a typo
Date: Wed, 10 Mar 2021 22:44:45 +0100
Message-Id: <20210310214504.1183162-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oZYpL/O2epG42axZBYuhHFuNIxfmOJPDnxM/QNmRkTpraJwK8qr
 4HNnR7AyYp6YpMWLTLJtRhLxMEJkmf11pKl/SnwlKinkVp8L20oAuG1SFwDZlu3391SZTcG
 G8bHVTm19mRGD+VvnB+oC8UF8i4BxgNvPYJi9Z9+DeEi2W+97gsfkpF/1009la8BJr5O1W/
 gLUaQ11OZBuyugtqRDQRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uCoz5OnCMjE=:2v9kWtJq0acGW8NtqKvRrh
 bEoMTC2UnSwVfRSpF/OJdCnUhGgXyP29V8tItiygA4z4xOVN8byzVv4t1fLA1tiUK9Xe4MO4G
 4HkbtSMMOM5cMe3h3gL6lQFZDuO3euw+z1ahRG+s1wPl7WS11TrTZzeIWP8zGaFTPtuKSELbx
 u6UraQ3k+XzsGdTBPOnjLLGOVFXev86EmatQCsDpxYrfp7DTmmVofjdtkiG8UTj1mMOwug0WN
 NyfpA2rQ6p4OJZE3uvfsnJkaVWwge8NcC4Jcpo+XQleBWyBmfMmZ0i/8W9ajPh5ad7g/Um2nc
 UgmSwZCMr37EmRrF/bctGxLTU6/pazKKd/WhsRJwzpRJLF+jHhxLS5h9ap1pznDXbgOpxZmbX
 jX+f1ZYT+WMuAuyfTnD7QPzLJsJl+/iiI+SUobP7E2k8kgV3C3Il/vhCjf7V3lZqiT2CTtqJ9
 U1IzcH9G/w==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: David Edmondson <dme@dme.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

g_mapped_file_new_from_fd()'s parameter is named 'writable'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: David Edmondson <dme@dme.org>
Message-Id: <20210225181344.3623720-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/elf_ops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 78409ab34a9f..6ee458e7bc3c 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -417,7 +417,7 @@ static int glue(load_elf, SZ)(const char *name, int fd,
 
     /*
      * Since we want to be able to modify the mapped buffer, we set the
-     * 'writeble' parameter to 'true'. Modifications to the buffer are not
+     * 'writable' parameter to 'true'. Modifications to the buffer are not
      * written back to the file.
      */
     mapped_file = g_mapped_file_new_from_fd(fd, true, NULL);
-- 
2.29.2


