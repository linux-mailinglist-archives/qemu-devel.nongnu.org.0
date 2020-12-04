Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606CC2CEC76
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 11:48:37 +0100 (CET)
Received: from localhost ([::1]:52640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl8df-0000Nj-UN
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 05:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kl8c8-0007tD-L2; Fri, 04 Dec 2020 05:47:00 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:36243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kl8c7-0003Ub-0X; Fri, 04 Dec 2020 05:47:00 -0500
Received: by mail-lj1-x242.google.com with SMTP id a1so4741438ljq.3;
 Fri, 04 Dec 2020 02:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g7XlWyM7X8NbBf7lihp3KHzzhuiKczrh82RglMj+YxI=;
 b=RKlTwJScKPmz5MH5FOwBQKkDQICBrmxXOShGZRM4kBfPKIv2qZpQU6k2JT1Me3/gfj
 oMEMq8einxZr0YSW3urQ+WJtSbULzpkhjiPjlDneefqYrMpkhQOeCJ8ai2+j8Cjr3Rp2
 NFZFX7m9u7QZIynoL0CvoFN9MuP6Cm922BjwhC/F2uRu2/wmxQclLmHrQyzHLyIt6KyP
 9WqL8W7S/2iga4BlNZfXcrNObWpAxMgcId2caNaiY8QLkrDIX1aApudVPThOcX26S9c/
 2NN0CjddHmNIxLGl1XeWQnXO5ah2In4Wf7bMQ6SDHXTfmK7cZi+FPM+ronWpJpplRMu6
 3X3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g7XlWyM7X8NbBf7lihp3KHzzhuiKczrh82RglMj+YxI=;
 b=Y59vufXdRVWwdFPFNk2OF/CWjEPzbaTq1NOopGmLwc9oNaU10M/TnvD0sR0PslEO+0
 PUyAwYRDyVe9t7yb5IkVmS9hMkh6srCLDvFrUa6/vTlN3FDBCJQjxLu25bSTBG+/Ivdw
 d3M4qC+DEtMnjL43+DnwO/rwTy/Te7TOqP63CMTEE9URyecPUFS79U/8diiO67NHzVvw
 d2iosOTZVjaEDeAa08zDKezu02n7l5I7+2tTVNiqKUjvOgee6hXbn7hnaTRozL7ATM0M
 epNHMI6MYOS+hdFyA6Lkk4pzMhHt8vwJDKKsba5KB9MOtl4PDtxP9IQ7ROkcsy7x5+y8
 KwMg==
X-Gm-Message-State: AOAM530Osh65+Q6u7LPN7c7h4aQffbZpX/WkAyBNj34EjU04tO4ExJDz
 A1qYL4JObfH4TDlmCD0WZH8=
X-Google-Smtp-Source: ABdhPJxaQ4hApUSQ9qqYllkYOFKnxGVnD/TA3xkE2iiIL4WIV06lRyV3+ec39O0Fj0lsn+9IIZHS8g==
X-Received: by 2002:a05:651c:14d:: with SMTP id
 c13mr3092937ljd.153.1607078816526; 
 Fri, 04 Dec 2020 02:46:56 -0800 (PST)
Received: from fralle-dell (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 m21sm1573942ljh.82.2020.12.04.02.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:46:55 -0800 (PST)
Date: Fri, 4 Dec 2020 10:46:54 +0000
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
Message-ID: <20201204104652.GA16865@fralle-dell>
References: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
 <20201203083759.GA2661@fralle-msi>
 <CAEUhbmVkF9W12o04JnYofLLWwTfnNBJDnC+_8iZvdgnyonMYag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmVkF9W12o04JnYofLLWwTfnNBJDnC+_8iZvdgnyonMYag@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x242.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Bin,

On [2020 Dec 04] Fri 15:52:12, Bin Meng wrote:
> Hi Francisco,
> 
> On Thu, Dec 3, 2020 at 4:38 PM Francisco Iglesias
> <frasse.iglesias@gmail.com> wrote:
> >
> > Hi Bin and Alistair,
> >
> > On [2020 Dec 02] Wed 11:40:11, Alistair Francis wrote:
> > > On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > SST flashes require a dummy byte after the address bits.
> > > >
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > I couldn't find a datasheet that says this... But the actual code
> > > change looks fine, so:
> > >
> > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > Alistair
> > >
> > > > ---
> > > >
> > > >  hw/block/m25p80.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > > index 483925f..9b36762 100644
> > > > --- a/hw/block/m25p80.c
> > > > +++ b/hw/block/m25p80.c
> > > > @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
> > > >      s->needed_bytes = get_addr_length(s);
> > > >      switch (get_man(s)) {
> > > >      /* Dummy cycles - modeled with bytes writes instead of bits */
> > > > +    case MAN_SST:
> > > > +        s->needed_bytes += 1;
> >
> > 1 dummy clk cycle is modelled as 1 byte write (see the comment above), so 1
> > dummy byte (8 dummy clk cycles) will need +8 above.
> 
> I think you were confused by the WINBOND codes. The comments are
> correct. It is modeled with bytes instead of bits, so we should +=1.

What the comment says is (perhaps not superclear) that 1 dummy clock cycle
is modeled as one 1 byte write into the flash (meaining that 8 byte writes
are needed for 1 dummy byte). Perhaps it is easier to understand
looking into how the controllers issue the command towards the flash model
(for example the xilinx_spips), the start of the FAST_READ cmd is issued
as writing the following into the flash: 1 byte (cmd), 3 bytes (address),
8 bytes (8 dummy cycles -> 1 dummy byte).

Best regards,
Francisco Iglesias

> 
> > An option could be to fall
> > through to the Windbond case below instead (since it seems to operate
> > likewise).
> >
> > Best regards,
> > Francisco Iglesias
> >
> >
> > > > +        break;
> > > >      case MAN_WINBOND:
> > > >          s->needed_bytes += 8;
> 
> Actually this is wrong. This should be corrected to +=1. I will
> prepare a patch for it.
> 
> > > >          break;
> > > > --
> 
> Regards,
> Bin

