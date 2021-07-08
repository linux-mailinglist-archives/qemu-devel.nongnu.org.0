Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7EC3C1563
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:42:34 +0200 (CEST)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VEX-0004os-Ho
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1VDf-000440-6u
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:41:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1VDc-0004Rh-8z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625755294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YtHQ8cqJvQBzxl7tJfNkSbSIxO/2Ts67738xKvyKPw8=;
 b=YCv20pQKI1XuJyD1+gSemgg454M3iVw4/t/YgLkh/yvCs8iIyq7hCavEqyQMCz6+eH7qJ+
 zoO4jPRw+jiLadTEaweLQOeqhQ3kvBn6dyOZFIU1WKGyegYudgT6MyUn46DZQl4cJ4+4Ul
 Ga4zlKcM7Z4yNjI4jUR5VC8tToJXDXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-LhyjzF-OOfmI2D5zR_Y9Nw-1; Thu, 08 Jul 2021 10:41:32 -0400
X-MC-Unique: LhyjzF-OOfmI2D5zR_Y9Nw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 000DC102CB78
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 14:41:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F4791970F;
 Thu,  8 Jul 2021 14:41:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 169BB1132B52; Thu,  8 Jul 2021 16:41:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 11/18] crypto: rename des-rfb cipher to just des
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-12-berrange@redhat.com>
 <87eecaffzg.fsf@dusky.pond.sub.org> <YOWwtTuTvFsiCHdb@redhat.com>
Date: Thu, 08 Jul 2021 16:41:28 +0200
In-Reply-To: <YOWwtTuTvFsiCHdb@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 7 Jul 2021 14:48:37 +0100")
Message-ID: <87fswo50mf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Jul 07, 2021 at 02:47:15PM +0200, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > Currently the crypto layer exposes support for a 'des-rfb'
>> > algorithm which is just normal single-DES, with the bits
>> > in each key byte reversed. This special key munging is
>> > required by the RFB protocol password authentication
>> > mechanism.
>> >
>> > Since the crypto layer is generic shared code, it makes
>> > more sense to do the key byte munging in the VNC server
>> > code, and expose normal single-DES support.
>> >
>> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> > ---
>>=20
>> [...]
>>=20
>> > diff --git a/qapi/crypto.json b/qapi/crypto.json
>> > index 7116ae9a46..6b3fadabac 100644
>> > --- a/qapi/crypto.json
>> > +++ b/qapi/crypto.json
>> > @@ -66,7 +66,7 @@
>> >  # @aes-128: AES with 128 bit / 16 byte keys
>> >  # @aes-192: AES with 192 bit / 24 byte keys
>> >  # @aes-256: AES with 256 bit / 32 byte keys
>> > -# @des-rfb: RFB specific variant of single DES. Do not use except in =
VNC.
>> > +# @des: DES with 56 bit / 8 byte keys. Do not use except in VNC.
>> >  # @3des: 3DES(EDE) with 192 bit / 24 byte keys (since 2.9)
>> >  # @cast5-128: Cast5 with 128 bit / 16 byte keys
>> >  # @serpent-128: Serpent with 128 bit / 16 byte keys
>> > @@ -80,7 +80,7 @@
>> >  { 'enum': 'QCryptoCipherAlgorithm',
>> >    'prefix': 'QCRYPTO_CIPHER_ALG',
>> >    'data': ['aes-128', 'aes-192', 'aes-256',
>> > -           'des-rfb', '3des',
>> > +           'des', '3des',
>> >             'cast5-128',
>> >             'serpent-128', 'serpent-192', 'serpent-256',
>> >             'twofish-128', 'twofish-192', 'twofish-256']}
>>=20
>> Is enum value "des-rfb" part of any external interface?
>
> Strictly speaking, yes, but in reality it doesn't matter.
>
>
> The only place in QEMU that actually uses DES-RFB is the
> VNC server code. That is an indirect usage when the user
> sets the "password" option flag in QemuOpts. The fact that
> it uses DES-RFB is an internal impl detail.
>
> The one place that does publically expose ability to set a
> field using the QCryptoCipherAlgorithm enum type is the
> LUKS support in the block layer:
>
> { 'struct': 'QCryptoBlockCreateOptionsLUKS',
>   'base': 'QCryptoBlockOptionsLUKS',
>   'data': { '*cipher-alg': 'QCryptoCipherAlgorithm',
>             '*cipher-mode': 'QCryptoCipherMode',
>             '*ivgen-alg': 'QCryptoIVGenAlgorithm',
>             '*ivgen-hash-alg': 'QCryptoHashAlgorithm',
>             '*hash-alg': 'QCryptoHashAlgorithm',
>             '*iter-time': 'int'}}
>
> eg exposed on CLI as:
>
>   $ qemu-img create -f luks -o cipher-alg=3DNNN foo.luks 1G
>
> or equivalant with QMP blockdev-create
>
> While the QMP schema allows any valid QCryptoCipherAlgorithm
> string to be set, the actual implementation does not.
>
> The crypto/block-luks.c code has a map between cipher algs
> and LUKS format algoritm names:
>
>
> static const QCryptoBlockLUKSCipherNameMap
> qcrypto_block_luks_cipher_name_map[] =3D {
>     { "aes", qcrypto_block_luks_cipher_size_map_aes },
>     { "cast5", qcrypto_block_luks_cipher_size_map_cast5 },
>     { "serpent", qcrypto_block_luks_cipher_size_map_serpent },
>     { "twofish", qcrypto_block_luks_cipher_size_map_twofish },
> };
>
> If it isn't in that table, it can't be used. IOW, the only
> scenario we're affecting in this rename is one which would
> already result in an error condition
>
> Original behaviour:
>
>  $ qemu-img create -f luks --object secret,id=3Dsec0,data=3D123 -o cipher=
-alg=3Ddes-rfb,key-secret=3Dsec0 demo.luks 1G
> Formatting 'demo.luks', fmt=3Dluks size=3D1073741824 key-secret=3Dsec0 ci=
pher-alg=3Ddes-rfb
> qemu-img: demo.luks: Algorithm 'des-rfb' not supported
>
> New behaviour:
>
> $ qemu-img create -f luks --object secret,id=3Dsec0,data=3D123 -o cipher-=
alg=3Ddes-rfb,key-secret=3Dsec0 demo.luks 1G
> Formatting 'demo.luks', fmt=3Dluks size=3D1073741824 key-secret=3Dsec0 ci=
pher-alg=3Ddes-fish
> qemu-img: demo.luks: Invalid parameter 'des-rfb'
>
> I considered this incompatibility to be acceptable, and thus
> not worth going through a deprecation dance.

Thanks for the explanation.  I agree the deprecation dance is not
necessary here.

Please consider explaining this in your commit message.  Suggest to
append a variation of the tail of your explanation:

  Replacing cipher 'des-rfb' by 'des' looks like an incompatible
  interface change, but it doesn't matter.  While the QMP schema allows
  ...
  qemu-img: demo.luks: Invalid parameter 'des-rfb'

Also consider tweaking the title to

  crypto: Replace 'des-rfb' cipher by 'des'

because it's not actually just a rename.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


