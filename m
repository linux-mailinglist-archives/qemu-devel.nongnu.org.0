Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1007472CB3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:00:22 +0100 (CET)
Received: from localhost ([::1]:60856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwkwH-0005bb-E8
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:00:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwkuD-0004Tx-1e; Mon, 13 Dec 2021 07:58:13 -0500
Received: from [2a00:1450:4864:20::42f] (port=39751
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwku9-0001tj-2W; Mon, 13 Dec 2021 07:58:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a18so26890283wrn.6;
 Mon, 13 Dec 2021 04:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gZlu6fJ7sJRbzeJva4LsvRktWlMO4B1Q8ZMK1i8QI2U=;
 b=cuXknEYDfTtsihbnikv+d9tgZPW8rPUWlCxryyZXq6FfgcStesiKKeDoALkTqVOcVa
 GJCemmRVV+hzgU0229kSoPLCgqY0p8j+pRWnucbdAeLWs5WotIH2g87MVV3LI7LYGvUu
 H0cAZ57j/hBcOYwiz+greR1Ptdrvfy4OvPOq3stpQAYRCj9AyidubunT/Mld/lkvNlCD
 YIBD89dXDE5YW7wczOLJLoVnrd10rNVrGgxr0LH1r9aa2x4QAJ7AYvJy+SmKM/HXfsl1
 dZhJ1BHU81HWS1BbP0nP3zJ8totHi7ojTZULjFROVbbPv0pt/kaVl592dCU92MHRrIy2
 x8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gZlu6fJ7sJRbzeJva4LsvRktWlMO4B1Q8ZMK1i8QI2U=;
 b=cnuTKw/v1IYI7jElOY4G2engezUQZD0OCX2RWzcTYSlqXBL3bJO+9PWXy2F/c2QvAb
 V17dSC4F5Kq+MaeyThXF9hAPzQe4ugjq4V2r+KxqQa4uXNnzRgDDx5gjI0m7iF/sOpVS
 sWUisl9qrwhmhKvauQ+yV1tkP5RrWCG5mqs6qsXDjJOECda9YivECG4NN3GtgJ9x1BH9
 Y1zSMXrEY4SiyywrZYRz1/aQcFui9Ts3ilOYVJvFV6ad/g8OAmNHN7pKtkdqBdiU/0L/
 U77DzG3veD5d9u8SVtuZRJZ4bnrJHYy1O9tV3snzj/TTkkhAOu1YFxBE1YlBgyNtJyN8
 R8KQ==
X-Gm-Message-State: AOAM531Y3hhKT9QmBKJympwv9+zY0zKQWNcgKsJ1RvZZ9QJvlTkG8Zdl
 md5zr4LFpR34RLkpIvzD4UQ=
X-Google-Smtp-Source: ABdhPJxcsaueNpU4gQOCha7ilOKn1Lq3TjJsAupxqKNj4FRw/X9Saadm5T0pSZ5TXhZWzAHVUYPNyQ==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr11174232wrs.157.1639400286423; 
 Mon, 13 Dec 2021 04:58:06 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id f19sm7748115wmq.34.2021.12.13.04.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 04:58:05 -0800 (PST)
Message-ID: <cb89940b-f11a-642a-44d4-9f1af2e98f25@amsat.org>
Date: Mon, 13 Dec 2021 13:58:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 15/26] hw/intc/arm_gicv3_its: Rename max_l2_entries to
 num_l2_entries
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-16-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 20:11, Peter Maydell wrote:
> In several places we have a local variable max_l2_entries which is
> the number of entries which will fit in a level 2 table.  The
> calculations done on this value are correct; rename it to
> num_l2_entries to fit the convention we're using in this code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

