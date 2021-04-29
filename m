Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6C236E60E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:33:33 +0200 (CEST)
Received: from localhost ([::1]:60270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc1Ay-0002UP-Fe
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lc19Z-0001do-OO
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:32:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lc19Y-000643-7I
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:32:05 -0400
Received: by mail-wm1-x32a.google.com with SMTP id g65so6046319wmg.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hL4zEKCCU7nU1LVLX9E78IiYRInOz67I9eHRzP69sAQ=;
 b=DFhYk3Pee8kVY4j9VnvzOa0osVXeZAKKlnhztsWaQMJUJnmlrDaxViVCUxXoNiDNrp
 MAk/4BD/W2fhbWKKHjLVlsn8z3s4UPqbyTFLWaDfeX2jerV9W2xWVN/NQR6CwCFY0Ohi
 5WN3OMZumfOijRRwsNzfALb88AXvnApXesFMIkezdLY7QLO11jz5POAnmrb1EIme392x
 uF2EorC0tHCjR2LQxnfQFlu/U4DOSxFLHIcMPekmp4Lo/Z0L7miQ7vUapTk/doS4SJ8+
 ifiX0PnYpud0tZo61qAyv9pE4PqzJ+5k3K7MIGhVNXPxSLxmWfa+a/h0S38vbveWMTGs
 1wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hL4zEKCCU7nU1LVLX9E78IiYRInOz67I9eHRzP69sAQ=;
 b=nAbEoceX1+qf9cjpJcmBxsUAZX3GIZkh194fjWgdlp+FVQRhXwCeVHvtiT3Yt2uFAV
 t4zdkF+fSRk65AigG7HIVxcr8YCyyaVyJbVI5ba2s9J26GJ5jK4u9IQkkwDrpW/zw1RN
 86IVYjmVsSw4roy0/kxqcAs8OaJlO9t/QUsUTEt82rHEEh7qrQwYzqgcvSnTuySrluz9
 o70ljNjqFC4oGOwPRjkfRQmbO2C+hIwLmgBr+mHIf13iOzcMVXJi8MKntEoLULoh2/+1
 wsbsEg8MMopYY8ftF850VHJAwKP6/iTWAEyv9fPzV4jFO2AQHtL8KA+ijn0iCzA/AV5C
 FsZQ==
X-Gm-Message-State: AOAM530Eleg3bcdSnIEAIDZB86VM33e23JyarZjfr39AttwmD4t+vGqR
 5FVuu60KsqBaajzJmiIMpxQ=
X-Google-Smtp-Source: ABdhPJzKiUMw8QyPdgszm/55RnNvbCnd4LZ2eEny11ggHdK/xyGj+fZuDjdubgBWEVtg6R4QM19nZw==
X-Received: by 2002:a05:600c:2141:: with SMTP id
 v1mr35382738wml.22.1619681521414; 
 Thu, 29 Apr 2021 00:32:01 -0700 (PDT)
Received: from [192.168.43.238] (202.red-95-127-154.staticip.rima-tde.net.
 [95.127.154.202])
 by smtp.gmail.com with ESMTPSA id h14sm3972998wrq.45.2021.04.29.00.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:32:00 -0700 (PDT)
Subject: Re: [RFC] AVR watchdog
To: Fred Konrad <konrad@adacore.com>, mrolnik@gmail.com
References: <20b7f194-066f-c3bf-a830-deb1cde8f1be@adacore.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ac0c099c-81b1-75b6-0304-85026a4a9282@amsat.org>
Date: Thu, 29 Apr 2021 08:44:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20b7f194-066f-c3bf-a830-deb1cde8f1be@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 4:17 PM, Fred Konrad wrote:
> Hi,
> 
> I fall on a segfault while running the wdr instruction on AVR:
> 
> (gdb) bt
>      #0  0x00005555add0b23a in gdb_get_cpu_pid (cpu=0x5555af5a4af0) at
>        ../gdbstub.c:718
>      #1  0x00005555add0b2dd in gdb_get_cpu_process (cpu=0x5555af5a4af0) at
>        ../gdbstub.c:743
>      #2  0x00005555add0e477 in gdb_set_stop_cpu (cpu=0x5555af5a4af0) at
>        ../gdbstub.c:2742
>      #3  0x00005555adc99b96 in cpu_handle_guest_debug
> (cpu=0x5555af5a4af0) at
>        ../softmmu/cpus.c:306
>      #4  0x00005555adcc66ab in rr_cpu_thread_fn (arg=0x5555af5a4af0) at
>        ../accel/tcg/tcg-accel-ops-rr.c:224
>      #5  0x00005555adefaf12 in qemu_thread_start (args=0x5555af5d9870) at
>        ../util/qemu-thread-posix.c:521
>      #6  0x00007f692d940ea5 in start_thread () from /lib64/libpthread.so.0
>      #7  0x00007f692d6699fd in clone () from /lib64/libc.so.6
> 
> Wondering if there are some plan/on-going work to implement this watchdog?
> 
> ---
> 
> Also meanwhile I though about a workaround like that:
> 
> diff --git a/target/avr/helper.c b/target/avr/helper.c
> index 35e1019594..7944ed21f4 100644
> --- a/target/avr/helper.c
> +++ b/target/avr/helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/exec-all.h"
>  #include "exec/address-spaces.h"
>  #include "exec/helper-proto.h"
> +#include "sysemu/runstate.h"
> 
>  bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
> @@ -191,7 +192,7 @@ void helper_wdr(CPUAVRState *env)
>      CPUState *cs = env_cpu(env);
> 
>      /* WD is not implemented yet, placeholder */
> -    cs->exception_index = EXCP_DEBUG;
> +    qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);

Eh, this is the opposite... This opcode kicks the watchdog,
it does not trigger it.

>      cpu_loop_exit(cs);
>  }
> 
> In the case the guest wants to reset the board through the watchdog,
> would that
> make sense to swap to that?

Why not simply log the opcode and keep going?

-- >8 --
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 35e10195940..981c29da453 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -190,7 +190,3 @@ void helper_wdr(CPUAVRState *env)
 {
-    CPUState *cs = env_cpu(env);
-
-    /* WD is not implemented yet, placeholder */
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
+    qemu_log_mask(LOG_UNIMP, "Watchdog Timer Reset\n");
 }
---

Regards,

Phil.

