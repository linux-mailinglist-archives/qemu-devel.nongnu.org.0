Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62392F9A25
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 07:53:19 +0100 (CET)
Received: from localhost ([::1]:50592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1OPe-0001v3-Vo
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 01:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OC4-0002pc-H8; Mon, 18 Jan 2021 01:39:18 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:42981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OBy-0007Xv-H3; Mon, 18 Jan 2021 01:39:15 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 5282216B4;
 Mon, 18 Jan 2021 01:39:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 18 Jan 2021 01:39:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=f02riIqmTLQjf
 sxRmbAMxWaoH+GGUs+3oNGVdaXSoVI=; b=lz/uwNtjyS4HJK6A9jLDosCCw2xu/
 lKGto8uYLz1han+qS4v8X4RhN1ETSsgaWTAwKmwGTQrMnrETkrb3L81AzHVeLQnP
 wHwjKoDf6w8kDMQ3uRC3tSeZHAnFbWb2ng0dsnfW9tfiTmCFSxgfYx22TpM8jPPf
 PyfdvSmnRDyrn7ws3cCqPYBmWNuc1/dE/MPMm0kafxzjOhxvPdRYV0TG/TEabjFv
 LpMbjJTyBKtJzK2a/r6aSPBQdvULxKG9byNOD07E//kUsrzJhUf4PrxEs+arzAer
 K8D1syicVce8HJNPNvZgDPfSR3zVNYQp2rd+qg10caMfOt0acgJBjYQbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=f02riIqmTLQjfsxRmbAMxWaoH+GGUs+3oNGVdaXSoVI=; b=IItl3g64
 587aclrnXUPhADssPjQRWvNfM0ii43Rjnb0JCnBRL/SnduS5YKmswjKRF8VXkBl9
 l0vVfQgcJEQGlfXK2R+VDPSnKTlAEsWBHRxeIYgdPEarC4r44cOWwjmu1YhDxYUU
 I2UZssX6lde82ljHgxg97F9xF0IbXFk5S9nnke/KQEglnK92ri4GsSVI0W0ddtYX
 JihmSk3dRSH/4aEHL0IO4c2es4ndc/z5hACTayPKgIjfLGxOyth+GCOtmz5PpNMU
 FzvmRDAUX0xkFi1UmCzDVrNPzCOEP+BU7fXvOzqGrPQe34vymPbiMvAjyoY+k10z
 rhsofRywjHaxpw==
X-ME-Sender: <xms:CS0FYO1cJ7KEh2R5-sWcG-fdA_B8wsv3Vtdv2dJmykoehAcbhaWxgQ>
 <xme:CS0FYBGbsbAnWZQDbsK1IMHvd8MPZBnCfE9kd8rxRYkq7-GKZCMO9d83yEAEodeyf
 AfMOeWHdv6TQM1Ucxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpedtveehvdefleeghfeuveffjeeuffetffekhfeviedujeeiieevuddv
 iedtheffjeenucffohhmrghinhepohhpvghnghhrohhuphdrohhrghenucfkphepudduie
 drvddvkedrkeegrddvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghi
 lhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:CS0FYG6k_HVbjyz-1sDMQH5mP-Z_ASBFPq0t2QeQVQbwVVbWXTqg0Q>
 <xmx:CS0FYP1CmHbAODeVPDsjuzW9ILgnAypeIwGw_ZjJ_dw3sBGkR4Xomg>
 <xmx:CS0FYBGYg653Q6CKtevhG7z7gRgoiEQRKxCnna6TEYZ8ZwSDQyZOsA>
 <xmx:CS0FYDEcWQVXPhChRaAlwqCaUxRbremDLrBt2-e6fcPIdEm9Jb9Tqhu0Qg1ZTnm1>
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 97DE424005C;
 Mon, 18 Jan 2021 01:38:59 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] accel/kvm: avoid using predefined PAGE_SIZE
Date: Mon, 18 Jan 2021 14:38:06 +0800
Message-Id: <20210118063808.12471-8-jiaxun.yang@flygoat.com>
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
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per POSIX specification of limits.h [1], OS libc may define
PAGE_SIZE in limits.h.

PAGE_SIZE is used in included kernel uapi headers.

To prevent collosion of definition, we discard PAGE_SIZE from
defined by libc and take QEMU's variable.

[1]: https://pubs.opengroup.org/onlinepubs/7908799/xsh/limits.h.html

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 accel/kvm/kvm-all.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 389eaace72..3feb17d965 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -58,6 +58,9 @@
 /* KVM uses PAGE_SIZE in its definition of KVM_COALESCED_MMIO_MAX. We
  * need to use the real host PAGE_SIZE, as that's what KVM will use.
  */
+#ifdef PAGE_SIZE
+#undef PAGE_SIZE
+#endif
 #define PAGE_SIZE qemu_real_host_page_size
 
 //#define DEBUG_KVM
-- 
2.30.0


