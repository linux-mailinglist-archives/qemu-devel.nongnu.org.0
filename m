Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1451F9E2E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 19:12:42 +0200 (CEST)
Received: from localhost ([::1]:37476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jksf3-0000oo-Ot
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 13:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jksds-0008QC-KL
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 13:11:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48146
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jksdq-0007TY-Rr
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 13:11:28 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FGWN7l030547
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 13:11:25 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31pckfh3vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 13:11:25 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05FGmbuK078686
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 13:11:25 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31pckfh3vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 13:11:25 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FH4SPw007640;
 Mon, 15 Jun 2020 17:11:24 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 31pckfgdnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 17:11:24 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05FHBNoV46793020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 17:11:23 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98A25124060;
 Mon, 15 Jun 2020 17:11:23 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32E0B124054;
 Mon, 15 Jun 2020 17:11:23 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 17:11:23 +0000 (GMT)
Subject: Re: [PATCH v2 4/5] acpi: Enable TPM IRQ
To: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Eric Auger <eric.auger@redhat.com>
References: <20200615142327.671546-1-stefanb@linux.vnet.ibm.com>
 <20200615142327.671546-5-stefanb@linux.vnet.ibm.com>
 <CAMxuvaxm+5Nuv2_1UTXY+-kK1CYMkxqU2pfLOxMgeDEqOjhgZA@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <8e11e2d6-5e02-89c0-759f-d74189421eec@linux.ibm.com>
Date: Mon, 15 Jun 2020 13:11:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMxuvaxm+5Nuv2_1UTXY+-kK1CYMkxqU2pfLOxMgeDEqOjhgZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_03:2020-06-15,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 cotscore=-2147483648 malwarescore=0 suspectscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150111
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 08:37:04
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Bonzini, Paolo" <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/20 11:13 AM, Marc-André Lureau wrote:
>
>> diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
>> index 1a2a57a21f..063a9eb42a 100644
>> --- a/include/hw/acpi/tpm.h
>> +++ b/include/hw/acpi/tpm.h
>> @@ -24,7 +24,7 @@
>>   #define TPM_TIS_ADDR_BASE           0xFED40000
>>   #define TPM_TIS_ADDR_SIZE           0x5000
>>
>> -#define TPM_TIS_IRQ                 5
>> +#define TPM_TIS_IRQ                 13


Eric,

  does this change have any negative side effects on ARM? If you prefer, 
we can split this part here up into TPM_TIS_ISA_IRQ and TPM_TIS_SYSBUS 
IRQ and leave the latter at '5' because we know that this is working.

    Stefan


>>
>>   #define TPM_TIS_NUM_LOCALITIES      5     /* per spec */
>>   #define TPM_TIS_LOCALITY_SHIFT      12
>> --
>> 2.24.1
>>


