Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA1E3B8112
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 13:09:11 +0200 (CEST)
Received: from localhost ([::1]:41214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyY5e-0002dy-Cm
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 07:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lyY4q-0001xg-0H
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:08:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lyY4n-0000hz-H5
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:08:19 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UB4Xg6071576; Wed, 30 Jun 2021 07:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WzCS1Z7mCKMkBOHQZ9CTSMSKIXF4tEfWIdaKBBnaSSs=;
 b=p4WdIO16lHPOgTM43auYwk7gUNzWXqjflynRr69yWuvsFacO4oLQdzstT6Ak7puA3ISq
 ptlTwCLcHGoFvwU9t+POjwfhRUiSIsJkgiodY8U+BU2QzDMXqHaE86BslNWrbWrw/kmb
 keR2vCORfGIxqObqgGD4+vFzx/NVgQsFoOO/HywXt5PIRDuDej4MWk9RBvy3dO1r1aFE
 OuWslMpBhW5nimwq1zLGYDDLR/yExDreje4ovfuziQYwTaD8kLHqhTDpitXsDr48joCu
 xDnqgyRBYNzQOg8P6m46CPV65VuIDRAJsBapmGvyFqRn8kCHDjTQH73qfxEbl4jJfAh5 Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gm9anjxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 07:08:10 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UB65NW086060;
 Wed, 30 Jun 2021 07:08:10 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gm9anjww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 07:08:10 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UB87sp012688;
 Wed, 30 Jun 2021 11:08:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 39fv59rb84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 11:08:07 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UB857533292736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 11:08:05 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13353A406B;
 Wed, 30 Jun 2021 11:08:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EC41A405E;
 Wed, 30 Jun 2021 11:08:02 +0000 (GMT)
Received: from [9.65.220.2] (unknown [9.65.220.2])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 11:08:02 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] hw/i386/pc: pc_system_ovmf_table_find: Assert that
 flash was parsed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210630054625.3424178-1-dovmurik@linux.ibm.com>
 <20210630054625.3424178-2-dovmurik@linux.ibm.com>
 <68909288-cb5b-559e-7c85-fb6094d07ad8@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <77d0d6cc-4e73-a0af-6cf1-411e160d74dc@linux.ibm.com>
Date: Wed, 30 Jun 2021 14:08:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <68909288-cb5b-559e-7c85-fb6094d07ad8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i1KyX94dZEkDijsrBnnTYfqsDIQx9J5U
X-Proofpoint-ORIG-GUID: Tfv533npld-51Fecvsn8_Lu03mxSi4TD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_05:2021-06-29,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300069
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



On 30/06/2021 11:23, Philippe Mathieu-Daudé wrote:
> On 6/30/21 7:46 AM, Dov Murik wrote:
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
>> ---
>>  hw/i386/pc_sysfw.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks Phil for the constructive review process.

-Dov

