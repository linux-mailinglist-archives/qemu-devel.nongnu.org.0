Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C18C113
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 20:52:54 +0200 (CEST)
Received: from localhost ([::1]:54880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxbuf-0006OR-SA
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 14:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47553)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hxbtj-0005fU-Uw
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 14:51:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hxbti-0000uk-Ve
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 14:51:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60324)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hxbtg-0000tG-GI; Tue, 13 Aug 2019 14:51:52 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2603E81F18;
 Tue, 13 Aug 2019 18:51:51 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C755891D9;
 Tue, 13 Aug 2019 18:51:45 +0000 (UTC)
To: Sam Eiderman <shmuel.eiderman@oracle.com>, kwolf@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, seabios@seabios.org,
 kraxel@redhat.com, kevin@koconnor.net
References: <20190626123948.10199-1-shmuel.eiderman@oracle.com>
 <20190626123948.10199-4-shmuel.eiderman@oracle.com>
From: Max Reitz <mreitz@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <a4e72a67-4107-4cbb-10e6-6a77011f34ce@redhat.com>
Date: Tue, 13 Aug 2019 20:51:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190626123948.10199-4-shmuel.eiderman@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UdjxFkOug62WtINyd4tKv7t4mu1XqYIxi"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 13 Aug 2019 18:51:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [QEMU] [PATCH v5 3/8] bootdevice: Add interface to
 gather LCHS
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
Cc: liran.alon@oracle.com, karl.heubaum@oracle.com, arbel.moshe@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UdjxFkOug62WtINyd4tKv7t4mu1XqYIxi
Content-Type: multipart/mixed; boundary="SJpyh4iUPO1hLQw6OMhvJgLckp4kbGSfw";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Sam Eiderman <shmuel.eiderman@oracle.com>, kwolf@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, seabios@seabios.org,
 kraxel@redhat.com, kevin@koconnor.net
Cc: karl.heubaum@oracle.com, liran.alon@oracle.com, arbel.moshe@oracle.com
Message-ID: <a4e72a67-4107-4cbb-10e6-6a77011f34ce@redhat.com>
Subject: Re: [QEMU] [PATCH v5 3/8] bootdevice: Add interface to gather LCHS
References: <20190626123948.10199-1-shmuel.eiderman@oracle.com>
 <20190626123948.10199-4-shmuel.eiderman@oracle.com>
In-Reply-To: <20190626123948.10199-4-shmuel.eiderman@oracle.com>

--SJpyh4iUPO1hLQw6OMhvJgLckp4kbGSfw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 26.06.19 14:39, Sam Eiderman wrote:
> Add an interface to provide direct logical CHS values for boot devices.=

> We will use this interface in the next commits.
>=20
> Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
> Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
> Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
> ---
>  bootdevice.c            | 55 +++++++++++++++++++++++++++++++++++++++++=
++++++++
>  include/sysemu/sysemu.h |  3 +++
>  2 files changed, 58 insertions(+)

I=E2=80=99ve got a couple of =E2=80=9Cundelivered mail returned to sender=
=E2=80=9D mails for Sam
recently, but anyway...

> diff --git a/bootdevice.c b/bootdevice.c
> index 1d225202f9..bc5e1c2de4 100644
> --- a/bootdevice.c
> +++ b/bootdevice.c
> @@ -343,3 +343,58 @@ void device_add_bootindex_property(Object *obj, in=
t32_t *bootindex,
>      /* initialize devices' bootindex property to -1 */
>      object_property_set_int(obj, -1, name, NULL);
>  }
> +
> +typedef struct FWLCHSEntry FWLCHSEntry;
> +
> +struct FWLCHSEntry {
> +    QTAILQ_ENTRY(FWLCHSEntry) link;
> +    DeviceState *dev;
> +    char *suffix;
> +    uint32_t lcyls;
> +    uint32_t lheads;
> +    uint32_t lsecs;
> +};
> +
> +static QTAILQ_HEAD(, FWLCHSEntry) fw_lchs =3D
> +    QTAILQ_HEAD_INITIALIZER(fw_lchs);
> +
> +void add_boot_device_lchs(DeviceState *dev, const char *suffix,
> +                          uint32_t lcyls, uint32_t lheads, uint32_t ls=
ecs)
> +{
> +    FWLCHSEntry *node;
> +
> +    if (!lcyls && !lheads && !lsecs) {
> +        return;
> +    }
> +
> +    assert(dev !=3D NULL || suffix !=3D NULL);

It doesn=E2=80=99t look like any caller actually passes a NULL @dev, so w=
hy not
drop the @suffix part?

> +    node =3D g_malloc0(sizeof(FWLCHSEntry));
> +    node->suffix =3D g_strdup(suffix);
> +    node->dev =3D dev;
> +    node->lcyls =3D lcyls;
> +    node->lheads =3D lheads;
> +    node->lsecs =3D lsecs;
> +
> +    QTAILQ_INSERT_TAIL(&fw_lchs, node, link);
> +}
> +
> +void del_boot_device_lchs(DeviceState *dev, const char *suffix)
> +{
> +    FWLCHSEntry *i;
> +
> +    if (dev =3D=3D NULL) {
> +        return;
> +    }
> +
> +    QTAILQ_FOREACH(i, &fw_lchs, link) {
> +        if ((!suffix || !g_strcmp0(i->suffix, suffix)) &&
> +             i->dev =3D=3D dev) {

(Furthermore, it=E2=80=99d be impossible to remove an FWLCHSEntry with .d=
ev =3D=3D
NULL.)

Max

> +            QTAILQ_REMOVE(&fw_lchs, i, link);
> +            g_free(i->suffix);
> +            g_free(i);
> +
> +            break;
> +        }
> +    }
> +}


--SJpyh4iUPO1hLQw6OMhvJgLckp4kbGSfw--

--UdjxFkOug62WtINyd4tKv7t4mu1XqYIxi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1TBsAACgkQ9AfbAGHV
z0DiTAf/VvNUfK7o/glkJLX6dyd/nz+OgW1Au48Q5dwL0f9S7Xk+sGJN5wA9Mrwp
L2wRWKkm9JgGVuZgYwjbYgZ0y5doBllu8pU9BVGWA6r6QkZ6oLotCOGMwY+yO1xg
MLfmwLN79TIgmoTHxLvoJAxRzRpaIWNri8wWo62df8lZDb0cdj0kFUWGd90rAgpA
BfOEjfUDH8zLmcsa48Edg0dNZdg4OdoI/uS0mQuCvrK1SPEH5x+NH2MBuW6hmNDt
z9IPbLGiFRLbqgqypWf3eWoWJtf/Lrc75VfRqxaqWh8Qrhs15PIIFY46pLx0A618
ewM9osTJpmsS9IRweW2y4GqeCmC8Lg==
=8L9O
-----END PGP SIGNATURE-----

--UdjxFkOug62WtINyd4tKv7t4mu1XqYIxi--

