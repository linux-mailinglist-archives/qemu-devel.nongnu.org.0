Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E1E3A58DD
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 15:45:57 +0200 (CEST)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsQR1-0003Cs-Ko
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 09:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lsQPQ-0002Wr-QF
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 09:44:16 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:36836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lsQPO-0007uL-R3
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 09:44:16 -0400
Received: by mail-oi1-x22a.google.com with SMTP id r16so11150686oiw.3
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D1s/mvd3N+384cORHtG78KlshRZoxWiZCPKm/JqT/T0=;
 b=oX78ROwkbzn5yXNyE/ZeHq+zjlO8MYN41qrC1NXwPegrM9CKNDBJBd+0HQKhYKc0/8
 VnibCtFGe6V/vXE14bhZYfHLD5P7Qs8xO7cRbXKnp8a0IVBHzpoWqvc5mIPgfqLrkACN
 tuQ8GU5DgdM3ykPSMe72Ihb5xaPdhayxq3u5cFCgVJvHxM9HT2oUl/vWWFZSjQKw+I4D
 1eaj89L/Pc7oX4nI65i8owjabyrII22x1pwpGIKwifulaA+L/nxmP7l7NuuxyRyEwnSv
 wbRb3eWMQWLPQhZQ88zG5I0hzbulJAELV4NvtIjdNWCs1pRapo+mrAK+NtYev07yHWXt
 7cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D1s/mvd3N+384cORHtG78KlshRZoxWiZCPKm/JqT/T0=;
 b=BjF94pbda1iPnyPATRSU81o6I5cn9aJ2ayhkvL/jlUIsKE/O27gBGnShKjr7Zc0AO8
 Vfn3EGCui3JzGFZb/6Kqwb33WjEMUtBZxN+GdR/NAQ5T3uyf2G+LqsESVTW5doEUb9be
 H5ard9+WENlqQH/84BdjRQDcADm0LGqrN1vdz4NQBJMgpue+GUt72pBV7kOt3+Xx7odo
 9uIy7dDUxMjhdBWCQvZEBsJoHva7jKsO5stvwe36a5CcvK9fgiZC8elRzAJhMZT1zOp3
 qkHL33I6GOnOSbpENJBhw5vPOciF63UK89G8iOg5I4vJMnuIABCmb2/jfgcYA9l0VK2p
 cYGQ==
X-Gm-Message-State: AOAM532teqB4b5djsmocsfH9Et92WMwm3vASFFkOHiMHKkFfknO3D/Qm
 HZR0uI70uD5HgM2qyop7LzRD/cZ3wBBYv94tL+4=
X-Google-Smtp-Source: ABdhPJyp1fr3C6qeX8PNK9sxEmarFARomy8UvQHRa0QIuD0utiSjst/ievkfkR1OKH39RIrHTnY6WBPxS6/fWTljXC8=
X-Received: by 2002:a05:6808:28f:: with SMTP id
 z15mr1969975oic.169.1623591853156; 
 Sun, 13 Jun 2021 06:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAAKa2jn2vwC6oZtrL6CtbQ5U7r7tS4GXmmALjCMSby6KiupeAQ@mail.gmail.com>
 <b91537e4-5a6d-caa1-d946-8f215fe57093@amsat.org>
In-Reply-To: <b91537e4-5a6d-caa1-d946-8f215fe57093@amsat.org>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Sun, 13 Jun 2021 21:44:01 +0800
Message-ID: <CAAKa2jnaKd0Eu_P-uouoSw_wa0iQNGSk1sQ5zxo4GGZDat6T+w@mail.gmail.com>
Subject: Re: [PATCH] Fix assertion failure in lsi53c810 emulator
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheolwoo Myung <cwmyung@snu.ac.kr>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Phil,

> You didn't Cc'ed the maintainers of the SCSI subsystem (see
> https://wiki.qemu.org/Contribute/SubmitAPatch#CC_the_relevant_maintainer
> ) so I'm doing it for you:
Thank you!

> It seems you didn't send your patch with the proper tool, see
> https://wiki.qemu.org/Contribute/SubmitAPatch#Use_git_format-patch
>
> Please also mention the reporter:
>
>   Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
>
> Also your git-config is missing your name. Fixable using:
>
>   $ git config user.name "Liu Cyrus"
>
> for your QEMU repository, or globally:
>
>   $ git config --global user.name "Liu Cyrus"
Thank you again. I'm sorry that I do miss several basic settings.
I will do better next time.

> Instead of duplicating multiple times the same complex code, you could
> add a helper once and call it.
This is really a good idea.

> However back to the bug you are trying to fix, I wonder if your check
> is correct regarding the hardware we are modeling. Have you looked
> at the specifications? See https://docs.broadcom.com/doc/12352475
> Chapter 5.3 Block Move Instruction (from SCSI SCRIPTS Instruction Set),
> "DMA Command" register.
To be honest, I didn't check the specification at that time. I formed this patch
following the idea that we could discard an invalid MMIO operation to
avoid crashing.
Does it seem that this idea is not enough to form a good patch? What are
the best practices to fix an assertion failure in QEMU?

> Why are we reaching these places with s->current == NULL in the first
> place? We are probably missing something earlier.
I checked the specification for several hours today, but it is too
difficult for me.
I need more time to understand it and form a better patch.

When reproducing the crash, I found that I didn't prepare any script to be
executed by lsi_execute_script. However, `insn = read_dword(s, s->dsp)` did get
an instruction at `s->dsp`. Maybe I should check this more.

Best,
Qiang

