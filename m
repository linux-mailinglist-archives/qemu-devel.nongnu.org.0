Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCFD2E786
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 23:40:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW6J5-0006vF-4o
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 17:40:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hW6Hr-0006ZP-KK
	for qemu-devel@nongnu.org; Wed, 29 May 2019 17:39:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hW6Hq-00028Z-KN
	for qemu-devel@nongnu.org; Wed, 29 May 2019 17:39:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45466)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hW6Ho-00022F-61; Wed, 29 May 2019 17:39:04 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D458E85538;
	Wed, 29 May 2019 21:38:54 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-183.ams2.redhat.com
	[10.36.116.183])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C81B71001DFA;
	Wed, 29 May 2019 21:38:47 +0000 (UTC)
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <1559154027-282547-1-git-send-email-andrey.shinkevich@virtuozzo.com>
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
Message-ID: <fd085c62-35fb-a054-7a75-cad24eda07a1@redhat.com>
Date: Wed, 29 May 2019 23:38:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559154027-282547-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="7DQGwr02cYbk8roa3QaTK5SMN3pZd7ng0"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 29 May 2019 21:39:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2] hw/block/fdc: floppy command FIFO
 memory initialization
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
	jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7DQGwr02cYbk8roa3QaTK5SMN3pZd7ng0
From: Max Reitz <mreitz@redhat.com>
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: kwolf@redhat.com, jsnow@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com
Message-ID: <fd085c62-35fb-a054-7a75-cad24eda07a1@redhat.com>
Subject: Re: [PATCH v2] hw/block/fdc: floppy command FIFO memory
 initialization
References: <1559154027-282547-1-git-send-email-andrey.shinkevich@virtuozzo.com>
In-Reply-To: <1559154027-282547-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 29.05.19 20:20, Andrey Shinkevich wrote:
> The uninitialized memory allocated for the command FIFO of the
> floppy controller during the VM hardware initialization incurs
> many unwanted reports by Valgrind when VM state is being saved.
> That verbosity hardens a search for the real memory issues when
> the iotests run. Particularly, the patch eliminates 20 unnecessary
> reports of the Valgrind tool in the iotest #169.
>=20
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> ---
> v2:
>   01: The pointer unnecessary check 'if (fdctrl->fifo)' was removed
>       as suggested by John.
>=20
>  hw/block/fdc.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to my block-on-kevin branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block-on-kevin

(To become my block branch when my current pull request is done.)

Max


--7DQGwr02cYbk8roa3QaTK5SMN3pZd7ng0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlzu++QACgkQ9AfbAGHV
z0Dj2Qf/feeQKNhV7lpPMrXql3DXjvbCgtt7iT5BjLHusGDHxcT3Pvv+XfEWLl/i
DFLyFUCTAD0jVgTMzoNaJLRmvyGDV4baBIZJetEN9DcWhiIlVPaFcyJ0gp7HY91n
DJz1j2d4uqr+IeW7LA1ClRpANmC4V/qzfkE++VXk81p9PzsKEbFFGN2u8bLuxygl
LbB5/kHOOSWeRt/VdLDYLu43zdcuZgdRrqYpvkCu05909xymTGkeOIc33W72U2zm
XcLdFbALZJH46YqPf1OOBfvbPrWMcy1K4Nb/eDiwiXimblW19uxe2fSPCxvx6rY5
Dsfy61+a3sbjCiITuaHheMY2cIdlgw==
=Qm6M
-----END PGP SIGNATURE-----

--7DQGwr02cYbk8roa3QaTK5SMN3pZd7ng0--

