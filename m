Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A785F3F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 12:09:56 +0200 (CEST)
Received: from localhost ([::1]:48030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvfMp-0001NL-5c
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 06:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57341)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1hvfM5-0000yd-3W
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 06:09:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1hvfM4-0005q0-60
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 06:09:09 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52034)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hvfM3-0005pD-Tr
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 06:09:08 -0400
Received: by mail-wm1-x344.google.com with SMTP id 207so1817083wma.1
 for <qemu-devel@nongnu.org>; Thu, 08 Aug 2019 03:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=s6dxsPmpeLa71T0d2fV1Rzo3x94h4W9tGxfu2ulcKK4=;
 b=T75khKpTzjuTIU4mCMSiYGeqUZxTOgHJWLWICJlqbUZcEEQiB9dHx9fJqxFSyuVuUI
 9gKD8rxuGW3hcIpodqdkOziDnmetIokwNLKoLwSGhr1lwHJocWacLEyj5LSJkCYn3zn9
 ot8DrBX5lJuCIE4oIphAY2jOaUi8Kh0QsQVc9+bZ4ecz8WBVvpNpfASibX/KWTT2USCT
 SJonAZd8lnLqsuGKzHbGfoD/+pth1NNYIG8CRnZaDN+ntx4DLLgEMphMfxtAWA28vP4J
 HmV5aQmT9EpM70+2absLeTeo1KzoYsezqrPa4GeT6paGSDff6gOIarIfgirSgZTSWBIF
 CtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=s6dxsPmpeLa71T0d2fV1Rzo3x94h4W9tGxfu2ulcKK4=;
 b=IdKADmaZClpm4AiLCX+kpAzCwYsfrIqL3N+e19nySIHDyHsqVM5QLv1n3Nq1Pbdzds
 AEZXbkqPIeQQEX/gfOdMcRDnpdbNwy82aLccw2t9/zRTjZhEcr/cGi+7VsP6wpbS/7aZ
 N+xZ3ORwWHO6TmtQgeJpJtK5ORAgv2uzLEgc0B529SOJtjyr/mBYRQ61KLFqfUMHmXve
 4vBUJt6RTf80EZGRxuyuebBfO1Y8E8UhfC/2CYVGPCM5HOWXPk59hDfb61N1fe9iqA+r
 HOyowi8qC9CnaRPVyYb+RmnUR3ZAAc4/qi3wjdAoQdoy3rxmb81IC1bXOZOyOqlhU5nX
 Oyeg==
X-Gm-Message-State: APjAAAWBQcKf9LnogP5LFsOUymi4aSQUiTysv1iCPVjMKkKAdD1JVkUb
 XivLctKLGOvj8dwhFSpIrF0=
X-Google-Smtp-Source: APXvYqxuQdXwTsirKo4s8YFF41bqBbPKUQSUf2UtAKa3TtbDBmgHF27s8dmMU9yEIt2hcT/P7+bZLg==
X-Received: by 2002:a05:600c:2144:: with SMTP id
 v4mr1728170wml.146.1565258945538; 
 Thu, 08 Aug 2019 03:09:05 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id a19sm8753831wra.2.2019.08.08.03.09.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 03:09:04 -0700 (PDT)
Date: Thu, 8 Aug 2019 11:09:03 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Balamuruhan S <bala24@linux.ibm.com>
Message-ID: <20190808100903.GC1999@stefanha-x1.localdomain>
References: <20190807071445.4109-1-bala24@linux.ibm.com>
 <20190807071445.4109-2-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Content-Disposition: inline
In-Reply-To: <20190807071445.4109-2-bala24@linux.ibm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [RFC PATCH 1/6] utils/python_api: add scripting
 interface for Qemu with python lib
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
Cc: maddy@linux.vnet.ibm.com, anju@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 hari@linux.vnet.ibm.com, clg@kaod.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2019 at 12:44:40PM +0530, Balamuruhan S wrote:
> +void python_args_init_cast_int(char *args[], int arg, int pos)
> +{
> +    args[pos]= malloc(sizeof(int));
> +    sprintf(args[pos], "%d", arg);
> +}

This is broken.  args[pos] is a (possibly NULL) pointer to 4 bytes.
sprintf() will buffer overflow if arg has more than 3 digits.

A correct way to do this is:

  args[pos] = g_strdup_printf("%d", arg);

> +void python_args_init_cast_long(char *args[], uint64_t arg, int pos)
> +{
> +    args[pos]= g_malloc(sizeof(uint64_t) * 2);
> +    sprintf(args[pos], "%lx", arg);
> +}

Same issue.

> +void python_args_clean(char *args[], int nargs)
> +{
> +    for (int i = 0; i < nargs; i++) {
> +        g_free(args[i]);
> +    }
> +}

Mixing malloc() and g_free() is unsafe.  If you switch to
g_strdup_printf() then g_free() is correct.

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1L9L8ACgkQnKSrs4Gr
c8i7GggAo/yuQnqmYa9lRga+urI6JxHnZji27n29j2/UMaSuYSGfOLQ61/bwTmyD
yvcQN9TKScygoXPaumextCRJz/RuOR/vjPHt+GXc23BEsnMEowiV/VOjPD1n3vjT
0JX7QeY/9JGJhl4GHrw+pjmMksGoS7sIaQvevhKrqGWcgBpmGBG8TlvKvUM91qjX
QwuMobfllCcYjCvj0UJK6g38atNAaISsxKX+q19RDbAkvCS5cnhrjxqlJgQFMTvk
IPDXLpQxj3q9BcuE0TTC2FgBUr3wVGv2JRaVwNdVC0LsbUOwMsIvkPnpdtmA2Gx1
7pCjDuT8DvKvCJgFEmcVI972dTBhow==
=Eolm
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--

