Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B545E4DDB36
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:06:08 +0100 (CET)
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDF1-0003CE-QZ
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:06:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVCtL-000843-R7; Fri, 18 Mar 2022 09:43:43 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:36853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVCtK-0005IW-7P; Fri, 18 Mar 2022 09:43:43 -0400
Received: from quad ([82.142.28.230]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MUXYs-1ne6sD0Nvs-00QVc4; Fri, 18
 Mar 2022 14:43:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] virtio/virtio-balloon: Prefer Object* over void* parameter
Date: Fri, 18 Mar 2022 14:43:33 +0100
Message-Id: <20220318134333.2901052-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318134333.2901052-1-laurent@vivier.eu>
References: <20220318134333.2901052-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZO2GMyRro07Z4S9E5t2tzo51BMfa2Tt06d38WHW6fLFQggCmABA
 /YhcTulncakKDhzlm5aibCIZfKNWkgaOeQ8NMII/WnOGikSmusXr+XikHZv93uRgC/j9KwN
 k9YarZiXg5xW+KqCkLycAPbW0ImzLYzc67i8Ww4oRvqGxt2ePaBP0Opu+SKxdsrJPbmKS68
 pMcfO12gq0AmAFKGLzKJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:peJHJ3AOAmc=:ldC1/4sSo5M1OqH7rPu2Cw
 bHRLAl6CtCtciRejzHiDtFP3dMvYOD/8eY/8oGu25/tmuDUnYdU0lXTsHI/uZ1qpFMGDao8I0
 eUmfEAZzVCir+xeb6CeCh5cz0q8NCJbdh8pSKQGuwNz9/qB17zAe6COfpxxlyJC1TRKdtTmuG
 EhLEieb/jfXQtVEhHog8nzK6j7DYy0TCNMdR/FJhUqHtRHClb4eODIEoGV8KFzPrHNLNhvKlx
 K5xOFNVy8nL8DhL33i/qaRVxOlDsxlvC4EkNf3CzGdVR+j9kgLvd13KDorYIsGcPsnQYyJWfY
 33VjjTPFDStPbH+cxT7kIx83d6L9guWcFupCS3hKSICDdD1kNjpsDYe359XA69exE6c0s55s7
 h4k9i4+lUyETaGOXueiNBJVgdogcajvqG0eUkV+gncJkUUJKjmNVJhLeZCR2Mov81ntTBRvKf
 I1VelJqW4jDEW2qn4ifKx4WDsvpcXKxP4h5GQ1Ej85CHYAWOfz9C7bl+78bNkpg9+6zXc9wZx
 5U2TR2NCt8PQ14xXRdpdCmWi+JuipXeDUXHVExc6aidXYed8SlIKNXMMeCZAys4k2UcYkKZbe
 +/c7754DMrUOOWQEkbVzi2UT803PaveaTd+1M9C10Ifo8v4gh/K9IwWmMZWGSeubqWirIcdnN
 NS7GEqxjqMTE3eiyTCipTTvbERAE9CXxzgdWD8Vuqh+oiwd+wMW4jh7KucVCEFPmpp0Y=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

*opaque is an alias to *obj. Using the ladder makes the code consistent with
with other devices, e.g. accel/kvm/kvm-all and accel/tcg/tcg-all. It also
makes the cast more typesafe.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220301222301.103821-2-shentey@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/virtio-balloon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index e6c1b0aa46fe..163d244eb499 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -242,7 +242,7 @@ static void balloon_stats_get_all(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
     Error *err = NULL;
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     int i;
 
     if (!visit_start_struct(v, name, NULL, 0, &err)) {
@@ -277,7 +277,7 @@ static void balloon_stats_get_poll_interval(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
 {
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     visit_type_int(v, name, &s->stats_poll_interval, errp);
 }
 
@@ -285,7 +285,7 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
 {
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     int64_t value;
 
     if (!visit_type_int(v, name, &value, errp)) {
@@ -1015,12 +1015,12 @@ static void virtio_balloon_instance_init(Object *obj)
     s->free_page_hint_notify.notify = virtio_balloon_free_page_hint_notify;
 
     object_property_add(obj, "guest-stats", "guest statistics",
-                        balloon_stats_get_all, NULL, NULL, s);
+                        balloon_stats_get_all, NULL, NULL, NULL);
 
     object_property_add(obj, "guest-stats-polling-interval", "int",
                         balloon_stats_get_poll_interval,
                         balloon_stats_set_poll_interval,
-                        NULL, s);
+                        NULL, NULL);
 }
 
 static const VMStateDescription vmstate_virtio_balloon = {
-- 
2.35.1


