Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A90CFDCB5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 12:52:35 +0100 (CET)
Received: from localhost ([::1]:37934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVa9S-0000Zh-4e
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 06:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sameid@google.com>) id 1iVa7L-0008Fx-JK
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:50:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sameid@google.com>) id 1iVa7K-0002mb-8a
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:50:23 -0500
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:33738)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sameid@google.com>) id 1iVa7K-0002l9-3U
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:50:22 -0500
Received: by mail-qt1-x844.google.com with SMTP id y39so10573810qty.0
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 03:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XfJg8JR87Lkrje0WQ8cx45AKvZCsaNKGqfSiDtvB3Ls=;
 b=hvdG/Bnr6HIqoG+hQm6U4+6khJvzHHqoh6g72MW6dga6wYsGEj39XoSSnUWmRbYmdc
 nznjiEFSyuiYhogOeCRCxL/zYEwCbb/bENp6XbeygczKf0UJCR4g6dK3qqhuUol3sSc/
 tBR5azY0thSeaUcFrt2M0mpieDfMjKiTWdhrojfIClfZ9+w6HAlQjBha155zLc6NKFjz
 ctusnRIoeUIptnNbsWdsezG9VE62wqZatpLgYPZY2LB95/4CU+JJTiNMmqm27qGieQfZ
 rw57AbbnvUlmYsgiT2BLwSN83B9lWbHsGRlBrCHScOjw8tQapTh3oIGTmwmWUgiCOoNK
 OEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XfJg8JR87Lkrje0WQ8cx45AKvZCsaNKGqfSiDtvB3Ls=;
 b=JTSkiZfhFZraZJj5pXZx8onqlGAeMJfEqUVxp5xfvetvx1HyRhsGNSdHFFpkbS+GSH
 T9CWa7iCvGU+TKL8Bi1CnVYushBgd6L7jIPif9GfXRVworWmPo6tGUnv2b8Rx3YjA+E7
 nFlyoCIE0m0QZciCZY45ODzko+cb6s4tL0B8dh0fz8fjbIaNNpyDgDclgyfVIwzmSv0v
 AtMSxhgqotPdsMumIMd8Ji2GizzcRAGW7iV2LNdl6JdSXqfuGjJVivqMsLBz8Sq06m4q
 4vXntCaxrc0j2PGw8yuCWUT+T7PPEf9pdHba9hxx0NO6QJER/LlY9ZZ9t4SlNb9qsJGg
 8fRA==
X-Gm-Message-State: APjAAAXP2Ws9FbXlfHp6GRzP9TpIT22Cyg642oBkHUjavjpgpMs/1JXs
 NGm2myoaXDlh8cXI0seZntwaJmZ+2oXHv5opMB/0hQ==
X-Google-Smtp-Source: APXvYqwv/lq6uZnNaUoxazGLcXTlV3zQ0Scx7q0uG3EUebzlpaaVxEFjadyfUyBjIyFPbHK9iyyE9BTQu019FWDFthk=
X-Received: by 2002:ac8:117:: with SMTP id e23mr13365099qtg.82.1573818618579; 
 Fri, 15 Nov 2019 03:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20191113091809.31365-1-kraxel@redhat.com>
 <84d3a1aa-bbb2-d831-0abc-fe1169f8a860@redhat.com>
 <20191113140057.2ocwfa3rqqfkbg3r@sirius.home.kraxel.org>
 <CAFr6bUn5W2-w3z4Ty9XD7mh+=kxVq2rQJ3ZUz5nXA13ZdxQtsg@mail.gmail.com>
 <20191114072042.wuo572evuw4hyh3l@sirius.home.kraxel.org>
 <CAFr6bUmUxN4k4AhNOZZxwXUY3uEZZHAwuno4bCvedKFJuuRp8w@mail.gmail.com>
 <20191115065422.rqu74yt2r3asnk35@sirius.home.kraxel.org>
 <20191115113546.oxsb2wipmg3rhtef@sirius.home.kraxel.org>
In-Reply-To: <20191115113546.oxsb2wipmg3rhtef@sirius.home.kraxel.org>
From: Sam Eiderman <sameid@google.com>
Date: Fri, 15 Nov 2019 13:50:07 +0200
Message-ID: <CAFr6bUnXTySHwTBYmc7gD012xAweSfQQ90eK-iy1zuiRf2Sq8A@mail.gmail.com>
Subject: Re: [SeaBIOS] Re: [PATCH] ahci: zero-initialize port struct
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, seabios@seabios.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks great

Sam

On Fri, Nov 15, 2019 at 1:35 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > I am afraid it will be slightly unreadable when looking at file histories.
> > > The only commit that didn't change was:
> > > [SeaBIOS] [PATCH v4 2/5] boot: Reorder functions in boot.c
> >
> > Hmm, looks like there have been more changes than I remember.
>
> Yep, v3..v4 diff is pretty big, so revert + apply v4 looks more
> reasonable.  Can you have a look and double-check?
>
> https://git.kraxel.org/cgit/seabios/log/?h=lchs-fixup
>
> thanks,
>   Gerd
>

