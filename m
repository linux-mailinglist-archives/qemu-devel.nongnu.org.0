Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFDE4BFF0F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:42:36 +0100 (CET)
Received: from localhost ([::1]:58196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYFI-00014Y-0Q
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:42:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXqR-0008EF-Dn; Tue, 22 Feb 2022 11:16:55 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:39911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXqG-0005e2-6U; Tue, 22 Feb 2022 11:16:54 -0500
Received: from quad ([82.142.17.50]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MStT6-1nogXg2TbK-00UKZg; Tue, 22
 Feb 2022 17:16:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] vdpa: Make ncs autofree
Date: Tue, 22 Feb 2022 17:16:23 +0100
Message-Id: <20220222161624.382218-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222161624.382218-1-laurent@vivier.eu>
References: <20220222161624.382218-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rmVM5WGWPKasarRE3cpUe12de7fpmIbq4i52tAPE+lQ15mx1sYF
 UWDj/tDHZ3fhK28aDqJGrTRZkirUd2FB/CR0yNT01m5H/iVlndvH+777gOVUga5cpERCQTb
 uAMdwmAt6Fn43wN6B2QxyRcPicY09HxcPjIK+i97wnGdZpMeqbzRSK48gmV+JF3UPwZ9xFj
 EPD9D3QKJ+00cnEu3q8xg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:izCHUsKb+jU=:I7vHYsEujlmpe5AxNd5JCS
 7Mlw7tvd8n62z4pRvS4tclfSzQUxDHmU0XzuvYblLS5bUSs6zv6SVBoTz04+J1WWaxZHX9H0f
 T/QGyaCU6lAXlXcyxzTVMpB38KfoWdzbBaFwubfRHicFuH4zb3XqQ5zhfuCkrglwvBotq8/nd
 FYtFlmnmYIup0JyjiN/rr9Hc44bQ6MteB7+SNryyD890JEL3MBNKBs9pWuf9B+4lFChS4yD/D
 +oEkAUf2A38IWcRYvILTUHWJ+hH2+PW7AgQ4I0WFq8SxyTCGe5UFFW600lIMlrhQs2hn1DxXy
 hTpcd+Y8/cSME0BnSzPHX5Uczk8T889I9IC8OmcT7SBy8WlCe5lu3jEThZDs0iEcFOtT19Lzz
 el+JsoPCXyuHI+ph5xwN/mHRWbdO8YxNzYzALqHUd/29pby88jboERCKu4j3N+4VZ9rDpNnC1
 X/yKbQZysjye0It0+xSqLY4a9QJbdGX93JJXnplJVhlfeSbvvODuo29ax03UYQrOXayG1WggA
 Ehglax6x2JdoOxBRUwnTTEQntTzeEVn4lMwVDyQ0xYGHQI0nPnHRVIAv9ZTtz+48OEcmM7JKZ
 DsEbvD0ndOJGc2Bw1eX6La3h31HhcYATe31xUi1maM1p3Am31/7RJFmBTWErM56sMAzcjHK5I
 95ZUYmdyGwwiKTt2MQLM0JFhIxOIqWQqlMoK/SMV9RTdDP0SXv2NcBT0GU8uLQymSs4M=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Simplifying memory management.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214193415.1606752-2-eperezma@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 net/vhost-vdpa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 25dd6dd97547..1e9fe47c033d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -263,7 +263,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 {
     const NetdevVhostVDPAOptions *opts;
     int vdpa_device_fd;
-    NetClientState **ncs, *nc;
+    g_autofree NetClientState **ncs = NULL;
+    NetClientState *nc;
     int queue_pairs, i, has_cvq = 0;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
@@ -301,7 +302,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
             goto err;
     }
 
-    g_free(ncs);
     return 0;
 
 err:
@@ -309,7 +309,6 @@ err:
         qemu_del_net_client(ncs[0]);
     }
     qemu_close(vdpa_device_fd);
-    g_free(ncs);
 
     return -1;
 }
-- 
2.35.1


