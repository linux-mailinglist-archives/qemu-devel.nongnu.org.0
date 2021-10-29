Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F7F440535
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:59:57 +0200 (CEST)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZun-0002rP-0Y
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgZsV-0000x3-QW
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:57:35 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgZsM-0004UW-4X
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:57:35 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d13so18777394wrf.11
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 14:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/wiv/C4g37W/XIPTTxEIyRo9oRXBEn3zxM05wVkp990=;
 b=hz8zQ0G0WsMsoDl6XgQ0pDAEGymtSRYuUVlNXergVHfIWQ/y7uvcW2+oDJeIMUSX7y
 NjYruLhQWSB0nKNylGy3W7ANKa70E82pyFuM9UA026+ECkjKvC6/m2mT277EbpoXHFNc
 Y5Ac9U+VP+cQbsbGjr/E3tr7tHhfInG9a0IJjnatyfUzkKp3i5pxNMiB2fGcHr5x72WI
 3cIxoiz6ZQ5N9V08gXTf9KyvO34cHPpxaNodIfw3aXPkFzy3kgKFn5yVRwGl0RufyP3f
 Q1eopGOI3HrSO9nFz5cPCeAXtfdZEyj8s+8+D8sRhphBYLzlUSIVh1s1KqMsfTD78MKW
 WVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/wiv/C4g37W/XIPTTxEIyRo9oRXBEn3zxM05wVkp990=;
 b=wbWVtTLE7a8HJ1wt66he+v8hF6DTULpe49W+xlT6W/Q/pHlixK6N5HuhuLRDoie4By
 xtSmSo3ES58pmt8Yll7r/rjBt3MPxfSpswtKNcOGtoubCZJySJ/5eJWWZcAli0zKC7Z4
 O4JTnTnh72/CNHxIzvp/oh8qO8+IK7+zhbCS2fY0uH6xlJZN6t20PsfqnyKNQ6pXyXXL
 gDMzEPg1J2ARbj3cUW87QwM7y0pcMAqwBh68Gt0vi89YYY6HwlFoFwvLGilbcLff6X8e
 lmuNvLlmvSwda5hkc9Dg5mEU861wepQX8rwIqKGkCp/aoXI0EgFFL6mdvgy48RIrCl9A
 utEg==
X-Gm-Message-State: AOAM532g2jUdq9q/1Pzx54bSXHNvUgSbQ1IXBsYEA2nDO6GZmhjmBoww
 zTl5pa6kO/JE9Jlqu6Qdtm4=
X-Google-Smtp-Source: ABdhPJw8NtQXJZsYT7HrVaOr8OzVEc3TuSu1zQY+/+fCOGEsSNky0C2uwfq64p0d4RAidu72e0WSqg==
X-Received: by 2002:adf:8b45:: with SMTP id v5mr17525269wra.211.1635544644030; 
 Fri, 29 Oct 2021 14:57:24 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i3sm9316755wmq.18.2021.10.29.14.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 14:57:23 -0700 (PDT)
Message-ID: <b9fca527-82b0-a75a-d67e-7309e4147a1d@amsat.org>
Date: Fri, 29 Oct 2021 23:57:22 +0200
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
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
> This now includes the previous code style clean up series so
> everything is in the series now. This got big enough for now so I'll
> wait until these are merged (hopefully before the freeze) before going
> on so I don't have to carry them in my tree. Only plan to submit
> another version if needed from review otherwise that's it for now,
> hopefully this is the last version.
> 
> v6: Found some lines with wrong indentation missed in code style clean
> up and one line missed removing sh_intc_source from header so I'm
> posting the whole series with these two small fixes, otherwise same as
> v5 but rebased on fixed code style series which is now also included.

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

Hmm there is something odd with your mailer, your patches are
not sent in order, making it hard for tools to collect them.

