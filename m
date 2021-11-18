Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42E2455B7D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 13:24:00 +0100 (CET)
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mngSN-0005h7-GY
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 07:23:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mngPr-0004uO-TQ
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:21:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26774
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mngPp-0006uv-8I
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:21:23 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIBIu6O011251; 
 Thu, 18 Nov 2021 12:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=adLCZ/FAXRVsxg4gsFThXwAeuI75RC0s8Tw+Ze5gLBU=;
 b=ot+solFwuVcUR/IBHrqERJDmCPvNzIMgIm4ZxDCVnweiaaBFB8Nh4Yo0w2PMELmk3nMS
 EXiqMY3dILyHPfPJuVb0RqD1owLoMXeymrqlSbk6mJM31zw4EkCBfe8KRF27b14Fn82f
 IJD4vele8iA7COPI30sHr2LBkWXTULT60CRiYTbJPlUp28u6pRByG5ws74Eoq5M8cXtY
 qQcS9Y/go8RpfnUCTOmxFeZD/dYK6OTXDIIrFuSJ8hYFPRpmx0ISXQjUsTno4h5HfX41
 FFqg1wZ4iURBCK4vuVfcKC+9SBW3Lu2f9Epjen+1ZI+v4T92QAWM8015a71fyGxHKGkV BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cdnub1an1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 12:21:16 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AICCR0X011548;
 Thu, 18 Nov 2021 12:21:16 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cdnub1amp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 12:21:16 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AICHpqw019061;
 Thu, 18 Nov 2021 12:21:15 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 3cd81dqhm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 12:21:15 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AICLDvQ23396736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 12:21:13 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B48D4136051;
 Thu, 18 Nov 2021 12:21:13 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EB7813605D;
 Thu, 18 Nov 2021 12:21:09 +0000 (GMT)
Received: from [9.160.188.78] (unknown [9.160.188.78])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 18 Nov 2021 12:21:09 +0000 (GMT)
Message-ID: <81ab2e5c-630f-24e5-d04a-c2fb89e952ae@linux.ibm.com>
Date: Thu, 18 Nov 2021 14:21:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 0/6] SEV: add kernel-hashes=on for measured -kernel
 launch
Content-Language: en-US
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211111100048.3299424-1-dovmurik@linux.ibm.com>
 <ea55111b-85d9-c05a-7808-fcdcbe1e8bcc@linux.ibm.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <ea55111b-85d9-c05a-7808-fcdcbe1e8bcc@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cn5n1_H9GHPJnpivVYTgHZB0U0zJmfKk
X-Proofpoint-ORIG-GUID: 6UU-gm8FGTBvquQnBYtq_D4Z2aCm5UTy
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_05,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180071
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.084,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pinging again -- Daniel said this should be added to 6.2.

Is there anything I should do?

Thanks,
-Dov

On 14/11/2021 20:02, Dov Murik wrote:
> Paolo,
> 
> Can you please add this series (already reviewed) to the fixes in 6.2?
> 
> Thanks,
> -Dov
> 
> 
> On 11/11/2021 12:00, Dov Murik wrote:
>> Tom Lendacky and Brijesh Singh reported two issues with launching SEV
>> guests with the -kernel QEMU option when an old [1] or wrongly configured [2]
>> OVMF images are used.
>>
>> To fix these issues, these series "hides" the whole kernel hashes
>> additions behind a kernel-hashes=on option (with default value of
>> "off").  This allows existing scenarios to work without change, and
>> explicitly forces kernel hashes additions for guests that require that.
>>
>> Patch 1 introduces a new boolean option "kernel-hashes" on the sev-guest
>> object, and patch 2 causes QEMU to add kernel hashes only if its
>> explicitly set to "on".  This will mitigate both experienced issues
>> because the default of the new setting is off, and therefore is backward
>> compatible with older OVMF images (which don't have a designated hashes
>> table area) or with guests that don't wish to measure the kernel/initrd.
>>
>> Patch 3 fixes the wording on the error message displayed when no hashes
>> table is found in the guest firmware.
>>
>> Patch 4 detects incorrect address and length of the guest firmware
>> hashes table area and fails the boot.
>>
>> Patch 5 is a refactoring of parts of the same function
>> sev_add_kernel_loader_hashes() to calculate all padding sizes at
>> compile-time.  Patch 6 also changes the same function and replaces the
>> call to qemu_map_ram_ptr() with address_space_map() to allow for error
>> detection.  Patches 5-6 are not required to fix the issues above, but
>> are suggested as an improvement (no functional change intended).
>>
>> To enable addition of kernel/initrd/cmdline hashes into the SEV guest at
>> launch time, specify:
>>
>>     qemu-system-x86_64 ... -object sev-guest,...,kernel-hashes=on
>>
>>
>> [1] https://lore.kernel.org/qemu-devel/3b9d10d9-5d9c-da52-f18c-cd93c1931706@amd.com/
>> [2] https://lore.kernel.org/qemu-devel/001dd81a-282d-c307-a657-e228480d4af3@amd.com/
>>
>>
>> Changes in v3:
>>  - Patch 1/6: Add "(since 6.2)" in the documentation of the
>>    kernel-hashes option (thanks Markus)
>>  - Patch 3/6: Change error string use "kernel" instead of "-kernel"
>>    (thanks Daniel)
>>
>> v2: https://lore.kernel.org/qemu-devel/20211108134840.2757206-1-dovmurik@linux.ibm.com/
>> Changes in v2:
>>  - Instead of trying to figure out whether to add hashes or not,
>>    explicity declare an option (kernel-hashes=on) for that.  When that
>>    option is turned on, fail if the hashes cannot be added.
>>  - Rephrase error message when no hashes table GUID is found.
>>  - Replace qemu_map_ram_ptr with address_space_map
>>
>> v1: https://lore.kernel.org/qemu-devel/20211101102136.1706421-1-dovmurik@linux.ibm.com/
>>
>>
>> Dov Murik (6):
>>   qapi/qom,target/i386: sev-guest: Introduce kernel-hashes=on|off option
>>   target/i386/sev: Add kernel hashes only if sev-guest.kernel-hashes=on
>>   target/i386/sev: Rephrase error message when no hashes table in guest
>>     firmware
>>   target/i386/sev: Fail when invalid hashes table area detected
>>   target/i386/sev: Perform padding calculations at compile-time
>>   target/i386/sev: Replace qemu_map_ram_ptr with address_space_map
>>
>>  qapi/qom.json     |  7 ++++-
>>  target/i386/sev.c | 77 +++++++++++++++++++++++++++++++++++++++--------
>>  qemu-options.hx   |  6 +++-
>>  3 files changed, 75 insertions(+), 15 deletions(-)
>>
>>
>> base-commit: af531756d25541a1b3b3d9a14e72e7fedd941a2e
>>

