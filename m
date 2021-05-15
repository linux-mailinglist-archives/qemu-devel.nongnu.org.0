Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F6938177A
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:10:17 +0200 (CEST)
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrFQ-0006Rc-UN
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9C-0005r3-VU; Sat, 15 May 2021 06:03:51 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr99-0006O2-G8; Sat, 15 May 2021 06:03:50 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N3Kc8-1lYTUc2vCc-010PW7; Sat, 15
 May 2021 12:03:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/16] virtio-blk: Constify VirtIOFeature feature_sizes[]
Date: Sat, 15 May 2021 12:03:22 +0200
Message-Id: <20210515100335.1245468-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9hsZWkOkDIxZzI1MB9M8jN7watGfigavbQE7+h/fcvuh1qfLfPM
 mttQBh97vnrAjL4tTbZdKu7eKmbz8Xk5e/RKrid3IRCkS/SxbBOSNUbADt43jPIxcVdZM7/
 naAeeEH7yrpEZhwW+PIIGWxQmqic0+kA9CKLKYkOl0uBOp6BU99WFRCKetttS3Or9CaQCvF
 BVaypqvAN3uy7aW3ZOzhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6eM4hRaTKjY=:oQczKcuZE3nSGtC0blaxhV
 D2DgxpAe0eGFt1X8+qWeHORfYukaJRdxMSdEAK7F4O6glQL03423CKdJyWx7+ohxao+MqXG37
 urUjiCwwSWyEduuGkyLgZfowDcpU3kKWvaEU7iGp0+A1PJUeUCLz8Ezy6+HvJ/XlE3oIhim1z
 yvKB2p0/KMgWWL25+6BCBUzZlM8zDQsaOZdt//yydKElQN0WMdZPoj8n8P3nXs3ND4oP4UwXW
 wUUai3lDgGbyxQaSuILMoLsfCH8zhKXiDepNLhT6AxHop4/5zoA+a5Zw2fPf6n+y6Pe8Rz13F
 56gBxaQ6NlyxTyLthXTuVXGGwlgN/6TaPI8yLrvqqrGc18jkhOH57PMicgedtYtMTbNeYoh/k
 DiDp/sr1z0Ll+K8Cg2RYd345XRV6h+zcC7HDA7iuEmNFUeezL4RxLd1FSy89JaessquGQZ1IE
 a27RO2NbAlg+0w+M1USJZMjrwfBJxAq4esjPEQfDBamUkRy+8ESBmgMCzA/+3BbdFr79t/Be9
 38/hu83Kug9UQTANP1nDJA=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Message-Id: <20210511104157.2880306-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/block/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index d28979efb8d7..f139cd7cc9cc 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -40,7 +40,7 @@
  * Starting from the discard feature, we can use this array to properly
  * set the config size depending on the features enabled.
  */
-static VirtIOFeature feature_sizes[] = {
+static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
      .end = endof(struct virtio_blk_config, discard_sector_alignment)},
     {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
-- 
2.31.1


