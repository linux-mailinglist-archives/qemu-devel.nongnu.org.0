Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFA66B5C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 13:10:15 +0200 (CEST)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hltRO-0004fk-5n
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 07:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44727)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hltR9-0004At-Le
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:10:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hltR8-0007jx-Em
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:09:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58394)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hltR5-0007dO-LO; Fri, 12 Jul 2019 07:09:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1BCB330BC591;
 Fri, 12 Jul 2019 11:09:54 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87BA06062A;
 Fri, 12 Jul 2019 11:09:50 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>
References: <20190711195804.30703-1-mreitz@redhat.com>
 <20190711195804.30703-2-mreitz@redhat.com>
 <20190712092419.GB4514@dhcp-200-226.str.redhat.com>
 <8ce2ce78-833e-c98f-ad3a-d44f6432ae4c@redhat.com>
 <20190712110110.GE4514@dhcp-200-226.str.redhat.com>
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
Message-ID: <cd184838-6c1f-0d22-1d89-415dbd62955b@redhat.com>
Date: Fri, 12 Jul 2019 13:09:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712110110.GE4514@dhcp-200-226.str.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RYSPyJ6ZBE4IuNGtdACWNtXnzS9m4d9TU"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 12 Jul 2019 11:09:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC 1/5] block/nbd: Fix hang in .bdrv_close()
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RYSPyJ6ZBE4IuNGtdACWNtXnzS9m4d9TU
Content-Type: multipart/mixed; boundary="XvwttsEzYTMefCyyYjYJ4aBIjpSxm6Gmd";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <cd184838-6c1f-0d22-1d89-415dbd62955b@redhat.com>
Subject: Re: [RFC 1/5] block/nbd: Fix hang in .bdrv_close()
References: <20190711195804.30703-1-mreitz@redhat.com>
 <20190711195804.30703-2-mreitz@redhat.com>
 <20190712092419.GB4514@dhcp-200-226.str.redhat.com>
 <8ce2ce78-833e-c98f-ad3a-d44f6432ae4c@redhat.com>
 <20190712110110.GE4514@dhcp-200-226.str.redhat.com>
In-Reply-To: <20190712110110.GE4514@dhcp-200-226.str.redhat.com>

--XvwttsEzYTMefCyyYjYJ4aBIjpSxm6Gmd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12.07.19 13:01, Kevin Wolf wrote:
> Am 12.07.2019 um 12:47 hat Max Reitz geschrieben:
>> On 12.07.19 11:24, Kevin Wolf wrote:
>>> Am 11.07.2019 um 21:58 hat Max Reitz geschrieben:
>>>> When nbd_close() is called from a coroutine, the connection_co never=

>>>> gets to run, and thus nbd_teardown_connection() hangs.
>>>>
>>>> This is because aio_co_enter() only puts the connection_co into the =
main
>>>> coroutine's wake-up queue, so this main coroutine needs to yield and=

>>>> reschedule itself to let the connection_co run.
>>>>
>>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>>> ---
>>>>  block/nbd.c | 12 +++++++++++-
>>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/block/nbd.c b/block/nbd.c
>>>> index 81edabbf35..b83b6cd43e 100644
>>>> --- a/block/nbd.c
>>>> +++ b/block/nbd.c
>>>> @@ -135,7 +135,17 @@ static void nbd_teardown_connection(BlockDriver=
State *bs)
>>>>      qio_channel_shutdown(s->ioc,
>>>>                           QIO_CHANNEL_SHUTDOWN_BOTH,
>>>>                           NULL);
>>>> -    BDRV_POLL_WHILE(bs, s->connection_co);
>>>> +
>>>> +    if (qemu_in_coroutine()) {
>>>> +        /* Let our caller poll and just yield until connection_co i=
s done */
>>>> +        while (s->connection_co) {
>>>> +            aio_co_schedule(qemu_get_current_aio_context(),
>>>> +                            qemu_coroutine_self());
>>>> +            qemu_coroutine_yield();
>>>> +        }
>>>
>>> Isn't this busy waiting? Why not let s->connection_co wake us up when=

>>> it's about to terminate instead of immediately rescheduling ourselves=
?
>>
>> Yes, it is busy waiting, but I didn=E2=80=99t find that bad.  The conn=
ection_co
>> will be invoked in basically every iteration, and once there is no
>> pending data, it will quit.
>>
>> The answer to =E2=80=9Cwhy not...=E2=80=9D of course is because it=E2=80=
=99d be more complicated.
>>
>> But anyway.
>>
>> Adding a new function qemu_coroutine_run_after(target) that adds
>> qemu_coroutine_self() to the given @target coroutine=E2=80=99s wake-up=
 queue and
>> then using that instead of scheduling works, too, yes.
>>
>> I don=E2=80=99t really like being responsible for coroutine code, thou=
gh...
>>
>> (And maybe it=E2=80=99d be better to make it qemu_coroutine_yield_for(=
target),
>> which does the above and then yields?)
>=20
> Or just do something like this, which is arguably not only a fix for th=
e
> busy wait, but also a code simplification:

1. Is that guaranteed to work?  What if data sneaks in, the
connection_co handles that, and doesn=E2=80=99t wake up the teardown_co? =
 Will
it be re-scheduled?

2. I precisely didn=E2=80=99t want to do this because we have this functi=
onality
already in the form of Coroutine.co_queue_wakeup.  Why duplicate it here?=


Max

> diff --git a/block/nbd.c b/block/nbd.c
> index b83b6cd43e..c061bd1bfc 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -61,6 +61,7 @@ typedef struct BDRVNBDState {
>      CoMutex send_mutex;
>      CoQueue free_sema;
>      Coroutine *connection_co;
> +    Coroutine *teardown_co;
>      int in_flight;
>=20
>      NBDClientRequest requests[MAX_NBD_REQUESTS];
> @@ -137,12 +138,9 @@ static void nbd_teardown_connection(BlockDriverSta=
te *bs)
>                           NULL);
>=20
>      if (qemu_in_coroutine()) {
> -        /* Let our caller poll and just yield until connection_co is d=
one */
> -        while (s->connection_co) {
> -            aio_co_schedule(qemu_get_current_aio_context(),
> -                            qemu_coroutine_self());
> -            qemu_coroutine_yield();
> -        }
> +        /* just yield until connection_co is done */
> +        s->teardown_co =3D qemu_coroutine_self();
> +        qemu_coroutine_yield();
>      } else {
>          BDRV_POLL_WHILE(bs, s->connection_co);
>      }
> @@ -217,6 +215,9 @@ static coroutine_fn void nbd_connection_entry(void =
*opaque)
>      bdrv_dec_in_flight(s->bs);
>=20
>      s->connection_co =3D NULL;
> +    if (s->teardown_co) {
> +        aio_co_wake(s->teardown_co);
> +    }
>      aio_wait_kick();
>  }
>=20



--XvwttsEzYTMefCyyYjYJ4aBIjpSxm6Gmd--

--RYSPyJ6ZBE4IuNGtdACWNtXnzS9m4d9TU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0oanwACgkQ9AfbAGHV
z0Di8wf/WoQYpBv9MsN2DDKqE/0Foua3Am4hDhQ6Op/UWnBxoRG0PhtNfuVHAbkp
kN9aFVtZQgRFjfSyzv4J/GkIveJ6in1goQAC3ORGJjdFhJu940I1avJ+cyPtgjT4
ZaH/PxwHqlRXYYaA3G4vKX6++qvNfvBHZfE9HJAaL6ikT+kVG34TFMGqHMiBJYW6
yZIRvMrqh4qjmXKbqLrjpoMpgJz334Olf7ShLPjXX1cG9nIPPMghroy6qOUeV3p1
UYBvXFZ5cc5ZkTunxWIzBGSyHDDfBTb9+c9k03G5HgpJrKjJ/1ba6zsG7g+WwLKp
mekVQuMigfVYfe/aLdm6hnQ8MjqoRA==
=Or9M
-----END PGP SIGNATURE-----

--RYSPyJ6ZBE4IuNGtdACWNtXnzS9m4d9TU--

