Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86366F9842
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 19:06:37 +0100 (CET)
Received: from localhost ([::1]:38740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUaYm-0001IY-BP
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 13:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iUaXm-0000lw-G1
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 13:05:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iUaXk-0001Oa-FP
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 13:05:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13526)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
 id 1iUaXf-0001Cl-9T; Tue, 12 Nov 2019 13:05:27 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xACHxAWE031860; Tue, 12 Nov 2019 13:05:25 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w7yxumc98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 13:05:24 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xACI5C39010454;
 Tue, 12 Nov 2019 18:05:23 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 2w5n36h617-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 18:05:23 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xACI5MrY46399960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 18:05:22 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46334BE04F;
 Tue, 12 Nov 2019 18:05:22 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2282ABE051;
 Tue, 12 Nov 2019 18:05:22 +0000 (GMT)
Received: from localhost (unknown [9.53.179.218])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 12 Nov 2019 18:05:21 +0000 (GMT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <20191105205243.3766-1-mdroth@linux.vnet.ibm.com>
References: <20191105205243.3766-1-mdroth@linux.vnet.ibm.com>
Message-ID: <157358191470.15278.15115766530719237134@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH 00/55] Patch Round-up for stable 4.1.1,
 freeze on 2019-11-12
Date: Tue, 12 Nov 2019 12:05:14 -0600
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-12_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911120154
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quoting Michael Roth (2019-11-05 14:51:48)
> Hi everyone,
> =

> The following new patches are queued for QEMU stable v4.1.1:
> =

>   https://github.com/mdroth/qemu/commits/stable-4.1-staging
> =

> The release is tentatively planned for 2019-11-14:
> =

>   https://wiki.qemu.org/Planning/4.1
> =

> Please note that the original release date was planned for 2019-11-21,
> but was moved up to address a number of qcow2 corruption issues:
> =

>   https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg07144.html
> =

> Fixes for the XFS issues noted in the thread are still pending, but will
> hopefully be qemu.git master in time for 4.1.1 freeze and the
> currently-scheduled release date for 4.2.0-rc1.
> =

> The list of still-pending patchsets being tracked for inclusion are:
> =

>   qcow2: Fix data corruption on XFS
>     https://lists.gnu.org/archive/html/qemu-devel/2019-11/msg00073.html
>     (PULL pending)
>   qcow2: Fix QCOW2_COMPRESSED_SECTOR_MASK
>     https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg07718.html
>   qcow2-bitmap: Fix uint64_t left-shift overflow
>     https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg07989.html
> =

> Please respond here or CC qemu-stable@nongnu.org on any additional patches
> you think should be included in the release.

The following additional patches have been pushed to the staging tree:

  tests: make filemonitor test more robust to event ordering
  block: posix: Always allocate the first block
  file-posix: Handle undetectable alignment
  block/file-posix: Let post-EOF fallocate serialize
  block: Add bdrv_co_get_self_request()
  block: Make wait/mark serialising requests public
  block/io: refactor padding
  util/iov: improve qemu_iovec_is_zero
  util/iov: introduce qemu_iovec_init_extended
  qcow2-bitmap: Fix uint64_t left-shift overflow
  iotests: Add peek_file* functions
  iotests: Add test for 4G+ compressed qcow2 write
  qcow2: Fix QCOW2_COMPRESSED_SECTOR_MASK

Thank you for the suggestions.

> =

> Thanks!
> =

> ----------------------------------------------------------------
> Adrian Moreno (1):
>       vhost-user: save features if the char dev is closed
> =

> Alberto Garcia (1):
>       qcow2: Fix the calculation of the maximum L2 cache size
> =

> Anthony PERARD (1):
>       xen-bus: Fix backend state transition on device reset
> =

> Aurelien Jarno (1):
>       target/alpha: fix tlb_fill trap_arg2 value for instruction fetch
> =

> Christophe Lyon (1):
>       target/arm: Allow reading flags from FPSCR for M-profile
> =

> David Hildenbrand (1):
>       s390x/tcg: Fix VERIM with 32/64 bit elements
> =

> Eduardo Habkost (1):
>       pc: Don't make die-id mandatory unless necessary
> =

> Fan Yang (1):
>       COLO-compare: Fix incorrect `if` logic
> =

> Hikaru Nishida (1):
>       ui: Fix hanging up Cocoa display on macOS 10.15 (Catalina)
> =

> Igor Mammedov (1):
>       x86: do not advertise die-id in query-hotpluggbale-cpus if '-smp di=
es' is not set
> =

> Johannes Berg (1):
>       libvhost-user: fix SLAVE_SEND_FD handling
> =

> John Snow (2):
>       Revert "ide/ahci: Check for -ECANCELED in aio callbacks"
>       iotests: add testing shim for script-style python tests
> =

> Kevin Wolf (4):
>       coroutine: Add qemu_co_mutex_assert_locked()
>       qcow2: Fix corruption bug in qcow2_detect_metadata_preallocation()
>       block/snapshot: Restrict set of snapshot nodes
>       iotests: Test internal snapshots with -blockdev
> =

> Markus Armbruster (1):
>       pr-manager: Fix invalid g_free() crash bug
> =

> Matthew Rosato (1):
>       s390: PCI: fix IOMMU region init
> =

> Max Filippov (1):
>       target/xtensa: regenerate and re-import test_mmuhifi_c3 core
> =

> Max Reitz (16):
>       block/file-posix: Reduce xfsctl() use
>       iotests: Test reverse sub-cluster qcow2 writes
>       vpc: Return 0 from vpc_co_create() on success
>       iotests: Add supported protocols to execute_test()
>       iotests: Restrict file Python tests to file
>       iotests: Restrict nbd Python tests to nbd
>       iotests: Test blockdev-create for vpc
>       curl: Keep pointer to the CURLState in CURLSocket
>       curl: Keep *socket until the end of curl_sock_cb()
>       curl: Check completion in curl_multi_do()
>       curl: Pass CURLSocket to curl_multi_do()
>       curl: Report only ready sockets
>       curl: Handle success in multi_check_completion
>       qcow2: Limit total allocation range to INT_MAX
>       iotests: Test large write request to qcow2 file
>       mirror: Do not dereference invalid pointers
> =

> Maxim Levitsky (1):
>       block/qcow2: Fix corruption introduced by commit 8ac0f15f335
> =

> Michael Roth (2):
>       make-release: pull in edk2 submodules so we can build it from tarba=
lls
>       roms/Makefile.edk2: don't pull in submodules when building from tar=
ball
> =

> Michael S. Tsirkin (1):
>       virtio: new post_load hook
> =

> Mikhail Sennikovsky (1):
>       virtio-net: prevent offloads reset on migration
> =

> Paolo Bonzini (2):
>       dma-helpers: ensure AIO callback is invoked after cancellation
>       scsi: lsi: exit infinite loop while executing script (CVE-2019-1206=
8)
> =

> Paul Durrant (1):
>       xen-bus: check whether the frontend is active during device reset...
> =

> Peter Lieven (1):
>       block/nfs: tear down aio before nfs_close
> =

> Peter Maydell (3):
>       target/arm: Free TCG temps in trans_VMOV_64_sp()
>       target/arm: Don't abort on M-profile exception return in linux-user=
 mode
>       hw/arm/boot.c: Set NSACR.{CP11,CP10} for NS kernel boots
> =

> Philippe Mathieu-Daud=C3=A9 (1):
>       virtio-blk: Cancel the pending BH when the dataplane is reset
> =

> Sergio Lopez (1):
>       blockjob: update nodes head while removing all bdrv
> =

> Thomas Huth (1):
>       hw/core/loader: Fix possible crash in rom_copy()
> =

> Vladimir Sementsov-Ogievskiy (4):
>       block/backup: fix max_transfer handling for copy_range
>       block/backup: fix backup_cow_with_offload for last cluster
>       util/hbitmap: strict hbitmap_reset
>       hbitmap: handle set/reset with zero length
> =

>  block/backup.c                                     |   17 +-
>  block/curl.c                                       |  125 +-
>  block/file-posix.c                                 |   77 +-
>  block/mirror.c                                     |   13 +-
>  block/nfs.c                                        |    6 +-
>  block/qcow2-cluster.c                              |   12 +-
>  block/qcow2-refcount.c                             |    2 +
>  block/qcow2.c                                      |    9 +-
>  block/snapshot.c                                   |   26 +-
>  block/vpc.c                                        |    3 +-
>  blockjob.c                                         |   17 +-
>  contrib/libvhost-user/libvhost-user.c              |    3 +-
>  dma-helpers.c                                      |   13 +-
>  hw/arm/boot.c                                      |    2 +
>  hw/block/dataplane/virtio-blk.c                    |    3 +
>  hw/core/loader.c                                   |    2 +-
>  hw/i386/pc.c                                       |   14 +-
>  hw/ide/ahci.c                                      |    3 -
>  hw/ide/core.c                                      |   14 -
>  hw/net/virtio-net.c                                |   27 +-
>  hw/s390x/s390-pci-bus.c                            |    7 +-
>  hw/scsi/lsi53c895a.c                               |   41 +-
>  hw/virtio/virtio.c                                 |    7 +
>  hw/xen/xen-bus.c                                   |   23 +-
>  include/hw/virtio/virtio-net.h                     |    2 +
>  include/hw/virtio/virtio.h                         |    6 +
>  include/qemu/coroutine.h                           |   15 +
>  include/qemu/hbitmap.h                             |    5 +
>  net/colo-compare.c                                 |    6 +-
>  net/vhost-user.c                                   |    4 +
>  roms/Makefile.edk2                                 |    7 +-
>  scripts/make-release                               |    8 +
>  scsi/pr-manager.c                                  |    1 -
>  target/alpha/helper.c                              |    4 +-
>  target/arm/translate-vfp.inc.c                     |    7 +-
>  target/arm/translate.c                             |   21 +-
>  target/s390x/translate_vx.inc.c                    |    2 +-
>  target/xtensa/core-test_mmuhifi_c3.c               |    3 +-
>  target/xtensa/core-test_mmuhifi_c3/core-isa.h      |  116 +-
>  .../xtensa/core-test_mmuhifi_c3/gdb-config.inc.c   |  114 +-
>  .../core-test_mmuhifi_c3/xtensa-modules.inc.c      | 6384 ++++++++++----=
------
>  tests/acceptance/pc_cpu_hotplug_props.py           |   35 +
>  tests/qemu-iotests/030                             |    3 +-
>  tests/qemu-iotests/040                             |    3 +-
>  tests/qemu-iotests/041                             |    3 +-
>  tests/qemu-iotests/044                             |    3 +-
>  tests/qemu-iotests/045                             |    3 +-
>  tests/qemu-iotests/055                             |    3 +-
>  tests/qemu-iotests/056                             |    3 +-
>  tests/qemu-iotests/057                             |    3 +-
>  tests/qemu-iotests/065                             |    3 +-
>  tests/qemu-iotests/096                             |    3 +-
>  tests/qemu-iotests/118                             |    3 +-
>  tests/qemu-iotests/124                             |    3 +-
>  tests/qemu-iotests/129                             |    3 +-
>  tests/qemu-iotests/132                             |    3 +-
>  tests/qemu-iotests/139                             |    3 +-
>  tests/qemu-iotests/147                             |    5 +-
>  tests/qemu-iotests/148                             |    3 +-
>  tests/qemu-iotests/151                             |    3 +-
>  tests/qemu-iotests/152                             |    3 +-
>  tests/qemu-iotests/155                             |    3 +-
>  tests/qemu-iotests/163                             |    3 +-
>  tests/qemu-iotests/165                             |    3 +-
>  tests/qemu-iotests/169                             |    3 +-
>  tests/qemu-iotests/196                             |    3 +-
>  tests/qemu-iotests/199                             |    3 +-
>  tests/qemu-iotests/205                             |    3 +-
>  tests/qemu-iotests/245                             |    3 +-
>  tests/qemu-iotests/265                             |   67 +
>  tests/qemu-iotests/265.out                         |    6 +
>  tests/qemu-iotests/266                             |  153 +
>  tests/qemu-iotests/266.out                         |  137 +
>  tests/qemu-iotests/267                             |  168 +
>  tests/qemu-iotests/267.out                         |  182 +
>  tests/qemu-iotests/270                             |   83 +
>  tests/qemu-iotests/270.out                         |    9 +
>  tests/qemu-iotests/common.filter                   |   11 +-
>  tests/qemu-iotests/group                           |    4 +
>  tests/qemu-iotests/iotests.py                      |   42 +-
>  tests/test-hbitmap.c                               |    2 +-
>  ui/cocoa.m                                         |   12 +
>  util/hbitmap.c                                     |   12 +
>  83 files changed, 4663 insertions(+), 3514 deletions(-)
>  create mode 100644 tests/acceptance/pc_cpu_hotplug_props.py
>  create mode 100755 tests/qemu-iotests/265
>  create mode 100644 tests/qemu-iotests/265.out
>  create mode 100755 tests/qemu-iotests/266
>  create mode 100644 tests/qemu-iotests/266.out
>  create mode 100755 tests/qemu-iotests/267
>  create mode 100644 tests/qemu-iotests/267.out
>  create mode 100755 tests/qemu-iotests/270
>  create mode 100644 tests/qemu-iotests/270.out
> =

> =

>=20

