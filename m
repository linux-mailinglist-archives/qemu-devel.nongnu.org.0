Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62AD22F403
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 17:41:58 +0200 (CEST)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k05GH-0000FB-Cb
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 11:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1k05FE-0008DY-Fq; Mon, 27 Jul 2020 11:40:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1k05FC-0004vE-9i; Mon, 27 Jul 2020 11:40:52 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RFWdrH117955; Mon, 27 Jul 2020 11:40:46 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32hvhdtfy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 11:40:46 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06RFWfXj118105;
 Mon, 27 Jul 2020 11:40:45 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32hvhdtfws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 11:40:45 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RFRRNK012640;
 Mon, 27 Jul 2020 15:40:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 32gcye9ey1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 15:40:43 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06RFee4N26214806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 15:40:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E74FAE053;
 Mon, 27 Jul 2020 15:40:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9991AE057;
 Mon, 27 Jul 2020 15:40:39 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.17.84])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 15:40:39 +0000 (GMT)
Subject: Re: [RFC PATCH] s390x/pci: vfio-pci breakage with disabled mem
 enforcement
To: Alex Williamson <alex.williamson@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
References: <1595517236-17823-1-git-send-email-mjrosato@linux.ibm.com>
 <20200723102916.7cf15b43@w520.home>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <0481c77e-f71f-886b-9b0a-41529eb139ee@linux.ibm.com>
Date: Mon, 27 Jul 2020 17:40:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200723102916.7cf15b43@w520.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_10:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1011 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270105
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 11:40:46
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: schnelle@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020-07-23 18:29, Alex Williamson wrote:
> On Thu, 23 Jul 2020 11:13:55 -0400
> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> 
>> I noticed that after kernel commit abafbc55 'vfio-pci: Invalidate mmaps
>> and block MMIO access on disabled memory' vfio-pci via qemu on s390x
>> fails spectacularly, with errors in qemu like:
>>
>> qemu-system-s390x: vfio_region_read(0001:00:00.0:region0+0x0, 4) failed: Input/output error
>>
>>  From read to bar 0 originating out of hw/s390x/s390-pci-inst.c:zpci_read_bar().
>>
>> So, I'm trying to figure out how to get vfio-pci happy again on s390x.  From
>> a bit of tracing, we seem to be triggering the new trap in
>> __vfio_pci_memory_enabled().  Sure enough, if I just force this function to
>> return 'true' as a test case, things work again.
>> The included patch attempts to enforce the setting, which restores everything
>> to working order but also triggers vfio_bar_restore() in the process....  So
>> this isn't the right answer, more of a proof-of-concept.
>>
>> @Alex: Any guidance on what needs to happen to make qemu-s390x happy with this
>> recent kernel change?
> 
> Bummer!  I won't claim to understand s390 PCI, but if we have a VF
> exposed to the "host" (ie. the first level where vfio-pci is being
> used), but we can't tell that it's a VF, how do we know whether the
> memory bit in the command register is unimplemented because it's a VF
> or unimplemented because the device doesn't support MMIO?  How are the
> device ID, vendor ID, and BAR registers virtualized to the host?  Could
> the memory enable bit also be emulated by that virtualization, much
> like vfio-pci does for userspace?  If the other registers are
> virtualized, but these command register bits are left unimplemented, do
> we need code to deduce that we have a VF based on the existence of MMIO
> BARs, but lack of memory enable bit?  Thanks,
> 
> Alex

Alex, Matt,

in s390 we have the possibility to assign a virtual function to a 
logical partition as function 0.
In this case it can not be treated as a virtual function but must be 
treated as a physical function.
This is currently working very well.
However, these functions do not set PCI_COMMAND_MEMORY as we need.

Shouldn't we fix this inside the kernel, to keep older QMEU working?

Then would it be OK to add a new bit/boolean inside the 
pci_dev/vfio_pci_device like, is_detached_vfn, that we could set during 
enumeration and test inside __vfio_pci_memory_enabled() to return true?

In the enumeration we have the possibility to know if the function is a 
HW/Firmware virtual function on devfn 0 or if it is created by SRIOV.

It seems an easy fix without side effects.

What do you think?


> 
>> @Nilkas/@Pierre: I wonder if this might be related to host device is_virtfn?
>> I note that my host device lspci output looks like:
>>
>> 0000:00:00.0 Ethernet controller: Mellanox Technologies MT27710 Family [ConnectX-4 Lx Virtual Function]
>>
>> But the device is not marked as is_virtfn..  Otherwise, Alex's fix
>> from htps://lkml.org/lkml/2020/6/25/628 should cover the case.
>>

I do not think we can fix this problem by forcing the is_virtfn bit.
AFAIU, our HW virtual function works a lot like a physical function.

>>
>>
>> Matthew Rosato (1):
>>    s390x/pci: Enforce PCI_COMMAND_MEMORY for vfio-pci
>>
>>   hw/s390x/s390-pci-inst.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
> 
> 

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

