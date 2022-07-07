Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D841569E47
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 11:08:33 +0200 (CEST)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9NUu-0004mG-4a
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 05:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9NR2-0001PK-Sm
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9NR0-00084q-4e
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657184668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ErKIR9S/i5/pLeWaEFe2Elsz2q6UxTXb4twZx+WnPck=;
 b=NzA8hJXM82I3p4Kd0sfFip8Zix/MkgsYNr+PnfvFc9iBBcPMvWTh6dt22PMx7Gzx37qdCh
 pkGDO3fky5/NKIfq3f57AqPdKGserHgZrK0Cvm1swH8unO1asqQxBTfcejwtMqdk6hGNC5
 xqdGP1K/8ZEAUf4zohZ4EWySMcbChXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-kF5EjerCNDuTuscMybXmZw-1; Thu, 07 Jul 2022 05:04:25 -0400
X-MC-Unique: kF5EjerCNDuTuscMybXmZw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37C74101A54E;
 Thu,  7 Jul 2022 09:04:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C34A4492C3B;
 Thu,  7 Jul 2022 09:04:24 +0000 (UTC)
Date: Thu, 7 Jul 2022 10:04:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Chao Gao <chao.gao@intel.com>
Cc: fam@euphon.net, pbonzini@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [RFC v1] util/aio: Keep notification disabled as much as possible
Message-ID: <Ysahl6A7ZDyt7TFX@stefanha-x1.localdomain>
References: <20220701091348.215320-1-chao.gao@intel.com>
 <YsV5IYtyaqKoqRZ5@stefanha-x1.localdomain>
 <20220706141208.GA9972@gao-cwp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="niadalaPqfWXAOsl"
Content-Disposition: inline
In-Reply-To: <20220706141208.GA9972@gao-cwp>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--niadalaPqfWXAOsl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 10:12:14PM +0800, Chao Gao wrote:
> On Wed, Jul 06, 2022 at 12:59:29PM +0100, Stefan Hajnoczi wrote:
> >On Fri, Jul 01, 2022 at 05:13:48PM +0800, Chao Gao wrote:
> >> When measuring FIO read performance (cache=3Dwritethrough, bs=3D4k, io=
depth=3D64) in
> >> VMs, we observe ~80K/s notifications (e.g., EPT_MISCONFIG) from guest =
to qemu.
> >
> >It's not clear to me what caused the frequent poll_set_started(ctx,
> >false) calls and whether this patch is correct. I have posted some
>=20
> Me either. That's why the patch was marked RFC.

Your explanation about worker threads calling qemu_bh_schedule() ->
aio_notify() makes sense to me. Polling mode is stopped prematurely when
the event loop goes to process the BH. There is no need to stop polling
mode, the next event loop iteration could resume polling mode.

> >questions below about the nature of this issue.
> >
> >If ctx->fdmon_ops->wait() is called while polling is still enabled then
> >hangs or unnecessary latency can occur. For example, consider an fd
> >handler that temporarily suppresses fd activity between poll start/end.
> >The thread would be blocked in ->wait() and the fd will never become
> >readable. Even if a hang doesn't occur because there is a timeout, there
> >would be extra latency because the fd doesn't become readable and we
> >have to wait for the timeout to expire so we can poll again. So we must
> >be sure it's safe to leave polling enabled across the event loop and I'm
> >not sure if this patch is okay.
>=20
> Thanks for the explanation.
>=20
> in aio_poll(),
>=20
>     if (timeout || ctx->fdmon_ops->need_wait(ctx)) {
>         ctx->fdmon_ops->wait(ctx, &ready_list, timeout);
>     }
>=20
> if @timeout is zero, then ctx->fdmon_ops->wait() won't be called.
>=20
> In case #2 and #3 below, it is guaranteed that @timeout is zero after
> try_poll_mode() return. So, I think it is safe to keep polling enabled
> for these two cases.

I think you're right, it's safe since timeout is zeroed.

>=20
> >
> >>=20
> >> Currently, poll_set_started(ctx,false) is called in try_poll_mode() to=
 enable
> >> virtqueue notification in below 4 cases:
> >>=20
> >> 1. ctx->poll_ns is 0
> >> 2. a zero timeout is passed to try_poll_mode()
> >> 3. polling succeeded but reported as no progress
> >> 4. polling failed and reported as no progress
> >>=20
> >> To minimize unnecessary guest notifications, keep notification disable=
d when
> >> it is possible, i.e., polling is enabled and last polling doesn't fail.
> >
> >What is the exact definition of polling success/failure?
>=20
> Polling success: found some events pending.
> Polling failure: timeout.
>=20
> success/failure are used because I saw below comment in
> run_poll_handlers_once(), then I thought they are well-known terms.
>=20
>             /*
>              * Polling was successful, exit try_poll_mode immediately
>              * to adjust the next polling time.
>              */
>=20
> >
> >>=20
> >> Keep notification disabled for case #2 and #3; handle case #2 simply b=
y a call
> >
> >Did you see case #2 happening often? What was the cause?
>=20
> I think so. I can add some tracepoint and collect statistics.
>=20
> IMO (of course, I can be totally wrong), the cause is:
> when a worker thread in thread poll completes an IO request, a bottom
> half is queued by work_thread()->qemu_bh_schedule(). Pending bottom
> halves lead to aio_compute_timeout() setting timeout to zero and then
> a zero timeout is passed to try_poll_mode().
>=20
> >
> >> of run_poll_handlers_once() and for case #3, differentiate successful/=
failed
> >> polling and skip the call of poll_set_started(ctx,false) for successfu=
l ones.
> >
> >This is probably the most interesting case. When polling detects an
> >event, that's considered "progress", except for aio_notify() events.
> >aio_notify() is an internal event for restarting the event loop when
> >something has changed (e.g. fd handlers have been added/removed). I
> >wouldn't expect it to intefere polling frequently since that requires
> >another QEMU thread doing something to the AioContext, which should be
> >rare.
> >
> >Was aio_notify() intefering with polling in your case? Do you know why?
>=20
> Yes. It was. The reason is the same: after finishing IO requests, worker
> threads queue bottom halves during which aio_notify() is called.

Does this patch solve the issue? The idea is to defer
poll_set_started(false) for as long as possible.

diff --git a/util/aio-posix.c b/util/aio-posix.c
index 731f3826c0..536f8b2534 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -591,12 +591,6 @@ static bool try_poll_mode(AioContext *ctx, AioHandlerL=
ist *ready_list,
             return true;
         }
     }
-
-    if (poll_set_started(ctx, ready_list, false)) {
-        *timeout =3D 0;
-        return true;
-    }
-
     return false;
 }

@@ -657,6 +651,11 @@ bool aio_poll(AioContext *ctx, bool blocking)
      * system call---a single round of run_poll_handlers_once suffices.
      */
     if (timeout || ctx->fdmon_ops->need_wait(ctx)) {
+        if (poll_set_started(ctx, &ready_list, false)) {
+            timeout =3D 0;
+            progress =3D true;
+        }
+
         ctx->fdmon_ops->wait(ctx, &ready_list, timeout);
     }



--niadalaPqfWXAOsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLGoZcACgkQnKSrs4Gr
c8hgSQgAyFY22KZxU0vxz7e7XF++5gVlzgB6EluT6o6k5TVdJ/JjqVWt1LRrDMsF
3jEjCjsHStJ1pD7ZlhQ5aLKwcxfMVb9t/lXIlmP1rks9vt4bLxJd6r1+Jzli0B5S
vYesDmHABnHBnHhQg9YjCNo5jSQ+tID9J1r+PqDA9mWqkom8Teu1ZDB9MKMpYHIf
lQZ0z8/iAGqUXQipFNsTnC4dS11kBo7hnZy2fJIYHHdvvbBkbbi8dafDADaaig7C
oJLPwn9mfHrtLYbmq9DwFpNY5TfrVLoM8xLjQhX3mBxXFNKsbNLYS5lHD2NhDe2D
Ey2RiQHlI+XY4Bso2oQbBb2ThPdGIg==
=Zbpw
-----END PGP SIGNATURE-----

--niadalaPqfWXAOsl--


