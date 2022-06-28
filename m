Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52AA55E50A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:42:18 +0200 (CEST)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BTr-0002RI-OQ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6BQg-0007mI-GV
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:38:58 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6BQe-0005BW-Mo
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:38:58 -0400
Received: by mail-pl1-x632.google.com with SMTP id k14so11115605plh.4
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QTs3JfxHmat5E0ZFTphbmSkX/rrelHor2LyktEasGS0=;
 b=YD2RPM9sPHf5OGt2FjvQvM3mU/iXj60M/wZ/1yStBN/u3gyxliHqNR1y9kIym24Jkx
 xiogeh8+wmRPmtXQ/KTuqKli5FtZd6U6lx16k9oD6lH6RvGy8AGrXTP5LNDDj027ZVfz
 enx+8xH+kl8P80BBECtzcjq6cPHfMbsuyh+V1dpTRZR/LV1VecpkSZ239wmG9pBw4eDG
 S5t+YO7ryR2J9iZXzcQhdCg6GlyYsM9O7Lc3pZT3rSB7iIBmQsPmQ/XhsS/ldSq2kL0+
 ZEd9KWoob/0mOAGA3rG1rjC9XI7oVX6s1yUOgJqAK9snHdOATOEZ2XLnEYWYuvI+Symy
 axkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QTs3JfxHmat5E0ZFTphbmSkX/rrelHor2LyktEasGS0=;
 b=UWt8DYyBERvcxU3xGQiHRQF4CxCU81OoX/ZC/XmDFM3dvb93+MvzU3OWWYO6nI/lHV
 FBMvm9vxRumRT3v2MHXdrn0F96fCfbOX8kVBWh7lko7mHuIPJr+ePyr9/pd+Dr8kvhNC
 hk2cIPzXJW+TKrcu60+EPEOlnuep5QuzpC4TZTeDPSBh+O0xChLx2znEIBMgzwgrfqdP
 Jk3nmB1H0nL43UH/NGmlGz7+AFdRKyL5Al57u9kdTfMMx6e3iCWJMrFowhdRic/FKsZw
 jcKYrcZnUOR/N7CJmqEDvSjJZu7iMUOQSpIUZdihQmxq2ytLcIfRWFA4GmSYojWSWugK
 jmJg==
X-Gm-Message-State: AJIora/NhAog32rc43vFEmLnEHLo3bX2MG+ZBZf2hYF2NI+QCfk74NCl
 zFYIzRdy3MAe59pn+rXwdE1Eg13d3FySo8LgOcc=
X-Google-Smtp-Source: AGRyM1uIG9LiD27VDuF8R7m6wrDr3/y3cETzd5vSUxpJccu1pw4CT6A7OHH7EDOxetErKQ4bdpdLBse0TElk2FaE/n4=
X-Received: by 2002:a17:902:dac1:b0:16a:3ebe:c722 with SMTP id
 q1-20020a170902dac100b0016a3ebec722mr4822543plx.169.1656423533773; Tue, 28
 Jun 2022 06:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220628114307.697943-1-richard.henderson@linaro.org>
 <20220628114307.697943-3-richard.henderson@linaro.org>
In-Reply-To: <20220628114307.697943-3-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 28 Jun 2022 06:38:48 -0700
Message-ID: <CAMo8BfJgo184TYxr0O-t5x68Ac1U3t9LWWvPeUEwm-E_qizGWQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] target/xtensa: Use semihosting/syscalls.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
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

On Tue, Jun 28, 2022 at 4:43 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This separates guest file descriptors from host file descriptors,
> and utilizes shared infrastructure for integration with gdbstub.
> Remove the xtensa custom console handing and rely on the
> generic -semihosting-config handling of chardevs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/cpu.h         |   1 -
>  hw/xtensa/sim.c             |   3 -
>  target/xtensa/xtensa-semi.c | 226 ++++++++----------------------------
>  3 files changed, 50 insertions(+), 180 deletions(-)
>
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index ea66895e7f..99ac3efd71 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -612,7 +612,6 @@ void xtensa_translate_init(void);
>  void **xtensa_get_regfile_by_name(const char *name, int entries, int bits);
>  void xtensa_breakpoint_handler(CPUState *cs);
>  void xtensa_register_core(XtensaConfigList *node);
> -void xtensa_sim_open_console(Chardev *chr);
>  void check_interrupts(CPUXtensaState *s);
>  void xtensa_irq_init(CPUXtensaState *env);
>  qemu_irq *xtensa_get_extints(CPUXtensaState *env);
> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
> index 946c71cb5b..5cca6a170e 100644
> --- a/hw/xtensa/sim.c
> +++ b/hw/xtensa/sim.c
> @@ -87,9 +87,6 @@ XtensaCPU *xtensa_sim_common_init(MachineState *machine)
>          xtensa_create_memory_regions(&sysram, "xtensa.sysram",
>                                       get_system_memory());
>      }
> -    if (serial_hd(0)) {
> -        xtensa_sim_open_console(serial_hd(0));
> -    }

I've noticed that with this change '-serial stdio' and its variants are still
accepted in the command line, but now they do nothing. This quiet
change of behavior is unfortunate. I wonder if it would be acceptable
to map the '-serial stdio' option in the presence of '-semihosting' to
something like '-chardev stdio,id=id1 -semihosting-config chardev=id1'?

> @@ -194,165 +169,64 @@ void xtensa_semihosting(CPUXtensaState *env)

...

>      case TARGET_SYS_select_one:
>          {
> -            uint32_t fd = regs[3];
> -            uint32_t rq = regs[4];
> -            uint32_t target_tv = regs[5];
> -            uint32_t target_tvv[2];
> +            int timeout, events;
>
> -            struct timeval tv = {0};
> +            if (regs[5]) {
> +                uint32_t tv_sec, tv_usec;
> +                uint64_t msec;
>
> -            if (target_tv) {
> -                cpu_memory_rw_debug(cs, target_tv,
> -                        (uint8_t *)target_tvv, sizeof(target_tvv), 0);
> -                tv.tv_sec = (int32_t)tswap32(target_tvv[0]);
> -                tv.tv_usec = (int32_t)tswap32(target_tvv[1]);
> -            }
> -            if (fd < 3 && sim_console) {
> -                if ((fd == 1 || fd == 2) && rq == SELECT_ONE_WRITE) {
> -                    regs[2] = 1;
> -                } else if (fd == 0 && rq == SELECT_ONE_READ) {
> -                    regs[2] = sim_console->input.offset > 0;
> -                } else {
> -                    regs[2] = 0;
> +                if (get_user_u32(tv_sec, regs[5]) ||
> +                    get_user_u32(tv_usec, regs[5])) {

get_user_u32(tv_usec, regs[5] + 4)?

> +                    xtensa_cb(cs, -1, EFAULT);
> +                    return;
>                  }
> -                regs[3] = 0;
> -            } else {
> -                fd_set fdset;
>
> -                FD_ZERO(&fdset);
> -                FD_SET(fd, &fdset);
> -                regs[2] = select(fd + 1,
> -                                 rq == SELECT_ONE_READ   ? &fdset : NULL,
> -                                 rq == SELECT_ONE_WRITE  ? &fdset : NULL,
> -                                 rq == SELECT_ONE_EXCEPT ? &fdset : NULL,
> -                                 target_tv ? &tv : NULL);
> -                regs[3] = errno_h2g(errno);
> +                /* Poll timeout is in milliseconds; overflow to infinity. */
> +                msec = tv_sec * 1000ull + DIV_ROUND_UP(tv_usec, 1000ull);
> +                timeout = msec <= INT32_MAX ? msec : -1;
> +            } else {
> +                timeout = -1;
>              }
> +
> +            switch (regs[4]) {
> +            case SELECT_ONE_READ:
> +                events = G_IO_IN;
> +                break;
> +            case SELECT_ONE_WRITE:
> +                events = G_IO_OUT;
> +                break;
> +            case SELECT_ONE_EXCEPT:
> +                events = G_IO_PRI;
> +                break;
> +            default:
> +                xtensa_cb(cs, -1, EINVAL);

This doesn't match what there used to be: it was possible to call
select_one with rq other than SELECT_ONE_* and that would've
passed NULL for all fd sets in the select invocation turning it into
a sleep. It would return 0 after the timeout.

-- 
Thanks.
-- Max

