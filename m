Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16693A4DE5
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 11:26:01 +0200 (CEST)
Received: from localhost ([::1]:43728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrztx-00030h-0i
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 05:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrzsx-0001kP-3w
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 05:24:59 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrzsv-00007N-Md
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 05:24:58 -0400
Received: by mail-wr1-x433.google.com with SMTP id c5so8549809wrq.9
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 02:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1FS2Ma7EBdmGeV6lfapsdLTVBJ6p3aZau0Zn3X0DrU4=;
 b=SI7MjmtfZ779F2PLWKCiuoq9u1kfXWhkGZbr9i/IfMVkGGO0zplqQT5/si40DUgNym
 bXKbT63bYLgNzYkZwN7CcenddiPRuFzV6VNyKBSUMqSMNthbJ0E0BzewkWBYhRSJbL4Z
 rGXjjAzaxC61u22/hAXXf5XENvFTmXtti542VZVlXVoAzEYEwrG/y7eWnkytXpPHxlIG
 2pw6a22jfx5q+R4BHzDXGxNdkcYstRvyEVHiT75na+RNczPFnHOZNaNYXSvRIio5iY2W
 NVIavBtdLqYHuq92dOI28xAwyop9xN6cE0/8kTGS/xno9P+ukb4fIMv1yU/ppTHsu+zb
 9T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1FS2Ma7EBdmGeV6lfapsdLTVBJ6p3aZau0Zn3X0DrU4=;
 b=NM4j4FcaKvwPjFU7AombnVsLvSXr9Uw/JviOS3xbK6KucjtW+Sn6toJouStovk8qcH
 /ubIqACdmfhphyNhZTBuZubpPI6X52jRpP2fPbe5HnLQMMbD7FVCcR1AK3V+GQCA4/0+
 GkAOJiq/Amf9np3PFzdg2DzO+zfAthrwit17gedFq6T8ewd2bdN0K8bG2rxtCVOK9vX6
 P+EEK7aqFX99Xqb1F078Vu3KhP6R7Mu1iFmO8qJYbjlHVadk/z8MbEDmqAFQUHv/cexf
 Jd7tg4csZgkjL3oGXEOAHyIjX5paQ/zWbmhhUqpH2XJEw6ZhU7pw+6P1x0UAYBUQaiHr
 UDNA==
X-Gm-Message-State: AOAM532d/KtuL/hOt1jlgkWlOnd/thdECbuXCaTyL98xh3VTGszX9kHK
 PnYankPgFBsyhDS6+P04LAHtwkTEnqursQ==
X-Google-Smtp-Source: ABdhPJxK0S5YH71mm/HpVc+r4fw732iuqGPBpMqiw+dijyX3YwE1RGhxDHw1OZZFqySF4irTGEQ/ug==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr8127622wrs.176.1623489896015; 
 Sat, 12 Jun 2021 02:24:56 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id o5sm10115445wrw.65.2021.06.12.02.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 02:24:55 -0700 (PDT)
Subject: Re: [PATCH v7 24/27] Revert "tcg/tci: Use exec/cpu_ldst.h interfaces"
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <71f69282-4a60-1690-0582-5d343a9c2e78@amsat.org>
Date: Sat, 12 Jun 2021 11:24:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 5:01 PM, Richard Henderson wrote:
> This reverts commit dc09f047eddec8f4a1991c4f5f4a428d7aa3f2c0.
> 
> For tcg, tracepoints are expanded inline in tcg opcodes.
> Using a helper which generates a second tracepoint is incorrect.
> 
> For system mode, the extraction and re-packing of MemOp and mmu_idx
> lost the alignment information from MemOp.  So we were no longer
> raising alignment exceptions for !TARGET_ALIGNED_ONLY guests.
> This can be seen in tests/tcg/xtensa/test_load_store.S.
> 
> For user mode, we must update to the new signature of g2h() so that
> the revert compiles.  We can leave set_helper_retaddr for later.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 73 ++++++++++++++++++++++++++++++++++---------------------
>  1 file changed, 45 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

