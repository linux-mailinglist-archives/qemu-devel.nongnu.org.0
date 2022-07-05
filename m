Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB825677B1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 21:22:25 +0200 (CEST)
Received: from localhost ([::1]:39334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8o7s-00037g-8e
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 15:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8o07-0001VN-0c; Tue, 05 Jul 2022 15:14:23 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:48073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8o05-00017W-1R; Tue, 05 Jul 2022 15:14:22 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2EAEE58031C;
 Tue,  5 Jul 2022 15:14:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 05 Jul 2022 15:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657048460; x=1657052060; bh=Jc
 C176lDo8fSZ8O89E3ByQV5biuotS/QBjwPiwIbzSc=; b=yHPdG7zafBN8Aa4jbb
 Ji/8+L9OHOczK8082IzNkYF2XEsEJc4rTVYWqvrx2MZdvSOvmsLfLmorRryIlSgn
 yiHqP9cbp9TY0pPVh7O6pGfS8tMHnuocdV3pf15v9SClniWLM9t9eQq25KWkst+S
 5Y/dUJZlok9XXxzwTOMfq6tCjgNUU9aRqamhCeU0L17U7QRjQiBQl9MWYWZA79ty
 utnxIgwQjyQe1KB9TrdiDbdfE8WkLP4Lb2JL8FFZWQoK77uu+JWXKEIGYAKT22Ei
 VkX1FxUWqg53JD+WCxi0Vtutl3w/k1CKce9qf6qa5/xCrbfuV9TdNeUNjJr0Y4pq
 VfNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1657048460; x=1657052060; bh=JcC
 176lDo8fSZ8O89E3ByQV5biuotS/QBjwPiwIbzSc=; b=wUsU1jPmuk76PuVkpuX
 jQzOfgneLhJX2G+H6Ux5I4k3I96T8wKl702bSS/YJktj92d5ncv05VZvB7LdqaDw
 eAPTmjcFMhGzZWGz+XD7VO2O865F/h7jS6u8NSc4WQdB21HsN2xmbceTSv8vkstL
 aYXo3RtzFLZbPC7lgUeRzM3TsHkWUqXD0902FM12mEtfuj8znhUJs4VjmTB1eVoj
 LXLf1R8e1arZRptoBN5OxSMeB4HHocQlV6Rccniva7b2pwGIszqBMjUlX9MpO1wc
 3talyTE6dVj3r4kX7d1Na03w9HV4s/q6+YNNHQsPB/4VxF4bZlwoul4KVTNshNF9
 HSQ==
X-ME-Sender: <xms:i43EYhh7EMCsueGV7vAbOu6H64_XMRcXg9SeTyLSGUN4jKvomh1JPw>
 <xme:i43EYmAVsiczfM7i_LGlLGGaYvsQZxb15OH3U2gqMbKkPxg0AsNRox-iOyhvvTFdm
 pp3W2g1N0hXqkO15UM>
X-ME-Received: <xmr:i43EYhGy59GIq86lRWKv8To54jTBxnUVQjA7Bj97iL6fAH4DwtUTFoYsiglZxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvg
 htvghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffr
 rghtthgvrhhnpedvgeekveekffehleeghefhuddujeehfeevheeujeffteejtdffteevve
 ekgefhfeenucffohhmrghinhepohhpvghntghomhhpuhhtvgdrohhrghdpghhithhhuhgs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:i43EYmSDMbS0H1NfLwzTqO3b-TbA1ongCuslzLmL4D6izlOjB1p51Q>
 <xmx:i43EYuyNlEkAuDBb5xEbaEkkp6_w1N9aB-GdchSM1peKxKdqqdPdFw>
 <xmx:i43EYs4ROcoucG4mHOkRQpSrxsB3wRi21-C0GI6Gj5bhaPN7hEwWcQ>
 <xmx:i43EYlrXsk94i-v4lme-45lRJn8uOvpav54U6vfbvrcJ7zz0fEk7Tw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 15:14:19 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] docs: aspeed: Add fby35 multi-SoC machine section
Date: Tue,  5 Jul 2022 12:14:00 -0700
Message-Id: <20220705191400.41632-10-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705191400.41632-1-peter@pjd.dev>
References: <20220705191400.41632-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 docs/system/arm/aspeed.rst | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 5d0a7865d3..b233191b67 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -136,6 +136,54 @@ AST1030 SoC based machines :
 
 - ``ast1030-evb``          Aspeed AST1030 Evaluation board (Cortex-M4F)
 
+Facebook Yosemite v3.5 Platform and CraterLake Server (``fby35``)
+==================================================================
+
+Facebook has a series of multi-node compute server designs named
+Yosemite. The most recent version released was
+`Yosemite v3 <https://www.opencompute.org/documents/ocp-yosemite-v3-platform-design-specification-1v16-pdf>`.
+
+Yosemite v3.5 is an iteration on this design, and is very similar: there's a
+baseboard with a BMC, and 4 server slots. The new server board design termed
+"CraterLake" includes a Bridge IC (BIC), with room for expansion boards to
+include various compute accelerators (video, inferencing, etc). At the moment,
+only the first server slot's BIC is included.
+
+Yosemite v3.5 is itself a sled which fits into a 40U chassis, and 3 sleds
+can be fit into a chassis. See `here <https://www.opencompute.org/products/423/wiwynn-yosemite-v3-server>`
+for an example.
+
+In this generation, the BMC is an AST2600 and each BIC is an AST1030. The BMC
+runs `OpenBMC <https://github.com/facebook/openbmc>`, and the BIC runs
+`OpenBIC <https://github.com/facebook/openbic>`.
+
+Firmware images can be retrieved from the Github releases or built from the
+source code, see the README's for instructions on that. This image uses the
+"fby35" machine recipe from OpenBMC, and the "yv35-cl" target from OpenBIC.
+Some reference images can also be found here:
+
+.. code-block:: bash
+
+    $ wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
+    $ wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
+
+Since this machine has multiple SoC's, each with their own serial console, the
+recommended way to run it is to allocate a pseudoterminal for each serial
+console and let the monitor use stdio. Also, starting in a paused state is
+useful because it allows you to attach to the pseudoterminals before the boot
+process starts.
+
+.. code-block:: bash
+
+    $ qemu-system-arm -machine fby35 \
+        -drive file=fby35.mtd,format=raw,if=mtd \
+        -device loader,file=Y35BCL.elf,addr=0,cpu-num=2 \
+        -serial pty -serial pty -serial mon:stdio \
+        -display none -S
+    $ screen /dev/tty0 # In a separate TMUX pane, terminal window, etc.
+    $ screen /dev/tty1
+    $ (qemu) c		   # Start the boot process once screen is setup.
+
 Supported devices
 -----------------
 
-- 
2.37.0


