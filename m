Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B6D59B9FC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 09:04:46 +0200 (CEST)
Received: from localhost ([::1]:57480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ1UK-0002MT-MA
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 03:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oQ1Pq-0008SZ-1f
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 03:00:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oQ1Pl-00059w-0X
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 03:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661151599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AIZS4ZCuzmefCb7fb6T446vQco5qzbuT7cp4uvLg+DY=;
 b=Yl1HtQ16Fl33NNYHJL/B7VaTTQhd2O53zX0ilu2U5KTSX0IfumS7qRh9b5SvOC1X5CDUzO
 8Y0d8rABXmdJG5RhYBtlj79nPLg/rbQWs5StUDYc0clPwPyUahJwwxRIt7qBaZZ0UCdpTP
 2Nq7D/Gnxq6C4XlkY7yHjC1Zpv1ObBA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-c4t6HlWVOaSWVfgw-5UP4A-1; Mon, 22 Aug 2022 02:59:58 -0400
X-MC-Unique: c4t6HlWVOaSWVfgw-5UP4A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1E9C803301
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:59:57 +0000 (UTC)
Received: from localhost (unknown [10.40.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BE0C2166B29;
 Mon, 22 Aug 2022 06:59:57 +0000 (UTC)
Date: Mon, 22 Aug 2022 08:59:56 +0200
From: Victor Toso <victortoso@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 2/8] qapi: golang: Generate qapi's alternate types
 in Go
Message-ID: <20220822065956.nmamhjgowbda6dha@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-3-victortoso@redhat.com>
 <CABJz62NXnKFm=n=7eXmb==zSUe0VCy_0jbcFoNc8SwrQ2YKjvg@mail.gmail.com>
 <20220817140419.vpxjay4ouaz2gsam@tapioca>
 <CABJz62PZvdem1C-m-ODVMLrFaN6kqqJm0qyvbLxqeRPXL5jDaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2f7ldgust6nohhwf"
Content-Disposition: inline
In-Reply-To: <CABJz62PZvdem1C-m-ODVMLrFaN6kqqJm0qyvbLxqeRPXL5jDaA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01,
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


--2f7ldgust6nohhwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Aug 19, 2022 at 11:27:13AM -0500, Andrea Bolognani wrote:
> On Wed, Aug 17, 2022 at 04:04:19PM +0200, Victor Toso wrote:
> > On Tue, Jul 05, 2022 at 08:45:06AM -0700, Andrea Bolognani wrote:
> > > On Fri, Jun 17, 2022 at 02:19:26PM +0200, Victor Toso wrote:
> > > > func (s *BlockdevRef) UnmarshalJSON(data []byte) error {
> > > >     // Check for json-null first
> > > >     if string(data) == "null" {
> > > >         return errors.New(`null not supported for BlockdevRef`)
> > > >     }
> > > >     // Check for BlockdevOptions
> > > >     {
> > > >         s.Definition = new(BlockdevOptions)
> > > >         if err := StrictDecode(s.Definition, data); err == nil {
> > > >             return nil
> > > >         }
> > >
> > > The use of StrictDecode() here means that we won't be able to
> > > parse an alternate produced by a version of QEMU where
> > > BlockdevOptions has gained additional fields, doesn't it?
> >
> > That's correct. This means that with this RFCv2 proposal, qapi-go
> > based on qemu version 7.1 might not be able to decode a qmp
> > message from qemu version 7.2 if it has introduced a new field.
> >
> > This needs fixing, not sure yet the way to go.
> >
> > > Considering that we will happily parse such a BlockdevOptions
> > > outside of the context of BlockdevRef, I think we should be
> > > consistent and allow the same to happen here.
> >
> > StrictDecode is only used with alternates because, unlike unions,
> > Alternate types don't have a 'discriminator' field that would
> > allow us to know what data type to expect.
> >
> > With this in mind, theoretically speaking, we could have very
> > similar struct types as Alternate fields and we have to find on
> > runtime which type is that underlying byte stream.
> >
> > So, to reply to your suggestion, if we allow BlockdevRef without
> > StrictDecode we might find ourselves in a situation that it
> > matched a few fields of BlockdevOptions but it the byte stream
> > was actually another type.
>
> IIUC your concern is that the QAPI schema could gain a new
> type, TotallyNotBlockdevOptions, which looks exactly like
> BlockdevOptions except for one or more extra fields.
>
> If QEMU then produced a JSON like
>
>   { "description": { /* a TotallyNotBlockdevOptions here */ } }
>
> and we'd try to deserialize it with Go code like
>
>   ref := BlockdevRef{}
>   json.Unmarsal(&ref)
>
> we'd end up mistakenly parsing the TotallyNotBlockdevOptions as a
> valid BlockdevOptions, dropping the extra fields in the process.
>
> Does that correctly describe the reason why you feel that the use of
> StrictDecode is necessary?

Not quite. The problem here is related to the Alternate types of
the QAPI specification [0], just to name a simple in-use example,
BlockdevRefOrNul [1].

[0] https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/qapi-code-gen.rst?plain=1#L387
[1] https://gitlab.com/qemu-project/qemu/-/blob/master/qapi/block-core.json#L4349

To exemplify the problem that I try to solve with StrictDecode,
let's say there is a DeviceRef alternate type that looks like:

{ 'alternate': 'DeviceRef',
  'data': { 'memory': 'BlockdevRefInMemory',
            'disk': 'BlockdevRefInDisk',
            'cloud': 'BlockdevRefInCloud' } }

Just a quick recap, at runtime we don't have data's payload name
(e.g: disk).  We need to check the actual data and try to find
what is the payload type.

type BlockdevRefInMemory struct {
    Name  *string
    Size  uint64
    Start uint64
    End   uint64
}

type BlockdevRefInDisk struct {
    Name  *string
    Size  uint64
    Path  *string
}

type BlockdevRefInCloud struct {
    Name  *string
    Size  uint64
    Uri   *string
}

All types have unique fields but they all share some fields too.
Golang, without StrictDecode would happily decode a "disk"
payload into either "memory" or "cloud" fields, matching only
what the json provides and ignoring the rest. StrictDecode would
error if the payload had fields that don't belong to that Type so
we could try to find a perfect match.

While this should work reliably with current version of QEMU's
qapi-schema.json, it is not future error proof... It is just a
bit better than not checking at all.

The overall expectations is that, if the fields have too much in
common, it is likely they should have been tagged as 'union'
instead of 'alternate'. Yet, because alternate types have this
flexibility, we need to be extra careful.

I'm still thinking about this in a way that would not give too
much hassle when considering a generated code that talks with
older/newer qemu where some fields might have been added/removed.

> If so, I respectfully disagree :)
>
> If the client code is expecting a BlockdevRef as the return
> value of a command and QEMU is producing something that is
> *not* a BlockdevRef instead, that's an obvious bug in QEMU. If
> the client code is expecting a BlockdevRef as the return value
> of a command that is specified *not* to return a BlockdevRef,
> that's an obvious bug in the client code.
>
> In neither case it should be the responsibility of the SDK to
> second-guess the declared intent, especially when it's
> perfectly valid for a type to be extended in a
> backwards-compatible way by adding fields to it.

Yes, the SDK should consider valid QMP messages. This specific
case is just a bit more complex qapi type that SDK needs to
worry.

Thanks for your input!
Victor

--2f7ldgust6nohhwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmMDKWwACgkQl9kSPeN6
SE9+yhAAu6rJBu1q1/VtDafsf5e07UnFnApXSP92CTCV7hLQCgDXToqz90wKeb0J
YyHwjZ/KeRcYngSE44BUqIaAPISuFcvHK7UNxKB1X8m3KFVBT0FDtTEgXnz2/HNT
0Rsv40XArmPG3SlF+Cf99zIt/PsgSamJk8rnfXe+Q38YoYQMoP1UiPGPFZfyyDkI
dN7bnovP4/AwBAsUvzuxgDj0MFvVfupfkUZTVQetXq3/eOsyXjtdfus1++gfKiH1
UaDvNmfC5fVl7sV/66RZOh5JM+NlpgxGsvNcnn8ecd1SYOEPB4VHRRTbsCcF6aMS
NRoNr2+EqKBx3852ir1TUua45D8OpLIFL9ksA6d1EDn+Yj1PXYgntpcZLDQEhLxk
S/NIec+sYNimkiDWIgjgAmOyStgbd2MyO+9DDbq0GeKuOKL3qo9XBHO5/uzN0G94
WA6GrhzsOSDZrI5ZdSScDkx13wfi3/zjgyGea1UpHbMZ6sLICsMn6viu6qxlqfNd
nEML4VbALIQiKRghHb7oSie16RbRRxvR+WVg7BTyu2gvxEoO3YiRw2V1brnuQbL7
Cg8AHw3Gcsd/A6JALnSQDuidktgoCt2KbvFrsrf6qLKQSmTrzg/Q3yZHgFMOhBqu
iqtrDqZyrD2G9wdXhTy6XdwJD8UQWuQ2NiXxp96E160gTvWmEuk=
=Ryu/
-----END PGP SIGNATURE-----

--2f7ldgust6nohhwf--


