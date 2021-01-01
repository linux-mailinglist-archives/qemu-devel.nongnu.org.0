Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C71A2E85E6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:18:12 +0100 (CET)
Received: from localhost ([::1]:47538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvTgR-0002IV-6e
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTeO-0001TV-Is
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 18:16:04 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTeN-00037V-36
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 18:16:04 -0500
Received: by mail-wr1-x433.google.com with SMTP id i9so23393423wrc.4
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 15:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rrrpw5xjyHSBePwolmajEbS2U1S6n1GOWBpwym5moBo=;
 b=ojpUxBR/0rgSqyRq/xHBBtWyubLT1l80b1RCohrzS0tKCRx56mkbV0vSv5C1ovqipf
 GdRvCe8AdO1Ksv9LUSLUhkvficAIzb4Vh0+o65qO7qE1x+JN1XzqGOB2t41NjbaSGzUQ
 gG2L/LyvGNVM1M1EexsOOgt9RKvfHpIDdab5ZG3AlaJoNR7MVntH1w/7r9ZffW52ao+W
 BGq1dC8lx655RMs8I30fesLNhDI6ZyNP8sVtjOVYdaoQGk/Gqo5wDKPr5UU4IK8ysryt
 IzkOy8z9dG1j3fg/NuAk/3smFIga1j2g6hl/3KxvKv89Xp01BxSyDIMYN04MHhK3/XkN
 hj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rrrpw5xjyHSBePwolmajEbS2U1S6n1GOWBpwym5moBo=;
 b=sREVkq9vSxuK8xnBsy6kGAppxX7Pn+dxRosCSTAKO123AfamGtOuVZmuEj5MoniyaX
 oC5yybfCiEe8o+aaVj+gzmAzdT6mty05Gfz2qASMWWfCET/rvd261aMHX8dCV/khyy6N
 BGqRLwvCGOZTPVm4jnbYqX4FNAjZRyebRASLlAe9L9AsTlbDML6iXsLMgycQqCUzByhp
 wt6+YkVom2rzDQHDdENyfh/S+rquyBrsXkeyLTkCJki3JuQsSAvKtQN7536bA0BHfUu5
 NXh95gmXqE7WgYY09/uuvIyYTKh86txmSFa1LbuTHBWw7HodM4JD5ICd+cruvdVxMo1A
 G2OQ==
X-Gm-Message-State: AOAM531jzLFX+8y8pjNB4GN2/rQLHopCVa6FF/Omap/fiCnyBckM+67o
 UQphJW246gAgJjeNG/RPK2M=
X-Google-Smtp-Source: ABdhPJzu+/ByBbpNrOctaIRkb5ufAzZ8SOyihri1O7XwTO7JxU/yHJeBrw4XsGPy9KwqwYxyQ5xi/A==
X-Received: by 2002:a05:6000:1082:: with SMTP id
 y2mr68878737wrw.233.1609542961615; 
 Fri, 01 Jan 2021 15:16:01 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id b7sm71300989wrv.47.2021.01.01.15.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 15:16:01 -0800 (PST)
Subject: Re: [PATCH v2 1/8] hw/mips: Make bootloader addresses unsgined
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064200.28751-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <53e9a3a5-7581-7f52-ea75-88d230d8aa1b@amsat.org>
Date: Sat, 2 Jan 2021 00:15:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215064200.28751-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 7:41 AM, Jiaxun Yang wrote:
> Address should be unsigned anyway, otherwise it may carry
> calculations wrongly.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/fuloong2e.c | 12 ++++++------
>  hw/mips/malta.c     | 22 +++++++++++-----------
>  2 files changed, 17 insertions(+), 17 deletions(-)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


