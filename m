Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F8D6C73CA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 00:01:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfTuG-0003oi-8C; Thu, 23 Mar 2023 18:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfTuC-0003oV-Ii
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 18:59:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfTu6-0003VR-1r
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 18:59:36 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32NLXvUN005064; Thu, 23 Mar 2023 22:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=vTCYjOzoTcbOZXWo+ItgZMdG/TsVklorGIoWqebzU2o=;
 b=RnsmK09L+nweEqKPmMMNWb2+aDV2BTkwVFPeg12tYGJvO0F4MuBgk4yO3Q5opjefsA+f
 WLzvWXTXpJSD/jpt5A/lyonb6DpPNNktwEXsAT9m++fKgtlvBSNCnFaXnbvQ5MteBa0l
 D0u1X4+v1wI1N8vlm25tLMdcZh/H1FqWVRa0m1Op4031cutyePHWB06k7Z5UJaC28V94
 Ar7EWCo68Vt/xJM3K2dburhrEcF15/s+XRttyV2prS8r0DBgC+CP7IZKViVZqGJ47KKN
 cWxOvU14rqQr1llbBLqM4XeHKFo/kBCy6IWyPs1gvVEgzndZZV/wzFce+IwxMCn5SN/A yg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgxt0s7hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 22:35:48 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLbZmG001113;
 Thu, 23 Mar 2023 22:35:47 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3pgxupr7fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 22:35:47 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32NMZk1P11141750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Mar 2023 22:35:46 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 673F858064;
 Thu, 23 Mar 2023 22:35:46 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FDE358065;
 Thu, 23 Mar 2023 22:35:46 +0000 (GMT)
Received: from [9.163.39.211] (unknown [9.163.39.211])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Mar 2023 22:35:46 +0000 (GMT)
Message-ID: <c634c97d-393f-def7-1610-51fc3db2c00e@linux.vnet.ibm.com>
Date: Thu, 23 Mar 2023 17:35:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, stefanb@linux.ibm.com
References: <20230323030119.2113570-1-ninad@linux.ibm.com>
 <e82fa6a5-1e78-d546-a2f8-08dbb3e030c4@kaod.org>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <e82fa6a5-1e78-d546-a2f8-08dbb3e030c4@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4IUS7yggNs0HnB_VV-vuC-ZEHe_TPn8l
X-Proofpoint-ORIG-GUID: 4IUS7yggNs0HnB_VV-vuC-ZEHe_TPn8l
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-23_13,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=976
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303230163
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


On 3/23/23 2:23 AM, Cédric Le Goater wrote:
> Hello Ninad,
>
> On 3/23/23 04:01, Ninad Palsule wrote:
>> This drop adds support for the TPM devices attached to the I2C bus. It
>> only supports the TPM2 protocol. You need to run it with the external
>> TPM emulator like swtpm. I have tested it with swtpm.
>>
>> I have refered to the work done by zhdaniel@meta.com but at the core
>> level out implementation is different.
>> https://github.com/theopolis/qemu/commit/2e2e57cde9e419c36af8071bb85392ad1ed70966 
>>
>>
>> Based-on: $MESSAGE_ID
>> ---
>> V2:
>>   Incorporated Stephan's comments.
>
> Please add a version to the patchsets you send :
>
>   git format-patch -v 2 --cover-letter ....
>
> it is better practice and easier to track in our mailboxes. The automated
> tools patchew, patchwork, also track them.
>
Yes, I noted down. Sorry I missed that last time.


>>
>> Ninad Palsule (3):
>>    docs: Add support for TPM devices over I2C bus
>
> Generally we add the docs after support. No big deal.
Ok, I will remember this next time.
>
>
>>    TPM TIS: Add support for TPM devices over I2C bus
>>    New I2C: Add support for TPM devices over I2C bus
>
> Have you looked at adding tests ? qtest or avocado ?
>
> We discussed offline about it with Stefan and the I2C qos framework in
> qtest is a bit of a challenge for the TPM purpose. See the thread here :
>
> https://lore.kernel.org/qemu-devel/dd43ec84-51e4-11f7-e067-2fb57a567f09@linux.ibm.com/T/#u

Stefan has already created some tests. Thanks Stefan.


Thanks for the review!

Ninad

>
> Thanks,
>
> C.
>
>
>>
>>   docs/specs/tpm.rst      |  20 +-
>>   hw/arm/Kconfig          |   1 +
>>   hw/tpm/Kconfig          |   7 +
>>   hw/tpm/meson.build      |   1 +
>>   hw/tpm/tpm_tis.h        |   3 +
>>   hw/tpm/tpm_tis_common.c |  32 +++
>>   hw/tpm/tpm_tis_i2c.c    | 440 ++++++++++++++++++++++++++++++++++++++++
>>   include/sysemu/tpm.h    |   3 +
>>   8 files changed, 506 insertions(+), 1 deletion(-)
>>   create mode 100644 hw/tpm/tpm_tis_i2c.c
>>
>

