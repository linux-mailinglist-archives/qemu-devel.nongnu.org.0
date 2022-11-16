Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B6C62B827
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 11:28:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovFdn-0001Et-Qw; Wed, 16 Nov 2022 05:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1ovFdm-0001EZ-0y; Wed, 16 Nov 2022 05:27:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1ovFde-0007pd-GA; Wed, 16 Nov 2022 05:27:29 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AG8mpOp029343; Wed, 16 Nov 2022 10:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pwTyPfuu2VTWc7s3MBiCSkpLjwXauHN7IvittGDwlkg=;
 b=ZpET93Mjzry3Fp5Yj5LtLvS3MKKMrU9TTE8/De+IEfxPYaY7tMSxVDZ0/Hel2bSsD1qk
 qHnVjnrnmai9IdEKrgSAycCEbMhu64UR5cJ/cbexFQ5w+wL9WgspH2AA+WdaxgnGSbjs
 UW3QybGyiNGF9ZIp/ZCSXwSTQmgkagkitmCWLkImKv4pRut7nID1ttgUfnDvq5fzZ742
 77ORPRStc6P9d/gyH+iYjIK3EgOfshGSB99OrCRTM3PbD5V17A5nRIubwU7T0Bhrjjkl
 f0buHqsLDt/BUjZq8lCjeS3kZ/SDMfPl8bR6pyU8cp+cVYPDGPQoaRhRUfN/rafEZJW0 JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvvpca7d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 10:27:12 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AG9sDgc010092;
 Wed, 16 Nov 2022 10:27:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvvpca7ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 10:27:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AGAKdgg032719;
 Wed, 16 Nov 2022 10:27:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3kt2rjdrfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 10:27:09 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2AGARk5T36700600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Nov 2022 10:27:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7914A52050;
 Wed, 16 Nov 2022 10:27:06 +0000 (GMT)
Received: from [9.152.222.245] (unknown [9.152.222.245])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DB9095204E;
 Wed, 16 Nov 2022 10:27:05 +0000 (GMT)
Message-ID: <c19be0ca-9e44-ef9a-ea41-a6e46b6f06a6@linux.ibm.com>
Date: Wed, 16 Nov 2022 11:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v11 04/11] s390x/cpu topology: reporting the CPU topology
 to the guest
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, scgl@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com
References: <20221103170150.20789-1-pmorel@linux.ibm.com>
 <20221103170150.20789-5-pmorel@linux.ibm.com>
 <10b55b2a-e736-6aeb-8265-6758ca83213c@kaod.org>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <10b55b2a-e736-6aeb-8265-6758ca83213c@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jrc7y0KN43ox9nGWzsL_UydxAeK22m3q
X-Proofpoint-ORIG-GUID: E3hQg0WSv_Wwztuz8bC8XMXZgNRwEsYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_01,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160071
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



On 11/15/22 12:21, Cédric Le Goater wrote:
> Hello Pierre,
> 
> On 11/3/22 18:01, Pierre Morel wrote:
>> The guest can use the STSI instruction to get a buffer filled
>> with the CPU topology description.
>>
>> Let us implement the STSI instruction for the basis CPU topology
>> level, level 2.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   include/hw/s390x/cpu-topology.h |   6 ++
>>   target/s390x/cpu.h              |  77 ++++++++++++++++++++++++
>>   hw/s390x/cpu-topology.c         |   1 -
>>   target/s390x/cpu_topology.c     | 100 ++++++++++++++++++++++++++++++++
>>   target/s390x/kvm/kvm.c          |   6 +-
>>   target/s390x/meson.build        |   1 +
>>   6 files changed, 189 insertions(+), 2 deletions(-)
>>   create mode 100644 target/s390x/cpu_topology.c
>>
>> diff --git a/include/hw/s390x/cpu-topology.h 
>> b/include/hw/s390x/cpu-topology.h
>> index 4e16a2153d..6fec10e032 100644
>> --- a/include/hw/s390x/cpu-topology.h
>> +++ b/include/hw/s390x/cpu-topology.h
>> @@ -16,6 +16,11 @@
>>   #define S390_TOPOLOGY_CPU_IFL 0x03
>>   #define S390_TOPOLOGY_MAX_ORIGIN ((63 + S390_MAX_CPUS) / 64)
>> +#define S390_TOPOLOGY_POLARITY_HORIZONTAL      0x00
>> +#define S390_TOPOLOGY_POLARITY_VERTICAL_LOW    0x01
>> +#define S390_TOPOLOGY_POLARITY_VERTICAL_MEDIUM 0x02
>> +#define S390_TOPOLOGY_POLARITY_VERTICAL_HIGH   0x03
>> +
>>   typedef struct S390TopoSocket {
>>       int active_count;
>>       uint64_t mask[S390_TOPOLOGY_MAX_ORIGIN];
>> @@ -26,6 +31,7 @@ struct S390Topology {
>>       uint32_t nr_cpus;
>>       uint32_t nr_sockets;
>>       S390TopoSocket *socket;
>> +    bool topology_needed;
> 
> 
> This is unused in this patch. Introduced too soon ?

right, thanks.

> 
> 
>>   };
>>   #define TYPE_S390_CPU_TOPOLOGY "s390-topology"
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index c9066b2496..69a7523146 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -567,6 +567,81 @@ typedef union SysIB {
>>   } SysIB;
>>   QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>> +/*
>> + * CPU Topology List provided by STSI with fc=15 provides a list
>> + * of two different Topology List Entries (TLE) types to specify
>> + * the topology hierarchy.
>> + *
>> + * - Container Topology List Entry
>> + *   Defines a container to contain other Topology List Entries
>> + *   of any type, nested containers or CPU.
>> + * - CPU Topology List Entry
>> + *   Specifies the CPUs position, type, entitlement and polarization
>> + *   of the CPUs contained in the last Container TLE.
>> + *
>> + * There can be theoretically up to five levels of containers, QEMU
>> + * uses only one level, the socket level.
>> + *
>> + * A container of with a nesting level (NL) greater than 1 can only
>> + * contain another container of nesting level NL-1.
>> + *
>> + * A container of nesting level 1 (socket), contains as many CPU TLE
>> + * as needed to describe the position and qualities of all CPUs inside
>> + * the container.
>> + * The qualities of a CPU are polarization, entitlement and type.
>> + *
>> + * The CPU TLE defines the position of the CPUs of identical qualities
>> + * using a 64bits mask which first bit has its offset defined by
>> + * the CPU address orgin field of the CPU TLE like in:
>> + * CPU address = origin * 64 + bit position within the mask
>> + *
>> + */
>> +/* Container type Topology List Entry */
>> +typedef struct SysIBTl_container {
>> +        uint8_t nl;
>> +        uint8_t reserved[6];
>> +        uint8_t id;
>> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_container;
>> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_container) != 8);
>> +
>> +/* CPU type Topology List Entry */
>> +typedef struct SysIBTl_cpu {
>> +        uint8_t nl;
>> +        uint8_t reserved0[3];
>> +        uint8_t reserved1:5;
>> +        uint8_t dedicated:1;
>> +        uint8_t polarity:2;
>> +        uint8_t type;
>> +        uint16_t origin;
>> +        uint64_t mask;
>> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_cpu;
>> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_cpu) != 16);
>> +
>> +#define S390_TOPOLOGY_MAG  6
>> +#define S390_TOPOLOGY_MAG6 0
>> +#define S390_TOPOLOGY_MAG5 1
>> +#define S390_TOPOLOGY_MAG4 2
>> +#define S390_TOPOLOGY_MAG3 3
>> +#define S390_TOPOLOGY_MAG2 4
>> +#define S390_TOPOLOGY_MAG1 5
>> +/* Configuration topology */
>> +typedef struct SysIB_151x {
>> +    uint8_t  reserved0[2];
>> +    uint16_t length;
>> +    uint8_t  mag[S390_TOPOLOGY_MAG];
>> +    uint8_t  reserved1;
>> +    uint8_t  mnest;
>> +    uint32_t reserved2;
>> +    char tle[0];
>> +} QEMU_PACKED QEMU_ALIGNED(8) SysIB_151x;
>> +QEMU_BUILD_BUG_ON(sizeof(SysIB_151x) != 16);
>> +
>> +/* Max size of a SYSIB structure is when all CPU are alone in a 
>> container */
>> +#define S390_TOPOLOGY_SYSIB_SIZE (sizeof(SysIB_151x) 
>> +                         \
>> +                                  S390_MAX_CPUS * 
>> (sizeof(SysIBTl_container) + \
>> +                                                   sizeof(SysIBTl_cpu)))
>> +
>> +
>>   /* MMU defines */
>>   #define ASCE_ORIGIN           (~0xfffULL) /* segment table 
>> origin             */
>>   #define ASCE_SUBSPACE         0x200       /* subspace group 
>> control           */
>> @@ -845,4 +920,6 @@ S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
>>   #include "exec/cpu-all.h"
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar);
>> +
>>   #endif
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index 6af41d3d7b..9fa8ca1261 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -44,7 +44,6 @@ void s390_topology_new_cpu(S390CPU *cpu)
>>       int socket_id;
>>       socket_id = core_id / topo->nr_cpus;
>> -
> 
> Unnecessary change.

Yes,

thanks,

regards,
Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

