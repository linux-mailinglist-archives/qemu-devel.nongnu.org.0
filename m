Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981FD6142BF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 02:15:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfs1-0001nA-Rz; Mon, 31 Oct 2022 21:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1opfrx-0001mv-CI
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:15:10 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1opfrv-0003rw-LL
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:15:08 -0400
Received: by mail-qt1-x82f.google.com with SMTP id l2so3824391qtq.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 18:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=67tA4PDXuk8zrdpGOuDdJ2gkjp5wGD1FrFWQtGM3kAc=;
 b=BomedR8E9DfsrWh8CPArt/vFFZ8Zwr+1kuZcXcSrklqbXU1xFaKDoZZsjc7Nv1yGwV
 6QxbynNyP/IyTdYbz4XSSM+8nCx9xU/lj95A4FY5oKfK/wR5n93ibym26kx7ZJ4xThxG
 pSy1ce4VJR3ug/rbRRdsCNEJRKOdEv+HAk6x1byDeScTzu6HR4KzYkYq594Qo6latt16
 lak/Ipcg60znvT8ARjyEb8ABSq/j1YowJBEu+9VhGw0KmbppEWfV/Ot0llWxBCVk7D1e
 ITi1/XVx3HLAO3UtbloYjOGxgyeEGYj6tAhLEiWHZ1/t00iz6g1HJhC+jflPvWftVvhD
 E9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=67tA4PDXuk8zrdpGOuDdJ2gkjp5wGD1FrFWQtGM3kAc=;
 b=7zFGbzIJkvZmr96H9M17pkrxFtACFoUBbnBPfZ2CU8/dXnjvXcF6n4sbxZtTJySc0b
 E7Pjjlgwg7P3civ3PN7+De06o6I3Up4mc9zELtCdit07vI5/ZdvmGfXe1ZW1a7DP37+p
 hebeaFGULSYLqoXY8Uz4/jIP4+GqYGBchpl3mirB0tlR0ag0tK20s14fM8593CYPpa2f
 ox8ByUGmQ7z8nk1aCku79JQHeNI2DpXnatiLP3XkbJ9McWM/xZ0bqx7wm2gfO83jcYwD
 nqVloGbpZ8jSzSLZCjVf9Kgo5jULYqLigampjGhPZisj1/0D829P4/eEih08t3qjszCS
 ei8g==
X-Gm-Message-State: ACrzQf1mQP5meV9FjoMkY75N17v6omcNGtDcFCraF3pZThFhFG967oA7
 E+d7LDfjqQcYZP/1DAXnziysUbquPYyfJMhkE3F8wGlYsrA=
X-Google-Smtp-Source: AMsMyM4bYr7wipMYfTHunXoZawtik4/ZT2xgBRcHUXDNzsh4HLNtVOOF6mvffV451FfvRE+6cNtwKqtt8SgGzbdL8Y0=
X-Received: by 2002:ac8:57c5:0:b0:39a:6512:6e3e with SMTP id
 w5-20020ac857c5000000b0039a65126e3emr13202288qta.334.1667265306067; Mon, 31
 Oct 2022 18:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221019102015.2441622-1-bmeng.cn@gmail.com>
 <CAEUhbmUmE12maezBm9x0EJQnTQkavMa8EcoNPd8LcHTawFQzYg@mail.gmail.com>
In-Reply-To: <CAEUhbmUmE12maezBm9x0EJQnTQkavMa8EcoNPd8LcHTawFQzYg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 1 Nov 2022 09:14:55 +0800
Message-ID: <CAEUhbmWNRpZp0EvNC9snrpqTVDx13EhBzSWxiKta_ZAjcfkDDA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] util/main-loop: Fix maximum number of wait objects
 for win32
To: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Hi Daniel,

On Wed, Oct 26, 2022 at 12:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Oct 19, 2022 at 6:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The maximum number of wait objects for win32 should be
> > MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > Changes in v4:
> > - make the out of bounds access protection explicit
> >
> > Changes in v3:
> > - move the check of adding the same HANDLE twice to a separete patch
> >
> > Changes in v2:
> > - fix the logic in qemu_add_wait_object() to avoid adding
> >   the same HANDLE twice
> >
> >  util/main-loop.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
>
> Ping?

Would you queue this series? Thanks!

Regards,
Bin

