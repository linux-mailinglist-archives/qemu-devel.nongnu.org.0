Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A48313D7C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:29:13 +0100 (CET)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BHb-0006fE-DH
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l971F-0005G3-Ry; Mon, 08 Feb 2021 08:56:03 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:44905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9710-0000z3-0L; Mon, 08 Feb 2021 08:55:57 -0500
Received: by mail-yb1-xb30.google.com with SMTP id r2so14612079ybk.11;
 Mon, 08 Feb 2021 05:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7Zgw17efKcxr1FYWgVVWKRjftWotGVEOxQvOfJg9W+8=;
 b=oBRBUkNTIMxcQgZy7TLhO2ZySkzndBf7HXy/t5cmNBfSin7mgxB0+PlO2LhPpbXLQ2
 vxKi1JH8ANP87zxHs6nHsN+a4MOL9bVPaNJTBFX2gW/yUE3AaKYiq2bL8+nPhINAbZaR
 lGxDvoBYUIVlGUnlRrCbavJfxw7wdxES3gj3HBGrlRfzBFxqCnbG/nhFAfort+X1SF+l
 hL4JCegyFDEDc7oqxsJFiL+0iDDbIOpftkbtW87+6pZxzb/YPaP6k6WU9pylNWLscrDh
 VLBeb/kcfzmjI3trse/HB3x6UznBCF2yRfWOwB0RjJGF8IvtFbJve/+nZX3nR97SCEZJ
 b62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7Zgw17efKcxr1FYWgVVWKRjftWotGVEOxQvOfJg9W+8=;
 b=sPDwWUTtD9g5FjEdDEiLNF5S/tmyyatoc5AQNU4KgO8hOefa848ateAQPU3mrNUqVb
 FjPlP6mrcbuhtoDGWNQ9pYZv2eVNQSQr3Pk0FAhfSXhRMfOAUU7Avl5vUpDMlUMAz1ig
 /9loAq0xOLBkGCTMlH5RFXV9WgTFSDbbj5kE4n9E/oZRL/zJUaVYB0jbgLTLEy/pAtIu
 JRgJ3fKy09EPJ89qydtgcHGhUeDXk0y/FbHjHT44I/XfRyzqyw/8qlHCpeG2G1NCW4Pg
 ES8k1cxhUpceaSjN8NMlnZtG/i7F2LsaIcEHffi61mCzpfA027b7vjKoRLnSuuo3j/6t
 jxiw==
X-Gm-Message-State: AOAM533JXbbBCULvN5e0JIZvTysRcXgij+o2OYcvuzSOGBrvABc831F8
 G42P31impOj8kcZZaUyGiTsobQaJz2wTy0jtjtc=
X-Google-Smtp-Source: ABdhPJw/epi1/p5/+CylpJhii8xFEfAKYkIwD0GDOwRvobEECd4ikb6Kliv2VM0FApT8W123sKDziKFU6kUiIEROPlI=
X-Received: by 2002:a25:b8ca:: with SMTP id g10mr23941280ybm.517.1612792544003; 
 Mon, 08 Feb 2021 05:55:44 -0800 (PST)
MIME-Version: 1.0
References: <20210129085124.21525-1-bmeng.cn@gmail.com>
 <9336f3ec-b500-052b-a8f8-e1b8ec2905b6@amsat.org>
 <CAEUhbmWE5i_n1gC+UPdJPC9EsyTXkuPjoH78phSyoizwbf1P3w@mail.gmail.com>
 <cb3f68a5-6ed8-26a4-310a-fd8dbc5d8eaa@amsat.org>
In-Reply-To: <cb3f68a5-6ed8-26a4-310a-fd8dbc5d8eaa@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Feb 2021 21:55:32 +0800
Message-ID: <CAEUhbmWP50LZZaoE8a3mEbYH5XUgqLSNrcAy5oCmH9NMzuTXZg@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: sd: Bypass the RCA check for CMD13 in SPI mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Mon, Feb 8, 2021 at 9:08 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 1/30/21 11:20 AM, Bin Meng wrote:
> > Hi Philippe,
> >
> > On Fri, Jan 29, 2021 at 10:11 PM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>
> >> Hi Bin,
> >>
> >> On 1/29/21 9:51 AM, Bin Meng wrote:
> >>> From: Bin Meng <bin.meng@windriver.com>
> >>>
> >>> Unlike SD mode, when SD card is working in SPI mode, the argument
> >>> of CMD13 is stuff bits. Hence we should bypass the RCA check.
> >>
> >> Is this for detecting events by polling? From spec v8:
> >>
> >>   5.7.5 Event Indication Method
> >>   5.7.5.1 FX_EVENT (Bit06 of Card Status)
> >>
> >>     An event indication method is introduced from Version 4.20.
> >>     Card may use Bit06 of R1 (R1b) response of any SD command
> >>     to indicate event generation.
> >>
> >>   F.2 Concept of Event Detection Method
> >>   F.2.2 Host Implementation to use Event Detection Method
> >>
> >
> > I think you looked at the wrong place. See spec v8
> >
> > chapter 7.3.1.3 Detailed Command Description
> >
> > "The card shall ignore stuff bits and reserved bits in an argument"
> >
> > and Table 7-3 Commands and Arguments
> >
> > CMD13 Argument [31:0] stuff bits
>
> Indeed. Adding this information in the commit description makes
> things obvious ;)

I thought that's already obvious. If you search for "stuff bits" or
"CMD13" in the spec, you will get the information.

>
> The SPI responses are not well implemented, in this case (CMD13)
> it is incorrect, we should return a 2-byte R2. Your patch
> correctly skip the RCA check, but we still invalid data.

This is already handled in ssi-sd.c in SPI mode. As for the SD mode,
that should be a separate patch instead of mixing two fixes into one.

Regards,
Bin

