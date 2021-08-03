Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D298E3DF15E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:26:36 +0200 (CEST)
Received: from localhost ([::1]:44320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwJP-0004Hy-TP
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mAwID-00032L-8i
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:25:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mAwI9-00019A-K2
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628004315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tLKR8BMyWPYh3JFYNpNz8YwR7bWrXpvccdFDgVNLXbo=;
 b=JfNwC6hqJLApf8sCdnOW1o9TZ293Fiv+kqZ9ns1I7O+sCbfee+IFaJjaXSy8Sl7p6JPl6A
 bNmno4lFgv0EPI/NyEesVyBXCiXjUfkj3CUk/8nRZf23NXIL7XhMiBG4feX/h5js95xpWw
 bwtLTnYnxoN7Fum/xXKd3RqiYd9QVkw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-cjLQKwftMJmwQUcVPihw7g-1; Tue, 03 Aug 2021 11:25:11 -0400
X-MC-Unique: cjLQKwftMJmwQUcVPihw7g-1
Received: by mail-pj1-f70.google.com with SMTP id
 p8-20020a17090a8688b02901773e164aa8so3324100pjn.8
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tLKR8BMyWPYh3JFYNpNz8YwR7bWrXpvccdFDgVNLXbo=;
 b=Ky7I3iK+khcn/ja22ofTLGmC3elHZ0P26E/mzxgAdJOUwWS5WMJCHyvJffIebgRVlp
 Jq8hFknucahaOP9FWdN1Mzc/sTCS6yADxzYL7go4tRjWYhEi8AUkY6Or4CazuW+IyAcT
 AFWtpuQr9/1SMCgEOglAZVLJr60/+KpCDj95e2tnB/l2+wIHjmzo9e1PmpEldP9WW7s4
 QgFybctEE481sprjmX9RlBeYvwfqaA8+e82lD/8j3iZTTwmEXeoSFZ6lFAGAf2l0GJwE
 64WT6/ZMWNxRmYaUJak2d7SK7QXK79jfM9pwZT6nIlamJ38gJlWdeZQR8toROhpzNTr5
 mePg==
X-Gm-Message-State: AOAM532sHonBfbbv4oTHRbB+v9fAcvGIn3f4Rl4Wd1Coc7VTuK8wX7ZY
 23iWKd/cLSuOVaireP3zU+m1qwlIaFgA6QFk6PX8mbbBIZSA7auSRGNe49p0r1Hvh6jTXa1RXPk
 Z8OLa+sx7R3hwu8wLmMfIP2owV8a94VU=
X-Received: by 2002:a17:90b:e10:: with SMTP id
 ge16mr20402027pjb.150.1628004310486; 
 Tue, 03 Aug 2021 08:25:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx/vJHxbDzbas/h1tnPSn6/W2ya+4eOzilOK7EgJr/dIx0L+KwrC8xiUykZlplJ6HiJotMpBsNLINY5OIC+KU=
X-Received: by 2002:a17:90b:e10:: with SMTP id
 ge16mr20402006pjb.150.1628004310171; 
 Tue, 03 Aug 2021 08:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
 <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
 <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
 <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
 <CAFEAcA9jagAAWuJRxYJ6OQg72n4uoV1PT3dgSxNOYJFpW5xi+g@mail.gmail.com>
 <CAJ+F1CJ79-ZrE2J8XZaoBt3LzprB0Z4YJb7cU_hvQf8qd84L1g@mail.gmail.com>
 <CAFEAcA8saN260spE0BPD_++2zasVrsyYzaP_YBMfcPRzv+nxSg@mail.gmail.com>
 <CAFEAcA9nqTfo6+BrfDqm8w6ELhg21BpDwbvimeLH=eC2dt7aBw@mail.gmail.com>
 <CAJ+F1CLR8Ge4PLdpvitvVUrQ5Ea_HVaVFojr=H6UFs=3z2pN=w@mail.gmail.com>
In-Reply-To: <CAJ+F1CLR8Ge4PLdpvitvVUrQ5Ea_HVaVFojr=H6UFs=3z2pN=w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 3 Aug 2021 17:24:58 +0200
Message-ID: <CABgObfYw-M2kv7r6K39SgsqKbfy-X+yDvU9M6tTsV92tJ6nVrQ@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000099d23205c8a94a14"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000099d23205c8a94a14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Considering that I am planning the update to 0.58.2 in a couple weeks after
release, either -lresolv is fixed for 6.1, or the update should be delayed
to 6.2.

Paolo

Il mar 3 ago 2021, 13:52 Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com=
> ha
scritto:

> Hi
>
> On Tue, Aug 3, 2021 at 1:50 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Tue, 3 Aug 2021 at 10:08, Peter Maydell <peter.maydell@linaro.org>
>> wrote:
>> > Are you testing by starting with a before-the-libslirp-merge
>> > change QEMU, doing a build, then updating to the libslirp
>> > changes, and then doing a 'make' without reconfigure or
>> > 'make clean' ? I suspect this is perhaps to do with it being
>> > an incremental build.
>>
>> More specifically:
>>
>> $ git checkout master
>> $ mkdir build/slirptest
>> $ (cd build/slirptest && ../../configure --target-list=3Darm-softmmu
>> --enable-debug --disable-docs --disable-tools)
>> $ make -C build/slirptest -j8
>> $ git checkout remotes/elmarco/libslirp
>> $ make -C build/slirptest
>> $ mkdir build/slirp2
>> $ (cd build/slirptest && ../../configure --target-list=3Darm-softmmu
>> --enable-debug --disable-docs --disable-tools)
>> $ make -C build/slirp2
>>
>> The build/slirptest directory has built a .so, and the
>> build/slirp2 directory has built a static .a.
>>
>> (Both builds succeed because they're not hitting the clang
>> static analyzer thing, but they shouldn't be building different
>> types of library.)
>>
>> Running '../../meson/meson.py configure' in slirp2 gives
>> (ignoring the non libslirp parts of the output):
>>
>> Subproject libslirp:
>>
>>   Core options                  Current Value
>> Possible Values
>> Description
>>   ------------                  -------------
>> ---------------
>> -----------
>>   libslirp:default_library      static
>> [shared, static, both]                                        Default
>> library type
>>   libslirp:werror               true                           [true,
>> false]                                                 Treat warnings
>> as errors
>>
>>   Project options               Current Value
>> Possible Values
>> Description
>>   ---------------               -------------
>> ---------------
>> -----------
>>   libslirp:version_suffix
>>                                                       Suffix to append
>> to SLIRP_VERSION_STRING
>>
>> In slirptest I get only:
>>
>> Subproject libslirp:
>>
>>   Project options               Current Value
>> Possible Values
>> Description
>>   ---------------               -------------
>> ---------------
>> -----------
>>   libslirp:version_suffix
>>                                                       Suffix to append
>> to SLIRP_VERSION_STRING
>>
>>
>> So somehow meson has failed to apply the default_library and werror
>> options in
>> the incremental build case.
>>
>>
> Thanks for the detailed steps. It turns out that incremental build with
> subprojects is broken with meson < 0.57.2 (
> https://github.com/mesonbuild/meson/pull/8424).
>
> Either we acknowledge that, or we fix the qemu meson.build for now with
> the missing -lresolv for osx/bsd.
>
> I am going to work on a patch for the second option, but leave the
> decision open.
>
>
>
>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--00000000000099d23205c8a94a14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Considering that I am planning the update to 0.58.2 in a =
couple weeks after release, either -lresolv is fixed for 6.1, or the update=
 should be delayed to 6.2.<div dir=3D"auto"><br></div><div dir=3D"auto">Pao=
lo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">Il mar 3 ago 2021, 13:52 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mail=
to:marcandre.lureau@gmail.com">marcandre.lureau@gmail.com</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr=
">Hi<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Aug 3, 2021 at 1:50 PM Peter Maydell &lt;<a href=3D"mailto:=
peter.maydell@linaro.org" target=3D"_blank" rel=3D"noreferrer">peter.maydel=
l@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Tue, 3 Aug 2021 at 10:08, Peter Maydell &lt;<a href=3D"mailt=
o:peter.maydell@linaro.org" target=3D"_blank" rel=3D"noreferrer">peter.mayd=
ell@linaro.org</a>&gt; wrote:<br>
&gt; Are you testing by starting with a before-the-libslirp-merge<br>
&gt; change QEMU, doing a build, then updating to the libslirp<br>
&gt; changes, and then doing a &#39;make&#39; without reconfigure or<br>
&gt; &#39;make clean&#39; ? I suspect this is perhaps to do with it being<b=
r>
&gt; an incremental build.<br>
<br>
More specifically:<br>
<br>
$ git checkout master<br>
$ mkdir build/slirptest<br>
$ (cd build/slirptest &amp;&amp; ../../configure --target-list=3Darm-softmm=
u<br>
--enable-debug --disable-docs --disable-tools)<br>
$ make -C build/slirptest -j8<br>
$ git checkout remotes/elmarco/libslirp<br>
$ make -C build/slirptest<br>
$ mkdir build/slirp2<br>
$ (cd build/slirptest &amp;&amp; ../../configure --target-list=3Darm-softmm=
u<br>
--enable-debug --disable-docs --disable-tools)<br>
$ make -C build/slirp2<br>
<br>
The build/slirptest directory has built a .so, and the<br>
build/slirp2 directory has built a static .a.<br>
<br>
(Both builds succeed because they&#39;re not hitting the clang<br>
static analyzer thing, but they shouldn&#39;t be building different<br>
types of library.)<br>
<br>
Running &#39;../../meson/meson.py configure&#39; in slirp2 gives<br>
(ignoring the non libslirp parts of the output):<br>
<br>
Subproject libslirp:<br>
<br>
=C2=A0 Core options=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Current Value<br>
Possible Values<br>
Description<br>
=C2=A0 ------------=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -------------<br>
---------------<br>
-----------<br>
=C2=A0 libslirp:default_library=C2=A0 =C2=A0 =C2=A0 static<br>
[shared, static, both]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Default<br>
library type<br>
=C2=A0 libslirp:werror=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0true=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[true,<br>
false]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Treat warnings<br>
as errors<br>
<br>
=C2=A0 Project options=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Current Value<br>
Possible Values<br>
Description<br>
=C2=A0 ---------------=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-------------<br>
---------------<br>
-----------<br>
=C2=A0 libslirp:version_suffix<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Suffix to append<br>
to SLIRP_VERSION_STRING<br>
<br>
In slirptest I get only:<br>
<br>
Subproject libslirp:<br>
<br>
=C2=A0 Project options=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Current Value<br>
Possible Values<br>
Description<br>
=C2=A0 ---------------=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-------------<br>
---------------<br>
-----------<br>
=C2=A0 libslirp:version_suffix<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Suffix to append<br>
to SLIRP_VERSION_STRING<br>
<br>
<br>
So somehow meson has failed to apply the default_library and werror options=
 in<br>
the incremental build case.<br clear=3D"all"><br></blockquote><div><br></di=
v><div>Thanks for the detailed steps. It turns out that incremental build w=
ith subprojects is broken with meson &lt; 0.57.2 (<a href=3D"https://github=
.com/mesonbuild/meson/pull/8424" target=3D"_blank" rel=3D"noreferrer">https=
://github.com/mesonbuild/meson/pull/8424</a>).</div><div><br></div><div>Eit=
her we acknowledge that, or we fix the qemu meson.build for now with the mi=
ssing -lresolv for osx/bsd.</div><div><br></div><div>I am going to work on =
a patch for the second option, but leave the decision open.<br></div><div><=
br></div><div><br></div><div><br></div><div> <br></div></div><br>-- <br><di=
v dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div>
</blockquote></div>

--00000000000099d23205c8a94a14--


