Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882A936E3CF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 05:50:56 +0200 (CEST)
Received: from localhost ([::1]:37514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbxhX-0007Sq-Be
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 23:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1lbxfZ-0006Pw-TC; Wed, 28 Apr 2021 23:48:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1lbxfW-0006mq-Gm; Wed, 28 Apr 2021 23:48:53 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13T3WcCX075405; Wed, 28 Apr 2021 23:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=OAgkGXxPDmtmIHCaGcleE7WQ23ZAERsX5oYcImhqkew=;
 b=UVNF/3+5pCq7PcHVSRJBpKYA8wDphCv7ebFarxu+uy114Zo93bjKfvf0B3us3eseFHwH
 FBO3a5b3kr9FARsXUJ3LlKn7PqrAfZUD/flxcQcZtHDmVYtejElrzdo4cMnzXSP+LuxR
 LhZsAFNJb3kMnE4zloiMOmX9KahqDEgrLU2bTTs3b82CzQYKFkztGPw5hImpim0Vxkxx
 AZSY0z2yNntxnHx1Nj3x5ajcBqt/Nnt5YeRIVBaqEnSgVnk5Ile7Id3LNvZaLNa+eTC4
 8978n9pLcKUeQtHyZhQFoLAx4yMoga0MJhdoy0orPSEnVZ7cZhaMyuSQARLUVpCsMfl7 Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387mey8s2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 23:48:32 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13T3XYmG086830;
 Wed, 28 Apr 2021 23:48:32 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387mey8s0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 23:48:31 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13T3mTf6014680;
 Thu, 29 Apr 2021 03:48:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 384ay8s7kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 03:48:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13T3mP4140567142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 03:48:25 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3C83A405C;
 Thu, 29 Apr 2021 03:48:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DC1FA405B;
 Thu, 29 Apr 2021 03:48:22 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.40.192.207])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 29 Apr 2021 03:48:22 +0000 (GMT)
Subject: [PATCH v4 0/3] nvdimm: Enable sync-dax property for nvdimm
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: david@gibson.dropbear.id.au, groug@kaod.org, qemu-ppc@nongnu.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 imammedo@redhat.com, xiaoguangrong.eric@gmail.com,
 peter.maydell@linaro.org, eblake@redhat.com, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, stefanha@redhat.com,
 haozhong.zhang@intel.com, shameerali.kolothum.thodi@huawei.com,
 kwangwoo.lee@sk.com, armbru@redhat.com
Date: Wed, 28 Apr 2021 23:48:21 -0400
Message-ID: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
User-Agent: StGit/0.21
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aTHRR_JU5GCOfaP9i1AGdGDO8lWxvAfL
X-Proofpoint-ORIG-GUID: x6d2-73zIa9M9euqmgE-bnVB_D7xfhir
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_02:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104290025
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: linux-nvdimm@lists.01.org, aneesh.kumar@linux.ibm.com,
 qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org, shivaprasadbhat@gmail.com,
 bharata@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The nvdimm devices are expected to ensure write persistence during power
failure kind of scenarios.

The libpmem has architecture specific instructions like dcbf on POWER
to flush the cache data to backend nvdimm device during normal writes
followed by explicit flushes if the backend devices are not synchronous
DAX capable.

Qemu - virtual nvdimm devices are memory mapped. The dcbf in the guest
and the subsequent flush doesn't traslate to actual flush to the backend
file on the host in case of file backed v-nvdimms. This is addressed by
virtio-pmem in case of x86_64 by making explicit flushes translating to
fsync at qemu.

On SPAPR, the issue is addressed by adding a new hcall to
request for an explicit flush from the guest ndctl driver when the backend
nvdimm cannot ensure write persistence with dcbf alone. So, the approach
here is to convey when the hcall flush is required in a device tree
property. The guest makes the hcall when the property is found, instead
of relying on dcbf.

A new device property sync-dax is added to the nvdimm device. When the 
sync-dax is 'writeback'(default for PPC), device property
"hcall-flush-required" is set, and the guest makes hcall H_SCM_FLUSH
requesting for an explicit flush. 

sync-dax is "unsafe" on all other platforms(x86, ARM) and old pseries machines
prior to 5.2 on PPC. sync-dax="writeback" on ARM and x86_64 is prevented
now as the flush semantics are unimplemented.

When the backend file is actually synchronous DAX capable and no explicit
flushes are required, the sync-dax mode 'direct' is to be used.

The below demonstration shows the map_sync behavior with sync-dax writeback &
direct.
(https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/ndctl.py.data/map_sync.c)

The pmem0 is from nvdimm with With sync-dax=direct, and pmem1 is from
nvdimm with syn-dax=writeback, mounted as
/dev/pmem0 on /mnt1 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)
/dev/pmem1 on /mnt2 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)

[root@atest-guest ~]# ./mapsync /mnt1/newfile ----> When sync-dax=unsafe/direct
[root@atest-guest ~]# ./mapsync /mnt2/newfile ----> when sync-dax=writeback
Failed to mmap  with Operation not supported

The first patch does the header file cleanup necessary for the
subsequent ones. Second patch implements the hcall, adds the necessary
vmstate properties to spapr machine structure for carrying the hcall
status during save-restore. The nature of the hcall being asynchronus,
the patch uses aio utilities to offload the flush. The third patch adds
the 'sync-dax' device property and enables the device tree property
for the guest to utilise the hcall.

The kernel changes to exploit this hcall is at
https://github.com/linuxppc/linux/commit/75b7c05ebf9026.patch

---
v3 - https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg07916.html
Changes from v3:
      - Fixed the forward declaration coding guideline violations in 1st patch.
      - Removed the code waiting for the flushes to complete during migration,
        instead restart the flush worker on destination qemu in post load.
      - Got rid of the randomization of the flush tokens, using simple
        counter.
      - Got rid of the redundant flush state lock, relying on the BQL now.
      - Handling the memory-backend-ram usage
      - Changed the sync-dax symantics from on/off to 'unsafe','writeback' and 'direct'.
	Added prevention code using 'writeback' on arm and x86_64.
      - Fixed all the miscellaneous comments.

v2 - https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg07031.html
Changes from v2:
      - Using the thread pool based approach as suggested
      - Moved the async hcall handling code to spapr_nvdimm.c along
        with some simplifications
      - Added vmstate to preserve the hcall status during save-restore
        along with pre_save handler code to complete all ongoning flushes.
      - Added hw_compat magic for sync-dax 'on' on previous machines.
      - Miscellanious minor fixes.

v1 - https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg06330.html
Changes from v1
      - Fixed a missed-out unlock
      - using QLIST_FOREACH instead of QLIST_FOREACH_SAFE while generating token

Shivaprasad G Bhat (3):
      spapr: nvdimm: Forward declare and move the definitions
      spapr: nvdimm: Implement H_SCM_FLUSH hcall
      nvdimm: Enable sync-dax device property for nvdimm


 hw/arm/virt.c                 |   28 ++++
 hw/i386/pc.c                  |   28 ++++
 hw/mem/nvdimm.c               |   52 +++++++
 hw/ppc/spapr.c                |   16 ++
 hw/ppc/spapr_nvdimm.c         |  285 +++++++++++++++++++++++++++++++++++++++++
 include/hw/mem/nvdimm.h       |   11 ++
 include/hw/ppc/spapr.h        |   11 +-
 include/hw/ppc/spapr_nvdimm.h |   27 ++--
 qapi/common.json              |   20 +++
 9 files changed, 455 insertions(+), 23 deletions(-)

--
Signature


