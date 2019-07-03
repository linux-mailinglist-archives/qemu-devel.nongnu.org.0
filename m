Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B215E107
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 11:29:38 +0200 (CEST)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiba5-0007E4-80
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 05:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33847)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1hibR6-0004sY-Ql
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 05:20:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1hibR4-0000qK-Qh
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 05:20:20 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37083)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hibR2-0000YC-0Y
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 05:20:18 -0400
Received: by mail-wr1-x442.google.com with SMTP id v14so1915463wrr.4
 for <qemu-devel@nongnu.org>; Wed, 03 Jul 2019 02:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zokmhDVmugjm2Rx+36oRWee1JIvw+fpMCLAae7Xo4xE=;
 b=vTtS1v/Cc6DcqzdjeJ1QphnsgQ0HkoOwTY5rBs0t/CbvoWMg/nkyryfnlvsmDerj8H
 wkeZwaufSIinAZ1qAYcf7Z2M0gHhSJJWDbima9rEq9TUUlQiXHSona8pHjZKVgMXrFaA
 kfozJnyBZtaIvKbGwxDpFcSxC+/eJoXwkivIC5wKh9K41t+gfAYgqOBK/QXJIp8sY4CS
 fcfkRP/RH2u4IKRF7DVlvFLf5a+QShI5KP/CXVLmAtUSpK97CHwTr3VWyZH1nUT/TEv7
 XwHFCDrQTEZYIz+byZhzYU6WJydi4VreD2DGCKiGR2ZR6UYKbrSqsUC9YBWDOJk6xvxF
 4Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zokmhDVmugjm2Rx+36oRWee1JIvw+fpMCLAae7Xo4xE=;
 b=Uj51WZ+06lm7VWMrvGafZj9u4Jg7/gICcjewVG5raPGWPOja5zh+ZbKWMyyvw8Eu5U
 wu9QGjvWBK31chJDkMGlMHQujiYd86Zib4MLbIp43Cj8/jSSDZgaIFuSDrtKYrMZuBBa
 kdzpxsGx668sAv45C5pFt90aliSEByfLHAGvjpGYaDdd9JgLhWgDNspJ92CcGNeLnzu1
 AM8mytOIvtUmNPXDXxFoCimMwXuKbSqW3M+NWaOC4MmNXOU6LL7jJKAUCfUi0SIRR1i/
 Wk1mwFB1Y0dlc/hn1gfEQmX2xZK7bUSYCpFaOIlWykXERXOEV5e5er2rL9cAGrJDAo0Q
 ha+w==
X-Gm-Message-State: APjAAAVhJHxatdOWp5hEHaojDFwdGqtT5DNskkw4l3V/ZpItceuEH47h
 pPZUO2z7UNSgm97TQA0GDzA=
X-Google-Smtp-Source: APXvYqxXdrVI4HWisZ+ZrDTV042WSMHjXg2zaUwnfavu+aVPxALihBJBG4587km5WtoICEMienRGKQ==
X-Received: by 2002:adf:f042:: with SMTP id t2mr14646328wro.299.1562145608880; 
 Wed, 03 Jul 2019 02:20:08 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id f190sm2081893wmg.13.2019.07.03.02.20.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 02:20:08 -0700 (PDT)
Date: Wed, 3 Jul 2019 10:20:07 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190703092007.GB11844@stefanha-x1.localdomain>
References: <20190621094005.4134-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline
In-Reply-To: <20190621094005.4134-1-stefanha@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH 0/4] libvhost-user:
 VHOST_USER_PROTOCOL_F_MQ support
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
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2019 at 10:40:01AM +0100, Stefan Hajnoczi wrote:
> Sebastien Boeuf <sebastien.boeuf@intel.com> pointed out that libvhost-user
> doesn't advertise VHOST_USER_PROTOCOL_F_MQ.  Today this prevents vhost-us=
er-net
> multiqueue from working.
>=20
> In virtio-fs we also want to support multiqueue so I'm sending patches to=
 add
> this.  It's free to advertise VHOST_USER_PROTOCOL_F_MQ for all devices so=
 we
> can do it unconditionally in libvhost-user.
>=20
> Several related improvements are included:
> Patch 1 - clean up duplicated and risky VhostUserMsg reply building code
> Patch 2 - remove hardcoded 8 virtqueue limit in libvhost-user
> Patch 4 - clarify vhost-user multiqueue specification
>=20
> Stefan Hajnoczi (4):
>   libvhost-user: add vmsg_set_reply_u64() helper
>   libvhost-user: support many virtqueues
>   libvhost-user: implement VHOST_USER_PROTOCOL_F_MQ
>   docs: avoid vhost-user-net specifics in multiqueue section
>=20
>  contrib/libvhost-user/libvhost-user-glib.h |  2 +-
>  contrib/libvhost-user/libvhost-user.h      | 10 +++-
>  contrib/libvhost-user/libvhost-user-glib.c | 12 +++-
>  contrib/libvhost-user/libvhost-user.c      | 65 +++++++++++++---------
>  contrib/vhost-user-blk/vhost-user-blk.c    | 16 +++---
>  contrib/vhost-user-gpu/main.c              |  9 ++-
>  contrib/vhost-user-input/main.c            | 11 +++-
>  contrib/vhost-user-scsi/vhost-user-scsi.c  | 21 +++----
>  tests/vhost-user-bridge.c                  | 42 +++++++++-----
>  docs/interop/vhost-user.rst                | 21 +++----
>  10 files changed, 132 insertions(+), 77 deletions(-)
>=20
> --=20
> 2.21.0

Ping?

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0cc0cACgkQnKSrs4Gr
c8gLQwgAtUWD6kO/PdTgVUPWbNvYVT+QZmr8m4TsskNQhYoAAuGyqYN20fCppNt7
8Dx7CvwMErz2MEIxul+UdgR3MOYaFgGr/k7vU3uJPu5zt6a89fCf/82Jw5aGOn5k
k1FFwTQf8ceQsiaAKw1B+vrvwwOA1Av0KuA5M03gXtVT8ZpEsaKf4q1SX8iRP0h7
irdL7xelCzEqrXTXjJsu7rEaM8R9/gx7neYNLv0o3cGRmTea4svt6KUuBwVTFR2b
jy7N+5o9EfZIdt/Rxc6wtpSqXebalNhnZcECKOEpXi5+bQd8lkPRnT5sIogqE1Ch
oIMN8ffZi6VZK2jUPPRjzdY5p0SMrA==
=8K9l
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--

