Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3658A5B0AA7
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 18:52:50 +0200 (CEST)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVyIB-0000pi-2M
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 12:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oVy9j-00040f-P8
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 12:44:05 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:35358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oVy9h-0003zR-9l
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 12:44:03 -0400
Received: by mail-qk1-x72b.google.com with SMTP id b9so10925737qka.2
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=TeXqmSVp1N6/y5y9uHJF/F3rjKOOz7+yQl38I7qd9pI=;
 b=eAr4NZ7tkdREwGSLDmEDeLZQDz2tzUw4ea5rzuqSRC0/cmuPkP1IZICVHif4MVjxlw
 8JrsGFxW4OIH3+mRNx4Ra8tk7NEbm+DgNMB/74TS2oaK549L3xOSBU4YEmhqKY2X46EB
 pquXPipOwNxz0Oi44SVoiChhtWWQtpiaK8eIZMBgEuDelpURzinXIUf3QgV4lw/SO4aS
 HcbqbwvYA3p9oJT5gJSAlansExw42CRrX2DeKEWTWeU0NXU2RD44gUw+4neLB0rB2FOE
 kEGTJ1//DeBC6pMZRoKw6NJ9muRwKXFIpRsIIX9tROBNQ2xpjc8cuGhU+D9/W0oeWHqv
 y/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=TeXqmSVp1N6/y5y9uHJF/F3rjKOOz7+yQl38I7qd9pI=;
 b=Yt1ZiEKI/l28R8UlgP/Y9l/ueRQkJf5lr+k4Le/AND7puNhnz95qHxKlzLJVzxs0b5
 0edJ41rjhaL1VI7UUq1L4vGE4Xty7McAdS4fkt/YzOYueWi8gJMXDxMs2vg4sNMbJSQ5
 dinh8hxcAku889ZME68WmgpzcY6JKAkUGPiGIn1nIWgUrS3vwUcjcNzDvvRDzfpaRji+
 qkLOROGIsFTpnu8dqkZYa6KiIQzOjHdrJG0pGYyEINI1V5g+/bl2iCMLQbWpaL9cRd1r
 OeDM96kAHN5KplXqf3N55agppJTAyyT/+uGMlf/vK7M/1+Hq3Bw0mXsRS93HPjmx8l1h
 42fg==
X-Gm-Message-State: ACgBeo2wZb7l7goexbZu+HcgyJRk/2ivrrwTvwjDMhvBV0ihopkOhipu
 JEN0bwZzRUuXtB+CPVJeitRmCHZ+KlcgdmZzpJz8VQ==
X-Google-Smtp-Source: AA6agR70aub9JcCros2loWkO3k04ML03lVwEnx6Bzo1HiEV9iycut5LSDfK8CEDhtonq8mnu1QrAW0iT3JyowWEhdz4=
X-Received: by 2002:a05:620a:1994:b0:6bb:54af:c69b with SMTP id
 bm20-20020a05620a199400b006bb54afc69bmr3399350qkb.782.1662569039988; Wed, 07
 Sep 2022 09:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220907162125.3950701-1-venture@google.com>
 <YxjH/bIN6OlSWMWK@redhat.com>
In-Reply-To: <YxjH/bIN6OlSWMWK@redhat.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 7 Sep 2022 09:43:49 -0700
Message-ID: <CAO=notzfXUJqObELM1wAiyuHTg2Jb1ANm31y5VkBtZufT6d0vQ@mail.gmail.com>
Subject: Re: [PATCH] crypto/block-luks: always set splitkeylen to 0
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000000b8a9b05e81905ee"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=venture@google.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--0000000000000b8a9b05e81905ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 7, 2022 at 9:34 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Wed, Sep 07, 2022 at 09:21:25AM -0700, Patrick Venture wrote:
> > This was caught by a sanitized build, that was perhaps oversensitive.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >  crypto/block-luks.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/crypto/block-luks.c b/crypto/block-luks.c
> > index f62be6836b..8633fb7e9f 100644
> > --- a/crypto/block-luks.c
> > +++ b/crypto/block-luks.c
> > @@ -729,7 +729,7 @@ qcrypto_block_luks_store_key(QCryptoBlock *block,
> >      QCryptoBlockLUKS *luks =3D block->opaque;
> >      QCryptoBlockLUKSKeySlot *slot;
> >      g_autofree uint8_t *splitkey =3D NULL;
> > -    size_t splitkeylen;
> > +    size_t splitkeylen =3D 0;
> >      g_autofree uint8_t *slotkey =3D NULL;
> >      g_autoptr(QCryptoCipher) cipher =3D NULL;
> >      g_autoptr(QCryptoIVGen) ivgen =3D NULL;
> > @@ -901,7 +901,7 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
> >      QCryptoBlockLUKS *luks =3D block->opaque;
> >      const QCryptoBlockLUKSKeySlot *slot;
> >      g_autofree uint8_t *splitkey =3D NULL;
> > -    size_t splitkeylen;
> > +    size_t splitkeylen =3D 0;
> >      g_autofree uint8_t *possiblekey =3D NULL;
> >      int rv;
> >      g_autoptr(QCryptoCipher) cipher =3D NULL;
> > @@ -1147,7 +1147,7 @@ qcrypto_block_luks_erase_key(QCryptoBlock *block,
> >      QCryptoBlockLUKS *luks =3D block->opaque;
> >      QCryptoBlockLUKSKeySlot *slot;
> >      g_autofree uint8_t *garbagesplitkey =3D NULL;
> > -    size_t splitkeylen;
> > +    size_t splitkeylen =3D 0;
> >      size_t i;
> >      Error *local_err =3D NULL;
> >      int ret;
>
> In all three cases, splitkeylen is initialized a few lines later.
>
> In qcrypto_block_luks_store_key there is a 'goto cleanup' before
> the initialization. The 'cleanup' code can use 'splitkeylen', but
> only if 'splitkey !=3D NULL' & this isn't possible if splitkeylen is
> uninitialized.
>
> The other two methods have no code path where splitkeylen can be
> used uninitialized.
>
> The tool is reporting non-existant problems AFAICT
>

I'm 100% certain it is. I just needed to make the changes to get a
sanitized build of Qemu to build.  Presumably if someone else tries
building qemu with `--enable-sanitizers` they'll have to make the same
non-sense adjustment.


>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000000b8a9b05e81905ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 7, 2022 at 9:34 AM Daniel=
 P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Wed, Sep 07, 2022 at 09:21:25AM -0700, Patrick Venture wrote:<br>
&gt; This was caught by a sanitized build, that was perhaps oversensitive.<=
br>
&gt; <br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 crypto/block-luks.c | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/crypto/block-luks.c b/crypto/block-luks.c<br>
&gt; index f62be6836b..8633fb7e9f 100644<br>
&gt; --- a/crypto/block-luks.c<br>
&gt; +++ b/crypto/block-luks.c<br>
&gt; @@ -729,7 +729,7 @@ qcrypto_block_luks_store_key(QCryptoBlock *block,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 QCryptoBlockLUKS *luks =3D block-&gt;opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QCryptoBlockLUKSKeySlot *slot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_autofree uint8_t *splitkey =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 size_t splitkeylen;<br>
&gt; +=C2=A0 =C2=A0 size_t splitkeylen =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_autofree uint8_t *slotkey =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_autoptr(QCryptoCipher) cipher =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_autoptr(QCryptoIVGen) ivgen =3D NULL;<br>
&gt; @@ -901,7 +901,7 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 QCryptoBlockLUKS *luks =3D block-&gt;opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const QCryptoBlockLUKSKeySlot *slot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_autofree uint8_t *splitkey =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 size_t splitkeylen;<br>
&gt; +=C2=A0 =C2=A0 size_t splitkeylen =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_autofree uint8_t *possiblekey =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int rv;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_autoptr(QCryptoCipher) cipher =3D NULL;<br>
&gt; @@ -1147,7 +1147,7 @@ qcrypto_block_luks_erase_key(QCryptoBlock *block=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QCryptoBlockLUKS *luks =3D block-&gt;opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QCryptoBlockLUKSKeySlot *slot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_autofree uint8_t *garbagesplitkey =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 size_t splitkeylen;<br>
&gt; +=C2=A0 =C2=A0 size_t splitkeylen =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 size_t i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
In all three cases, splitkeylen is initialized a few lines later.<br>
<br>
In qcrypto_block_luks_store_key there is a &#39;goto cleanup&#39; before<br=
>
the initialization. The &#39;cleanup&#39; code can use &#39;splitkeylen&#39=
;, but<br>
only if &#39;splitkey !=3D NULL&#39; &amp; this isn&#39;t possible if split=
keylen is<br>
uninitialized.<br>
<br>
The other two methods have no code path where splitkeylen can be<br>
used uninitialized.<br>
<br>
The tool is reporting non-existant problems AFAICT<br></blockquote><div><br=
></div><div>I&#39;m 100% certain it is. I just needed to make the changes t=
o get a sanitized build of Qemu to build.=C2=A0 Presumably if someone else =
tries building qemu with `--enable-sanitizers` they&#39;ll have to make the=
 same non-sense adjustment.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--0000000000000b8a9b05e81905ee--

