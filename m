Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2E9307479
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:13:25 +0100 (CET)
Received: from localhost ([::1]:45878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55Eq-0002jo-Fp
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l55E1-0002Kd-UX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:12:33 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l55E0-0004Em-7c
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:12:33 -0500
Received: by mail-ed1-x530.google.com with SMTP id c6so6159807ede.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RRuknqelNOI1UB+kwJ5TqkXZp3utom6eZtH8GWgRWF4=;
 b=qlAjnRaJ40w9eKWsXy6f7FQnsZthSfPRGTOpAxi1OofoBp2qR98CPaclMPTyvqTc89
 YhjNMsb9hk/mN2v77G+mbWj3JunSEE/KIrhL3pwEZOG/hjlk66mqv4jggQSWR2hfUzf/
 2rtXTwNEclmbKEGHCiBmBKlPOUM0fjSDaKrnfdRWF4S4fYZbsdEbc8+K61mSJYHq0B7k
 t7Ge8MOZYZCdIeRZVjCMXpCJbr3UObC7v/LtvxW4fQT3UZVPy5z6F6ueA4WfiIqUzfAU
 FTZJV7a0YZEM9MhDj6l4wDKhMiLmeVZKUrcbCLYdRzVMLgJM2uY/aIyJ5jpmT+c+GtdL
 cahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RRuknqelNOI1UB+kwJ5TqkXZp3utom6eZtH8GWgRWF4=;
 b=UCm2a3kCuqN57jW3RE1f2/xbWZZkdI4fcnju3HXptyLxU+jva5OksviPfzizrXRKe6
 MuZFxwJnSix+hKr784wuidgQe1KFPtxd2R+3/1bdc3RySPpgcirjLXWodiHgivqUBcF1
 coPYn81ryR6KyTo18wymlT1on+DDaLjJZwEy50iEb+FhsrSnXy1JM3Q0I65bm3vvF2ns
 Et2oeGzFDhPKLC6lYHXpyrmqwXFBhueHpWyaA35/KiS8c+xt85feMnmqBr73+y5iuGCV
 Zu4tynKgHe4TI6TqE/vvY6QDCFJTGAK14hMHMiZ1mbZV+mLRxVkbvJD/lD5naBJdBdlS
 Feqg==
X-Gm-Message-State: AOAM532Qn5relnuGxJk3xrZNdJ9uQZXWUwUs0ran1rcp4Sf/k4Es6JmC
 FaA8id01Mol+jd5eQnegjFNWw5zCYTAcbIDhceY=
X-Google-Smtp-Source: ABdhPJzBimTHvzYH+DisriOOY9L+H5mD0AJ0lh/hEJ6896Zj3wzGB5z0Ee2M8s+wsXo3DjZet6UQtGqkTJTRgtrgDow=
X-Received: by 2002:a05:6402:6c4:: with SMTP id
 n4mr13726009edy.257.1611832349993; 
 Thu, 28 Jan 2021 03:12:29 -0800 (PST)
MIME-Version: 1.0
References: <20210127100206.277698-1-marcandre.lureau@redhat.com>
 <CAJ+F1CLJsyq0cQRUg=neJOWOuhm94xKceR4sQFaKOUQxVRi=Yg@mail.gmail.com>
 <20940fd9-8595-26d5-e13f-6915796f1019@redhat.com>
In-Reply-To: <20940fd9-8595-26d5-e13f-6915796f1019@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jan 2021 15:12:18 +0400
Message-ID: <CAJ+F1CKAWQOfiRG-dGhgThqQYLkQcr9kKuJF_1tRX9ZaDgLh1A@mail.gmail.com>
Subject: Re: [PATCH] ui: fix spice display regression
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Jan 27, 2021 at 2:54 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 27/01/21 11:18, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Jan 27, 2021 at 2:03 PM <marcandre.lureau@redhat.com> wrote:
> >>
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> Since commit b4e1a342112e50e05b609e857f38c1f2b7aafdc4 ("vl: remove
> >> separate preconfig main_loop"), spice initialization is a bit dodgy, a=
nd
> >> the client get stuck waiting for server events.
> >>
> >> The initialization order changed, so that qemu_spice_display_start() i=
s
> >> called before the display interfaces are added. The new interfaces
> >> aren't started by spice-server automatically (yet?), so we have to tel=
l
> >> the server explicitely when we are already running.
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> What is the exact different in initialization order once you add commit
> facf7c60ee ("vl: initialize displays _after_ exiting preconfiguration",
> 2021-01-02)?
>

We used to run qemu_spice.display_init() before vm_start() (in 5.2).
Actually that commit didn't help in this case! It's a bit hard to
track when things broke and how, since various commits created
different issues.

The current initialization order looks better, I am sending another
patch solving this by delaying starting Spice.

> Thanks,
>
> Paolo
>
> >> ---
> >>   ui/spice-core.c | 10 +++++++++-
> >>   1 file changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/ui/spice-core.c b/ui/spice-core.c
> >> index 5746d0aae7..6eebf12e3c 100644
> >> --- a/ui/spice-core.c
> >> +++ b/ui/spice-core.c
> >> @@ -830,6 +830,8 @@ static void qemu_spice_init(void)
> >>
> >>   static int qemu_spice_add_interface(SpiceBaseInstance *sin)
> >>   {
> >> +    int ret;
> >> +
> >>       if (!spice_server) {
> >>           if (QTAILQ_FIRST(&qemu_spice_opts.head) !=3D NULL) {
> >>               error_report("Oops: spice configured but not active");
> >> @@ -848,7 +850,13 @@ static int qemu_spice_add_interface(SpiceBaseInst=
ance *sin)
> >>           qemu_add_vm_change_state_handler(vm_change_state_handler, NU=
LL);
> >>       }
> >>
> >> -    return spice_server_add_interface(spice_server, sin);
> >> +    ret =3D spice_server_add_interface(spice_server, sin);
> >> +    /* make sure the newly added interface is started */
> >> +    if (ret =3D=3D 0 && spice_display_is_running) {
> >> +        spice_server_vm_start(spice_server);
> >> +    }
> >> +
> >> +    return ret;
> >>   }
> >>
> >>   static GSList *spice_consoles;
> >> --
> >> 2.29.0
> >>
> >>
> >
> > Oops, it doesn't work reliably. There is some race in spice server now.
> >
> > spice_server_vm_start() sends RED_WORKER_MESSAGE_START to the QXL
> > worker thread. But if two of those come, it will assert... It should
> > probably not, I will send a patch to spice.
> >
> > I am looking for other options for QEMU though.
> >
>


--=20
Marc-Andr=C3=A9 Lureau

