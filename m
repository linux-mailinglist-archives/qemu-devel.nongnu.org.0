Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66352440857
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 12:07:42 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mglH2-0003Zq-U0
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 06:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mglEq-0002nX-6E
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 06:05:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mglEl-0001jd-3S
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 06:05:21 -0400
Received: by mail-wr1-x433.google.com with SMTP id p14so20540608wrd.10
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 03:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VVqVMaDZqJHBwvbTn89uiLyzOwPvjVH8xcsRCuAIOQI=;
 b=oK7XE3tHIIVMGtObn5+ynOckWUcYGHHGLTUI8eAsv869aQC1xc987xYPVn73q4J0/1
 0aEpI2hESoarqo8edY1PHgk+YJMUpbr1xm7hREeMu0vY6bXKjkWCdtqSo60xMcqdhKb1
 H41icD1C7lzjp2MCcqxoUdrfvMIQZKX9hJZT1S4UEmnJ1QX0bNmRjLtGOX/Dwc6dn8wo
 fKhGs3Dp2TsGo/5rRATt/IhUgFEoCNpjezudpHdZmida9KzBMyzybw/Rf/dw2PAjZChP
 CiURSGaKWvBlDZ+QvNfqai4qhlMGHsdu7gVwNd2ucgbnnLQLFDH+VAcf0DQxxod2XVFr
 YLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VVqVMaDZqJHBwvbTn89uiLyzOwPvjVH8xcsRCuAIOQI=;
 b=6vm9IiMSPxzvusBHMOewuKuiL+dWG9D6b9+Go4EpI01NV9i04fUozugqSj+pJlnH4r
 9hkj7cYIFtaIq2RtrwJDHXwTXM1ZoVq/93wghLrI7oak85vE3ILtdcp6kqdirs2jmfaJ
 G3UdlBGeWKkt3qSoLFg/rcyrxC9wyjnADiFQaEg60nptew6GofQF86+Nw5OX8KKVk122
 0ODjzJVsGLmg5RIMtRmOQsxy9qZYZEIMdDe7ORh0xwziuuQv6iQVmx6qwnSuVE/bgopA
 LDklB/AcVc1CEJkeRK+nnsr6kCeUwFIckHcgvz2bs5BczORttCyaFBsU8ShxVGtOAOMa
 UetA==
X-Gm-Message-State: AOAM533/4hNrP2LRqDlFsBR3MjIQNy2s6OFw8iAvw9h1KEWWfE/Neaba
 aH9dXNuNZqQWG7zwTjjsEUo=
X-Google-Smtp-Source: ABdhPJwpKS2FpSx9z6E7kzY/BiLiU66oEPwWr/McsIVx0eXO55jNJVyDx65DPBTkKtixxgLSm3/nog==
X-Received: by 2002:adf:fe88:: with SMTP id l8mr301652wrr.208.1635588316916;
 Sat, 30 Oct 2021 03:05:16 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i10sm9877253wrf.8.2021.10.30.03.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 03:05:16 -0700 (PDT)
Message-ID: <e3b94e2b-0dad-f7aa-779e-3684b7c956d4@amsat.org>
Date: Sat, 30 Oct 2021 12:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 00/30] More SH4 clean ups (including code style series)
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635541329.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <cover.1635541329.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 23:02, BALATON Zoltan wrote:

> BALATON Zoltan (30):
>   hw/sh4: Coding style: Remove tabs
>   hw/sh4: Coding style: Fix multi-line comments
>   hw/sh4: Coding style: White space fixes
>   hw/sh4: Coding style: Add missing braces
>   hw/sh4: Coding style: Remove unnecessary casts
>   hw/sh4: Fix typos in a comment
>   hw/sh4: Change debug printfs to traces
>   hw/sh4/r2d: Use error_report instead of fprintf to stderr
>   hw/char/sh_serial: Do not abort on invalid access
>   hw/char/sh_serial: Rename type sh_serial_state to SHSerialState
>   hw/char/sh_serial: Embed QEMUTimer in state struct
>   hw/char/sh_serial: Split off sh_serial_reset() from sh_serial_init()
>   hw/char/sh_serial: QOM-ify
>   hw/char/sh_serial: Add device id to trace output
>   hw/intc/sh_intc: Use existing macro instead of local one
>   hw/intc/sh_intc: Turn some defines into an enum
>   hw/intc/sh_intc: Rename iomem region
>   hw/intc/sh_intc: Drop another useless macro
>   hw/intc/sh_intc: Move sh_intc_register() closer to its only user
>   hw/intc/sh_intc: Remove excessive parenthesis
>   hw/intc/sh_intc: Use array index instead of pointer arithmetics
>   hw/intc/sh_intc: Inline and drop sh_intc_source() function
>   hw/intc/sh_intc: Replace abort() with g_assert_not_reached()
>   hw/intc/sh_intc: Avoid using continue in loops
>   hw/intc/sh_intc: Simplify allocating sources array
>   hw/intc/sh_intc: Remove unneeded local variable initialisers
>   hw/timer/sh_timer: Rename sh_timer_state to SHTimerState
>   hw/timer/sh_timer: Do not wrap lines that are not too long
>   hw/timer/sh_timer: Fix timer memory region size
>   hw/timer/sh_timer: Remove use of hw_error

Thanks, series queued.

Since you are hacking the SH-4 machines, please have a look at
Yoshinori work, possibly helping with reviewing once he respin
these series, which are good material (and where we want to
take our emulation) but are not yet ready for upstream:

"Unified peripheral emulation for Renesas chips"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg811384.html

"Integrate renesas MCU/SoC timer module"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg818332.html

Regards,

Phil.

