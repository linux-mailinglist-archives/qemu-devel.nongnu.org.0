Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F013A19E5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:36:34 +0200 (CEST)
Received: from localhost ([::1]:42436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0Ft-0008Gb-Jq
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lqzpl-0006Yz-CD
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:09:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lqzpj-000376-L6
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:09:33 -0400
Received: by mail-wm1-x32b.google.com with SMTP id f17so4255458wmf.2
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 08:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8/3sDvg1EwSzriPpYi6eQdIzRS2g1Iuh++ssJf822kI=;
 b=d/KVXaY0fL4g6KoavzU3tnVzLOwaQN7InZTcPN+7zJfzFDXEKy1WcYyLlj31pagGCX
 IL+3SAxQfQ9RBwlAc5nZu3bCweQKydF6xdho62naOcO1dZsdqB8aO2VQ2ChvWAQtxo8v
 kjyWthcgWOQwdZ9ldxELYYaD1jdh8pTnw3aJiDcxZBiF1QX2uDXWszb+n8TLReFwaVDy
 SOk21PpDqekZKcIMGpZ7CNG59L5rm+sfwpKfzalRMB3pVq1LG3rl7gDy5yfteN8oud08
 Ob9tIQ3x5sX6jkNVhFs9miH7qzxUuJskb0Z0a8m6ADSwdgcyir1/lqXd6RdBNxiLmxiJ
 74bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8/3sDvg1EwSzriPpYi6eQdIzRS2g1Iuh++ssJf822kI=;
 b=mK5CrliHiA0We4uBfJC55jTGW5rPfmByaVUwo+X0+OxBRrLVMCV5S9l8nmspaP4O8m
 Lt7qhACsDV6hUUyaIi0LqGr0JWwWbBYuTOxo7KddF5WGZ81+v6zBpjY9jwYzs6q0CA7v
 oBdUGqeA/FSzunQKGot65pERwbQu1mk8KTC2cLNEMQgy7wbMs+R6UYT/kNZxVFLy69e0
 zFM0LD3SV/MTRs0kCMB6cYgYH4rfEzqbW1rPfpheTI3GkCDxXtm7dLH+kJ98MDUu/t04
 5IjNKjssHLTOXnHEvTsKQuqoGdGC+kq/l9E4U6BelItwbvINkZz90RWDab2I/seT9ZPJ
 eEcQ==
X-Gm-Message-State: AOAM533PY4orlANXkwEyq5OP7rAJ8YlVOJCjnfBRBrEyC5DgQ39EAzE6
 pUYguGjM02DXY2bbG3bKW3c=
X-Google-Smtp-Source: ABdhPJxwoetGzN9GfP5YnR0wzq+apb9CvRV0UBKCDV+qD9ijMDDKVN5q5xgAZ5/b9ZEUtKYXFkKhKA==
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr10351822wmy.54.1623251369807; 
 Wed, 09 Jun 2021 08:09:29 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id l16sm4698198wmq.28.2021.06.09.08.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 08:09:29 -0700 (PDT)
Date: Wed, 9 Jun 2021 16:09:27 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
Message-ID: <YMDZp95Sd6EApSmN@stefanha-x1.localdomain>
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
 <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
 <6f4a0d6a-b306-5c14-1def-483ed9b81fda@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HWQDquYPGA/lgAXe"
Content-Disposition: inline
In-Reply-To: <6f4a0d6a-b306-5c14-1def-483ed9b81fda@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HWQDquYPGA/lgAXe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 04:07:57PM -0300, Wainer dos Santos Moschetta wrote:
> > And I understand that are a lot of them (from everyone, including
> > myself).=A0 The dilemma here is: should we activate the machines already
> > available, and learn in practice, what's missing?=A0 I honestly believe=
 we
> > should.
>=20
>=20
> IMHO we should merge the minimum possible to start using the existing
> machines, then address the questions (good questions, btw) raised by
> Philippe as needed.

That sounds good.

Does anyone want to volunteer to be the QEMU CI runners point of contact
who is responsible for defining the process? Cleber's last email left a
lot for Alex and me to define, but I would prefer it if someone who is
not me takes this on since I'm already spread thin. Alex? Philippe? Cleber?
Wainer?

Stefan

--HWQDquYPGA/lgAXe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDA2acACgkQnKSrs4Gr
c8ik4Af8DOU42VEsy2TgQPBNhxTVCI6KJpI+SnjA0mVHULOKzmsSkX605HyqnhIF
p3IfhlZCjrLKyFeK1zabcO1JhKNUVboBbn8r5rcL1biFIpotgEZkWMk2ci80QKM/
EUgbQJeQ6ET6ntCjd15Sx50NTYszYV854GgLkiJUVlqXuILgoN1IF89h7h5VQAFu
JfYm44ytwdYRdURLVp1/A4VsyWts3rqm2m3fn0+OJRV27BLfRmdLnlnLE14e1x3j
bDeBVBKRulu027SMGvADIlFTXND4hhVzZhjQb+MsuZ1tzapdv6rmzw0oM0+Fcl4h
vhpmSYCFQfNyj9lRTr3qoxEbgCWuCQ==
=Zf3r
-----END PGP SIGNATURE-----

--HWQDquYPGA/lgAXe--

