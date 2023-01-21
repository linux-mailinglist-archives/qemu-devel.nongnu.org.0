Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E167662B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 13:21:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJCrX-0005IB-Q1; Sat, 21 Jan 2023 07:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pJCrV-0005Hm-UH; Sat, 21 Jan 2023 07:20:45 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pJCrU-0002Sf-5p; Sat, 21 Jan 2023 07:20:45 -0500
Received: by mail-oi1-x236.google.com with SMTP id p133so6594776oig.8;
 Sat, 21 Jan 2023 04:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gjcmu28houJFFDb7SqGn8prNAmqVY+nRT93YgNb87Ko=;
 b=C2M8BgE23dLo3/xC/gdjT4uecLbYNTTzpxgxI9GehFabpmmFZlQ32tNFMlq05cKX9l
 c2qW8g31idjty/4rx56idGOAsfxcd2SPUYfIR3Vr4XfSh0i5reqQ8j4BgqAU3W2OcGIA
 T1KiKXRdmoCuLkG1n2Ls32l5bwPkfpwqtvUqQF8RdOIrd3x606xjnY/Htuf/+6U1x1QQ
 ZLAuvN76qk9rXIa6qxeMJ+RX8wUWYfUaCSenTftViifq3mtm15+DYk2i/mtjy2s3NvhC
 8GXOFTtFmpWHDHXQx6FyHq98FW9d4XngcpkRbnb7E3bpcmvy5wH5FbaRAQlHkxT//r5V
 hpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gjcmu28houJFFDb7SqGn8prNAmqVY+nRT93YgNb87Ko=;
 b=iYRoQxaiaGX4LXPwTtlD/wJnkjMjQ9jlCyhGBm281ydrXD/zXu5M/mEaE0c/vW5wcr
 mGV9xx1dYdmadCfQ+Ghx8fncwp4o3F4lsiivW640+tIfnyQnJPX9xhMXRB3soz+5Eozb
 jOBgPKG7qgztwUdSObihpsuaiUu7zwZmxKNyHHuCUyO2CL9zlHxfGw7xy0IB/YHzMKzk
 +VU8NhiP/ykCMNaWNp0oxfg9D20J9ZCEPnlXmdV8kInUaPvSbOupIThDclgP+keSqEoI
 MJbyIvNTiTh72HS6B+ZkhaTVgDfc3ClXPFAwiHkv4jKypC/+f7aLJVEFFYayc1SLMfsT
 GtGA==
X-Gm-Message-State: AFqh2koivhhcK6ctrfEquMIIfqHTCR47+3fcstXrUgmVrU8kV/bWxZtV
 tFgF75x/5o+jFxugXnzQ/Sg=
X-Google-Smtp-Source: AMrXdXtZuJbqX8rm7HUf8DUs92+BsJedF1ppffTaLxc2m4xGzU+wnLBSsQFgT8l1UYJQ9S7X6Bl8lA==
X-Received: by 2002:a05:6808:17a6:b0:364:624d:ec1a with SMTP id
 bg38-20020a05680817a600b00364624dec1amr10846095oib.0.1674303642507; 
 Sat, 21 Jan 2023 04:20:42 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a544e12000000b00363760f96dcsm20199004oiy.42.2023.01.21.04.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 04:20:42 -0800 (PST)
Message-ID: <0332d7b8-83c9-e5ad-4659-f9095314e59d@gmail.com>
Date: Sat, 21 Jan 2023 09:20:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/2] tests/migration: add support for ppc64le in
 guestperf.py
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220809002451.91541-1-muriloo@linux.ibm.com>
 <835c0cce-ea5e-c9c7-fd6a-f0e6ebd7ed20@gmail.com>
 <c1d9c7eb-f129-eea1-5c65-9c5a1e80f184@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <c1d9c7eb-f129-eea1-5c65-9c5a1e80f184@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.092,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1/21/23 08:57, BALATON Zoltan wrote:
> On Sat, 21 Jan 2023, Daniel Henrique Barboza wrote:
>> Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,
> 
> Unrelated to this patch but just so you won't miss it, can you please take care of this patch too?
> 
> https://patchew.org/QEMU/20230118164512.1BCFB745706@zero.eik.bme.hu/

Already did when I queued this one. I was running some CIs first :D


Daniel

> 
> Thank you,
> BALATON Zoltan

