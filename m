Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775125F25F3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 00:23:06 +0200 (CEST)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of7MX-0003y1-69
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 18:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1of7LB-0002cj-Rc
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 18:21:41 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:35347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1of7LA-0004Cq-BV
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 18:21:41 -0400
Received: by mail-qt1-x835.google.com with SMTP id g23so5541084qtu.2
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 15:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=eL+fUXoW0gnyMSOvq0eh7833x/ohkbAqDoacch1Oe5s=;
 b=YGR6MBYpCiJAglY6eB61ZoyA/larwKD+0uhUpstOwyZQ601vnDE/r6vDFLhNDcBTmt
 vDyrXyUdU0PO8ERxk8L+kiaN6kKHbrxNp1NEH4ocAFSDsVMgYdASaZYX/nSyieGwQYZb
 wN57ZSrAkpd8hErk/pzdTXlqIhcMUNMp4+6uNFdofbGo7M3E0yDO/b1YCRClrstIOAwQ
 TRf5g/vyeqrWWWzqpEmGKefNGk6yiGFr9fm3ovlMkDUh6PmWqxoCPvR2Cg8OhTr65jjk
 IDq1HtF9KG9P08aEqYQML1sqVnGWFUtRBbf5gFnvPFKD6HKgT5f0g1BbqG21naEpZo27
 HL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eL+fUXoW0gnyMSOvq0eh7833x/ohkbAqDoacch1Oe5s=;
 b=szNq5+59ONq3LIg6T96Oi3OZKBwGA7X7MMSqs2Cn9OqXAhb04uFrGITyG0zc7HfR5d
 To2uEdzcVQWtw3drJWnTTiKvDilJPY7RaMkRYflKLYCH2jijcz3MIMJycAzbL7CM8Bb5
 pv1MxA6qWyWNCNdGdXly2AC/twHv+cXJ9XL/eTF2f8ZN5aRhyHCqu/rpI+tIWla1zdE5
 p1SDpsR5js9nRuFK+pUVvSrlCcwbxmpAFtnX2fgVO408IuApZLUGCIczps46fA+KTtl0
 9VdtiABs5CyeI7/wcr88AF35D4IrQOT7d6y4BoK1sKuakzk7FqcDyTpMS0UFZ40h2Q8y
 +Kew==
X-Gm-Message-State: ACrzQf33QSgTy6X9AwHCnE6EaRfo+m4LJ2Vq1dOaR9wB1yR320pY72m3
 5JGNC3u/VGNa0aQG1HqyZq23Bl1Wj5628QqPE1U=
X-Google-Smtp-Source: AMsMyM7MChqeMm4QoT6kXRPktrbsM0SgXIRKJoKhP+WL5BlOR1ESADwPVDaRkA5EgkgXmp2JPm0HexDytHs8PMBYr5Y=
X-Received: by 2002:a05:622a:1803:b0:35b:aff1:aba0 with SMTP id
 t3-20020a05622a180300b0035baff1aba0mr14389167qtc.334.1664749298984; Sun, 02
 Oct 2022 15:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
 <CAJ+F1CKjLyV4HJKQ7fWXgzHq6t9yFMA+s6Afwk-tv1Nq806V2Q@mail.gmail.com>
 <CAEUhbmUh+PfqhbXT=tdTd7i2kr3KLA14JjsnPkw5BKBS0A-gqw@mail.gmail.com>
In-Reply-To: <CAEUhbmUh+PfqhbXT=tdTd7i2kr3KLA14JjsnPkw5BKBS0A-gqw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 3 Oct 2022 06:21:28 +0800
Message-ID: <CAEUhbmXsMCxPk9fvptDu8moyCRdkTc=tB6dL6rYhijnwqmCOSg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] util/main-loop: Fix maximum number of wait objects
 for win32
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x835.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On Sun, Sep 25, 2022 at 9:07 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Paolo,
>
> On Tue, Sep 13, 2022 at 5:52 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Wed, Aug 24, 2022 at 12:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> From: Bin Meng <bin.meng@windriver.com>
> >>
> >> The maximum number of wait objects for win32 should be
> >> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
> >>
> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> ---
> >>
> >> Changes in v3:
> >> - move the check of adding the same HANDLE twice to a separete patch
> >>
> >> Changes in v2:
> >> - fix the logic in qemu_add_wait_object() to avoid adding
> >>   the same HANDLE twice
> >>
> >>  util/main-loop.c | 11 +++++++----
> >>  1 file changed, 7 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/util/main-loop.c b/util/main-loop.c
> >> index f00a25451b..cb018dc33c 100644
> >> --- a/util/main-loop.c
> >> +++ b/util/main-loop.c
> >> @@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void=
 *opaque)
> >>  /* Wait objects support */
> >>  typedef struct WaitObjects {
> >>      int num;
> >> -    int revents[MAXIMUM_WAIT_OBJECTS + 1];
> >> -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> >> -    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
> >> -    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
> >> +    int revents[MAXIMUM_WAIT_OBJECTS];
> >> +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
> >> +    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
> >> +    void *opaque[MAXIMUM_WAIT_OBJECTS];
> >>  } WaitObjects;
> >>
> >>  static WaitObjects wait_objects =3D {0};
> >> @@ -395,6 +395,9 @@ void qemu_del_wait_object(HANDLE handle, WaitObjec=
tFunc *func, void *opaque)
> >>          if (w->events[i] =3D=3D handle) {
> >>              found =3D 1;
> >>          }
> >> +        if (i =3D=3D MAXIMUM_WAIT_OBJECTS - 1) {
> >> +            break;
> >> +        }
> >
> >
> > hmm
> >
> >>
> >>          if (found) {
> >>              w->events[i] =3D w->events[i + 1];
> >>              w->func[i] =3D w->func[i + 1];
> >
> >
> > The way deletion works is by moving the i+1 element (which is always ze=
roed for i =3D=3D MAXIMUM_WAIT_OBJECTS) to i.
> >
> > After your patch, for i =3D=3D MAXIMUM_WAIT_OBJECTS, we no longer clear=
 the last value, and instead rely simply on updated w->num:
> >
> >     if (found) {
> >         w->num--;
> >     }
> >
> >  So your patch looks ok to me, but I prefer the current code.
> >
> > Paolo, what do you say?
>
> Ping?
>

Ping?

Regards,
Bin

