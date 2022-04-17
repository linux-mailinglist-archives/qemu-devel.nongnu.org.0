Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722885049B6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 00:30:07 +0200 (CEST)
Received: from localhost ([::1]:36454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngDPC-0004FE-1R
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 18:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngDOB-0003af-Oz
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 18:29:03 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:40759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngDO9-00034c-T2
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 18:29:03 -0400
Received: by mail-pl1-x632.google.com with SMTP id t12so11025701pll.7
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 15:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ta5CMLcnZlN5kLmG1N71BP/5tdqqJyS7kju7odql7AM=;
 b=Q7DzsxXlSrmtIEnVG+9EHpY58AqPaW8GmOHRIu6XJVd6kcHxmtINJ66BSUOVC1kFvE
 AAdEeWngxbupas07hFV47vFx0n1o0u2h1oxEXHfIQ4NsLowLOQx+WbuY78i+ScT4Sl8O
 BHsQAVMXCJay/TS4pzxdk8Dp5sxkBCTALa0nfJEqg2BCPBUUkc9/7yRtdsovw82SNBuh
 0sww9L7P2m4ZLk9pUQrLMbvX8BDi+iHpuPLknldU2DxMmtEontinya1ycfpajntnPwZS
 amj/wSVQ8Aw+qvqqR6tgN+/17XEHDBN61KoRkmQNaBR6fj11FBRGWfjNxGr/F1iEiyMN
 EB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ta5CMLcnZlN5kLmG1N71BP/5tdqqJyS7kju7odql7AM=;
 b=7+OChda0WFpfISECiW/SQq/qgp+1m4+E/P0/KjEyxbbZVdl2CCyMkVhq/TM+7SeRzN
 DKd5cqSQ661fW6yczfts4HNhcS+lBO+oRejRemk4CcWFsZDEEeHPzQ1opig5IeaNERG4
 FvaFwhuATYHb0MbfDpYPOzn6Xu9pPhiXCcLMRCC2Il1f/FyM2kUEnO9AhZ5iCksxn4xF
 tIji+vUoNFb4vdOti/EvkE4ZyT5fBpAj5Gu9ofMoKNuWy1gOWID5BDKZsw7gf+6Bulk3
 p93AY31p681Hw9BgQCREldZ84etDqnpI1b4aNIwMDEOxZfg585ZN6854PzxzAw3BVnzX
 jdEQ==
X-Gm-Message-State: AOAM531G91Orx80q+gst1UIJbI2XMCKxslVP3AEyFkRG4zlLV0JzBy/O
 vdT8qKQmihcKoAgQ276Ztcb4WA==
X-Google-Smtp-Source: ABdhPJwBJ4T7sZe5F2CVobLAuYWL44+OAZny5k4/m+dL67dvPZScX/HHvEp3/PuGEuCQfwDcxGRbmA==
X-Received: by 2002:a17:90b:4c84:b0:1c7:7769:3cc7 with SMTP id
 my4-20020a17090b4c8400b001c777693cc7mr15120749pjb.73.1650234539225; 
 Sun, 17 Apr 2022 15:28:59 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a056a00162100b0050a40f75a82sm8751447pfc.113.2022.04.17.15.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 15:28:58 -0700 (PDT)
Message-ID: <63910bde-bd78-4aad-8f4c-06571e2f8877@linaro.org>
Date: Sun, 17 Apr 2022 15:28:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 31/43] hw/loongarch: Add support loongson3 virt machine
 type.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-32-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-32-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +++ b/configs/devices/loongarch64-softmmu/default.mak
> @@ -0,0 +1,3 @@
> +# Default configuration for loongarch64-softmmu
> +
> +CONFIG_LOONGARCH_VIRT=y

Again, you can't add this file until you're ready to build.

We do get farther that patch 30, ending in

../qemu/hw/loongarch/loongson3.c: In function ‘loongarch_init’:
../qemu/hw/loongarch/loongson3.c:28:39: error: implicit declaration of function 
‘get_system_memory’ [-Werror=implicit-function-declaration]
    28 |     MemoryRegion *address_space_mem = get_system_memory();
       |                                       ^~~~~~~~~~~~~~~~~


Fix that, with proper include of "exec/address-spaces.h", and this can be the point at 
which we're ready to build.

Or you can push a few of these files back into the previous patch so that the build begins 
there, with zero machines registered (which should be ok, because there's no machine 
registered to be tested with qtest, but do double-check that make check succeeds).


r~

