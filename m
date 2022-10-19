Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5DD603969
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 07:58:27 +0200 (CEST)
Received: from localhost ([::1]:58290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol25y-0000XZ-Be
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 01:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol21Y-000656-BU
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 01:53:52 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:42770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol21W-0003NQ-NH
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 01:53:52 -0400
Received: by mail-qk1-x72e.google.com with SMTP id j21so10082620qkk.9
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 22:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dZU+sW9D79tMDk/QvMk5mdy3Ra7yiUMnAH0WiFR2mos=;
 b=SjtZFb9jwPU67tNElZgvqMiHShFaRtJ0I0GhWA55V0jEpd1HfAi9MD01uhGcZQt5SN
 x/Bw8q66bAt3FKeL5bW0rN7NCNATHMsBmSds8piQu7kcbyvBErH/UUSEw0FzyjqjNjnF
 74bH1YR6pUa6kUMXLeBPZ1xJhL6aKarTabgdvitxF4XUFUteKOY2LyJk5Nv0Zl1CSt3q
 oXDUsODC9ZZ0bPFdbhp6ql4717M8gzZA3fqJIwiFlg8ALP590UPe4ifcAPTq+4TdN8QN
 t2tajJ0RTobI1iFEyj7Dbmg7cVUpZnPRgzL6RLBYdhfgMb22kHcmIrtgfw9e4hyWnhA1
 qugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dZU+sW9D79tMDk/QvMk5mdy3Ra7yiUMnAH0WiFR2mos=;
 b=750OhVrXRr9QYW3RKcSypLBZ6tXMrtHR8EAH4jaZgf6nxny2pCVyTMVN+EPst4uBGv
 bV2Bcx3gfApkP+zGhzueOjgUphBEh1dqxg714L7sbQNJNHlhMqPiIrIVdzoHahGdTSgn
 vJeypNbpWB9CBhco751PdYq+XPtghuTv0yX7E9ojFBQlgKKlzm6RElcPQkD+2QK6PbAL
 ht/SI45BDrZ8j8QDQycB7SdB9L/9bRlhWjKXTkOdeSErDjC2TGG3thxzYMVwzWVZzVQj
 VLuZDh/7idY1LAt85XOKBXAlAzSCqnR5HYdIOyIoy9XiGJdN7D51VEf5mkKCtNL1fAK5
 LaeQ==
X-Gm-Message-State: ACrzQf3ARn1hdqjDJsUN8qKfg5S33Iiq926GfUQzwudSPK3AfsPAISOR
 0ZpNJUX/e0pK9xMxS+4kWWq55uOrWY/HeX8GzE0=
X-Google-Smtp-Source: AMsMyM73hvNaVxmWUoxlSYSVQA861KXoOPLi8GlBcs0y1LlU5FbPYXh/HoVayEcktgjwezKHZYW8I5IskFqpi6/fT6w=
X-Received: by 2002:a05:620a:6ca:b0:6ec:553a:cf33 with SMTP id
 10-20020a05620a06ca00b006ec553acf33mr4299872qky.132.1666158829302; Tue, 18
 Oct 2022 22:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
 <CAJ+F1CKjLyV4HJKQ7fWXgzHq6t9yFMA+s6Afwk-tv1Nq806V2Q@mail.gmail.com>
 <CAEUhbmUh+PfqhbXT=tdTd7i2kr3KLA14JjsnPkw5BKBS0A-gqw@mail.gmail.com>
 <CAEUhbmXsMCxPk9fvptDu8moyCRdkTc=tB6dL6rYhijnwqmCOSg@mail.gmail.com>
 <CAEUhbmUkqsvHph4=0yFf28FNEqwHesSQQVa0mUmNNUdb2TYBhQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUkqsvHph4=0yFf28FNEqwHesSQQVa0mUmNNUdb2TYBhQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Oct 2022 13:53:38 +0800
Message-ID: <CAEUhbmXwRmm9bsHAg=fUjzjqja_zGKxokxGhq7bpZVDM2Jip1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] util/main-loop: Fix maximum number of wait objects
 for win32
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72e.google.com
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

+Daniel,

On Tue, Oct 11, 2022 at 8:04 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> +more people
>
> On Mon, Oct 3, 2022 at 6:21 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Paolo,
> >
> > On Sun, Sep 25, 2022 at 9:07 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Paolo,
> > >
> > > On Tue, Sep 13, 2022 at 5:52 PM Marc-Andr=C3=A9 Lureau
> > > <marcandre.lureau@gmail.com> wrote:
> > > >
> > > > Hi
> > > >
> > > > On Wed, Aug 24, 2022 at 12:52 PM Bin Meng <bmeng.cn@gmail.com> wrot=
e:
> > > >>
> > > >> From: Bin Meng <bin.meng@windriver.com>
> > > >>
> > > >> The maximum number of wait objects for win32 should be
> > > >> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
> > > >>
> > > >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > >> ---
> > > >>
> > > >> Changes in v3:
> > > >> - move the check of adding the same HANDLE twice to a separete pat=
ch
> > > >>
> > > >> Changes in v2:
> > > >> - fix the logic in qemu_add_wait_object() to avoid adding
> > > >>   the same HANDLE twice
> > > >>
> > > >>  util/main-loop.c | 11 +++++++----
> > > >>  1 file changed, 7 insertions(+), 4 deletions(-)
> > > >>
> > > >> diff --git a/util/main-loop.c b/util/main-loop.c
> > > >> index f00a25451b..cb018dc33c 100644
> > > >> --- a/util/main-loop.c
> > > >> +++ b/util/main-loop.c
> > > >> @@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, =
void *opaque)
> > > >>  /* Wait objects support */
> > > >>  typedef struct WaitObjects {
> > > >>      int num;
> > > >> -    int revents[MAXIMUM_WAIT_OBJECTS + 1];
> > > >> -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> > > >> -    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
> > > >> -    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
> > > >> +    int revents[MAXIMUM_WAIT_OBJECTS];
> > > >> +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
> > > >> +    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
> > > >> +    void *opaque[MAXIMUM_WAIT_OBJECTS];
> > > >>  } WaitObjects;
> > > >>
> > > >>  static WaitObjects wait_objects =3D {0};
> > > >> @@ -395,6 +395,9 @@ void qemu_del_wait_object(HANDLE handle, WaitO=
bjectFunc *func, void *opaque)
> > > >>          if (w->events[i] =3D=3D handle) {
> > > >>              found =3D 1;
> > > >>          }
> > > >> +        if (i =3D=3D MAXIMUM_WAIT_OBJECTS - 1) {
> > > >> +            break;
> > > >> +        }
> > > >
> > > >
> > > > hmm
> > > >
> > > >>
> > > >>          if (found) {
> > > >>              w->events[i] =3D w->events[i + 1];
> > > >>              w->func[i] =3D w->func[i + 1];
> > > >
> > > >
> > > > The way deletion works is by moving the i+1 element (which is alway=
s zeroed for i =3D=3D MAXIMUM_WAIT_OBJECTS) to i.
> > > >
> > > > After your patch, for i =3D=3D MAXIMUM_WAIT_OBJECTS, we no longer c=
lear the last value, and instead rely simply on updated w->num:
> > > >
> > > >     if (found) {
> > > >         w->num--;
> > > >     }
> > > >
> > > >  So your patch looks ok to me, but I prefer the current code.
> > > >
> > > > Paolo, what do you say?
> > >
> > > Ping?
> > >
> >
> > Ping?
> >
>
> Could this series be merged? Thanks,
>

Since Polo keeps silent, Daniel would you help queue this series? Thanks!

Regards,
Bin

