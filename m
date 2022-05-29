Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E564C5370B1
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 13:11:57 +0200 (CEST)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvGpw-0003gJ-HM
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 07:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvGkU-0001g3-F5
 for qemu-devel@nongnu.org; Sun, 29 May 2022 07:06:20 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvGkR-0003lC-QZ
 for qemu-devel@nongnu.org; Sun, 29 May 2022 07:06:18 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e2so11299811wrc.1
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 04:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k3kcVtUb3r/6exAhvqEQDMNOzHfQDK7tNMnZlUTc2WI=;
 b=SlYjxYkNUphN5KGTFhS54h3c69M1zuGoz5k2Rtbr+kmYt5dYoGuddcjRmx29FIHBnN
 tmcU/q7VBL6IVj2gedqc7MuKo2hocN4+egJ0RfgvxKwKTXoD4WiV+pjdEpVAqQ/fuksZ
 9l4FyQMd32i9RCBz88P9qWWpQFfDatA4iFr/C53n/hQEWqe42TQPRNXKUBVzNr9uX2Gc
 j4s+qKDrqAxJfJ3N0wXFUEGxwbbBIz0H/4iVZda+UJ2pTNu0XUnv+2bzm32sX32R86Y3
 +cs0k4UDEP6yBwAan9k0XbehfJAZ+67LD9LA8UApGeswU97wwB3FfK6/t2yunkZCeVKZ
 aiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k3kcVtUb3r/6exAhvqEQDMNOzHfQDK7tNMnZlUTc2WI=;
 b=uOECWw83vu4JehTWQaMFEQ9rkAMA7Irr3BQ4dq3/5woQmir09hMssVQwMkA+s+24ex
 CedrHBI1sl88B81D2Wv9JDwPqtbJqK/jJIoa4TCmeSXxVsZcS7kMM+rJ61NKOcb3Mlue
 Si1QedbKFUqwd7SQms0rlXT6w+Na37w/zNjpCQwwX+CWER8G7bTepFtrZpLcLePcpZGM
 TmWKtJEQbWWq8+EsdejoHJ4coOGkgIi1K5Ur18eu0kBB+MdbF3tl9cOpQwX508FydNsr
 yoGV3bEop0MbfAraqkNYF5tOceTuLP6WQlxzErVoPcPffZKudQ2bl0UcAE7wRP2exkUr
 JgbQ==
X-Gm-Message-State: AOAM530N2lnnzdqNky9rmPfEfH5iP9PF7TiHErbqeUGcEpXsrt3z3Txw
 MZm3434WIznLoVnhakFjleE=
X-Google-Smtp-Source: ABdhPJznOSmoEcjb0e69JVt/HEMuzMza3e+w9lYijVZ+hynZjn1p3w5KFeN9F6CEXOV3PL5DKpWGmQ==
X-Received: by 2002:a05:6000:160b:b0:210:2996:a84f with SMTP id
 u11-20020a056000160b00b002102996a84fmr4723864wrb.284.1653822372754; 
 Sun, 29 May 2022 04:06:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e9-20020adfe389000000b0020c5253d8fcsm7493853wrm.72.2022.05.29.04.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 04:06:12 -0700 (PDT)
Message-ID: <6d649290-d619-ef2d-5d32-c0fca95f8d64@amsat.org>
Date: Sun, 29 May 2022 13:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] gdbstub: Don't use GDB syscalls if no GDB is attached
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liviu Ionescu <ilg@livius.net>
References: <20220526190053.521505-1-peter.maydell@linaro.org>
 <20220526190053.521505-2-peter.maydell@linaro.org>
In-Reply-To: <20220526190053.521505-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 26/5/22 21:00, Peter Maydell wrote:
> In two places in gdbstub.c we look at gdbserver_state.init to decide
> whether we're going to do a semihosting syscall via the gdb remote
> protocol:
>   * when setting up, if the user didn't explicitly select either
>     native semihosting or gdb semihosting, we autoselect, with the
>     intended behaviour "use gdb if gdb is connected"
>   * when the semihosting layer attempts to do a syscall via gdb, we
>     silently ignore it if the gdbstub wasn't actually set up
> 
> However, if the user's commandline sets up the gdbstub but tells QEMU
> to start rather than waiting for a GDB to connect (eg using '-s' but
> not '-S'), then we will have gdbserver_state.init true but no actual
> connection; an attempt to use gdb syscalls will then crash because we
> try to use gdbserver_state.c_cpu when it hasn't been set up:
> 
> #0  0x00007ffff6803ba8 in qemu_cpu_kick (cpu=0x0) at ../../softmmu/cpus.c:457
> #1  0x00007ffff6c03913 in gdb_do_syscallv (cb=0x7ffff6c19944 <common_semi_cb>,
>      fmt=0x7ffff7573b7e "", va=0x7ffff56294c0) at ../../gdbstub.c:2946
> #2  0x00007ffff6c19c3a in common_semi_gdb_syscall (cs=0x7ffff83fe060,
>      cb=0x7ffff6c19944 <common_semi_cb>, fmt=0x7ffff7573b75 "isatty,%x")
>      at ../../semihosting/arm-compat-semi.c:494
> #3  0x00007ffff6c1a064 in gdb_isattyfn (cs=0x7ffff83fe060, gf=0x7ffff86a3690)
>      at ../../semihosting/arm-compat-semi.c:636
> #4  0x00007ffff6c1b20f in do_common_semihosting (cs=0x7ffff83fe060)
>      at ../../semihosting/arm-compat-semi.c:967
> #5  0x00007ffff693a037 in handle_semihosting (cs=0x7ffff83fe060)
>      at ../../target/arm/helper.c:10316
> 
> You can probably also get into this state via some odd
> corner cases involving connecting a GDB and then telling it
> to detach from all the vCPUs.
> 
> Abstract out the test into a new gdb_attached() function
> which returns true only if there's actually a GDB connected
> to the debug stub and attached to at least one vCPU.
> 
> Reported-by: Liviu Ionescu <ilg@livius.net>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Silently doing nothing in gdb_do_syscallv(), never calling the
> callback function, is kind of dodgy.  But it's what the code is doing
> already, and besides it's not clear what we should do if the user
> specifically says "semihosting calls via the gdb stub" and then
> doesn't connect gdb...

When using a JTAG probe as GDB monitor, you get an error the probe
can't get initialized. If the probe gets disconnected while running
then the semihosting calls are executed but don't do anything (or
return default errno).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

