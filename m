Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8619E1D2894
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 09:15:06 +0200 (CEST)
Received: from localhost ([::1]:40346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ85B-00058m-2e
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 03:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jZ846-0004e0-O3
 for qemu-devel@nongnu.org; Thu, 14 May 2020 03:13:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54512
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jZ845-0001Px-AZ
 for qemu-devel@nongnu.org; Thu, 14 May 2020 03:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589440435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=smq3M7sjLr2KmKYlVkZ3HgBvLPmL85WDjU2eGgNfRRU=;
 b=dz1roIAQxEd64cHti8Si3iW5mid76I7MKkl4Q7WmSWwpbBKbe2zbpXBWqW0HJLs1Sjc1Qv
 U069TVtQjvftPffNRW7o0wsib0Rk8/Jr155EAnoxfodE3DHrPSuOpYQINb2FuChihtcGaG
 WnWrj/R6yQfHfSxNfsValQfygp1tiFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-38Z-tahdP161XBRNhH-czA-1; Thu, 14 May 2020 03:13:53 -0400
X-MC-Unique: 38Z-tahdP161XBRNhH-czA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 962AB6EAF7;
 Thu, 14 May 2020 07:13:52 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5106579AD;
 Thu, 14 May 2020 07:13:50 +0000 (UTC)
Subject: Re: [RFC v2] migration: Add migrate-set-bitmap-node-mapping
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20200513145610.1484567-1-mreitz@redhat.com>
 <0270abbd-3fa7-dcca-bbf5-80dd0fad1733@redhat.com>
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
Message-ID: <5454a628-0c6c-086c-c398-b5b3a8c6ec5b@redhat.com>
Date: Thu, 14 May 2020 09:13:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0270abbd-3fa7-dcca-bbf5-80dd0fad1733@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0PQK3dyfVeSsHH0egWg41C775G97rg6Ub"
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Peter Krempa <pkrempa@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0PQK3dyfVeSsHH0egWg41C775G97rg6Ub
Content-Type: multipart/mixed; boundary="6XJhTwclVFPl9IpksZhybt4pYUgtT8rqD"

--6XJhTwclVFPl9IpksZhybt4pYUgtT8rqD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 13.05.20 18:11, Eric Blake wrote:
> On 5/13/20 9:56 AM, Max Reitz wrote:
>> This command allows mapping block node names to aliases for the purpose
>> of block dirty bitmap migration.
>>
>> This way, management tools can use different node names on the source
>> and destination and pass the mapping of how bitmaps are to be
>> transferred to qemu (on the source, the destination, or even both with
>> arbitrary aliases in the migration stream).
>>
>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>=20
>> @@ -713,6 +731,44 @@ static bool dirty_bitmap_has_postcopy(void *opaque)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>> =C2=A0 }
>> =C2=A0 +void
>> qmp_migrate_set_bitmap_node_mapping(MigrationBlockNodeMappingList
>> *mapping,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Error **errp)
>> +{
>> +=C2=A0=C2=A0=C2=A0 QDict *in_mapping =3D qdict_new();
>> +=C2=A0=C2=A0=C2=A0 QDict *out_mapping =3D qdict_new();
>> +
>> +=C2=A0=C2=A0=C2=A0 for (; mapping; mapping =3D mapping->next) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MigrationBlockNodeMapping *e=
ntry =3D mapping->value;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (qdict_haskey(out_mapping=
, entry->node_name)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 erro=
r_setg(errp, "Cannot map node name '%s' twice",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entry->node=
_name);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto=
 fail;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Can we call this command more than once?=C2=A0 Is it cumulative (call it =
once
> to set mapping for "a", second time to also set mapping for "b"), or
> should it reset (second call wipes out all mappings from first call, any
> mappings that must exist must be passed in the final call)?

I tried to make it clear in the documentation:

> +# @mapping: The mapping; must be one-to-one, but not necessarily
> +#           complete.  Any mapping not given will be reset to the
> +#           default (i.e. the identity mapping).

So everything that isn=E2=80=99t set in the second call is reset.  I though=
t
about what you proposed (because I guess that=E2=80=99s the most intuitive
idea), but after consideration I didn=E2=80=99t see why we=E2=80=99d need d=
ifferent
behavior, so it would only serve to make the code more complicated.

Max

> The idea makes sense, and the interface seems usable.=C2=A0 It's nice tha=
t
> either source, destination, or both sides of migration can use it (which
> helps in upgrade vs. downgrade scenarios).


--6XJhTwclVFPl9IpksZhybt4pYUgtT8rqD--

--0PQK3dyfVeSsHH0egWg41C775G97rg6Ub
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl6876wACgkQ9AfbAGHV
z0AZbQgAm2NUhBiZG4jIMxUb/phBvkF/xhlZIMcSPC3gY0bf22hysIMBNDA8IlIY
TvIGodVbddBeO+k71MjXx9kBU7kBoeUxBP/H1CRe8GnIx29e/tuNYgABOUYcxbiA
//mUJQl5t7tSXlxcYDWOxEWgK2Z8NUrr9e+/9vHUefCQObdUVTHoSfUKvaFKShRu
C3VMh24F15swr9djTn/YU45auDoiEeBxtoSvI9z9kChpoNnL3aKOUkXA/vjR36ZE
OF2a4Ha3gRBiUp1g0LwFqTDjYfh7qHBjL3jYeu+87z7yIqybFyq8kZeqyRQCMv6N
clIxHc3k4dONvCJWk7GXhkTs/nCtBQ==
=S88W
-----END PGP SIGNATURE-----

--0PQK3dyfVeSsHH0egWg41C775G97rg6Ub--


