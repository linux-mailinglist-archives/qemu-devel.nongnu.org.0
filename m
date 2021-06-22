Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439353B056C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:03:03 +0200 (CEST)
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvg3S-00029e-2W
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvfyz-0003ZG-LZ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:58:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvfyx-0003Bs-6U
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:58:25 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MCjDhn087176; Tue, 22 Jun 2021 08:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VR4pVmVMzEhcS8wIQuWVHmVSbqosbkWlS+fPWBivSrI=;
 b=K4sXE5AXTgvsPPYf6Jk5NMO/4SS7wh0T4z62YOAoZrrMCKH8fsPJINL+xgBXdZXZoUP/
 Rsibe7VRz0Zui4IBcxvO8PjtH2pn+A0MVt1LMfT6ZSRhoDaz59yw3OaB8Z1blefxImcN
 sxfjPetmYZJ+gzJ/MQ8oT+647yGHqO3Dug1aNwXcP8OnGCX1S+kJSrKzSDHyAYUyj6GZ
 wyT++4poCR45sVqXvmDjbSGsQxaoAfQnUzXyi0RvvkV+q/in7Urzze3lE25bSMT4jR1M
 sKGqDQJdWqW+Q35nLJO6q5c5DDNx4wyhFcyorUYvn1N8zV+2TN+RJLCJYjwEmaxIx9CE dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bcvhp6t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 08:58:20 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15MCjK5e087360;
 Tue, 22 Jun 2021 08:58:20 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bcvhp6sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 08:58:20 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15MCvrOn027338;
 Tue, 22 Jun 2021 12:58:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3998789ff2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 12:58:18 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15MCut4p34865582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 12:56:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6ED311C05C;
 Tue, 22 Jun 2021 12:58:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54F3011C054;
 Tue, 22 Jun 2021 12:58:13 +0000 (GMT)
Received: from [9.160.112.114] (unknown [9.160.112.114])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Jun 2021 12:58:13 +0000 (GMT)
Subject: Re: [PATCH] hw/i386/pc: Document pc_system_ovmf_table_find
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210622124419.3008278-1-dovmurik@linux.ibm.com>
 <838caecc-6d4a-6257-147e-fbef4148f679@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <d5fbda1c-69dc-35b6-388e-443a697c2fdf@linux.ibm.com>
Date: Tue, 22 Jun 2021 15:58:11 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <838caecc-6d4a-6257-147e-fbef4148f679@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uU7UkELNCws6P4NzRhu_uOLO00LlJInb
X-Proofpoint-ORIG-GUID: RAiq4aQDYif2Az_CsGQ_Gp1trQevXAzF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_06:2021-06-21,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220079
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+cc: Tom Lendacky

On 22/06/2021 15:47, Philippe Mathieu-Daudé wrote:
> On 6/22/21 2:44 PM, Dov Murik wrote:
>> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> ---
>>  hw/i386/pc_sysfw.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
>> index 6ce37a2b05..e8d20cb83f 100644
>> --- a/hw/i386/pc_sysfw.c
>> +++ b/hw/i386/pc_sysfw.c
>> @@ -176,6 +176,20 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>>      ovmf_table += tot_len;
>>  }
>>  
>> +/**
>> + * pc_system_ovmf_table_find - Find the data associated with an entry in OVMF's
>> + * reset vector GUIDed table.
>> + *
>> + * @entry: GUID string of the entry to lookup
>> + * @data: Filled with a pointer to the entry's value (if not NULL)
>> + * @data_len: Filled with the length of the entry's value (if not NULL). Pass
>> + *            NULL here if the length of data is known.
>> + *
>> + * Note that this function must be called after the OVMF table was found and
>> + * copied by pc_system_parse_ovmf_flash().
> 
> What about replacing this comment by:
> 
>   assert(ovmf_table && ovmf_table_len);
> 

I think this will break things: in target/i386/sev.c we have SEV-ES code
that calls pc_system_ovmf_table_find() and can deal with the case when
there's no OVMF table.  An assert will break it.


> Otherwise,
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Thanks!

-Dov



> Thanks!
> 
>> + *
>> + * Return: true if the entry was found in the OVMF table; false otherwise.
>> + */
>>  bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
>>                                 int *data_len)
>>  {
>>
> 

