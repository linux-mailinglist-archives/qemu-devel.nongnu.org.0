Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4DD2F265C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 03:41:00 +0100 (CET)
Received: from localhost ([::1]:39706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz9cB-0001yx-UP
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 21:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kz9an-0001ZD-3G; Mon, 11 Jan 2021 21:39:33 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kz9ak-0004Gy-CZ; Mon, 11 Jan 2021 21:39:32 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4DFF9N4k1qzVyyf;
 Tue, 12 Jan 2021 10:37:44 +0800 (CST)
Received: from dggema758-chm.china.huawei.com (10.1.198.200) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 12 Jan 2021 10:39:22 +0800
Received: from [10.174.186.85] (10.174.186.85) by
 dggema758-chm.china.huawei.com (10.1.198.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 12 Jan 2021 10:39:22 +0800
Subject: Re: [PATCH] scsi: allow user to set werror as report
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Fam Zheng
 <fam@euphon.net>, <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, "Max
 Reitz" <mreitz@redhat.com>
References: <20201103061240.1364-1-changzihao1@huawei.com>
 <33fd8330630defb91feb6c627800a3ca952a4b55.camel@euphon.net>
 <8e53dc93-2312-375e-b67e-4df1b6901890@huawei.com>
 <2130de2b-d1cd-cfb9-51ee-a775e253d4a6@huawei.com>
 <37acb898-8d6d-725b-6b48-f6d4a2cfa9fd@redhat.com>
From: Zihao Chang <changzihao1@huawei.com>
Message-ID: <28061a94-ace7-93d2-cfec-f3939914441e@huawei.com>
Date: Tue, 12 Jan 2021 10:39:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <37acb898-8d6d-725b-6b48-f6d4a2cfa9fd@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.186.85]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggema758-chm.china.huawei.com (10.1.198.200)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=changzihao1@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping again? Another month has passed, whose tree should it go via?
Or did I miss any response?

Thanks
Zihao

On 2020/12/3 17:53, Philippe Mathieu-Daudé wrote:
> On 12/3/20 3:55 AM, Zihao Chang wrote:
>> Ping? This is a fix patch which has been reviewed, whose tree should it go via?
> 
> The change itself is in-between 'Block layer' and 'SCSI'
> subsystems, so either Paolo or Kevin (Cc'ing qemu-block@).
> 
>>
>> Thanks
>> Zihao
>>
>> On 2020/11/3 22:03, Zihao Chang wrote:
>>>
>>>
>>> On 2020/11/3 18:52, Fam Zheng wrote:
>>>> On Tue, 2020-11-03 at 14:12 +0800, Zihao Chang wrote:
>>>>> 'enospc' is the default for -drive, but qemu allows user to set
>>>>> drive option werror. If werror of scsi-generic is set to 'report'
>>>>> by user, qemu will not allow vm to start.
>>>>>
>>>>> This patch allow user to set werror as 'report' for scsi-generic.
>>>>>
>>>>> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
>>>>> ---
>>>>>  hw/scsi/scsi-generic.c | 3 ++-
>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
>>>>> index 2cb23ca891..2730e37d63 100644
>>>>> --- a/hw/scsi/scsi-generic.c
>>>>> +++ b/hw/scsi/scsi-generic.c
>>>>> @@ -664,7 +664,8 @@ static void scsi_generic_realize(SCSIDevice *s,
>>>>> Error **errp)
>>>>>          return;
>>>>>      }
>>>>>  
>>>>> -    if (blk_get_on_error(s->conf.blk, 0) !=
>>>>> BLOCKDEV_ON_ERROR_ENOSPC) {
>>>>> +    if (blk_get_on_error(s->conf.blk, 0) != BLOCKDEV_ON_ERROR_ENOSPC
>>>>> &&
>>>>> +        blk_get_on_error(s->conf.blk, 0) !=
>>>>> BLOCKDEV_ON_ERROR_REPORT) {
>>>>>          error_setg(errp, "Device doesn't support drive option
>>>>> werror");
>>>>>          return;
>>>>>      }
>>>>
>>>> Accepting the report sounds sane to me, it matches what we actually
>>>> (always) do. Is the idea to allow users to spell it out explicitly in
>>>> the command line?
>>>>
>>> Actually, qemu supports user to spell it out explicitly in the command
>>> line like "enospc", "report" & "action". This patch just allows user to
>>> set werror as "report" for scsi-generic, which is a common scenario.
>>>
>>>> Reviewed-by: Fam Zheng <fam@euphon.net>
>>>>
>>>> .
>>>>
>>
> 
> .
> 

