Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEBE6C3EA2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 00:37:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pelW4-0003XB-Kc; Tue, 21 Mar 2023 19:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pelW1-0003Wy-8E
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 19:35:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pelVy-0004KH-MM
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 19:35:40 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32LLRg3D006799; Tue, 21 Mar 2023 23:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=usVZzyn6ymgc9eQ12yMOCKr2ptlbhaHtLUhYmB2AyVE=;
 b=HV4OSfcbDLOL7yavPDfPxeJSUbngxNAHRTWBpXD03QxTVO3VO5BRf4eF6bKw8t+dhTEj
 WizRwNJuvkySTuFOtTfYCaUWdHqg0wukKvDgFmShgdDBN/iZg4EkevMzOs7oOc5x/Jiq
 29P0Hbjn3Swla1t1SqiogWhzHu8iM0pdg7FNmq1ZwnNqCD3upQzPQ+YmNHCT0UMnzby5
 L3tNn7rQ05WYIG0G8KUxjv/14hyfPSWyIPWFJ/c1RzfdfZfwlOT3bUYg5ZhkYb+LGlaV
 xQnW6mRnhzUxgSs0dS0ZgA/c8joCIkW5L/VhCwLyfrlVZ/RSJS8ItnGDY0dqbiurM4Br gw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfmh0jdm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 23:35:22 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32LLiC5i022636;
 Tue, 21 Mar 2023 23:35:21 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7jm7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 23:35:21 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32LNZKDQ13173350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Mar 2023 23:35:20 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23FE15804B;
 Tue, 21 Mar 2023 23:35:20 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D4DA58059;
 Tue, 21 Mar 2023 23:35:19 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 21 Mar 2023 23:35:19 +0000 (GMT)
Message-ID: <e0fda1cd-9a2a-a502-727b-4e8025f1c664@linux.ibm.com>
Date: Tue, 21 Mar 2023 19:35:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230321053001.3886666-1-ninad@linux.ibm.com>
 <20230321053001.3886666-2-ninad@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230321053001.3886666-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: suKiWbzZ2vM2reAnHWcWg88en2gmde-r
X-Proofpoint-ORIG-GUID: suKiWbzZ2vM2reAnHWcWg88en2gmde-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210186
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/21/23 01:29, Ninad Palsule wrote:
> This is a documentation change for I2C TPM device support.
> 
> Qemu already supports devices attached to ISA and sysbus.
> This drop adds support for the I2C bus attached TPM devices.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   docs/specs/tpm.rst | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 535912a92b..79a79f0640 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -21,11 +21,14 @@ QEMU files related to TPM TIS interface:
>    - ``hw/tpm/tpm_tis_common.c``
>    - ``hw/tpm/tpm_tis_isa.c``
>    - ``hw/tpm/tpm_tis_sysbus.c``
> + - ``hw/tpm/tpm_tis_i2c.c``
>    - ``hw/tpm/tpm_tis.h``
>   
>   Both an ISA device and a sysbus device are available. The former is
>   used with pc/q35 machine while the latter can be instantiated in the
> -Arm virt machine.
> +Arm virt machine. An I2C device support is also added which can be
> +instantiated in the arm based emulation machine. I2C model only supports
> +TPM2 protocol.


An I2C device is also supported for the Arm virt machine. This device only supports the TPM 2 protocol.

    Stefan

>   
>   CRB interface
>   -------------

