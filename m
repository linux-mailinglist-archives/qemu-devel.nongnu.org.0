Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186021C3BC3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 15:53:35 +0200 (CEST)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVbXJ-0007VI-Q6
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 09:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jVbWC-0006ET-CN; Mon, 04 May 2020 09:52:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jVbWB-0004AY-JE; Mon, 04 May 2020 09:52:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id h9so10704032wrt.0;
 Mon, 04 May 2020 06:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ss72e6OZenPMICtv28OyGxBflfIwDL2NDJ5UL+MkqcQ=;
 b=srBjh2em2ivPJaoCGAQgq4cLyfBgMWOzpbQeBHD9Uiu5D6hFy+WBFFzgwphOXha1xF
 eM+eDtQDR6+lAM9ogAIh7Fm7IYqOPpd5XCjPp8Aq8bV7LTAtliuEtTg0Rup4TKJFV+c8
 pcIHL9rkVJUFeARsUoSwblEKO43tx+GjuPFq1XPglRDqt8qS3FJdye/9/ig86Z6mgs7U
 1SwuRAB+6wLAC5YFlYnB7QcntI0hNfxvBqQ3PkZpU4/AYnoD5IP0kGvb5rNuhtlILbng
 0NB/KUwCCQ5nDNjMIqdUrPb77Cflrwkr3JwPvlotzKt+T8M2P5R2Z5SmyI6UbHids6ZN
 ujrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ss72e6OZenPMICtv28OyGxBflfIwDL2NDJ5UL+MkqcQ=;
 b=VABw32uIDqD1orBc5efxrfil2toqP5E8GK0iWIvnYUo/WvUa46VyD9TEE7nOORZjjU
 mMG5je8fqoJHIf0yDi/38xg1HQYLHGPSuF6X7V2Ic9fFf1P0byCIw0Q/vEjVtQ+r+qBM
 HSu7w/jV2KOAo2b6XWU+O061WsKpDJbyHkGU1EmmC1KqhnStpy4DWyvggu2yYH0tqjw2
 dRXsklnWtaaXwqzMYsE+q0Fq+1WodD4YkYJJGdkGZothBhNsVs6AecUlS4OCwuKUK2qs
 mDEMKpKeQqV6TS/Rx6W8XcpcrDvaZHzQ7g3zYk93VbaFdmNvdGrLwqx7DRO9bAft7NGm
 POOg==
X-Gm-Message-State: AGi0PubVNgTNjsVwiuyH+xs8O1p9x0RqzOyV2FDpJp+0I1fprSKFtJzl
 u6TnulYOiRUFOgaKjbYB8s8=
X-Google-Smtp-Source: APiQypK0gIDu94vPBOrXfLXa+Bj9T/CkKu4Sg9Eu06jl4QMH/MuXMzW69VgE9xhKFsulWKR0UEXdhg==
X-Received: by 2002:adf:f704:: with SMTP id r4mr19757906wrp.5.1588600341539;
 Mon, 04 May 2020 06:52:21 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id l19sm14230250wmj.14.2020.05.04.06.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 06:52:20 -0700 (PDT)
Date: Mon, 4 May 2020 14:52:19 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Ramesh B <rmsh.b4@gmail.com>
Subject: Re: [Query] VM CPU scheduling
Message-ID: <20200504135219.GJ354891@stefanha-x1.localdomain>
References: <CAJvkk904hhJ0q54KAkYE-azEmg5gkt_-HVSyLnACKsV9=TmzQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6THr7QwYWIbrk6Kt"
Content-Disposition: inline
In-Reply-To: <CAJvkk904hhJ0q54KAkYE-azEmg5gkt_-HVSyLnACKsV9=TmzQg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: qemu-devel@nongnu.org, qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6THr7QwYWIbrk6Kt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 03, 2020 at 05:04:10PM +0530, Ramesh B wrote:
> Hi All,
>=20
> I started recently using QEMU for OS virtualization.
> Want to know/understand about scheduling.
>=20
> Environment:
> Host OS: Ubuntu 18.4 + KVM enable
> QEMU: 4.2
> Workstation/Desktop: x86_64
>=20
> Would like to understand,
>=20
> 1. How CPU scheduling works.
> 2. Tools/commands to monitor.
> 3. Tuning parameter/API
>=20
> Could you please suggest good reference or books or pointers.

Each guest CPU (vCPU) is a QEMU thread. The host scheduler decides when
and where it runs.

You can various features that influence scheduling like cgroups, CPU
affinity, etc to control vCPU scheduling. But the main thing to
understand is that vCPUs are just threads running on the host Linux
scheduler. All the usual tools are at your disposal.

Libvirt also provides support for configuring CPU scheduling/resource
control.

Stefan

--6THr7QwYWIbrk6Kt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6wHhIACgkQnKSrs4Gr
c8g/Pwf+Op5L9imGObhqV3w9nbtWSZxJn5LaxUWPjXSRCN6CwXuWbI4q7xw7nKyg
HZS7VVJMxS81YjSpzSB2jJJ3ciQW/S5DmCAZPXfAXgGLQMTz57kjnfX8z6bO56wH
TlsBaQdLn9Y4W55z3BeJ0qwKD1FFQcHcBn5j2PxtptrDC6nAYIfZs+HxX81QpeqR
PDHDAAvch3FIcWcDiJ5rYtTXMaAVpVCq1KGHBBdW9shRqO+d1gIvvt3Dtz2h93Q7
NzRkmoh0ylnXz5URxt7A1xwq3ZFPwcxKSSL9GhPzn6jdBH9OSv3Iju/Chw1arH2/
hPjd61dmqctjW6aiqBewtejpBbtIxg==
=TDx0
-----END PGP SIGNATURE-----

--6THr7QwYWIbrk6Kt--

