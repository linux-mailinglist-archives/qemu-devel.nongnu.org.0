Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C23220E1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:40:55 +0100 (CET)
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEI0j-0001iC-PF
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEHpk-00069r-B9; Mon, 22 Feb 2021 15:29:32 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEHph-0007IE-EC; Mon, 22 Feb 2021 15:29:32 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C912E5C01C2;
 Mon, 22 Feb 2021 15:29:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 22 Feb 2021 15:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=HTbmG4L5dimVQlEHDp46JSmo+o
 iFWtG0aq9BZzQbH8k=; b=Am0nKJMyWofokdylEgZ6j240jvgKoxC2wVdywI3w7o
 TXw2t5imXEIfcVyKnq3lJNdUX2KJFcE7Cino2xXdppGcEOkDUkOhIW2hcwn9JgxU
 Au5NbMSTSgwfLmy1omaIUzfJI/0yozTI21G3/wRMdYGo3FwEAbm4V9KJa9cW7F7z
 2EElZcT0k3FK7xwj3Yf+NZ76HPURXoEaeujH+tSs/Cnw281zM2mJi8xddDWGDr2g
 +OpfcNkPl0K6g214dF1nR/7ie43FaD5qxd3H60bnS6XbJB3jbTmbbm9h3J62/SkE
 8yysKrqB4khbMSi1WT8iHLmvjf0sdqiVUjyez21aUR5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HTbmG4
 L5dimVQlEHDp46JSmo+oiFWtG0aq9BZzQbH8k=; b=iGLXLqjAYCZtjJ4hl/g9Ho
 bqA/CPQp/uL+/9fPyw9llQ+Bldd6QOioNzwdVDlCMRkcHPz53gCRTT+9lhegxGes
 rDVnPz/GLvIe0R9d/rJwmR++VQTQG8EoHC0wczrAnEvWEyCGEdWpy+al8HI5Dsck
 ki395+vkFwlneq10EdEYyvAKY1divuAl70zCYTh99IXEOES+bY2aZ8jasDuDicAX
 PgyRm/Duw05ScbhqGl7uEq3RNFpgPzgIyRBExuvpV9kyA9rU07OFVsEY+xswWYKQ
 7DBCT3BrJcBZq/k9GP1Le9vmNrLf4xo2t+GukpSYTT7AjRrHi4EuIqSh7PzT9vtQ
 ==
X-ME-Sender: <xms:JhQ0YGrFOSE7EqbPy7NhSzIXgnpaP_MMtq00n_tOgHbdf-89E99BKQ>
 <xme:JhQ0YMbNeN9BWT02FdSjpsaaeUC0eH3IY0D3ifQ81kXiMlp1pI4U-Io5kWl0vp-Ou
 vyElQF2EAk2wv1W6FE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgddufeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:JhQ0YOT8OIA5Ets7hKR2LjpNclXyxZt46KeD2inckAjw8txpAICrIA>
 <xmx:JhQ0YD4GOrA32ydiP-QWuZOGdVN02pv-gn87SKag5yQ4QqWeRI0sFw>
 <xmx:JhQ0YDxmSx0yqWxgoHcEdJ3jf6ed8V3QGNnrUe9iI12ssNE1DeH6VA>
 <xmx:JxQ0YE7FgPl1YKFVuiIGucrw0MC_VM0d1_u7IzuPjJitpn_hIE4LqA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44C5524005B;
 Mon, 22 Feb 2021 15:29:25 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/block/nvme: mdts/zasl cleanup
Date: Mon, 22 Feb 2021 21:29:18 +0100
Message-Id: <20210222202921.92774-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

The gist of this series is about aligning the zoned.zasl parameter with=0D
the mdts parameter. I complained about this back when I was reviewing=0D
the zoned series but was shot down. I relented on the size/capacity=0D
debate (and still fully support that), but I never really liked that=0D
ZASL is different from MDTS. Changing the definition makes the=0D
validation code much simpler and, well, it aligns perfectly with the=0D
existing mdts parameter, which is the goal here.=0D
=0D
While the current definition of zasl is in master, it has not yet been=0D
released, so this is sort of our last chance to change this before v6.0.=0D
=0D
I'll repeat the commit message of [3/3] here for context:=0D
=0D
ZASL (Zone Append Size Limit) is defined exactly like MDTS (Maximum Data=0D
Transfer Size), that is, it is a value in units of the minimum memory=0D
page size (CAP.MPSMIN) and is reported as a power of two.=0D
=0D
The 'mdts' nvme device parameter is specified as in the spec, but the=0D
'zoned.append_size_limit' parameter is specified in bytes. This is=0D
suboptimal for a number of reasons:=0D
=0D
  1. It is just plain confusing wrt. the definition of mdts.=0D
  2. There is a lot of complexity involved in validating the value; it=0D
     must be a power of two, it should be larger than 4k, if it is zero=0D
     we set it internally to mdts, but still report it as zero.=0D
  3. While "hw/block/nvme: improve invalid zasl value reporting"=0D
     slightly improved the handling of the parameter, the validation is=0D
     still wrong; it does not depend on CC.MPS, it depends on=0D
     CAP.MPSMIN. And we are not even checking that it is actually less=0D
     than or equal to MDTS, which is kinda the *one* condition it must=0D
     satisfy.=0D
=0D
Fix this by defining zasl exactly like mdts and checking the one thing=0D
that it must satisfy (that it is less than or equal to mdts). Also,=0D
change the default value from 128KiB to 0 (aka, whatever mdts is).=0D
=0D
Klaus Jensen (3):=0D
  hw/block/nvme: document 'mdts' nvme device parameter=0D
  hw/block/nvme: deduplicate bad mdts trace event=0D
  hw/block/nvme: align zoned.zasl with mdts=0D
=0D
 hw/block/nvme.h       |  4 +--=0D
 hw/block/nvme.c       | 67 ++++++++++++++-----------------------------=0D
 hw/block/trace-events |  4 +--=0D
 3 files changed, 25 insertions(+), 50 deletions(-)=0D
=0D
-- =0D
2.30.1=0D
=0D

