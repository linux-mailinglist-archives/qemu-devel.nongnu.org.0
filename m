Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04914DB3D2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 16:00:55 +0100 (CET)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUV8w-0002Mn-Sf
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 11:00:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUUqZ-0001O0-Iw
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:41:55 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=45988
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUUqY-0001A8-3A
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:41:55 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id w16so4739470ybi.12
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 07:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=upRCTpvYdLG/S8XyJkGQo44c91klB7ReHzBNRH+zqy8=;
 b=vv4RiU4TS6VYoyfAvvIVRSuRCwvHZj31F1kdpyhjiGmaifTZSx+sjjhX4GaMWR0IN/
 EnxDoEo3zXF0/x0qhdTpLEB++/U2edRT6hn423PuDpGf/UpP8vfThq1PNtRoyxs8B5kG
 gVMeEKV9p+7fRlcqn/IDRuYIPGRAzHLEevwATyM2yAgPIVBa98EyG1/aoHlHPytOiNXo
 x+7XccEg3Fito2iFSM3U3b1O3wCzhE5e58pceU6E1RWx9mx47R8GTHwtbKiTO5bNWrp8
 7qTB4583kbyzFIOez4FerNUj9nOwMtl85XN8OyoeUnnfvjgKhG1DsRC8kAa4nPu7blTb
 pNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=upRCTpvYdLG/S8XyJkGQo44c91klB7ReHzBNRH+zqy8=;
 b=NG6E70KxSAZ6A5Vnq6WVcVISP+Zd191OUrNUgAiN/3R5qD3Gsh4QySzp7oaKbvXRD5
 fclibVGpGiD6Pjq6WuodOAQMf1CuNLTrWdBP5ndcAG9HBc7JXjKlPX0uc5I+mPqCS7WT
 S4A+kiOOLf/zPz1kEIKQKcQWun7NDm4ozpafsmTVUVkHcjNg5ud/puBQeQWxn7cGRCdh
 84H8GLwuK/E/kuDwe5BW6pSrHkT6mQ0JrbP9mxN9kGAZEho3CPL9d/Ap625wM92Fz/cf
 +xrj2kOccseYfrgbDlROwATK0QgY1pdt0KZ5krmjRGbbF7PR3tAO2uLkXyzvcOPWiya6
 4tHQ==
X-Gm-Message-State: AOAM531nIFXMrJewSyXEyDKpiVv44DRz4pc2iHjwop44KYtMQjet256r
 GGzfLyUnwc3Mw/HZBHeQ0kLe7o03Zoj0gnzkLWo87Q==
X-Google-Smtp-Source: ABdhPJz6Bg/GEeKtRM1ajPD5k9oFDWicxU7lnMU21Deo1EPbHn5nNLv7QO/KJ/Rb+U5AB4kXAZSJPCdF1N+hyqSvH1k=
X-Received: by 2002:a25:bf8b:0:b0:633:8a66:c4cd with SMTP id
 l11-20020a25bf8b000000b006338a66c4cdmr181333ybk.85.1647441712914; Wed, 16 Mar
 2022 07:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-6-marcandre.lureau@redhat.com>
 <CAFEAcA9FDt0Y6W4zBLG3ciGe8M7TERimzD_4gX-y7pAv2G+=ag@mail.gmail.com>
 <CAJ+F1CJiQRn+5VXtfZgmVAKuA2wUdCXv=5hToiwfRQPX4qXUKg@mail.gmail.com>
 <CAFEAcA-NN=L2iL=17jgg03iixisdVxL=HOZv1JbUsQh0VsgGHg@mail.gmail.com>
 <YjHpxc6WxB3GrzZi@redhat.com>
In-Reply-To: <YjHpxc6WxB3GrzZi@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2022 14:41:41 +0000
Message-ID: <CAFEAcA8qeebt1OWenyUc1dfFjT8Q3ut8ZUxgp4uu71qH48vOUA@mail.gmail.com>
Subject: Re: [PATCH 05/12] compiler.h: drop __printf__ macro MinGW/glib
 workaround
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 at 13:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Feb 24, 2022 at 08:14:47PM +0000, Peter Maydell wrote:
> > On Thu, 24 Feb 2022 at 19:50, Marc-Andr=C3=A9 Lureau
> > <marcandre.lureau@gmail.com> wrote:
> > > On Thu, Feb 24, 2022 at 11:23 PM Peter Maydell <peter.maydell@linaro.=
org> wrote:
> > >> You're probably building with a newer glib, and possibly also
> > >> a newer mingw.
> > >>
> > >> I've cc'd Stefan Weil who might know whether we can drop this
> > >> workaround as far as the mingw part is concerned.
> > >
> > >
> > > Probably safer to keep it until we bump glib dependency to >=3D2.58.
> > >
> > > I would move it to glib-compat.h though, and leave a note there, as i=
t is (or should be ) an old glib specific workaround.
> >
> > We can only move it to glib-compat if we confirm that only the
> > glib-related part of the workaround is still relevant and the
> > mingw side is now no longer needed, though.
>
> We know glib uses the GNU printf semantics for all its APIs.
>
> We know QEMU code will use the GNU printf annotation for all its
> APIs where it knows it has GNU printf, due to delegating to
> GLib.
>
> For 3rd party libraries, we can have no confidence about whether
> they expect GNU or native printf format, unless we're doing
> something to override the printf family of functions at link
> time. IIRC, we're not doing that, so we can't assume 3rd party
> stuff expects GNU format, and so the sooner we get rid of
> the #define __printf__ __gnu_printf__ the better IMHO. The
> proof of course would be to see a CI test run with the define
> removed proving that no code we call relies on it.

Yes, the workaround is definitely correct for QEMU's own
code and for glib itself. We don't care about 3rd party
libraries because we don't use any of those which take
format-string arguments AFAIK. The 'mingw' part AIUI is
purely for mingw itself, ie the standard library. What
I'm asking is "what were the versions of mingw that were
affected by this, and are they all old enough we don't need
to care from that point of view?".

-- PMM

