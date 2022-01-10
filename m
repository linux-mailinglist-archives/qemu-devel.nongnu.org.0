Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641EE48A34F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:58:17 +0100 (CET)
Received: from localhost ([::1]:59090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73cG-0007Em-G6
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:58:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n73aM-0005IX-51
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:56:18 -0500
Received: from [2607:f8b0:4864:20::d29] (port=45928
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n73aI-0003hD-V9
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:56:16 -0500
Received: by mail-io1-xd29.google.com with SMTP id i14so19844526ioj.12
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 14:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OzYbRux4WcZCBselPH1muwYLkEAnsp5zjoBitR/PwXM=;
 b=MZxVNoyeAbzws2kBAqg2+o37g9Pm0fhjl3V1Ki7VVC9CzEFrjTph9azXj1nOUdNrbo
 Mk8jyTUXK24n0jVhUL8zMM7d98frA60W/TF82/6SVXFpQnDdvOXgtXaci41pz2W13jRw
 aqeeqhxX2lKgC0VG8eG2sLSHoIpMYiDzlW4z+rbAT2L0iXwQlD5H+oZlSP6InlRuKss8
 2r1TgYp43Xfx9Oa+MHulX9Ptx7ha3LzQHsjYDF6B2ZZ9YUgZBJ+1z+Tdx+vxA5n1wZxk
 F35sSfnVF4O9kBwX3oF0RL4FMuuwoW9ydC1qnpzgcxV+5WmIxBqAoIAIjN4dPO+DTFk+
 9iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OzYbRux4WcZCBselPH1muwYLkEAnsp5zjoBitR/PwXM=;
 b=zGVG/yFZD26u7Qfk13S1K5+VBNnjvWJjZwO/IQLkYZXYTo8CypEb5m9E6LLhTgGwPs
 +8iViWmnBhGftTmnQUqkkp1a4TZCQsHeFaq5lhHeTRFs3t+ypXesD2W7gchuDeSfbSrj
 X1rWk6ON8xlYR24RK3FOJx4xWBkI0ajqhXR35qsu5dVUwx2h1btEnDwOcl53BXCMJrWe
 x913u1XbLbB3UUu8Xmc4mcQEkrFXigyZXwp0zAI01SF8LkIlte0VHo2IXIo6vgW7xkhd
 0VzwEnjaj9uEw6ZqksPLdUHMtST7Pov30EvjAMcXdcKULNns9KQFEkCMtLZkJCcMZoeJ
 wMDw==
X-Gm-Message-State: AOAM531xY1N+gVJrLa6Png1JrWfwdPQl3xorX6W1KoKedUukjkDzsBCL
 WERu83TaQCtohd1ZxwovbbVxVS7+PCK/yYTTauA=
X-Google-Smtp-Source: ABdhPJwnjcZcuxTlWd2PCQ92aon+7eh/D+hHNCXrxF6REE3c/HC9QHcAAC5yjsVfrvWmbCRheR/ElGlVaYgLGDVio00=
X-Received: by 2002:a5e:9905:: with SMTP id t5mr917397ioj.16.1641855373431;
 Mon, 10 Jan 2022 14:56:13 -0800 (PST)
MIME-Version: 1.0
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
 <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
In-Reply-To: <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Jan 2022 08:55:47 +1000
Message-ID: <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
Subject: Re: /usr/shared/qemu binaries
To: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 11:02 PM Liviu Ionescu <ilg@livius.net> wrote:
>
>
>
> > On 10 Jan 2022, at 14:10, Alistair Francis <alistair23@gmail.com> wrote:
> >
> > My guess would be keep *arm*/*aarch64*, keymaps, npcm7xx_bootrom.bin,
> > efi-* and linuxboot*/multiboot*. That should ensure that everything
> > works for you, but I'm just guessing here.
>
> Do you know if those files are referred internally by QEMU, or the user should provide them in various command options explicitly?

I would expect them to just be referred to by QEMU internally.

>
> About the efi-*.rom files, are they usable on Arm machines too? I thought that they are x86 specific.

They probably are x86 specific, but ARM can use EFI so
I'm not sure how that works.

>
> > If you want to boot Linux on RISC-V QEMU you will need OpenSBI. You
> > can either use these or build and supply your own binaries.
>
> I don't know what to say, my first thought was that if those files can be supplied by the user, I'd rather not include them in the binary distribution.
>
> But if they are referred internally, and in certain configurations QEMU does not start without them, I have to reconsider.

By default they are referred to internally, but if a user specifies
`-bios` when starting QEMU then they will not be used.

Alistair

>
>
> Regards,
>
> Liviu
>

