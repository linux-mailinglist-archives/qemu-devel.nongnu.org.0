Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33506C9202
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 03:14:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgExR-0002Ue-72; Sat, 25 Mar 2023 21:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgExD-0002Tw-Uq
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 21:13:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgExC-0003FE-7z
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 21:13:51 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32PNfHBe013842; Sun, 26 Mar 2023 01:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IOr4Wt6rgjgK3mljhPc8pINoxT1ql7wAocSgGL7g2KQ=;
 b=XcTxse0fEaDUOJC6VXKyd6StMsWoKO02NfsMZWP3uuX3HALn0ZqWAPuNDzyIAdtJJury
 V8vYYPkkxvTgb95BxZOgRdJ2bG7qLHCOyTdgWPJqEFdK1g51ROwF0/lg72jkqyyFaQA3
 sUe/X0Rb5dycSS8yCxAhPzNZqEWFoVw0qXvEMGSluGwZBejDYRKLyshJpEmTyfz0nWdA
 A2bG8Rr27LdVTSXbdA3566xKQWydBecZVC4O/ZjevnKiyyvIs0ze3h7b+ZzjqeIrG6mf
 ox2Wnpse1sYT/uAgrAyzhqHKIv545Sl2JnqSwGRFyLKc9lgdCrKUAZ3QBmIlqHrdRQFJ zg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjaumh506-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Mar 2023 01:13:34 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32Q11DRm024370;
 Sun, 26 Mar 2023 01:13:33 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3phrk6wc4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Mar 2023 01:13:33 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32Q1DVCK45875478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Mar 2023 01:13:31 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3D1558056;
 Sun, 26 Mar 2023 01:13:31 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6648758045;
 Sun, 26 Mar 2023 01:13:31 +0000 (GMT)
Received: from [9.163.70.110] (unknown [9.163.70.110])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 26 Mar 2023 01:13:31 +0000 (GMT)
Message-ID: <bb402f18-23be-a77e-d8b0-9651d488141b@linux.vnet.ibm.com>
Date: Sat, 25 Mar 2023 20:13:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/3] docs: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230325043751.3559591-1-ninad@linux.ibm.com>
 <20230325043751.3559591-2-ninad@linux.ibm.com>
 <5aafd432-acae-ad58-b567-16911a04bc7d@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <5aafd432-acae-ad58-b567-16911a04bc7d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: A3gFaWQgjYNrotlNx8ex5FlW-FKncTdK
X-Proofpoint-GUID: A3gFaWQgjYNrotlNx8ex5FlW-FKncTdK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303260006
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


On 3/25/23 11:10 AM, Stefan Berger wrote:
>
>
> On 3/25/23 00:37, Ninad Palsule wrote:
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
>> ---
>>   docs/specs/tpm.rst | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
>> index 535912a92b..a0600e2834 100644
>> --- a/docs/specs/tpm.rst
>> +++ b/docs/specs/tpm.rst
>> @@ -21,12 +21,16 @@ QEMU files related to TPM TIS interface:
>>    - ``hw/tpm/tpm_tis_common.c``
>>    - ``hw/tpm/tpm_tis_isa.c``
>>    - ``hw/tpm/tpm_tis_sysbus.c``
>> + - ``hw/tpm/tpm_tis_i2c.c``
>>    - ``hw/tpm/tpm_tis.h``
>>     Both an ISA device and a sysbus device are available. The former is
>>   used with pc/q35 machine while the latter can be instantiated in the
>>   Arm virt machine.
>>   +An I2C device support is also added which can be instantiated in 
>> the armadded -> provided
> arm -> Arm
Done
>
>> +based emulation machines. This device only supports the TPM 2 protocol.
>> +
>>   CRB interface
>>   -------------
>>   @@ -348,6 +352,34 @@ In case an Arm virt machine is emulated, use 
>> the following command line:
>>       -drive if=pflash,format=raw,file=flash0.img,readonly=on \
>>       -drive if=pflash,format=raw,file=flash1.img
>>   +In case a ast2600-evb bmc machine is emulated and want to use TPM 
>> device
>> +attached to I2C bus, use the following command line:
>> +
>> +.. code-block:: console
>> +
>> +  qemu-system-arm -M ast2600-evb -nographic \
>> +    -kernel arch/arm/boot/zImage \
>> +    -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
>> +    -initrd rootfs.cpio \
>> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
>> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>> +
>> +In case a Rainier bmc machine is emulated and want to use TPM device
>> +attached to I2C bus, use the following command line:
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
>> +
>>   In case SeaBIOS is used as firmware, it should show the TPM menu item
>>   after entering the menu with 'ESC'.
>
> With the above nits:
>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

