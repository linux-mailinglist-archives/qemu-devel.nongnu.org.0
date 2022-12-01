Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB9C63F5B2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 17:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0mlk-00007n-Lu; Thu, 01 Dec 2022 11:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mle-00004u-9K; Thu, 01 Dec 2022 11:50:34 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mlc-00010j-5r; Thu, 01 Dec 2022 11:50:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C2BA75C019D;
 Thu,  1 Dec 2022 11:50:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 11:50:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1669913429; x=1669999829; bh=vt
 2LnSEqEl2fcqFs0pZHqD+KCOrlnuboXCNKIgJER8M=; b=TvduKCaUsqQC7WvMT4
 TVtLn14ujX7n2lUwj7IULbqhTl991mxif7PqPXHbwyoTNkSQSGwqM3jdfQWxG4kb
 siFf5M7yfrrFD71whJkxidyegexpmUNMUBJfastnV5rRKaB03wzb4RX3OORqpiIy
 uvkt+CGO0c7f3u3LmtTLda37UceiVm9J4ufwR92XRHIkGiUVFp/N1uRoVhMfLUgS
 zTUvdccaiKQHtUX6P/nF8rfZcu0PTtyWn52tboprlhcMgGcuVMESXWterjBdqRps
 pYnaQW9uvZ/iy+fva4cbE+P3ooocIGqK5t/VedobGC88Pv/wctqTrhsrddpOMJaP
 cIrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669913429; x=1669999829; bh=vt2LnSEqEl2fc
 qFs0pZHqD+KCOrlnuboXCNKIgJER8M=; b=mkPaMfKy/6SJT6Kru7Nd6kWpjAwmj
 kv+2WXitr1OgfY9evgGlA0TLfQ07tENN4aaPtnbyuDzg83xrlHtqCRJOVOIrLzwk
 PN3vSTm4OQfTzfkXXUuYUAwoC8+CBqwJ4qOG1xlb5ipgQT3KMUeE5Up/o71SYktA
 NYFdQ4NeMC1Cnzo+F0QrX8DhAIVJcKe5Jd+crnda+JvwW6TjnylSaJLJuBOyndu0
 Oy45x307uuzfdvi/op3GRabwbRlDSksF5fZ7+Wym/34L0lIDIw5mZKX5nvMNoKI8
 nasChTnMYe9VE5WI3VixVTuL/se+GjNLK3jC45O/29uD/C7Kr5vo0OFfA==
X-ME-Sender: <xms:VNuIYxlcivX78ST-kwPeJP_KUjS8a4FpmccyXXGsh7jS6mhgnmqzwQ>
 <xme:VNuIY83IqbcTe2Ryu49cPXh0GOVVZ6BkjQVh8bsOZZUyqgAsYDOUaT7AreL_3XpCa
 6uK6v6FXeXlZVvnVJg>
X-ME-Received: <xmr:VNuIY3oFD5gL-Trft7oaMREnDa0EfZ1rvcHwQwFl_lor_yk02JkwsabDRoFNzjbPPb1zKALQZUgNItGparuQ7V9ZkSSMprW6hVroHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffotggggfesthekredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepfeetieehhfejffekvdefgeevkeelgffggedvhedtgeetgfdvvdefuddtueejueeh
 necuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgu
 kh
X-ME-Proxy: <xmx:VduIYxldrFr1mXFwk27Q1_E1ZTeQ_T4iDY_KYhWkJWR-IN6vRIY8jA>
 <xmx:VduIY_3dVzR_XY_FXSeXIIxAcPg62kEDfoTM8r4EjYTvs5O0ud9-_g>
 <xmx:VduIYwtv_cbBCtIG922PAGItVq-x6v9zaOcVs2-rjJF7W4HvEvF4qg>
 <xmx:VduIYwyL4tUR8q_vo2RbYM4xLGUYJpOxYBshPxtRdaM9bPFc1jFoQA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 11:50:27 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL for-7.2 0/5] hw/nvme fixes
Date: Thu,  1 Dec 2022 17:50:19 +0100
Message-Id: <20221201165024.51018-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=986; i=k.jensen@samsung.com;
 h=from:subject; bh=loFDjacU7Co9odcJHtew2VFZihX9AMJZ7KnopOyaKT0=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOI20+AFjl8h1gim5bde8i8/s5tSrpNlpbhyHvc
 lv7tcmGIHIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjiNtPAAoJEE3hrzFtTw3pQE
 AH+wcsTbbir7EZRRzWM2gWwbiYAeS0ztTR21LqT/2R0Wu7qdRAmChz3AmtWPc6bRf6nUDPmEaGKtKQ
 5UUbnbS3Avr0op4TJuJW0z/fpysP4BrKrT+TKxxPDE7E9uKclricAZAU5EHOfH6KYnUXWrIYeayEub
 YXBjKidaVQOpgH5CP8MvdUlJaVW3ZJoWfd+clQVhKlIyJ7vye/AtRM8VYEDbr3u/t12wAxQJhVVemR
 3itvr6bjC2zdbgzOkl1IpQ3djNBipR6d/+4CsP0dUVeuFBjOWgMVfYlwOSwbeIxnyE9tCO8q8xLMZm
 Fou8XusE7LIHh0Bwb6vJ5T0wbLJl1ehUPqNKoK
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Hi,

The following changes since commit c4ffd91aba1c3d878e99a3e7ba8aad4826728ece:

  Update VERSION for v7.2.0-rc3 (2022-11-29 18:15:26 -0500)

are available in the Git repository at:

  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request

for you to fetch changes up to 83f56ac321ca2301f00e63b6acbde5c692916a1d:

  hw/nvme: remove copy bh scheduling (2022-12-01 08:45:03 +0100)

----------------------------------------------------------------
hw/nvme fixes

  * fixes for aio cancellation in commands that may issue several
    aios

----------------------------------------------------------------

Klaus Jensen (5):
  hw/nvme: fix aio cancel in format
  hw/nvme: fix aio cancel in flush
  hw/nvme: fix aio cancel in zone reset
  hw/nvme: fix aio cancel in dsm
  hw/nvme: remove copy bh scheduling

 hw/nvme/ctrl.c | 182 ++++++++++++++-----------------------------------
 1 file changed, 51 insertions(+), 131 deletions(-)

-- 
2.38.1


