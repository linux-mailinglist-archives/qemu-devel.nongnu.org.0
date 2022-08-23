Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0083659E519
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 16:26:19 +0200 (CEST)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQUrC-0007iX-DU
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 10:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQUnD-0003ez-F1
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 10:22:11 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQUnA-0007Id-A4
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 10:22:11 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-333a4a5d495so382845697b3.10
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=6sCcO+czUNvV2xfGnZUi8UpVs6Iz+lx4c4qyPpFqObQ=;
 b=t7UTDgxN8O/OEkRS61iSK4CzSp2Nmp9KWcF1BX/vAT96Vn+vaBI5RLv6jdm0qFzj1o
 uDRApy9UCfrPoGPvHJmp632LQshdVuDPFr1mgKJIRbqLarGajnuEeEnTczI23H6gSdXu
 a286AdhxDlRZHj3IYU7U7svYjRfmtE7zRFsDlUZOQ5EGfM8ePb13XKxdcI1SudRuBcLb
 Xd7+O4mQiNdoIY8ZLq9LleEopR1UFUY8XKfFRnDKpzElqH2jnx1yGNQmQSRxgpN2pFaY
 SlAOua9sZX4fqJLtkDb6bIYwWsVYNjCUFGF56/NtfcZ9Cs76Kv8M5hOPhfq04VY9G4ny
 kFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=6sCcO+czUNvV2xfGnZUi8UpVs6Iz+lx4c4qyPpFqObQ=;
 b=q36qDDUej2miVcWiX9zJTGewqK0tGOt2ugVfNgEVCUHRe1EeWFNfWXmO6biU3g+cjN
 BMwx8gK0Z68dyTizUbTsjmMmDgIS2m/hwASg/wzXWhVRtnqsVmVRyvT+8c00Qn4qjRYU
 pKEh/zP1MRnKqvRg4ccBFPqF3sQ1CgVZvj4f42ab8Bkw4DuX7pI0J9Mriy4iMvjGTbGY
 hMBo5yndumRahApsmWnpt41JdDbszeAhpQqOq7vDclbIDuiWA1fhiL4n/fry/Nz95smg
 mCa59L8O51/XS55WeAntocm0WssyxP1dzrUGSlulVqwlE3w8t4zW4c6axAT/oe2fJuYK
 wfxA==
X-Gm-Message-State: ACgBeo0uvdva90c3+mnu5va/+qQ5sFl8qvfAsj2rfuHqN26LRTVvjjI6
 C9I+z/nborE1zVVo+im8ggi1HawWQ3H1MCYE8FcAtg==
X-Google-Smtp-Source: AA6agR6nD/ZKX9J7BRIbyTchQ4AndifGoCKelVFFEx/2e/6wOwkus4aDFeDZG9mAYktmmMKyBT+3y5r03nqYFwXwK6U=
X-Received: by 2002:a25:4288:0:b0:692:8c1e:2e7e with SMTP id
 p130-20020a254288000000b006928c1e2e7emr25264033yba.479.1661264526931; Tue, 23
 Aug 2022 07:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
 <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
 <87r11gbjbv.fsf@linaro.org>
 <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
 <CAJtCPL3Hef3d6sDA+pYJ6xChHS7y1J+2Cn9qf1NT0hwaBT8iTg@mail.gmail.com>
 <CAFEAcA8TmrMo+MOhOutUuwE=GOEFYUGxgRA2_XGZ2iunMTAe5w@mail.gmail.com>
 <CAJtCPL10GL8JL2qb-sZTpmPaHTy7fOoEDb194ZL1NSvXpqGaUQ@mail.gmail.com>
In-Reply-To: <CAJtCPL10GL8JL2qb-sZTpmPaHTy7fOoEDb194ZL1NSvXpqGaUQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Aug 2022 15:21:25 +0100
Message-ID: <CAFEAcA8ozX22==9T33gxS9Ks31fzMgKH9-Eic03gMsg86iTYmA@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: Shiny Saana <shinysaana@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 23 Aug 2022 at 15:00, Shiny Saana <shinysaana@gmail.com> wrote:
> From experimentation and dissasembly on the ROM, (located in 0x0020_0000)=
, the very first int (converted to BE) is "0x2020_1000" , which is located =
to "OCRAM2", also referred as "ROM RAM" by the documentation, and the next =
int is "0x0020_2091", which both points inside the ROM itself , and which w=
hen forcibly disassembled in Ghidra does look like a function.
> So I'm pretty confident the initial vector base address is 0x0020_0000.

Right. In fact, rereading the datasheet, I see that I overlooked
that the IOMUXC_GPR_GPR16 reset value is actually specified. Bits
[31:7] of that are the CM7_INIT_VTOR, which is to say that they're
bits [31:7] of the initial vector table address. And they're set
so that is 0x0020_0000.

Your board code should be setting the init-nsvtor property on
the armv7m object to 0x00200000, if it isn't already.

> Regarding the "kernel loading" issue, I believe that I was initially
> mistaken. From other examples online, I believed that it was the way
> to load the Teensy image. But thinking and discussing it with another
> ARM dev, wouldn't the ROM itself actually be considered the kernel?

Yes, this would be in line with the way we use -kernel on other
M-profile board models.

> Knowing that, if the call to  armv7m_load_kernel() is mandatory,
> maybe it would make sense to load the ROM in C code via this
> function, with the compiled ROM addresses from 0x0000_0000 to
> 0x001F_FFFF being padded with 0.

That's one way to do it. I think it would be better to adjust
armv7m_load_kernel() so that it loaded the file to a board-specific
ROM base, which would avoid the need for the weird zero-padding.
Two options:
 * we could make armv7m_load_kernel() take a base address as well as
   a size for the region it loads the "kernel" to
 * we could have armv7m_load_kernel() be clever enough to query
   the CPU to find out what the VTOR value is and load the
   "kernel" there

I'll have a think about which one of those I prefer, and maybe
write a patch...

thanks
-- PMM

