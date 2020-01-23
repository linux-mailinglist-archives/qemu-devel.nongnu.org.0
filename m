Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD8C146E8E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 17:39:21 +0100 (CET)
Received: from localhost ([::1]:60578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iufVn-0000yX-Cu
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 11:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iudp7-0002Vs-O1
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iudp6-00017Q-BA
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:51:09 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37558)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iudp6-00016X-4c
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:51:08 -0500
Received: by mail-ot1-x344.google.com with SMTP id k14so2967824otn.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 06:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G0msXm6/+rD477ShqnS+zkkLqoCdAeoGhFDfHhIPs4U=;
 b=kliP0Q7YnPhgSvQ3gyMS2imFQozAh8rI1HkIy/evEyAyrHdfUQ2w6vXQBBX3hVl7KF
 qE0DH1+hL0z+Ww9FyKtejlmmGdHb6Vf/x15YdLoKKsAtXhCE1WG0PeG7t/Yz3hy9DYQx
 BXYajeZbmZZSqQqNiNu8Rcpkqm2NnNDX1pVBqGSBYoipz6WZ+cji6s4/TTNwlzOC9EVo
 iZuI5vHM/y8CLbFQUxYlizavT7LJ+jLY/pkNyHPrOJQg/YU6fvwm9NlrdUpp6Y7qnNX1
 MzRNdRGbtwY5J/Jxa4/8mbEWiSfc9CV1QbTWxmE5HWcuuWZiO2WJBdEOOffRiKK309V+
 fynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0msXm6/+rD477ShqnS+zkkLqoCdAeoGhFDfHhIPs4U=;
 b=mMOGb72r//UdRM8PPCADH+DhRx3XcVLUXeEnlDs7UBOejLwq9d4X1mPZaKng8tzEU7
 rq/Rdse1btLs3pGJC2NGU3n11z7mHwciCWexR5Prh6tCYfTjq/Vcjwiv9H40bNsd+tHe
 YbPbmF3KAHKSKbAucZwWCjOi16Wr3Atxavc15Is5YqmHthOO2ccPppjM6umvIl5eyx/+
 B+xYvM5ShdmsEOFdvpFYCNR6smFMIXStWrgn1adSzV1y7iTLvuctZzzuOzArUWNm7uzk
 BSabbWSiwGn40t9mww7g0koDzR3Ev8jXs3DZoEBMTdFUGabQDKgUgD7yLLVW2jlj89eB
 Sc3A==
X-Gm-Message-State: APjAAAWLGiqtzFbgCERphxsFUB0w8E4YHh42m4ky1BVoskdVvhZAcP2I
 wk9VOm9WnTqu7wgKa0gnAbavT3hqugOkfEaMdjUdgw==
X-Google-Smtp-Source: APXvYqz/barNMa3SIPlDHFPnnTyxuPmJqbJEVJByvUvRj/z47dcpjZQeYum3KqbpSZE6ZOJNEtRinEU1lwA8Dwg6GRo=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr11893655ota.232.1579791067167; 
 Thu, 23 Jan 2020 06:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20200116141511.16849-1-peter.maydell@linaro.org>
 <20200116141511.16849-2-peter.maydell@linaro.org>
 <c14e6614-4411-e4d1-daab-626e575450fb@redhat.com>
In-Reply-To: <c14e6614-4411-e4d1-daab-626e575450fb@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jan 2020 14:50:56 +0000
Message-ID: <CAFEAcA9rOyE3W-r6sC7Z+ZvZ0ivmumidTQREFEJ1RfnPSP_vzw@mail.gmail.com>
Subject: Re: [PATCH 1/3] qemu-nbd: Convert invocation documentation to rST
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jan 2020 at 12:43, Eric Blake <eblake@redhat.com> wrote:
>
> On 1/16/20 8:15 AM, Peter Maydell wrote:
> > The qemu-nbd documentation is currently in qemu-nbd.texi in Texinfo
> > format, which we present to the user as:
> >   * a qemu-nbd manpage
> >   * a section of the main qemu-doc HTML documentation
> >
> > Convert the documentation to rST format, and present it to the user as:
> >   * a qemu-nbd manpage
> >   * part of the interop/ Sphinx manual
> >
>
> As I have now posted a patch that conflicts with this
> (https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg05118.html),
> and it needs a v2, I'm happy to do my rebase on top of this series, and
> stage these patches through my NBD tree if they don't land on master
> sooner via another path.

Since they've now been reviewed, I propose to put them in
via an arm pullreq I'm going to make either today or
tomorrow.

thanks
-- PMM

