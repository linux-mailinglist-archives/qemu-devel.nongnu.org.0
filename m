Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3920B3140B8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:44:00 +0100 (CET)
Received: from localhost ([::1]:46752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DO3-0008S4-96
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l976U-0005wO-7r; Mon, 08 Feb 2021 09:01:40 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:44948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9764-00022f-Vv; Mon, 08 Feb 2021 09:01:21 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id r2so14628420ybk.11;
 Mon, 08 Feb 2021 06:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BEow9kOhlyZmc9TnY1pT8xOyDA+zAAmV+0ASk6jKlyk=;
 b=AGRuQV8GlSFtzrVSmYl2gS8iaGkF05dr2Q3sI9X9xsUZyz3BfncUTbGqU3ZrQVVlTB
 4THjOG2rg/thVo/hFPsdHXlUya9LwCRw4df8zL9yIxfe97otYVdk1hERx7Cd7ngoTgxO
 06nqqP/1whX3Hu+LzyXlPGUCyIGNyLHrd8N2jfmh3XuOABwdVdRZjOVkuNOw/lT4sbjA
 MYjRjQQRU1wqFarkZfRed+CkJtbfZAhebsczd7JJ+PlrGBfxUVFhtwwas60RJ9WzjNrN
 ZB6Y3I4H4hFipNFPixYHOviGiSZjNa9uIuNXad+66laJqEC1CoPAQAMrGak2dBtJKKUR
 rLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BEow9kOhlyZmc9TnY1pT8xOyDA+zAAmV+0ASk6jKlyk=;
 b=pYU5LsI0VuWZVOqN6uabJVGV2rmGkO2wqP6uJxGp/WFhaqrHz75Y0MDof7r3RSVXvS
 aDU2keqeiZ4fN7oQvmQsYyNUhkfrnYHHD/cyv39+ABG023MWSQfqxnVZM0cZo6JdhdGg
 4oL1UHY9Usmykv3TzfJwTfKvN8y9JYQKFfUlvuJ2pz6qM3kU7kRdVcxVl4AbsKxUwOXr
 GNYfZUg6QQIH4qIeS0hICkycNBFLSRb3zThAjbwnm/oIA5zR1VDZHAhR5YWM1KjjEHzD
 4PZ7oKNFe4QWaDskW4ELrQ6bgNvlGRvCJQU1Bd6Ppe81udOjiAN+vD5C5XyVnMgoBVof
 itiQ==
X-Gm-Message-State: AOAM530sGBD5iWn00RjFE6y+BDfWcsh+gp1Tu8MbpJCX1TFUgUeNE3T4
 0SuAfTVRwsdwjj7jJySgWbqcJ7nJJ+HJ8WyOUAo=
X-Google-Smtp-Source: ABdhPJyx6qJyHOSxMV3Af2fKQnvlBwpB6yrXvnKATcXjPXatVxrBV5OgvCvkqpChdAfLtmYbU1Ns12rYgAgUvVhhkFs=
X-Received: by 2002:a25:d08d:: with SMTP id h135mr2069620ybg.122.1612792855951; 
 Mon, 08 Feb 2021 06:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20210129085124.21525-1-bmeng.cn@gmail.com>
 <9336f3ec-b500-052b-a8f8-e1b8ec2905b6@amsat.org>
 <CAEUhbmWE5i_n1gC+UPdJPC9EsyTXkuPjoH78phSyoizwbf1P3w@mail.gmail.com>
 <cb3f68a5-6ed8-26a4-310a-fd8dbc5d8eaa@amsat.org>
 <CAEUhbmWP50LZZaoE8a3mEbYH5XUgqLSNrcAy5oCmH9NMzuTXZg@mail.gmail.com>
In-Reply-To: <CAEUhbmWP50LZZaoE8a3mEbYH5XUgqLSNrcAy5oCmH9NMzuTXZg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Feb 2021 22:00:44 +0800
Message-ID: <CAEUhbmWr4o0AgmKiknkd9W9SEjfNVCcF8g_pw3G2=u6WDqgDuw@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: sd: Bypass the RCA check for CMD13 in SPI mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Feb 8, 2021 at 9:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Philippe,
>
> On Mon, Feb 8, 2021 at 9:08 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> >
> > On 1/30/21 11:20 AM, Bin Meng wrote:
> > > Hi Philippe,
> > >
> > > On Fri, Jan 29, 2021 at 10:11 PM Philippe Mathieu-Daud=C3=A9 <f4bug@a=
msat.org> wrote:
> > >>
> > >> Hi Bin,
> > >>
> > >> On 1/29/21 9:51 AM, Bin Meng wrote:
> > >>> From: Bin Meng <bin.meng@windriver.com>
> > >>>
> > >>> Unlike SD mode, when SD card is working in SPI mode, the argument
> > >>> of CMD13 is stuff bits. Hence we should bypass the RCA check.
> > >>
> > >> Is this for detecting events by polling? From spec v8:
> > >>
> > >>   5.7.5 Event Indication Method
> > >>   5.7.5.1 FX_EVENT (Bit06 of Card Status)
> > >>
> > >>     An event indication method is introduced from Version 4.20.
> > >>     Card may use Bit06 of R1 (R1b) response of any SD command
> > >>     to indicate event generation.
> > >>
> > >>   F.2 Concept of Event Detection Method
> > >>   F.2.2 Host Implementation to use Event Detection Method
> > >>
> > >
> > > I think you looked at the wrong place. See spec v8
> > >
> > > chapter 7.3.1.3 Detailed Command Description
> > >
> > > "The card shall ignore stuff bits and reserved bits in an argument"
> > >
> > > and Table 7-3 Commands and Arguments
> > >
> > > CMD13 Argument [31:0] stuff bits
> >
> > Indeed. Adding this information in the commit description makes
> > things obvious ;)
>
> I thought that's already obvious. If you search for "stuff bits" or
> "CMD13" in the spec, you will get the information.
>
> >
> > The SPI responses are not well implemented, in this case (CMD13)
> > it is incorrect, we should return a 2-byte R2. Your patch
> > correctly skip the RCA check, but we still invalid data.
>
> This is already handled in ssi-sd.c in SPI mode. As for the SD mode,
> that should be a separate patch instead of mixing two fixes into one.

Sigh, I should have checked the spec before I replied.

The CMD13 response for SD card is R1. Only SPI mode is R2. As I
mentioned SPI mode R2 is already handled in ssi-sd.c, so there is
nothing wrong here.

Regards,
Bin

