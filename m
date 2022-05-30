Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA125386CF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:35:26 +0200 (CEST)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjIc-0006uk-04
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nviSD-0003jD-At
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:41:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nviS8-0004q8-KI
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:41:16 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24UGYLXv029706
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 16:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ZutYvqBDu/IwrDs8OszryKIP0E2h9DmnMGZzP8aJQRA=;
 b=FEUoY0tyUJVOU8f6OU1xmlArtY5YC9nQ2eaXh+u33PRm0yKz1VyXfmuaSkB4JSAIOKKY
 1IjVcIl+TSx8QiQ6Noo692Hoj1tUH6ewsxeg/3lV8Flpr5vNmBio7zz2usLoYJ607E/x
 dZqfvH/MBoZ1AW8+vyPnbpRYmEk68VggU8tI6RTxE2K6t6H1VMYExyHqRFUOIZiH5LqB
 7JyzyvzGr6q/bhliyCxjmthu7a9s08o0EoADzCmBzLzdK5ig253/A7Ar8PforUIfCfHc
 h/7Q7tuK0FXIwbm8Bd6TwTDzzxS7dOrKSU+CJpDyoBVgQEl+uR1B9zhM3Uee5BP2WK6L qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gd1jh832f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 16:41:08 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24UGZUoA032562
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 16:41:08 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gd1jh8328-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 May 2022 16:41:08 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24UGcDN1014666;
 Mon, 30 May 2022 16:41:07 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 3gbcbhpk5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 May 2022 16:41:07 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24UGf7uo22741284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 May 2022 16:41:07 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 103CD6A051;
 Mon, 30 May 2022 16:41:07 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D669C6A04F;
 Mon, 30 May 2022 16:41:06 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 30 May 2022 16:41:06 +0000 (GMT)
Message-ID: <80ac2b2b-36f8-7146-fb87-9448a72878a0@linux.ibm.com>
Date: Mon, 30 May 2022 12:41:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] backend/tpm: Resolve issue with TPM 2 DA lockout
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <20220527173058.226210-1-stefanb@linux.ibm.com>
 <CAMxuvax1PkLZb+Ms6n1wCyd8hHFsPQwi3xaM+RM0c1x7imQAzA@mail.gmail.com>
 <7b6d1edf-882f-a369-67c9-5ed5f1d7ce51@linux.ibm.com>
 <1eef83c7-9fb9-1060-a993-5b7d3ac47ffe@linux.ibm.com>
 <CAMxuvazTLvO2evMmxGP+S+RN7VinM97mo81U8MVF0mSmYqLHSQ@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CAMxuvazTLvO2evMmxGP+S+RN7VinM97mo81U8MVF0mSmYqLHSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PG4SI3dlkXjEFp6FdXrpHJqWWAxykVC5
X-Proofpoint-GUID: cTIbtJuDUiQOIxHGYZ5EemkpbBOKvccn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-30_07,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205300087
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/30/22 03:49, Marc-André Lureau wrote:
> Hi
> 
> On Sat, May 28, 2022 at 7:23 PM Stefan Berger <stefanb@linux.ibm.com> wrote:
>>
>>
>>
>> On 5/27/22 15:31, Stefan Berger wrote:
>>>
>>>
>>> On 5/27/22 15:24, Marc-André Lureau wrote:
>>>> Hi
>>>>
>>>> On Fri, May 27, 2022 at 7:36 PM Stefan Berger <stefanb@linux.ibm.com>
>>>> wrote:
>>>>>
>>>>> This series of patches resolves an issue with a TPM 2's dictionary
>>>>> attack
>>>>> lockout logic being triggered upon well-timed VM resets. Normally,
>>>>> the OS
>>>>> TPM driver sends a TPM2_Shutdown to the TPM 2 upon reboot and before
>>>>> a VM
>>>>> is reset. However, the OS driver cannot do this when the user resets
>>>>> a VM.
>>>>> In this case QEMU must send the command because otherwise several well-
>>>>> timed VM resets will trigger the TPM 2's dictionary attack (DA) logic
>>>>> and
>>>>> it will then refuse to do certain key-related operations until the DA
>>>>> logic has timed out.
>>>>
>>>> How does real hardware deal with that situation? Shouldn't this
>>>> "shutdown"/reset logic be implemented on swtpm side instead, when
>>>> CMD_INIT is received? (when the VM is restarted)
>>> I don't know what real hardware can actually do when the machine is
>>> reset, presumably via some reset line, or the power is removed. Probably
>>> it has no way to react to this.
>>>
>>> Typically the OS driver has to send the command and since it cannot do
>>> this I would defer it to the TPM emulator reset handler code, so the
>>> next layer down.
>>
>> Also, when this is done in QEMU we don't need to do a data channel
>> operation (run TPM2_Shutdown) from within the control channel (upon
>> CMD_INIT) inside of swtpm. This way we can deal with it properly. The
>> usage model for the TPM 2 prescribes that a TPM2_Shutdown must be sent
>> before a shutdown or reset of the system, so let's let QEMU do it if the
>> OS cannot do it.
> 
> What if qemu is killed or crashed, and a new instance is connected to
> swtpm? Or more subtle, the VM reboots without qemu help (no reset
> handler). It feels like it would be more robust to handle the
> situation in swtpm. Why not have the same last operation tracking and
> shutdown logic there? If CMD_INIT is received and the last operation
> is not shutdown, I'd have a warning and do it (if this is compliant
> with the spec, I am trying to find relevant text).

Something to test with:
https://github.com/stefanberger/swtpm/pull/701
> 
> 
>>
>>>
>>>
>>>
>>>>
>>>>>
>>>>> Regards,
>>>>>     Stefan
>>>>>
>>>>> Stefan Berger (2):
>>>>>     backends/tpm: Record the last command sent to the TPM
>>>>>     backends/tpm: Send TPM2_Shutdown upon VM reset
>>>>>
>>>>>    backends/tpm/tpm_emulator.c | 44 +++++++++++++++++++++++++++++++++++++
>>>>>    backends/tpm/tpm_int.h      |  3 +++
>>>>>    backends/tpm/tpm_util.c     |  9 ++++++++
>>>>>    backends/tpm/trace-events   |  1 +
>>>>>    include/sysemu/tpm_util.h   |  3 +++
>>>>>    5 files changed, 60 insertions(+)
>>>>>
>>>>> --
>>>>> 2.35.3
>>>>>
>>>>
>>
> 

