Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BAF3369A1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 02:28:06 +0100 (CET)
Received: from localhost ([::1]:48014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKA7R-000101-9x
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 20:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKA5k-0008RN-Vo; Wed, 10 Mar 2021 20:26:21 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKA5i-0003KG-K7; Wed, 10 Mar 2021 20:26:20 -0500
Received: by mail-ej1-x636.google.com with SMTP id mm21so42730394ejb.12;
 Wed, 10 Mar 2021 17:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D4a9W/kiyHctPnOZKhXnazom/5p6IkQUgSsTjgjYrgI=;
 b=NJvPWBpsjQEg2nn/hYQPPpimxVtO7KTct8+ybpTkLuTVYiq4GK1Jh0jOd7qP9Fb04k
 sbhnp6cxwqr7lzk/Yip2t4YYhU66QIpKoSLdl8g4J7aeCSHodmCP2Ej9Gta0IXABFyUH
 D4xntvPRhsFbWjW8f8fv6QwfZTlrD9BmwW9kdPgr2uqbimnYtuiamQYNzHKbHn/phSGe
 GLo+F8R/yvbdSdEeZkVaqFF3FbtTgJfc6yiiWaMeJ3LUt8X3li1dAAFg45bj0s5eZ+Zx
 wv0kXN8DGUsbYQl/ZDSoZv46++dyqrDDkLMxOL8VNxQ/LPXPUHMakHO08QtdIALsTgpM
 2h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D4a9W/kiyHctPnOZKhXnazom/5p6IkQUgSsTjgjYrgI=;
 b=nUaorNswq9JynTqnHjBRqXFHZum3nYidTB9nqEoOnTQaaOFBZNMFYxcyJJgyufT3Fz
 HybJlxcbnJOWmQvmxoWF3rizNWMUhw1AA15fydPIvWgVBR4LlDONWsnZ6msFTox4Y3E1
 VI1kO8zg+jqxQWdrRbL3/zO1pavMCHN1cpwkrwiAVlo+/Zw+SNEfVAQLLerojfs4XOL7
 3gkI2tqeupiHQxhf5dFeHODc5++ERwWP2Q/gcX89/KUkTBcOo2Qo1MqI1fQ/NLB8AfKX
 f6EKFD4qPcK5NDeWxJnyo6CtrBRcHaYF9cIOGRO8Um7QZOURmric3xvYj14S8CDfW5K3
 jMpA==
X-Gm-Message-State: AOAM531tggrb5OuTZmSPxVaFXn8gHbbGS9gQgvIAV1LrvZhE9e2rKD76
 +mgghnIRS+uu79OKyxle4/pLraqMspGHAj2mVKU=
X-Google-Smtp-Source: ABdhPJyjP9APsuuGEGlnzmt4gEX94fBlqbw8rtjehkT/nBEf0fo6OJKF20/JB8BxA5/ouLVKvKDzsgF65bheQSUtFso=
X-Received: by 2002:a17:906:a86:: with SMTP id y6mr690568ejf.354.1615425975480; 
 Wed, 10 Mar 2021 17:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
 <CAEUhbmWKHYxHvRfZ+Z24+gxLQrSvxxq2uqRjB9Fx2jLqdiSrZw@mail.gmail.com>
 <YEhgYnobMORMwaH5@yekko.fritz.box>
In-Reply-To: <YEhgYnobMORMwaH5@yekko.fritz.box>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 09:26:03 +0800
Message-ID: <CAEUhbmVg8m5FueVL-+_nHFJoYNxDYCMc7xKC9NDSYoPaa2jgAA@mail.gmail.com>
Subject: Re: [PULL 00/20] ppc-for-6.0 queue 20210310
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 7:01 AM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Mar 10, 2021 at 12:43:53PM +0800, Bin Meng wrote:
> > Hi David,
> >
> > On Wed, Mar 10, 2021 at 12:10 PM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >
> > > The following changes since commit b2ae1009d7cca2701e17eae55ae2d44fd22c942a:
> > >
> > >   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20210307' into staging (2021-03-09 13:50:35 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210310
> > >
> > > for you to fetch changes up to eb7f80fd26d73e7e1af105431da58971b1dba517:
> > >
> > >   spapr.c: send QAPI event when memory hotunplug fails (2021-03-10 09:07:09 +1100)
> > >
> > > ----------------------------------------------------------------
> > > ppc patch queue for 2021-03-10
> > >
> > > Next batch of patches for the ppc target and machine types.  Includes:
> > >  * Several cleanups for sm501 from Peter Maydell
> > >  * An update to the SLOF guest firmware
> > >  * Improved handling of hotplug failures in spapr, associated cleanups
> > >    to the hotplug handling code
> > >  * Several etsec fixes and cleanups from Bin Meng
> > >  * Assorted other fixes and cleanups
> > >
> > > ----------------------------------------------------------------
> > > Alexey Kardashevskiy (1):
> > >       pseries: Update SLOF firmware image
> > >
> > > Bin Meng (2):
> > >       hw/net: fsl_etsec: Fix build error when HEX_DUMP is on
> > >       hw/ppc: e500: Add missing <ranges> in the eTSEC node
> >
> > It seems the following patch was missing?
> > http://patchwork.ozlabs.org/project/qemu-devel/patch/1613660319-76960-1-git-send-email-bmeng.cn@gmail.com/
>
> Huh, sorry.  I don't know how that dropped out of my tree.
>
> I don't really want to delay this batch, so can you resend please, and
> I'll include it in the next batch.

Sure, will resend.

Regards,
Bin

