Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495EF637A55
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 14:48:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyCYq-0007OD-E4; Thu, 24 Nov 2022 08:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyCYo-0007NJ-Gv
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 08:46:38 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyCYl-00088v-HI
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 08:46:38 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d1so2520300wrs.12
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 05:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8AaT/GhGTjy8ESIpRFvBoR67Yyx+6akM558wY5Ap6vc=;
 b=qnEG7HzEcwBr+Y4oc5y2Ue9OQ6iDoub//yLy0DYbfxPeHnMiJEJoOcnVhPZniXpTbu
 aEVUZuGtekJuzfe+hQzAnWZkqkXXx4H0c9pJDMnKhdRCxaGxoa+7w7VCUJ6It6HClidH
 PkFQPtw6MykPjgewZMgiXVMRjeLa9I/6Ab+3boGu8MIF4My4Za+yILFEzvrjm4pGXC2+
 ya5nksM/lZZxol0z2uriBhL+XIM+1NjhYZ1O8oqhJ3PIDhuMXA0+44lp1Xc1zGUpkS5V
 nIG8y5YBrLtCiUyFd6jkCPACSp/Dq9HgPrATThR+gMpVfUb3djUUOo9OXFdQlRC8zxW7
 y+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8AaT/GhGTjy8ESIpRFvBoR67Yyx+6akM558wY5Ap6vc=;
 b=GyIE8jH0T/sxtatZ/i+H5hpOtR/Pu87YxcZgbTkv5KhdLZp4OZAc8BQRUZvBUSKxVW
 Yg+bLK/6vY5efL99fkamcTROnyjjtqu5UaaxfgcL5+dgwOCOWY7zpp2ET7dSsvfwuB0c
 q7O0iwnXroucfzAz0+2cOZDiBCWVsmq0wl7I6lmyv6Fsz70tNx4A+O+MM0JDkIYy0ORr
 OEPXokb5xGsDl3FPZO6osAKGJkHUMOjlj/xmx4whZddOI4Ru7s6AF3YxhVhBxa5GO/nq
 0iAp4596Kuoc5iV4wiX8SaPDzk+Nae+IQhz4+gyVhmE5tWJWOxUcLgL3sem3IbA0PvLI
 H41A==
X-Gm-Message-State: ANoB5pm65CrlRvHKo6QVmsteeQMTn8iYvKswtTha9WdiAikkEztFfK6M
 i2apsjlU5uhX4vuR8xGxM56kZg==
X-Google-Smtp-Source: AA0mqf6YX7uqV9S4WYPXl/HVz8XiQYdLg8OeJzLjI7ijK1U5MJpbRvLld7dRGY5gi7+N9aNG9MZLwQ==
X-Received: by 2002:a5d:4568:0:b0:241:e8b0:cdcc with SMTP id
 a8-20020a5d4568000000b00241e8b0cdccmr6197800wrc.581.1669297593585; 
 Thu, 24 Nov 2022 05:46:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a12-20020adfe5cc000000b0022cc3e67fc5sm1340878wrn.65.2022.11.24.05.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 05:46:32 -0800 (PST)
Message-ID: <51024464-6fd6-4181-633d-1e261c19917a@linaro.org>
Date: Thu, 24 Nov 2022 14:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 24/11/22 12:50, Peter Maydell wrote:
> This patchset converts the TYPE_CPU base class and most subclasses
> to use 3-phase reset. (The exception is s390, which is doing
> something a bit odd with its reset, so the conversion there isn't
> going to be simple like these others. So I'll do that one
> separately.)
> 
> The rationale here is that we should be able to get rid of
> all the remaining uses of device_class_set_parent_reset()
> and remove/simplify some of the transitional code that's
> currently bridging between "legacy" reset and 3-phase reset.
> 
> NB: even with this series, it's not possible to usefully do
> anything requiring 3-phase reset of a CPU yet, because all
> CPU objects get ad-hoc reset by some code somewhere doing
> a cpu_reset() call on them, which will just do all 3 phases
> in order. I would like to try to address that eventually,
> but it's not trivial.
> 
> thanks
> -- PMM
> 
> Peter Maydell (19):
>    hw/core/cpu-common: Convert TYPE_CPU class to 3-phase reset
>    target/arm: Convert to 3-phase reset
>    target/avr: Convert to 3-phase reset
>    target/cris: Convert to 3-phase reset
>    target/hexagon: Convert to 3-phase reset
>    target/i386: Convert to 3-phase reset
>    target/loongarch: Convert to 3-phase reset
>    target/m68k: Convert to 3-phase reset
>    target/microblaze: Convert to 3-phase reset
>    target/mips: Convert to 3-phase reset
>    target/nios2: Convert to 3-phase reset
>    target/openrisc: Convert to 3-phase reset
>    target/ppc: Convert to 3-phase reset
>    target/riscv: Convert to 3-phase reset
>    target/rx: Convert to 3-phase reset
>    target/sh4: Convert to 3-phase reset
>    target/sparc: Convert to 3-phase reset
>    target/tricore: Convert to 3-phase reset
>    target/xtensa: Convert to 3-phase reset

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


