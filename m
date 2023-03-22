Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E996C5162
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 17:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf1lm-0005KD-4N; Wed, 22 Mar 2023 12:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pf1lj-0005Jw-0d
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:56:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pf1lf-00048j-1I
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:56:58 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MG4UXc010925; Wed, 22 Mar 2023 16:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bDFq61tUlBHlEDKF2s/hrCv6sZE84uwS6spoinIP7+c=;
 b=BS/Hj20uS3Sw9V6ltv1JAx2cZBEFjvgRKI61v2OHQ6tWzQM31ujVr8G/Nh0O5ryQdEhB
 VLyWvba2hpYajS0+q/QqXWQ8qFqFtoVPQrOaRzQusj6O5k+/aEcnkoBys732yf42EKtT
 t1aUsUvKeKjBYSk1/vsoS+yqhFmRpN9TI7n9VzYdQQDu5SezEoFjFRHZKc5DSGu4imYP
 QXVn+GPZXXmLFLJaj/96yh9MP9UROPSyftJCT1N4sMF//TipUw+BwtoSHs0UP10P9z3C
 hojktNIo6HVjLVpaIQfVO5JHcRZrSq0bTnC7k5eNU/LfEnGiYatcxF47YaZ2M91g1gCo bQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg17e0jy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 16:56:37 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MEfBVT024715;
 Wed, 22 Mar 2023 16:56:36 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x79brt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 16:56:36 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32MGuZRX36176472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Mar 2023 16:56:35 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 167975805F;
 Wed, 22 Mar 2023 16:56:35 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFB325805E;
 Wed, 22 Mar 2023 16:56:34 +0000 (GMT)
Received: from [9.211.118.39] (unknown [9.211.118.39])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 22 Mar 2023 16:56:34 +0000 (GMT)
Message-ID: <ac0ba35a-9122-4af6-7fa5-e2bafe95e805@linux.vnet.ibm.com>
Date: Wed, 22 Mar 2023 11:56:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230321053001.3886666-1-ninad@linux.ibm.com>
 <20230321053001.3886666-3-ninad@linux.ibm.com>
 <1ec4d7f7-7f51-1b40-ee8f-775233e0127f@linux.ibm.com>
 <f3d1ff99-f38e-441a-5e07-3e68f97599c2@linux.vnet.ibm.com>
 <03fda37a-39eb-2166-d883-084759684f0c@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <03fda37a-39eb-2166-d883-084759684f0c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c1qWqLq6hp3Fl-WsqqxBA765HB87KuNp
X-Proofpoint-GUID: c1qWqLq6hp3Fl-WsqqxBA765HB87KuNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_13,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220117
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


On 3/22/23 6:24 AM, Stefan Berger wrote:
>
>
> On 3/22/23 07:18, Ninad Palsule wrote:
>>
>> On 3/21/23 6:54 PM, Stefan Berger wrote:
>
>
>>>> @@ -703,6 +726,7 @@ static void tpm_tis_mmio_write(void *opaque, 
>>>> hwaddr addr,
>>>>           break;
>>>>       case TPM_TIS_REG_DATA_FIFO:
>>>>       case TPM_TIS_REG_DATA_XFIFO ... TPM_TIS_REG_DATA_XFIFO_END:
>>>> +
>>>
>>> you can remove this one
>> Sorry, I am not clear what you are asking me to remove.
>
> You added an empty line here.
>
>    Stefan


Ah,  Fixed it.

Thank you for the review.

Ninad Palsule



