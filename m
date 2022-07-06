Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D85687BC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 14:04:26 +0200 (CEST)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o93lY-00064u-V2
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 08:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o93h1-0004pA-CM
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:59:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o93gu-0003Zt-QB
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657108773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A/34uj3Fhans8q9m2GcoZ1iIGffdMlt52Pwfs9asBBE=;
 b=IMHrt3M49I6cvDFbngzGW/+bFJMZgMJkENODZuj4KQ+IbWcJxdIyKB23dwLj7/7KY8hEX9
 usXljWBnrU16y8arEexY+ofip5K2OHGEtxSsmXSGz5U+CyvzStYkcsKmpot7Q/8E2GCed6
 AoUZnRToYBKaUTVz1XrCLWgLEqev8W8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-HYO1TkmZO-G9rI8ghybq3Q-1; Wed, 06 Jul 2022 07:59:32 -0400
X-MC-Unique: HYO1TkmZO-G9rI8ghybq3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E13F8339A4;
 Wed,  6 Jul 2022 11:59:31 +0000 (UTC)
Received: from localhost (unknown [10.39.194.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F25D0140EBE3;
 Wed,  6 Jul 2022 11:59:30 +0000 (UTC)
Date: Wed, 6 Jul 2022 12:59:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Chao Gao <chao.gao@intel.com>
Cc: fam@euphon.net, pbonzini@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [RFC v1] util/aio: Keep notification disabled as much as possible
Message-ID: <YsV5IYtyaqKoqRZ5@stefanha-x1.localdomain>
References: <20220701091348.215320-1-chao.gao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9Bk7F3JcFiPQQ3Rb"
Content-Disposition: inline
In-Reply-To: <20220701091348.215320-1-chao.gao@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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


--9Bk7F3JcFiPQQ3Rb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2022 at 05:13:48PM +0800, Chao Gao wrote:
> When measuring FIO read performance (cache=3Dwritethrough, bs=3D4k, iodep=
th=3D64) in
> VMs, we observe ~80K/s notifications (e.g., EPT_MISCONFIG) from guest to =
qemu.

It's not clear to me what caused the frequent poll_set_started(ctx,
false) calls and whether this patch is correct. I have posted some
questions below about the nature of this issue.

If ctx->fdmon_ops->wait() is called while polling is still enabled then
hangs or unnecessary latency can occur. For example, consider an fd
handler that temporarily suppresses fd activity between poll start/end.
The thread would be blocked in ->wait() and the fd will never become
readable. Even if a hang doesn't occur because there is a timeout, there
would be extra latency because the fd doesn't become readable and we
have to wait for the timeout to expire so we can poll again. So we must
be sure it's safe to leave polling enabled across the event loop and I'm
not sure if this patch is okay.

>=20
> Currently, poll_set_started(ctx,false) is called in try_poll_mode() to en=
able
> virtqueue notification in below 4 cases:
>=20
> 1. ctx->poll_ns is 0
> 2. a zero timeout is passed to try_poll_mode()
> 3. polling succeeded but reported as no progress
> 4. polling failed and reported as no progress
>=20
> To minimize unnecessary guest notifications, keep notification disabled w=
hen
> it is possible, i.e., polling is enabled and last polling doesn't fail.

What is the exact definition of polling success/failure?

>=20
> Keep notification disabled for case #2 and #3; handle case #2 simply by a=
 call

Did you see case #2 happening often? What was the cause?

> of run_poll_handlers_once() and for case #3, differentiate successful/fai=
led
> polling and skip the call of poll_set_started(ctx,false) for successful o=
nes.

This is probably the most interesting case. When polling detects an
event, that's considered "progress", except for aio_notify() events.
aio_notify() is an internal event for restarting the event loop when
something has changed (e.g. fd handlers have been added/removed). I
wouldn't expect it to intefere polling frequently since that requires
another QEMU thread doing something to the AioContext, which should be
rare.

Was aio_notify() intefering with polling in your case? Do you know why?

>=20
> With this patch applied, FIO seq-read performance (bs=3D4k, iodepth=3D64,
> cache=3Dwritethrough) in VMs increases from 330K/s to 413K/s IOPS.
>=20
> Below are changes in VM-exit statistics:
> w/o this patch (duration:10s):
>            VM-EXIT    Samples  Samples%     Time%    Min Time    Max Time=
         Avg time
>=20
>      EPT_MISCONFIG     797440    99.34%    98.58%      0.39us     57.92us=
      0.60us ( +-   0.05% )
>          MSR_WRITE       3672     0.46%     1.15%      0.88us      4.97us=
      1.52us ( +-   0.53% )
> EXTERNAL_INTERRUPT       1638     0.20%     0.27%      0.59us     11.04us=
      0.81us ( +-   1.71% )
>=20
> w/ this patch (duration:10s):
>           VM-EXIT    Samples  Samples%     Time%    Min Time    Max Time =
        Avg time
>=20
>          MSR_WRITE       3524    84.11%    87.17%      0.86us      4.43us=
      1.74us ( +-   0.60% )
> EXTERNAL_INTERRUPT        515    12.29%    10.05%      0.64us      8.95us=
      1.37us ( +-   1.54% )
>      EPT_MISCONFIG        151     3.60%     2.79%      0.40us     52.07us=
      1.30us ( +-  31.44% )
>=20
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> ---
>  util/aio-posix.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/util/aio-posix.c b/util/aio-posix.c
> index 731f3826c0..bd2076145b 100644
> --- a/util/aio-posix.c
> +++ b/util/aio-posix.c
> @@ -519,7 +519,7 @@ static bool remove_idle_poll_handlers(AioContext *ctx,
>   * Returns: true if progress was made, false otherwise
>   */
>  static bool run_poll_handlers(AioContext *ctx, AioHandlerList *ready_lis=
t,
> -                              int64_t max_ns, int64_t *timeout)
> +                              int64_t max_ns, int64_t *timeout, bool *su=
ccess)
>  {
>      bool progress;
>      int64_t start_time, elapsed_time;
> @@ -553,6 +553,8 @@ static bool run_poll_handlers(AioContext *ctx, AioHan=
dlerList *ready_list,
>          progress =3D true;
>      }
> =20
> +    *success =3D !*timeout;
> +
>      /* If time has passed with no successful polling, adjust *timeout to
>       * keep the same ending time.
>       */
> @@ -577,22 +579,28 @@ static bool run_poll_handlers(AioContext *ctx, AioH=
andlerList *ready_list,
>  static bool try_poll_mode(AioContext *ctx, AioHandlerList *ready_list,
>                            int64_t *timeout)
>  {
> -    int64_t max_ns;
> +    int64_t max_ns, start_time;
> +    bool success =3D false;
> =20
>      if (QLIST_EMPTY_RCU(&ctx->poll_aio_handlers)) {
>          return false;
>      }
> =20
> +    if (!*timeout) {
> +        start_time =3D qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
> +        return run_poll_handlers_once(ctx, ready_list, start_time, timeo=
ut);
> +    }
> +
>      max_ns =3D qemu_soonest_timeout(*timeout, ctx->poll_ns);
>      if (max_ns && !ctx->fdmon_ops->need_wait(ctx)) {
>          poll_set_started(ctx, ready_list, true);
> =20
> -        if (run_poll_handlers(ctx, ready_list, max_ns, timeout)) {
> +        if (run_poll_handlers(ctx, ready_list, max_ns, timeout, &success=
)) {
>              return true;
>          }
>      }
> =20
> -    if (poll_set_started(ctx, ready_list, false)) {
> +    if (!success && poll_set_started(ctx, ready_list, false)) {
>          *timeout =3D 0;
>          return true;
>      }
> --=20
> 2.25.1
>=20

--9Bk7F3JcFiPQQ3Rb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLFeSEACgkQnKSrs4Gr
c8g4xQf/YDBRLh+HzrmWEghvEqDqLg20CGbfwrhFYa22BUEI2yOUKqGXAAHX5tFH
1QUQI4P6pkMN/J8Mqu+Hic/pu841f0/Qz02QVxjFfiIwkY9cvX2iTkARgfvi/W+B
b4qa4lv5JypSf7A8Xgp8cSLmgtMBVyjD418uCS9gP35CQGbuYKzTRufT35VY3oDV
Zef8jPasysYxpz/ZNw5gU1vR7lphIfZ5PubV2fSChlVzWVHFHVEbbbqagrdfo/vW
27VaXFuUSEixWWcxUbRPV3VXWo21NJmqepxlPzl1cj4PYxGWknSmkrM7YMB7cxPk
PGwPqn6d6iwFxvdP6fjXz+SE+lzDow==
=1pad
-----END PGP SIGNATURE-----

--9Bk7F3JcFiPQQ3Rb--


