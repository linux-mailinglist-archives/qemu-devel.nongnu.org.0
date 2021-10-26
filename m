Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362FB43B2FC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 15:11:08 +0200 (CEST)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfMEM-0002bv-TN
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 09:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mfMBs-0000dx-I6; Tue, 26 Oct 2021 09:08:34 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:43869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mfMBq-0008Tn-KG; Tue, 26 Oct 2021 09:08:32 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDPuq-1mUs3R2DCQ-00ATBR; Tue, 26 Oct 2021 15:08:11 +0200
Message-ID: <16c8e1d8-aefc-5a45-4f02-5ead4f67d4a7@vivier.eu>
Date: Tue, 26 Oct 2021 15:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hw/core/machine: Add the missing delimiter in
 cpu_slot_to_string()
Content-Language: fr
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org
References: <20211008075040.18028-1-wangyanan55@huawei.com>
 <57481b57-13cf-ee9d-b9ef-205b9e3de610@vivier.eu>
 <e28ce319-9fba-0e2c-9e62-5783612e14db@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <e28ce319-9fba-0e2c-9e62-5783612e14db@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JBoj/FAbKC1sFpxOSfWTx03ZF1i5TI1NX4Xe0oYq5NJLyGctHni
 NPPeQ3HeJAQDp9xRGKDI1niiTOtJ7bkIpSpDLOFfcoA6iErCSCL1zWmKuQHtaa3nCMzkD6I
 8s2mEfai/HbTQDBY0YV1HcD2a32PFSejQQLbxICfTgJobUEim53rZht6PuKKXni44CLsCGk
 Sa92vBRCIeK9qnzYlrYzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qL/GOYC6Qh4=:RMji2AYMXfQnmFkXZXECJy
 VoRPDemtxy/h/jULqkMZs+1zIy/HKxvjpK/ufDW97EJNKvav2fy+H8NNSpGYGra/1frzy+u2V
 dl+O8/luanHMp0VCu9QagOz1jMTHRmoYz9sgvP9rWPTmqNDNbIEwjl2md/Mi3UZAFGjkXtz3j
 ghyEcz/Hj7ZqmAthtP2NinAYcfWoaBIVEIx9gevqvIB7kHAnIfvnohpRIUXWnxlyMJfVoyAyq
 eZJAdeLyUgO/m1ZyWQq6le6NHB2Y73DPjFPu1PCgBgV/NbgbuXe8totNdi88XKIzxK/2JmfNb
 UB4aYwDdAee9TcX5iznecAJGPddulbwxxTYpN69umm/YmtvNE2KABNymPBqp4INyAJe95tWDM
 tr1SPR7k/sZXvSAAjT8BoqBhhfXSYSch8Ztjd0zcjX9kl0hx9nHI0wPneGADp5AJpJUvRMvkS
 0XTKEIts9qqsVRWFtM/XV/x4XWkIhwlAUNPVnlwJqDjM77uwj9PPH0hEQDySWMJ6UgzAgmFM9
 2oVPY0dZfj3bLpgZRVNSgRCUzTyWeI98DY/Cl8KP0QSZhsqshoY9ko80qj9mcVZENuWZF74j+
 oOUFi0Xe0U2uh4/+xOX2RG9PU4PjTGEWjVG0EkbqUBrY6KBnhyXDdt9bwXZ62X9TyQrxqKMZI
 c7yrauCd57DzsYxL+H7WafTv3Y8hyTJKKsDUCIds7xZJy+tu8iyzB9cEV4iBGtgssauQ=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.215,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/10/2021 à 14:55, wangyanan (Y) a écrit :
> 
> On 2021/10/19 16:23, Laurent Vivier wrote:
>> Le 08/10/2021 à 09:50, Yanan Wang a écrit :
>>> The expected output string from cpu_slot_to_string() ought to be
>>> like "socket-id: *, die-id: *, core-id: *, thread-id: *", so add
>>> the missing ", " before "die-id". This affects the readability
>>> of the error message.
>>>
>>> Fixes: 176d2cda0d ("i386/cpu: Consolidate die-id validity in smp context")
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> ---
>>>   hw/core/machine.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index b8d95eec32..0a23ae3106 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -1157,6 +1157,9 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
>>>           g_string_append_printf(s, "socket-id: %"PRId64, cpu->props.socket_id);
>>>       }
>>>       if (cpu->props.has_die_id) {
>>> +        if (s->len) {
>>> +            g_string_append_printf(s, ", ");
>>> +        }
>>>           g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
>>>       }
>>>       if (cpu->props.has_core_id) {
>>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>> .
> Thanks! Will you take this one in the trivial branch ?


yes, sorry, I missed that one in my last collect. Thank you for the heads-up.

Applied to my trivial-patches branch.

Thanks,
Laurent



