Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B46477BF1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 19:51:38 +0100 (CET)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxvqr-0004ZG-7U
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 13:51:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxvn0-0001oi-7X
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:47:38 -0500
Received: from [2a00:1450:4864:20::42b] (port=34321
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxvmx-0001GU-66
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:47:37 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s1so11743304wrg.1
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 10:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ah7hFnqyPldKY1f+xfKUjnDd1bmDVbuCIQ+aapZsJR8=;
 b=L1Z+x8EykT1FfSYcYZX9x9wzFZTxiNViiLtAMVvX+rS71QCtreSi41Gy8MvC+YdRqK
 FGL6BYouEEmR9b3in7Tma4s0T4y3L+JatE+JJ14v/oBJXEW/C7n5iTvqbeW+VVGC8XNt
 VUC30dM3J7nh9kYYWidxYqXZYniZLBC/cDUTEhIRzV2K4Q0nXJD8bV+AqP6RDpR0ch+R
 A2BVBiwiA8BHKyvCj8aUt6KB5T5iLRste/w7YmiPBHn7WO7thr8CLpkMi0PLrtxAOrWj
 n4wV0I0YvLn9A7Aoojm5p+B9iKIF45Ip228Y7NyTfoUXUq2bX+9G7gwwMsrR6Lmf6k/C
 U0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ah7hFnqyPldKY1f+xfKUjnDd1bmDVbuCIQ+aapZsJR8=;
 b=SyXgKA7dLKlo5AAhfgppCcXhHMxcdx4Qx/CZ9Az1L8eITTdfb3QMnFHyRGJZByC09s
 8xy8A3lcN9G3kCpGsRdhh/VBRFA+cWn0k/qymfuXi1HofkDhe8wU6MxtOGjXjK6jAv78
 VRUUDA0x6lKxJHBq1eHSAQy1SJ38hL1CmjcOucHCu1/vZ+Zaxnc2N3E0dPwHOdm/K+R2
 Ba9DpPHndAxwOR3PhDYt7YcyeTy6YDzXat/IFl3+3Y6kVifrSHlj9fJX8d3EyjOB2nN6
 U8wcD9NDGt10ik53NGbeGQW/Nt6BNDvg3UR+PBAvsarL4tIGr2Vw5P/ESpjwG6hwqsgq
 zZ4A==
X-Gm-Message-State: AOAM531iDIWl3yEelhRTpGtL6lo+xhTQtSMdBON/7IhCMNlb+FoU2lcZ
 O0lspYTJw6KhkyYm9mlzKY7dzA3rZKNKuS1yY7AeCw==
X-Google-Smtp-Source: ABdhPJyieXn9pm5gab7TTVr+XM5rbas6FJ3sSCNwo59L5m5DEX6HRECGd2uFORfB7RjR07nzmunm3pO5zc33u86S9I8=
X-Received: by 2002:a05:6000:3c4:: with SMTP id
 b4mr3614406wrg.172.1639680450136; 
 Thu, 16 Dec 2021 10:47:30 -0800 (PST)
MIME-Version: 1.0
References: <CAP4GjT1x=9z9jwRxUg-J_nyGQKiga=xcDddWzG5a9HCkiC2Tog@mail.gmail.com>
 <6b16b0e4-c0db-02de-1d95-ec831fdff938@amsat.org>
In-Reply-To: <6b16b0e4-c0db-02de-1d95-ec831fdff938@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Dec 2021 18:47:19 +0000
Message-ID: <CAFEAcA9v6JQD3OR1tKL7yJaY+=-ohhvMCzF4xpSRAATXAB59vA@mail.gmail.com>
Subject: Re: Exception return
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: abhijeet inamdar <abhijeetinamdar3005@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Dec 2021 at 17:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Cc'ing qemu-arm developers.
>
> On 12/16/21 18:31, abhijeet inamdar wrote:
> > Hi,
> >
> > I was running my .elf file on my custom machine(CM3) and was hit with
> > this error when debugging and had the required -d flags and single step=
ping.
> >
> > IN: Hal_MemFault
> > 0x7004e794:  4770       bx       lr
> >
> > Trace 0: 0x7f4faa471100 [00000000/7004e794/0x312000c1]  Hal_MemFault
> > R00=3D7004938d R01=3D00000000 R02=3D7004938c R03=3Dffffffff
> > R04=3D7005e410 R05=3D10020000 R06=3De000eda0 R07=3D00000000
> > R08=3D00000010 R09=3D1003f8e0 R10=3De000ed94 R11=3D00000000
> > R12=3Dffffffff R13=3D1003dbe0 R14=3Dfffffff9 R15=3D7004e794
> > XPSR=3D01000003 ---- T handler
> > Taking exception 8 [QEMU v7M exception exit]
> > Exception return: magic PC fffffff9 previous exception 3
> > M profile return from interrupt with misaligned PC is UNPREDICTABLE on =
v7M
> > ...successful exception return
> > DRBAR[6]: 0xa0000000 misaligned to DRSR region size, mask =3D 0x3ffffff=
f
> > Taking exception 3 [Prefetch Abort]
> > ...with CFSR.IACCVIOL
> > ...taking pending nonsecure exception 3

The logging here tells you what happened:

 * we are in an exception handler
 * we do the bx lr to magic value which is M-profile's exception-return
 * ...but there's something wrong with the return address we pull
   off the stack, because it's not an aligned value (its least
   significant bit is set)
 * moreover, it's an address that corresponds to an MPU region
   that has been misprogrammed (the DRBAR value isn't right);
   the MPU treats such regions as not matching
 * and so we take an instruction access fault

So you have two problems:
 (1) the PC value on the stack that you're trying to return to is wrong
 (2) you're programming the MPU wrong

You need to investigate and fix both.

-- PMM

