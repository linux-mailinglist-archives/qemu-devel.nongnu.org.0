Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1373322617
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 07:58:36 +0100 (CET)
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEReV-0008Km-9B
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 01:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lERdY-0007oG-Ok; Tue, 23 Feb 2021 01:57:36 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:46146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lERdW-0002Fq-1Z; Tue, 23 Feb 2021 01:57:36 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id m188so15421716yba.13;
 Mon, 22 Feb 2021 22:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m9UM4XIJQrFWbd8j4KbQaqCs9uMp5bGrBqvF7k3MQ/0=;
 b=DF2X+9+CUNEicNI6WEpknxg1TixUKjiOInWPt43IEojgH9eqGBOU89xFsN+xrbzH9X
 2MX8kFtaiIGHmIVncwRziH6+dNOgtVrm38Bni7qhBsuZ3a4qs0UpLKCatlvakSpIzu+R
 V+pBEDMgf2/21Ymd05YinT/NiQU5hQIDfe150R+9gt7bbIlSKeSkY7vc0nivIv8fQwvG
 hpRJBuTIsllXGjflj6qbFnQKdOuxM07WaszGWcB9Kn3NbVJTlQnzH1c42w4V72W12roU
 mj0lnSMl4C5htRvIS4OuQ2D9XpR2i9hMcQOXWXZFOQPZ8/gk48kdm1MGvHAoskp+ycej
 0HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9UM4XIJQrFWbd8j4KbQaqCs9uMp5bGrBqvF7k3MQ/0=;
 b=rNnvcOQLHI7BJ7OB24HzXKWYBX/NxVTPIKiQed+XjWF4eTOWgSZyvCUPukWsW8NYVA
 1LoS76ys+ENE77PncmbbM7X1ts4stotA+UEamgwD1TrHt5wxqoko+GPjbUGoZUmzm/bC
 cygtE+uStkvh17mVWRt13Jig7UdPiap6AUpJfxjJFzRhVDDG3KQYQQFESP54GAgWqR6q
 ZHlTfckO1GXxe/ZqN5gGRgYPMi5nKSCrArCw1oR9tbrjO/qRopgu7M5j1agBmnRULKYI
 0py+/fJbYQ3SfH7w4/PvgMh5ycF+hpMqXQchZO0IZXr2NkFhkZX9JApGd7hyO4rCaKMs
 9ftQ==
X-Gm-Message-State: AOAM532oLLUyvbKFN/0EOhheSylPhsMOy1J7jarW0P5pJUjDz8rmIx9c
 CjBUhjs8oWRpGtbF3ll/TeFspIEkG//fVOvg6oY=
X-Google-Smtp-Source: ABdhPJz8weeedgdwgvU+n/tzk6i5QhJhbXCVTDonjVx+tqwrH5dc6GaUsIfqU/bPFdpAF0KxjV/q14R7/d2BtKyGVuc=
X-Received: by 2002:a25:d28b:: with SMTP id
 j133mr35636933ybg.517.1614063452891; 
 Mon, 22 Feb 2021 22:57:32 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <99af17f9-10cf-7c9b-8222-2318b464f5b0@redhat.com>
 <20210222082137.1b3f8b3b@bahia.lan>
 <CAFEAcA8oqPR=PbqWaoBGfDKWik6Jv5TuE-PZqTc0W3TsoktvsA@mail.gmail.com>
 <20210222154341.0992238d@bahia.lan>
In-Reply-To: <20210222154341.0992238d@bahia.lan>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 23 Feb 2021 14:57:21 +0800
Message-ID: <CAEUhbmV+qUWtw0Cksrp9dwO2vPnCD8B7Se88a3K_dn3FENnLLQ@mail.gmail.com>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
To: Greg Kurz <groug@kaod.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 10:43 PM Greg Kurz <groug@kaod.org> wrote:
>
> On Mon, 22 Feb 2021 13:59:34 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Mon, 22 Feb 2021 at 07:21, Greg Kurz <groug@kaod.org> wrote:
> > >
> > > On Fri, 19 Feb 2021 17:51:02 +0100
> > > Thomas Huth <thuth@redhat.com> wrote:
> > >
> > > > On 19/02/2021 17.26, Peter Maydell wrote:
> > > > > Does anybody use the ozlabs patchwork install for QEMU patches,
> > > > > either occasionally or on a regular basis ?
> > > > > http://patchwork.ozlabs.org/project/qemu-devel/list/
> > > > > The admins for that system are trying to identify which of
> > > > > the various projects are really using their patchwork instances,
> > > > > so I figured I'd do a quick survey here. We don't use it
> > > > > as an official project tool but it's certainly possible to
> > > > > use it as an individual developer in one way or another.
> > > >
> > > > I think it might be used by some of the ppc hackers ... so CC:-ing to
> > > > qemu-pcc ...
> > > >
> > >
> > > I do on a very regular basis.
> >
> > Thanks for the reports. Do you use the features like assigning
> > patches to people and changing patch status, or do you mostly
> > just use it as a read-only archive-of-patches ?
> >
>
> Only the latter but mostly because I don't have the permissions
> to change status, e.g. when trying to change status of this
> recent patch from Cedric to rearrange the PowerPC docs:
>
> You don't have permissions to edit patch 'docs/system: Extend PPC section'
>
> My understanding is that users must be "maintainer" to edit other's
> patches. Only three 'maintainers' are currently listed at ozlabs for
> QEMU:

I can update my patch status in the QEMU project. I am not sure if
this is due to I am a maintainer of another project hosted on
ozlabs.org.

>
> https://patchwork.ozlabs.org/api/1.0/projects/14/
>
> We had a discussion about that a few months back with Christian Schoenebeck
> (9pfs maintainer, Cc'd) who also uses patchworks. It turned out we didn't
> quite know how to go further because of lack of documentation, but I'd be
> glad to experiment the full patchwork experience if someone knows how to
> do it :-)

I personally found patchwork is really helpful for mainatiner's work.
But it looks the maintainers from the QEMU community do not use it.

Regards,
Bin

