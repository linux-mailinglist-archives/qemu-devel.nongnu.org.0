Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA3D40B965
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:44:29 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFI3-0000Uy-FR
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBg-0005an-FW; Tue, 14 Sep 2021 16:37:52 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:56285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBd-0004Zs-R0; Tue, 14 Sep 2021 16:37:52 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4F48132009E9;
 Tue, 14 Sep 2021 16:37:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 14 Sep 2021 16:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=CrGaqSHxQ1d96ZtZNIiCHKOkZP
 aVFKAiaUGmlXlKxlA=; b=iYEJX8XEjHgy17rnJUO87OPiSVKIVFNvK+cigwuOR+
 87SkEgIPOsrqRv0QNWyc2vETXMZtWIxB0dQXo//YDEAZQoEIU9T1Q0l60ACW58Nk
 F5WOsAT2Gu2aNwD/p/7LcsM0gGKq3Pcny8PjRhaZyuWklqqvMjLRluhXxJI+kyHK
 6cNDRf0oRfKTtLHk8yYMq2gS/mDpFJT8QrBxtLlP5jcEkaim8Vf+Pd/Xr2I80Wgq
 S8Su98h2Q0hia8SjpOJzfktlS8pMbyEYvzsfDeLqf3xivHluhJ7xUMowjkNKCPM8
 9B+gvyI+Jog3le8LTRdiJ/BJolH2UYStVTJYzb2sOExA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CrGaqS
 HxQ1d96ZtZNIiCHKOkZPaVFKAiaUGmlXlKxlA=; b=hHy+Hal+VuSgQ5SoOXRKqe
 J231rEnbtKs+t36vRGk56HnnH0XXGXl8xgg1sVqpCUe/MxU3urHaiXvLw0npAooD
 hQB6CxXsSbvFFAOiS+MOWdLyicURyYWdB1J2auWu5WMFkAxk1rQLt2qj4j3rbdd9
 EqSMVW4mYKlm03+vBFAbwBcyKrgzkDw9Y6ZY7/5ZGx02VG0eUP26rtU+oTTn8HEj
 pI9u9fhSoFTAX7Wvkhzxb5EcIVEvdq5n7Z7azwknshpiHBN6DfQOw0psqFWZNhts
 u76IdpEto0wD7QArvOWGe0bBzTbQlKNTxiQD/KAf6bqlNrJgLsXD9YkGFrhDynQw
 ==
X-ME-Sender: <xms:FQhBYWJFe0_BGk00a03uEs8EDSna8A_sDbM5sklGX4-VdZHLQil8oQ>
 <xme:FQhBYeKyINIhbMb52kbwHmxqQZk5RLZKkaEwk51gcv4DfvtSXm5A_phxeMpU4BN-s
 T04pIGgCWMU5Cu5biA>
X-ME-Received: <xmr:FQhBYWuOW7QoWkz67_jRdU5DbVlMCCb5i-Di4l5BV4ZRq_Va-cAx4X4yeJIPaT3N77WDMbCZv6HKdns770YzRwe191OqeSwL1MDlTEH8jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeg
 hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:FQhBYbYxd2bDhVuUr1SuxLUL-5ckz22lHHW8ol2KuWkYEEvidBHYzA>
 <xmx:FQhBYdZydZuoPIrBYta3zzL-dhfFgKTGhvoeoR8_XhM4Lotu1PzMVg>
 <xmx:FQhBYXDFXKgzRAvBLXkKS8Vh06kOqxMcCy4MN9N9Du1lgqMELw9vug>
 <xmx:FghBYbPnhmJDU7t3Vkf4jrFZ2YemEYcbMwHIiTLO-A1AmqIVLjS68Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:37:40 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 00/13] hw/nvme: experimental user-creatable objects
Date: Tue, 14 Sep 2021 22:37:24 +0200
Message-Id: <20210914203737.182571-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Markus Armbruster <armbru@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

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
parameters). This new approach has a bunch of benefits (other than just=0D
fixing the hotplugging issues properly) - we also get support for some=0D
nice introspection through some new dynamic properties:=0D
=0D
  (qemu) qom-get /machine/peripheral/nvme-ctrl-1 attached-namespaces=0D
  [=0D
      "/objects/nvm-1",=0D
      "/objects/zns-1"=0D
  ]=0D
=0D
  (qemu) qom-list /objects/zns-1=0D
  type (string)=0D
  subsys (link<x-nvme-subsystem>)=0D
  nsid (uint32)=0D
  uuid (string)=0D
  attached-ctrls (str)=0D
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
  (qemu) qom-get /objects/zns-1 pi-type=0D
  "none"=0D
=0D
  (qemu) qom-get /objects/zns-1 eui64=0D
  "52:54:00:17:67:a0:40:15"=0D
=0D
  (qemu) qom-get /objects/zns-1 zone-capacity=0D
  12582912=0D
=0D
Currently, there are no shortcuts, so you have to define the full=0D
topology to get it up and running. Notice that the topology is explicit=0D
(the 'subsys' and 'attached-ctrls' links). There are no 'nvme-bus'=0D
anymore.=0D
=0D
  -object x-nvme-subsystem,id=3Dsubsys0,subnqn=3Dfoo=0D
  -device x-nvme-ctrl,id=3Dnvme-ctrl-0,serial=3Dfoo,subsys=3Dsubsys0=0D
  -device x-nvme-ctrl,id=3Dnvme-ctrl-1,serial=3Dbar,subsys=3Dsubsys0=0D
  -drive  id=3Dnvm-1,file=3Dnvm-1.img,format=3Draw,if=3Dnone,discard=3Dunma=
p=0D
  -object x-nvme-ns-nvm,id=3Dnvm-1,blockdev=3Dnvm-1,nsid=3D1,subsys=3Dsubsy=
s0,attached-ctrls=3Dnvme-ctrl-1=0D
  -drive  id=3Dnvm-2,file=3Dnvm-2.img,format=3Draw,if=3Dnone,discard=3Dunma=
p=0D
  -object x-nvme-ns-nvm,id=3Dnvm-2,blockdev=3Dnvm-2,nsid=3D2,subsys=3Dsubsy=
s0,attached-ctrls=3Dnvme-ctrl-0=0D
=0D
It'd be nice to add some defaults for when you don't need/want a=0D
full-blown multi controller/namespace setup.=0D
=0D
The first patches in this series reorganized a bunch of structs to make=0D
it easier to separate them in later patches. Then, it proceeds to hoist=0D
the device state into separate structures such that we can reuse the=0D
core logic in both the new objects and the existing devices. Thus, full=0D
backwards compatibility is kept and the existing device all work as they=0D
do prior to this series being applied. I have chosen to separate the nvm=0D
and zoned namespace types into individual objects. The core namespace=0D
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
Klaus Jensen (13):=0D
  hw/nvme: move dif/pi prototypes into dif.h=0D
  hw/nvme: move zns helpers and types into zoned.h=0D
  hw/nvme: move zoned namespace members to separate struct=0D
  hw/nvme: move nvm namespace members to separate struct=0D
  hw/nvme: move BlockBackend to NvmeNamespaceNvm=0D
  nvme: add structured type for nguid=0D
  hw/nvme: hoist qdev state from namespace=0D
  hw/nvme: hoist qdev state from controller=0D
  hw/nvme: add experimental device x-nvme-ctrl=0D
  hw/nvme: add experimental object x-nvme-subsystem=0D
  hw/nvme: add experimental abstract object x-nvme-ns=0D
  hw/nvme: add experimental objects x-nvme-ns-{nvm,zoned}=0D
  hw/nvme: add attached-namespaces prop=0D
=0D
 hw/nvme/ctrl.c       | 1187 ++++++++++++++++++++++++------------------=0D
 hw/nvme/dif.c        |  120 +++--=0D
 hw/nvme/dif.h        |   55 ++=0D
 hw/nvme/meson.build  |    2 +-=0D
 hw/nvme/ns-nvm.c     |  360 +++++++++++++=0D
 hw/nvme/ns-zoned.c   |  449 ++++++++++++++++=0D
 hw/nvme/ns.c         |  818 ++++++++++++++++-------------=0D
 hw/nvme/nvm.h        |   65 +++=0D
 hw/nvme/nvme.h       |  325 +++++-------=0D
 hw/nvme/subsys.c     |  154 +++++-=0D
 hw/nvme/zoned.h      |  147 ++++++=0D
 include/block/nvme.h |   11 +-=0D
 qapi/qom.json        |   83 +++=0D
 13 files changed, 2612 insertions(+), 1164 deletions(-)=0D
 create mode 100644 hw/nvme/dif.h=0D
 create mode 100644 hw/nvme/ns-nvm.c=0D
 create mode 100644 hw/nvme/ns-zoned.c=0D
 create mode 100644 hw/nvme/nvm.h=0D
 create mode 100644 hw/nvme/zoned.h=0D
=0D
-- =0D
2.33.0=0D
=0D

