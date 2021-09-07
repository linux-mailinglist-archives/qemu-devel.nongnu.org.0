Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A40940241F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:22:14 +0200 (CEST)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVQr-00069r-KE
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNVPL-0004zQ-TH; Tue, 07 Sep 2021 03:20:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:47072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNVPK-0002R0-Hj; Tue, 07 Sep 2021 03:20:39 -0400
Received: by mail-wr1-x434.google.com with SMTP id x6so12875304wrv.13;
 Tue, 07 Sep 2021 00:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PZj0im5PH/Bv5JBSbV1XWtSUufMLS62Seec99EmTY0U=;
 b=pffmksZNhlJt0cBMr0fmVYeGeSoUqz0joZ8Y9HlqnzFM0u5YbObbvdWQTSnm6IEsoW
 dot5D5BnzAyLy4UeMD+gmdFIwxn3OwhiYwy5aNs7bvSE1cdO15IDfNaMTpGsr6MKthzT
 HIo3kfpFPfTFvr83+nQ66Wk67ZBCQVaYBXcgqCVZxet4PhZazjPtkMZ+3o/WKTSHsK4q
 b57g7omMKPjjMsKvbq5q6pY2cadSacboBeBbNNtuaVxtkbZd0G6MCKt6ssK4rVgwKU+e
 Om5dOu3PRSaflmm4X4Ir+ROaEqpFHwu75tht9sUfDkK2iahjZcpS/8QX2RpNxMyzu3Xd
 Fm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PZj0im5PH/Bv5JBSbV1XWtSUufMLS62Seec99EmTY0U=;
 b=S+ZxdjzQD4/g3F0G2KNYBqe7V14FeRPqw2imkoj/fvgBUeJ4FTE9CYffF5sAyRTU/A
 DX9WDBkM+E+iYiA73TOXhY9fP/BcxW2eJXP7MvcuCp/Vgb8wczx8vpIMHmQjNzV+b7Ku
 fHTD3kiVdgDLiaTqaw8KYZkZUO9PmxRs4gOz+a+zjFmajqV2S1ak8xIM48IZZ5KiseIm
 fuXecJv3y4q+F2YfXwG1F+fTEAPICCOHpQUuOXRqH7OZkdR6Tra4u+65F4oopZZdLath
 vvIvqHcMcmjeTQAVViwr/RI5dpEo2WFl8dvpte+xmJW3R+IDJV28/Gc0RBM4xb/0H1Sq
 csrw==
X-Gm-Message-State: AOAM530V+ZMClyl8BEkOMjW+r4154XQJMK1An87OATh7Nf33pqPLhWSG
 n2nF933B4n5hGV7mlTnlqw9ClQ1i/tE=
X-Google-Smtp-Source: ABdhPJzevfPiHPoaHUuW6OMs9a2x4bRPJK4ZbBTpD5VJt3aR755cgHz8ltYVghdbTVT7z5hGDm3fzA==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr17260339wro.309.1630999236290; 
 Tue, 07 Sep 2021 00:20:36 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id r15sm1823754wmh.27.2021.09.07.00.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 00:20:35 -0700 (PDT)
Subject: Re: [PATCH 06/10] aspeed/smc: Remove the 'size' attribute from
 AspeedSMCFlash
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
References: <20210907065822.1152443-1-clg@kaod.org>
 <20210907065822.1152443-7-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e3f5d94c-8d21-3fc4-9839-f2393d188241@amsat.org>
Date: Tue, 7 Sep 2021 09:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907065822.1152443-7-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.332,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 8:58 AM, Cédric Le Goater wrote:
> It's only useful to compute the initial size of the boot_rom region.

"AspeedSMCFlash::size is only used to compute the initial size
 of the boot_rom region. Not very useful, so directly call
 memory_region_size() instead."?

> Use memory_region_size() instead.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/ssi/aspeed_smc.h | 1 -
>  hw/arm/aspeed.c             | 7 ++++---
>  hw/ssi/aspeed_smc.c         | 5 ++---
>  3 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

