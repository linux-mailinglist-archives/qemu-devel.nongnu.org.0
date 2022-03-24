Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142C24E62BA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 12:52:47 +0100 (CET)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXM1F-0008Pt-MF
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 07:52:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nXLyl-0006rj-I9
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:50:12 -0400
Received: from [2607:f8b0:4864:20::62d] (port=33284
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nXLyi-0006EH-RP
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:50:10 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c23so4483328plo.0
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 04:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zG09sR9flztmHWWDPRlzaIeMg9o9lfzgsi0KIJZZjQs=;
 b=XOFMSG+QUR3tPoz3CNBQpglsKqvlZk2bjsnI1yACxXWpkma4uO6VK+y+89TZ4q76Ew
 I/dY9wQYTkfQeN6LtlxevYsiFjzcHvNdMojkki0TTYzPkoBeCbvbtm9VlO7B3e5C3klD
 Ti7aBx4ZwnqFcs4Ow9tBth6Sf2podf1qmy+F0hj+vuS4BF9Dfj1jy2c6E1OnayfkuucD
 GVQ3vnWtRTA8i7766rq4T7DxQr8gKf8m/0+zCOJOWRZH95QJZxkUNIN0sqeBdY7aJdJC
 zMSSACRD9Rt8qA6iCLujm8fwfxH9nOsKVEFolDsnBsGYDZvGYHiXzAFrCtdzkXKnOWpm
 UBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zG09sR9flztmHWWDPRlzaIeMg9o9lfzgsi0KIJZZjQs=;
 b=WSKrCExCdrut964DNqWphVUXMQYeVtxGgd0iqGRNVz7uGi5wa8JbK5MqLen5ZgTp6F
 premUov3J1TnXBEhaPClwmr953pMCyKLtSzTU1EPiviPmMSYftNx/c2hz97oCKTE05bz
 Ykk5vHYtab/82GviuIxCEEC6QGNThL1BjMo4mPjU5cAOoruyOvqME9plKVvHt1b72gyY
 cL4cupdxum9S1Ng5OjSGl1cc23iwTrMi6ebBnJRy46cnPjaXtgkWtkDgQwr23qVnLL1s
 RHGX/tTBKZ77jMaJf05VCNFzZS9WEj+uTSZH4jBJqGWik/7i4Z5EPHGusqVjFcRyKQQZ
 Z3Rw==
X-Gm-Message-State: AOAM531YV/T/5Z7wJk70F4udiRJh0DnaBrzww94LCtDHEAVhX1xQti/b
 yF4fq/0MnXSLlyBFUrwUOTo=
X-Google-Smtp-Source: ABdhPJzWtLD+wURj0iDJolhr8k/VmF2cZJLlaRriGG3mq/tBgyqjFaWo5Bn33s5VwUvSTa0q8Cc1WA==
X-Received: by 2002:a17:902:d64e:b0:154:bc8f:b6c5 with SMTP id
 y14-20020a170902d64e00b00154bc8fb6c5mr5170234plh.157.1648122606956; 
 Thu, 24 Mar 2022 04:50:06 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 d9-20020a056a00198900b004fafdb88076sm653844pfl.117.2022.03.24.04.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 04:50:06 -0700 (PDT)
Message-ID: <04d9cb7b-6dab-74af-0136-0b045512605b@gmail.com>
Date: Thu, 24 Mar 2022 12:50:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] hw/core: loader: Setting is_linux to true for VxWorks
 uImage
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
References: <20220324082243.451107-1-bmeng.cn@gmail.com>
 <20220324082243.451107-2-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220324082243.451107-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/3/22 09:22, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> VxWorks 7 now uses the same boot interface as the Linux kernel on
> Arm64, PowerPC and RISC-V architectures, except Arm. Add logic to
> set is_linux to true for VxWorks uImage for these architectures in
> load_uboot_image().
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   hw/core/loader.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

