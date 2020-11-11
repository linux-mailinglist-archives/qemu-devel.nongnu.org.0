Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ED42AF1E1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:19:18 +0100 (CET)
Received: from localhost ([::1]:43408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcq1t-0003m0-1s
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kcpuy-0006ki-CK
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:08 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kcpur-0002AG-82
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:08 -0500
Received: by mail-wm1-x32e.google.com with SMTP id p22so2216680wmg.3
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 05:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dw888WUBG3dup9iRFLokQP+5pVHoFGe06sv7sVLUer4=;
 b=lMnplc5rEZBNUKVkzf7Wlct22WG+ZhE0EMWyvrMBE5Sf2JJk+KyVKPxA/Skw/QvNmk
 u2CyiG56GUc8XSc9sTPIqULI6CSnrExu5LBoNH+PufEvw9ossq3Ef8yUiy8GffW3z+Nn
 47pqR2FMsESinCX1DmjRREnRyGfa+1Lj2o1oSFZDO5etp5M8QyvDhRC+trLAXVB/i2GC
 5RUFSzZuqifRP70VHfLw+16hEKrIivUH9rh4XIJaCuvMAq66lIMHSWn/T36yc3eK6UY3
 C1jiYRFXZzWRTNqqTFPA35Aw3Zs1S1KH2tlZr10rBo9DmekelguoKqwdoTKWZBhbSXiZ
 FT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dw888WUBG3dup9iRFLokQP+5pVHoFGe06sv7sVLUer4=;
 b=GwceLAEJwckOb3jEpVLwzsGB4+WpFud4o8uY/hLmoRMs4+gP3De3wDJZhV2g88Er+A
 nMhCpG/3meU7wWw2ylWbrwFbbvtzBQlPxEbMb/yl5unR1Q9eUEo+PpOCZokn7YQ9Xb1l
 PFIr3BXCjWZENn9GIxog8mLp1axa0JMkCnMwVKPFEL0PTPOzxoqvMRh5Q88sl9l9LFAg
 mrOlsWuoYGXrWveFFb7uJgHTEAJ9pIT1utJ5HSIENQ3LX9Sp6PT2yvm5NlDQuD0SIebP
 gpQ0YTrLB0iwOhcgR/QsUBU8LpPnU+mvnSth8b1PWg9goF7XRQmvTakKUQq8AjWLAg7L
 lkOw==
X-Gm-Message-State: AOAM530wuFsAU9NCY8LP/dZUWIFxZFLpdGw3v91t99dB2469e5GZZrEr
 IBBfj64XCdFx9dKSL9umYTSN0qpaHIffZA==
X-Google-Smtp-Source: ABdhPJw+rKlF8DOk9RxR/GrOWqIRTMzb6siw7v3ReozJQU9DVY9n7mKnVQvL34+KjJAi5jeNmg4Hjg==
X-Received: by 2002:a7b:c77a:: with SMTP id x26mr4102445wmk.63.1605100318837; 
 Wed, 11 Nov 2020 05:11:58 -0800 (PST)
Received: from localhost (85.9.90.146.dyn.plus.net. [146.90.9.85])
 by smtp.gmail.com with ESMTPSA id s9sm2763911wrf.90.2020.11.11.05.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:11:57 -0800 (PST)
Date: Wed, 11 Nov 2020 13:11:56 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: dtrace warnings for trace/trace-dtrace-hw_virtio.dtrace
Message-ID: <20201111131156.GB1395688@stefanha-x1.localdomain>
References: <87r1p2syo9.fsf@dusky.pond.sub.org>
 <20201109102556.GD684242@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline
In-Reply-To: <20201109102556.GD684242@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 10:25:56AM +0000, Daniel P. Berrang=E9 wrote:
> On Mon, Nov 09, 2020 at 09:48:54AM +0100, Markus Armbruster wrote:
> > I get this on Fedora 32:
> >=20
> > [12/8327] Generating trace-dtrace-hw_virtio.h with a custom command
> > Warning: /usr/bin/dtrace:trace/trace-dtrace-hw_virtio.dtrace:76: syntax=
 error near:
> > probe vhost_vdpa_dev_start
> >=20
> > Warning: Proceeding as if --no-pyparsing was given.
>=20
> Patch is posted and reviewed but needs merging still:
>=20
>   https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg05608.html

Dan and Markus: Thanks for the reminders. I am sending a QEMU 5.2 pull
request today.

Stefan

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+r4xwACgkQnKSrs4Gr
c8ittAf9FTwoPV+QgS17JJ9Lw9AUj6XmeKh9oXhC+i0Y54psLJt+FtKj/ydvotUx
bkEzeajiYob8QxHAEZhaiPBwejgOJO8tC3EURujiW0XrJ1K4wJoeMnNpZEi9xMWx
2m3Z53klzYA0UcRzjlApUMGX5sQcx1vLjNoJs7nPIGy+pIXCWkdmnxcydMkHrLTW
75Kf6oC2QjxjSqEq94JlVgnivGcre2NPKmPKMqpxtUtNk7Gh9mXkslsK8xfFESTg
PgFsuyrg6iGpVHVYD8V6JTKlZFxnMcjGNmWk/Mj1Vb6rLKwTcSpzLdttqAoldjaq
M0VUvnNYypTJi7J/w+Lz/Oh5BnGx8Q==
=pJXI
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--

