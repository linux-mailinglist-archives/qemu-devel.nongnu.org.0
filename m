Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2B14DA22
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 12:49:46 +0100 (CET)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix8KP-0007hr-Tt
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 06:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sbhat@linux.ibm.com>) id 1ix8IW-0005zQ-AK
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:47:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sbhat@linux.ibm.com>) id 1ix8IU-0008Fh-CQ
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:47:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53942)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sbhat@linux.ibm.com>) id 1ix8IU-0008Cz-4W
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:47:46 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00UBi5u0079165
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 06:47:44 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xu5qc5ubj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 06:47:44 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <sbhat@linux.ibm.com>;
 Thu, 30 Jan 2020 11:47:42 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 30 Jan 2020 11:47:38 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00UBlbsT42336658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2020 11:47:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93750A405B;
 Thu, 30 Jan 2020 11:47:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9144EA4053;
 Thu, 30 Jan 2020 11:47:36 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jan 2020 11:47:36 +0000 (GMT)
Subject: [PATCH v5 0/4] ppc: spapr: virtual NVDIMM support
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: imammedo@redhat.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, mst@redhat.com
Date: Thu, 30 Jan 2020 05:47:35 -0600
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20013011-0016-0000-0000-000002E22431
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20013011-0017-0000-0000-00003344EE18
Message-Id: <158038485571.16440.14734905006978949612.stgit@lep8c.aus.stglabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-30_03:2020-01-28,
 2020-01-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001300087
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
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
Cc: qemu-ppc@nongnu.org, sbhat@linux.vnet.ibm.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patchset attempts to implement the virtual NVDIMM for pseries.

PAPR semantics is such that each NVDIMM device is comprising of
multiple SCM(Storage Class Memory) blocks. The hypervisor is expected
to prepare the FDT for the NVDIMM device and send guest a hotplug
interrupt with new type RTAS_LOG_V6_HP_TYPE_PMEM currently handled by
the upstream kernel. In response to that interrupt, the guest requests
the hypervisor to bind each of the SCM blocks of the NVDIMM device
using hcalls. There can be SCM block unbind requests in case of driver
errors or unplug(not supported now) use cases. The NVDIMM label
read/writes are done through hcalls.

Since each virtual NVDIMM device is divided into multiple SCM blocks,
the bind, unbind, and queries using hcalls on those blocks can come
independently. This doesnt fit well into the qemu device semantics,
where the map/unmap are done at the (whole)device/object level
granularity. The patchset uses the existing NVDIMM class structures
for the implementation. The bind/unbind is left to happen at the
device_add/del phase itself instead of at hcalls on-demand.

The guest kernel makes bind/unbind requests for the virtual NVDIMM
device at the region level granularity. Without interleaving, each
virtual NVDIMM device is presented as separate region. Hence it is
safe to do bind/unbind everything during the object_add/del.

The free device-memory region which is used for memory hotplug are
done using multiple LMBs of size(256MiB) and are expected to be
aligned to 256 MiB. As the SCM blocks are mapped to the same region,
the SCM blocks also need to be aligned to this size for the subsequent
memory hotplug to work. The minimum SCM block size is set to this size
for that reason and can be made user configurable in future if required.

The first patch moves around the existing static function to common
area for using it in the subsequent patches. Second patch adds new uuid
property to the nvdimm device. Third patch adds FDT entries and basic
device support, the fourth patch adds the hcalls implementation.

The patches are also available at
https://github.com/ShivaprasadGBhat/qemu.git - pseries-nvdimm-v5 branch
and can be used with the upstream kernel. ndctl can be used for
configuring the nvdimms inside the guest.
This is how it can be used ..
Ex :
For coldplug, the device to be added in qemu command line as shown below
-object 
memory-backend-file,id=memnvdimm0,prealloc=yes,mem-path=/tmp/nvdimm0,share=yes,size=1073872896
-device 
nvdimm,label-size=128k,uuid=75a3cdd7-6a2f-4791-8d15-fe0a920e8e9e,memdev=memnvdimm0,id=nvdimm0,slot=0

For hotplug, the device to be added from monitor as below
object_add 
memory-backend-file,id=memnvdimm0,prealloc=yes,mem-path=/tmp/nvdimm0,share=yes,size=1073872896
device_add 
nvdimm,label-size=128k,uuid=75a3cdd7-6a2f-4791-8d15-fe0a920e8e9e,memdev=memnvdimm0,id=nvdimm0,slot=0

---
v4: https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg03455.html
Changes from v4:
     - The nvdimm occupied GPA area is marked as available for hotplug, the
       existing code takes care of if the dimm device is actually present there
       or used by nvdimm.
     - fixed all comments for hcall implementation code on style/logic issues.
v3: https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg03452.html
Changes from v3:
     - Moved NVDIMM uuid property addition to new patch.
     - Moved the SCM hcalls to new file
     - Changed the metadata read/write hcalls to use st/ldX_be_p macros.
     - Fixed all comments on v3
v2: https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg02785.html
Changes from v2:
     - Creating the drc indices for the nvdimm devices in advance as
       suggested based on the number of user specified max slots property.
     - Removed the hard dependency on -machine nvdimm=on, enabled by
       default on the current latest pseries machine version.
     - Renamed the functions to spapr_dt_X as suggested.
     - Metadata is byteswapped before read/write to take care of endianness
       semantics during the hcall.
v1 : http://lists.nongnu.org/archive/html/qemu-devel/2019-02/msg01545.html
Changes from v1:
     - Rebased to upstream, this required required dt_populate implementation
       for nvdimm hotplug support
     - Added uuid option to nvdimm device
     - Removed the memory region sizing down code as suggested by Igor,
       now erroring out if NVDIMM size excluding the label area is not
       aligned to 256MB, so patch 2 from previous series no longer needed.
     - Removed un-implemented hcalls
     - Changed the hcalls to different kinds of checks and return
       different values.
     - Addressed comments for v1

Shivaprasad G Bhat (4):
      mem: move nvdimm_device_list to utilities
      nvdimm: add uuid property to nvdimm
      spapr: Add NVDIMM device support
      spapr: Add Hcalls to support PAPR NVDIMM device


 default-configs/ppc64-softmmu.mak |    1
 hw/acpi/nvdimm.c                  |   28 ---
 hw/mem/Kconfig                    |    2
 hw/mem/nvdimm.c                   |   40 +++++
 hw/ppc/Makefile.objs              |    2
 hw/ppc/spapr.c                    |  212 +++++++++++++++++++++++-
 hw/ppc/spapr_drc.c                |   18 ++
 hw/ppc/spapr_events.c             |    4
 hw/ppc/spapr_nvdimm.c             |  327 +++++++++++++++++++++++++++++++++++++
 include/hw/mem/nvdimm.h           |    7 +
 include/hw/ppc/spapr.h            |   19 ++
 include/hw/ppc/spapr_drc.h        |    9 +
 include/qemu/nvdimm-utils.h       |    7 +
 util/Makefile.objs                |    1
 util/nvdimm-utils.c               |   29 +++
 15 files changed, 663 insertions(+), 43 deletions(-)
 create mode 100644 hw/ppc/spapr_nvdimm.c
 create mode 100644 include/qemu/nvdimm-utils.h
 create mode 100644 util/nvdimm-utils.c

--
Signature


