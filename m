Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747BA69EA50
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:40:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUbIK-0002SD-DL; Tue, 21 Feb 2023 17:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUbID-0002PK-KK
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:39:25 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUbI4-0001QT-9K
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:39:17 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t15so6112338wrz.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jNwA0OxyMbe4wUs4B2ABJMwO0GTBUK0L8p13VSvtx9A=;
 b=NXpeXTV+SAEaU6G0X6qwESb4rIxGiubZs9QpKIjuH6ObRnkh0cnHLUV8alVBW1naGu
 4KEDegaiZkuUXx4qvoMCDJL2osssnq8BkFT9pPvsAAMj1ZKtBKPEP6ltSpL75hwJ5pWm
 fmZBLbTaLsCtYJjp/bDVJW3RuMsbo74gI1WrapUTOYEkGHS36KWlcfFo2p8OZpVv3fOz
 VeVAt5uL/4W8kvfWXZO0NZwWV7mzUwo6cK9g3QbMYH1H7psfXkGQtlHUonVl6hEH5E1p
 oJnl88TPZ5HM/9241fVwcs6lcoE3YgLeOBNgJWk+12o8n73rdDUNL8YdlQZqloOQg6ys
 rXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jNwA0OxyMbe4wUs4B2ABJMwO0GTBUK0L8p13VSvtx9A=;
 b=kMPYAoR9IXg0PDj2DKyReZXwcrcHTp7QSJEAb4eeWnJCoWAwnNR6LECc58hbynczkU
 cJKBI3EV9rACZRlJX7JQLtttgU2Ao7jr65X5gOFdWy7gRljslvj7fnrt1A4tYrmok8yU
 d7kiBKXxWt4Xt98NMBVXENwwR3aZYrTROIdQKoUnv5dZ15AXW5AadIRQ5UO6j8VTOJbf
 reChqgEvG/qHRrZbAyLEWvVFHk37sfPxvYrMOuOXA0hRZswZWgk4H7nJXdU0okb7gPo+
 2V3v1mvFR+uIaUhlT4OlG7rTOkGZzT4IpEwLnlSanQDLe12QSvYRvgkcAOMKLml9ZUC6
 gkKQ==
X-Gm-Message-State: AO0yUKWwuoj2GM/HW+FVaHlYez8OjrW4UyrJzBztAQS5RDgOx1t4GuI5
 BGSAFeXGRKAqUT0ZpxV2EvpvZw==
X-Google-Smtp-Source: AK7set8/+bAzu9JNmShP+iVBdx2MgOtq7uxIN0KXYuFO9mYmDAqFjMlj7nnEVrg2Qp06gB7Llipg6g==
X-Received: by 2002:a5d:678a:0:b0:2c3:e142:5fd0 with SMTP id
 v10-20020a5d678a000000b002c3e1425fd0mr6119672wru.49.1677019154225; 
 Tue, 21 Feb 2023 14:39:14 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a5d6351000000b002c70a68111asm211753wrw.83.2023.02.21.14.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 14:39:13 -0800 (PST)
Message-ID: <ce377100-946e-7dd7-2795-ab63d484f15b@linaro.org>
Date: Tue, 21 Feb 2023 23:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/27] Replace TARGET_TB_PCREL with CF_PCREL
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
References: <20230221221818.9382-1-anjo@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221221818.9382-1-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 21/2/23 23:17, Anton Johansson wrote:
> This patchset entirely replaces the macro TARGET_TB_PCREL with
> a field in TranslationBlock.cflags called CF_PCREL, and is a
> first step towards removing target-specific assumptions from
> non-target/ directories.
> 
> The grand goal is to allow for heterogeneous QEMU binaries
> consisting of multiple frontends.
> 
> RFC: https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg04518.html
> 
> Changes in v2:
>    * Setting of CF_PCREL (previously patch 3) was split in two and moved
>      up front (to patch 2 and 3);
> 
>    * Replacing of TARGET_TB_PCREL (previously patch 2) was split into
>      four patches (patches [4,7]), one for each affected submodule;
> 
>    * Removal of TARGET_TB_PCREL (previously patch 3) was moved into
>      separate patches, one for each submodule (patches [8,10]);
> 
>    * Patch 11 was introduced in response to feedback, and removes
>      CF_PCREL checks in functions in tb-jmp-cache.h, these functions were
>      always called in a context where CF_PCREL was already being checked.
>      These tb-jmp-cache.h functions were then removed in favour of manual
>      inlining;
> 
>    * Patches [12,26] replaces calls to tb_pc() with a member access
>      tb->pc, the motivation being that tb_pc() was (almost) always called
>      in a context where CF_PCREL was already being checked;
> 
>    * Finally patch 27 removes tb_pc() which is no longer used.
> 
> Since changes are spread across multiple submodules we ended up with a
> lot of patches. Patches [11,27] still need review.
> 
> Anton Johansson (27):
>    include/exec: Introduce `CF_PCREL`
>    target/i386: set `CF_PCREL` in `x86_cpu_realizefn`
>    target/arm: set `CF_PCREL` in `arm_cpu_realizefn`
>    accel/tcg: Replace `TARGET_TB_PCREL` with `CF_PCREL`
>    include/exec: Replace `TARGET_TB_PCREL` with `CF_PCREL`
>    target/arm: Replace `TARGET_TB_PCREL` with `CF_PCREL`
>    target/i386: Replace `TARGET_TB_PCREL` with `CF_PCREL`
>    include/exec: Remove `TARGET_TB_PCREL` define
>    target/arm: Remove `TARGET_TB_PCREL` define
>    target/i386: Remove `TARGET_TB_PCREL` define
>    accel/tcg: Move jmp-cache `CF_PCREL` checks to caller
>    accel/tcg: Replace `tb_pc()` with `tb->pc`
>    target/tricore: Replace `tb_pc()` with `tb->pc`
>    target/sparc: Replace `tb_pc()` with `tb->pc`
>    target/sh4: Replace `tb_pc()` with `tb->pc`
>    target/rx: Replace `tb_pc()` with `tb->pc`
>    target/riscv: Replace `tb_pc()` with `tb->pc`
>    target/openrisc: Replace `tb_pc()` with `tb->pc`
>    target/mips: Replace `tb_pc()` with `tb->pc`
>    target/microblaze: Replace `tb_pc()` with `tb->pc`
>    target/loongarch: Replace `tb_pc()` with `tb->pc`
>    target/i386: Replace `tb_pc()` with `tb->pc`
>    target/hppa: Replace `tb_pc()` with `tb->pc`
>    target/hexagon: Replace `tb_pc()` with `tb->pc`
>    target/avr: Replace `tb_pc()` with `tb->pc`
>    target/arm: Replace `tb_pc()` with `tb->pc`
>    include/exec: Remove `tb_pc()`

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


