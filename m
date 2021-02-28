Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8AE32739D
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:21:40 +0100 (CET)
Received: from localhost ([::1]:47234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGPlC-0006UA-5n
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGPbL-0006ym-3L; Sun, 28 Feb 2021 12:11:27 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:43944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGPax-0004ZC-Qu; Sun, 28 Feb 2021 12:11:26 -0500
Received: by mail-lj1-x233.google.com with SMTP id m11so15736130lji.10;
 Sun, 28 Feb 2021 09:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vrYwtiG+6GnA1gR8YQzN+mFdiLPlOFhlYZooat6/KRU=;
 b=FHw6ZEKkjBW+61zBGrvALaEHvbcBVb2hVsM6kO1GeKVbE41lJTLlhIOSDzu56U4VUP
 RRedK2oJJaIkGO6VGZBxYDjXa2barYucPK7s7EzY/5X+mENrvwDE7+7n1dd4epc/YM0P
 SjdGUXVrheVkLcJqFvriNim6lLs2pMR0x88Mzkb1jH8rn/x2WkYi0IipFHemjMn1/eRr
 mcR3jGBrH0dzeqD27jX4EN/Dyk45g0IOsXa/k7UFW8s6bBaOzF4ieU6BJFugCDjR1NKa
 ZO9ZdSNHz3uuVnxy9+UXa9oj1bdd9pSIev3kVceuxkwnBDgRr5bqCy4nWTXiXprk2Ea9
 xT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vrYwtiG+6GnA1gR8YQzN+mFdiLPlOFhlYZooat6/KRU=;
 b=CbMJiIKAmZjUVDxQqpvRwZ3h7JFgmwJ/Yop+sVMtMwf1y8aYz+lnmfNxnkVCe5ieAX
 gsFtYmCW8bKYaITrwpbPUlv9lU1/WcCrm6GHFCz3g0bsLQZ9n3lQ8NC+WGfwtLAOLwwt
 KBj1Xesvrng0mTT2iY0V+DEuPksgeb49R1YE4nurDQl+W/wx0Ju09giqHka5CopYcOEI
 WEoHQRXvrU8bNBhcbQgZ+5w5OIGMAn5NvsYFcJHQFbZI5RZ9zhSjtxCmx0u9efP6Ogzl
 7CFcz2/O/ftXT7Q3irXvUdrq1FWIkMGwdCX278E77imyGZpdyMui+txqvdXBYoSc/sci
 sF/Q==
X-Gm-Message-State: AOAM530EkXgnYG7NuXgRXqqggGzemKa+s4pXzbaqa7dy7BWjf7jOgOs3
 jxggJ/w80HZovMw+o6X2evbV9IxJXBs=
X-Google-Smtp-Source: ABdhPJxDt/rhoe3AM96N+OGdFGHgj8ADV3J4TsOEFwVC4Riyje649HCA3TEkOU3mbqiiabsfqLkytg==
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr12605219wrn.255.1614528488064; 
 Sun, 28 Feb 2021 08:08:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y16sm21402871wrw.46.2021.02.28.08.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 08:08:07 -0800 (PST)
Subject: Re: [PATCH] hw/sd: sd: Fix build error when DEBUG_SD is on
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210228050609.24779-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2d19bcf2-eb59-2574-d41f-13bdbfa76cc1@amsat.org>
Date: Sun, 28 Feb 2021 17:08:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210228050609.24779-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 6:06 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> "qemu-common.h" should be included to provide the forward declaration
> of qemu_hexdump() when DEBUG_SD is on.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/sd/sd.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


