Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572065AB43E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 16:52:04 +0200 (CEST)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU81b-0003QS-1x
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 10:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oU7zf-0001vM-Pg
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 10:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oU7zb-0003L1-L0
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 10:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662130198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tdyLf/OEb3TbGXpjQ8JjpLcr8udT500aZsBehLPvQPI=;
 b=KH7ku3SzAbbZ7g2TLF2YrWInw8SHRDgdh/A77pPZOqu/aN+1eUPzHbdc6xMqqYnPu6Qn/w
 1tZ8lhfm7IKWjXRHqUZrNeQzHKom6L+vAGjAJL1L0TlIhmN0y4ThhywfHzw/lTrS8WpuZT
 OY5WyhSaznhMdRtuTklGjYR5KsBFqkU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-b4QqOm4GPaaMgzrTbcJfSg-1; Fri, 02 Sep 2022 10:49:56 -0400
X-MC-Unique: b4QqOm4GPaaMgzrTbcJfSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 264251C04B6E
 for <qemu-devel@nongnu.org>; Fri,  2 Sep 2022 14:49:56 +0000 (UTC)
Received: from localhost (unknown [10.40.193.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B684418ECC;
 Fri,  2 Sep 2022 14:49:55 +0000 (UTC)
Date: Fri, 2 Sep 2022 16:49:54 +0200
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 2/8] qapi: golang: Generate qapi's alternate types
 in Go
Message-ID: <20220902144954.64t2tcowesnfuw6o@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-3-victortoso@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="57ksn6h2255le6h5"
Content-Disposition: inline
In-Reply-To: <20220617121932.249381-3-victortoso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--57ksn6h2255le6h5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 17, 2022 at 02:19:26PM +0200, Victor Toso wrote:
> This patch handles QAPI alternate types and generates data structures
> in Go that handles it.
>
> At this moment, there are 5 alternates in qemu/qapi, they are:
>  * BlockDirtyBitmapMergeSource
>  * Qcow2OverlapChecks
>  * BlockdevRef
>  * BlockdevRefOrNull
>  * StrOrNull

So, things got a little bit complicated due the fact that
BlockdevRefOrNull and StrOrNull can take JSON NULL value and
that's completely different than an omitted field.

The last reply from Markus in another patch series make this
clear with a good deal of examples too.

    https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00113.html

I'll put the struggle that I'm having just in case someone have
suggestions.  Let's get an example:

In qemu/qapi/block-core.json:

    { 'struct': 'BlockdevOptionsQcow2',
      'base': 'BlockdevOptionsGenericCOWFormat',
      'data': { '*lazy-refcounts': 'bool',
                '*pass-discard-request': 'bool',
                '*pass-discard-snapshot': 'bool',
                '*pass-discard-other': 'bool',
                '*overlap-check': 'Qcow2OverlapChecks',
                '*cache-size': 'int',
                '*l2-cache-size': 'int',
                '*l2-cache-entry-size': 'int',
                '*refcount-cache-size': 'int',
                '*cache-clean-interval': 'int',
                '*encrypt': 'BlockdevQcow2Encryption',
                '*data-file': 'BlockdevRef' } }

Generates in qapi-go/pkg/qapi/structs.go:

    type BlockdevOptionsQcow2 struct {
        // Base fields
        Backing *BlockdevRefOrNull `json:"backing,omitempty"`

        LazyRefcounts       *bool                    `json:"lazy-refcounts,=
omitempty"`
        PassDiscardRequest  *bool                    `json:"pass-discard-re=
quest,omitempty"`
        PassDiscardSnapshot *bool                    `json:"pass-discard-sn=
apshot,omitempty"`
        PassDiscardOther    *bool                    `json:"pass-discard-ot=
her,omitempty"`
        OverlapCheck        *Qcow2OverlapChecks      `json:"overlap-check,o=
mitempty"`
        CacheSize           *int64                   `json:"cache-size,omit=
empty"`
        L2CacheSize         *int64                   `json:"l2-cache-size,o=
mitempty"`
        L2CacheEntrySize    *int64                   `json:"l2-cache-entry-=
size,omitempty"`
        RefcountCacheSize   *int64                   `json:"refcount-cache-=
size,omitempty"`
        CacheCleanInterval  *int64                   `json:"cache-clean-int=
erval,omitempty"`
        Encrypt             *BlockdevQcow2Encryption `json:"encrypt,omitemp=
ty"`
        DataFile            *BlockdevRef             `json:"data-file,omite=
mpty"`
    }

One thing that we assumed for all types is that an optional type
can be simply ignored. For that to work with Golang's
encoding/json, we make do by making every optional field a
pointer to the type it represents, plus we add the "omitempty"
tag. This way, if the user did not set it, it is simply ignored.
If we didn't receive anything, all should be good.

The problem happens when we receive a JSON Null value, which is
one possible value type for the BlockdevRefOrNull above. A
message like { "backing" : null } does not trigger UnmarshalJSON
for BlockdevRefOrNull and this is silently ignored.

In Go's encoding/json, in order to { "backing" : null } trigger
UnmarshalJSON, we need to remove omitempty and also the pointer
=66rom Backing. Now, on the marshalling side, we will always have
'backing' being set and in order to omit it from the output
(which we might want indeed) we need to rework the byte array,
which is something we were trying to avoid :)

I've looked up and there has been proposals to address this kind
of issue, including an omitnil tag [0] that could be used here to
workaround it but that's unlikely to move forward [1].

The first thing to do is to define when to omit *StrOrNull and
*BlockdevRefOrNull and when to set it to null. The solution I
thought would make sense is to have a Null boolean field that
user would need to set, so:


    type BlockdevRefOrNull struct {
        Definition *BlockdevOptions
        Reference  *string
        Null        bool
    }

    func (s BlockdevRefOrNull) MarshalJSON() ([]byte, error) {
        if s.Definition !=3D nil {
            return json.Marshal(s.Definition)
        } else if s.Reference !=3D nil {
            return json.Marshal(s.Reference)
        } else if s.Null {
            return []byte("null"), nil
        }
        // If only QAPI spec accepted "backing": {} as the same
        // as ommited.
        return []byte("qapi-go-remove-this-object"), nil
    }

    func (s *BlockdevRefOrNull) UnmarshalJSON(data []byte) error {
        // Check for json-null first
        if string(data) =3D=3D "null" {
            s.Null =3D true
            return nil
        }
        // Check for BlockdevOptions
        ...
    }

Setting BlockdevRefOrNull to null and to StrOrNull could have
different meanings which is explained in the documentation
itself. That's why I think Null as a boolean is fine, the user
sets for a specific context when it knows what it is doing...

Not having a pointer for optional fields of this two types breaks
the coherence we had that all optional members are pointers in
Go. This hurts a bit but this two are truly special as they can
have the magic null value.

Now, I'm thinking on a reasonable way to remove the object that
wraps "qapi-go-remove-this-object" as well, likely using the
json's decoder [2]...

[0] https://github.com/golang/go/issues/22480
[1] https://github.com/golang/go/issues/34701#issuecomment-544710311
[2] https://pkg.go.dev/encoding/json#Decoder.Token

Cheers,
Victor

--57ksn6h2255le6h5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmMSGBIACgkQl9kSPeN6
SE/Gew/+PTofe4RLlWlEQErbBKifyP2FKFDwMwvArFUlmoMGxF5iWH/qnJUGEYqZ
5bJAau/cWFQSL/6DZDaR0rtmjyePB0OXbqZqDJ/wlZhan8UHFMHHQELASobgoNfW
mOiPXW/tTr8rMWmYt9uSxlSgmRpngL0s+RRzjEEhF5T8Qh6LO09iyHtS0/Q5Ic9Y
X5RX2FGF0XxLTVdFPG4SwhhOLRYKtbkmVz0b7xcfjcRHJ9gC2mLkBdykTbmoeBU8
aLHMbRa2oo4bAv+bI4bNr0/KW7pe+Hpt4hKAj1TKYf92hmaKLwzZlPR3xTqTOP9E
5m4bUnmvgS/iQLA2/wUAfjDB6ZxkGuVInII5b1YZxEqxjTe06BEkMTFZlnD8+Wlb
Y9YZpmbY1Pc2vRJ1RvBY365InysVy+K9iJ85zylKKgHdkSzyfCfr98O39sNWLjvH
TtSD++vjrRQWCWihVf1O3sVdGgmmZOZonuBXtMzD3cV2c2nx/JzKp7mCSQijEyow
Mx8Z1meJQBtc+LJGkxRMnqRiTs897mmpzLWGiRP3x6YDUHZK8xQ8E1IrMS3dAXzU
jKx0VkaqBvFTejWYwVLzMEMBNIHu+KF5h366SAv0HIraZwTL8aYtMOG4XYNpAhz7
+hoE22+gJdWYPgGy4JAvJQXsbX+Illdf9nroumSYGZdUMyiRQPs=
=/n5k
-----END PGP SIGNATURE-----

--57ksn6h2255le6h5--


