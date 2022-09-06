Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC695AE97C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:28:33 +0200 (CEST)
Received: from localhost ([::1]:34250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYcy-0003b4-EF
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oVXLv-0006zT-2C
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:06:51 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:43767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oVXLs-00007c-Rz
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:06:50 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-333a4a5d495so93727887b3.10
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 05:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=oDy07ukWH3+8pmf08wxku6Ld0IIESnMMKjKAXHCz3i8=;
 b=c0KqXU6AacBKqOqM8wv8xPCkwTeM/aNPCHh7FEDL1d776I9j3cRmc1Xo5Y/5R4zQ3g
 G5HiwaJNVh18O1GVN3CyqRLz8zrf9rPhkeeVSJuPsQslJYz/Cj6bGE26ObXzX6V2Lxpx
 +lEraE1hgAHBjTP3Fxqel7RdA172BAM8V8cKpPqxTD9eq3r4uDI5YQsSvsyucCOOJPvB
 ghG3Z5EmZnawLVryFvQQfv6w1tTVRZ5nDp/cJoooil3mUqcakY8jiLV9Gr9MDx3/YUZs
 7BEd32CUHnDip4Ydfh4eau7UAGcBjc006riE2M7fkVaHA0nljYYUo1GKa8cWAPAUp9S8
 pVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oDy07ukWH3+8pmf08wxku6Ld0IIESnMMKjKAXHCz3i8=;
 b=bHYy+QilvNGRGEEa2FZTplKSiZ0o5+med1854xy+rxil8h5l1L5+z8VmGXJ8f3dcl/
 Y7bwgYuOncWB3KricmrWzlAoiLM3KFciG+1cU95Yf1rtN4m7IAvxLGQPX+nHQJLj/3Ah
 v9mRbWcjsq8kQOZtXPUA0Yd35bWtXogYT3puHCRCbdLX7uivqhB6fLW2g21JndRvyzIZ
 eSAGqKo+332hvUvIqsiXDHDea8gTNwk1xW1Wqq9o/aE9eLKXdATqpTgl/2XDfF/Ein2n
 5cDFw7n7Qjeglya/e9/qLSeErm6g+q1EX6tzhYg3LwUHrzxRuybKH22/ve1NjRyuL6JU
 nRww==
X-Gm-Message-State: ACgBeo1Gj3DxnWSm/sxIIKjvar92VONct9fBHDmQDp5WrfdXEXSMIQif
 kVtzb+9U0AVtCNsiqaWK+FakpVZGt8UP3jloCrzYkQ==
X-Google-Smtp-Source: AA6agR41eA984ixYr7XolWqaq9MZJErydQ4EsM4HS9ulzkPp8OlQQneug9ZmQajM2BHuTTu6fAcKACWtfQocJ5/aJgU=
X-Received: by 2002:a81:6ed4:0:b0:345:2c35:a203 with SMTP id
 j203-20020a816ed4000000b003452c35a203mr8859045ywc.262.1662466007459; Tue, 06
 Sep 2022 05:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-50-bmeng.cn@gmail.com>
 <CAJ+F1C+-4U1huf=Jv_uJP-XXnXu88Gj9HHvrGS0dTFyKGv=qBg@mail.gmail.com>
 <CAEUhbmV_UU1TpRXfyz5U9kRj5r1ihm-HrXhzw_D-L96_Skxy+g@mail.gmail.com>
 <CAJ+F1CJo-0isj2LKdabMHu854e7kukwjp=CCejgk_TzLRwtA3w@mail.gmail.com>
 <CAEUhbmXjHCEOy+U3zABsvCU20rDj5pogNVTUCUEevdrqhcjuoA@mail.gmail.com>
 <CAJ307EiOGrHqfdzSfb6L3MPKtAWLPCQT8ZVY7M+R5mT6d9wVvQ@mail.gmail.com>
 <CAEUhbmW0v_5Ro3mY6Ztt=MmZJf=ueApmNGpT=+1RTPLrWd4=Rg@mail.gmail.com>
 <CAJ307EhBSg4ENykkbqsT=5oBjc34JR+d3bJAVSTaxRM-uG4LGg@mail.gmail.com>
 <CAEUhbmUAF0W_SCtYOuAZ+xc7Y4So3J4QB29Us0AV44eVF8KtLg@mail.gmail.com>
In-Reply-To: <CAEUhbmUAF0W_SCtYOuAZ+xc7Y4So3J4QB29Us0AV44eVF8KtLg@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Tue, 6 Sep 2022 14:06:36 +0200
Message-ID: <CAJ307EjyXxbGLK-PhBjf18p3AApYM-jGqA2L9q3xLS9wX16h_w@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=chigot@adacore.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> > > I checked your patch, what you did seems to be something one would
> > > naturally write, but what is currently in the QEMU sources seems to b=
e
> > > written intentionally.
> > >
> > > +Paolo Bonzini , you are the one who implemented the socket watch on
> > > Windows. Could you please help analyze this issue?
> > >
> > > > to avoid WSAEnumNetworkEvents for the master GSource which only has
> > > > G_IO_HUP (or for any GSource having only that).
> > > > As I said above, the current code doesn't do anything with it anywa=
y.
> > > > So, IMO, it's safe to do so.
> > > >
> > > > I'll send you my patch attached. I was planning to send it in the f=
ollowing
> > > > weeks anyway. I was just waiting to be sure everything looks fine o=
n our
> > > > CI. Feel free to test and modify it if needed.
> > >
> > > I tested your patch. Unfortunately there is still one test case
> > > (migration-test.exe) throwing up the "Broken pipe" message.
> >
> > I must say I didn't fully test it against qemu testsuite yet. Maybe the=
re are
> > some refinements to be done. "Broken pipe" might be linked to the missi=
ng
> > G_IO_HUP support.
> >
> > > Can you test my patch instead to see if your gdb issue can be fixed?
> >
> > Yeah sure. I'll try to do it this afternoon.

I can't explain how mad at me I am... I'm pretty sure your patch was the fi=
rst
thing I've tried when I encountered this issue. But it wasn't working
or IIRC the
issue went away but that was because the polling was actually disabled (loo=
ping
indefinitely)...I'm suspecting that I already had changed the CreateEvent f=
or
WSACreateEvent which forces you to handle the reset.
Finally, I end up struggling reworking the whole check function...
But yeah, your patch does work fine on my gdb issues too.

And I guess the events are reset when recv() is being called because of the
auto-reset feature set up by CreateEvent().
IIUC, what Marc-Andr=C3=A9 means by busy loop is the polling being looping
indefinitely as I encountered. I can ensure that this patch doesn't do that=
.
It can be easily checked by setting the env variable G_MAIN_POLL_DEBUG.
It'll show what g_poll is doing and it's normally always available on
Windows.

Anyway, we'll wait for Paolo to see if he remembers why he had to call
WSAEnumNetworkEvents. Otherwize, let's go for your patch. Mine might
be a good start to improve the whole polling on Windows but if it doesn't
work in your case, it then needs some refinements.

Thanks,
Cl=C3=A9ment

