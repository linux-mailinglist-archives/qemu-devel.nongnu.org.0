Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D76246BA41
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 12:41:35 +0100 (CET)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muYqj-0002Bw-Uh
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 06:41:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1muYpI-0001FB-1B; Tue, 07 Dec 2021 06:40:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1muYpE-0007wX-WA; Tue, 07 Dec 2021 06:40:03 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B78mUof016070; 
 Tue, 7 Dec 2021 11:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 reply-to : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=2TmCIpNFAuh3vEMEbVL68/sNo7UPGTyUyjBfJSaYvgI=;
 b=jmSf6RFQldHWK9CyVYUHqKESytZASB/iG5WGnbRzkX50N5MKJ2WjBVMw8tVuErk5bImi
 twj4QcjWbaa3UplIYQoSnulAhac+0jJZ7fchCCfxwfXJeJr3JLn3FZ05G1LN35cWK/bg
 kbAJ5gh7qY89LR2bAJmKpu6gGSkvH9KVv79lnuQNrEuFiDc+tz31+883/XU2XFMy8Bke
 NN3+HHyJE5bns9LKk384lGUmHNeqsqca2W9BDaAZQLS11esdQWp7VGQ/UVPDng6tXSvE
 6c69NuPdm6QPS77Z3uxWO1zShpzEyg8lBtmshgZ5tlAMuTMHmxJ18ZwYwVh5ZvCyDK7T 0g== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4e437rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 11:39:52 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7BbkHD027588;
 Tue, 7 Dec 2021 11:39:51 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3cqyybpc5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 11:39:51 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7Bdolt52232694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 11:39:50 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16EF7AC060;
 Tue,  7 Dec 2021 11:39:50 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1FD7AC059;
 Tue,  7 Dec 2021 11:39:48 +0000 (GMT)
Received: from [9.160.64.156] (unknown [9.160.64.156])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 11:39:48 +0000 (GMT)
Message-ID: <1bebffd2-c028-48e3-878b-5baa956ade8c@linux.ibm.com>
Date: Tue, 7 Dec 2021 08:39:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] docs: Minor updates on the powernv documentation.
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <c387f883b3db34d9fcb44ccac2ef11c35a25e18c.1637669345.git.lagarcia@br.ibm.com>
 <0eabc870-39d2-e336-a43e-311921605b25@kaod.org>
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?=
 <lagarcia@linux.ibm.com>
Organization: IBM
In-Reply-To: <0eabc870-39d2-e336-a43e-311921605b25@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BNp3zFcRuZE7xDJjcKot5dgspXiPi6_u
X-Proofpoint-GUID: BNp3zFcRuZE7xDJjcKot5dgspXiPi6_u
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_04,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070066
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
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
Reply-To: lagarcia@br.ibm.com
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 03:51, Cédric Le Goater wrote:
> Hello Leonardo,
>
> On 11/23/21 13:10, lagarcia@linux.ibm.com wrote:
>> From: Leonardo Garcia <lagarcia@br.ibm.com>
>>
>> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
>> ---
>
> It seems that POWER10 was renamed to Power10 but not POWER9. And :
>
>   https://en.wikipedia.org/wiki/Power9  redirects to POWER9
>   https://en.wikipedia.org/wiki/POWER10 redirects to Power10
>
> I will keep the upper case POWER9. No need to resend.


 
Ok. Thanks! I'll keep this nomenclature on the pseries documentation
patches as well.
 
Cheers,
 
Leo


>
> Thanks,
>
> C.
>
>
>
>>   docs/system/ppc/powernv.rst | 57 +++++++++++++++++++------------------
>>   1 file changed, 29 insertions(+), 28 deletions(-)
>>
>> diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
>> index 86186b7d2c..eda4219a27 100644
>> --- a/docs/system/ppc/powernv.rst
>> +++ b/docs/system/ppc/powernv.rst
>> @@ -1,7 +1,7 @@
>> -PowerNV family boards (``powernv8``, ``powernv9``)
>> +PowerNV family boards (``powernv8``, ``powernv9``, ``powernv10``)
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
>> @@ -189,4 +186,8 @@ CAVEATS
>>   -------
>>      * No support for multiple HW threads (SMT=1). Same as pseries.
>> - * CPU can hang when doing intensive I/Os. Use ``-append
>> powersave=off`` in that case.
>> +
>> +Maintainer contact information
>> +------------------------------
>> +
>> +Cédric Le Goater <clg@kaod.org>
>> \ No newline at end of file
>>
>
>

