Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06B06068A4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 21:08:27 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZKo-0007ti-NN
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:27:58 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYtn-0001ld-IC
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNY-0004vj-CR
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:49 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:40771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNT-00075X-4M
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:41 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mrfgi-1pQKd20mvc-00nhOZ; Thu, 20 Oct 2022 18:26:24 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH v13 14/17] qemu-sockets: update socket_uri() and
 socket_parse() to be consistent
Date: Thu, 20 Oct 2022 18:25:55 +0200
Message-Id: <20221020162558.123284-15-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+ectAVqzfLD15RXOAboSW3vFM9WAMIl+dKYc44wjvozpI/tnzCg
 rIHwidp7p6z4neTDyrqjXnNdb99F8rcFN2Fb3sFzWZhVQig7/+/rFeVFcjau2JFoXCJ7afc
 +TfUoXy8bp7kK7So5HyWZacTiwvibMDxLrmDklbleVKODWI9VqKavvrpXTAVsRv+Egkz1Rg
 1yFSDd+Ix1NcJBg3D6+9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mqueEkZiLpI=:ZsBOK4LEkS1/vUbVwLaoDM
 8HI4IqMr5O02EcQqqGensyZ6To9atfEtIeDMvZuBSlzGB58fKPLT+NkrsYGDW8G0EaE8kZPOk
 NUbx8GM4oVLfXAfgbLW/VpIcowNXHb3lEM3Bfeh4d7ciqAWBF27lfxn11IQb11P69Ix8ORVGK
 kYPyA+J78WTPGOC81ak2COzmUDejbIwe7BVHieVT9DDAY2K0V6DQyVHlSl69dFRClgnQ4qPOX
 6lNljdIIgOIFzngadIe3bYKtal9gLZz/n9TiVygip5W0Nc63lGCTXueAnawFYeRfOTilIyFdC
 Vcj3kvXUPvYOwl4RRo5KUZnYxeEXL4eznjhmtvSuJ5CvfvUnM3qAAXE/ynVEiWS8CP5ihKzK2
 gZWUx86yAB25wZSSxt19jvjHh8EC/kooPUw1crWV50G6enFqdLLuNjOqbsBnGzi3rebmbH5zP
 Mpy+DsjtSBuXIH7fTl7Aqm9jjpudYWsHVPU4UyHfW2trEyNEeoYph+HoOJdn7zbDIoF8Eocxz
 2fk+mI/Ex0nerLai2o4sVWxsi5TN45B7ZFzR6tFyZs+RoG8CNOFtwT+ang7P1WaHpQc39vwfB
 eA28YTbfNRJqXtXqZ5jmxO9BvHYh1VJzV3JDOYmqM1YaRu7Irlx0eOj8SEr54EEivxAkew7pn
 5ehmmTwjFdHroRFGHMRf7zh233ZUKOiugxRol6yzTOboaB3ZhvJxMfB9so2QEqm4YbLx/veQB
 DhSSBHrCpfhgZndtjMZyeWpMQLfpq+dVSkVdqby0/pDFjdC4dNIYyC9GDvW00uAw5SMaB+qUR
 1bTOaJ6
Received-SPF: permerror client-ip=212.227.126.133;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

To be consistent with socket_uri(), add 'tcp:' prefix for inet type in
socket_parse(), by default socket_parse() use tcp when no prefix is
provided (format is host:port).

In socket_uri(), use 'vsock:' prefix for vsock type rather than 'tcp:'
because it makes a vsock address look like an inet address with CID
misinterpreted as host.
Goes back to commit 9aca82ba31 "migration: Create socket-address parameter"

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 util/qemu-sockets.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 9f6f655fd526..a9926af714c4 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1090,7 +1090,7 @@ char *socket_uri(SocketAddress *addr)
     case SOCKET_ADDRESS_TYPE_FD:
         return g_strdup_printf("fd:%s", addr->u.fd.str);
     case SOCKET_ADDRESS_TYPE_VSOCK:
-        return g_strdup_printf("tcp:%s:%s",
+        return g_strdup_printf("vsock:%s:%s",
                                addr->u.vsock.cid,
                                addr->u.vsock.port);
     default:
@@ -1124,6 +1124,11 @@ SocketAddress *socket_parse(const char *str, Error **errp)
         if (vsock_parse(&addr->u.vsock, str + strlen("vsock:"), errp)) {
             goto fail;
         }
+    } else if (strstart(str, "tcp:", NULL)) {
+        addr->type = SOCKET_ADDRESS_TYPE_INET;
+        if (inet_parse(&addr->u.inet, str + strlen("tcp:"), errp)) {
+            goto fail;
+        }
     } else {
         addr->type = SOCKET_ADDRESS_TYPE_INET;
         if (inet_parse(&addr->u.inet, str, errp)) {
-- 
2.37.3


