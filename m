Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DF36A859D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 16:50:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlAl-0003ld-90; Thu, 02 Mar 2023 10:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXlAi-0003kr-Im
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:48:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXlAg-0003gb-PM
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677772121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KjaJIehJSuxVE4TD7Hle85EDXIi8T/+T/Hr+Ow1okHE=;
 b=VEoJYk6+E4t8h7vx9MhOOB13QvpWzt0UVLu1CLnS3rhkdDBUU776l7a8UvKuZraP5dDXVg
 ZseJV+UH+yh2ws6Hrv9i7qslnaW2ECvNfKzcx97KtA5zv4dXgc25sHkSPp7+kSrUBI99BY
 iFYFqgTttuuWjBi9x3hVK6wdNsxYP38=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-n0pOU0zhOrS2bnjkGLWS2w-1; Thu, 02 Mar 2023 10:48:37 -0500
X-MC-Unique: n0pOU0zhOrS2bnjkGLWS2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D2B1100F90B;
 Thu,  2 Mar 2023 15:48:36 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F311DC16027;
 Thu,  2 Mar 2023 15:48:35 +0000 (UTC)
Date: Thu, 2 Mar 2023 10:48:34 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 5/6] hmp: convert handle_hmp_command() to
 AIO_WAIT_WHILE_UNLOCKED()
Message-ID: <20230302154834.GA2497705@fedora>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-6-stefanha@redhat.com>
 <87ttz3sju0.fsf@pond.sub.org> <20230302132205.GB2485531@fedora>
 <87v8jjjiwx.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dGTtfjuot41NRlXl"
Content-Disposition: inline
In-Reply-To: <87v8jjjiwx.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--dGTtfjuot41NRlXl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2023 at 04:02:22PM +0100, Markus Armbruster wrote:
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > On Thu, Mar 02, 2023 at 08:17:43AM +0100, Markus Armbruster wrote:
> >> Stefan Hajnoczi <stefanha@redhat.com> writes:
> >>=20
> >> > The HMP monitor runs in the main loop thread. Calling
> >>=20
> >> Correct.
> >>=20
> >> > AIO_WAIT_WHILE(qemu_get_aio_context(), ...) from the main loop threa=
d is
> >> > equivalent to AIO_WAIT_WHILE_UNLOCKED(NULL, ...) because neither unl=
ocks
> >> > the AioContext and the latter's assertion that we're in the main loop
> >> > succeeds.
> >> >
> >> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> >> > ---
> >> >  monitor/hmp.c | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/monitor/hmp.c b/monitor/hmp.c
> >> > index 2aa85d3982..5ecbdac802 100644
> >> > --- a/monitor/hmp.c
> >> > +++ b/monitor/hmp.c
> >> > @@ -1167,7 +1167,7 @@ void handle_hmp_command(MonitorHMP *mon, const=
 char *cmdline)
> >> >          Coroutine *co =3D qemu_coroutine_create(handle_hmp_command_=
co, &data);
> >> >          monitor_set_cur(co, &mon->common);
> >> >          aio_co_enter(qemu_get_aio_context(), co);
> >> > -        AIO_WAIT_WHILE(qemu_get_aio_context(), !data.done);
> >> > +        AIO_WAIT_WHILE_UNLOCKED(NULL, !data.done);
> >> >      }
> >> > =20
> >> >      qobject_unref(qdict);
> >>=20
> >> Acked-by: Markus Armbruster <armbru@redhat.com>
> >>=20
> >> For an R-by, I need to understand this in more detail.  I'm not famili=
ar
> >> with the innards of AIO_WAIT_WHILE() & friends, so I need to go real
> >> slow.
> >>=20
> >> We change
> >>=20
> >>     ctx from qemu_get_aio_context() to NULL
> >>     unlock from true to false
> >>=20
> >> in
> >>=20
> >>     bool waited_ =3D false;                                          \
> >>     AioWait *wait_ =3D &global_aio_wait;                             \
> >>     AioContext *ctx_ =3D (ctx);                                      \
> >>     /* Increment wait_->num_waiters before evaluating cond. */     \
> >>     qatomic_inc(&wait_->num_waiters);                              \
> >>     /* Paired with smp_mb in aio_wait_kick(). */                   \
> >>     smp_mb();                                                      \
> >>     if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
> >>         while ((cond)) {                                           \
> >>             aio_poll(ctx_, true);                                  \
> >>             waited_ =3D true;                                        \
> >>         }                                                          \
> >>     } else {                                                       \
> >>         assert(qemu_get_current_aio_context() =3D=3D                  =
 \
> >>                qemu_get_aio_context());                            \
> >>         while ((cond)) {                                           \
> >>             if (unlock && ctx_) {                                  \
> >>                 aio_context_release(ctx_);                         \
> >>             }                                                      \
> >>             aio_poll(qemu_get_aio_context(), true);                \
> >>             if (unlock && ctx_) {                                  \
> >>                 aio_context_acquire(ctx_);                         \
> >>             }                                                      \
> >>             waited_ =3D true;                                        \
> >>         }                                                          \
> >>     }                                                              \
> >>     qatomic_dec(&wait_->num_waiters);                              \
> >>     waited_; })
> >>=20
> >> qemu_get_aio_context() is non-null here, correct?
> >
> > qemu_get_aio_context() always returns the main loop thread's AioContext.
>=20
> So it's non-null.

Yes. Sorry, I should have answered directly :).

> > qemu_get_current_aio_context() returns the AioContext that was most
> > recently set in the my_aiocontext thread-local variable for IOThreads,
> > the main loop's AioContext for BQL threads, or NULL for threads
> > that don't use AioContext at all.
> >
> >> What's the value of in_aio_context_home_thread(qemu_get_aio_context())?
> >
> > This function checks whether the given AioContext is associated with
> > this thread. In a BQL thread it returns true if the context is the main
> > loop's AioContext. In an IOThread it returns true if the context is the
> > IOThread's AioContext. Otherwise it returns false.
>=20
> I guess that means in_aio_context_home_thread(qemu_get_aio_context()) is
> true in the main thread.
>=20
> Before the patch, the if's condition is true, and we execute
>=20
>            while ((cond)) {                                           \
>                aio_poll(ctx_, true);                                  \
>                waited_ =3D true;                                        \
>            }                                                          \
>=20
> Afterwards, it's false, and we execute
>=20
> >>     }                                                              \
> >>     qatomic_dec(&wait_->num_waiters);                              \
> >>     waited_; })
> >>=20
> >> qemu_get_aio_context() is non-null here, correct?
> >
> > qemu_get_aio_context() always returns the main loop thread's AioContext.
>=20
> So it's non-null.
>=20
> > qemu_get_current_aio_context() returns the AioContext that was most
> > recently set in the my_aiocontext thread-local variable for IOThreads,
> > the main loop's AioContext for BQL threads, or NULL for threads
> > that don't use AioContext at all.
> >
> >> What's the value of in_aio_context_home_thread(qemu_get_aio_context())?
> >
> > This function checks whether the given AioContext is associated with
> > this thread. In a BQL thread it returns true if the context is the main
> > loop's AioContext. In an IOThread it returns true if the context is the
> > IOThread's AioContext. Otherwise it returns false.
>=20
> I guess that means in_aio_context_home_thread(qemu_get_aio_context()) is
> true in the main thread.

Yes.

> Before the patch, the if's condition is true, and we execute
>=20
>            while ((cond)) {                                           \
>                aio_poll(ctx_, true);                                  \
>                waited_ =3D true;                                        \
>            }                                                          \
>=20
> Afterwards, it's false, and we instead execute
>=20
>            assert(qemu_get_current_aio_context() =3D=3D                  =
 \
>                   qemu_get_aio_context());                            \
>            while ((cond)) {                                           \
>                if (unlock && ctx_) {                                  \
>                    aio_context_release(ctx_);                         \
>                }                                                      \
>                aio_poll(qemu_get_aio_context(), true);                \
>                if (unlock && ctx_) {                                  \
>                    aio_context_acquire(ctx_);                         \
>                }                                                      \
>                waited_ =3D true;                                        \
>            }                                                          \
>=20
> The assertion is true: both operands of =3D=3D are the main loop's
> AioContext.

Yes.

> The if conditions are false, because unlock is.
>=20
> Therefore, we execute the exact same code.
>=20
> All correct?

Yes, exactly.

Stefan

--dGTtfjuot41NRlXl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQAxVIACgkQnKSrs4Gr
c8iA1Qf+KwvbHkcnFGI64YTzP4ix/G6WAsB5jaMtVE333Dn8Amd/8jZ5Roq4Eed0
O/gnm9c/hnf/o6ninCBHkePFfwF4wFhdnwbhq0PgeQHO9yKZRZXyYzZoRj++BkN/
Ot3VfcakLNqBuRmxFjc8KifbDekZElaaNRlxM9ySLSKZpdbj6gspX4EPKyikpXsd
WaX0e7appYE/G03V9Hh+3xQ2v4DEjpuAmUWBxecCbYUUoJR6JUNdg9tuuiyOTf1F
gspl2KeyvkH0hlA4gjaClGGnH1nXeihj3N+Ay962z52D6xQ60ezXKUtWu5qiO67d
oFBtzYGQKQQDyuRG5l9j6HqKx/cu+g==
=/pHA
-----END PGP SIGNATURE-----

--dGTtfjuot41NRlXl--


