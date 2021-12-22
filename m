Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37F847D6A9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:26:00 +0100 (CET)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06JM-0008Tq-1x
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:26:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n06A2-0002rh-UE; Wed, 22 Dec 2021 13:16:22 -0500
Received: from [2607:f8b0:4864:20::731] (port=41816
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n06A0-0006FD-9E; Wed, 22 Dec 2021 13:16:22 -0500
Received: by mail-qk1-x731.google.com with SMTP id m2so1504878qkd.8;
 Wed, 22 Dec 2021 10:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=9wdBPnl9DFLdHTwbwQMML7A4CS4yYwwhSCUVz4sFaT4=;
 b=AAg0MVrDX5OpgJ2UE731aVXWKj5Z1TMsjBHzVQ3PMNAkU8OrSI/OlCFMgtFgupfzZL
 2KH1MUBSC85zKVdq50LRcX3l8M8In4dLp27p03fQjDEkmjBRlSHFCXunbcvVMtZGd563
 Tlt5j3Xzmq+EZyGsFyYrpyE/NnH6N7/n7SVVlebxG5MnBVRMBy0Uq9wJnRZqx5nmKV8i
 OXtGemoQQU1bOY3DPwq1d6coxYureAuPPNmjjup+Mwes1ljizLbzXFxo+cKlUz9BdZZl
 9MyaXHrb+Q7QeYoqrryu/phNsP9x+VQ4CUxa0rXH0p0/7cvyZ7lkQeRkxGH0oENiVPFf
 XlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9wdBPnl9DFLdHTwbwQMML7A4CS4yYwwhSCUVz4sFaT4=;
 b=HfUIWKHAjFX6Q815mxPujRrrE632d8wfrwPfphIuXlQBsTmKus80k6UhIUAgNsPZSk
 RzWKyCSlwqvHJXnSgMrI/BNDKvx6EJPWBDMlOA7A5M10IxdUaXQY7+klc5xqWoCsqnou
 XT9QOBKTcT17E9yow6CxWMw6C5LMrKD04Abzk4oieTeb5s+ox6fzzQgnhukONDIsjQha
 OS5+BSnTOl3et2qmdZXvh4qny8BHeDnB3A2qi2+xI+eUgsovW9Bvfx8nQaXsjb6AHyT0
 9YdcGfsT/MHeqjVqxKErb5LjtyWma6f83v+kVlopOVSK96M6sl31WBN3vAKrwBVauUIj
 wxmQ==
X-Gm-Message-State: AOAM532xDs6wkk4HSjjTwSB/u+LQBOcPj4+H2xT8k/UgmcmnZNhjjOkX
 3Vp69cMR2gKJT5baXpum9DZULQjmUlQ=
X-Google-Smtp-Source: ABdhPJxE4Xt/NW05SFQmCYByjKm36eJUPDg6q5IyBRbW0r3XvqI8XM8qmJ9bBNrNWAJXFEv3rwAUdA==
X-Received: by 2002:a05:620a:40d5:: with SMTP id
 g21mr2880208qko.478.1640196979143; 
 Wed, 22 Dec 2021 10:16:19 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:7ce4:b718:2cc0:32df:97ee?
 ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id w63sm2203115qkd.88.2021.12.22.10.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 10:16:18 -0800 (PST)
Message-ID: <815ee012-7b46-c907-b734-7250c50bbf6b@gmail.com>
Date: Wed, 22 Dec 2021 15:16:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/5] ppc/pnv: Preliminary cleanups before user created PHBs
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222063817.1541058-1-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211222063817.1541058-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 12/22/21 03:38, Cédric Le Goater wrote:
> Hello,
> 
> There are the last cleanups preparing ground for PHBs created on the
> command line and possibly libvirt support.


As a note to whoever wants to give this series a go: I'm working in more fixes and
cleanups on top of these patches. I'm planning to post what I have in the next few
days.


Thanks,


Daniel



> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (5):
>    ppc/pnv: Change the maximum of PHB3 devices for Power8NVL
>    ppc/pnv: Remove PHB4 reset handler
>    ppc/pnv: Remove the PHB4 "device-id" property
>    ppc/pnv: Attach PHB3 root port device when defaults are enabled
>    ppc/pnv: Attach PHB4 root port device when defaults are enabled
> 
>   include/hw/pci-host/pnv_phb3.h |  2 --
>   include/hw/pci-host/pnv_phb4.h |  4 ----
>   hw/pci-host/pnv_phb3.c         |  8 --------
>   hw/pci-host/pnv_phb4.c         | 25 -------------------------
>   hw/pci-host/pnv_phb4_pec.c     |  3 ---
>   hw/ppc/pnv.c                   | 25 +++++++++++++++++++++++--
>   6 files changed, 23 insertions(+), 44 deletions(-)
> 

