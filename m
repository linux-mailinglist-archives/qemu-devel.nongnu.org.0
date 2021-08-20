Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6A3F2848
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 10:21:13 +0200 (CEST)
Received: from localhost ([::1]:40300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGzm4-000683-Fn
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 04:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1mGzkj-000576-Gl
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 04:19:50 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1mGzkg-0002db-Iy
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 04:19:49 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GrZFZ1lzwz8sYc;
 Fri, 20 Aug 2021 16:15:30 +0800 (CST)
Received: from kwepeml500004.china.huawei.com (7.221.188.141) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 20 Aug 2021 16:19:34 +0800
Received: from [10.174.187.138] (10.174.187.138) by
 kwepeml500004.china.huawei.com (7.221.188.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 20 Aug 2021 16:19:33 +0800
Message-ID: <611F6595.30707@huawei.com>
Date: Fri, 20 Aug 2021 16:19:33 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: =?UTF-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH] .mailmap: Fix more contributor entries
References: <20210820080437.2972139-1-f4bug@amsat.org>
In-Reply-To: <20210820080437.2972139-1-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepeml500004.china.huawei.com (7.221.188.141)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=alex.chen@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.591,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Guoyi Tu <tu.guoyi@h3c.com>, Lichang Zhao <zhaolichang@huawei.com>,
 Hyman Huang <huangy81@chinatelecom.cn>, qemu-devel@nongnu.org,
 Bibo Mao <maobibo@loongson.cn>, Yuanjun
 Gong <ruc_gongyuanjun@163.com>, Haibin Zhang <haibinzhang@tencent.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/8/20 16:04, Philippe Mathieu-Daudé wrote:
> These authors have some incorrect author email field.
> For each of them, there is one commit with the replaced
> entry.
> 
> Cc: Alex Chen <alex.chen@huawei.com>
> Cc: Bibo Mao <maobibo@loongson.cn>
> Cc: Guoyi Tu <tu.guoyi@h3c.com>
> Cc: Haibin Zhang <haibinzhang@tencent.com>
> Cc: Hyman Huang <huangy81@chinatelecom.cn>
> Cc: Lichang Zhao <zhaolichang@huawei.com>
> Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> If you are Cc'ed and agree with this change, please reply with a
> "Reviewed-by: Name <email>" line. I'll wait 2 weeks and consider
> no reply as a disagreement and will remove your entry from this
> patch.

Reviewed-by: Alex Chen <alex.chen@huawei.com>

> ---
>  .mailmap | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/.mailmap b/.mailmap
> index f029d1c21fe..11b259e7d07 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -69,6 +69,7 @@ Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
>  # git author config, or had utf8/latin1 encoding issues.
>  Aaron Lindsay <aaron@os.amperecomputing.com>
>  Alexey Gerasimenko <x1917x@gmail.com>
> +Alex Chen <alex.chen@huawei.com>
>  Alex Ivanov <void@aleksoft.net>
>  Andreas Färber <afaerber@suse.de>
>  Bandan Das <bsd@redhat.com>
> @@ -76,6 +77,7 @@ Benjamin MARSILI <mlspirat42@gmail.com>
>  Benoît Canet <benoit.canet@gmail.com>
>  Benoît Canet <benoit.canet@irqsave.net>
>  Benoît Canet <benoit.canet@nodalink.com>
> +Bibo Mao <maobibo@loongson.cn>
>  Boqun Feng <boqun.feng@gmail.com>
>  Boqun Feng <boqun.feng@intel.com>
>  Brad Smith <brad@comstyle.com>
> @@ -99,9 +101,12 @@ Gautham R. Shenoy <ego@in.ibm.com>
>  Gautham R. Shenoy <ego@linux.vnet.ibm.com>
>  Gonglei (Arei) <arei.gonglei@huawei.com>
>  Guang Wang <wang.guang55@zte.com.cn>
> +Guoyi Tu <tu.guoyi@h3c.com>
> +Haibin Zhang <haibinzhang@tencent.com>
>  Hailiang Zhang <zhang.zhanghailiang@huawei.com>
>  Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
>  Hervé Poussineau <hpoussin@reactos.org>
> +Hyman Huang <huangy81@chinatelecom.cn>
>  Jakub Jermář <jakub@jermar.eu>
>  Jakub Jermář <jakub.jermar@kernkonzept.com>
>  Jean-Christophe Dubois <jcd@tribudubois.net>
> @@ -113,6 +118,7 @@ Jun Li <junmuzi@gmail.com>
>  Laurent Vivier <Laurent@lvivier.info>
>  Leandro Lupori <leandro.lupori@gmail.com>
>  Li Guang <lig.fnst@cn.fujitsu.com>
> +Lichang Zhao <zhaolichang@huawei.com>
>  Liming Wang <walimisdev@gmail.com>
>  linzhecheng <linzc@zju.edu.cn>
>  Liran Schour <lirans@il.ibm.com>
> @@ -171,6 +177,7 @@ Xiong Zhang <xiong.y.zhang@intel.com>
>  Yin Yin <yin.yin@cs2c.com.cn>
>  Yu-Chen Lin <npes87184@gmail.com>
>  Yu-Chen Lin <npes87184@gmail.com> <yuchenlin@synology.com>
> +Yuanjun Gong <ruc_gongyuanjun@163.com>
>  YunQiang Su <syq@debian.org>
>  YunQiang Su <ysu@wavecomp.com>
>  Yuri Pudgorodskiy <yur@virtuozzo.com>
> 



