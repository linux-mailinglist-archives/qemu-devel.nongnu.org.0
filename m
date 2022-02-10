Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9864B0C05
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:14:25 +0100 (CET)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7P6-0007Z0-JB
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:14:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7MW-0006QD-CF
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:11:45 -0500
Received: from [2607:f8b0:4864:20::1035] (port=56178
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7M6-0005Mk-80
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:11:24 -0500
Received: by mail-pj1-x1035.google.com with SMTP id om7so4815215pjb.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 03:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N/mYkCsauKAet0l85lkIbQy02XWLv+VB4n3d5/Oz0OM=;
 b=ZBdhHKhN9zpFFFyagMEH+UOwt7xHPqItVLq04P1ibTGz2Yu60AOBZOEo/58sw/HZUk
 IlnuuO7XIr5IkLoVLG7KmP5XduGqWjSt/ZJ8aZJ3upnq56U5o0qkb18XinYwz55U7Gqk
 lM3/SNKo0Ojwqb9bRqSxYYgCBfhOb3JW0KFSOOlc61kTRRmFiHc22qM+xfoKvIfRfeUv
 WaNJlyNP878/Ng//sCtReKemqnmnD8DLtymgvFYAeJS4DUAASZUfZbCE98Gxk6KJ8+wI
 qvX/xaUKxXXA9a1YqsmefKfS5X73yXWUKjbDYJH65I6bvEYm1/Jg7TQtp9WMjbo0akWn
 qfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N/mYkCsauKAet0l85lkIbQy02XWLv+VB4n3d5/Oz0OM=;
 b=Vee9LNLZYkxKS5TdB3XPbslM++F48SmCm7HIb0FxyB4SGvo1A5FpSWDkOfOT7XdyGP
 AKDnGVcF6QBzmoxujRQC0aCIf40dpDF5/lGHcaHAgnOwZHBF6//TXFTRRMt59CGjHntU
 3cT6o2p7dIJrlDSJAjIv2sBt8M2v5Us7CUISun/PHGwuulGRRfjWWoMJ7POCxi0uGumj
 XMpsach06dJ/TSzZo52Cay8XzmZDuzFSJEngYuleVAYlvlU3nJyA1k0o5JN7EXi7jQJp
 zw28BqqSt8iBT+T6rJ/oMhG0pCbpuVBJE0mISpo3LrEetV2sckNydXAkltebj1V0XHhI
 LJGw==
X-Gm-Message-State: AOAM5336UrcTo7I/WvGeBQjaI6IFqNN2UBeJs39LPAWCC2JT7ealh56E
 95rYfWTwlQckTBWmuxizj8U=
X-Google-Smtp-Source: ABdhPJzU+Y7mwTOFym5BNQXDiYsJoJGuOrkI6KbPQSxMppHeTr/2zaJObk+do1AREwDSCylA9pgTAQ==
X-Received: by 2002:a17:90a:ea17:: with SMTP id
 w23mr2255272pjy.2.1644491457971; 
 Thu, 10 Feb 2022 03:10:57 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id a22sm17008156pfv.185.2022.02.10.03.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:10:57 -0800 (PST)
Message-ID: <74fb88b1-8d17-b782-22d6-45bfe400bbf9@amsat.org>
Date: Thu, 10 Feb 2022 12:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 3/4] hw/openrisc/openrisc_sim; Add support for loading a
 decice tree
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Jia Liu <proljc@gmail.com>
References: <20220210063009.1048751-1-shorne@gmail.com>
 <20220210063009.1048751-4-shorne@gmail.com>
In-Reply-To: <20220210063009.1048751-4-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Typo "device" in subject.

On 10/2/22 07:30, Stafford Horne wrote:
> Using the device tree means that qemu can now directly tell
> the kernel what hardware is configured rather than use having
> to maintain and update a separate device tree file.
> 
> This patch adds device tree support for the OpenRISC simulator.
> A device tree is built up based on the state of the configure
> openrisc simulator.
> 
> This is then dumpt to memory and the load address is passed to the

"dumped"?

> kernel in register r3.
> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>   hw/openrisc/openrisc_sim.c | 158 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 154 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index 5a0cc4d27e..d7c26af82c 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -29,14 +29,20 @@
>   #include "net/net.h"
>   #include "hw/loader.h"
>   #include "hw/qdev-properties.h"
> +#include "exec/address-spaces.h"
> +#include "sysemu/device_tree.h"
>   #include "sysemu/sysemu.h"
>   #include "hw/sysbus.h"
>   #include "sysemu/qtest.h"
>   #include "sysemu/reset.h"
>   #include "hw/core/split-irq.h"
>   
> +#include <libfdt.h>

Watch out, you now need to add TARGET_NEED_FDT=y
to configs/targets/or1k-softmmu.mak.

