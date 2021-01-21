Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2472FDF7B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 03:39:20 +0100 (CET)
Received: from localhost ([::1]:54312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2PsV-0003CV-Hp
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 21:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2PqR-0001SD-0g
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2PqN-0003g8-SN
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611196626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Aicu7rYpt6LH1zVHY27azM0ezU9EfMLPoy01u5z3Amw=;
 b=UKQOCX4Dh/n+O5RZ1Xq5xvZlyu4eleHk4NiH73zbVrd/qpFp34p28pnod0HDa7Ezr0QHAl
 H63ND7QmmZPP3Gj6vc5IKWhtTl/oV2ao2ocaE2fVn3Ard6KB4WJXpZUHwmh1eqdJtPEeZH
 JXHkYizVdCFH1hpRJU+IGCZlWJHdxeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-dQprmlwUMoWKhAW5jjmJeg-1; Wed, 20 Jan 2021 21:37:01 -0500
X-MC-Unique: dQprmlwUMoWKhAW5jjmJeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C322107ACF6
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 02:37:00 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07D1D5D764
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 02:36:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] NBD patches through 2021-01-20
Date: Wed, 20 Jan 2021 20:36:44 -0600
Message-Id: <20210121023657.1186241-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210119-1' into staging (2021-01-19 15:47:23 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-01-20

for you to fetch changes up to f874e7fa3b6583c79a74aea9e781af920ddd8091:

  iotests.py: qemu_io(): reuse qemu_tool_pipe_and_status() (2021-01-20 20:24:51 -0600)

----------------------------------------------------------------
nbd patches for 2021-01-20

- minor resource leak fixes in qemu-nbd
- ensure proper aio context when nbd server uses iothreads
- iotest refactorings in preparation for rewriting ./check to be more
flexible, and preparing for more nbd server reconnect features

----------------------------------------------------------------
Alex Chen (2):
      qemu-nbd: Fix a memleak in qemu_nbd_client_list()
      qemu-nbd: Fix a memleak in nbd_client_thread()

Sergio Lopez (2):
      block: Honor blk_set_aio_context() context requirements
      nbd/server: Quiesce coroutines on context switch

Vladimir Sementsov-Ogievskiy (9):
      iotests/277: use dot slash for nbd-fault-injector.py running
      iotests/303: use dot slash for qcow2.py running
      iotests: fix some whitespaces in test output files
      iotests: make tests executable
      iotests/294: add shebang line
      iotests: define group in each iotest
      iotests/264: fix style
      iotests.py: fix qemu_tool_pipe_and_status()
      iotests.py: qemu_io(): reuse qemu_tool_pipe_and_status()

 hw/block/dataplane/virtio-blk.c |   4 ++
 hw/block/dataplane/xen-block.c  |   7 ++-
 hw/scsi/virtio-scsi.c           |   6 +-
 nbd/server.c                    | 120 +++++++++++++++++++++++++++++++++++-----
 qemu-nbd.c                      |  42 ++++++--------
 tests/qemu-iotests/001          |   1 +
 tests/qemu-iotests/002          |   1 +
 tests/qemu-iotests/003          |   1 +
 tests/qemu-iotests/004          |   1 +
 tests/qemu-iotests/005          |   1 +
 tests/qemu-iotests/007          |   1 +
 tests/qemu-iotests/008          |   1 +
 tests/qemu-iotests/009          |   1 +
 tests/qemu-iotests/010          |   1 +
 tests/qemu-iotests/011          |   1 +
 tests/qemu-iotests/012          |   1 +
 tests/qemu-iotests/013          |   1 +
 tests/qemu-iotests/014          |   1 +
 tests/qemu-iotests/015          |   1 +
 tests/qemu-iotests/017          |   1 +
 tests/qemu-iotests/018          |   1 +
 tests/qemu-iotests/019          |   1 +
 tests/qemu-iotests/020          |   1 +
 tests/qemu-iotests/021          |   1 +
 tests/qemu-iotests/022          |   1 +
 tests/qemu-iotests/023          |   1 +
 tests/qemu-iotests/024          |   1 +
 tests/qemu-iotests/025          |   1 +
 tests/qemu-iotests/026          |   1 +
 tests/qemu-iotests/027          |   1 +
 tests/qemu-iotests/028          |   1 +
 tests/qemu-iotests/029          |   1 +
 tests/qemu-iotests/030          |   1 +
 tests/qemu-iotests/031          |   1 +
 tests/qemu-iotests/032          |   1 +
 tests/qemu-iotests/033          |   1 +
 tests/qemu-iotests/034          |   1 +
 tests/qemu-iotests/035          |   1 +
 tests/qemu-iotests/036          |   1 +
 tests/qemu-iotests/037          |   1 +
 tests/qemu-iotests/038          |   1 +
 tests/qemu-iotests/039          |   1 +
 tests/qemu-iotests/040          |   1 +
 tests/qemu-iotests/041          |   1 +
 tests/qemu-iotests/042          |   1 +
 tests/qemu-iotests/043          |   1 +
 tests/qemu-iotests/044          |   1 +
 tests/qemu-iotests/045          |   1 +
 tests/qemu-iotests/046          |   1 +
 tests/qemu-iotests/047          |   1 +
 tests/qemu-iotests/048          |   1 +
 tests/qemu-iotests/049          |   1 +
 tests/qemu-iotests/050          |   1 +
 tests/qemu-iotests/051          |   1 +
 tests/qemu-iotests/052          |   1 +
 tests/qemu-iotests/053          |   1 +
 tests/qemu-iotests/054          |   1 +
 tests/qemu-iotests/055          |   1 +
 tests/qemu-iotests/056          |   1 +
 tests/qemu-iotests/057          |   1 +
 tests/qemu-iotests/058          |   1 +
 tests/qemu-iotests/059          |   1 +
 tests/qemu-iotests/060          |   1 +
 tests/qemu-iotests/061          |   1 +
 tests/qemu-iotests/062          |   1 +
 tests/qemu-iotests/063          |   1 +
 tests/qemu-iotests/064          |   1 +
 tests/qemu-iotests/065          |   1 +
 tests/qemu-iotests/066          |   1 +
 tests/qemu-iotests/068          |   1 +
 tests/qemu-iotests/069          |   1 +
 tests/qemu-iotests/070          |   1 +
 tests/qemu-iotests/071          |   1 +
 tests/qemu-iotests/072          |   1 +
 tests/qemu-iotests/073          |   1 +
 tests/qemu-iotests/074          |   1 +
 tests/qemu-iotests/075          |   1 +
 tests/qemu-iotests/076          |   1 +
 tests/qemu-iotests/077          |   1 +
 tests/qemu-iotests/078          |   1 +
 tests/qemu-iotests/079          |   1 +
 tests/qemu-iotests/080          |   1 +
 tests/qemu-iotests/081          |   1 +
 tests/qemu-iotests/082          |   1 +
 tests/qemu-iotests/083          |   1 +
 tests/qemu-iotests/084          |   1 +
 tests/qemu-iotests/085          |   1 +
 tests/qemu-iotests/086          |   1 +
 tests/qemu-iotests/087          |   1 +
 tests/qemu-iotests/088          |   1 +
 tests/qemu-iotests/089          |   1 +
 tests/qemu-iotests/090          |   1 +
 tests/qemu-iotests/091          |   1 +
 tests/qemu-iotests/092          |   1 +
 tests/qemu-iotests/093          |   1 +
 tests/qemu-iotests/094          |   1 +
 tests/qemu-iotests/095          |   1 +
 tests/qemu-iotests/096          |   1 +
 tests/qemu-iotests/097          |   1 +
 tests/qemu-iotests/098          |   1 +
 tests/qemu-iotests/099          |   1 +
 tests/qemu-iotests/101          |   1 +
 tests/qemu-iotests/102          |   1 +
 tests/qemu-iotests/103          |   1 +
 tests/qemu-iotests/104          |   1 +
 tests/qemu-iotests/105          |   1 +
 tests/qemu-iotests/106          |   1 +
 tests/qemu-iotests/107          |   1 +
 tests/qemu-iotests/108          |   1 +
 tests/qemu-iotests/109          |   1 +
 tests/qemu-iotests/110          |   1 +
 tests/qemu-iotests/111          |   1 +
 tests/qemu-iotests/112          |   1 +
 tests/qemu-iotests/113          |   1 +
 tests/qemu-iotests/114          |   1 +
 tests/qemu-iotests/115          |   1 +
 tests/qemu-iotests/116          |   1 +
 tests/qemu-iotests/117          |   1 +
 tests/qemu-iotests/118          |   1 +
 tests/qemu-iotests/119          |   1 +
 tests/qemu-iotests/120          |   1 +
 tests/qemu-iotests/121          |   1 +
 tests/qemu-iotests/122          |   1 +
 tests/qemu-iotests/123          |   1 +
 tests/qemu-iotests/124          |   1 +
 tests/qemu-iotests/125          |   1 +
 tests/qemu-iotests/126          |   1 +
 tests/qemu-iotests/127          |   1 +
 tests/qemu-iotests/128          |   1 +
 tests/qemu-iotests/129          |   1 +
 tests/qemu-iotests/130          |   1 +
 tests/qemu-iotests/131          |   1 +
 tests/qemu-iotests/132          |   1 +
 tests/qemu-iotests/133          |   1 +
 tests/qemu-iotests/134          |   1 +
 tests/qemu-iotests/135          |   1 +
 tests/qemu-iotests/136          |   1 +
 tests/qemu-iotests/137          |   1 +
 tests/qemu-iotests/138          |   1 +
 tests/qemu-iotests/139          |   1 +
 tests/qemu-iotests/140          |   1 +
 tests/qemu-iotests/141          |   1 +
 tests/qemu-iotests/143          |   1 +
 tests/qemu-iotests/144          |   1 +
 tests/qemu-iotests/145          |   1 +
 tests/qemu-iotests/146          |   1 +
 tests/qemu-iotests/147          |   1 +
 tests/qemu-iotests/148          |   1 +
 tests/qemu-iotests/149          |   1 +
 tests/qemu-iotests/150          |   1 +
 tests/qemu-iotests/151          |   1 +
 tests/qemu-iotests/152          |   1 +
 tests/qemu-iotests/153          |   1 +
 tests/qemu-iotests/154          |   1 +
 tests/qemu-iotests/155          |   1 +
 tests/qemu-iotests/156          |   1 +
 tests/qemu-iotests/157          |   1 +
 tests/qemu-iotests/158          |   1 +
 tests/qemu-iotests/159          |   1 +
 tests/qemu-iotests/160          |   1 +
 tests/qemu-iotests/161          |   1 +
 tests/qemu-iotests/162          |   1 +
 tests/qemu-iotests/163          |   1 +
 tests/qemu-iotests/165          |   1 +
 tests/qemu-iotests/169          |   1 +
 tests/qemu-iotests/170          |   1 +
 tests/qemu-iotests/171          |   1 +
 tests/qemu-iotests/172          |   1 +
 tests/qemu-iotests/173          |   1 +
 tests/qemu-iotests/174          |   1 +
 tests/qemu-iotests/175          |   1 +
 tests/qemu-iotests/175.out      |   2 +-
 tests/qemu-iotests/176          |   1 +
 tests/qemu-iotests/177          |   1 +
 tests/qemu-iotests/178          |   1 +
 tests/qemu-iotests/179          |   1 +
 tests/qemu-iotests/181          |   1 +
 tests/qemu-iotests/182          |   1 +
 tests/qemu-iotests/183          |   1 +
 tests/qemu-iotests/184          |   1 +
 tests/qemu-iotests/185          |   1 +
 tests/qemu-iotests/186          |   1 +
 tests/qemu-iotests/187          |   1 +
 tests/qemu-iotests/188          |   1 +
 tests/qemu-iotests/189          |   1 +
 tests/qemu-iotests/190          |   1 +
 tests/qemu-iotests/191          |   1 +
 tests/qemu-iotests/192          |   1 +
 tests/qemu-iotests/194          |   1 +
 tests/qemu-iotests/195          |   1 +
 tests/qemu-iotests/196          |   1 +
 tests/qemu-iotests/197          |   1 +
 tests/qemu-iotests/198          |   1 +
 tests/qemu-iotests/199          |   1 +
 tests/qemu-iotests/200          |   1 +
 tests/qemu-iotests/201          |   1 +
 tests/qemu-iotests/202          |   1 +
 tests/qemu-iotests/203          |   1 +
 tests/qemu-iotests/204          |   1 +
 tests/qemu-iotests/205          |   1 +
 tests/qemu-iotests/206          |   1 +
 tests/qemu-iotests/207          |   1 +
 tests/qemu-iotests/208          |   1 +
 tests/qemu-iotests/209          |   1 +
 tests/qemu-iotests/210          |   1 +
 tests/qemu-iotests/211          |   1 +
 tests/qemu-iotests/212          |   1 +
 tests/qemu-iotests/213          |   1 +
 tests/qemu-iotests/214          |   1 +
 tests/qemu-iotests/215          |   1 +
 tests/qemu-iotests/216          |   1 +
 tests/qemu-iotests/217          |   1 +
 tests/qemu-iotests/218          |   1 +
 tests/qemu-iotests/219          |   1 +
 tests/qemu-iotests/220          |   1 +
 tests/qemu-iotests/221          |   1 +
 tests/qemu-iotests/222          |   1 +
 tests/qemu-iotests/223          |   1 +
 tests/qemu-iotests/224          |   1 +
 tests/qemu-iotests/225          |   1 +
 tests/qemu-iotests/226          |   1 +
 tests/qemu-iotests/227          |   1 +
 tests/qemu-iotests/228          |   1 +
 tests/qemu-iotests/229          |   1 +
 tests/qemu-iotests/231          |   1 +
 tests/qemu-iotests/232          |   1 +
 tests/qemu-iotests/233          |   1 +
 tests/qemu-iotests/234          |   1 +
 tests/qemu-iotests/235          |   1 +
 tests/qemu-iotests/236          |   1 +
 tests/qemu-iotests/237          |   1 +
 tests/qemu-iotests/238          |   1 +
 tests/qemu-iotests/239          |   1 +
 tests/qemu-iotests/240          |   1 +
 tests/qemu-iotests/241          |   1 +
 tests/qemu-iotests/242          |   1 +
 tests/qemu-iotests/243          |   1 +
 tests/qemu-iotests/244          |   1 +
 tests/qemu-iotests/245          |   1 +
 tests/qemu-iotests/246          |   1 +
 tests/qemu-iotests/247          |   1 +
 tests/qemu-iotests/248          |   1 +
 tests/qemu-iotests/249          |   1 +
 tests/qemu-iotests/250          |   1 +
 tests/qemu-iotests/251          |   1 +
 tests/qemu-iotests/252          |   1 +
 tests/qemu-iotests/253          |   1 +
 tests/qemu-iotests/254          |   1 +
 tests/qemu-iotests/255          |   1 +
 tests/qemu-iotests/256          |   1 +
 tests/qemu-iotests/257          |   1 +
 tests/qemu-iotests/258          |   1 +
 tests/qemu-iotests/259          |   1 +
 tests/qemu-iotests/260          |   1 +
 tests/qemu-iotests/261          |   1 +
 tests/qemu-iotests/262          |   1 +
 tests/qemu-iotests/263          |   1 +
 tests/qemu-iotests/264          |  12 ++--
 tests/qemu-iotests/265          |   1 +
 tests/qemu-iotests/266          |   1 +
 tests/qemu-iotests/267          |   1 +
 tests/qemu-iotests/268          |   1 +
 tests/qemu-iotests/270          |   1 +
 tests/qemu-iotests/271          |   1 +
 tests/qemu-iotests/271.out      |  12 ++--
 tests/qemu-iotests/272          |   1 +
 tests/qemu-iotests/273          |   1 +
 tests/qemu-iotests/274          |   1 +
 tests/qemu-iotests/277          |   3 +-
 tests/qemu-iotests/279          |   1 +
 tests/qemu-iotests/280          |   1 +
 tests/qemu-iotests/281          |   1 +
 tests/qemu-iotests/282          |   1 +
 tests/qemu-iotests/283          |   1 +
 tests/qemu-iotests/284          |   1 +
 tests/qemu-iotests/286          |   1 +
 tests/qemu-iotests/287          |   1 +
 tests/qemu-iotests/287.out      |  10 ++--
 tests/qemu-iotests/288          |   1 +
 tests/qemu-iotests/289          |   1 +
 tests/qemu-iotests/290          |   1 +
 tests/qemu-iotests/291          |   1 +
 tests/qemu-iotests/292          |   1 +
 tests/qemu-iotests/293          |   1 +
 tests/qemu-iotests/294          |   2 +
 tests/qemu-iotests/295          |   1 +
 tests/qemu-iotests/296          |   1 +
 tests/qemu-iotests/297          |   1 +
 tests/qemu-iotests/298          |   0
 tests/qemu-iotests/299          |   1 +
 tests/qemu-iotests/300          |   1 +
 tests/qemu-iotests/301          |   1 +
 tests/qemu-iotests/302          |   1 +
 tests/qemu-iotests/303          |   3 +-
 tests/qemu-iotests/304          |   1 +
 tests/qemu-iotests/305          |   1 +
 tests/qemu-iotests/307          |   1 +
 tests/qemu-iotests/308          |   1 +
 tests/qemu-iotests/309          |   1 +
 tests/qemu-iotests/312          |   1 +
 tests/qemu-iotests/iotests.py   |  14 +----
 301 files changed, 452 insertions(+), 72 deletions(-)
 mode change 100644 => 100755 tests/qemu-iotests/283
 mode change 100644 => 100755 tests/qemu-iotests/298
 mode change 100644 => 100755 tests/qemu-iotests/299

-- 
2.30.0


