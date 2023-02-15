Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1576987B0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 23:14:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSQ1k-0006gF-Gg; Wed, 15 Feb 2023 17:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSQ1i-0006fz-Iz
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 17:13:22 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSQ1f-0006hj-Pj
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 17:13:22 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m10so142348wrn.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 14:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A+CF2m/mVngGWGeLVeBTB/9V2DMyK5HjrPwgZJlOl7Q=;
 b=meKezzcK2Mu3l5466OAHy4tIbz1uUOPzAv33XqA8Mx7lxAIaSTU7mG2PsrMmWYpTDV
 JIi0+gzBKidEFTfO3jhpdfarHhusjnbD+vJLqoBf6i6IfPNoz3mUIiDd9d+t58Sji9BE
 N/AwjdRIofOGgqA9h+801/agVtOLjnh18IV6djfy39dR3SDbzkD09w9P5J9iJ60FKylC
 i+OGGpQnl1yQfDaCVu+EaAXKE9OWtlgXLsEAhjJbbVhcsxi7x5JoWX0A0aNF4JOPm6cB
 2Hg/XGOBCDpte8I+cpe701+tC5wEfhfYrFZ+1Zu9+LWpBHI8MGJDBlhEh5DLsh7rPREB
 YHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A+CF2m/mVngGWGeLVeBTB/9V2DMyK5HjrPwgZJlOl7Q=;
 b=ItZNdSGG20fzpBihnaIAJTyuq8DMV3Pq2Aowbj6iUgUKwrLkV9MQgTF728GC/r1lTT
 f4AAeND9zqLYjfRqATalRA+OXu+67sX6yNdbMWpvaCcpq5bKeEYe3AjGD/oQYr4kZ4kd
 SOTZrXt3lte5VxUYQkNE3icRSxj3bPxv/2esvYdRKK2QX/CfNwOw4PtqCGN1rjcVg4ir
 BvzN5W0Ut4ds9dNEex/x1h4/OAF4+h3sRsX0quvDOItW8t+sALEUxbWM9n5/nvVfOb+h
 aBx/PsS6jtPpfpyhOy274syzrJp5KZIebVXRDLSblyJtTu7nJi3velhthO8UC3yXaPhM
 bjdQ==
X-Gm-Message-State: AO0yUKUXLnAJDt/eofL+BAtV60pf1a0DuMNA5Y4mVv0rgt3aNjRRRy4r
 T57MMxmU7xzfnEZDAdl8+DlbfQ==
X-Google-Smtp-Source: AK7set/xTQHxvy42qwhTTS57c4LreDkgYC2njOdOtTXOYf/Bk3B7yBzk95WvPCcYk30ljLGZn1AoPQ==
X-Received: by 2002:a5d:4d87:0:b0:2c5:585e:334f with SMTP id
 b7-20020a5d4d87000000b002c5585e334fmr2746838wru.41.1676499196886; 
 Wed, 15 Feb 2023 14:13:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t13-20020adfe44d000000b002c557f82e27sm9242610wrm.99.2023.02.15.14.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 14:13:16 -0800 (PST)
Message-ID: <7f4f3a95-d1c5-a531-0ce5-8a974e5bc002@linaro.org>
Date: Wed, 15 Feb 2023 23:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [Qemu-devel] [PATCH 19/38] char: make some qemu_chr_fe skip if no
 driver
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Cc: pbonzini@redhat.com, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>
References: <20161022095318.17775-1-marcandre.lureau@redhat.com>
 <20161022095318.17775-20-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20161022095318.17775-20-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

Hi Marc-André,

[very old patch...]

On 22/10/16 11:52, Marc-André Lureau wrote:
> In most cases, front ends do not care about the side effect of
> CharBackend, so we can simply skip the checks and call the qemu_chr_fe
> functions even without associated CharDriver.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/arm/pxa2xx.c           |  8 +++-----
>   hw/arm/strongarm.c        | 16 ++++++---------
>   hw/char/bcm2835_aux.c     | 18 ++++++-----------
>   hw/char/cadence_uart.c    | 24 +++++++---------------

>   qemu-char.c               | 51 ++++++++++++++++++++++++++++++++++++++---------
>   include/sysemu/char.h     | 40 +++++++++++++++++++++++++------------
>   22 files changed, 156 insertions(+), 191 deletions(-)


> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 4459b2d..291818e 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -142,9 +142,7 @@ static void uart_rx_reset(CadenceUARTState *s)
>   {
>       s->rx_wpos = 0;
>       s->rx_count = 0;
> -    if (s->chr.chr) {
> -        qemu_chr_fe_accept_input(&s->chr);
> -    }
> +    qemu_chr_fe_accept_input(&s->chr);

I'm trying to understand this change. This code comes from:

commit 9121d02cb33c96b444a3973579f5edc119597e81

     char/cadence_uart: Fix reset for unattached instances

     commit 1db8b5efe0c2b5000e50691eea61264a615f43de introduced an issue
     where QEMU would segfault if you have an unattached Cadence UART.

     Fix by guarding the flush-on-reset logic on there being a qemu_chr
     attachment.

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 131370a74b..4d457f8c65 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -157,7 +157,9 @@ static void uart_rx_reset(UartState *s)
  {
      s->rx_wpos = 0;
      s->rx_count = 0;
-    qemu_chr_accept_input(s->chr);
+    if (s->chr) {
+        qemu_chr_accept_input(s->chr);
+    }

When resetting the xlnx-zcu102 machine, I hit:

(lldb) bt
* thread #1, queue = 'com.apple.main-thread', stop reason = 
EXC_BAD_ACCESS (code=1, address=0x50)
   * frame #0: 0x10020a740 gd_vc_send_chars(vc=0x000000000) at 
gtk.c:1759:41 [opt]
     frame #1: 0x100636264 qemu_chr_fe_accept_input(be=<unavailable>) at 
char-fe.c:159:9 [opt]
     frame #2: 0x1000608e0 cadence_uart_reset_hold [inlined] 
uart_rx_reset(s=0x10810a960) at cadence_uart.c:158:5 [opt]
     frame #3: 0x1000608d4 cadence_uart_reset_hold(obj=0x10810a960) at 
cadence_uart.c:530:5 [opt]
     frame #4: 0x100580ab4 resettable_phase_hold(obj=0x10810a960, 
opaque=0x000000000, type=<unavailable>) at resettable.c:0 [opt]
     frame #5: 0x10057d1b0 bus_reset_child_foreach(obj=<unavailable>, 
cb=(resettable_phase_hold at resettable.c:162), opaque=0x000000000, 
type=RESET_TYPE_COLD) at bus.c:97:13 [opt]
     frame #6: 0x1005809f8 resettable_phase_hold [inlined] 
resettable_child_foreach(rc=0x000060000332d2c0, obj=0x0000600002c1c180, 
cb=<unavailable>, opaque=0x000000000, type=RESET_TYPE_COLD) at 
resettable.c:96:9 [opt]
     frame #7: 0x1005809d8 resettable_phase_hold(obj=0x0000600002c1c180, 
opaque=0x000000000, type=RESET_TYPE_COLD) at resettable.c:173:5 [opt]
     frame #8: 0x1005803a0 
resettable_assert_reset(obj=0x0000600002c1c180, type=<unavailable>) at 
resettable.c:60:5 [opt]
     frame #9: 0x10058027c resettable_reset(obj=0x0000600002c1c180, 
type=RESET_TYPE_COLD) at resettable.c:45:5 [opt]

Doing similar to commit 9121d02cb3...:

-- >8 --
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index c069a30842..deadee1788 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -155,7 +155,9 @@ static void uart_rx_reset(CadenceUARTState *s)
  {
      s->rx_wpos = 0;
      s->rx_count = 0;
-    qemu_chr_fe_accept_input(&s->chr);
+    if (qemu_chr_fe_backend_open(&s->chr)) {
+        qemu_chr_fe_accept_input(&s->chr);
+    }
  }
---

... fixes the issue but I'm not sure 1/ this is a correct use of the
chardev API and 2/ this is how the HW work at reset.

Can you help me with 1/ before I ask Xilinx folks for 2/ ? :)

Thanks,

Phil.

