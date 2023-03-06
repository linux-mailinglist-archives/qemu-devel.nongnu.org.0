Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB086AD072
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:31:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIPh-00051C-SC; Mon, 06 Mar 2023 16:30:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZIPf-0004wB-Lp
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:30:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZIPd-0000q6-PI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:30:31 -0500
Received: by mail-wr1-x429.google.com with SMTP id q16so10282004wrw.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 13:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678138228;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iltf4e+hmIMEEQjwpNAYUL3JWGJ03fRQdOoaQpKNwew=;
 b=boCiHuUi2EgihMDUp7dz5r/5mAUdyVEw5ox9hWR5hKpqHrT5MOD118PikwS99FtPP/
 nlTvkiIbOIeVFcUjdOv2PuBoBPronQ27eC5RqZywI9CXGLVUmxkD6CCX8YX3Y5hLAW7Z
 xI813ZrriylX3UQnRrVzCDyALnJGwE7nzBYAhU+Cx1FlXAK5UpX33qlHFoLGz07UmJO+
 wImW0RislaVNC5h4PwBicUmh0foWIKWxtoB7G0E3g+3yrBM2KiOityfKy1pJTpgbxO96
 ++WIRWd14LorvcV1UYUN0XTMRbJOoznF1u9FgjVTjWWbKJ5hnAqT2x/KYp/HnVukTHzw
 MzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678138228;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iltf4e+hmIMEEQjwpNAYUL3JWGJ03fRQdOoaQpKNwew=;
 b=AjeZHsSyVMrdSptbOSv+fg5qVVcwtafIM7E4RV5w4MrIZ2y3rxcoz9HCDLcO0dWxyn
 ZtUZvwBNfGy7f7vVOQsokCNM1npHKji7LxBqg215wliMA1tAf4aKUpyRJRvCP+E+r/eP
 Rf3zMBPBCUFu0OyWeRKo8cIxajih0YbCRDVOiLhJn3IkSMjYwEce0+klCFb5En5+Lvjb
 XLxYMalj79C5hClnEGAMOOqAzOR+AOQOSzWDEvra5o38UgN8y+3dpmFWdepGOkVIdySx
 ZQ5TLODdT9EVcN2Sp1CY5idg44zDlp432uXmEuKa27O50M+wUQG2KuWhURyufPqK1gNz
 +rXw==
X-Gm-Message-State: AO0yUKXfLiIkb3Ttsvkz+6VFLoGMxk0rd8YzgEZyWBbMWPextFMdVpXC
 txD88ki0B89pZYJg3EAyDApyug==
X-Google-Smtp-Source: AK7set/1B/+oBridXjjaAgWnB8jemGOodGIkFeDCV7CPQTLtGMpQZG+495ZLCbJGv6tYyhuWkJMk8g==
X-Received: by 2002:a5d:6689:0:b0:2c7:a39:7453 with SMTP id
 l9-20020a5d6689000000b002c70a397453mr8270988wru.54.1678138228078; 
 Mon, 06 Mar 2023 13:30:28 -0800 (PST)
Received: from [192.168.1.115] (92.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.92]) by smtp.gmail.com with ESMTPSA id
 l13-20020adfe58d000000b002c569acab1esm10858831wrm.73.2023.03.06.13.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 13:30:27 -0800 (PST)
Message-ID: <eb9e8a81-6573-65a7-4a73-46d6155770fa@linaro.org>
Date: Mon, 6 Mar 2023 22:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 00/23] Fix NB_MMU_MODES to 16
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
References: <20230306175230.7110-1-anjo@rev.ng>
 <4a9d742b-3069-09f3-3182-1c923ebb6080@linaro.org>
In-Reply-To: <4a9d742b-3069-09f3-3182-1c923ebb6080@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 6/3/23 19:56, Philippe Mathieu-Daudé wrote:
> On 6/3/23 18:52, Anton Johansson wrote:
>> This patchset fixes NB_MMU_MODES to 16 for all targets, meaning the
>> macro is no longer target-specific.  16 mmu modes is large enough to
>> cover all currently supported targets (12 arm, 10 ppc, ...), and is the
>> maxiumum supported by the softmmu tlb api.
>>
>> As mentioned by Richard in response to our RFC, softmmu tlbs are
>> dynamically resized and so the overhead of an unused mmu index is fairly
>> low.
>>
>> The grand goal is to allow for heterogeneous QEMU binaries
>> consisting of multiple frontends.
>>
>> RFC: 
>> https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg04518.html
>>
>> Anton Johansson (23):
>>    include/exec: Set default `NB_MMU_MODES` to 16
>>    target/alpha: Remove `NB_MMU_MODES` define
>>    target/arm: Remove `NB_MMU_MODES` define
>>    target/avr: Remove `NB_MMU_MODES` define
>>    target/cris: Remove `NB_MMU_MODES` define
>>    target/hexagon: Remove `NB_MMU_MODES` define
>>    target/hppa: Remove `NB_MMU_MODES` define
>>    target/i386: Remove `NB_MMU_MODES` define
>>    target/loongarch: Remove `NB_MMU_MODES` define
>>    target/m68k: Remove `NB_MMU_MODES` define
>>    target/microblaze: Remove `NB_MMU_MODES` define
>>    target/mips: Remove `NB_MMU_MODES` define
>>    target/nios2: Remove `NB_MMU_MODES` define
>>    target/openrisc: Remove `NB_MMU_MODES` define
>>    target/ppc: Remove `NB_MMU_MODES` define
>>    target/riscv: Remove `NB_MMU_MODES` define
>>    target/rx: Remove `NB_MMU_MODES` define
>>    target/s390x: Remove `NB_MMU_MODES` define
>>    target/sh4: Remove `NB_MMU_MODES` define
>>    target/sparc: Remove `NB_MMU_MODES` define
>>    target/tricore: Remove `NB_MMU_MODES` define
>>    target/xtensa: Remove `NB_MMU_MODES` define
>>    include/exec: Remove guards around `NB_MMU_MODES`
> 
> As 24/23 we can remove the assertion in qemu_plugin_get_hwaddr().
> 
> Then NB_MMU_MODES is only used by CPUTLB in "exec/cpu-defs.h" and
> in accel/tcg/cputlb.c.

I forgot, series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


