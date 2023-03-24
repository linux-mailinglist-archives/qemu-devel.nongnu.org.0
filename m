Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602A06C81C4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfhOE-0000Fv-4n; Fri, 24 Mar 2023 09:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfhO8-0000FS-Mo
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 09:23:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfhNy-0000ZZ-8x
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 09:23:23 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32OBowhp022244; Fri, 24 Mar 2023 12:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LI5lxmwGzwwjJxNb59VnnPT6oisjx4cM8YSKHbyEe3k=;
 b=QEB5sIDp6xdLSLwI0isAdukbpky7RY/VSg2n93UlyzKs/4REHGYZeVPW77iBrcpkM+Lf
 5w9c/HFZVSXUgGtv7Hh9IXGsrHHeENnGxxhpPvCLhmu1rvKdslssBulf8cbOCCqwVIST
 OzcwluNr4oRN7LDgnrtXCcWyx8jfPHvCXydXVVN2g+4DCTavMrmVk6Xt8eqyMLEM5QgG
 VQP+2Y7SzSIgR3X5Y1yuoGMBh6pJm1igj7Qi7Sqv2YAz7D5XhWfFPjL5QBP90p0UM9Al
 hf9XGbSVa9RoF2g+zGk8Rs64tuyoSgWfX9JmyKXwpuyGbXaAxULliwHpKhdmv3ZNnxb9 og== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3phbbr9cgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 12:50:05 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32OCnR5Z025460;
 Fri, 24 Mar 2023 12:50:05 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3pgybnmdyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 12:50:05 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32OCo2pJ38404628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 12:50:02 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD6905805B;
 Fri, 24 Mar 2023 12:50:02 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64C8058063;
 Fri, 24 Mar 2023 12:50:02 +0000 (GMT)
Received: from [9.163.28.178] (unknown [9.163.28.178])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 24 Mar 2023 12:50:02 +0000 (GMT)
Message-ID: <a98f7b1f-dd0d-d20c-a3e7-8dca6882a653@linux.vnet.ibm.com>
Date: Fri, 24 Mar 2023 07:50:01 -0500
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
 <efde764d-d675-07e7-ba60-f4406d083ceb@linux.vnet.ibm.com>
 <026d8d44-c698-189e-155d-ac9c23c4361b@linux.vnet.ibm.com>
 <be542d13-ed97-39f6-7386-b83941563216@kaod.org>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <be542d13-ed97-39f6-7386-b83941563216@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rbSzoMPcY4ibIWKy30W7j9Wruc6MUHIA
X-Proofpoint-GUID: rbSzoMPcY4ibIWKy30W7j9Wruc6MUHIA
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_07,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240102
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


On 3/24/23 3:01 AM, Cédric Le Goater wrote:
> On 3/24/23 06:11, Ninad Palsule wrote:
>> Hello Cedric,
>>
>> Joel helped me to configure the device and we are able to configure 
>> tpm device on ast2600-evb.
>>
>> I will include this example in the documentation.
>>
>> # uname -a
>> Linux ast2600-evb 6.1.15 #1 SMP Thu Mar 23 20:48:29 CDT 2023 armv7l 
>> GNU/Linux
>> # cat /etc/os-release
>> NAME=Buildroot
>> VERSION=2023.02-dirty
>> ID=buildroot
>> VERSION_ID=2023.02
>> PRETTY_NAME="Buildroot 2023.02"
>>
>> # echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
>> [   59.681684] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)
>> [   59.703190] tpm tpm0: A TPM error (256) occurred attempting the 
>> self test
>> [   59.705215] tpm tpm0: starting up the TPM manually
>> [   59.892917] i2c i2c-12: new_device: Instantiated device 
>> tpm_tis_i2c at 0x2e
>> # cd /sys/class/tpm/tpm0
>> # ls
>> dev                pcr-sha256         power              uevent
>> device             pcr-sha384         subsystem
>> pcr-sha1           pcr-sha512         tpm_version_major
>
>
> Nice. Did you need any special support in the kernel ?
>
> I could update this image for avocado tests :
>
> https://github.com/legoater/qemu-aspeed-boot/tree/master/images/ast2600-evb/buildroot-2023.02

Kernel need a TPM i2c driver support. I built it with following head on 
dev-6.1 branch. You also need to run "echo" command I mentioned above to 
instantiate the device. Also start the swtpm as provided in my earlier mail.

$ git rev-parse HEAD
0e94476a8892056a9242bcd75e59e7d2b92ac435

Thanks,

Ninad


>
> Thanks,
>
> C.

