Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2797E440B9A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 22:14:40 +0200 (CEST)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgukR-0007g7-8N
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 16:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mguj7-0006z4-DK
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 16:13:17 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mguj4-0001Sr-UO
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 16:13:16 -0400
Received: by mail-pj1-x1031.google.com with SMTP id gt5so1297484pjb.1
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 13:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YdrPiQzrN7+CXBJS7BJdp0NXZ2ecAjW3B+hK776IkRw=;
 b=CGMw0RP4Q1cbucKbJ3RectyGEStn/6qAP0E6/xyaagUw/AftM3/6bzyRQ6x4uSu3AS
 hNbI7gN+uBq+PcCZoAki4pidROq6ucT4WHFrjI44E/mYbUIxbO+PPNgYJbKXk5FrqEXA
 uwkJ9NGI1ZXp97cQJK7mr7Ff5vxyeBrFezM/s3BOYIt79megVYy/yNg/ETyoAmdRBCVl
 4yuEc9qWG1CYg5+zEO3VYyTtLme7mCY7UClMYL91aZJNQV6UyQD9BBvzCB7KSLNEHwZu
 FFbaGpRoItW9InLghh9bTE2dHLw/dSFYxLtkmxc/cArzpyzb/2hcEWiFDIWbniQzt+y9
 /eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YdrPiQzrN7+CXBJS7BJdp0NXZ2ecAjW3B+hK776IkRw=;
 b=LIj7J3lgPtJTcpe9bcATB6bYWomhbj24efo5o+mQrexX0gtwLvWUaEF9HWi4sqMLXL
 QkfE1RAFQ+oKL6RX36JDWqIo0kyF4TMWVOV2PwTTRzSrGMdxvenASl5b+h00h+3wHBW7
 UPjaeQPpLeAk7lUcg+YNQUDwHhGWkJvG90Iv4z6MoV9dJi1zMMPmN5TMwPDAY7h/hrBg
 gr7oJZJ3f52GWcsT/6EHbidmdzXYhhsmUVumnDCW1t8Jku6ugdYb3Vw5ITdOmnEcn0ag
 zgbuIGK7sVi0bee661t+m7Ef/Sndy/uZDJ5WSPqupxXzJJO/lEMTXjnArINP4Y8VcecD
 jkww==
X-Gm-Message-State: AOAM5328mgLew5+eBgywirwpTEP2uMOWHHy4GAU0K0pqa1Ln3EnHSyRH
 UsfYtZwFXJ4RoZJNb6oXwzyh5w==
X-Google-Smtp-Source: ABdhPJxTyhwlnjw20WQ2xhzWRHoc0YuZX1l+qe7mkE2iuPuY0exPF2jy3POERJO2opO1cs3enmMjHw==
X-Received: by 2002:a17:90b:92:: with SMTP id
 bb18mr9942416pjb.133.1635624793402; 
 Sat, 30 Oct 2021 13:13:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv5sm9804848pjb.10.2021.10.30.13.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 13:13:12 -0700 (PDT)
Subject: Re: [PULL 00/30] Renesas SH-4 patches for 2021-10-30
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211030170615.2636436-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b0c96c8-b614-4abf-f104-0bad65bb5d6a@linaro.org>
Date: Sat, 30 Oct 2021 13:13:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/21 10:05 AM, Philippe Mathieu-Daudé wrote:
> The following changes since commit dd61b91c080cdfba1360a5ea1e4693fffb3445b0:
> 
>    Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-10-29' into staging (2021-10-29 19:42:36 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/renesas-20211030
> 
> for you to fetch changes up to 46e44759fc24a05e338cd37a735b4aad5422e717:
> 
>    hw/timer/sh_timer: Remove use of hw_error (2021-10-30 18:39:37 +0200)
> 
> ----------------------------------------------------------------
> Renesas SH-4 patches queue
> 
> Patches from Zoltan:
> - Various clean up to align the code style with the rest of the code base
> - QOM'ify the SH_SERIAL device
> - Modify few memory region size to better match the hardware manual
> 
> ----------------------------------------------------------------
> 
> BALATON Zoltan (30):
>    hw/sh4: Coding style: Remove tabs
>    hw/sh4: Coding style: Fix multi-line comments
>    hw/sh4: Coding style: White space fixes
>    hw/sh4: Coding style: Add missing braces
>    hw/sh4: Coding style: Remove unnecessary casts
>    hw/sh4: Fix typos in a comment
>    hw/sh4: Change debug printfs to traces
>    hw/sh4/r2d: Use error_report instead of fprintf to stderr
>    hw/char/sh_serial: Do not abort on invalid access
>    hw/char/sh_serial: Rename type sh_serial_state to SHSerialState
>    hw/char/sh_serial: Embed QEMUTimer in state struct
>    hw/char/sh_serial: Split off sh_serial_reset() from sh_serial_init()
>    hw/char/sh_serial: QOM-ify
>    hw/char/sh_serial: Add device id to trace output
>    hw/intc/sh_intc: Use existing macro instead of local one
>    hw/intc/sh_intc: Turn some defines into an enum
>    hw/intc/sh_intc: Rename iomem region
>    hw/intc/sh_intc: Drop another useless macro
>    hw/intc/sh_intc: Move sh_intc_register() closer to its only user
>    hw/intc/sh_intc: Remove excessive parenthesis
>    hw/intc/sh_intc: Use array index instead of pointer arithmetics
>    hw/intc/sh_intc: Inline and drop sh_intc_source() function
>    hw/intc/sh_intc: Replace abort() with g_assert_not_reached()
>    hw/intc/sh_intc: Avoid using continue in loops
>    hw/intc/sh_intc: Simplify allocating sources array
>    hw/intc/sh_intc: Remove unneeded local variable initialisers
>    hw/timer/sh_timer: Rename sh_timer_state to SHTimerState
>    hw/timer/sh_timer: Do not wrap lines that are not too long
>    hw/timer/sh_timer: Fix timer memory region size
>    hw/timer/sh_timer: Remove use of hw_error
> 
>   meson.build              |    1 +
>   hw/sh4/sh7750_regs.h     | 1528 +++++++++++++++++++-------------------
>   hw/sh4/trace.h           |    1 +
>   include/hw/sh4/sh.h      |   19 +-
>   include/hw/sh4/sh_intc.h |    2 +-
>   hw/char/sh_serial.c      |  232 +++---
>   hw/intc/sh_intc.c        |  573 +++++++-------
>   hw/pci-host/sh_pci.c     |   10 +-
>   hw/sh4/r2d.c             |   69 +-
>   hw/sh4/sh7750.c          |  631 ++++++++--------
>   hw/sh4/sh7750_regnames.c |  148 ++--
>   hw/sh4/shix.c            |   12 +-
>   hw/timer/sh_timer.c      |  151 ++--
>   hw/char/trace-events     |    4 +
>   hw/intc/trace-events     |    8 +
>   hw/sh4/trace-events      |    3 +
>   hw/timer/trace-events    |    5 +
>   17 files changed, 1713 insertions(+), 1684 deletions(-)
>   create mode 100644 hw/sh4/trace.h
>   create mode 100644 hw/sh4/trace-events

Applied, thanks.

r~


