Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418ED32E772
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:53:20 +0100 (CET)
Received: from localhost ([::1]:59338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI91D-0002pz-BI
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI90R-0002HK-IW; Fri, 05 Mar 2021 06:52:31 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI90P-0001l1-FX; Fri, 05 Mar 2021 06:52:30 -0500
Received: by mail-wr1-x435.google.com with SMTP id b18so1769680wrn.6;
 Fri, 05 Mar 2021 03:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nFOUJppvqyxnsTK5V+/ojQiNvnFI3JigyS0du9Yf+sM=;
 b=KrPQ3tZV/olg1oIFzJltVQvl/8F7RZsC/ue7n1eN7Y0sL3Fez8V2iP+sZNs9/bEIfS
 +rrg3yJZO9XRztkBYr2qAqc7qfDHNkAk9Uv+bXfqiGb+BWuIIsLtgq4AiTJRw9jaopcm
 H3qqNsrrKnbkvN+eURdKI0dExEU56/oEOoEK8sFcID/cp+E2dXSFz+VziEmPJ4RJ099O
 yws7pC0RW9hIt3qy/5Icge9eBricCtYlgy6ETRJoEO3jEceMzVPqb6XP11myM9Ek+WOH
 VZtdxZDh1JRokDicY5FUnG4gLHSdqOLyIOlsDzsLtM96izclxlKc7xmhOAUSuw2ROSry
 l8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nFOUJppvqyxnsTK5V+/ojQiNvnFI3JigyS0du9Yf+sM=;
 b=MQDPAi7pK6BqQMuZe4gILCeKQu6Ths3LlBleY43ncWjbRCxJ/cg0Fgx7BxdvIT48vD
 DdJgw7DE7pUTuqgo2WV4DfKDeTM4St0o/MqkqA71aaum9Z21s2BGTd7rgym/EVV2rpRc
 DZFre2/n71UxGPhUOXSF59H3ZGIUkE4RPw0mPAww5ytADgPkZKNPllcqQMhA/oCVbPB3
 8jXJNuijTkmGFMTm4+uACUrfMVWFyECddbOPHktXBLLL8h0wfVC4YgpqP5CsU+pLR1iZ
 BcZmLkf7EO9BZeoPIQxa+Db6jEAt1ctgE8cn2DlC9xutfRIsPFYRJnuTz2GqSONDIXx2
 TlbQ==
X-Gm-Message-State: AOAM533X+bePVe6gqcKOQ7f++MnvS41rcEl64QLGpnhXbpCzKGb0SgkB
 y24D0miGg4aPkOE23nYeTcW6KfSjOXs=
X-Google-Smtp-Source: ABdhPJzi3Y5yjcTrxffvHck5n9ZqC71C2CfdsqsEd5Bbvr5tuE6G+dKplntnpOyZ2IzFR8BxnrQALQ==
X-Received: by 2002:a5d:640b:: with SMTP id z11mr8724263wru.327.1614945147150; 
 Fri, 05 Mar 2021 03:52:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z1sm4259675wru.95.2021.03.05.03.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 03:52:26 -0800 (PST)
Subject: Re: [PATCH v2 00/24] hw/arm: New board model mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <167e1806-b91c-4036-6d88-d09056dec1d7@amsat.org>
Date: Fri, 5 Mar 2021 12:52:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

On 2/15/21 12:51 PM, Peter Maydell wrote:
> This patchseries implements a new board model in the mps2/mps3 family,
> based on Application Note AN524:
> https://developer.arm.com/documentation/dai0524/latest/

> Peter Maydell (24):
>   hw/arm/mps2-tz: Make SYSCLK frequency board-specific
>   hw/misc/mps2-scc: Support configurable number of OSCCLK values
>   hw/arm/mps2-tz: Correct the OSCCLK settings for mps2-an505 and
>     mps2-an511
>   hw/arm/mps2-tz: Make the OSCCLK settings be configurable per-board
>   hw/misc/mps2-fpgaio: Make number of LEDs configurable by board
>   hw/misc/mps2-fpgaio: Support SWITCH register
>   hw/arm/mps2-tz: Make FPGAIO switch and LED config per-board
>   hw/arm/mps2-tz: Condition IRQ splitting on number of CPUs, not board
>     type
>   hw/arm/mps2-tz: Make number of IRQs board-specific
>   hw/misc/mps2-scc: Implement CFG_REG5 and CFG_REG6 for MPS3 AN524
>   hw/arm/mps2-tz: Correct wrong interrupt numbers for DMA and SPI
>   hw/arm/mps2-tz: Allow PPCPortInfo structures to specify device
>     interrupts
>   hw/arm/mps2-tz: Move device IRQ info to data structures
>   hw/arm/mps2-tz: Size the uart-irq-orgate based on the number of UARTs
>   hw/arm/mps2-tz: Allow boards to have different PPCInfo data
>   hw/arm/mps2-tz: Make RAM arrangement board-specific
>   hw/arm/mps2-tz: Set MachineClass default_ram info from RAMInfo data
>   hw/arm/mps2-tz: Support ROMs as well as RAMs
>   hw/arm/mps2-tz: Get armv7m_load_kernel() size argument from RAMInfo
>   hw/arm/mps2-tz: Add new mps3-an524 board
>   hw/arm/mps2-tz: Stub out USB controller for mps3-an524
>   hw/arm/mps2-tz: Provide PL031 RTC on mps3-an524
>   docs/system/arm/mps2.rst: Document the new mps3-an524 board
>   hw/arm/mps2: Update old infocenter.arm.com URLs
> 
>  docs/system/arm/mps2.rst         |  24 +-
>  include/hw/arm/armsse.h          |   4 +-
>  include/hw/misc/armsse-cpuid.h   |   2 +-
>  include/hw/misc/armsse-mhu.h     |   2 +-
>  include/hw/misc/iotkit-secctl.h  |   2 +-
>  include/hw/misc/iotkit-sysctl.h  |   2 +-
>  include/hw/misc/iotkit-sysinfo.h |   2 +-
>  include/hw/misc/mps2-fpgaio.h    |   8 +-
>  include/hw/misc/mps2-scc.h       |  10 +-
>  hw/arm/mps2-tz.c                 | 632 +++++++++++++++++++++++++------
>  hw/arm/mps2.c                    |   5 +
>  hw/misc/armsse-cpuid.c           |   2 +-
>  hw/misc/armsse-mhu.c             |   2 +-
>  hw/misc/iotkit-sysctl.c          |   2 +-
>  hw/misc/iotkit-sysinfo.c         |   2 +-
>  hw/misc/mps2-fpgaio.c            |  43 ++-
>  hw/misc/mps2-scc.c               |  93 ++++-
>  17 files changed, 680 insertions(+), 157 deletions(-)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


