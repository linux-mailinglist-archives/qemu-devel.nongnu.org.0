Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A261C199357
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 12:22:56 +0200 (CEST)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJE2p-0004WX-O3
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 06:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jJE1h-00043Q-EI
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:21:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jJE1g-0000M6-AB
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:21:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38090
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jJE1g-0000JN-6U
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585650103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3RnK0Ahp2kQRYb8xaSSMQTyvrEDCLgRdT3v0w3TNkuU=;
 b=QpKwA8qYMVJO/2OC9BCC+BdhYWMrqhBNV4KUwj0RTdFOIQo3SUiow+ChGrIDfbALwVOphO
 kuOygEzNpvnBNFq5jIJ+9RJq8VgfPze9jpdSrbFQU64Igus/cmWxBGi3jJ8vAvMy0Wdakd
 KosIjox5jHlnyuaDUZWEo4q4w0xrV7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-hdxRJlugOXeWcVYH3FihOA-1; Tue, 31 Mar 2020 06:21:39 -0400
X-MC-Unique: hdxRJlugOXeWcVYH3FihOA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A03F0477;
 Tue, 31 Mar 2020 10:21:38 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D78A60BE1;
 Tue, 31 Mar 2020 10:21:36 +0000 (UTC)
Subject: Re: [PATCH v10 10/14] iotests: add hmp helper with logging
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20200331000014.11581-1-jsnow@redhat.com>
 <20200331000014.11581-11-jsnow@redhat.com>
From: Max Reitz <mreitz@redhat.com>
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
Message-ID: <88146808-4acc-247e-d34b-5dd16baad0b4@redhat.com>
Date: Tue, 31 Mar 2020 12:21:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331000014.11581-11-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sMGMT2cOVTFeurUP10keRzwruq18GmAQL"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 philmd@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sMGMT2cOVTFeurUP10keRzwruq18GmAQL
Content-Type: multipart/mixed; boundary="6dyIbhr2RF4gmYoPvEYXCTM5qYgPMbjf3"

--6dyIbhr2RF4gmYoPvEYXCTM5qYgPMbjf3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 31.03.20 02:00, John Snow wrote:
> Minor cleanup for HMP functions; helps with line length and consolidates
> HMP helpers through one implementation function.
>=20
> Although we are adding a universal toggle to turn QMP logging on or off,
> many existing callers to hmp functions don't expect that output to be
> logged, which causes quite a few changes in the test output.
>=20
> For now, offer a use_log parameter.
>=20
>=20
> Typing notes:
>=20
> QMPResponse is just an alias for Dict[str, Any]. It holds no special
> meanings and it is not a formal subtype of Dict[str, Any]. It is best
> thought of as a lexical synonym.
>=20
> We may well wish to add stricter subtypes in the future for certain
> shapes of data that are not formalized as Python objects, at which point
> we can simply retire the alias and allow mypy to more strictly check
> usages of the name.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>

> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
> index b08bcb87e1..dfc753c319 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -37,6 +37,10 @@
> =20
>  assert sys.version_info >=3D (3, 6)
> =20
> +# Type Aliases
> +QMPResponse =3D Dict[str, Any]
> +
> +
>  faulthandler.enable()
> =20
>  # This will not work if arguments contain spaces but is necessary if we
> @@ -540,25 +544,30 @@ def add_incoming(self, addr):
>          self._args.append(addr)
>          return self
> =20
> -    def pause_drive(self, drive, event=3DNone):
> -        '''Pause drive r/w operations'''
> +    def hmp(self, command_line: str, use_log: bool =3D False) -> QMPResp=
onse:
> +        cmd =3D 'human-monitor-command'
> +        kwargs =3D {'command-line': command_line}
> +        if use_log:
> +            return self.qmp_log(cmd, **kwargs)
> +        else:
> +            return self.qmp(cmd, **kwargs)

Hm.  I suppose I should take this chance to understand something about
mypy.  QEMUMachine.qmp() isn=E2=80=99t typed, so mypy can=E2=80=99t check t=
hat this
really returns QMPResponse.  Is there some flag to make it?  Like
--actually-check-types?

(--strict seems, well, overly strict?  Like not allowing generics, I
don=E2=80=99t see why.  Or I suppose for the time being we want to allow un=
typed
definitions, as long as they don=E2=80=99t break type assertions such as it=
 kind
of does here...?)

Max


--6dyIbhr2RF4gmYoPvEYXCTM5qYgPMbjf3--

--sMGMT2cOVTFeurUP10keRzwruq18GmAQL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl6DGa4ACgkQ9AfbAGHV
z0D5+wf/bmrv4X8R/xIhf/spiYX3QJ7sJCcySxwYJnP+FQHRCFY04PnDjAsqN9Aa
yI7z1BULpHvMsI60dLaYx1xUMuwAhqr5/3OtMVM20DLkXmoe6dMfRnHXMLN3Fk20
ylmyBhbcqbgwilunVyMZD0uaH4s+GMf+jNeTttofCJf8EMl6j+6T+cnNLLGac6Vz
IYxi/11ar+Qzh0ssfj4X+0VOYulJtP+NgLXGGIHbO45cmDbDB8yvn+zsiAMf+Vqd
fx5TRoyth9kRnaxZOhDA+c7qv4Z52KOhHMhA57dc/uvuh96GVIfL3Gk6BA/5h+vN
zSPMDGNCckAKlO3HpRE+XE24gW0fow==
=Z7Qf
-----END PGP SIGNATURE-----

--sMGMT2cOVTFeurUP10keRzwruq18GmAQL--


