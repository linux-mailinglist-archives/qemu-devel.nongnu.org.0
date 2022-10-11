Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C25FB389
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:39:24 +0200 (CEST)
Received: from localhost ([::1]:58626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFTX-0007Gk-1j
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiE08-0006OM-3G
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:04:48 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiE01-0002so-L5
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:04:47 -0400
Received: by mail-qv1-xf31.google.com with SMTP id i9so8806664qvo.0
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1zz/SZEdOZRT3YRgP/a4ASQHQ8IIFMSgvW69FwNSLg=;
 b=j2s6sVOVOv+IK5OvSeSFGkClrS7rgXVc3KX2NTfg4VTYJymTs73eufDSX6tmrkRYbW
 azfBBkUqM2yl9Qflf0Vo94MsSWrtIV6M70E1CSqBoC5z8yIBuI9KoOozCriejKhqcPyr
 NPSNhde9bpEpGgr4hnsn9Ei16zW8D92wLSl2rAVMTpd8t39nCHTQTkAr/sEh5XEjYLNS
 q5PnqYxdLrdS3tdVIwx7ynuM+LddEqA0H1JVOZYSRA0yb9T72yBJlqHC2nY3fYgfr0U0
 Y/RoHmS3paMoPjBPZj7cfRjvdMhDX7XdMTlglThc7igHiXkQlqKFWgBHStMEurkterww
 j2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B1zz/SZEdOZRT3YRgP/a4ASQHQ8IIFMSgvW69FwNSLg=;
 b=d5qQmQD3fh9g7g46Qi5CwbR/6HQgcEuwgmGUrNv36Zc6on68AlXwu9IA28WmybLh9A
 Lv9EpOz6Jg9S+Rjre8wImqLlKt7IidovTOxv8gtRcgL/IEWz3zL5Fns1inZe5M3LoikB
 0H2sGzzoD6fOboE3xdwdjr2SpwTkMMqwazOHh5Fq3ksO7LMzR8IruvOpl0sjaHxOksAS
 cb5oJeAylNfaonIgP72q7Ozrm/RjLhHf3nInrxitn3fUD1oLHmzZHKqfFx4AKjKWih3F
 W/3xZsgiZDyuqSx4dd9B3zoWp68lNPcv8FvvzqwuUCZq9xQwfOBHQSHC2Ivxo0kTUlzh
 1U3A==
X-Gm-Message-State: ACrzQf3+Rxq22rcsBKlwkFpu6D99fPPhwMVLsauV/HBFH0Yhl2yY06+Z
 QDPlZjBQ1woEI3HJHuLyilm9DHBt2TDVcI+pgSc=
X-Google-Smtp-Source: AMsMyM6ms+tRwRw+ke0VWmso2j9D5NtDkFd9UkGu4ZzfkbOfoqwzDH3iu9w0HlgPE0k/mX9chnCSb+JLBxLxzfnKa9Y=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr18276092qvc.12.1665489877014; Tue, 11
 Oct 2022 05:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
 <CAJ+F1CKjLyV4HJKQ7fWXgzHq6t9yFMA+s6Afwk-tv1Nq806V2Q@mail.gmail.com>
 <CAEUhbmUh+PfqhbXT=tdTd7i2kr3KLA14JjsnPkw5BKBS0A-gqw@mail.gmail.com>
 <CAEUhbmXsMCxPk9fvptDu8moyCRdkTc=tB6dL6rYhijnwqmCOSg@mail.gmail.com>
In-Reply-To: <CAEUhbmXsMCxPk9fvptDu8moyCRdkTc=tB6dL6rYhijnwqmCOSg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 11 Oct 2022 20:04:25 +0800
Message-ID: <CAEUhbmUkqsvHph4=0yFf28FNEqwHesSQQVa0mUmNNUdb2TYBhQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] util/main-loop: Fix maximum number of wait objects
 for win32
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

+more people

On Mon, Oct 3, 2022 at 6:21 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Paolo,
>
> On Sun, Sep 25, 2022 at 9:07 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Paolo,
> >
> > On Tue, Sep 13, 2022 at 5:52 PM Marc-Andr=C3=A9 Lureau
> > <marcandre.lureau@gmail.com> wrote:
> > >
> > > Hi
> > >
> > > On Wed, Aug 24, 2022 at 12:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >>
> > >> From: Bin Meng <bin.meng@windriver.com>
> > >>
> > >> The maximum number of wait objects for win32 should be
> > >> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
> > >>
> > >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >> ---
> > >>
> > >> Changes in v3:
> > >> - move the check of adding the same HANDLE twice to a separete patch
> > >>
> > >> Changes in v2:
> > >> - fix the logic in qemu_add_wait_object() to avoid adding
> > >>   the same HANDLE twice
> > >>
> > >>  util/main-loop.c | 11 +++++++----
> > >>  1 file changed, 7 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/util/main-loop.c b/util/main-loop.c
> > >> index f00a25451b..cb018dc33c 100644
> > >> --- a/util/main-loop.c
> > >> +++ b/util/main-loop.c
> > >> @@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, vo=
id *opaque)
> > >>  /* Wait objects support */
> > >>  typedef struct WaitObjects {
> > >>      int num;
> > >> -    int revents[MAXIMUM_WAIT_OBJECTS + 1];
> > >> -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> > >> -    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
> > >> -    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
> > >> +    int revents[MAXIMUM_WAIT_OBJECTS];
> > >> +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
> > >> +    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
> > >> +    void *opaque[MAXIMUM_WAIT_OBJECTS];
> > >>  } WaitObjects;
> > >>
> > >>  static WaitObjects wait_objects =3D {0};
> > >> @@ -395,6 +395,9 @@ void qemu_del_wait_object(HANDLE handle, WaitObj=
ectFunc *func, void *opaque)
> > >>          if (w->events[i] =3D=3D handle) {
> > >>              found =3D 1;
> > >>          }
> > >> +        if (i =3D=3D MAXIMUM_WAIT_OBJECTS - 1) {
> > >> +            break;
> > >> +        }
> > >
> > >
> > > hmm
> > >
> > >>
> > >>          if (found) {
> > >>              w->events[i] =3D w->events[i + 1];
> > >>              w->func[i] =3D w->func[i + 1];
> > >
> > >
> > > The way deletion works is by moving the i+1 element (which is always =
zeroed for i =3D=3D MAXIMUM_WAIT_OBJECTS) to i.
> > >
> > > After your patch, for i =3D=3D MAXIMUM_WAIT_OBJECTS, we no longer cle=
ar the last value, and instead rely simply on updated w->num:
> > >
> > >     if (found) {
> > >         w->num--;
> > >     }
> > >
> > >  So your patch looks ok to me, but I prefer the current code.
> > >
> > > Paolo, what do you say?
> >
> > Ping?
> >
>
> Ping?
>

Could this series be merged? Thanks,

Regards,
Bin

