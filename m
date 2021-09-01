Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0723FDE38
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:06:53 +0200 (CEST)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRpE-0006UQ-KI
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLRoA-0005p0-7b
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:05:46 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLRo7-0002F1-Cp
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:05:45 -0400
Received: by mail-wm1-x32f.google.com with SMTP id g135so5107wme.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WytGeCdk9ym7l3UKnjiZJ4nLx3ccz7rfNfkyxdpMbu8=;
 b=H7rdnn72BoSl9QSZTojwzN4Tm9KxUEU7tTSd71+27G03r42CsJPdAacTacDRcjum+P
 2iWNryv8VyYeYEIkLth2nwl6nmqALR+1gCeBgP6Reyoc0lmpATt1RCdndpyJYe+EE7oM
 2F/XAmBNaxjEmlPoaeJ8+810Lxx/4U5SpHFxW1wZl6XgMo+ZzX/jWz5MFYpTNP73zMhb
 LAX0mpDFEt7HKLclgHYug3H2XuUD9GA5iPlh1zxc7l+PTJD+1OHjUsHjl0qMA06rTt35
 qMdsYCd1ZZWhM81WwIbCMecafMECmxu4ROv4IFDtFTqZVOhlRfftWdXpe5yT9+e+prYq
 HeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WytGeCdk9ym7l3UKnjiZJ4nLx3ccz7rfNfkyxdpMbu8=;
 b=d2ioO6qVqz/89eFpMzQCQEeyYNBabK6QORQa5atqbKmTLeMDiscNep4cnk0FEivI7B
 7AjPxzPPWoBAJsDve/G85cG2mr9dhIp6zQEZlG/+2Pc6s36G3vVWDsiTmyVD0Gahrout
 cEiQ+3K4zyFqN0zYhc8C8R6Aae3pYY48k4XMDbRP7mM2rSCITn7QTuk+HIwRiwi/LdmV
 UuFEoyQCHXQyHmRQL0fRdq4Wk47hO8E6tB9D/yZzWw04qWVdKLpUBh78++IgjSVekT8g
 42v/4/B6QqtAdfOx7a9ueMigTYU/mjc7Yhj2k+ZS8yeYStpttaypuNgRId1FEmvL3U9r
 JKwA==
X-Gm-Message-State: AOAM533Lx2NLmHVMxQyLmyJdolhQb3uGFJ+lbgcg6L6T+vUoJpqN7NJ4
 Md3iA9AE9mSExSTEg6sxzrM=
X-Google-Smtp-Source: ABdhPJxIB1MipQcfjM8/YEPdAlw4UNIXjF1TopUF3qw5DInOZ2SU+OXErGrnZVCNAPruMJ86IGxtyw==
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr10326663wmg.8.1630508742040; 
 Wed, 01 Sep 2021 08:05:42 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l15sm21575179wrv.84.2021.09.01.08.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 08:05:41 -0700 (PDT)
Subject: Re: [PATCH] .mailmap: Fix more contributor entries
To: qemu-devel@nongnu.org
References: <20210820080437.2972139-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cbaabea7-5a0c-2c1f-297e-c0a96bd0ee3a@amsat.org>
Date: Wed, 1 Sep 2021 17:05:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820080437.2972139-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>,
 Lichang Zhao <zhaolichang@huawei.com>, Haibin Zhang <haibinzhang@tencent.com>,
 Guoyi Tu <tu.guoyi@h3c.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 10:04 AM, Philippe Mathieu-Daudé wrote:
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

last call ;)

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

