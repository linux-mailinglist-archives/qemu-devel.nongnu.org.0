Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE662DF75A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 01:57:33 +0100 (CET)
Received: from localhost ([::1]:57724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kr9W0-0002Qt-0i
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 19:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9SS-0006oR-BU; Sun, 20 Dec 2020 19:53:52 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:52653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9SQ-0005Mq-C1; Sun, 20 Dec 2020 19:53:52 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 536F2580413;
 Sun, 20 Dec 2020 19:53:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 20 Dec 2020 19:53:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=KWLNfn6cch3ST
 kJIn9ZITmEXeddtBMzmWKV1IAEIciA=; b=SIelJS4Fke3A/aeRfSeo5JZd7hpoo
 lGPByjwCuuxZZSdIaz5cO5929SskOcL0ukg0hPUgyWQuvuGqm7lg/ObLoHZbMvBY
 xfdkJ9zqRhXOIUPTAuf6YuZLXp+XMLtd/MzkCTM/B/sP58UI0XrIMJhtCjf6zTK1
 B3wv3LCN3BJOmT/6DdNQWM8QKAmKd/qfAj22xjk+6mCFiiVpNRcxq7NMK0Flo75v
 /U95VeXOXneGZw9zeDMnRpWH9bOwG8T+WARTQuGsFcr8AwjNr/DLejg2g/kIvLOH
 K80WrgvFTPeowZCv1YJifdyS6g955nYxkCC+2mG28cGMF7S6/XXSl3IHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=KWLNfn6cch3STkJIn9ZITmEXeddtBMzmWKV1IAEIciA=; b=TdJUcTr4
 tJAhXwVjbuSZj2bwRxiwq3vjLrSeGQJhBOxVsxauF1dRlQxau4X89dB8t+iVW8EO
 BrFTJevYoqc1S7HC0N9M2IsKxW+OFc8O4h4BeODsAqw2yEoPqPCri9RHE/mBvKgO
 23/XADnLaiLPa7OGVzWqsdRibjcgUetjU3yPx2cZlBwqov6eLwcC1xnlE9Vqc549
 4QPXmmOwJ4ENMshP2Kdyqrc4EpPrDM8Yeexw57Gsbb/dXXdLKOxlGLw78ipee+Mx
 VOi3EqRJzMpUx8djRCzGqsGelVw+2EjXXpqGPXsgyN2xyyF1inWWQayYouqj5hQp
 jMxdXVOz33Vz9w==
X-ME-Sender: <xms:HPLfXzE5WPIREl4Aa5KPmO_-btAmCMXTG6QfeDBm0U4zyAhYPwOa9Q>
 <xme:HPLfXwV8FPKLkeF6mTKWkSWrxC49-cOfhJfjRg-lP1-kUwsZiOyipOvcHelbv9GFh
 6XnEYVVIwk3onwT-8I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
 udetgfdtffeunecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:HPLfX1KkIRxG_Ykal9Up_fkfsPPDCsoR2__lED_Wc8lmgbWB9o5OoA>
 <xmx:HPLfXxEPcBCBla-cwjKt1tjuKmsmar9qh9byjfQ3vMqfhBLPcOuTkw>
 <xmx:HPLfX5V0L4vcwQQKUFsxwoqBXyhdXYTQ-swo_GMvyrRCwhvTEr5pJg>
 <xmx:HfLfX6tYE8V6oc3zFe1YgpRfrG_5yKbEsaCX0mOD8S21Mg_REO-yJfo-rqAk8fkq>
Received: from strike.U-LINK.com (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E63A240057;
 Sun, 20 Dec 2020 19:53:41 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] configure: Add sys/timex.h to probe clk_adjtime
Date: Mon, 21 Dec 2020 08:53:11 +0800
Message-Id: <20201221005318.11866-3-jiaxun.yang@flygoat.com>
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

It is not a part of standard time.h. Glibc put it under
time.h however musl treat it as a sys timex extension.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index c228f7c21e..990f37e123 100755
--- a/configure
+++ b/configure
@@ -4374,6 +4374,7 @@ fi
 clock_adjtime=no
 cat > $TMPC <<EOF
 #include <time.h>
+#include <sys/timex.h>
 
 int main(void)
 {
-- 
2.29.2


