Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E09359705D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 16:07:51 +0200 (CEST)
Received: from localhost ([::1]:59496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJi2-0001ku-8e
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 10:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOJem-00068K-4h
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOJei-0007UO-C1
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660745062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GyGu6XDJHmSFHyr++P73rHxThu6sxjrXKgeiBcFFDtM=;
 b=QMPeTUIW6+c7zVUzz4iAEzoISAOLSwn5snGo3GxHjLxeyLQkEvNdk1MnbkbV/sprJaKfG1
 u/UOJYhBTGXwD4JIziO2FWE2x1vHeYcrTXMPcpglZl+69QhYX5XZ686rZTw4tdORhI3KFo
 FLNIOCDgpxkkQJE4GGwgdaOTfTjMhiE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-zL8Tn21RP9q8nv0XZXaRaQ-1; Wed, 17 Aug 2022 10:04:21 -0400
X-MC-Unique: zL8Tn21RP9q8nv0XZXaRaQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B58C8117B0
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 14:04:21 +0000 (UTC)
Received: from localhost (unknown [10.40.192.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A9AB141511A;
 Wed, 17 Aug 2022 14:04:20 +0000 (UTC)
Date: Wed, 17 Aug 2022 16:04:19 +0200
From: Victor Toso <victortoso@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 2/8] qapi: golang: Generate qapi's alternate types
 in Go
Message-ID: <20220817140419.vpxjay4ouaz2gsam@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-3-victortoso@redhat.com>
 <CABJz62NXnKFm=n=7eXmb==zSUe0VCy_0jbcFoNc8SwrQ2YKjvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="66sp3a4znns26mmo"
Content-Disposition: inline
In-Reply-To: <CABJz62NXnKFm=n=7eXmb==zSUe0VCy_0jbcFoNc8SwrQ2YKjvg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


--66sp3a4znns26mmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jul 05, 2022 at 08:45:06AM -0700, Andrea Bolognani wrote:
> Sorry it took me a while to find the time to look into this!

(1.5 month later.. what can I say!) :)

> Overall this second iteration is a significant improvement over the
> initial one. There are still a few things that I think should be
> changed, so for the time being I'm going to comment mostly on the
> generated Go code and leave the details of the implementation for
> later.

Sure, and thanks.

> On Fri, Jun 17, 2022 at 02:19:26PM +0200, Victor Toso wrote:
> > This patch handles QAPI alternate types and generates data structures
> > in Go that handles it.
> >
> > At this moment, there are 5 alternates in qemu/qapi, they are:
> >  * BlockDirtyBitmapMergeSource
> >  * Qcow2OverlapChecks
> >  * BlockdevRef
> >  * BlockdevRefOrNull
> >  * StrOrNull
>
> I personally don't think it's very useful to list all the alternate
> types in the commit message, or even mention how many there are. You
> do this for all other types too, and it seems to me that it's just an
> opportunity for incosistent information to make their way to the git
> repository - what if a new type is introduced between the time your
> series is queued and merged? I'd say just drop this part.

No issue on my side in dropping this bits.

> > Example:
> >
> > qapi:
> >   | { 'alternate': 'BlockdevRef',
> >   |   'data': { 'definition': 'BlockdevOptions',
> >   |             'reference': 'str' } }
> >
> > go:
> >   | type BlockdevRef struct {
> >   |         Definition *BlockdevOptions
> >   |         Reference  *string
> >   | }
> >
> > usage:
> >   | input := `{"driver":"qcow2","data-file":"/some/place/my-image"}`
> >   | k := BlockdevRef{}
> >   | err := json.Unmarshal([]byte(input), &k)
> >   | if err != nil {
> >   |     panic(err)
> >   | }
> >   | // *k.Definition.Qcow2.DataFile.Reference == "/some/place/my-image"
>
> Let me just say that I absolutely *love* how you've added these bits
> comparing the QAPI / Go representations as well as usage. They really
> help a lot understanding what the generator is trying to achieve :)

Thanks!

> > +// Creates a decoder that errors on unknown Fields
> > +// Returns true if successfully decoded @from string @into type
> > +// Returns false without error is failed with "unknown field"
> > +// Returns false with error is a different error was found
> > +func StrictDecode(into interface{}, from []byte) error {
> > +    dec := json.NewDecoder(strings.NewReader(string(from)))
> > +    dec.DisallowUnknownFields()
> > +
> > +    if err := dec.Decode(into); err != nil {
> > +        return err
> > +    }
> > +    return nil
> > +}
>
> The documentation doesn't seem to be consistent with how the
> function actually works: AFAICT it returns false *with an
> error* for any failure, including those caused by unknown
> fields being present in the input JSON.

You are correct, documentation of this helper function needs to
be fixed if we keep the helper function, as you made a good point
about backwards-compatible decoding a struct that might have
introduced extra fields in a newer version.

> Looking at the generated code:
>
> > type BlockdevRef struct {
> >     Definition *BlockdevOptions
> >     Reference  *string
> > }
> >
> > func (s BlockdevRef) MarshalJSON() ([]byte, error) {
> >     if s.Definition != nil {
> >         return json.Marshal(s.Definition)
> >     } else if s.Reference != nil {
> >         return json.Marshal(s.Reference)
> >     }
> >     return nil, errors.New("BlockdevRef has empty fields")
>
> Returning an error if no field is set is good. Can we be more
> strict and returning one if more than one is set as well? That
> feels better than just picking the first one.

Sure.

> > func (s *BlockdevRef) UnmarshalJSON(data []byte) error {
> >     // Check for json-null first
> >     if string(data) == "null" {
> >         return errors.New(`null not supported for BlockdevRef`)
> >     }
> >     // Check for BlockdevOptions
> >     {
> >         s.Definition = new(BlockdevOptions)
> >         if err := StrictDecode(s.Definition, data); err == nil {
> >             return nil
> >         }
>
> The use of StrictDecode() here means that we won't be able to
> parse an alternate produced by a version of QEMU where
> BlockdevOptions has gained additional fields, doesn't it?

That's correct. This means that with this RFCv2 proposal, qapi-go
based on qemu version 7.1 might not be able to decode a qmp
message from qemu version 7.2 if it has introduced a new field.

This needs fixing, not sure yet the way to go.

> Considering that we will happily parse such a BlockdevOptions
> outside of the context of BlockdevRef, I think we should be
> consistent and allow the same to happen here.

StrictDecode is only used with alternates because, unlike unions,
Alternate types don't have a 'discriminator' field that would
allow us to know what data type to expect.

With this in mind, theoretically speaking, we could have very
similar struct types as Alternate fields and we have to find on
runtime which type is that underlying byte stream.

So, to reply to your suggestion, if we allow BlockdevRef without
StrictDecode we might find ourselves in a situation that it
matched a few fields of BlockdevOptions but it the byte stream
was actually another type.

So, I acknowledge that current version of this patch is not
correct but we still need to look into the fields and see if
there is a perfect match with the information that we have.

> >         s.Definition = nil
> >     }
> >     // Check for string
> >     {
> >         s.Reference = new(string)
> >         if err := StrictDecode(s.Reference, data); err == nil {
> >             return nil
> >         }
> >         s.Reference = nil
> >     }
> >
> >     return errors.New(fmt.Sprintf("Can't convert to BlockdevRef: %s", string(data)))
>
> On a similar note to the MarshalJSON comment above, I'm not
> sure this is right.
>
> If we find that more than one field of the alternate is set, we
> should error out - that's just invalid JSON we're dealing with.

With StrictDecode (or something similar) there shouldn't be
multiple fields being set on the Go structure. Once it finds a
match, it returns nil (no error)

> But if we couldn't find any, that might be valid JSON that's
> been produced by a version of QEMU that introduced additional
> options to the alternate. In the spirit of "be liberal in what
> you accept", I think we should probably not reject that? Of
> course then the client code will have to look like
>
>   if r.Definition != nil {
>       // do something with r.Definition
>   } else if r.Reference != nil {
>       // do something with r.Reference
>   } else {
>       // we don't recognize this - error out
>   }
>
> but the same is going to be true for enums, events and everything
> else that can be extended in a backwards-compatible fashion.

The client code looking like above is not much different than

    if err := json.Unmarshal([]byte(input), &r); err != nil {
        // error out: bad json? incompatibility issue?
    } else if r.Definition != nil {
        // do something with r.Definition
    } else if r.Reference != nil {
        // do something with r.Reference
    } else {
        // empty might be valid though, e.g: JSON null
    }

My main concern with alternate logic is not putting data that
should go to r.Reference into r.Definition and vice versa.

I took note of all your suggestions, I'll be reworking this. I'll
revisit the problem with StrictDecode together with addressing my
reply to Daniel:

    https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg03140.html

Cheers,
Victor

--66sp3a4znns26mmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmL89WMACgkQl9kSPeN6
SE+WYQ//ZXHpUlER+SVoASsDB0Lw6Rcf6ae+RmNBG6EL8PXsO9DQOD9+mkHWdlqS
hD+FFpOrVu+4OdOk12ZMV0AMCdZYbLepHqmWUO8Hh7kqfmk10VtCBOf5K5amrWms
8LgKX/FsW8sNCEs4uCCWFjtHQkmLQzhAVrU2NkJ/+IOtdyUtcfIXdAsV33ZvHH3H
S1/MDA8aGyXIhcmHTCEGAk7efICGAAms1Ak5UTm5R5YIs6+KNPm1fy4dqJis8MoZ
UZwx1Kk/bPIAtD4LOVrMEu72IcZyTlrxYjcNAO1xF0tv/wAknRIlzlbihmL2jaDd
T7PbNFti3rTwAEtnJ9aiMoQon2KWpYiJbdoVX2etvmbXJSGWWyyJHiorVQ/PTlcK
7uM3l6ZVCtGBqYnqLjFp/F5wPKPauRGnHx8sELq98jLUJs9a5C6aKk6W52Sfc9tZ
YJholElASVtHLvwJrzho50BUC21wqhH8hq4QikBMU2PqX6GBx6YNfQmbzE4cQ9gN
XYgLeCdrFtlX2QqJx0qo4Ud7bjYqkwj7BVUuj1084rLqv2TEKqq6b/Tvpxb6m5gI
m5wJRlNwPBPqJgMJHUIjHBrJwAzYoJjUcQJzNnWj9UR2Aoy2q0vEKZbjd3lnmLaS
ENBHSmX84jDd0euQIvqPG/DiT2rrf0AxWiwAXtALlGuYVzbe2fQ=
=4FN2
-----END PGP SIGNATURE-----

--66sp3a4znns26mmo--


