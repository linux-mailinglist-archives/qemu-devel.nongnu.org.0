Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBE4228738
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 19:23:20 +0200 (CEST)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxvz4-0003BK-M0
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 13:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jxvxs-0002S6-MX
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 13:22:04 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:35533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jxvxr-0006cw-8N
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 13:22:04 -0400
Received: by mail-pl1-x641.google.com with SMTP id x9so10556712plr.2
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZEx9mwXay3nVfsKJiKKT457CRer329MhMAoaD+G4I1U=;
 b=xV/RNGZqXOlleXt012rPEGvBM0Rgj/LbBHIDlQ0x0u1M7QNJ9LZhv7SEFdFgPm6ImZ
 1kkSfKg0eKIhPE9zv5OBDHp69xxbxhvoqemVSYMiV4hn4p1M5JKJAwXy/gTrQ/797X41
 /lwrXOPcdNin/1H6gcwN1vWqRpvUNp+0Coyr9tQv+1JEHCNl+caO9G4K4xDRpt1iMjpP
 guveS04s6C2Cdh74vByMQIdX1F3eGfmMStJEvjiALhNyL182NPE4nhtDvls7LjjsCInn
 aJTZutoQHFsDCEDmJM8lMQwjIByGYuaVDbvMZv6optHBVEZjBLm/KX+aXcU7wy90YwVg
 SQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZEx9mwXay3nVfsKJiKKT457CRer329MhMAoaD+G4I1U=;
 b=Wz8shgqLGB95w7k9AJj/Ucg/bkeT+HkHsbLjCn/tC+OYJefuIyNZBSl6taCzwURS68
 yKp06iQHIHRtnRp0/2v7AXaFNFtdSYf9mKNRSrK3nnNkPA0hxDvJDSzKL/3h6+fq2xa8
 y0lJkWlUn42oxqDDo7wD1s98RjrVJ3Yjzx3/fDjTZXwwZNrWHx7FZ2Omb74Cx2VmtZFq
 v01ogWWCspiBvu1z3w930mP94TbmPm2z30F9+yvYwdHFyr/pwHhH91cjTf4n4yjyKq2n
 5ijDHdKMP2efxJmbDhDq8jL5cKbf1WPMeRi5TV0MZOz9Ktz5ZhO2nvAiX8TdyaNIy+Ua
 pX5A==
X-Gm-Message-State: AOAM532NAuoCqVpDpOdDgM/YeUh7uTtotLwFxZ/p0FMV9ar24HrFKUbg
 2c87Jp91SxEtfcQ1hq2VTESPjSKDUxk=
X-Google-Smtp-Source: ABdhPJyOC94AJ5v/k9ppiSKN6pBEMCEB1aWdkW66m9dZDW4GI/0nMVnE4EbOOM9YFGa65RCVFgjC3g==
X-Received: by 2002:a17:90a:d3d7:: with SMTP id
 d23mr5790986pjw.232.1595352121652; 
 Tue, 21 Jul 2020 10:22:01 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 l134sm19204852pga.50.2020.07.21.10.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 10:22:00 -0700 (PDT)
Subject: Re: [PATCH for-5.1] docs/system/arm/virt: Document mte machine option
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200721143556.19484-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0459473-bf58-79c7-4c5a-4c0da25b7818@linaro.org>
Date: Tue, 21 Jul 2020 10:21:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721143556.19484-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/20 7:35 AM, Peter Maydell wrote:
> Commit 6a0b7505f1fd6769c which added documentation of the virt board
> crossed in the post with commit 6f4e1405b91da0d0 which added a new
> 'mte' machine option. Update the docs to include the new option.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/virt.rst | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

