Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3D52D969F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:51:52 +0100 (CET)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolSJ-0000ZM-DI
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kolR0-0008CO-3c; Mon, 14 Dec 2020 05:50:32 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:45970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kolQx-0004j9-II; Mon, 14 Dec 2020 05:50:29 -0500
Received: by mail-yb1-xb32.google.com with SMTP id k78so15101555ybf.12;
 Mon, 14 Dec 2020 02:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QDgZVY58aLyD5HIGLPbMlPWcP3kifFv5cJTTi2Ph5sQ=;
 b=r29MVWD1Vt6xdBQytcEIPAzxH+M43NZKYmVrPSyQeguYQmAx9DROxu0SQ4Kj2d5wZ1
 FD1pF5ZmBG8FTzIZt/Lwpb+4stsItZ5lPZW87eWumPmIQyRkaZ0g3uEwirX3jQQ+zMg5
 te+OXyq/x1SSNpcw+fu3DIgLtNIgBGATzYEQ9nGtJQ3JM8zmb1KFwuAuxd73M0+csfTr
 6jYTZll7RKaFc3ODkAFB0pjwQVFDVDOcLa2pLQ59osPdaOExLfYrPJnCgjKcWiYdbxVF
 IqgNXvn9GgEiA791jhmZp7Ch78nX/y4EKqC80sG3WmmffetlkwIhErn0NVpYzX9Q5D1V
 22DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QDgZVY58aLyD5HIGLPbMlPWcP3kifFv5cJTTi2Ph5sQ=;
 b=lzg2kTuaBFiyMHb8MSVNjmtmRNlcJf8HMwT1CqONxx8A+D1MOV5mbE3RpqEL4x+AGQ
 3BD7VCoqOMjzXil8ERaOQ5xmm5TlRwsDSCC+eyrbLwF0RO4LoFnUmhzpOD/T2BBS2OlK
 YXkxVGzonx65LDf/2h6b0v1TqGu6WPd3kRu8VqLUDyYhtMKR1e6FNVAOMPIcjZjIHhJa
 Q2WTC2xSiVkhjPGLJun4S5tqwZbghPdhP7GgFhA89KJsSPQPBCYawpuXGe91WPTuiI5o
 FO9KCZguwYNfkCl1wWKJruXUYGNF3lDkEHKtTnSip94ViAbKBe5+PHFA4yvW6XH1JoSr
 1Kiw==
X-Gm-Message-State: AOAM5308LQCPKlBfMiWMm1xECuQgkfTW5lXHWQ91zGWTNOeScFkC8vrY
 k09lFR9AssKyMpnnk2tt+qlTyFnw/JpOnIV0wlY=
X-Google-Smtp-Source: ABdhPJxou9PPtPrlfXJ0fuD7fd1ruwjGVvddm5LdsHpdn+F7MfdtN36M1LxJYy/kd0o898lP07vRPWQM//u1gRwZ9pc=
X-Received: by 2002:a25:ec5:: with SMTP id 188mr38311006ybo.387.1607943025303; 
 Mon, 14 Dec 2020 02:50:25 -0800 (PST)
MIME-Version: 1.0
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
 <1607937538-69471-4-git-send-email-bmeng.cn@gmail.com>
 <878sa0vfc5.fsf@linaro.org>
In-Reply-To: <878sa0vfc5.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Dec 2020 18:50:14 +0800
Message-ID: <CAEUhbmUY77ZBDtHASDne5yrj0z8qPoz34XYBBP9ndSQ3sujrzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:42 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present, when booting U-Boot on QEMU sabrelite, we see:
> >
> >   Net:   Board Net Initialization Failed
> >   No ethernet found.
> >
> > U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
> > U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
> > board, the Ethernet PHY is at address 6. Adjust this by updating the
> > "fec-phy-num" property of the fsl_imx6 SoC object.
> >
> > With this change, U-Boot sees the PHY but complains MAC address:
> >
> >   Net:   using phy at 6
> >   FEC [PRIME]
> >   Error: FEC address not set.
> >
> > This is due to U-Boot tries to read the MAC address from the fuse,
> > which QEMU does not have any valid content filled in. However this
> > does not prevent the Ethernet from working in QEMU. We just need to
> > set up the MAC address later in the U-Boot command shell, by:
> >
> >   =3D> setenv ethaddr 00:11:22:33:44:55
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>

Thanks for the review.

> As you are giving this board some attention is there any chance you
> could be persuaded to add an entry in docs/system/arm (linked from
> docs/system/target-arm.rst) to briefly describe the board and what is
> known to work and boot on it?

Sure, I will try to add something for this board in v2.

Regards,
Bin

