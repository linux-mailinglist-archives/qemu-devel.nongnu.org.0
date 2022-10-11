Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7715FB61A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:00:58 +0200 (CEST)
Received: from localhost ([::1]:54988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiGkZ-0002dm-Uu
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiGeF-0005Wm-56
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:54:25 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:39498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiGeC-0005kG-WC
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:54:22 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id z18so9090081qvn.6
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXwF3VD6iZJnWnPo/yeadFX5HxlnAMt2tjOzD7n/PsA=;
 b=PyXLVbFktNfu9l2bT0wwajeJ9o0Z4h5EPedxiooX+6Kb0AKHpCMlcWksiTfNYN59vK
 9ngKHecpKkoay1jaomqJsdexqGJnHh0qJFSX4IqrUZaLxpOZj5tIe/xG8pf1Ha961BF2
 zcjD9mpK8YEUEkH//8EH4cJYAh/NDmabFffpy9+bOvXegUguFEeLT51RBkkjIQ7QBiFE
 aCBhcWtEcHBqO8ZvxYoZir1fuzfSoOpbmEnfX2YjBHi1+vSwE/6ZdUyXdtQVJ6afkMmA
 k/SliM6O0g5GDgRS89FMnlXDfI97Ma7gC7GcyKAhSlXJ4RnUBUzLpreXbzCjgtpMPhkN
 7DCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lXwF3VD6iZJnWnPo/yeadFX5HxlnAMt2tjOzD7n/PsA=;
 b=AJ2i9timZCxlswi84/A9uVqob0TGhhgHAQMiDyZE0i5yifQsCbWjhQxQJjL/rth7vO
 EW3t5HHVzMDBWik++WdQcjmt4zA1AJsoENysopp+23I976NsmUBvIWl+BBjUoQdTMq5T
 tIjwSYs61970xrEdfNuFk1DDdBhHKptYXeCzMH6dCW8USRYRk7SoXPrKej+YWxntyGDS
 oM7M/0zpeC9gWbRYfEFxX0PAcjQDqscvUwb6DmcdtPakp/Diaq3CqMFvnPoe2KJk+hPT
 08mW/VM9nsj6yVVUDZ9y7BtC4mPkBw0SKzuxVu9tgjNYpmqMT60TuORcjgVSn6MQNi8L
 fflw==
X-Gm-Message-State: ACrzQf1gUz2xSDdz5PkKD3UMwjfX53MnLbcWmkimJBndA3JiOdj8a9iz
 fehH4Y+jNqV6ny8AkrbfuipDj5u4xkLB/+GUzwTyJ2yu6UvEpXF5
X-Google-Smtp-Source: AMsMyM6qdWirZ2xi693ci/NeFnsDxzgiFs6+PFIGaVZKMbLNi0lUXxQ9CgoLTOvaZjzm9bAIGiEcljKCEiVDLcZCiMM=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr19037598qvc.12.1665500059861; Tue, 11
 Oct 2022 07:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-11-bmeng.cn@gmail.com>
 <4a301dfb-2c85-c7ef-4d1a-e85cc3b9d171@redhat.com>
In-Reply-To: <4a301dfb-2c85-c7ef-4d1a-e85cc3b9d171@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 11 Oct 2022 22:54:08 +0800
Message-ID: <CAEUhbmWq+ZNE5dM0kQvsShaYXDEed7K_TJ+_L5YpBCXDbqmR4A@mail.gmail.com>
Subject: Re: [PATCH v5 10/18] tests/qtest: libqtest: Install signal handler
 via signal()
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2f.google.com
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

On Tue, Oct 11, 2022 at 10:14 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 06/10/2022 17.19, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present the codes uses sigaction() to install signal handler with
> > a flag SA_RESETHAND. Such usage can be covered by the signal() API
> > that is a simplified interface to the general sigaction() facility.
> >
> > Update to use signal() to install the signal handler, as it is
> > available on Windows which we are going to support.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >
> > Changes in v5:
> > - Replace sighandler_t with its actual definition, since it is not
> >    available on BSD hosts
> >
> >   tests/qtest/libqtest.c | 14 +++-----------
> >   1 file changed, 3 insertions(+), 11 deletions(-)
> >
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index 8228262938..54e5f64f20 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -66,7 +66,7 @@ struct QTestState
> >   };
> >
> >   static GHookList abrt_hooks;
> > -static struct sigaction sigact_old;
> > +static void (*sighandler_old)(int);
> >
> >   static int qtest_query_target_endianness(QTestState *s);
> >
> > @@ -179,20 +179,12 @@ static void sigabrt_handler(int signo)
> >
> >   static void setup_sigabrt_handler(void)
> >   {
> > -    struct sigaction sigact;
> > -
> > -    /* Catch SIGABRT to clean up on g_assert() failure */
> > -    sigact =3D (struct sigaction){
> > -        .sa_handler =3D sigabrt_handler,
> > -        .sa_flags =3D SA_RESETHAND,
> > -    };
> > -    sigemptyset(&sigact.sa_mask);
> > -    sigaction(SIGABRT, &sigact, &sigact_old);
> > +    sighandler_old =3D signal(SIGABRT, sigabrt_handler);
> >   }
> >
> >   static void cleanup_sigabrt_handler(void)
> >   {
> > -    sigaction(SIGABRT, &sigact_old, NULL);
> > +    signal(SIGABRT, sighandler_old);
> >   }
> >
> >   static bool hook_list_is_empty(GHookList *hook_list)
>
> Hmm, did you notice the error from checkpatch.pl ?
>
> ERROR: use sigaction to establish signal handlers; signal is not portable
>
> ... rationale is given in the commit description here:
>
> https://gitlab.com/qemu-project/qemu/-/commit/e8c2091d4c4dd

Yes, I noticed this checkpatch warning.

>
> ... but since we likely don't care about continuing running after the fir=
st
> signal has been delivered, I guess it's ok here to use signal() instead o=
f
> sigaction?
>

I think so. I mentioned in the commit message that the code is using
SA_RESETHAND for sigaction, and such usage can be replaced with
signal().

Regards,
Bin

