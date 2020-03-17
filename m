Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE83188469
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 13:39:24 +0100 (CET)
Received: from localhost ([::1]:60640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEBVD-00044h-Jn
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 08:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38964)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <linus.walleij@linaro.org>) id 1jEBUH-0003A8-No
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 08:38:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <linus.walleij@linaro.org>) id 1jEBUG-0001eG-BR
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 08:38:25 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:34680)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
 id 1jEBUG-0001S2-1D
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 08:38:24 -0400
Received: by mail-lf1-x142.google.com with SMTP id f3so6780630lfc.1
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 05:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RxvspXpJnT1wLGWC1yqAwht7wPofjiDL2MZ2V4GJU0s=;
 b=hnj4sEry8e72e+4XxcViMh2kR/clVi9rs+0bXE1Bk+1jnM9tAaTyTvgL4uYk9HGokQ
 CS6JmX/z0c6hGZP4+/nsjdwrRToHL2MnmrEP2s5tbTN6meK7gab1DE86o95g8btZIabJ
 X0Nb39RB/DJ0JWjBmqOkl9uU6GNs9+S6/0dZvKl3+nAxc/hPOac2EFucKTzFdRe8iZbM
 pd2Cz/K1I/XtSdYirkd2zkc5FVQnbLpfFYWuWeR4JcwrggK69xvkfXK7qVwpyd+zrveT
 XkUuyowMJlxJdZtfXDBqIGaPNwQ4N/hPoHdbjT/raGV9/FQs/kLHLi9N8GnTZjdSG/jt
 rWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RxvspXpJnT1wLGWC1yqAwht7wPofjiDL2MZ2V4GJU0s=;
 b=J9scx8tbr3v3OOXIXZJ6NcWvrkrWRSmb/YlP+rrdAxFc2m9AO44KRcqzw0kppGT3fP
 w5sPR9xOu1MBowH5cmwEAN7UT+X13MU5S7q9gsoCaKvcnH9glBE+Z56dSAApMmih0b5S
 sk6Uyc8CoQdp/haaw9d64BSoQTKPsUxsDiHgIJeqbiSoDHYgUunQnnQZazNlXU1AGEc8
 fH9u3mX1KZRGDgVKMhCGZUsio8G5if1Sywr70X76xHgg5rgWWGx/SC6FbupV6w96iYtV
 oDh/xl2wwHhvgjBRxZww6CccqnkBrm7xTOGeiAD9IHBm6Zvrb4hkOdjlghcjaer3IBsb
 pQGQ==
X-Gm-Message-State: ANhLgQ37Eb6VeYxTPlWRlrt0sx2n3yehpHF+Lywh28vsY20quVzoKSUk
 RlkQkq6eulzEf/XkI6nFJnLlB+dPapEkZKF2sCM3Iw==
X-Google-Smtp-Source: ADFU+vtpPO/SB7g4ehk7qTFyPKse2g7Gmfi77CZPwCuVUbJVQI6d70Lf5FyUoeDifSP8iaSTW1v77WW+rDocRRRH0SY=
X-Received: by 2002:a19:6502:: with SMTP id z2mr2694078lfb.47.1584448702419;
 Tue, 17 Mar 2020 05:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200317113153.7945-1-linus.walleij@linaro.org>
 <87lfnzdwrf.fsf@mid.deneb.enyo.de>
In-Reply-To: <87lfnzdwrf.fsf@mid.deneb.enyo.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Mar 2020 13:38:11 +0100
Message-ID: <CACRpkdY8uLVrT5=NMpNmKhgmqu=yT_Bgc-Q9-BR6NgRFjnzjFQ@mail.gmail.com>
Subject: Re: [PATCH] ext4: Give 32bit personalities 32bit hashes
To: Florian Weimer <fw@deneb.enyo.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, QEMU Developers <qemu-devel@nongnu.org>,
 stable <stable@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Andy Lutomirski <luto@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 17, 2020 at 12:53 PM Florian Weimer <fw@deneb.enyo.de> wrote:

> Just be sure: Is it possible to move the PER_LINUX32 setting into QEMU?
> (I see why not.)

I set it in the program explicitly, but what actually happens when
I run it is that the binfmt handler invokes qemu-user so certainly
that program can set the flag, any process can.

Yours,
Linus Walleij

