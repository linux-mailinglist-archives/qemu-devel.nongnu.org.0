Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57D553BE6C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 21:11:36 +0200 (CEST)
Received: from localhost ([::1]:36994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwqEG-0001Jp-CQ
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 15:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1nwqBw-0000bE-FS
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 15:09:08 -0400
Received: from mail-qk1-f170.google.com ([209.85.222.170]:42902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1nwqBu-0001J1-92
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 15:09:08 -0400
Received: by mail-qk1-f170.google.com with SMTP id m68so4357432qkb.9
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 12:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ZmjXLx9Ca/qAgnUddYQ/pRb2D8l9flWG2KTwUVSp3E=;
 b=R/+jNFbZIdR/ScHKdE2RnInwrqFyxkSTgfGZzoTvCcn5zEnwNHDMwo/c8EAWdlst4k
 NwZmogMuPfQrHyFHYJyGa0p66a+deWD+kavOudTvT0Ty5EBdJlENEr5MTmshrDU5w9mi
 rZC3gwDTgss9NODJR0wqa7v41sglH70RLPtOcNP5JeTydY8tGmLJfJa/EAGbOcIlCfhH
 Zrv89iL9fUkyLSn3dyeRYHaJrC4k5cyIFE9xIA6ls6qbLqCo8IDheQB09HVSSF5sOgSb
 aUEudrk0f/9kCmLatkpMvOw4pOnzow3dlAz8A8oIaiH7P+pjbRqupRsQr74kEtLQFZxn
 3PJw==
X-Gm-Message-State: AOAM532FBkCbRcClbgY8rKj2OBPNLLwdGzg0RtlJsdQD1VZABYg+jlbD
 Eu9oucw2XetTsZPxUryeE5Ltxz/Iq/UOew==
X-Google-Smtp-Source: ABdhPJx0qV8Szk65rFmklmjf0WtSZREiu/xFc8wY+XSYb4seat05EQZ30dQUiYvaVx7WKqdjaAl8Rw==
X-Received: by 2002:a05:620a:4249:b0:6a6:58fd:59e4 with SMTP id
 w9-20020a05620a424900b006a658fd59e4mr4268419qko.446.1654196944912; 
 Thu, 02 Jun 2022 12:09:04 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac84553000000b00304da8793absm519594qtn.43.2022.06.02.12.09.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 12:09:04 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-30fa61b1a83so55836367b3.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 12:09:04 -0700 (PDT)
X-Received: by 2002:a81:4811:0:b0:30c:8021:4690 with SMTP id
 v17-20020a814811000000b0030c80214690mr7250879ywa.47.1654196943929; Thu, 02
 Jun 2022 12:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
In-Reply-To: <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jun 2022 21:08:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
Message-ID: <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
To: Joel Stanley <joel@jms.id.au>
Cc: Stafford Horne <shorne@gmail.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Openrisc <openrisc@lists.librecores.org>,
 QEMU Development <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.222.170;
 envelope-from=geert.uytterhoeven@gmail.com; helo=mail-qk1-f170.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Joel,

On Thu, Jun 2, 2022 at 1:42 PM Joel Stanley <joel@jms.id.au> wrote:
> On Fri, 27 May 2022 at 17:27, Stafford Horne <shorne@gmail.com> wrote:
> > This patch add the OpenRISC virtual machine 'virt' for OpenRISC.  This
> > platform allows for a convenient CI platform for toolchain, software
> > ports and the OpenRISC linux kernel port.
> >
> > Much of this has been sourced from the m68k and riscv virt platforms.

> I enabled the options:
>
> CONFIG_RTC_CLASS=y
> # CONFIG_RTC_SYSTOHC is not set
> # CONFIG_RTC_NVMEM is not set
> CONFIG_RTC_DRV_GOLDFISH=y
>
> But it didn't work. It seems the goldfish rtc model doesn't handle a
> big endian guest running on my little endian host.
>
> Doing this fixes it:
>
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_HOST_ENDIAN,
>
> [    0.190000] goldfish_rtc 96005000.rtc: registered as rtc0
> [    0.190000] goldfish_rtc 96005000.rtc: setting system clock to
> 2022-06-02T11:16:04 UTC (1654168564)
>
> But literally no other model in the tree does this, so I suspect it's
> not the right fix.

Goldfish devices are supposed to be little endian.
Unfortunately m68k got this wrong, cfr.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2e2ac4a3327479f7e2744cdd88a5c823f2057bad
Please don't duplicate this bad behavior for new architectures.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

