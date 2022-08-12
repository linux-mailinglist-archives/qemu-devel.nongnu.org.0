Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA4059105E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:52:21 +0200 (CEST)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTDA-0005AF-8n
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1oMT5t-0007yg-WA
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:44:50 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:38282
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1oMT5r-00029P-Lq
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:44:49 -0400
HMM_SOURCE_IP: 172.18.0.48:45914.1860825121
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 459232800AE;
 Fri, 12 Aug 2022 19:44:32 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 204badfbee9b45998b3f7403201f9b76 for
 peter.maydell@linaro.org; Fri, 12 Aug 2022 19:44:35 CST
X-Transaction-ID: 204badfbee9b45998b3f7403201f9b76
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: tugy@chinatelecom.cn
To: peter.maydell@linaro.org, f4bug@amsat.org, marcandre.lureau@redhat.com,
 qemu_oss@crudebyte.com, richard.henderson@linaro.org, berrange@redhat.com,
 mst@redhat.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 tugy@chinatelecom.cn
Subject: [PATCH 0/2] introduce qemu_socketpiar()
Date: Fri, 12 Aug 2022 19:44:28 +0800
Message-Id: <cover.1660303075.git.tugy@chinatelecom.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Guoyi Tu <tugy@chinatelecom.cn>

introduce qemu_socketpair() to create socket pair fd, and 
set the close-on-exec flag at default as with the other type
of socket does.

besides, the live update feature is developing, so it's necessary
to do that.

Guoyi Tu (2):
  osdeps: Introduce qemu_socketpair()
  vhost-user: Call qemu_socketpair() instead of socketpair()

 hw/display/vhost-user-gpu.c |  3 ++-
 hw/virtio/vhost-user.c      |  2 +-
 include/qemu/sockets.h      |  3 +++
 util/osdep.c                | 24 ++++++++++++++++++++++++
 4 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.25.1


