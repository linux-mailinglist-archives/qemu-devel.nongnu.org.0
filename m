Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E2C2A75EF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 04:10:05 +0100 (CET)
Received: from localhost ([::1]:52282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaVf2-0006Oa-3i
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 22:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kaVcz-00054Y-D5
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 22:07:57 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kaVcw-0004NY-QY
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 22:07:57 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CRT3P4xK7z15RqS;
 Thu,  5 Nov 2020 11:07:45 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 5 Nov 2020 11:07:40 +0800
Subject: Re: [PATCH v9 2/8] fw_cfg: Write the extra roots into the fw_cfg
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20201103120157.2286-1-cenjiahui@huawei.com>
 <20201103120157.2286-3-cenjiahui@huawei.com>
 <dadc89f2-bff2-358a-b15d-1302018286a5@redhat.com>
 <25c7d6a0-98e4-6287-2da3-bbdf9836fb95@redhat.com>
 <6b40ba03-0e3b-6773-68d2-469c378c2894@redhat.com>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <551415bc-ff45-ee4e-8468-628272cd9925@huawei.com>
Date: Thu, 5 Nov 2020 11:07:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6b40ba03-0e3b-6773-68d2-469c378c2894@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:07:38
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, berrange@redhat.com,
 mst@redhat.com, xiexiangyou@huawei.com, shannon.zhaosl@gmail.com,
 miaoyubo@huawei.com, Gerd Hoffmann <kraxel@redhat.com>, imammedo@redhat.com,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Phil,

On 2020/11/5 5:11, Philippe Mathieu-Daudé wrote:
> Hi Laszlo,
> 
> On 11/4/20 9:05 PM, Laszlo Ersek wrote:
>> +Phil, +Gerd
>>
>> On 11/04/20 20:54, Laszlo Ersek wrote:
>>> +Marcel
>>>
>>> On 11/03/20 13:01, Jiahui Cen wrote:
>>>> From: Yubo Miao <miaoyubo@huawei.com>
>>>>
>>>> Write the extra roots into the fw_cfg, therefore the uefi could
>>>> get the extra roots. Only if the uefi knows there are extra roots,
>>>> the config space of devices behind the root could be obtained.
>>>>
>>>> Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
>>>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>>>> ---
>>>>  hw/arm/virt.c              |  8 ++++++++
>>>>  hw/i386/pc.c               | 18 ++----------------
>>>>  hw/nvram/fw_cfg.c          | 20 ++++++++++++++++++++
>>>>  include/hw/nvram/fw_cfg.h  |  2 ++
>>>>  include/hw/pci/pcie_host.h |  4 ++++
>>>>  5 files changed, 36 insertions(+), 16 deletions(-)
>>
>> I realize I never reacted to this patch before (and we're at v9), so you
>> might not welcome my feedback at this point.
>>
>> The explanation why I've only reacted now is the following: there's an
>> agreement between Phil and myself that Phil handles fw_cfg reviews
>> primarily, and I review only (or almost only) Phil's patches for fw_cfg.
>> Furthermore, all versions of this particular patch, as far as I can see,
>> CC'd me but not Phil. So Phil never knew to look, and I never checked
>> (this being an fw_cfg patch, per subject line) beyond the author being
>> Phil or not.
> 
> I noticed this patch yesterday too (by luck looking at the cover).
> Since we are in freeze, I tagged it for review but postponed it for
> in 2 or 3 weeks. Sorry for not mentioning that I would review this
> later on the list.

Sorry for forgetting to CC you. I'm glad to wait for your review :)

Thanks
Jiahui

> 
>> The solution is of course to use the get_maintainer.pl script for
>> determining reviewers, and adding them with "Cc:" tags to the commit
>> message. (You also missed Marcel at the least; see my previous
>> response.) git-send-email is supposed to adhere to those "Cc:" tags.
>>
>> The reason I've looked now is... I guess I was too tired to remember our
>> agreement with Phil.
>>
>> Thanks
>> Laszlo
>>
> 
> .
> 

