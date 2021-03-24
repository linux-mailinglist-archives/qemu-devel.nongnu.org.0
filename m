Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12DC347D87
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:18:58 +0100 (CET)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6Dh-00085p-Sk
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lP6AP-00075o-VQ; Wed, 24 Mar 2021 12:15:34 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:39664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lP6AK-0002Hw-88; Wed, 24 Mar 2021 12:15:33 -0400
Received: by mail-ed1-x52d.google.com with SMTP id bf3so28317310edb.6;
 Wed, 24 Mar 2021 09:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jwClcfOuO8IcCssQAkwvdYYydVkVQBpXghYANWsk9Lc=;
 b=ntsdJYjl6WHddzyu879dqlndDAyCVJ0uk7czQegLmJprevoi100TYjBpQn7D7CcgsB
 bVHBWMjbFYUtP/bsyJvhasL5h1QdNjTXtiw4PYAWkkjkScyryfCbo+PAUbw4n02Vqhvv
 FrbXn43KdQq9iNwbyna/vOPxs1Xcc19ARkN8OBDRwpLFqA1WqPtoRyl4fuHxg0Kt8XSH
 xWTJeiydBWl/FONgEFOhCOJ+7l3R7G0eRCACEicaIi1QEREW3DxOHhj2VlX5L1f5+fBr
 8K3A15rk0yG8moHsoZorqs2wRzTEUdGs+/awKQUZPe0Zj50kL1/zTeftaXMFa/LfgWbY
 zhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jwClcfOuO8IcCssQAkwvdYYydVkVQBpXghYANWsk9Lc=;
 b=hJZLDM0pN9xCjPhwJycn80I/sm0f/pkQrDD3+wgYgnCmYS/gR9fwa8T3hGsEnreTy8
 MJ/1VZ/CqYt3ZPZR2hkWQ3Xhd7JpJDycp+lZ9v4G1QrqqKfTlt9dOXjy2GCqklxjinNP
 Wf5D0MlFv9G3qzEQ+apl/NQJARercrTdu89PVveI9s00FJZjLVOzfaEbtWKAM04RZ/aq
 BKCTYqR/GHs12S1ncpmxo0hK7Trldr02h+JLP0lAs7qy/8v9/NL1xYWryHdSTITgqadl
 57sbOXtJxAX091SkqmzNgzbbKncunKv752B31FN5qKkdW8BA0McBoKpXeCKMPGqqSG+U
 ohUw==
X-Gm-Message-State: AOAM533w1WGMhR/NcIVAmTILiy8W/SI7LDQG+AlAnQ7QmuR1vy3U2oox
 mqJWdT8HEWFQyH/W2OZMZ94=
X-Google-Smtp-Source: ABdhPJzYztfOTt/KYH3wXjx74fh9Q3fXlIzEQObtIJPK2dcnV/VcW5LtemVMDQgun+kX492DTG/7UA==
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr4278168edu.52.1616602525563; 
 Wed, 24 Mar 2021 09:15:25 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id x1sm1151120eji.8.2021.03.24.09.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:15:24 -0700 (PDT)
Date: Wed, 24 Mar 2021 16:15:23 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/6] coroutine-lock: reimplement CoRwlock to fix
 downgrade bug
Message-ID: <YFtlm2+gainm8rox@stefanha-x1.localdomain>
References: <20210317180013.235231-1-pbonzini@redhat.com>
 <20210317180013.235231-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yYk8K0EixWDoxQTB"
Content-Disposition: inline
In-Reply-To: <20210317180013.235231-5-pbonzini@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yYk8K0EixWDoxQTB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 07:00:11PM +0100, Paolo Bonzini wrote:
> +static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
> +{
> +    CoRwTicket *tkt =3D QSIMPLEQ_FIRST(&lock->tickets);
> +    Coroutine *co =3D NULL;
> +
> +    /*
> +     * Setting lock->owners here prevents rdlock and wrlock from
> +     * sneaking in between unlock and wake.
> +     */
> +
> +    if (tkt) {
> +        if (tkt->read) {
> +            if (lock->owners >=3D 0) {
> +                lock->owners++;
> +                co =3D tkt->co;
> +            }
> +        } else {
> +            if (lock->owners =3D=3D 0) {
> +                lock->owners =3D -1;
> +                co =3D tkt->co;
> +            }
> +        }
> +    }
> +
> +    if (co) {
> +        QSIMPLEQ_REMOVE_HEAD(&lock->tickets, next);
> +        qemu_co_mutex_unlock(&lock->mutex);
> +        aio_co_wake(co);

I find it hard to reason about QSIMPLEQ_EMPTY(&lock->tickets) callers
that execute before co is entered. They see an empty queue even though a
coroutine is about to run. Updating owners above ensures that the code
correctly tracks the state of the rwlock, but I'm not 100% confident
about this aspect of the code.

>  void qemu_co_rwlock_upgrade(CoRwlock *lock)
>  {
> -    Coroutine *self =3D qemu_coroutine_self();
> -
>      qemu_co_mutex_lock(&lock->mutex);
> -    assert(lock->reader > 0);
> -    lock->reader--;
> -    lock->pending_writer++;
> -    while (lock->reader) {
> -        qemu_co_queue_wait(&lock->queue, &lock->mutex);
> -    }
> -    lock->pending_writer--;
> +    assert(lock->owners > 0);
> +    /* For fairness, wait if a writer is in line.  */
> +    if (lock->owners =3D=3D 1 && QSIMPLEQ_EMPTY(&lock->tickets)) {
> +        lock->owners =3D -1;
> +        qemu_co_mutex_unlock(&lock->mutex);
> +    } else {
> +        CoRwTicket my_ticket =3D { false, qemu_coroutine_self() };
> =20
> -    /* The rest of the write-side critical section is run with
> -     * the mutex taken, similar to qemu_co_rwlock_wrlock.  Do
> -     * not account for the lock twice in self->locks_held.
> -     */
> -    self->locks_held--;
> +        lock->owners--;
> +        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
> +        qemu_co_rwlock_maybe_wake_one(lock);
> +        qemu_coroutine_yield();
> +        assert(lock->owners =3D=3D -1);

lock->owners is read outside lock->mutex here. Not sure if this can
cause problems.

> +    }
>  }

locks_held is kept unchanged across qemu_coroutine_yield() even though
the read lock has been released. rdlock() and wrlock() only increment
locks_held after acquiring the rwlock.

In practice I don't think it matters, but it seems inconsistent. If
locks_held is supposed to track tickets (not just coroutines currently
holding a lock), then rdlock() and wrlock() should increment before
yielding.

--yYk8K0EixWDoxQTB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBbZZsACgkQnKSrs4Gr
c8gtEAgAplR5+ESCNNH46d+DzPLx+sXKQqLydIHZ4vgT0JOsrwu3qnNiZDlt0tM6
kuF/NzFFN/MpXCWi8B/IWtF9psMz3JeFupgw/J9ug1viw4fLEdZ9FPKY1kZbpPlW
Ux29RW9a9Sy8TKnk0qWwaF4XGnVKhoijeeGAUCBwc11jroszo/+v0Ec38V03Ojbe
JR0CfqmxTMvRXCpM8EqFa8kpQIpCOrcerz0NomP8I7PuwH78i999sQYVbTsWO0pd
j6HxtA6bkV5Zz05Zz4ABySL2Bi6DLzpvu8U3IP1t2k1es4DVwET4h5BWafDPovG2
xKjySdirTt6NRtdzxo+3CeVQx9zpQw==
=NeV1
-----END PGP SIGNATURE-----

--yYk8K0EixWDoxQTB--

