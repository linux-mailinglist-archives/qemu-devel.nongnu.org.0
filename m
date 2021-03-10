Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E40334141
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:12:44 +0100 (CET)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0Vu-0005JQ-PB
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lK0Ug-0004aC-AO
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:11:26 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lK0Ud-00084N-WD
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:11:25 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v15so23728297wrx.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 07:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sdo3HwacrS3v+6ee6Rryy6x4WK/zc/LecRiQlItjhQs=;
 b=ewRJHdKJo7sHX79NSu0d8smtj1lIGktFq1bDs9iEvYbCta2sgD55lc5h868XzxAOG9
 joLekj4PLS074Kb3Rc4DAgzGTi9+9UpTy4HYOmOk5WGzMqlR8OMRUGnbG/RbWgLOwbEo
 0yg5aoM3ucUdzcT5CKxjkO86GuNxtBBogTBnx7UVMzvBfS8B1uec5+/VFr8HwpB/RiXL
 MOHrSaejUje9StkD4br0Tl1XRn/aLFo4sYtt9XJTiO1rB97Y23PpwAAYAUVbgcH1rrwz
 fiy4RShkL1Oesx1p3A9YaWpW1g5lxFjB6G1e8uyCpheHrSP4Eg79gTjcsfVPd/qWRvUX
 byeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sdo3HwacrS3v+6ee6Rryy6x4WK/zc/LecRiQlItjhQs=;
 b=QlHt1K3ZOgnZcOz3KrRRuAoTvRwMyMKJAKx35NGhQHV5O+SRJXcpA47PxCrLGHv6Ro
 +jLr4pNCbyldHqNT9OrzaVvK7re+8CZK90NB7bojuR0VH1ZsRR+ALj/YmgCOvcBpSTDF
 DRi34B3hwQLri5FSmViYZhSCEFYw4KBWVsGg4DpPR9JjpPtN8Hu60bR6vFVUTLK9X2dp
 tcqdI+S5qA0h6J5RTC0IfO4oDmf9cxfzMUyrB5RyoUKT689kVqKySBMPjBJcF2l08Lx+
 nP6eWKu6g7QrdJraN4DoRWHpmuhQItQRGunNAhvED9Lh3L27obXuKykwPVKR0bdl6hnb
 4zMg==
X-Gm-Message-State: AOAM531ijzc075W3vwXlsWjnwZ4WLge8LcP1IMUW6QKDzCfGrf/9dnnY
 5Jbuh3U2FpaH42PT173sn7Q=
X-Google-Smtp-Source: ABdhPJz0S1kZO0mm7/yQYiSDVXw3mWMV3/+y4v+BUJ3hD8yKgNYJukg3nRqh6hnyYber7TY6fg356g==
X-Received: by 2002:a05:6000:188b:: with SMTP id
 a11mr3966138wri.151.1615389080568; 
 Wed, 10 Mar 2021 07:11:20 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id d85sm9900669wmd.15.2021.03.10.07.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 07:11:19 -0800 (PST)
Date: Wed, 10 Mar 2021 15:11:18 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Willian Rampazzo <willianr@redhat.com>
Subject: Re: [PATCH v3 0/2] tests: Add functional test for out-of-process
 device emulation
Message-ID: <YEjhlvjWMMnpQ/au@stefanha-x1.localdomain>
References: <20210303205320.146047-1-willianr@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JX6xM1WNwlyWv3Kw"
Content-Disposition: inline
In-Reply-To: <20210303205320.146047-1-willianr@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JX6xM1WNwlyWv3Kw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 05:53:18PM -0300, Willian Rampazzo wrote:
> This series is a respin to the "multi-process: Acceptance test for
> multiprocess QEMU" patch sent in December which, runs an Avocado
> functional test to check if a remote lsi53c895a device gets identified
> by the guest:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg769188.html
>=20
> First, we introduce the `exec_command` to the avocado_qemu package,
> which sends a command to a console without the need to wait for a
> pattern as a result. This is useful when a test needs to execute a
> command that does not produce an output, like, for example, a `mount`
> command.
>=20
> Then, the original test is refactored to simplify the code using the
> new `exec_command` function, remove the unnecessary change to the
> `wait_for_console_pattern` method and normalize the use of single
> quotes.
>=20
> CI Pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/261946622
>=20
> Supersedes: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elen=
a.ufimtseva@oracle.com>
>=20
> Change from v2:
>   - Add command type to the `exec_command` docstring
>=20
> Jagannathan Raman (1):
>   tests: Add functional test for out-of-process device emulation
>=20
> Willian Rampazzo (1):
>   avocado_qemu: add exec_command function
>=20
>  tests/acceptance/avocado_qemu/__init__.py | 14 +++-
>  tests/acceptance/multiprocess.py          | 95 +++++++++++++++++++++++
>  2 files changed, 108 insertions(+), 1 deletion(-)
>  create mode 100644 tests/acceptance/multiprocess.py
>=20
> --=20
> 2.29.2
>=20
>=20
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--JX6xM1WNwlyWv3Kw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBI4ZUACgkQnKSrs4Gr
c8h0dQf/ftLo7JpxvRJXrTWzBgchQgFEKPp8VN/69UA5PwZl1n3j8gdtgT9/PkhI
DbVyweSVIZZ9zYvsVuYqXq3XKVbPmUwhjMdbWVEQnngqQf1IAS6aYjms7bIyaXA0
OJ7OlMnGv3jJRDFKSlbQ4mw9afUM6Tys8oEnVESmwIrp7agsDv4zh9PxhRbrV9ua
9320noDX0rODRZsu7/HAhbX5hPkBKlf6sftAxyOOwzt75FyjgZWxj0Z2nh2tIrxc
QWDnlLDfyVl/tCN0ojf2s4dFqBPP4RTStLmTHmaVcFq085LJne+I3I4zdl8D8xU0
iMVjDY9NYJImXIz0gLkwEvbZyWJcRA==
=/W2O
-----END PGP SIGNATURE-----

--JX6xM1WNwlyWv3Kw--

