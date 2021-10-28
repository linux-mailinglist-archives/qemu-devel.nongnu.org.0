Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6949C43D835
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 02:42:35 +0200 (CEST)
Received: from localhost ([::1]:45216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftV4-00047i-A4
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 20:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftSF-0002bb-TW
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:39:39 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftSE-00054q-CN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:39:39 -0400
Received: by mail-pf1-x42f.google.com with SMTP id x66so4285338pfx.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BhHn4quCYSaL0kFYmvR35Y6W53xIe7rII5FdTIqTbq4=;
 b=Je11Jyo7lskzshlapPrg8cEjBbH9tdnio6iqWAJHs2pbHXuFaUjumI/AdvuMdgZzil
 Y94LkGu9km80Waepu3m858oe2XsJpMYlicBJIipOGAdkaWQd+kS013q/PGDmHxRBq0W2
 zPXy/dROc59Bqh+JB94LxVb/ZAsdwV4QPEbeBjXmH86RLq0xe3NU7hnSlK4PhTcD63Hw
 R9syVsbUmwCInyCsu7byVARGGAbfSXMjAe2dsTU02naiNKTqLFb24jmQpMuGCBLyD91Q
 8iy+LLULIpE8ZIQy2ZGst0s2jP1NHPTp9aztLG3UHi9oBobH4e+kSEMgG0mkC3hlpdmV
 zovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BhHn4quCYSaL0kFYmvR35Y6W53xIe7rII5FdTIqTbq4=;
 b=xws1CAhxi4xFIp/ftEHwLCLcND9KjUTs3wQTcm+Fsw05M5denkLFTaozp6x+uwwWA9
 zAse4LpUoaHeF5/GcxrSapIRDHVEDjdPTj9wTgxOOp1wQAKcr/WANOHWl4SGA+RJaWO9
 qaHFSFXWbOpAzv/WAROhAgiFJSt4Lac86lFhGDNJi8RmC5A5aEAbHd/uyDHJkIudW3Wd
 wjLBIDCl9NoBCpdnKw1CNv8V372SG1iLgHz1glj46dmRz+sX3wMPZciCZur43SwM80vE
 SMBtD8/61NTuoLtpXk0/hfkxXrR6cprmQkpFJEhsZkaHWFWtJU6v2FUwZ0cN/RXtpCSV
 +c3w==
X-Gm-Message-State: AOAM531bJN9B0uN8q1yYifQ5dHQm3FdXiiCcfyPhZkNFoEmEo6CgZ7ea
 7NPTIJQCVyXZT7ARpnWH+mHAhw==
X-Google-Smtp-Source: ABdhPJxQJRmNtLVGNRny25rc4VyVKEw9nvf2Lxh07/QBB8+ij6KPxC6IWetw0GHN47+6pMJSFCW40w==
X-Received: by 2002:a65:648b:: with SMTP id e11mr823975pgv.138.1635381576538; 
 Wed, 27 Oct 2021 17:39:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x5sm1109767pfh.153.2021.10.27.17.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:39:35 -0700 (PDT)
Subject: Re: [PATCH v3 10/18] hw/intc/sh_intc: Rename iomem region
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635371671.git.balaton@eik.bme.hu>
 <dd33ff8b51028f1828647e6d0f5080208d6151cf.1635371671.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5197a821-2841-8543-503a-5dda8ef850e7@linaro.org>
Date: Wed, 27 Oct 2021 17:39:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <dd33ff8b51028f1828647e6d0f5080208d6151cf.1635371671.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 2:54 PM, BALATON Zoltan wrote:
> Rename the iomem region to "intc" from "interrupt-controller" which
> makes the info mtree output less wide as it is already too wide
> because of all the aliases. Also drop the format macro which was only
> used twice in close proximity so we can just use the literal string
> instead without a macro definition.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/intc/sh_intc.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

