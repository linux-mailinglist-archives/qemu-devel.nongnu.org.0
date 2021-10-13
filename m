Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF1042C1D3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:56:20 +0200 (CEST)
Received: from localhost ([::1]:42860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maejz-0006VU-G6
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1maedR-0007i0-A6
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:49:35 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1maedP-0001zR-1q
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:49:33 -0400
Received: by mail-wr1-x434.google.com with SMTP id e12so8680906wra.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 06:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W+P+Lv4FPbXU5BGGhIV5KMBq7HmIIwIZKgUxDdLDGto=;
 b=1mM9ZqnMS4j+fDNc5PjbwCkyviDhXOykEP6lpkxbi+dqTDXEarZhNs5g/mMMjeGg04
 SF5YRLoH7HCs0HgiopR+Ya8PTHoScYuCf3PnrpbiD59x64yq9kXltNPuy3o27ms3WM+w
 pUrehgIoaKa/N7cQATtMtI6m4lYwULb36+X7nbCak9MrTvythoN8BIjr6q1tZQZ22xlk
 E80pKTfOnm3IRWTjA0MbhTMhIg6I7TI4ogiRKTpUPLRxm7+VixWhpM5KXmctekmKyYiV
 MpmlDU1ZJorJsr7Rz8K+Jf+Xr6doYs3ABioy029L9sCn8ZpQ7gaweAyxu1p2A8FPPE30
 5Qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W+P+Lv4FPbXU5BGGhIV5KMBq7HmIIwIZKgUxDdLDGto=;
 b=Kn7YQw5GOtnIkDCbugerhXSDKuw3BmILfOyHMoBrs0gEQsVRHr5vzVO+g3NZv1YDJx
 4Rno7PT79Tiw4bnoTtSVr2DdQDjl6kuPqvaX3O/AiIsP+HJDk5cnqHJAB+oqK9QmWpoA
 9eIvz9hJ3Rup3jPXhl/oPEOcwZQ2mn/M767THAAIEH0bbNgDfus3ySj4neGjR6vH8J32
 Zaecg3E1u6wA7+5mnC+n9/SRvlqsbTbgq8FR2tQMPgw6aW0+JisfIafX3Lx2xgzNWBpD
 oPK/Z2jQEx0jbCLLfZNE7oQFsitk9ily1tKZiQxPnCqJGEzQHOYHAaSKVWWjeqVLu5Zl
 A//g==
X-Gm-Message-State: AOAM532KT/nPQYi8+0TUyse38PlHXG2fey5C2sB6/Dl4sP5S0iNAKGjo
 5ONzKzE8QHtZpgRwZj315rG1PAWMqx6wrR7Je23bNQ==
X-Google-Smtp-Source: ABdhPJxHwLxg+St89st4JfsQOkCVeHJ5uWVV/1x5yhT6ygllfn3cklYgvMeRR8p4lyAZ57FFjdRMl1aed+5gMRlVKh4=
X-Received: by 2002:a1c:9ad4:: with SMTP id c203mr12945934wme.41.1634132968159; 
 Wed, 13 Oct 2021 06:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
 <20211007064751.608580-12-alistair.francis@opensource.wdc.com>
 <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
 <CAAeLtUBSZ-=+06SowthZds0r19w66S-ibn18st4=DU81SeJk6Q@mail.gmail.com>
 <CAOojN2Ub=ig3akjXRdtq0WkwTn+wqy_q85UzTgV=UD5Y6y+9iA@mail.gmail.com>
In-Reply-To: <CAOojN2Ub=ig3akjXRdtq0WkwTn+wqy_q85UzTgV=UD5Y6y+9iA@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Oct 2021 15:49:17 +0200
Message-ID: <CAAeLtUDSss2dco5QsT1wXQJ=bBS5ZAwjmXrH5dceZwxmqKKbSg@mail.gmail.com>
Subject: Re: [PULL 11/26] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Vincent Palatin <vpalatin@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Oct 2021 at 15:44, Vincent Palatin <vpalatin@rivosinc.com> wrote:
>
> On Wed, Oct 13, 2021 at 3:13 PM Philipp Tomsich
> <philipp.tomsich@vrull.eu> wrote:
> >
> > I had a much simpler version initially (using 3 x mask/shift/or, for
> > 12 instructions after setup of constants), but took up the suggestion
> > to optimize based on haszero(v)...
> > Indeed this appears to not do what we expect, when there's only 0x01
> > set in a byte.
> >
> > The less optimized form, with a single constant, that would still do
> > what we want is:
> >    /* set high-bit for non-zero bytes */
> >    constant = dup_const_tl(MO_8, 0x7f);
> >    tmp = v & constant;   // AND
> >    tmp += constant;       // ADD
> >    tmp |= v;                    // OR
> >    /* extract high-bit to low-bit, for each word */
> >    tmp &= ~constant;     // ANDC
> >    tmp >>= 7;                 // SHR
> >    /* multiply with 0xff to populate entire byte where the low-bit is set */
> >    tmp *= 0xff;                // MUL
> >
> > I'll submit a patch with this one later today, once I had a chance to
> > pass this through a full test.
>
>
> Thanks for the insight.
>
> I have tried it, implemented as:
> ```
> static void gen_orc_b(TCGv ret, TCGv source1)
> {
>     TCGv  tmp = tcg_temp_new();
>     TCGv  constant = tcg_constant_tl(dup_const_tl(MO_8, 0x7f));
>
>     /* set high-bit for non-zero bytes */
>     tcg_gen_and_tl(tmp, source1, constant);
>     tcg_gen_add_tl(tmp, tmp, constant);
>     tcg_gen_or_tl(tmp, tmp, source1);
>     /* extract high-bit to low-bit, for each word */
>     tcg_gen_andc_tl(tmp, tmp, constant);
>     tcg_gen_shri_tl(tmp, tmp, 7);
>
>     /* Replicate the lsb of each byte across the byte. */
>     tcg_gen_muli_tl(ret, tmp, 0xff);
>
>     tcg_temp_free(tmp);
> }
> ```
>
> It does pass my own test sequences.

I am running it against SPEC at the moment, using optimized
strlen/strcpy/strcmp functions using orc.b.
The verdict on that should be available later today...

Philipp.

