Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B60C53FAAB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:01:19 +0200 (CEST)
Received: from localhost ([::1]:60344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyW1W-0003PN-8h
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=w5i/=WO=zx2c4.com=Jason@kernel.org>)
 id 1nyVp4-0007lI-7P
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:48:26 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:43582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=w5i/=WO=zx2c4.com=Jason@kernel.org>)
 id 1nyVp1-00026O-5n
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:48:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F4B161252
 for <qemu-devel@nongnu.org>; Tue,  7 Jun 2022 09:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87403C385A5
 for <qemu-devel@nongnu.org>; Tue,  7 Jun 2022 09:48:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="oYzlwAoY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1654595296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EXnEGOlOoorlOymfhfFprGYEDfkZN+Y3S5++2IMnflg=;
 b=oYzlwAoYMurtDwIUicLccT0qm1Ifoi4Y53LhnxHwIEbDkPCJUangLvd6YSCP3zUbpxbhSA
 uXgl+106M2HytA5sAGgRZkYJxtaFx+YEzvXaiQsjLcH8A+WaB4Wk7MJ7/opiQNuT2ounQk
 raVYiOMz3g+huCNwsBsEWO1AlTxglsQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 21234db5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 7 Jun 2022 09:48:16 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id p13so30231139ybm.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:48:16 -0700 (PDT)
X-Gm-Message-State: AOAM5300UFwkCU6unoT2nb0KYJSD3z4k3Z7sHxvX5hkgBXTIYWkViLm1
 cJ/p0b2YWKlw27sZ+W0tsyTVuGgQHpDnps2xZiA=
X-Google-Smtp-Source: ABdhPJyDTNxIehXogC1xLFjIVfBlEKeEQ7GDh9XwX2Nm/yBzVZ7RIfuFIMK2CDmTGpPFzqVCmrfz2YvUgpRVDOBqp8M=
X-Received: by 2002:a25:8d92:0:b0:656:a73e:a7f with SMTP id
 o18-20020a258d92000000b00656a73e0a7fmr28007746ybl.382.1654595295799; Tue, 07
 Jun 2022 02:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
 <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
 <YpkWllpTFzb2HHY5@antec>
 <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
 <YpwNtowUTxRbh2Uq@antec> <Ypxb/VDfYLFg3n2s@antec> <YpxnHaaizsNpOjx8@zx2c4.com>
In-Reply-To: <YpxnHaaizsNpOjx8@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 7 Jun 2022 11:48:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9r2qGQxh9TXZ+zyytJpqQL3uyV1+=9V32LVNXFaUud3ag@mail.gmail.com>
Message-ID: <CAHmME9r2qGQxh9TXZ+zyytJpqQL3uyV1+=9V32LVNXFaUud3ag@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 QEMU Development <qemu-devel@nongnu.org>, Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=w5i/=WO=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

+ Arnd

On Sun, Jun 5, 2022 at 10:19 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi folks,
>
> On Sun, Jun 05, 2022 at 04:32:13PM +0900, Stafford Horne wrote:
> > Why can't m68k switch to little-endian in qemu and the kernel?  The m68k virt
> > platform is not that old, 1 year? Are there a lot of users that this would be a big
> > problem?
>
> I also share this perspective. AFAICT, m68k virt platform *just*
> shipped. Fix this stuff instead of creating more compatibility bloat for
> a platform with no new silicon. The risks of making life difficult for
> 15 minutes for all seven and a half users of that code that only now has
> become operational is vastly dwarfed by the good sense to just fix the
> mistake. Treat the endian thing as a *bug* rather than a sacred ABI.
> Bugs only become sacred if you let them sit for years and large numbers
> of people grow to rely on spacebar heating. Otherwise they're just bugs.
> This can be fixed.
>
> Jason

