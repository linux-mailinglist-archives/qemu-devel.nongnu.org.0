Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FE61DD0BB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 17:04:39 +0200 (CEST)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbmkP-0007jK-Kg
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 11:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jbmjV-0007Bq-Bx; Thu, 21 May 2020 11:03:41 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jbmjU-0006Qe-0Y; Thu, 21 May 2020 11:03:41 -0400
Received: by mail-wr1-x444.google.com with SMTP id l17so6986521wrr.4;
 Thu, 21 May 2020 08:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jV5z+Kcrxa9LISUBYrnyYVTjGTANh97spCgmRUf0OCo=;
 b=BiWfoA53QyDf8xiwCKXAZC792q9Zc/228YGLH+105UqOVmssnxZumKU5a7+6cnh+lQ
 2bUImRf3c5jDYUwIWkqAa7tS4gV6sCdrz55yUUGxT6UsL8wc5FW3HF71SxzXWl6EKy+T
 RR7J4B36BEBx68AjqNp8r1Y9vvSwdsTxssjda0A3/mHRPQCqWabonHQUz9SDvJVKYk3m
 uTyI2OwmOPmmivQzqjoDrrVBF+uh1aup3er1PVNIYKSLN6TUA697j6tvUydLWh4iw+L/
 bCxuhBfxDHqyGlxGi5AcrgdwfAYByFgB07H3Te1q2NhIXso9kvMXMQNI+cjh+XLGfizZ
 qN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jV5z+Kcrxa9LISUBYrnyYVTjGTANh97spCgmRUf0OCo=;
 b=S8Kiamlbzfo9fT5EIswocgpteBaTkloDUk3+Pnidw6aKIefrTtFaTOJ+9DMsQU10di
 Wm5UXChQI0raDPu1HKO3a0XZgNwT0Nbl+SuxtXN8mCGEtIJWknTJB7rpDuLFN4XGBWg/
 CpC6BT7OagZo+8LPyBe3rbfRYCzo8Ma11KEN5B9sELVPy6UD/u7PWg4gb2+O6db3ZbyF
 0JpLu8g7gvC1M64CgBqqblYAxAz9A+4OIs+T0il/vh0zQwuMwM2yiCszYLG9mOBtYGRk
 s05ZE3VX1WibTMfOu5ofHezcxPaoM5xglGFGcSr7/Fh5eUjboRympMjy36ZS1wj6oFEt
 8Ywg==
X-Gm-Message-State: AOAM530YyxHYgio21F3vwHL5OhgUJ31SFM37iGCAUpy/pCFmRGznG17u
 ytMAchPMHKh76xJ0QBHAEwM=
X-Google-Smtp-Source: ABdhPJyadM7DzptqrGXHeetrqos/V5uQuwT8vg8ZO1HsuW8GbVDOi7mFM0/iXawCn0XC9MoTQsursw==
X-Received: by 2002:adf:ef47:: with SMTP id c7mr1515936wrp.57.1590073418041;
 Thu, 21 May 2020 08:03:38 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id 5sm6760994wmz.16.2020.05.21.08.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 08:03:37 -0700 (PDT)
Date: Thu, 21 May 2020 16:03:35 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH v2 1/4] Introduce yank feature
Message-ID: <20200521150335.GO251811@stefanha-x1.localdomain>
References: <cover.1590008051.git.lukasstraub2@web.de>
 <20005a15c708fbda983f9be602c55fc0b1979a18.1590008051.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rQ7Ovc9/RBrrr0/1"
Content-Disposition: inline
In-Reply-To: <20005a15c708fbda983f9be602c55fc0b1979a18.1590008051.git.lukasstraub2@web.de>
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rQ7Ovc9/RBrrr0/1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 11:05:39PM +0200, Lukas Straub wrote:
> +void yank_generic_iochannel(void *opaque)
> +{
> +    QIOChannel *ioc =3D QIO_CHANNEL(opaque);
> +
> +    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +}
> +
> +void qmp_yank(strList *instances, Error **errp)
> +{
> +    strList *tmp;
> +    struct YankInstance *instance;
> +    struct YankFuncAndParam *entry;
> +
> +    qemu_mutex_lock(&lock);
> +    tmp =3D instances;
> +    for (; tmp; tmp =3D tmp->next) {
> +        instance =3D yank_find_instance(tmp->value);
> +        if (!instance) {
> +            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
> +                      "Instance '%s' not found", tmp->value);
> +            qemu_mutex_unlock(&lock);
> +            return;
> +        }
> +    }
> +    tmp =3D instances;
> +    for (; tmp; tmp =3D tmp->next) {
> +        instance =3D yank_find_instance(tmp->value);
> +        assert(instance);
> +        QLIST_FOREACH(entry, &instance->yankfns, next) {
> +            entry->func(entry->opaque);
> +        }
> +    }
> +    qemu_mutex_unlock(&lock);
> +}

=46rom docs/devel/qapi-code-gen.txt:

  An OOB-capable command handler must satisfy the following conditions:

  - It terminates quickly.
  - It does not invoke system calls that may block.
  - It does not access guest RAM that may block when userfaultfd is
    enabled for postcopy live migration.
  - It takes only "fast" locks, i.e. all critical sections protected by
    any lock it takes also satisfy the conditions for OOB command
    handler code.

This patch series violates these rules and calls existing functions that
were not designed for OOB execution.

Please explain why it is safe to do this.

Stefan

--rQ7Ovc9/RBrrr0/1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7GmEcACgkQnKSrs4Gr
c8i3+Qf+KjAq5xl0Wlr557uX2HgDwl4orAe+VjbRS9HmH3UO/djYRmEktdL/OdFv
5+L76GRiw4BWCwVQKNohmQjDd2vr+qpqzHvpenu72e/wGbn+Zg023vYjM31OB1u7
evzWy8nTNERmQ4fhrZs35GakYoZSEbaQTrQqwzwiL3QRUEJm1yaoRJoAFRGQPKfb
up4c56iUSqIqixhFN1CgvClWVufkBXg84ajEiuBJzDYvKGoC5ScuPJwpTNi4GHk5
A2GZxOdBbcgN61L1t7jSnXk0H6yDiOREXcjWaG+GpmaxEyB5/0n71E9EWDLTwHjH
jh0c9EVsMXClaOMFPJs/Q7F+cLCsLw==
=6u+S
-----END PGP SIGNATURE-----

--rQ7Ovc9/RBrrr0/1--

