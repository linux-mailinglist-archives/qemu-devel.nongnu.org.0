Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1814D32509A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 14:42:35 +0100 (CET)
Received: from localhost ([::1]:40652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFGuX-0005ch-GW
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 08:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFGrd-0003TD-Um; Thu, 25 Feb 2021 08:39:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFGra-00068B-8P; Thu, 25 Feb 2021 08:39:33 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DmYkY1JHrz16C8y;
 Thu, 25 Feb 2021 21:37:41 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Feb 2021 21:39:08 +0800
Subject: Re: [RFC PATCH 1/5] device_tree: Add qemu_fdt_add_path
To: Andrew Jones <drjones@redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-2-fangying1@huawei.com>
 <20210225110311.quvchs32o4n6iqpt@kamzik.brq.redhat.com>
 <278b7b03-f463-61b6-111d-1e840df22eae@huawei.com>
 <20210225132536.ns4fheaik6vt45si@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <ce24abfe-8b4c-9e70-d772-7eee9ae5ad22@huawei.com>
Date: Thu, 25 Feb 2021 21:39:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210225132536.ns4fheaik6vt45si@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.435,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/25/2021 9:25 PM, Andrew Jones wrote:
> On Thu, Feb 25, 2021 at 08:54:40PM +0800, Ying Fang wrote:
>>
>>
>> On 2/25/2021 7:03 PM, Andrew Jones wrote:
>>> Hi Ying Fang,
>>>
>>> I don't see any change in this patch from what I have in my
>>> tree, so this should be
>>>
>>>    From: Andrew Jones <drjones@redhat.com>
>>>
>>> Thanks,
>>> drew
>>>
>>
>> Yes, I picked it from your qemu branch:
>> https://github.com/rhdrjones/qemu/commit/ecfc1565f22187d2c715a99bbcd35cf3a7e428fa
>>
>> So what can I do to make it "From: Andrew Jones <drjones@redhat.com>" ?
>>
>> Can I made it by using git commit --amend like below ?
>>
>> git commit --amend --author "Andrew Jones <drjones@redhat.com>"
> 
> That's one way to fix it now, but normally when you apply/cherry-pick
> a patch it will keep the authorship. Then, all you have to do is
> post like usual and the "From: ..." will show up automatically.
> 

Hmm, I know cherry-pick can do that. But sometimes there maybe
conflicts, so I have to backport it by hand and copy the commit
msg back, thus the authorship may be lost.


> Thanks,
> drew
> 
>>
>>> On Thu, Feb 25, 2021 at 04:56:23PM +0800, Ying Fang wrote:
>>>> qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
>>>> it also adds any missing parent nodes. We also tweak an error
>>>> message of qemu_fdt_add_subnode().
>>>>
>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>>>> ---
>>>>    include/sysemu/device_tree.h |  1 +
>>>>    softmmu/device_tree.c        | 45 ++++++++++++++++++++++++++++++++++--
>>>>    2 files changed, 44 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>>>> index 982c89345f..15fb98af98 100644
>>>> --- a/include/sysemu/device_tree.h
>>>> +++ b/include/sysemu/device_tree.h
>>>> @@ -104,6 +104,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>>>>    uint32_t qemu_fdt_alloc_phandle(void *fdt);
>>>>    int qemu_fdt_nop_node(void *fdt, const char *node_path);
>>>>    int qemu_fdt_add_subnode(void *fdt, const char *name);
>>>> +int qemu_fdt_add_path(void *fdt, const char *path);
>>>>    #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>>>>        do {                                                                      \
>>>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>>>> index b9a3ddc518..1e3857ca0c 100644
>>>> --- a/softmmu/device_tree.c
>>>> +++ b/softmmu/device_tree.c
>>>> @@ -515,8 +515,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>>>>        retval = fdt_add_subnode(fdt, parent, basename);
>>>>        if (retval < 0) {
>>>> -        error_report("FDT: Failed to create subnode %s: %s", name,
>>>> -                     fdt_strerror(retval));
>>>> +        error_report("%s: Failed to create subnode %s: %s",
>>>> +                     __func__, name, fdt_strerror(retval));
>>>>            exit(1);
>>>>        }
>>>> @@ -524,6 +524,47 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>>>>        return retval;
>>>>    }
>>>> +/*
>>>> + * Like qemu_fdt_add_subnode(), but will add all missing
>>>> + * subnodes in the path.
>>>> + */
>>>> +int qemu_fdt_add_path(void *fdt, const char *path)
>>>> +{
>>>> +    char *dupname, *basename, *p;
>>>> +    int parent, retval = -1;
>>>> +
>>>> +    if (path[0] != '/') {
>>>> +        return retval;
>>>> +    }
>>>> +
>>>> +    parent = fdt_path_offset(fdt, "/");
>>>> +    p = dupname = g_strdup(path);
>>>> +
>>>> +    while (p) {
>>>> +        *p = '/';
>>>> +        basename = p + 1;
>>>> +        p = strchr(p + 1, '/');
>>>> +        if (p) {
>>>> +            *p = '\0';
>>>> +        }
>>>> +        retval = fdt_path_offset(fdt, dupname);
>>>> +        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
>>>> +            error_report("%s: Invalid path %s: %s",
>>>> +                         __func__, path, fdt_strerror(retval));
>>>> +            exit(1);
>>>> +        } else if (retval == -FDT_ERR_NOTFOUND) {
>>>> +            retval = fdt_add_subnode(fdt, parent, basename);
>>>> +            if (retval < 0) {
>>>> +                break;
>>>> +            }
>>>> +        }
>>>> +        parent = retval;
>>>> +    }
>>>> +
>>>> +    g_free(dupname);
>>>> +    return retval;
>>>> +}
>>>> +
>>>>    void qemu_fdt_dumpdtb(void *fdt, int size)
>>>>    {
>>>>        const char *dumpdtb = current_machine->dumpdtb;
>>>> -- 
>>>> 2.23.0
>>>>
>>>>
>>>
>>> .
>>>
>>
> 
> .
> 

