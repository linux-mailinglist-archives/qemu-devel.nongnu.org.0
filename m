Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8890E311F0F
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 18:12:04 +0100 (CET)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8R7m-0006NE-Dt
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 12:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8QxY-00081l-SC; Sat, 06 Feb 2021 12:01:26 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8QxV-0005Et-1j; Sat, 06 Feb 2021 12:01:23 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l12so11550092wry.2;
 Sat, 06 Feb 2021 09:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0lpGD6wejSq4zYPSzmNY/1BW6iDgPGbj876Gcih74dM=;
 b=as+bVFLOVT59AGVj6kDV3LlpgraziWmmM6RRQJg6rA3vvKk/USwZdElYo3seAnXkS+
 LX5FeZhRg0sTZbUaRrGe6ynzECbvbCr/+W1ks2nbN9I/oZByWiNvxi5XFA5oEE6OOd6m
 kjBDPNLecRkwH9hichQvG0jft8QfqL4cEwCRtK4GIO3IcXmObAp23FtT4mpvkxrIdlB9
 Dz7OhECr/nIRcsL17W1w+ygoRlsmOvItKvTdp7pv2lf0JKsk4GWOnfdgsB8HtNfyCzPq
 DML8y0w4Scep+jID4MsULRrvHK/Y/EFMJ+3PqIQLOglpOSaCY3673Jp654PjuTpYHFf6
 OSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0lpGD6wejSq4zYPSzmNY/1BW6iDgPGbj876Gcih74dM=;
 b=GgxRyaoo/bpIiADQPRx8PHyty8qW8qWl6xYsjnv2jIRQLvxYQG2oqdTGul+m5S6eIx
 er9QEa0N5lE+CMTkO75rSkN0JuFYEDFDqoGqfYFHw5qqFkuwdDpU7JwKK7yQp7ftcBaP
 pFOydUkqNfEpf1GiegxGBE6e2NxaAHGgJK/H+pbRjnJVOO/6o2fKSn1yGFC7fmqY1n7D
 HiLTF2gny/i+pkfVmrBUHmnJGyQhLdBGwuSCImQ0AIZSfZnedpxD9A+SimBxBokA3QD4
 8uSL3Hl9MXdqzokBYHpxkKPppbEvuOtUaHvvqgJTqqa2Nwszok5RIKNl1NeWqglsUl3h
 2hiQ==
X-Gm-Message-State: AOAM532SYEbX6r0YFY02MBrX03zkL53ugZLV68VY/S7Q27w90cFv1Dre
 bcpvWEPjmyotur2DjwxHK+Q=
X-Google-Smtp-Source: ABdhPJyBznKliY507f+lIoyGtT9mWvCTTNX5nMQQ2O6vkk0H3kruVR8vl+2QL75TvFHGycOOaDLoeg==
X-Received: by 2002:adf:e3c2:: with SMTP id k2mr11002661wrm.337.1612630879095; 
 Sat, 06 Feb 2021 09:01:19 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q20sm11883601wmc.14.2021.02.06.09.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Feb 2021 09:01:18 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/ssi: xilinx_spips: Clean up coding convention
 issues
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
 <1612622294-37297-2-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <daee5ad3-1c56-e538-40d5-628f91bca14f@amsat.org>
Date: Sat, 6 Feb 2021 18:01:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1612622294-37297-2-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.105,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/6/21 3:38 PM, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> There are some coding convention warnings in xilinx_spips.c,
> as reported by:
> 
>   $ ./scripts/checkpatch.pl hw/ssi/xilinx_spips.c
> 
> Let's clean them up.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/ssi/xilinx_spips.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

