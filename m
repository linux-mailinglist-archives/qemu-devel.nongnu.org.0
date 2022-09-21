Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F55C0562
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 19:37:14 +0200 (CEST)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob3eq-0003PT-W5
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 13:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3c6-0008Mw-5Q; Wed, 21 Sep 2022 13:34:23 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3c2-0006Dy-RQ; Wed, 21 Sep 2022 13:34:21 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f23so6361031plr.6;
 Wed, 21 Sep 2022 10:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=r1uDIfKVCipRJHAIDB+NtAKXd73F4ShuDhLXnKs/2O0=;
 b=Bw4dbxItbiVzC0IBiHHJamup7DAJRXy84ww7o8MzLKoPZjH+LSH88XWh9B+MZyxNIK
 V90HCRZS1HwjOC9YqpbbaR96BzGSptvVOPFxlNTrPiMsX7+ZuJuEeov12hSTk0FksrNP
 DMvwjAFQLDyRNISUoig9FrSHsJYTtXYRaonbAuQlqLwHwxAmqDczZfPFKprXE1jziccD
 dsht7c1XkyoTOfkF8kFQy/WtIZB1vsRZGJh61BzgjuVMI+7OtnoQCI2BpMOKyPYERf0u
 U1494SuBMIwTm6GNWrdBz8GeTrm2k2/YwBF1hII4dehJPkz1+KNIY4PtnJSQ5K66w6KQ
 0nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=r1uDIfKVCipRJHAIDB+NtAKXd73F4ShuDhLXnKs/2O0=;
 b=Uvx6VbxASS8Axy28uUfDTWrin0isClCJbxGgWmzfAUINV7vT51LBDVpacC0kUneDwC
 GAqKfJC34teNLJAl8DRUDmKUjHDQ/EP13r8lXVrg82RMxTdf0FOQU7xvg5Q5vuRaBV2A
 Fbk2bm93yS9ePrSZ/g+Kujzq0fPQyP16TpzJPCiz2ETxQIbhcxmckjVi6NNCV4LVhoQG
 feSFqpLiwNN+1JIxBttobEUYJtchulnvo0Cu/LakNNAGqqKO4gSHjCN95aLnQhls7nVF
 Vnw7J/xlx2W7uvfWmVW6HV022ckClH7TYB5M7xJneX788TvvdydsBMePIKjcyaJ+Pes6
 py/g==
X-Gm-Message-State: ACrzQf1en42nToRRFohvYoAfT8u7KRz7WfZE3hw6ASoulAcxeooGvT6L
 vMRZJf97Dyzzq7lAyhzMiBg=
X-Google-Smtp-Source: AMsMyM7GWUuTEBJDdS4DdPUm9+90dFUes2j0z+RBKat0xi/liXnPKxZBREbZ1V9yy/rsf/eRfYPVDQ==
X-Received: by 2002:a17:902:ea12:b0:178:8e76:c781 with SMTP id
 s18-20020a170902ea1200b001788e76c781mr5982737plg.136.1663781655068; 
 Wed, 21 Sep 2022 10:34:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a056a00213000b0053dec787698sm2502118pfj.175.2022.09.21.10.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 10:34:14 -0700 (PDT)
Message-ID: <d25caf9f-dcab-96bc-2202-52e4d7b15b03@amsat.org>
Date: Wed, 21 Sep 2022 19:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 01/10] monitor: expose monitor_puts to rest of code
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:New World (mac99)" <qemu-ppc@nongnu.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
 <20220921160801.1490125-2-alex.bennee@linaro.org>
In-Reply-To: <20220921160801.1490125-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 21/9/22 18:07, Alex Bennée wrote:
> This helps us construct strings elsewhere before echoing to the
> monitor. It avoids having to jump through hoops like:
> 
>    monitor_printf(mon, "%s", s->str);
> 
> It will be useful in following patches but for now convert all
> existing plain "%s" printfs to use the _puts api.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> v2
>    - s/monitor_printf(mon, "%s"/monitor_puts(mon, /
> ---
>   docs/devel/writing-monitor-commands.rst |  2 +-
>   include/monitor/monitor.h               |  1 +
>   monitor/monitor-internal.h              |  1 -
>   block/monitor/block-hmp-cmds.c          | 10 +++++-----
>   hw/misc/mos6522.c                       |  2 +-
>   monitor/hmp-cmds.c                      |  8 ++++----
>   monitor/hmp.c                           |  2 +-
>   target/i386/helper.c                    |  2 +-
>   8 files changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

