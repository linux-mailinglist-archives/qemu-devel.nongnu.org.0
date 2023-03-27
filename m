Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F7B6CA8FC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 17:30:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgom3-0007J6-Fh; Mon, 27 Mar 2023 11:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgom1-0007Ix-Fl
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:28:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgoly-0007Lj-Ot
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:28:41 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RE4rvv011713; Mon, 27 Mar 2023 15:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WnzdogxqFesl47gc6hChNn2WpxE7VwG/lUL7ge+3fR0=;
 b=hj21DvTdu62B7uPuMkETZIYuo/JrUxbs22kseMcZj2jfmYq7JcmEpgrQqTDUyRvOY4ML
 KYUUeCinWKZuv0d49z7UcSvUJhDBnCvXEElGlwFDWNZWVXw0BigXgkhzqTPc36ZtxDe2
 XY25OmvGKnYVFyU4qGxnQvaanLsWIqJdng7gQs9ELirSMt+qNnBx/TsxjGiVrxH+c6nm
 pdeexO0OxB0aHqBRFK6P5RhvbGdBrt4aXj21ltV2LuHKAXqED4M9GEt4W6M8q3o0rwbj
 8+M9V/lHLcars+203EJOvomN4BYVo/sXj2q7gEsWzcSd+tswauCjfUdxmfsPVtuMyUgH aw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjatrn1vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 15:28:24 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RCu8D1028584;
 Mon, 27 Mar 2023 15:28:23 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3phrk7esnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 15:28:23 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RFSLBw10093286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 15:28:21 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE44F5805D;
 Mon, 27 Mar 2023 15:28:21 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A12A58043;
 Mon, 27 Mar 2023 15:28:21 +0000 (GMT)
Received: from [9.211.158.228] (unknown [9.211.158.228])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 15:28:21 +0000 (GMT)
Message-ID: <30895b98-fa50-65c3-d750-9ed960446073@linux.vnet.ibm.com>
Date: Mon, 27 Mar 2023 10:28:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/3] docs: Add support for TPM devices over I2C bus
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Ninad Palsule <ninad@linux.ibm.com>
Cc: qemu-devel@nongnu.org, andrew@aj.id.au, stefanb@linux.ibm.com
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <20230326224426.3918167-2-ninad@linux.ibm.com>
 <CACPK8XfLBT-6eu4cv=CbS2d368N-wcVuvSy+w4Kt-JavPqrhyA@mail.gmail.com>
 <24c4b174-21d2-32ce-c944-8f76eec0281c@kaod.org>
 <b30609d2-2b4b-2c51-d957-936127032ffa@linux.vnet.ibm.com>
 <9d72b22b-9d53-8825-e7e1-fdcd9fa2d53d@kaod.org>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <9d72b22b-9d53-8825-e7e1-fdcd9fa2d53d@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zdjk2qhXiNtiYu83NXf0Rt8gHsPTPnNW
X-Proofpoint-GUID: zdjk2qhXiNtiYu83NXf0Rt8gHsPTPnNW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270119
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
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


On 3/27/23 10:10 AM, Cédric Le Goater wrote:
>>>>> +In case a ast2600-evb bmc machine is emulated and want to use TPM 
>>>>> device
>>>>> +attached to I2C bus, use the following command line:
>>>>> +
>>>>> +.. code-block:: console
>>>>> +
>>>>> +  qemu-system-arm -M ast2600-evb -nographic \
>>>>> +    -kernel arch/arm/boot/zImage \
>>>>> +    -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
>>>>> +    -initrd rootfs.cpio \
>>>>> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>>>>> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
>>>>> +    -device 
>>>>> tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>>>>
>>>> For testing, use this command to load the driver to the correct 
>>>> address:
>>>>
>>>> echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
>>>>
>>>> (I don't know how specific we want to make the instructions, but
>>>> adding a line like above would help others from having to re-discover
>>>> the command).
>>>
>>> or/and add an avocado test for it. See tests/avocado/machine_aspeed.py.
>>>
>>> The avocado framework is a bit fragile when reading from the console 
>>> but
>>> we hope to fix that.
>>
>> I never used it before so it will take little longer.
>>
>> Is it required to merge this i2c work?
>
> It isn't.


Ok, Thanks. I will continue to check the test frame work and add the 
test in a separate drop.

Ninad

>
> C.
>
>
>

