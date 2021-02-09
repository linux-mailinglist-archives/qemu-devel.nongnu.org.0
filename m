Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0986D314991
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 08:38:02 +0100 (CET)
Received: from localhost ([::1]:57164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Nay-0007Qr-Ug
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 02:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUe-0004nm-Pv; Tue, 09 Feb 2021 02:31:28 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:36007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUc-0005QP-JP; Tue, 09 Feb 2021 02:31:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 425C299C;
 Tue,  9 Feb 2021 02:31:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=F0QbxQANs+Bui1C/Dkl75Vl/O9
 2YWJKA3Sbd1Cv6o3s=; b=Hzm2MSePxrMshbDMZl5TQd6QR8xW4TTAUs6FNAFaNB
 bUp2pkFLHbnl9iaa548dcwaf1EY/hpREZenrYIHwGoB5JZ8H5++bFOhogLoVQEQE
 TSyDKjs3DlweKqaYJKZ2cgWqFMfqPk3Z+oLn87CFDgFvkc+j8MUjaHPgkIXsSDHa
 kB+B61vi0UhyqmKHooZClxPl9/+7GzeG7xEdk8qzrQuVm6QY23VB4d69f6IL4FIZ
 q1g/b9mcG9oLTvaJ9J9BzwnPAzlIHOeDeIK/eb/D0wgnowhHlNmcKjjWU8MFP1Qw
 b2/tss4oMFDWQv/7YVyzzwuYAgT3d4SGimXIuJ/wAFaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=F0QbxQ
 ANs+Bui1C/Dkl75Vl/O92YWJKA3Sbd1Cv6o3s=; b=BH9y9N8pKQxnl9Apj+ac1Z
 OSYzdfrJ2Klg5OLG67DvFD8j+/JXA9+WB2iJKdNcf4ev6ifcxWV14q8T9FJSYyaI
 wDoeR5uGe0NdhuKets7b9pHm/a2WLTOtG1bZdgXrBZwqDb6cgDIdsevYOdCPGzHX
 r8/pGWifuf/WUzp6TO/omOazFrVfwHVm4glAPFDpFGD5OZHbBh1vA/r+RPaIBlPc
 QxT28ezL4p9emHw77EFY36G72U3K9TOqtYbRSQwm+l8g0wM9Df06i/xGaKYW2D6M
 qcNxVw1QTh5bUn5DesXPNfhNHy83dmTV+x+CCDr25Aw7YIpyKG+0kfOuNh9VKldw
 ==
X-ME-Sender: <xms:SDoiYI_4XuXnLJ6xBQ9Kc0k4izvZFL3AIOSw-VDlml9VTvQjP4TkeA>
 <xme:SDoiYAtrimpy-GTHurYC97Pq6p1OAcwlpdvwEUB8kjiUHBAxrGML-I9Dt4UnQtEsE
 lbz0S_J41ws6nPbcAI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepvdfhueejueejkedvudeftdetvddtgffhteelgeeluddvveetuefhfeekfeeuhefg
 necuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppeektddrudeijedrle
 ekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:SDoiYODNn-gAJ5y_L8dxb_WfiIKsLTol4ouMbB9Kl0Lj9mtBXfqRdg>
 <xmx:SDoiYIdUZe50FcNBWFPlOUnD7eQvTbmfKCt_hLko00bcBZb9fHcYMg>
 <xmx:SDoiYNMLzsUdLmggE_iDWLngxt98MKq54L0fVYtoGoY_iBvYuWR_Rw>
 <xmx:SToiYAfOYLW5mTgM-j4mVw-evFh-OBkAlTyC085kWuFBLDo8ZWApsA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 760A6108005B;
 Tue,  9 Feb 2021 02:31:19 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/56] emulated nvme patches
Date: Tue,  9 Feb 2021 08:30:05 +0100
Message-Id: <20210209073101.548811-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

The following changes since commit 4f799257b323e1238a900fd0c71c2057863e0308=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-02-08' i=
nto staging (2021-02-08 16:12:21 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to 3e22762edc74be3e1ecafc361351a9640d114978:=0D
=0D
  hw/block/nvme: refactor the logic for zone write checks (2021-02-08 21:15=
:54 +0100)=0D
=0D
----------------------------------------------------------------=0D
Emulated NVMe device updates=0D
=0D
  * deallocate or unwritten logical block error feature (me)=0D
  * dataset management command (me)=0D
  * compare command (Gollu Appalanaidu)=0D
  * namespace types (Niklas Cassel)=0D
  * zoned namespaces (Dmitry Fomichev)=0D
  * smart critical warning toggle (Zhenwei Pi)=0D
  * allow cmb and pmr to coexist (Andrzej Jakowski, me)=0D
  * pmr rds/wds support (Naveen Nagar)=0D
  * cmb v1.4 logic (Padmakar Kalghatgi)=0D
=0D
And a lot of smaller fixes from Gollu Appalanaidu, Minwoo Im and me.=0D
=0D
----------------------------------------------------------------=0D
=0D
Andrzej Jakowski (1):=0D
  hw/block/nvme: indicate CMB support through controller capabilities=0D
    register=0D
=0D
Dmitry Fomichev (11):=0D
  hw/block/nvme: Process controller reset and shutdown differently=0D
  hw/block/nvme: Generate namespace UUIDs=0D
  hw/block/nvme: Separate read and write handlers=0D
  hw/block/nvme: Combine nvme_write_zeroes() and nvme_write()=0D
  hw/block/nvme: Add Commands Supported and Effects log=0D
  nvme: Make ZNS-related definitions=0D
  hw/block/nvme: Support Zoned Namespace Command Set=0D
  hw/block/nvme: Introduce max active and open zone limits=0D
  hw/block/nvme: Support Zone Descriptor Extensions=0D
  hw/block/nvme: Document zoned parameters in usage text=0D
  hw/block/nvme: Correct error status for unaligned ZA=0D
=0D
Gollu Appalanaidu (4):=0D
  hw/block/nvme: add compare command=0D
  hw/block/nvme: fix set feature for error recovery=0D
  hw/block/nvme: fix set feature save field check=0D
  hw/block/nvme: align with existing style=0D
=0D
Klaus Jensen (26):=0D
  hw/block/nvme: remove superfluous NvmeCtrl parameter=0D
  hw/block/nvme: pull aio error handling=0D
  hw/block/nvme: add dulbe support=0D
  nvme: add namespace I/O optimization fields to shared header=0D
  hw/block/nvme: add the dataset management command=0D
  hw/block/nvme: fix bad clearing of CAP=0D
  hw/block/nvme: fix for non-msix machines=0D
  hw/block/nvme: conditionally enable DULBE for zoned namespaces=0D
  hw/block/nvme: fix shutdown/reset logic=0D
  hw/block/nvme: merge implicitly/explicitly opened processing masks=0D
  hw/block/nvme: enum style fix=0D
  hw/block/nvme: zero out zones on reset=0D
  hw/block/nvme: add missing string representations for commands=0D
  hw/block/nvme: remove unnecessary check for append=0D
  hw/block/nvme: fix zone write finalize=0D
  hw/block/nvme: add size to mmio read/write trace events=0D
  hw/block/nvme: fix 64 bit register hi/lo split writes=0D
  hw/block/nvme: move msix table and pba to BAR 0=0D
  hw/block/nvme: allow cmb and pmr to coexist=0D
  hw/block/nvme: rename PMR/CMB shift/mask fields=0D
  hw/block/nvme: remove redundant zeroing of PMR registers=0D
  hw/block/nvme: disable PMR at boot up=0D
  hw/block/nvme: bump to v1.4=0D
  hw/block/nvme: lift cmb restrictions=0D
  hw/block/nvme: fix zone boundary check for append=0D
  hw/block/nvme: refactor the logic for zone write checks=0D
=0D
Minwoo Im (7):=0D
  hw/block/nvme: remove unused argument in nvme_ns_init_zoned=0D
  hw/block/nvme: open code for volatile write cache=0D
  hw/block/nvme: remove unused argument in nvme_ns_init_blk=0D
  hw/block/nvme: split setup and register for namespace=0D
  hw/block/nvme: remove unused argument in nvme_ns_setup=0D
  hw/block/nvme: error if drive less than a zone size=0D
  hw/block/nvme: fix wrong parameter name 'cross_read'=0D
=0D
Naveen Nagar (1):=0D
  hw/block/nvme: add PMR RDS/WDS support=0D
=0D
Niklas Cassel (2):=0D
  hw/block/nvme: Add support for Namespace Types=0D
  hw/block/nvme: Support allocated CNS command variants=0D
=0D
Padmakar Kalghatgi (1):=0D
  hw/block/nvme: move cmb logic to v1.4=0D
=0D
Zhenwei Pi (3):=0D
  nvme: introduce bit 5 for critical warning=0D
  hw/block/nvme: add smart_critical_warning property=0D
  hw/block/nvme: trigger async event during injecting smart warning=0D
=0D
 hw/block/nvme-ns.h    |  112 +-=0D
 hw/block/nvme.h       |   31 +-=0D
 include/block/nvme.h  |  340 +++++-=0D
 hw/block/nvme-ns.c    |  290 ++++-=0D
 hw/block/nvme.c       | 2333 ++++++++++++++++++++++++++++++++++++-----=0D
 hw/block/trace-events |   50 +-=0D
 6 files changed, 2823 insertions(+), 333 deletions(-)=0D
=0D
-- =0D
2.30.0=0D
=0D

