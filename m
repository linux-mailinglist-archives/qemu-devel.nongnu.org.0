Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5679E38177F
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:12:41 +0200 (CEST)
Received: from localhost ([::1]:41140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrHk-0003ly-Dz
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9E-0005w7-Lq; Sat, 15 May 2021 06:03:52 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:45063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9C-0006Qb-U5; Sat, 15 May 2021 06:03:52 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MLi4c-1lzWWL1yUK-00HgpV; Sat, 15
 May 2021 12:03:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/16] virtio-net: Constify VirtIOFeature feature_sizes[]
Date: Sat, 15 May 2021 12:03:23 +0200
Message-Id: <20210515100335.1245468-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bRGzTGu9Z+JIoyff1IN1eNg5pPLUCaEIow/ncCv217hZHOH4Ff/
 Mx+Dr+GzRKsbd15hBMQB6eQLriZ91oQdSDCdKr8RXlWoOqXbuon9REIT8teCkTXRB+uAzXe
 Zfb4EKhmYjD3ARoKdQR02ZFDHt6Pzon6gW7XXorY7eeqY0jN9xh9m+WteZ6aaxHJSeRFpYz
 Fl62nxlZwap6G7RY3uI9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ENFba2k0SEU=:6PqXdtfhM2NtCbfKwK3Gl2
 eLCOZkFwIh1ZeepWD+2zLqAI0IT9VGiD51Qspkri0gI7QrB4NChswYz7W7Az0XY8Hvcn54xqG
 lVLDPo6FOlcQctsov66+KTK4AKpoKpDd68NOvJ05hr31jystIW+LvTBVa5Ic9qrF4Lpj9f8DW
 B1M5pS7rjL9edMiEuevq591uUuaXIn7HXP8xcvgwuPfnTajJO5aEbRh/r1qJjtGzU/Ne8VF6s
 qvQt1QMIgSHX8+71kTYL2b7UlSQKIM+oQSADNvIUqVG7pTVR2+314gVV827nffp6bhzBux8Po
 dpgZiYdLXSy/HfTSDY4e106iiz1nz+MkQaHHzI58Py+4s5e7ijLyDdD+1VfUScq7mjCpXph4a
 n5xjguxP7YsJD19b1FO61PGoGJj7b+W3+T2a1vI6SeNx2Nfi9scjA8LRZtaIIbHrfL9hAzFD0
 B1LUWVQqUCKXGNrWJWnnshOsFxTmv/8BAanlRb6JNA9XTH4TZShEOEmvD0v+oJ9eLnIZubpHx
 i4tta1MuJEJq5UWd5rtC1Q=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210511104157.2880306-4-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 66b9ff451185..6b7e8dd04ef3 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -89,7 +89,7 @@
                                          VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
                                          VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
 
-static VirtIOFeature feature_sizes[] = {
+static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_NET_F_MAC,
      .end = endof(struct virtio_net_config, mac)},
     {.flags = 1ULL << VIRTIO_NET_F_STATUS,
-- 
2.31.1


