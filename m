Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B4E3B8FC9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 11:29:37 +0200 (CEST)
Received: from localhost ([::1]:42940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyt0q-0005LP-08
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 05:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lyt01-0004gF-L9
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:28:45 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lyszz-0008W1-RG
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:28:45 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16193fqK056360; Thu, 1 Jul 2021 05:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=p6FvAV7MMlvnStmB0XPN9uHPZSTM48UCX67hDe7BvjA=;
 b=NI2+L/n+PjtKjYEJKtMU/lWMcrdcoWxEQYwxhL0jce68xpG5IS2NSoFtu0GB5ymBY98y
 T1mAe8b17cmAiGyJxCliW39TOoQ9/34JBn79y2ERzQh1QmRiRS/rdMvrYNOT2YVNGMUw
 dSL2YP5bYRw7g5mNNTM8LkyLVfiihqIcDStKyTNVxyxaNkYpVgdxKxeHIQdF1ELOx2De
 OEQluoF9+4kHkQ8S1hozwCF6rVHR0HT7euVcMhII6z86RBrazEDP7BxEwfCDmbtmCtPq
 U5wW9hRc3imPsrVxLJp/rf0AhKugqzhZBIbNAS1s744gnMJdg+xf8F5y6Vvydvd50zLs gA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gv01fw2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 05:28:39 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16193o3c057128;
 Thu, 1 Jul 2021 05:28:39 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gv01fw1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 05:28:39 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1619BL0r018080;
 Thu, 1 Jul 2021 09:28:36 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 39h19bga1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1619SYql20709884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 09:28:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E166A405B;
 Thu,  1 Jul 2021 09:28:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2F02A4081;
 Thu,  1 Jul 2021 09:28:31 +0000 (GMT)
Received: from [9.65.220.2] (unknown [9.65.220.2])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Jul 2021 09:28:31 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] hw/i386/pc: pc_system_ovmf_table_find: Assert that
 flash was parsed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210701052749.934744-1-dovmurik@linux.ibm.com>
 <20210701052749.934744-2-dovmurik@linux.ibm.com>
 <cf931732-2bae-4ed1-6c62-784f36647fa1@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <fdee08fe-c0bf-eb4b-a914-cd26daa476df@linux.ibm.com>
Date: Thu, 1 Jul 2021 12:28:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cf931732-2bae-4ed1-6c62-784f36647fa1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E3GRYKeG0T_6FfBoMPV4qFosJRwh8tSr
X-Proofpoint-ORIG-GUID: m3qi61HyjElNFy3KLqwUMm48pKH2E7qw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_06:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010062
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 01/07/2021 11:54, Philippe Mathieu-Daudé wrote:
> On 7/1/21 7:27 AM, Dov Murik wrote:
>> Add assertion in pc_system_ovmf_table_find that verifies that the flash
>> was indeed previously parsed (looking for the OVMF table) by
>> pc_system_parse_ovmf_flash.
>>
>> Now pc_system_ovmf_table_find distinguishes between "no one called
>> pc_system_parse_ovmf_flash" (which will abort due to assertion failure)
>> and "the flash was parsed but no OVMF table was found, or it is invalid"
>> (which will return false).
>>
>> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> 
> For obvious / checkpatch fixes you can keep the tags ;)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Thanks Phil.

-Dov


