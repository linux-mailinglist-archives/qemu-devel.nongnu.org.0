Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF8E6CA529
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:06:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmXJ-0001uI-9q; Mon, 27 Mar 2023 09:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgmXD-0001tv-D1
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:05:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgmX9-0004eR-El
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:05:13 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RD4EdH002740; Mon, 27 Mar 2023 13:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Z84Ik8hagfCWqCObbyItDrTZI3UD7szr6iDpThhUXyE=;
 b=iDoqWsoWSz3Iu1nodkT1iGK+Kv2Mx8ptC+2+tdgdLhit4fFtyFtOVHfzgEl7tTIxIr3r
 79Z3L9V054aUQpTC3LWu8CJx8tFibgu5aMFN+g8uFwP500spColj5gLK+wHmW9/35zLp
 76bFgFEivRavkN6oPhfrM3svIIf+R39NdVBTZ94HDb+jlKnLJZKUiXAJJyUNXZW8l61F
 8t2KrHnqExdVRGUACizKC34yzrJT6SUasyy9yAqX82mdZBrvJEwNEA8QwtM8WrWXUTzi
 EhRybja7ZCuV29JAYjtVZYmxfOYozDMXKo/qDu+UcSIvHohOB6Lk9e0ZjObWoWyUn4tW +g== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pka2akacv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:05:00 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RCvxhT029105;
 Mon, 27 Mar 2023 13:04:59 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3phrk6x2t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:04:59 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RD4vil4588262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 13:04:57 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D07B258056;
 Mon, 27 Mar 2023 13:04:57 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8793F58065;
 Mon, 27 Mar 2023 13:04:57 +0000 (GMT)
Received: from [9.211.158.228] (unknown [9.211.158.228])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 13:04:57 +0000 (GMT)
Message-ID: <5e0dff8b-1214-9a74-7522-cb20ca048512@linux.vnet.ibm.com>
Date: Mon, 27 Mar 2023 08:04:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/3] docs: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Ninad Palsule <ninad@linux.ibm.com>
Cc: qemu-devel@nongnu.org, andrew@aj.id.au, stefanb@linux.ibm.com, clg@kaod.org
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <20230326224426.3918167-2-ninad@linux.ibm.com>
 <CACPK8XfLBT-6eu4cv=CbS2d368N-wcVuvSy+w4Kt-JavPqrhyA@mail.gmail.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <CACPK8XfLBT-6eu4cv=CbS2d368N-wcVuvSy+w4Kt-JavPqrhyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s8ka10IC8QzTKZKoBC7x3hildQhOYnBv
X-Proofpoint-GUID: s8ka10IC8QzTKZKoBC7x3hildQhOYnBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270102
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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

Hi Joel,


On 3/27/23 2:47 AM, Joel Stanley wrote:
> On Sun, 26 Mar 2023 at 22:44, Ninad Palsule <ninad@linux.ibm.com> wrote:
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
>>
>> ---
>> V4:
>> Incorporate Cedric & Stefan's comments
>>
>> - Added example for ast2600-evb
>> - Corrected statement about arm virtual machine.
>>
>> ---
>> V6:
>> Incorporated review comments from Stefan.
>> ---
>>   docs/specs/tpm.rst | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
>> index 535912a92b..590e670a9a 100644
>> --- a/docs/specs/tpm.rst
>> +++ b/docs/specs/tpm.rst
>> @@ -21,12 +21,16 @@ QEMU files related to TPM TIS interface:
>>    - ``hw/tpm/tpm_tis_common.c``
>>    - ``hw/tpm/tpm_tis_isa.c``
>>    - ``hw/tpm/tpm_tis_sysbus.c``
>> + - ``hw/tpm/tpm_tis_i2c.c``
>>    - ``hw/tpm/tpm_tis.h``
>>
>>   Both an ISA device and a sysbus device are available. The former is
>>   used with pc/q35 machine while the latter can be instantiated in the
>>   Arm virt machine.
>>
>> +An I2C device support is also provided which can be instantiated in the Arm
>> +based emulation machines. This device only supports the TPM 2 protocol.
>> +
>>   CRB interface
>>   -------------
>>
>> @@ -348,6 +352,34 @@ In case an Arm virt machine is emulated, use the following command line:
>>       -drive if=pflash,format=raw,file=flash0.img,readonly=on \
>>       -drive if=pflash,format=raw,file=flash1.img
>>
>> +In case a ast2600-evb bmc machine is emulated and want to use TPM device
>> +attached to I2C bus, use the following command line:
>> +
>> +.. code-block:: console
>> +
>> +  qemu-system-arm -M ast2600-evb -nographic \
>> +    -kernel arch/arm/boot/zImage \
>> +    -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
>> +    -initrd rootfs.cpio \
>> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
>> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
> For testing, use this command to load the driver to the correct address:
>
> echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
>
> (I don't know how specific we want to make the instructions, but
> adding a line like above would help others from having to re-discover
> the command).
Make sense. Added.
>
>> +
>> +In case a Rainier bmc machine is emulated and want to use TPM device
>> +attached to I2C bus, use the following command line:
>> +
>> +.. code-block:: console
>> +
>> +  qemu-system-arm -M rainier-bmc -nographic \
>> +    -kernel ${IMAGEPATH}/fitImage-linux.bin \
>> +    -dtb ${IMAGEPATH}/aspeed-bmc-ibm-rainier.dtb \
>> +    -initrd ${IMAGEPATH}/obmc-phosphor-initramfs.rootfs.cpio.xz \
>> +    -drive file=${IMAGEPATH}/obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2\
>> +    -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443\
>> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
>> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>> +
> I'd drop this example, the above one is enough.
Removed.
>
>>   In case SeaBIOS is used as firmware, it should show the TPM menu item
>>   after entering the menu with 'ESC'.
>>
>> --
>> 2.37.2
>>

