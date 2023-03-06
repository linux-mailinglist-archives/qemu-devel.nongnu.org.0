Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D707D6ACD54
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:57:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZG1F-0004uV-8h; Mon, 06 Mar 2023 13:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZG1D-0004sx-Hs
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:57:07 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZG1B-0002mQ-Jn
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:57:07 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so8894649wms.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678129024;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f4ZWAGbwE0Arl4x1axfNOvLS9fprmNU7QB6juTwPQGA=;
 b=vEsUsNipeJQYSxpUmRGm4fKeXEBoMpu2pBSDBjK//oZUNvyCEp2xqBpICiNa6wh90K
 qdvnZoj3oXfoCog3+CkdxwTx2Uu9d650WnuOSZ0QW4XRpQpqW/sZ0dgAySwybHuvfXL7
 mAEMnqflEuO/ig6sJwGep0sW9SZ2LNLa23QmDQdIuwy4J5YBr2kHtce555QfHrQ+1K5A
 6nsoquAnmICeQHMwsDD0QuKp0LNPYKnlW0RbfSfYnl1eAOScDLtxO40a5bME4KkPHLEM
 ou/d+BNFYcWXaM22i7OAIcLTp6alnbILnBbqab7X9C+bZEOaM4WYgRbDbyABX5LJVJj6
 JJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678129024;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f4ZWAGbwE0Arl4x1axfNOvLS9fprmNU7QB6juTwPQGA=;
 b=FVMpKIDm+sCL5tKeOmWbRE29pelAvE73X7jpKpZjDyU3fqP0B3lWDU+8VmWKivyH1N
 qVg3j3ODnVa/ErWpEkgsNHUJ3a/P+zdblH4DTdlDEUu5Y6v3hWtf873WQrRNJs+lYATZ
 +W9ZHRsOv4EfX6UpnvZult7+/Hu2Otyx5eBM9MYRzuyHAKK53MI0yaYlFXu7o190cDU3
 Fjljz7x5rv6blGZqggRi4sVkasNa6UVXnKyzQmltH5HJqUAjc421/bBPB2ozPsxUXSpG
 9qDMoCRuAkMgPiVzTD2xZ6opCF1l6aWwErakQc0HJudjTXEYKxlTreR2u0F/lq5Jzodp
 1+kw==
X-Gm-Message-State: AO0yUKU5BV+R5+fvrPZgdvMOSwlJpp2WMQD1Svm2OmKZgVK3mYAlad4Z
 hp0AGs52b3bL54sfAEVIg7xGXw==
X-Google-Smtp-Source: AK7set/jPuet7i0jyJ0n+NhoIUO1Z6xAEg9e210tVb4IgO8wwMQvXg9PSWxsGw8fxsb2+Gxi6naSwA==
X-Received: by 2002:a1c:f304:0:b0:3eb:29fe:734a with SMTP id
 q4-20020a1cf304000000b003eb29fe734amr10022896wmq.39.1678129023847; 
 Mon, 06 Mar 2023 10:57:03 -0800 (PST)
Received: from [192.168.1.115] (98.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.98]) by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c2d8b00b003eae73f0fc1sm10699405wmg.18.2023.03.06.10.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:57:03 -0800 (PST)
Message-ID: <4a9d742b-3069-09f3-3182-1c923ebb6080@linaro.org>
Date: Mon, 6 Mar 2023 19:56:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 00/23] Fix NB_MMU_MODES to 16
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
References: <20230306175230.7110-1-anjo@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306175230.7110-1-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/3/23 18:52, Anton Johansson wrote:
> This patchset fixes NB_MMU_MODES to 16 for all targets, meaning the
> macro is no longer target-specific.  16 mmu modes is large enough to
> cover all currently supported targets (12 arm, 10 ppc, ...), and is the
> maxiumum supported by the softmmu tlb api.
> 
> As mentioned by Richard in response to our RFC, softmmu tlbs are
> dynamically resized and so the overhead of an unused mmu index is fairly
> low.
> 
> The grand goal is to allow for heterogeneous QEMU binaries
> consisting of multiple frontends.
> 
> RFC: https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg04518.html
> 
> Anton Johansson (23):
>    include/exec: Set default `NB_MMU_MODES` to 16
>    target/alpha: Remove `NB_MMU_MODES` define
>    target/arm: Remove `NB_MMU_MODES` define
>    target/avr: Remove `NB_MMU_MODES` define
>    target/cris: Remove `NB_MMU_MODES` define
>    target/hexagon: Remove `NB_MMU_MODES` define
>    target/hppa: Remove `NB_MMU_MODES` define
>    target/i386: Remove `NB_MMU_MODES` define
>    target/loongarch: Remove `NB_MMU_MODES` define
>    target/m68k: Remove `NB_MMU_MODES` define
>    target/microblaze: Remove `NB_MMU_MODES` define
>    target/mips: Remove `NB_MMU_MODES` define
>    target/nios2: Remove `NB_MMU_MODES` define
>    target/openrisc: Remove `NB_MMU_MODES` define
>    target/ppc: Remove `NB_MMU_MODES` define
>    target/riscv: Remove `NB_MMU_MODES` define
>    target/rx: Remove `NB_MMU_MODES` define
>    target/s390x: Remove `NB_MMU_MODES` define
>    target/sh4: Remove `NB_MMU_MODES` define
>    target/sparc: Remove `NB_MMU_MODES` define
>    target/tricore: Remove `NB_MMU_MODES` define
>    target/xtensa: Remove `NB_MMU_MODES` define
>    include/exec: Remove guards around `NB_MMU_MODES`

As 24/23 we can remove the assertion in qemu_plugin_get_hwaddr().

Then NB_MMU_MODES is only used by CPUTLB in "exec/cpu-defs.h" and
in accel/tcg/cputlb.c.

