Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8AD5B2F46
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 08:51:04 +0200 (CEST)
Received: from localhost ([::1]:51214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWXqx-0003IX-O8
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 02:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWXlQ-0000Ve-7G
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:45:27 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:39663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWXlN-0007No-NL
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:45:19 -0400
Received: by mail-qt1-x836.google.com with SMTP id r6so614914qtx.6
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 23:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=PTsHQvDh5R3rMS7mipeZt7QWXN2esL/qxQcSpI8qAyQ=;
 b=OkH97k6IPuZEXpWUWqpMw1vWbNGdzK/XEfosFamTE33Z5jM/g+y/KZYKje7cKLmH3N
 WSmb4duJOgJjYWy6Agip41KzVW0bjEUSfFLO3u2Rv09AgsukEubQReAvnpgwOJhpwWpx
 /sVwhzabk/56UVQnY4Jfw7+0cYaEFVzchMF6b61oFnX2ZKuB63snWonH+wtLI+Cc0bgv
 QGXuhn3IEMiRRzYlVLo0hH/t/40yEElI5TE1y1wnfdxO5gzxI32sfDbCdi6AzQSCrz2i
 CUY9As2W6qNdrvMGayvyVjyR4CXaKcrynBjdzMyhhBBFqIxOIqNRZcVsFsLo43FB7KvG
 xjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=PTsHQvDh5R3rMS7mipeZt7QWXN2esL/qxQcSpI8qAyQ=;
 b=ifYVs5bFnGEO04LzoAROUag9LAUoE+/iDdbBLL6KHJ/DH/57VZYl//1LixEZ/Ash3b
 R2L6wrQyknSoq07x+rEk4QNSlxV2XQ4rvxWryf8Zkd59t4tj18TL8qfXZqr4suzGbV11
 nJZ3Iczi/kvHDnPWgOIVOFkmFd0iJrgn1yhLYmmV+cKppPr6VaeRfYqpQAQHO6ZJDuL5
 VaUwnP21FhsMoBk89CtM2gTQK82O+s5RF36V8ig+HKt0YT+b02pDmtB2/SL1gURAGgNf
 emwaqmRbYzeawy7oMpBKeyaN1S+684RMhP0FqojhtzQ41hZP/N6sf+4kMZn3AvLXqSmI
 MQwA==
X-Gm-Message-State: ACgBeo3Ba/2y0H1SBff7x5WeH+Hx7HrRQ6z7lNGAH0PcnTfy1pWwjFIp
 lkjuuZg5/6GRd1SWMWX+Tl8YruGXn+pCZkexVX7dVFeb
X-Google-Smtp-Source: AA6agR7iAOeG5bN+7m4IKpsy1VtZkwMUkRQefCo5opi9EjnaCsv6sNIrkJLGQXZBZcF1oDRoTFDRyVzGVYs0S7ETD1A=
X-Received: by 2002:ac8:574e:0:b0:344:555f:cbe4 with SMTP id
 14-20020ac8574e000000b00344555fcbe4mr11291687qtx.276.1662705916409; Thu, 08
 Sep 2022 23:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
 <CAEUhbmVvQcAkEw=Kc4SGHmn0_DmT_yKqVBtgbY7_qUhyOvAT=Q@mail.gmail.com>
In-Reply-To: <CAEUhbmVvQcAkEw=Kc4SGHmn0_DmT_yKqVBtgbY7_qUhyOvAT=Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 9 Sep 2022 14:45:04 +0800
Message-ID: <CAEUhbmWXeDQC0oB7tz=7qAsq4v4T94nw3V-Tw70BhgVn45b=sQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] util/main-loop: Fix maximum number of wait objects
 for win32
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Sep 2, 2022 at 12:19 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Aug 24, 2022 at 4:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The maximum number of wait objects for win32 should be
> > MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > Changes in v3:
> > - move the check of adding the same HANDLE twice to a separete patch
> >
> > Changes in v2:
> > - fix the logic in qemu_add_wait_object() to avoid adding
> >   the same HANDLE twice
> >
> >  util/main-loop.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/util/main-loop.c b/util/main-loop.c
> > index f00a25451b..cb018dc33c 100644
> > --- a/util/main-loop.c
> > +++ b/util/main-loop.c
> > @@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void *opaque)
> >  /* Wait objects support */
> >  typedef struct WaitObjects {
> >      int num;
> > -    int revents[MAXIMUM_WAIT_OBJECTS + 1];
> > -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> > -    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
> > -    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
> > +    int revents[MAXIMUM_WAIT_OBJECTS];
> > +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
> > +    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
> > +    void *opaque[MAXIMUM_WAIT_OBJECTS];
> >  } WaitObjects;
> >
> >  static WaitObjects wait_objects = {0};
> > @@ -395,6 +395,9 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
> >          if (w->events[i] == handle) {
> >              found = 1;
> >          }
> > +        if (i == MAXIMUM_WAIT_OBJECTS - 1) {
> > +            break;
> > +        }
> >          if (found) {
> >              w->events[i] = w->events[i + 1];
> >              w->func[i] = w->func[i + 1];
> > --
>
> Ping for this series?

Ping?

