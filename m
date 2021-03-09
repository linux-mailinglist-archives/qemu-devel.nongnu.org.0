Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5920933321D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 00:57:48 +0100 (CET)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmEV-0006Ci-EE
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 18:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJmAE-0000M0-5W; Tue, 09 Mar 2021 18:53:22 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJmAC-0001zC-MW; Tue, 09 Mar 2021 18:53:21 -0500
Received: by mail-ej1-x636.google.com with SMTP id jt13so33176193ejb.0;
 Tue, 09 Mar 2021 15:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ks/qHO8gXteSEoozYIlFwyUZlA1NBzovI2rM3yS4TbM=;
 b=HOEZ2q/U1/WD1hzvoXZP/303I46RNSx7rKnEn4MrB7sIQ7CDhPn25q7gXe2nFwfD8J
 dCrlTegYA6CYHB5pKh5taZBaH3yO2MkUbOuUrQ4amogFA3NfLmE8MW3i5QNfhl2FHbAe
 7wIjt6XCDH1KzeBfNdfrbhF70Ehszj2kJ53WcmchhX74aW7FvBORzmx2Ztu3jSVVof3t
 dqAQ+sZHvnx6PxhlWyR89nCpimUALxpsgTyQuJzPYtAmdTcLheBT0lpLfb+sjp6vshgA
 4KV+Vjlz2236N/e0E9vqFI2KX8fXL2TpZo/w/7M2XTrCVAh4j/VSFAIbvLuZ9HBCzCfz
 UZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ks/qHO8gXteSEoozYIlFwyUZlA1NBzovI2rM3yS4TbM=;
 b=OD8xrsZD/ECdCOY4umjbxkGiMuuj3u+KWQ8aURgZmyRLqZGFZ/i8JPfRuT7H0NoP82
 rkRiGzBBFUn7H/d+b0mhsngfYZ4M8cUjMOjRHVGhtaz1teOtUc0YtVtQOilQUu/xkbap
 g5+PKCrUUzVmO2DUCD1LooPXa2ZooMXnUovpxeUrr48K4OXMy5jedsDhUrvPnZo4REfb
 zL56mY3sY2rWWuCiudmzUYhfveXYUSgzoohGHBnY/R9IWAC+kziwoYHqJWuD+GDYzEGQ
 hcFoamlm/Q6XDKqmvbKJfkYGp6sXty+yxODLVTzMVhU5lGJJQk6xjF5aRK81uW3DUmnn
 lZaw==
X-Gm-Message-State: AOAM5327y/QdvaRw58FuZLnhCD7xZx66UuADD8T/QOIXUjOcmAM13YDy
 Y2VNv8SyS8WgjjWsL7szu1XYGn9H91A=
X-Google-Smtp-Source: ABdhPJzATat0dptZrQpq2um3TLHUKfyYWy6Du9O7uwSQFABGXXNqe2Z+orUdLYrsklZhw+x3FdO7gA==
X-Received: by 2002:a17:907:16a8:: with SMTP id
 hc40mr606131ejc.40.1615333998487; 
 Tue, 09 Mar 2021 15:53:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n2sm8995053ejl.1.2021.03.09.15.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 15:53:18 -0800 (PST)
Subject: Re: [PATCH] hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210302080531.913802-1-f4bug@amsat.org>
 <5d3abcbd-99f0-0c43-4493-9881a38ae980@amsat.org>
 <8494e9f1-b4d9-10bb-451d-54807d4c1deb@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <58da423e-ca71-1ee0-c0a5-ec70408375fd@amsat.org>
Date: Wed, 10 Mar 2021 00:53:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8494e9f1-b4d9-10bb-451d-54807d4c1deb@eik.bme.hu>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 12:41 AM, BALATON Zoltan wrote:
> On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
>> ping for review?
> 
> This is included in my pegasos2 series as 6/8 replacing half of a
> similar patch from my original version. Since I've reported it I don't
> think I should be also reviewing it but it's quite trivial so may not
> need that much review.

Forwarding a patch doesn't mean you have reviewed it :/

If you can provide a formal R-b tag, then I can queue this or the
one in your series.

Thanks,

Phil.

