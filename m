Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB016C73FD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 00:22:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfUFb-0002mQ-B6; Thu, 23 Mar 2023 19:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfUFX-0002kb-J3
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 19:21:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfUFT-00050D-Vg
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 19:21:38 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32NLXvDs004853; Thu, 23 Mar 2023 22:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+W5xNASDuMfQa4MYdp/Ip2sDYskgHFUk4k+P5/chJLs=;
 b=MORBJLZVpKwFG6pB7X6RmB2lLyocKgQRndfMl3kFRuMlMNvfU6OyHkOAA2DhzgvP7yh/
 PlJFYwmApW5XTrWnuHFYFhHxrEsMysy+vTB9Bo4yJUVSOkVBepHJoKq7mjY1zThmTnNg
 OjM2AGE1e+RjkORFJdpclpmKcgRbHKsgzmzKvJeNHsR0MOZwsbWH0vhNeVjwH3xdQ2/7
 p7ne2i8FJHtqcUCBZO2ZiGpsRiVw7WUxrUvwZbue2xT6Z+i/AbDWKBn/nkEezQ+73RfP
 n8OJDdtZO61GnZwCDuReeC5TsK8jEYMokxNLfdKfGbXystPcpV7kZWnypE91gXjw62he UA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgxt0rsep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 22:11:45 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NM2alX004482;
 Thu, 23 Mar 2023 22:11:44 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3pgy7dg1n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 22:11:44 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32NMBhV817039910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Mar 2023 22:11:43 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0231F58052;
 Thu, 23 Mar 2023 22:11:43 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCF175805A;
 Thu, 23 Mar 2023 22:11:42 +0000 (GMT)
Received: from [9.163.39.211] (unknown [9.163.39.211])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Mar 2023 22:11:42 +0000 (GMT)
Message-ID: <c5079a3e-aea6-1390-1bc4-e657d2b94b97@linux.vnet.ibm.com>
Date: Thu, 23 Mar 2023 17:11:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] docs: Add support for TPM devices over I2C bus
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, stefanb@linux.ibm.com
References: <20230323030119.2113570-1-ninad@linux.ibm.com>
 <20230323030119.2113570-2-ninad@linux.ibm.com>
 <ae61d505-b656-a362-8a80-35f266296e2a@kaod.org>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <ae61d505-b656-a362-8a80-35f266296e2a@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: faJcP0xEctejEw_sQW7JaVxLfIAmzwUt
X-Proofpoint-ORIG-GUID: faJcP0xEctejEw_sQW7JaVxLfIAmzwUt
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-23_13,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303230160
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


On 3/23/23 2:49 AM, Cédric Le Goater wrote:
> On 3/23/23 04:01, Ninad Palsule wrote:
>> This is a documentation change for I2C TPM device support.
>>
>> Qemu already supports devices attached to ISA and sysbus.
>> This drop adds support for the I2C bus attached TPM devices.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>>
>> ---
>> V2:
>>
>> Incorporated Stephen's review comments
>> - Added example in the document.
>> ---
>>   docs/specs/tpm.rst | 20 +++++++++++++++++++-
>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
>> index 535912a92b..bf7249b09c 100644
>> --- a/docs/specs/tpm.rst
>> +++ b/docs/specs/tpm.rst
>> @@ -21,11 +21,15 @@ QEMU files related to TPM TIS interface:
>>    - ``hw/tpm/tpm_tis_common.c``
>>    - ``hw/tpm/tpm_tis_isa.c``
>>    - ``hw/tpm/tpm_tis_sysbus.c``
>> + - ``hw/tpm/tpm_tis_i2c.c``
>>    - ``hw/tpm/tpm_tis.h``
>>     Both an ISA device and a sysbus device are available. The former is
>>   used with pc/q35 machine while the latter can be instantiated in the
>> -Arm virt machine.
>> +Arm virt machine. An I2C device support is also added which can be
>> +instantiated in the arm based emulation machine. An I2C device is also
>> +supported for the Arm virt machine. This device only supports the
>> +TPM 2 protocol.
>>     CRB interface
>>   -------------
>> @@ -348,6 +352,20 @@ In case an Arm virt machine is emulated, use the 
>> following command line:
>>       -drive if=pflash,format=raw,file=flash0.img,readonly=on \
>>       -drive if=pflash,format=raw,file=flash1.img
>>   +In case a Rainier bmc machine is emulated, use the following 
>> command line:
>> +
>> +.. code-block:: console
>> +
>> +  qemu-system-arm -M rainier-bmc -nographic \
>> +    -kernel ${IMAGEPATH}/fitImage-linux.bin \
>> +    -dtb ${IMAGEPATH}/aspeed-bmc-ibm-rainier.dtb \
>> +    -initrd ${IMAGEPATH}/obmc-phosphor-initramfs.rootfs.cpio.xz \
>> +    -drive 
>> file=${IMAGEPATH}/obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2\
>> +    -net nic -net 
>> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443\
>> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
>> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>
>
> The rainier images are not the easiest to find. Could we use an 
> AST2600 EVB
> machine instead and instantiate the device from user space ? see commit
> 3302184f7f or 7a7308eae0.
>
Ok, I will check on AST2600 EVB machine. The rainier images are 
available here: 
https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/distro=ubuntu,label=docker-builder,target=p10bmc/artifact/openbmc/build/tmp/deploy/images/p10bmc/

Thanks for the review.

Ninad

> Thanks,
>
> C.
>
>>   In case SeaBIOS is used as firmware, it should show the TPM menu item
>>   after entering the menu with 'ESC'.
>



