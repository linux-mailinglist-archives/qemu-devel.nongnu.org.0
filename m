Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6139F1CB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 19:40:35 +0200 (CEST)
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2fSN-0004Zh-1f
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 13:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nsoffer@redhat.com>) id 1i2fQy-000449-96
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 13:39:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nsoffer@redhat.com>) id 1i2fQx-00057B-7n
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 13:39:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44294)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <nsoffer@redhat.com>) id 1i2fQw-00056T-UF
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 13:39:07 -0400
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35EA1C054907
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 17:39:06 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id k22so12278865otn.12
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 10:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ftZ5mHYxJ/r1cWbNXvR9Xedqss8/Zl7Y5uYU1LgNUD0=;
 b=ddgSaE5lK5aErBvdfCYdJjsLc6fwQsiOvq+Vd0+5S1IXttQM6qjEPMVogJzGgRGPgC
 +NSAt/KowAn5ve83a1sbpIUAPDQt2DaMxWTg8OkdyhKn+V1N8YA06eGW8ahnvG4AyZEp
 df0fBnREFdaMVHNwBUCxd+LVzObVTMBRAbi+Ql+CNIyvjUDlwTjWZ5AtuSW7eieOGUgU
 8dWuFQSe/szZNwrF2NVXPkV7wo0O+qUG0BJP3NX7gTXtRKIxwULxpHmdDO/W0oBnXs8A
 8ZRuEfe1V6q5oJqKYHLj0HL0UZu89JfZCe+qtk8LlXUxykcjICO/aah8JodMtYeR6UEk
 t4MQ==
X-Gm-Message-State: APjAAAWjZUNbmzUUKcjz+cJOITqjpm2uuYtSwRP0JxtqZYVTrr7l8zHW
 x5H4iCB/wvJT5+yrYd/ugpXeLK9/GCOXXetFCZaue2L/HNjrgxnufXJrsNIeCX90EeOIYCGV5Pp
 z3PmrzmvPm4Rr5FUJlzGt28RE9GbJrhU=
X-Received: by 2002:aca:d8c3:: with SMTP id p186mr65952oig.56.1566927545605;
 Tue, 27 Aug 2019 10:39:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUoK6YCKX8Uhw2YqwCqNpfb4BdOoKDVv5058f0jaS54QUy/NoNm7dzxt2BYbPgxCpjcWzI3QRx4nGapeZv24g=
X-Received: by 2002:aca:d8c3:: with SMTP id p186mr65931oig.56.1566927545207;
 Tue, 27 Aug 2019 10:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190827173432.7656-1-nsoffer@redhat.com>
 <80a6d9bc-1f5d-2bee-c761-978835f70e27@redhat.com>
In-Reply-To: <80a6d9bc-1f5d-2bee-c761-978835f70e27@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 27 Aug 2019 20:38:54 +0300
Message-ID: <CAMRbyyugLygGoa_GwkZSgiOfBK6b_zS4wbpgmG90dj4ysG-Trg@mail.gmail.com>
To: Max Reitz <mreitz@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH] iotests: Unify cache mode quoting
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Nir Soffer <nirsof@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 27, 2019 at 8:36 PM Max Reitz <mreitz@redhat.com> wrote:

> On 27.08.19 19:34, Nir Soffer wrote:
> > Quoting cache mode is not needed, and most tests use unquoted values.
> > Unify all test to use the same style.
>
> S-o-b is missing, shall I add it?
>

Thanks!

Signed-off-by: Nir Soffer <nsoffer@redhat.com>


>
> Max
>
> > ---
> >  tests/qemu-iotests/026 | 4 ++--
> >  tests/qemu-iotests/039 | 4 ++--
> >  tests/qemu-iotests/052 | 2 +-
> >  tests/qemu-iotests/091 | 4 ++--
> >  4 files changed, 7 insertions(+), 7 deletions(-)
>
>
