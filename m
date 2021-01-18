Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACE62F9A1A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 07:47:56 +0100 (CET)
Received: from localhost ([::1]:38384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1OKR-00052e-DX
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 01:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OBa-0002eJ-LZ; Mon, 18 Jan 2021 01:38:46 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:51553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OBX-0007NP-6z; Mon, 18 Jan 2021 01:38:45 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 3266D1679;
 Mon, 18 Jan 2021 01:38:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 18 Jan 2021 01:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=m0nUlI5kVEPZD
 2X5aInSXbR27bFcE8kwt/2olAPs5Ys=; b=OOweqU4vom2803WNTu/dQXB7Jh9xS
 DKVoe5QTQGemUEAc878M/+ilrlyuZZBPE5JkQcxgQlUjj5gfFt0DZjZne7wGuZX/
 ZyEs0Mj6aaO53K3H2wk4DesAlk1gI49SckxDdymMA3tBoe+FVMleO4gEGRExX8WW
 5sBjS+1a0E9IZA1xcY5s2E+jbPqczL8J9TMPYe1U0LVRi8Z9IGafQ6HUSdtL22LN
 8xgr71r8eWEkPE79vHX6VHhbgLTqbC/Q4Z1iYa6RghLWizxcdcQZETJV3RcECi45
 AKTkUdEb2kZu7RGiNqr3OLME42QFSImfjwXQ8P82+1l1qNlr0CuO1uT2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=m0nUlI5kVEPZD2X5aInSXbR27bFcE8kwt/2olAPs5Ys=; b=OQB73Un0
 8ip0HFvMF1jTys7cMYkzLmxveWgnHDb9mBOTm2Zbthc7BmXSxWPKPsGfKmBk8Sxx
 V2wqsggWR5pvcUbVA5QdpvC4iVZa/OfmGdxonOXR7F2Z9pAVs5bBYfLa/C8NXplm
 j+KOFMA+NTdBafraTNDBKJURjdAr2q5l2Rbn/UggsYO3gKxPOfYiuHRF2ZR4vgMZ
 7z/olhrUpyFEF/khlR6qK9GslvB8a0K5F531+sw4zYLBXXULPv3GOygys2wN/nPH
 +dF6U4MVuJy4qVFI4bjY5+GcMWNMK2JsNFzjJ0e7Hlm1Mdj5upBCGaqNcsCQIqtj
 VhFkrEFqOUGoUg==
X-ME-Sender: <xms:7ywFYJYovDqfKjCbe0MH27opjT16f3DG6PsK2v58unrDMRAEjqIOGg>
 <xme:7ywFYAYo0tS69nSegiteRXolUc4L3nikFp0wf8nY5WALEL2Fc6pl_RA1rK0zFa0hu
 mQn0CR10hz0nvJ7_LE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeejiefhgfetleekleffudektdehvedujedvgeekkeejfefhhffhtedu
 tefgtdffueenucfkphepudduiedrvddvkedrkeegrddvnecuvehluhhsthgvrhfuihiivg
 epvdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihg
 ohgrthdrtghomh
X-ME-Proxy: <xmx:7ywFYL_GWH43qw8iTJ0_JW0Q_WV37tUud1Hr3ZoBcz-p4eL8--59dA>
 <xmx:7ywFYHqlU63ixWF0CNXNBInOlIiU2_xDhtboUSL_Q2KXkvvEaKLSXg>
 <xmx:7ywFYErVBIjFII8aAtkNR8ub-oAa-AWxLAsR0xdnskm4bZmFwIBmcg>
 <xmx:7ywFYP_uSBt_dV-mftACShn8aGSFQae9Fi6lrONARZSTZsRt7qVrLtqI6625Ik5V>
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id D126224005C;
 Mon, 18 Jan 2021 01:38:32 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] osdep.h: Remove <sys/signal.h> include
Date: Mon, 18 Jan 2021 14:38:02 +0800
Message-Id: <20210118063808.12471-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18;
 envelope-from=jiaxun.yang@flygoat.com; helo=wnew4-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Michael Forney <mforney@mforney.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Forney <mforney@mforney.org>

Prior to 2a4b472c3c, sys/signal.h was only included on OpenBSD
(apart from two .c files). The POSIX standard location for this
header is just <signal.h> and in fact, OpenBSD's signal.h includes
sys/signal.h itself.

Unconditionally including <sys/signal.h> on musl causes warnings
for just about every source file:

  /usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
      1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
        |  ^~~~~~~

Since there don't seem to be any platforms which require including
<sys/signal.h> in addition to <signal.h>, and some platforms like
Haiku lack it completely, just remove it.

Tested building on OpenBSD after removing this include.

Signed-off-by: Michael Forney <mforney@mforney.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
[jiaxun.yang@flygoat.com: Move to meson]
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 meson.build          | 1 -
 include/qemu/osdep.h | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/meson.build b/meson.build
index 3d889857a0..af2bc89741 100644
--- a/meson.build
+++ b/meson.build
@@ -1113,7 +1113,6 @@ config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
-config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f9ec8c84e9..a434382c58 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -104,10 +104,6 @@ extern int daemon(int, int);
 #include <setjmp.h>
 #include <signal.h>
 
-#ifdef HAVE_SYS_SIGNAL_H
-#include <sys/signal.h>
-#endif
-
 #ifndef _WIN32
 #include <sys/wait.h>
 #else
-- 
2.30.0


