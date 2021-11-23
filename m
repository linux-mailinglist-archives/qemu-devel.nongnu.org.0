Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D2145A233
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 13:07:04 +0100 (CET)
Received: from localhost ([::1]:34954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpUZi-0001Rv-Uj
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 07:07:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mpUX4-0008LA-SN; Tue, 23 Nov 2021 07:04:18 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43228
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mpUX2-0003Qg-0w; Tue, 23 Nov 2021 07:04:18 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ANBH7OT032064; 
 Tue, 23 Nov 2021 12:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 reply-to : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=Prg8CkaXa5y6VywqPY6zwrh1ATNvvvSC9evAMvGgtBU=;
 b=MdE8LxZ5x8pWlxcmX5lf0dMxX8B8db1hh25B0GPDevS/Xrj+d5onFrNt7gxVkcAaB/3c
 xAogJuWv0dnZ62N8XCo9ntmCdnkOMJoIjEddKxmDUSjANdy9YI1W5X7K/6eaPN1/+DAz
 N+tjWs1z4X/QvYxFUdB3vMhwErvWYNyQ09SM3fCtiJ4O0qHvp16Idd8B4xYKCgryCs6u
 IkIEW5bnsFWtJBthOIudq12tjUSSybaKwx9jbin5b6U0OiZJHbfzWHvCvPx/vrsmyRS3
 BhNbsJufh0c7Af8dKJ0THf/zJWjpW8oW1aK6MKo7dxvN82/YYmlearbDCWV5qBYJSf4A 9A== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cgy9v0wxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 12:04:07 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ANC41lM021621;
 Tue, 23 Nov 2021 12:04:06 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 3cernaj1h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 12:04:06 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ANC3k1r38404452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 12:03:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE94A78066;
 Tue, 23 Nov 2021 12:03:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA6757805E;
 Tue, 23 Nov 2021 12:03:45 +0000 (GMT)
Received: from [9.160.47.188] (unknown [9.160.47.188])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 23 Nov 2021 12:03:45 +0000 (GMT)
Message-ID: <4e7a6097-d215-b63e-ad96-e97f3763ad84@linux.ibm.com>
Date: Tue, 23 Nov 2021 09:03:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] docs: Minor updates on the powernv documentation.
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
References: <1c40a43de8b899dccaac137c88007ec72609952a.1637180046.git.lagarcia@br.ibm.com>
 <31614c56-fa15-8407-003b-f44569da7b28@kaod.org>
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?=
 <lagarcia@linux.ibm.com>
Organization: IBM
In-Reply-To: <31614c56-fa15-8407-003b-f44569da7b28@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hWaPkGFAcuUh8WP1i4YU5uDkZGmHx-EE
X-Proofpoint-ORIG-GUID: hWaPkGFAcuUh8WP1i4YU5uDkZGmHx-EE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_04,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230067
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: lagarcia@br.ibm.com
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 06:03, Cédric Le Goater wrote:
> On 11/17/21 21:16, lagarcia@linux.ibm.com wrote:
>> From: Leonardo Garcia <lagarcia@br.ibm.com>
>>
>> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
>> ---
>>   docs/system/ppc/powernv.rst | 56 +++++++++++++++++++------------------
>>   1 file changed, 29 insertions(+), 27 deletions(-)
>>
>> diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
>> index 86186b7d2c..907c4ce4f9 100644
>> --- a/docs/system/ppc/powernv.rst
>> +++ b/docs/system/ppc/powernv.rst
>> @@ -1,7 +1,7 @@
>> -PowerNV family boards (``powernv8``, ``powernv9``)
>> +PowerNV family boards (``powernv8``, ``powernv9``, ``power10``)
>
> powernv10.
>
> And I still haven't resent the XIVE2/PHB5 patches to enable full support.
>
>>   ==================================================================
>>   -PowerNV (as Non-Virtualized) is the "baremetal" platform using the
>> +PowerNV (as Non-Virtualized) is the "bare metal" platform using the
>>   OPAL firmware. It runs Linux on IBM and OpenPOWER systems and it can
>>   be used as an hypervisor OS, running KVM guests, or simply as a host
>>   OS.
>> @@ -15,17 +15,15 @@ beyond the scope of what QEMU addresses today.
>>   Supported devices
>>   -----------------
>>   - * Multi processor support for POWER8, POWER8NVL and POWER9.
>> - * XSCOM, serial communication sideband bus to configure chiplets
>> - * Simple LPC Controller
>> - * Processor Service Interface (PSI) Controller
>> - * Interrupt Controller, XICS (POWER8) and XIVE (POWER9)
>> - * POWER8 PHB3 PCIe Host bridge and POWER9 PHB4 PCIe Host bridge
>> - * Simple OCC is an on-chip microcontroller used for power management
>> -   tasks
>> - * iBT device to handle BMC communication, with the internal BMC
>> -   simulator provided by QEMU or an external BMC such as an Aspeed
>> -   QEMU machine.
>> + * Multi processor support for POWER8, POWER8NVL and Power9.
>
> s/Power9/POWER9/ right ? I am starting to doubt :)


Well... <sigh>...

According to IBM new branding rules (I wasn't able to find any external
documents on this but we were asked to use it externally), the processor
name is now Power instead of POWER. As the document I have access to
only references Power9 and Power10, I am interpreting this as "don't
mess with old names", specially as I don't want to start rewriting
documents and comments because of these marketing changes of humor. TBH,
I am OK either way.

I will include the other suggestions in a new patch and resubmit.

Cheers,

Leo


>
>> + * XSCOM, serial communication sideband bus to configure chiplets.
>> + * Simple LPC Controller.
>> + * Processor Service Interface (PSI) Controller.
>> + * Interrupt Controller, XICS (POWER8) and XIVE (Power9) and XIVE2
>> (Power10).
>> + * POWER8 PHB3 PCIe Host bridge and POWER9 PHB4 PCIe Host bridge.
>> + * Simple OCC is an on-chip micro-controller used for power
>> management tasks.
>> + * iBT device to handle BMC communication, with the internal BMC
>> simulator
>> +   provided by QEMU or an external BMC such as an Aspeed QEMU machine.
>>    * PNOR containing the different firmware partitions.
>>     Missing devices
>> @@ -33,27 +31,25 @@ Missing devices
>>     A lot is missing, among which :
>>   - * POWER10 processor
>> - * XIVE2 (POWER10) interrupt controller
>> - * I2C controllers (yet to be merged)
>> - * NPU/NPU2/NPU3 controllers
>> - * EEH support for PCIe Host bridge controllers
>> - * NX controller
>> - * VAS controller
>> - * chipTOD (Time Of Day)
>> + * I2C controllers (yet to be merged).
>> + * NPU/NPU2/NPU3 controllers.
>> + * EEH support for PCIe Host bridge controllers.
>> + * NX controller.
>> + * VAS controller.
>> + * chipTOD (Time Of Day).
>>    * Self Boot Engine (SBE).
>> - * FSI bus
>> + * FSI bus.
>>     Firmware
>>   --------
>>     The OPAL firmware (OpenPower Abstraction Layer) for OpenPower
>> systems
>>   includes the runtime services ``skiboot`` and the bootloader kernel
>> and
>> -initramfs ``skiroot``. Source code can be found on GitHub:
>> +initramfs ``skiroot``. Source code can be found on the `OpenPOWER
>> account at
>> +GitHub <https://github.com/open-power>`_.
>>   -  https://github.com/open-power.
>> -
>> -Prebuilt images of ``skiboot`` and ``skiroot`` are made available on
>> the `OpenPOWER <https://github.com/open-power/op-build/releases/>`__
>> site.
>> +Prebuilt images of ``skiboot`` and ``skiroot`` are made available on
>> the
>> +`OpenPOWER <https://github.com/open-power/op-build/releases/>`__ site.
>>     QEMU includes a prebuilt image of ``skiboot`` which is updated
>> when a
>>   more recent version is required by the models.
>> @@ -83,6 +79,7 @@ and a SATA disk :
>>     Complex PCIe configuration
>>   ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>>   Six PHBs are defined per chip (POWER9) but no default PCI layout is
>>   provided (to be compatible with libvirt). One PCI device can be added
>>   on any of the available PCIe slots using command line options such as:
>> @@ -157,7 +154,7 @@ one on the command line :
>>   The files `palmetto-SDR.bin
>> <http://www.kaod.org/qemu/powernv/palmetto-SDR.bin>`__
>>   and `palmetto-FRU.bin
>> <http://www.kaod.org/qemu/powernv/palmetto-FRU.bin>`__
>>   define a Sensor Data Record repository and a Field Replaceable Unit
>> -inventory for a palmetto BMC. They can be used to extend the QEMU BMC
>> +inventory for a Palmetto BMC. They can be used to extend the QEMU BMC
>>   simulator.
>>     .. code-block:: bash
>> @@ -190,3 +187,8 @@ CAVEATS
>>      * No support for multiple HW threads (SMT=1). Same as pseries.
>>    * CPU can hang when doing intensive I/Os. Use ``-append
>> powersave=off`` in that case.
>
> The last caveat is not true. I found the issue since in the decrementer
> model.
>
> Thanks
>
> C.
>
>> +
>> +Maintainer contact information
>> +------------------------------
>> +
>> +Cédric Le Goater <clg@kaod.org>
>> \ No newline at end of file
>>
>
>

