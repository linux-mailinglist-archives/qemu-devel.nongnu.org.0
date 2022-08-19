Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5854859985E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 11:19:58 +0200 (CEST)
Received: from localhost ([::1]:59910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOyAW-0001KM-SA
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 05:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOy0p-0003fv-Cb
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:09:56 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:45812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOy0m-0001OP-Tc
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:09:54 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3246910dac3so105166477b3.12
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 02:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=BxjXz4id0AZ3P9P1aIFwFBd/Yi6UjFUKEmIrLdL8IE8=;
 b=w5z2brcO4xV8HKBKCq5oOye86SsQCQ7966aVI919VFTyTGPukuJzteZhOiplUHuriZ
 Fff5k/MKJO8CQgA6nBQAL9rIDjZ6DohhyZqZkpLze1J67QFZcu+0ifTSWFmx6utN3CXk
 MsvjyNP75ZjK0rgY4mh2LCuUUdHqwyk/Nu3jd+deDKF9ya8WtKAssEPcgRHcHDU3IewT
 2BD3NEwNhY8ewIrlyoThxbdzhUTGP3NaR+DA1MQd4FY03dUAtaRZBbdLwf+hVQsLmLcX
 Q9v89o01uxNTi4DgRHHU0nvpzVGeGYv0gaB5xapmNeIn5qwQ6G4YeRiqjaQYvymlmrX1
 5jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=BxjXz4id0AZ3P9P1aIFwFBd/Yi6UjFUKEmIrLdL8IE8=;
 b=S20r2amgWOKELj6TVkr5VaGuczQKK+lJ+LIJUwI/5AwPrBS86leoB4Lim9hBDJi3jl
 xtx8+0T+8sPTDzVcOUmk1k4IgeijowGyeGEPFCGg9dUuGsvbhYBJcElg7j4Gt7w3Urwa
 7HqE5XbP4aypEWcq88gfMjU3LGu8RF0wNqDgbBQAnObRje0mB1Zs1KeM0Vc3n2LJvidd
 aJK8xawpgrSx9wcljSx+5GyY8zsgCW6DpHkk8cxWH0gZvuecu2dpyx+0+K93H1V7NZ7F
 2AMK/AYCjj8eWBRfNEZxnn38/7ejCE+YG4TGJSPHq0TGkHVfDiZXYxYAWedgW8T7Z3Qz
 saKw==
X-Gm-Message-State: ACgBeo2+LNHsGzzb1NUpNTYrnkcrMUewmQUzF3IYtdixtrF+abfFHebE
 tiDIC1XrR53PdmqaR5VourWWiKOy55UXnX3T7X8bVg==
X-Google-Smtp-Source: AA6agR404c+8xHZnXLVdm3Am7D6f83J6b7OvPCUZLEzXnydA+j/i9g4Vwf61mhYasLNQUbC7bQs5UEuye03qxYt0sog=
X-Received: by 2002:a25:55c2:0:b0:684:4159:38f4 with SMTP id
 j185-20020a2555c2000000b00684415938f4mr6542711ybb.288.1660900187158; Fri, 19
 Aug 2022 02:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-8-peter.maydell@linaro.org>
 <CAKmqyKNo15Kz6-FtXL3C2wC7+aHHLTyGG5tOKQTpnM-c-kJO=w@mail.gmail.com>
 <CAFEAcA8wbST5bc_ZMFGAsFKGyFTkYRazeEqPnwh0aL6cNp0CeQ@mail.gmail.com>
 <CAKmqyKMqrmrhRDTn11VAa1EKEmy=fzO_d+34Qp+jWYDP0uTd3Q@mail.gmail.com>
In-Reply-To: <CAKmqyKMqrmrhRDTn11VAa1EKEmy=fzO_d+34Qp+jWYDP0uTd3Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 10:09:05 +0100
Message-ID: <CAFEAcA_Rpu78zvaHJgC9P__ARSMDRza8ZbLUto4wD=vw2AuQTw@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 19 Aug 2022 at 01:55, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Aug 18, 2022 at 11:58 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > Do you have an opinion on whether there are likely to be many
> > users who are using riscv semihosting without explicitly enabling it
> > on the command line ?
>
> I don't think there are many users. We have always stated that
> semihosting had to be enabled via the command line

 Cool -- I'll do a v2 of this with the change RTH wants, and
we won't go through the deprecate-and-warn process for fixing
the "didn't pay attention to command line option" bug.

-- PMM

