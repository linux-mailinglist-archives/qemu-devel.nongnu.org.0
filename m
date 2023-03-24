Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F096C7E1B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 13:34:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfZjB-0003EW-2U; Fri, 24 Mar 2023 01:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfZj6-0003EK-Jp
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 01:12:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfZiq-0006P4-LK
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 01:12:31 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32O53kwP005513; Fri, 24 Mar 2023 05:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=q/yThLRwMjHg7ZMcc3RtIdl0V1jcfVh4ua5GfPfW/M0=;
 b=RmWBSTWq8lQ711daio0AB23PtWhLcS7Y0AnZeSwH8gGpRHezI2eCvqCVLsPeYEo0cCNO
 y1hsonGJZCoMn0ukNR+Kfyv6e5M4ENLfdQ3YX17WSYAB/kyVmkYZa7jH0Ig5sr5AfbkY
 aydCigHyCSiXf0KBJx/3MClRqQlvCsAtKof4c7QwNDxZ3xu1Qa3prO+aWPXHsGB/O+gl
 3yvdPxrfIRc0iWspWXrCoXc3fJM2FCcmId7FQc+M04KwIv7tTweuisBy2s3mVrHXaN9I
 0ZFvbbty6wMb7l1YweITYOVNn+5uHS1JvP2aDYCq37dcZsPic9uR33FjBVuWrGEPuyhK 8A== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgxs28bk7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 05:11:19 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32O3mWFq002459;
 Fri, 24 Mar 2023 05:11:18 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pgy3ta4vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 05:11:18 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32O5BGKe66716046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 05:11:16 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6888358066;
 Fri, 24 Mar 2023 05:11:16 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE13258065;
 Fri, 24 Mar 2023 05:11:15 +0000 (GMT)
Received: from [9.211.104.157] (unknown [9.211.104.157])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 24 Mar 2023 05:11:15 +0000 (GMT)
Message-ID: <026d8d44-c698-189e-155d-ac9c23c4361b@linux.vnet.ibm.com>
Date: Fri, 24 Mar 2023 00:11:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] docs: Add support for TPM devices over I2C bus
Content-Language: en-US
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, stefanb@linux.ibm.com
References: <20230323030119.2113570-1-ninad@linux.ibm.com>
 <20230323030119.2113570-2-ninad@linux.ibm.com>
 <ae61d505-b656-a362-8a80-35f266296e2a@kaod.org>
 <efde764d-d675-07e7-ba60-f4406d083ceb@linux.vnet.ibm.com>
In-Reply-To: <efde764d-d675-07e7-ba60-f4406d083ceb@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Tt7UjVMlV97dbt3lMA92xm7xGQCp5J4X
X-Proofpoint-ORIG-GUID: Tt7UjVMlV97dbt3lMA92xm7xGQCp5J4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_02,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240039
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

Hello Cedric,

Joel helped me to configure the device and we are able to configure tpm 
device on ast2600-evb.

I will include this example in the documentation.

# uname -a
Linux ast2600-evb 6.1.15 #1 SMP Thu Mar 23 20:48:29 CDT 2023 armv7l 
GNU/Linux
# cat /etc/os-release
NAME=Buildroot
VERSION=2023.02-dirty
ID=buildroot
VERSION_ID=2023.02
PRETTY_NAME="Buildroot 2023.02"

# echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
[   59.681684] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)
[   59.703190] tpm tpm0: A TPM error (256) occurred attempting the self test
[   59.705215] tpm tpm0: starting up the TPM manually
[   59.892917] i2c i2c-12: new_device: Instantiated device tpm_tis_i2c at 0x2e
# cd /sys/class/tpm/tpm0
# ls
dev                pcr-sha256         power              uevent
device             pcr-sha384         subsystem
pcr-sha1           pcr-sha512         tpm_version_major

On 3/23/23 10:23 PM, Ninad Palsule wrote:
> Hello Cedric,
>
> I tried to use ast2600-evb machine but it is not getting any message 
> on I2C bus.
>
> Any suggestions?
>
> # Start the software TPM emulator.
>     $ swtpm socket --tpmstate dir=/tmp/mytpm1   --ctrl 
> type=unixio,path=/tmp/mytpm1/swtpm-sock   --tpm2   --log level=100
>
> # Start a qemu and point at swtpm. I am using i2c bus 12 and address 0x2e
>     $ ~/qemu/build/qemu-system-arm -M ast2600-evb -nographic -kernel 
> $IMAGEDIR/zImage -dtb $IMAGEDIR/aspeed-ast2600-evb.dtb -initrd 
> $IMAGEDIR/rootfs.cpio -chardev 
> socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock -tpmdev 
> emulator,id=tpm0,chardev=chrtpm -device 
> tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>
> # Inside the ast2600-evb machine. Insantiated the device
>     # echo 12 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
>     [  158.265321] i2c i2c-12: new_device: Instantiated device 12 at 0x2e
>
> # Tried to instantiate TPM device but nothing happening on I2C bus.
>     # echo 12-002e > /sys/bus/i2c/drivers/tpm_tis_i2c/bind
>     sh: write error: No such device
>
> Thanks & Regards,
>
> Ninad Palsule
>
> On 3/23/23 2:49 AM, Cédric Le Goater wrote:
>> On 3/23/23 04:01, Ninad Palsule wrote:
>>> This is a documentation change for I2C TPM device support.
>>>
>>> Qemu already supports devices attached to ISA and sysbus.
>>> This drop adds support for the I2C bus attached TPM devices.
>>>
>>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>>>
>>> ---
>>> V2:
>>>
>>> Incorporated Stephen's review comments
>>> - Added example in the document.
>>> ---
>>>   docs/specs/tpm.rst | 20 +++++++++++++++++++-
>>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
>>> index 535912a92b..bf7249b09c 100644
>>> --- a/docs/specs/tpm.rst
>>> +++ b/docs/specs/tpm.rst
>>> @@ -21,11 +21,15 @@ QEMU files related to TPM TIS interface:
>>>    - ``hw/tpm/tpm_tis_common.c``
>>>    - ``hw/tpm/tpm_tis_isa.c``
>>>    - ``hw/tpm/tpm_tis_sysbus.c``
>>> + - ``hw/tpm/tpm_tis_i2c.c``
>>>    - ``hw/tpm/tpm_tis.h``
>>>     Both an ISA device and a sysbus device are available. The former is
>>>   used with pc/q35 machine while the latter can be instantiated in the
>>> -Arm virt machine.
>>> +Arm virt machine. An I2C device support is also added which can be
>>> +instantiated in the arm based emulation machine. An I2C device is also
>>> +supported for the Arm virt machine. This device only supports the
>>> +TPM 2 protocol.
>>>     CRB interface
>>>   -------------
>>> @@ -348,6 +352,20 @@ In case an Arm virt machine is emulated, use 
>>> the following command line:
>>>       -drive if=pflash,format=raw,file=flash0.img,readonly=on \
>>>       -drive if=pflash,format=raw,file=flash1.img
>>>   +In case a Rainier bmc machine is emulated, use the following 
>>> command line:
>>> +
>>> +.. code-block:: console
>>> +
>>> +  qemu-system-arm -M rainier-bmc -nographic \
>>> +    -kernel ${IMAGEPATH}/fitImage-linux.bin \
>>> +    -dtb ${IMAGEPATH}/aspeed-bmc-ibm-rainier.dtb \
>>> +    -initrd ${IMAGEPATH}/obmc-phosphor-initramfs.rootfs.cpio.xz \
>>> +    -drive 
>>> file=${IMAGEPATH}/obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2\
>>> +    -net nic -net 
>>> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443\
>>> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>>> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
>>> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>>
>>
>> The rainier images are not the easiest to find. Could we use an 
>> AST2600 EVB
>> machine instead and instantiate the device from user space ? see commit
>> 3302184f7f or 7a7308eae0.
>>
>> Thanks,
>>
>> C.
>>
>>>   In case SeaBIOS is used as firmware, it should show the TPM menu item
>>>   after entering the menu with 'ESC'.
>>

