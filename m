Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DB4418E9F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:24:30 +0200 (CEST)
Received: from localhost ([::1]:41598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUj7t-0006nA-4Y
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj1o-0002Xt-Sa; Mon, 27 Sep 2021 01:18:12 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:36293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj1l-0008FJ-EE; Mon, 27 Sep 2021 01:18:11 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id B8C512B011FC;
 Mon, 27 Sep 2021 01:18:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 27 Sep 2021 01:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=t78vfTUGeTLCIFrKtCCBCYtotE
 9BeXII9h6fhKIW4yU=; b=O6FIY4Yfo28rHBswdLkA6VPyvHvMEJe2zuzXY30Ty6
 4o0liKgKjotCrbQP/Lp2RLn569aChDvx72xOXA9p3vYap5AEumNGPDsH0qoNP63E
 P2BUde+gChSnEdFAEa6WT+fXBy6/qXnhK1zhEU/Hw77tLklgEcgBQsxNerbH1+Fw
 ArKZ4+h4g/Zeq2bS+Y6FblQgmBwPzIj2+Ju/+OHgPAo99yMf0pSmOYcZVld/YeZ2
 UoJ2nzfnm8+DBFeZ8FMVe6hlTW4H09+GTtZMqG6BSWxj9tXRlmoOC2fPdUrJI+Qj
 02vVBEx9N/jJUvtIYtmGTh6SSdrGsFwYbVKel6OFfCXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=t78vfT
 UGeTLCIFrKtCCBCYtotE9BeXII9h6fhKIW4yU=; b=WhNGsF37vq+q+JJrwqyDzj
 BIOM3tZe3E3c9lBfeEeKV5l9zmrWRqZMsml+kMAxhsUsPIFIFU1Mn+98uusdEueX
 +3uESCSK3UnR/s6nR8PAwmVPqHL6EnJXfeNC0aH890qwedTcCwHzlUwGu+a0z2+f
 6BUu2FnKqLdyAKVOAkbewQaL1Mj90fa6mLxCz/AHG1XWInplaV+saBp5+ImCX6h3
 XRMvoEWbA1dB855GONViCRGHQIkMaDM8I+0o9kCsbo3YAOiPJhye/bZsBkblvv5Q
 5fJU+dM0AHQy8IgmTa+5dfJzQ/1RLAiM6kYGQRUTJG4+fhvVzsFwnh4AJ4Gm2VWQ
 ==
X-ME-Sender: <xms:C1RRYUfMqZiMMz8hfHrM1CCgWyF-kyF0yHS4szDDj1e7TUTN9MWkbQ>
 <xme:C1RRYWPgPbm2pf9UphObOMZ9xPJa9pOMGvl64o-HefLDA1huku49Vn_jq7pOf3WAO
 BV5GKJtdpGynPhMBp0>
X-ME-Received: <xmr:C1RRYVjUlSODxifbGOvYO5W6PbtH5-bIsQDZMT92i4OJvWVQ0naVG2xF5JKw2ZWX9OYxCpYGcjPG1B61V-ZnyP5mge_KKAHnEyfnnAzq4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:C1RRYZ_llRldc7xqIfVFVEFJdKOH7b87SAGMkjhBZY3UFNuyumBWuA>
 <xmx:C1RRYQtj910Ibqoj9Zlmb5oC5sRStniZ1OzoPsFSLGFlXLJRESTTXg>
 <xmx:C1RRYQGqW54jPYxeTPa-CPg-hGK4SQLqyPoFajd5kv6bjB5cf8Pt5A>
 <xmx:DFRRYUOCcFCeFTQgqLqbsk81BKPGLO973QYjM3H5tyg0QBlPEYo9r-qwI7k>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 01:18:01 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 00/16] hw/nvme: experimental user-creatable objects
Date: Mon, 27 Sep 2021 07:17:43 +0200
Message-Id: <20210927051759.447305-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

v2=0D
  * Use 'zns' instead of 'zoned' for various zns based function name=0D
    prefixes (Keith)=0D
=0D
  * Fix the intialization order and get rid of the machine done=0D
    notifier (Kevin). This requires removing the 'attached-ctrls'=0D
    parameter and instead controller just attaching to all namespaces in=0D
    the subsystem. The example below in the cover letter has been=0D
    updated to reflect this.=0D
=0D
    Kevin just posted a series that would allow an 'attached-ns'=0D
    list-style parameter on the device, so this functionality may be=0D
    added in the future, but let's see if there is actually any request=0D
    for this.=0D
=0D
  * Added patch from Hannes to attach namespaces on hotplug (this is=0D
    also out in non-RFC, but this depends on it, so including it here).=0D
=0D
  * Added preliminary documentation on the new experimental setup.=0D
=0D
Hi,=0D
=0D
This is an attempt at adressing a bunch of issues that have presented=0D
themselves since we added subsystem support. It's been brewing for a=0D
while now.=0D
=0D
Fundamentally, I've come to the conclusion that modeling namespaces and=0D
subsystems as "devices" is wrong. They should have been user-creatable=0D
objects. We've run into multiple issues with wrt. hotplugging due to how=0D
namespaces hook up to the controller with a bus. The bus-based design=0D
made a lot of sense when we didn't have subsystem support and it follows=0D
the design of hw/scsi. But, the problem here is that the bus-based=0D
design dictates a one parent relationship, and with shared namespaces,=0D
that is just not true. If the namespaces are considered to have a single=0D
parent, that parent is the subsystem, not any specific controller.=0D
=0D
This series adds a set of experimental user-creatable objects:=0D
=0D
  -object x-nvme-subsystem=0D
  -object x-nvme-ns-nvm=0D
  -object x-nvme-ns-zoned=0D
=0D
It also adds a new controller device (-device x-nvme-ctrl) that supports=0D
these new objects (and gets rid of a bunch of deprecated and confusing=0D
parameters). Invoking with an nvme controller now becomes along these=0D
lines:=0D
=0D
  -object x-nvme-subsystem,id=3Dnvme-subsys-0,subnqn=3Dfoo=0D
  -drive  id=3Dblk-nvm-1,file=3Dnvm-1.img,if=3Dnone=0D
  -object x-nvme-ns-nvm,id=3Dnvme-ns-nvm-1,blockdev=3Dblk-nvm-1,subsys=3Dnv=
me-subsys-0=0D
  -device x-nvme-ctrl,id=3Dnvme-ctrl-0,serial=3Dfoo,subsys=3Dnvme-subsys-0=
=0D
=0D
This new approach has a bunch of benefits (other than just=0D
fixing the hotplugging issues properly) - we also get support for some=0D
nice introspection through some new dynamic properties.=0D
=0D
  (qemu) qom-get /objects/nvme-subsys-0 controllers=0D
  [=0D
      "/machine/peripheral/nvme-ctrl-1",=0D
      "/machine/peripheral/nvme-ctrl-0"=0D
  ]=0D
=0D
  (qemu) qom-get /objects/nvme-subsys-0 namespaces=0D
  [=0D
      "/objects/nvme-ns-nvm-1",=0D
      "/objects/nvme-ns-zns-1"=0D
  ]=0D
=0D
  (qemu) qom-list /objects/nvme-ns-zns-1=0D
  type (string)=0D
  subsys (link<x-nvme-subsystem>)=0D
  nsid (string)=0D
  uuid (string)=0D
  eui64 (string)=0D
  blockdev (string)=0D
  pi-first (bool)=0D
  pi-type (NvmeProtInfoType)=0D
  extended-lba (bool)=0D
  metadata-size (uint16)=0D
  lba-size (size)=0D
  zone-descriptor-extension-size (size)=0D
  zone-cross-read (bool)=0D
  zone-max-open (uint32)=0D
  zone-capacity (size)=0D
  zone-size (size)=0D
  zone-max-active (uint32)=0D
=0D
  (qemu) qom-get /objects/nvme-ns-zns-1 pi-type=0D
  "none"=0D
=0D
  (qemu) qom-get /objects/nvme-ns-zns-1 eui64=0D
  "52:54:00:17:67:a0:40:15"=0D
=0D
  (qemu) qom-get /objects/nvme-ns-zns-1 zone-capacity=0D
  12582912=0D
=0D
The first patches in this series reorganize a bunch of structs to make=0D
it easier to separate them in later patches. Then, it proceeds to hoist=0D
the device states into separate structures such that we can reuse the=0D
core logic in both the new objects and the existing devices. Thus, full=0D
backwards compatibility is kept and the existing device all work as the=0D
do prior to this series being applied. I have chosen to separate the nvm=0D
and zoned namespace types in to individual objects. The core namespace=0D
functionality is contained in an abstract (non user-creatable) x-nvme-ns=0D
object and the x-nvme-ns-nvm object extends this and serves at the=0D
parent of the x-nvme-ns-zoned object itself.=0D
=0D
There are definitely an alternative to this approach - one that I've=0D
previously discussed with Hannes (and other QEMU devs, thanks!), and=0D
that would be to add the subsystem as a system bus device.=0D
=0D
Cheers, Klaus=0D
=0D
Hannes Reinecke (1):=0D
  hw/nvme: reattach subsystem namespaces on hotplug=0D
=0D
Klaus Jensen (15):=0D
  hw/nvme: change nvme-ns 'shared' default=0D
  hw/nvme: move dif/pi prototypes into dif.h=0D
  hw/nvme: move zns helpers and types into zns.h=0D
  hw/nvme: move zoned namespace members to separate struct=0D
  hw/nvme: move nvm namespace members to separate struct=0D
  hw/nvme: move BlockBackend to NvmeNamespaceNvm=0D
  hw/nvme: hoist qdev state from namespace=0D
  hw/nvme: hoist qdev state from subsystem=0D
  hw/nvme: hoist qdev state from controller=0D
  hw/nvme: add experimental object x-nvme-subsystem=0D
  nvme: add structured type for nguid=0D
  hw/nvme: add experimental abstract object x-nvme-ns=0D
  hw/nvme: add experimental objects x-nvme-ns-{nvm,zoned}=0D
  hw/nvme: add experimental device x-nvme-ctrl=0D
  docs: add documentation for experimental nvme emulation=0D
=0D
 docs/system/device-emulation.rst          |    1 +=0D
 docs/system/devices/nvme-experimental.rst |  107 ++=0D
 docs/system/devices/nvme.rst              |   24 +-=0D
 hw/core/machine.c                         |    4 +-=0D
 hw/nvme/ctrl.c                            | 1157 ++++++++++++---------=0D
 hw/nvme/dif.c                             |  120 ++-=0D
 hw/nvme/dif.h                             |   55 +=0D
 hw/nvme/meson.build                       |    2 +-=0D
 hw/nvme/ns-nvm.c                          |  354 +++++++=0D
 hw/nvme/ns-zoned.c                        |  443 ++++++++=0D
 hw/nvme/ns.c                              |  752 ++++++-------=0D
 hw/nvme/nvm.h                             |   65 ++=0D
 hw/nvme/nvme.h                            |  324 ++----=0D
 hw/nvme/subsys.c                          |  240 ++++-=0D
 hw/nvme/zns.h                             |  147 +++=0D
 include/block/nvme.h                      |   11 +-=0D
 qapi/qom.json                             |   82 ++=0D
 softmmu/vl.c                              |    8 +=0D
 18 files changed, 2711 insertions(+), 1185 deletions(-)=0D
 create mode 100644 docs/system/devices/nvme-experimental.rst=0D
 create mode 100644 hw/nvme/dif.h=0D
 create mode 100644 hw/nvme/ns-nvm.c=0D
 create mode 100644 hw/nvme/ns-zoned.c=0D
 create mode 100644 hw/nvme/nvm.h=0D
 create mode 100644 hw/nvme/zns.h=0D
=0D
-- =0D
2.33.0=0D
=0D

