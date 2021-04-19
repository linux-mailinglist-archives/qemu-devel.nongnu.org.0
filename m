Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6B363C11
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 09:04:30 +0200 (CEST)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYNxN-0002uP-IJ
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 03:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lYNw3-0002Mo-Vj; Mon, 19 Apr 2021 03:03:08 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lYNvy-0007RD-Cc; Mon, 19 Apr 2021 03:03:07 -0400
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FNyPl5hs3z5qNQ;
 Mon, 19 Apr 2021 15:00:27 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 19 Apr 2021 15:02:48 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 19 Apr 2021 15:02:47 +0800
Subject: Re: [RFC PATCH v2 1/6] device_tree: Add qemu_fdt_add_path
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-2-wangyanan55@huawei.com>
 <YHkYD+cCl9/GCxwJ@yekko.fritz.box>
 <cd3408c2-6025-7a44-bbf6-d675467c5749@huawei.com>
 <YHzZJvH/9CiYWia4@yekko.fritz.box>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <85a55b54-e5c2-4a4c-2a51-ebae841d6c4f@huawei.com>
Date: Mon, 19 Apr 2021 15:02:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YHzZJvH/9CiYWia4@yekko.fritz.box>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair
 Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On 2021/4/19 9:13, David Gibson wrote:
> On Sat, Apr 17, 2021 at 10:36:20AM +0800, wangyanan (Y) wrote:
>> Hi David,
>>
>> On 2021/4/16 12:52, David Gibson wrote:
>>> On Tue, Apr 13, 2021 at 04:07:40PM +0800, Yanan Wang wrote:
>>>> From: Andrew Jones <drjones@redhat.com>
>>>>
>>>> qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
>>>> it also adds any missing subnodes in the path. We also tweak
>>>> an error message of qemu_fdt_add_subnode().
>>>>
>>>> We'll make use of this new function in a coming patch.
>>>>
>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>>> ---
>>>>    include/sysemu/device_tree.h |  1 +
>>>>    softmmu/device_tree.c        | 45 ++++++++++++++++++++++++++++++++++--
>>>>    2 files changed, 44 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>>>> index 8a2fe55622..ef060a9759 100644
>>>> --- a/include/sysemu/device_tree.h
>>>> +++ b/include/sysemu/device_tree.h
>>>> @@ -121,6 +121,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>>>>    uint32_t qemu_fdt_alloc_phandle(void *fdt);
>>>>    int qemu_fdt_nop_node(void *fdt, const char *node_path);
>>>>    int qemu_fdt_add_subnode(void *fdt, const char *name);
>>>> +int qemu_fdt_add_path(void *fdt, const char *path);
>>>>    #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>>>>        do {                                                                      \
>>>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>>>> index 2691c58cf6..8592c7aa1b 100644
>>>> --- a/softmmu/device_tree.c
>>>> +++ b/softmmu/device_tree.c
>>>> @@ -541,8 +541,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>>>>        retval = fdt_add_subnode(fdt, parent, basename);
>>>>        if (retval < 0) {
>>>> -        error_report("FDT: Failed to create subnode %s: %s", name,
>>>> -                     fdt_strerror(retval));
>>>> +        error_report("%s: Failed to create subnode %s: %s",
>>>> +                     __func__, name, fdt_strerror(retval));
>>>>            exit(1);
>>>>        }
>>>> @@ -550,6 +550,47 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
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
>>> Getting the offset for "/" is never needed - it's always 0.
>> Thanks, will fix it.
>>>> +    p = dupname = g_strdup(path);
>>> You shouldn't need the strdup(), see below.
>>>
>>>> +
>>>> +    while (p) {
>>>> +        *p = '/';
>>>> +        basename = p + 1;
>>>> +        p = strchr(p + 1, '/');
>>>> +        if (p) {
>>>> +            *p = '\0';
>>>> +        }
>>>> +        retval = fdt_path_offset(fdt, dupname);
>>> The fdt_path_offset_namelen() function exists *exactly* so that you
>>> can look up partial parths without having to mangle your input
>>> string.  Just set the namelen right, and it will ignore anything to
>>> the right of that.
>> Function fdt_path_offset_namelen() seems more reasonable.
>>
>> After we call qemu_fdt_add_path() to add "/cpus/cpu-map/socket0/core0"
>> successfully,
>> if we want to add another path like "/cpus/cpu-map/socket0/core1" we will
>> get the error
>> -FDT_ERR_NOTFOUND for each partial path. But actually
>> "/cpus/cpu-map/socket0"
>> already exists, so by using fdt_path_offset_namelen() with right namelen we
>> can avoid
>> the error retval for this part.
> I don't quite follow what you're saying here.  AFAICT your logic was
> correct - it just involved a lot of mangling the given path (adding
> and removing \0s) which becomes unnecessary with
> fdt_path_offset_namelen().
Right.
>>>> +        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
>>>> +            error_report("%s: Invalid path %s: %s",
>>>> +                         __func__, path, fdt_strerror(retval));
>>> If you're getting an error other than FDT_ERR_NOTFOUND here, chances
>>> are it's not an invalid path, but a corrupted fdt blob or something
>>> else.
>> Right, there can be variable reasons for the fail in addition to the invalid
>> path.
>>
>>>> +            exit(1);
>>>> +        } else if (retval == -FDT_ERR_NOTFOUND) {
>>>> +            retval = fdt_add_subnode(fdt, parent, basename);
>>>> +            if (retval < 0) {
>>>> +                break;
>>>> +            }
>> I found another question here. If path "/cpus/cpu-map/socket0/core0" has
>> already
>> been added, when we want to add another path "/cpus/cpu-map/socket0/core1"
>> and go here with retval = fdt_add_subnode(fdt, parent, "cpus"), then retval
>> will
>> be -FDT_ERR_EXISTS, but we can't just break the loop in this case.
>>
>> Am I right of the explanation ?
> Not exactly.  If you called that fdt_add_subnode() in that case you
> would get FDT_ERR_EXISTS.  However, because the previous
> fdt_path_offset() has returned -FDT_ERR_NOTFOUND, you've already
> established that the partial path doesn't exist, so if you got an
> FDT_ERR_EXISTS here something has gone very strangely wrong (such as
> concurrent access to the flat tree, which would very likely corrupt
> it).
Thanks for the analysis, I was wrong...
> Note that the repeated use of fdt_path_offset() in this function will
> repeatedly rescan the whole fdt from the beginning.  If you're
> concerned about performance (which you might well not be), then a more
> efficient approach would be to take your input path component by
> component and use fdt_subnode_offset() directly.
I will try to address your comments and have some rework for this patch 
in next version.

Thanks,
Yanan
>

