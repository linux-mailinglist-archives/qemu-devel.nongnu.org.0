Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1365C3BE900
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:49:45 +0200 (CEST)
Received: from localhost ([::1]:41006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17vs-0005EH-5N
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m17uz-0004Z2-T2
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:48:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m17ux-0006b4-OS
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625665726;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFpWkfg36IapJrt8ZcF7l+LiUnUY7WO1wMsSRjKfx2E=;
 b=R3sU9nmrA+sTuepsagFh00qddGG8CPCFIqDpZzSuiitZh/sMErzUdOdD32MIHMWmJ/xtNS
 0HXWth8DoUFuVSzFvNbKKYZkpWPVTxqH34kmUA9yWn79DW1F4HR70rezYu+RE74Rs2Q+vr
 dfdfLh3p4kkvrdEa2Q4Zn6j1ScavMBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-oWwkz5ZpM-aO851S9RhXyQ-1; Wed, 07 Jul 2021 09:48:45 -0400
X-MC-Unique: oWwkz5ZpM-aO851S9RhXyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A91198042DE
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 13:48:44 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A040F5D9D3;
 Wed,  7 Jul 2021 13:48:39 +0000 (UTC)
Date: Wed, 7 Jul 2021 14:48:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 11/18] crypto: rename des-rfb cipher to just des
Message-ID: <YOWwtTuTvFsiCHdb@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-12-berrange@redhat.com>
 <87eecaffzg.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87eecaffzg.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 02:47:15PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > Currently the crypto layer exposes support for a 'des-rfb'
> > algorithm which is just normal single-DES, with the bits
> > in each key byte reversed. This special key munging is
> > required by the RFB protocol password authentication
> > mechanism.
> >
> > Since the crypto layer is generic shared code, it makes
> > more sense to do the key byte munging in the VNC server
> > code, and expose normal single-DES support.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> 
> [...]
> 
> > diff --git a/qapi/crypto.json b/qapi/crypto.json
> > index 7116ae9a46..6b3fadabac 100644
> > --- a/qapi/crypto.json
> > +++ b/qapi/crypto.json
> > @@ -66,7 +66,7 @@
> >  # @aes-128: AES with 128 bit / 16 byte keys
> >  # @aes-192: AES with 192 bit / 24 byte keys
> >  # @aes-256: AES with 256 bit / 32 byte keys
> > -# @des-rfb: RFB specific variant of single DES. Do not use except in VNC.
> > +# @des: DES with 56 bit / 8 byte keys. Do not use except in VNC.
> >  # @3des: 3DES(EDE) with 192 bit / 24 byte keys (since 2.9)
> >  # @cast5-128: Cast5 with 128 bit / 16 byte keys
> >  # @serpent-128: Serpent with 128 bit / 16 byte keys
> > @@ -80,7 +80,7 @@
> >  { 'enum': 'QCryptoCipherAlgorithm',
> >    'prefix': 'QCRYPTO_CIPHER_ALG',
> >    'data': ['aes-128', 'aes-192', 'aes-256',
> > -           'des-rfb', '3des',
> > +           'des', '3des',
> >             'cast5-128',
> >             'serpent-128', 'serpent-192', 'serpent-256',
> >             'twofish-128', 'twofish-192', 'twofish-256']}
> 
> Is enum value "des-rfb" part of any external interface?

Strictly speaking, yes, but in reality it doesn't matter.


The only place in QEMU that actually uses DES-RFB is the
VNC server code. That is an indirect usage when the user
sets the "password" option flag in QemuOpts. The fact that
it uses DES-RFB is an internal impl detail.

The one place that does publically expose ability to set a
field using the QCryptoCipherAlgorithm enum type is the
LUKS support in the block layer:

{ 'struct': 'QCryptoBlockCreateOptionsLUKS',
  'base': 'QCryptoBlockOptionsLUKS',
  'data': { '*cipher-alg': 'QCryptoCipherAlgorithm',
            '*cipher-mode': 'QCryptoCipherMode',
            '*ivgen-alg': 'QCryptoIVGenAlgorithm',
            '*ivgen-hash-alg': 'QCryptoHashAlgorithm',
            '*hash-alg': 'QCryptoHashAlgorithm',
            '*iter-time': 'int'}}

eg exposed on CLI as:

  $ qemu-img create -f luks -o cipher-alg=NNN foo.luks 1G

or equivalant with QMP blockdev-create

While the QMP schema allows any valid QCryptoCipherAlgorithm
string to be set, the actual implementation does not.

The crypto/block-luks.c code has a map between cipher algs
and LUKS format algoritm names:


static const QCryptoBlockLUKSCipherNameMap
qcrypto_block_luks_cipher_name_map[] = {
    { "aes", qcrypto_block_luks_cipher_size_map_aes },
    { "cast5", qcrypto_block_luks_cipher_size_map_cast5 },
    { "serpent", qcrypto_block_luks_cipher_size_map_serpent },
    { "twofish", qcrypto_block_luks_cipher_size_map_twofish },
};

If it isn't in that table, it can't be used. IOW, the only
scenario we're affecting in this rename is one which would
already result in an error condition

Original behaviour:

 $ qemu-img create -f luks --object secret,id=sec0,data=123 -o cipher-alg=des-rfb,key-secret=sec0 demo.luks 1G
Formatting 'demo.luks', fmt=luks size=1073741824 key-secret=sec0 cipher-alg=des-rfb
qemu-img: demo.luks: Algorithm 'des-rfb' not supported

New behaviour:

$ qemu-img create -f luks --object secret,id=sec0,data=123 -o cipher-alg=des-rfb,key-secret=sec0 demo.luks 1G
Formatting 'demo.luks', fmt=luks size=1073741824 key-secret=sec0 cipher-alg=des-fish
qemu-img: demo.luks: Invalid parameter 'des-rfb'

I considered this incompatibility to be acceptable, and thus
not worth going through a deprecation dance.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


