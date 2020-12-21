Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6DD2DF761
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 02:02:09 +0100 (CET)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kr9aS-0005eW-7y
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 20:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9TH-0008IO-05; Sun, 20 Dec 2020 19:54:43 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:46539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9TE-0005bN-Hr; Sun, 20 Dec 2020 19:54:42 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 702CA580428;
 Sun, 20 Dec 2020 19:54:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 20 Dec 2020 19:54:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9UYdNJjXn4om7
 2WGzYzSS6tZtwVGabGeZphyZWQCWjs=; b=rn1ggbbJN37cNfK/YCKEM5yFWhFib
 GuoqhQiq1QPZzYVOj+qLbnx1WHrhxxHlaOj4Q76NvHCT3R2MwkLe73mqtLXAkMDO
 6kk6ncZprILgAeTEwMzaU+LREJF0ugJxjtuBESQ6wzX3NUBhpSUWV5bf8gL1XCRB
 n9OicS7dx8rX7Nzi2GG0vxG8Flq0M5KxfDiiSQRNEa98QsKdYFx+K9uuO0pNKXZg
 pmH0s0tJBZXQ6Yh4Wd0Trru5zuczr7Sz/+fGvqvSCGyZqR2s4EwmfOUJQ0MuaQS2
 +9CAAZB6j7+LleYGo4IOrG40vZqGVc2WXmOVT/IuMVBtlzcC9sRWJoD3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9UYdNJjXn4om72WGzYzSS6tZtwVGabGeZphyZWQCWjs=; b=Qck8JKGW
 KjvkXlimw4lkc5XfEauZhw9xUMeZ1Tcee5fP9ihndLqNH+luWEKcUzAAiiUeaGke
 /WEwXcxJjdgD5IuOL5eQhumFLZbHwxZX7pciwGYTZInt2fZ70B1/IWMwvUf8q5GM
 Wb/6fp/8xRNHyFth9X8blmsg8d0phiGuHQzcvtZZUgUuqKQ57RYTsE4qk8uh8IfV
 MfHSL6iJbquJb7FZjMjpfkrz58rK5vQz2EJwveCbtVLbSAaQ3tZlsDKue7fg1eDM
 7Ca09szp9L6O5a3llDMylhR5xTYccu0vCApW5gIQoW+ZgGs8Od8FT3qafpyJWMq+
 K35ZTmE75NH8lQ==
X-ME-Sender: <xms:T_LfXxOD7Y8P9JwLIAw4qUIeTmkJxkrKybKZXk-eNDTCFu_FSoJhpA>
 <xme:T_LfX9mT_NYfjiWb8SdLbJv-gvqNAI04ENHY6h_5ppag97NiZYMsohCvVBrZsXRh8
 b5wxdfpbFI6wbNPD_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnheptdevhedvfeelgefhueevffejueffteffkefhveeiudejieeivedu
 vdeitdehffejnecuffhomhgrihhnpehophgvnhhgrhhouhhprdhorhhgnecukfhppeeghe
 drfeefrdehtddrvdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:T_LfXwThPaIif8rJOFWDReO3aFagCuIJgyFpQ50yeEZ4IbgBHvvZvw>
 <xmx:T_LfXxBvsMiZDmgznC99QIL0SkTkLdlk-PMbCpzwePa3G_UcL5nUpw>
 <xmx:T_LfX3QtciIcMP1Z5x4manoGpDpGtztw-jW_1eafsiFQ4p62Y2YW2A>
 <xmx:T_LfXwyDQ8CX6wu0cCYg2rjrc1kXq9okzbRkxU7wpzom2GaddB7hiRa5AG0u4vxJ>
Received: from strike.U-LINK.com (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id AC5C4240057;
 Sun, 20 Dec 2020 19:54:29 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] accel/kvm: avoid using predefined PAGE_SIZE
Date: Mon, 21 Dec 2020 08:53:16 +0800
Message-Id: <20201221005318.11866-8-jiaxun.yang@flygoat.com>
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

As per POSIX specification of limits.h [1], OS libc may define
PAGE_SIZE in limits.h.

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
2.29.2


