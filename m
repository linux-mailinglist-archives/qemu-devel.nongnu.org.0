Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0765BBAA1
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:14:34 +0200 (CEST)
Received: from localhost ([::1]:60390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZf8z-0001FJ-8S
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZf7l-00088s-VY; Sat, 17 Sep 2022 17:13:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZf7k-0004Z6-Cx; Sat, 17 Sep 2022 17:13:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so2042955wma.2; 
 Sat, 17 Sep 2022 14:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=OkLgaXBM0tM7UXAC+uUMwzzD5ZZJTESlKYdYMknq1Xc=;
 b=j/jvhhgeo8sy640HWsyZYfhLBBZUQwXV97v+RsW7WWPxU4ZSCsdH+6LAoLQPvY7vAT
 V3I7CIPwUGYgCqcG8B2VtYTnfRB4wkkTf1PdcTheITzxyacOGJEZrWqmMEmhLh5H+I0T
 KHkNlR5zsO9XgXGKvO3hoxKrxKFkrFnqei2jK6E7Z2+lAGqWeth40QRJskA3K2ny5UCS
 mEYmoj6EQBRtHPbumQgdcrAdEqdXsOsZHrX/w/r1AMQ3bANRIJch7Q3DuaCo+g6RwA7A
 nCwDLGymIJjHlGDPcPy3+sR4iTTSzbM7ibupOBIni5ns2Ur+tQWAcm8ibfj5FetxQjYK
 2WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=OkLgaXBM0tM7UXAC+uUMwzzD5ZZJTESlKYdYMknq1Xc=;
 b=wUktylN9qZYFAloEiu/7HvmbuP/EQAT27cOClBXNCKOWp1YQIWEXU/7xDEJDm/rnPx
 f5oCxrR3YAr4S9re21jgtArzDkX6CqwnCangCzujXdEYrXBTa20W50IO8QAxT6ye2P5F
 wzQBOEAAzmtEb8QG3g6uPJdJpEEVhnQkUe2ghsW5PXwDPliDfkj6Fc2VwKzj/PLWb0Uz
 3rn6MnYZZGh2cu5t361s4grJFpyzL5hfFmQUgi+npG/bI0jkgtI+rzlfj0Tj0cIIb225
 CpuMTfIALpZjF4QSVIYPu604939LRtJxoIIx6tLWTpuy8mDfThOGEU+OBjQDDVHyKdcx
 U/Eg==
X-Gm-Message-State: ACgBeo38HvmbW1/ykWFVcuhZOS56kNH4ld7O3ME/66vbTNyz4wl8UsZ6
 2e27JjIIZV/ezmQ28kEougY=
X-Google-Smtp-Source: AA6agR5pkc/Ol90BhhYFLdAA9pPqdks8fE5YHp7WOwNFQHu9idZTLc1awwHRzuZBVMLcr4injYzjxQ==
X-Received: by 2002:a05:600c:4e16:b0:3b4:9a80:915c with SMTP id
 b22-20020a05600c4e1600b003b49a80915cmr14150110wmq.126.1663449194376; 
 Sat, 17 Sep 2022 14:13:14 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c28cb00b003b462b314e7sm7014584wmd.16.2022.09.17.14.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:13:13 -0700 (PDT)
Message-ID: <8ec64977-c6bf-5e55-7129-126e7b7a82a4@amsat.org>
Date: Sat, 17 Sep 2022 23:13:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 05/10] mac_{old|new}world: Reduce number of QOM casts
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <ab40167d23ee0777f99e8dadcf8e6050665092f9.1663368422.git.balaton@eik.bme.hu>
In-Reply-To: <ab40167d23ee0777f99e8dadcf8e6050665092f9.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
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

On 17/9/22 01:07, BALATON Zoltan wrote:
> By storing the device pointers in a variable with the right type the
> number of QOM casts can be reduced which also makes the code more
> readable.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 60 ++++++++++++++++++++-----------------------
>   hw/ppc/mac_oldworld.c | 26 ++++++++-----------
>   2 files changed, 39 insertions(+), 47 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

