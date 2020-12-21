Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCB22DF75B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 01:57:46 +0100 (CET)
Received: from localhost ([::1]:58344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kr9WE-0002h3-1G
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 19:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9Sj-0007GQ-VL; Sun, 20 Dec 2020 19:54:10 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:40973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9Si-0005RS-CF; Sun, 20 Dec 2020 19:54:09 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 41FE1580415;
 Sun, 20 Dec 2020 19:54:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 20 Dec 2020 19:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=SIxHxyqyLzEhn
 mwwU1peHf9lIiT+tCzX4idpVxjYV5I=; b=hCb37zU6RaIxloQK3e0NxyXYgZ1ah
 M+CHJ56h7KjWkiIj1yTOWIImIsrZmNl1KBHZCrW5qvVXp13hEOS/OFUgQKA9Wevm
 HCj9M6CdP3N6V3wXv1iLiinByI1V2nyXM1K/dGECdpb66wPT39bVarN/aWuRq0Ne
 f4BFrEM1EQlJdgls0T9SucNtPVJQiNPQ5k4+NrUIb+tEaHrVAdSzX2Bbp4+Ks17g
 4S3oQ4ZrSHFXj0K29WIao4pWlU3wBW3L32H7hFB1fsVPh0cphq+qV6VcAt78RD2P
 P5HUQkMfkYgIQCtVbTw7FHxJo/Wla33sL06hd00nDiQ3Okg7pdRI+q5Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=SIxHxyqyLzEhnmwwU1peHf9lIiT+tCzX4idpVxjYV5I=; b=J516B6b1
 EWF9W4G3Pc1+T/hP3MX8LSQP7rTy/EZPJiYJbg5hN1whHrQrfQhM49UvAk8qxL5B
 wsPClC0yDXFsafmaFN8G0Tf+tEEJWDjzzn9FqeQ14SG68wJo4/R/7vZ6ojcpqmwO
 F3jqr7nCj7PX1iDwdnWOd30Sze80TlUdEhpMq8CbLieFuyj0G4RWIhZFn9siMOLL
 /oKRcqy+MFilMmZhbnNJwUDXv3PER3kj8t5MZ3WbpiRlRfofamMdq1vCDacIVysc
 BqxV81qXNrXRNofJ1cL5LbHrx4eXYY6J8ZjRvZrBY3WzvbdZL7byBWqJYXIetKFz
 cCJ/eQP85sLHJg==
X-ME-Sender: <xms:LvLfX938PLhgeipFtadziqmxVS1zJXUsJNiKOeiUxeQceK3MnbxL3A>
 <xme:LvLfX0FU2EbVn0NQ-a6lvmn-ZOJISLtbJvNTj2ntHTNhIM73Jmcx7ytA7zkQLiPs3
 TZlsGHF7sNEKut9VO4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
 udetgfdtffeunecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
 gvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:LvLfX96dGodvxPSFsjeJyyubxHi3F6wg_fLFTPHPbORCTl_uAr_a5g>
 <xmx:LvLfX60XtsHeMRQL4Utj1MYO3bcAcKIkDBmsqnmFj8jwx-lvJqL9sw>
 <xmx:LvLfXwFHjSnfzGgM2b0U58vSQwXUh_sgseHDKw2D0TWCneizdbvI4A>
 <xmx:L_LfX9cIQqstWgQWZz48P6GM9-PwF5m2x5xSk0hArElgpn_81HvJIoqr6cN9CVWn>
Received: from strike.U-LINK.com (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 443E724005A;
 Sun, 20 Dec 2020 19:53:58 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] libvhost-user: Include poll.h instead of sys/poll.h
Date: Mon, 21 Dec 2020 08:53:13 +0800
Message-Id: <20201221005318.11866-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
References: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Musl libc complains about it's wrong usage.

In file included from ../subprojects/libvhost-user/libvhost-user.h:20,
                 from ../subprojects/libvhost-user/libvhost-user-glib.h:19,
                 from ../subprojects/libvhost-user/libvhost-user-glib.c:15:
/usr/include/sys/poll.h:1:2: error: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Werror=cpp]
    1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
      |  ^~~~~~~

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 subprojects/libvhost-user/libvhost-user.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 7d47f1364a..3d13dfadde 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -17,7 +17,7 @@
 #include <stdint.h>
 #include <stdbool.h>
 #include <stddef.h>
-#include <sys/poll.h>
+#include <poll.h>
 #include <linux/vhost.h>
 #include <pthread.h>
 #include "standard-headers/linux/virtio_ring.h"
-- 
2.29.2


