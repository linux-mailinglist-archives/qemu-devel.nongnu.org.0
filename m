Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831C315D05
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 03:17:01 +0100 (CET)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9f3s-0001Bb-6Y
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 21:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9ezq-000081-Hm; Tue, 09 Feb 2021 21:12:50 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:46305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9ezl-00077U-T5; Tue, 09 Feb 2021 21:12:50 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id v123so444289yba.13;
 Tue, 09 Feb 2021 18:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XbT+VNZqA+/oaPvb+c6x01+g/DuTAB+y6s/1SobkCx8=;
 b=C9Vmc7KGcsX4z9+fqOd5yUi8B52BDX2/6pqsE9vaPn0pik5hfUg4OfuFiWmgKjCNdE
 iqV7CzDUoBtw93dBhlUpRP66f5UlJAf5zHf5NwGZlGdrtRsic3kbnyl7iwYnqgzcVzmC
 Y5uoF0f9KnxJ7ALfOdIk4IUo2kOJJ+imEybmOnoMhVaRMV9DSuQ1nM09cpmjDYYOekq8
 8JHOYAp1erxb9v6sWOPzmkLgL4oSfATBBuMK/bQLQmzNUovLKkkxlWUM6lCox/PR5XLZ
 oacnoxvM/+WAzRpEaD9IIhmW0+D6n4b8mb/1jj1RfXP4o9IAZHHeZy1P1evLNUSoaHsr
 tpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XbT+VNZqA+/oaPvb+c6x01+g/DuTAB+y6s/1SobkCx8=;
 b=hqAc9fkLyFRt3uELIguQX67Rob8IiuNAkZCq5DUAxWdTxkvJ+apWJ2Dg80LTrBmM3Y
 k2FaJaAweNsv5eqAW8KuTrK3XPh5IuSNTFEUAO1JlsaL7cv62OMQMHvwiIQ7SjGbN9UT
 5hTYnyp8aQjOcH7H08klmKXFXUqFqRFIWe/POYb0VeiCW6+aopBpkIGCwA4e6BaFsKru
 zm/6/ACcLPgFM6pnAjsSptA0uhQOnj/gJWb7QKdphu09lkFtRtO9sv+A1mrirPWcuCFq
 scKWEMAaCQvGm1wFvkQEbnloGbuUhnD8TibeuwMWHB1z5bzx9bKGHQ+j0c/W2WeTh0mb
 OmEw==
X-Gm-Message-State: AOAM530pL8pLBQ+WZAgHaBB3YqnmqWVGo24NxcLABop5Mg03xJoHshQS
 gLKD23c6MiKHPCAh0YSmINwpgNlqyk8G4YFXhrV0rLRc
X-Google-Smtp-Source: ABdhPJxor/Mk+AIG03xO+DVrDdye4nqrhNIWFwawXBXQ8G02OsNheunInzZYlJwGZrWXCNDgz5feSJ/MRimIXawhUy0=
X-Received: by 2002:a25:3bc5:: with SMTP id i188mr1136000yba.332.1612923164011; 
 Tue, 09 Feb 2021 18:12:44 -0800 (PST)
MIME-Version: 1.0
References: <1612777258-23354-1-git-send-email-bmeng.cn@gmail.com>
 <20210210014159.GE4450@yekko.fritz.box>
 <CAEUhbmWeH5CDRodyYtYs-f0G-SUdksop4MRiHTocntbcWM3rmA@mail.gmail.com>
 <20210210020852.GG4450@yekko.fritz.box>
In-Reply-To: <20210210020852.GG4450@yekko.fritz.box>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Feb 2021 10:12:32 +0800
Message-ID: <CAEUhbmVjmRw-SSe1twLC2+mr55r+e6v5z2htTHM=0o4eOPKd9g@mail.gmail.com>
Subject: Re: [PATCH] target/ppc: Add E500 L2CSR0 write helper
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On Wed, Feb 10, 2021 at 10:09 AM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Feb 10, 2021 at 09:53:53AM +0800, Bin Meng wrote:
> > Hi David,
> >
> > On Wed, Feb 10, 2021 at 9:50 AM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >
> > > On Mon, Feb 08, 2021 at 05:40:58PM +0800, Bin Meng wrote:
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > There are several bits in L2CSR0 (exists in the e500mc/e5500/e6500
> > > > core) that should be self-cleared when written:
> > > >
> > > > - L2FI  (L2 cache flash invalidate)
> > > > - L2FL  (L2 cache flush)
> > > > - L2LFC (L2 cache lock flash clear)
> > > >
> > > > Add a write helper to emulate this behavior.
> > > >
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > IIUC, these are essentially write-only bits - they have some side
> > > effect when written on real hardware, but won't ever be read back.  Is
> > > that correct?  Do you have a reference to hardware docs describing
> > > this behaviour?
> > >
> >
> > Please see https://www.nxp.com/files-static/32bit/doc/ref_manual/EREFRM.pdf,
> > chapter 3.11.2
>
> Ah, thanks.  So these actually don't operate quite how I was
> suggesting - they are readable, and return 1 until the operation is
> completed.
>
> So what you're effectively doing here is simulating the cache
> operations completing instantly - which is correct because we don't
> model the cache.
>
> Can you please clarify that in your commit message, including the
> pointer to the chip doc.

Sure, will do in v2.

>
> > > I'm assuming that because we don't model the L2 cache, it's ok that
> > > your implementation just ignores writing these bits, rather than
> > > performing the cache operations requested?
> >
> > Yes, guests may read back these bits to confirm the operation is done
> > by hardware after writing 1 to these bits.
> >
> > >
> > > Is that still true for the flash clear operation?
> >
> > Yes.
>
> Ah, yes, I see.  The name made me think this might be something like
> dcbz, which has visible effects on architected state.  This is just
> clearing cache locks, which we don't model in any case.
>

Thanks for the review.

Regards,
Bin

