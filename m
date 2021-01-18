Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DEF2F9A21
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 07:51:16 +0100 (CET)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ONf-0008Li-57
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 01:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OBW-0002d9-Ph; Mon, 18 Jan 2021 01:38:44 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:36537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OBL-0007K1-8v; Mon, 18 Jan 2021 01:38:38 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 53B0E167A;
 Mon, 18 Jan 2021 01:38:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 18 Jan 2021 01:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=JkDA4Wi2GI0B3
 bcDDU6/HuHDUW1caUijozfHO0X7odA=; b=Q2f63C4OvLf+Cic/HcnyLKb3GIU6n
 6JkVvAbnISPFBLJmqTJdPsntzLxIAIRu7tnVX661Ee9aUJ7tEYF0yYScMpHPuuT3
 gWpf+/VrJtKDFqPj459Rffq067mbK5/MDc5NYosp0sYlTHn21QqKnlnBgAeT9f6p
 g0NwnO2+b5Vu7xRWItwSG8+5gueF0xALnMdTbnngFDdJGznY0SvEu3GKnQLYRwQA
 TqtBsTB5Rws0rwFArRbt9XBqYozNr8RHPrmXublRcYfl2Rfx10v5Qlmd9DTQ9zrt
 YAVbUlq9v5KKn6/2+vdZ6FXMQiP0EMOA49V+jsIeRSsC/pbTEoksi0bow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=JkDA4Wi2GI0B3bcDDU6/HuHDUW1caUijozfHO0X7odA=; b=PsIhX8CC
 RKPW5WVS7OnLCtCD1JoI026OW7rEzsL+F2E6QHadrxlUBunyW387gYeAw6Olrxx1
 FemT9C6kWu8FaxEL5eAOQth89mEiv9bF0XmvPSYgIqoXas4JbJt0iwXli3Jg9Ipm
 05FlyQRIYdXf/yDl61PsSqHYarQwdeugt76OEuFnCM8sIofYFr0R5+DQNki0ec0a
 lXnYabCnDbzMrQnnwgU07GQdmFhW+6ZjDyIGd9QSyLJvHWcXuHV01NNhg5WDr5TS
 dx1tAe5yhTWXwPEUIolfEOCNbR7mW5nVbKSkg232MWzTlKZ73xMXxvgOa2dTdExr
 gWJ4/lwaNAaNwQ==
X-ME-Sender: <xms:4iwFYDQpTlWEeiJgIe9hTFeiJ5cDoMSakyBOdRBDwQKMeMLmyCuGwQ>
 <xme:4iwFYExfMudvoI-3dFmx9hDlkAN_7hTMjvFKawqBoJlHNqfxttHk0PRQUxozntgaU
 nOkLwY--S7XwviKVG8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeejiefhgfetleekleffudektdehvedujedvgeekkeejfefhhffhtedu
 tefgtdffueenucfkphepudduiedrvddvkedrkeegrddvnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihg
 ohgrthdrtghomh
X-ME-Proxy: <xmx:4iwFYI0zgWu2O_l4Y7dcl-I3w48Yem2suJCZIB2qR4LYE1E1Z9pauQ>
 <xmx:4iwFYDANM-uBbpiR4KsbV4Om1xovQjBTQs1VBA8-thlIA5-gNbFyOQ>
 <xmx:4iwFYMiBGQcq69O9tnHOXLp1gt_8qNUJpTc8B_SjKhgXHKppv0JH5g>
 <xmx:4iwFYIxps6-GK580Z8dKBTLw3OfR4Ce4SJwhVLbqk2Wh16mPRTl2ZEe9UA4brLFj>
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id A3E5424005C;
 Mon, 18 Jan 2021 01:38:20 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] configure: Add sys/timex.h to probe clock_adjtime
Date: Mon, 18 Jan 2021 14:38:00 +0800
Message-Id: <20210118063808.12471-2-jiaxun.yang@flygoat.com>
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

It is not a part of standard time.h. Glibc put it under
time.h however musl treat it as a sys timex extension.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 155dda124c..1a9e1afa39 100755
--- a/configure
+++ b/configure
@@ -4039,6 +4039,7 @@ fi
 clock_adjtime=no
 cat > $TMPC <<EOF
 #include <time.h>
+#include <sys/timex.h>
 
 int main(void)
 {
-- 
2.30.0


