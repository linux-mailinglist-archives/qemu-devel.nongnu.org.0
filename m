Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EABD407909
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 17:25:32 +0200 (CEST)
Received: from localhost ([::1]:42734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP4sk-0000Mo-Vq
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 11:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mP4rc-000881-1h
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 11:24:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mP4ra-0005Mz-A3
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 11:24:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g16so7284659wrb.3
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KbNbi3cRlC4nLFAR7hP8CnUmAk7vkD0LZx5FkE5Hc3w=;
 b=PJNRficHSKy8ybQ8mvTDQVXtMI3df1Y1A7i/yO8fv7M2Xl8SZ5A0KHt5ORFel464lP
 8P7EVvM7igisyh8qZmPw/mNEbtI0Tu9t0svjn4ZV9TsDYQvZ7f9YBWQ4pSMtHl2PTLO2
 rm++8jXui7r1WCYZcxu+P+5m6wLRmUz4Ljd5mt3vkOHyjRk2ZWqEa4a0gWyLZxiPjgco
 N0S5d3p9KYrD1ZGbHBBgRUE9TwYo79a7oNBzrpjisa6MJosJA2d9w+l5W27mqDIYwz1e
 sF8dUcmKLN0l84WeqkSo7nbUNeD0EG8Y5z9mh1QVgkSY+MRoGBHorbg9BxYq70ehBbFG
 QeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KbNbi3cRlC4nLFAR7hP8CnUmAk7vkD0LZx5FkE5Hc3w=;
 b=7Pxy2fmhzf+TYMhttoJyLtK16eSHr3AJrK8B9CHrw27i7ZJsWcWyxbijk/u8OxZWGr
 3uwJ3Rr9WPMAmzDhA5NT4z20J5ypC6KpcAaechXyBX4VE1Z3dRVtijilHLoQJvEULiLd
 izMLufvawKVfAh9KefnboCF/HD8r8zqbck549nlxY4anlDl8AyLPi6kGs4YUzTlc5TLF
 jQYi3gNmeROhG7woDSi3rbWaoiT1Fda20bsLGsA+pXYhBiE+LRQjdnkACnK63vbvlnxW
 YL4IngVzvo1smATSfSEQorcWerSNkmLO238ocrntonOkunmUSpMB8hn4uQlF8AlrwAlU
 0Dhw==
X-Gm-Message-State: AOAM532M72qftD8FfxBE+CCFnNxKKvdsBY+j5YJ2iufi0/GzQ4pPvGuU
 yROcY6GUpxzKV33FuDURPHNBPwN1McKAr2fiyNC6Sg==
X-Google-Smtp-Source: ABdhPJxiW9eSCDhcmiMlyzhQ9gt6OAsF2Qc1my0rwOJnsvY6Acubh5pSDQayQNz+MH7enQN+EEdWU2vc6a8nnAMomsc=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr3599775wrs.149.1631373856053; 
 Sat, 11 Sep 2021 08:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <CACOP0z-muPwpLjimweiACOoSiAeULS_aP16+_9goOZv12gTxug@mail.gmail.com>
 <fe2a2b9d-e7b6-cbf6-ea3a-49702e297562@amsat.org>
In-Reply-To: <fe2a2b9d-e7b6-cbf6-ea3a-49702e297562@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 11 Sep 2021 16:23:25 +0100
Message-ID: <CAFEAcA8DHC+_2BqqdH88oVDoNuPGuWysMC3DjDt4oj2_wfAKLg@mail.gmail.com>
Subject: Re: simple serial device emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hinko Kocevar <hinkocevar@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sept 2021 at 22:51, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 9/10/21 9:35 PM, Hinko Kocevar wrote:
> > I have an emulated MMIO area holding couple of registers that deal with
> > serial UART. Very simple access to the Tx and Rx registers from the
> > userspace point of view involves polling for a bit in one register and
> > then writing another; when there is room for another character. When th=
e
> > guest app does write to a MMIO Tx register, as expected, io_writex() is
> > invoked and my handler is invoked. At the moment it does not do much.
> > I'm thinking now that the character needs to be fed to the serial devic=
e
> > instance or something.
> >
> > Where should I look for suitable examples in the qemu code? I reckon
> > that other machines exist that do the similar. I found lots of
> > serial_mm_init() and sysbus_mmio_map() uses around serial port instance=
s
> > but I'm not sure how to couple my "serial ops" to the "bus" or SerialMM
> > (if that is the way to go).
>
> Your device is a "character device frontend". See the API in
> include/chardev/char-fe.h. Frontends can be connected to various
> backends. The simplest backend is the standard input/output
> (named 'stdio').

More specifically, it's a UART model. All of our UART models
are in hw/char/.

> I recommend you to look at the hw/char/digic-uart.c model which is
> quite simple, it returns the last char received, and only transmit
> one char per I/O.

digic-uart does still use the old qemu_chr_fe_write_all() blocking
API, though (there is an XXX comment about that). If you want an
example of the non-blocking approach, try hw/char/cmsdk-apb-uart.c.

> Finally the hw/char/serial.c is probably the most complete models,
> with 2 FIFOs (RX & TX) and try to respect timings.

hw/char/serial.c is kind of complicated though, both because
it's quite old code that's been gradually modernized, and also
because it has to support both mmio and io port type serial ports.
So I'm not sure I'd recommend it as an example to learn from.

-- PMM

