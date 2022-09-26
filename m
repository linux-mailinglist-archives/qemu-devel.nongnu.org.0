Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487F5EB3AA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:57:05 +0200 (CEST)
Received: from localhost ([::1]:60306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocw64-0007p7-Fn
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocvsP-0004N2-Ad
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:42:57 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:39932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocvsN-0006Gx-N3
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:42:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2193561470
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 21:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B566C43470
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 21:42:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ApVTPV3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664228569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3jnuCsKMQZo8/iMFxkmC6/v9Au+LPdCR3w6QTCfbEs=;
 b=ApVTPV3nWMfpht+O5md87+wb9Oxq1g00+LMG7lsugFwqcAo3/bkCp0W7q64lXJQ37j012C
 YnMdDZfhSmMbDMFDlaAoV6a1DDDZxT+3OdYs5rLiQxGfCIJ0hUTA+mfNaa3Fax2Z0RjUll
 mMGKjLEdOCYUs/zc5os5UVv7r+aMRvY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b81df552
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 21:42:49 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id m66so7878028vsm.12
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 14:42:48 -0700 (PDT)
X-Gm-Message-State: ACrzQf1ZAowoHRzm0bANEljnYMXlCP9ikzNxSz243/X+HqIOD+ANWIiD
 lMaqQgGyNHGiO1LDw6PGn1H0B1+pIyYbLnvNiAU=
X-Google-Smtp-Source: AMsMyM4ljHjfRvVHl8ZRyGKK1+syRtfkJUf7lIFJ4spQr/tikZeDGJQ0nQDFJXNaXJj31mqHpddc7eNedREbE3A5J2Q=
X-Received: by 2002:a67:c289:0:b0:398:cdc:c3ef with SMTP id
 k9-20020a67c289000000b003980cdcc3efmr10126690vsj.76.1664228568439; Mon, 26
 Sep 2022 14:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220926113900.1256630-1-Jason@zx2c4.com>
 <20220926113900.1256630-2-Jason@zx2c4.com>
 <ad4c5a70-6226-6be3-0049-65880170d8af@vivier.eu>
 <CAHmME9r7sjUVOiQDp7WuzFe7Xss1riZBLg=wQeZ5uvWjONoO6Q@mail.gmail.com>
 <5ebf4a4a-031b-0706-d199-d116cd518226@vivier.eu>
In-Reply-To: <5ebf4a4a-031b-0706-d199-d116cd518226@vivier.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 26 Sep 2022 23:42:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9qFuKwUKvqOZZMuy8v+SLBh1Dt5+5xRM=+v6ynGktbj8g@mail.gmail.com>
Message-ID: <CAHmME9qFuKwUKvqOZZMuy8v+SLBh1Dt5+5xRM=+v6ynGktbj8g@mail.gmail.com>
Subject: Re: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4
 bytes
To: Laurent Vivier <laurent@vivier.eu>
Cc: linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 26, 2022 at 11:42 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 26/09/2022 =C3=A0 23:40, Jason A. Donenfeld a =C3=A9crit :
> > On Mon, Sep 26, 2022 at 11:37 PM Laurent Vivier <laurent@vivier.eu> wro=
te:
> >>
> >> Le 26/09/2022 =C3=A0 13:39, Jason A. Donenfeld a =C3=A9crit :
> >>> Various tools, such as kexec-tools and m68k-bootinfo, expect each
> >>> bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
> >>> padding to fill this out as such.
> >>>
> >>> Also, break apart the padding additions from the other field length
> >>> additions, so that it's more clear why these magic numbers are being
> >>> added, and comment them too.
> >>>
> >>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >>> Cc: Laurent Vivier <laurent@vivier.eu>
> >>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >>> ---
> >>>    hw/m68k/bootinfo.h | 10 ++++++----
> >>>    1 file changed, 6 insertions(+), 4 deletions(-)
> >>>
> >>
> >> Applied to my m68k-for-7.2 branch
> >
> > What about 1/2?
> >
>
> I'd like to wait a little to see what happens on the linux side.

Alright, makes sense. Just please don't forget about it.

Jason

