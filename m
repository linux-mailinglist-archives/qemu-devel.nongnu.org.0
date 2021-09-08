Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94758403F53
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 21:02:49 +0200 (CEST)
Received: from localhost ([::1]:55452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO2qN-0005fW-SZ
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 15:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mO2nh-000459-Uo
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 15:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mO2nf-0005H1-BE
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 15:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631127598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P0hy8AwQkzrqi0dhHKE05lnfn9sMGwqBMrVwaogzipU=;
 b=MXauh67La2Mcan61kiIOzSvYl63EPVTmGSTlb6JnpINeHuhFjIkjO7nUwFGVElDvZVfiJD
 VGIUnxePWgyTDBsmR2SGNpoWuiFCapX3wY/RWewWJ+gn4a0hHrlDQrge5s1JZ68dQ27TWq
 UwDmsPNGCyjlXIJ3THG4R6+NMjo4CTk=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-se_NXDCGMrqx25k3k7a9Eg-1; Wed, 08 Sep 2021 14:59:53 -0400
X-MC-Unique: se_NXDCGMrqx25k3k7a9Eg-1
Received: by mail-pg1-f200.google.com with SMTP id
 a16-20020a63d410000000b00268ebc7f4faso2289034pgh.17
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 11:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P0hy8AwQkzrqi0dhHKE05lnfn9sMGwqBMrVwaogzipU=;
 b=e3uVITx/lvHmsVHjBuGMlqK8VuLZwYJki2ZaYakSH47uOl2eJX2yiqUjqj0oUvYIqm
 Uc3c/Ah2YVYOaljAtW8Im3NOPUf7wbxf4Mtr34S/iugioEap5MVH8nHQ5ujw8NbjTwnM
 qbE/nlJsOHg9t+K4eJcScqQQzKLBVWjWnpKmM4EFJcSqBzpz4/qyy2+Ip2m+fJAiivyp
 SEMk5eRWktFEhl88OVptljqRDe/e8JYegtcEQdFouzqHenEvE57TLF9V6rwSM4nxgqMk
 skVlrvxgv+E/ccnV3lMDZdXRDZBTB4PqOS460czK0X9qSbTSla8gMB8G0pMHmAqBAdVi
 s60Q==
X-Gm-Message-State: AOAM530fDQXRqJQUIIzm1KQuCNk29N3HWlSzWVJVZ2x2GsW27oQQH39i
 zlTFn1I/f5D5dwGwMQ+FqM1RmByrKa/x9d5pB0BKC37K58MOK+VKb51P5B043xpI/LgFHVZ1l7w
 9FwEKZy9Q52vTby4pj0W61eR8zLZSxW8=
X-Received: by 2002:a63:6f02:: with SMTP id k2mr4992020pgc.396.1631127591975; 
 Wed, 08 Sep 2021 11:59:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1Rrg/xBTr90F0FjEN52005jT+bm+X/2bsdpNpJCzEpGsArP6ZWABCz6KuHorQyy/3wg2wzeJnIWK8abNhC1w=
X-Received: by 2002:a63:6f02:: with SMTP id k2mr4992002pgc.396.1631127591633; 
 Wed, 08 Sep 2021 11:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <YTjf6BhpPU3aLct9@redhat.com>
 <364031a0-982d-f6bd-cbcc-9f6d9be4ba69@redhat.com>
 <YTjmjfbjqD4dA/VM@redhat.com>
In-Reply-To: <YTjmjfbjqD4dA/VM@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 8 Sep 2021 20:59:39 +0200
Message-ID: <CABgObfa98ou_MRKYOGxOLor2EAFND=6z-pvuCC5M9YLi9-KJjw@mail.gmail.com>
Subject: Re: Compatibility between -device sga and -machine graphics=off
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000aed60105cb807c8b"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aed60105cb807c8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh, that's cool. It must be part of the kvmvapic migration data. Still,
there are very likely some rare cases that would break (on any machine),
e.g. if migrating while seabios is accessing the list of option roms.

Paolo

Il mer 8 set 2021, 18:36 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> On Wed, Sep 08, 2021 at 06:28:01PM +0200, Paolo Bonzini wrote:
> > On 08/09/21 18:08, Daniel P. Berrang=C3=A9 wrote:
> > > Despite this difference, I was able migrate from a x86 guest using SG=
A
> > > to a guest using graphics=3Doff without errors being reported. So it
> > > doesn't seem to change the migration data sections sent on the wire
> > > at least.
> >
> > It would probably break with Windows XP/2003 guests on AMD processors, =
as
> > those are the ones that use kvmvapic.  On other guests and processors,
> it's
> > a no-op.
>
> After running an incoming migrate, the target QEMU's  'info mtree'
> changed to reflect what the src QEMU originally reported.  So whatever
> difference 'graphics=3Doff' causes compared to -device sga initially,
> appears to have been eliminated by running the migrate. Not sure if
> that's true in the general case or not - I'm just testing with a
> minimalist CLI and no real OS running
>
>  qemu-system-x86_64 -nodefaults -display sdl -device VGA -serial stdio
> -device sga
>
> vs
>
>  qemu-system-x86_64 -nodefaults -display sdl -device VGA -serial stdio
> -machine graphics=3Doff
>
> Regards,
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

--000000000000aed60105cb807c8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Oh, that&#39;s cool. It must be part of the kvmvapic migr=
ation data. Still, there are very likely some rare cases that would break (=
on any machine), e.g. if migrating while seabios is accessing the list of o=
ption roms.<div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mer =
8 set 2021, 18:36 Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@re=
dhat.com" target=3D"_blank" rel=3D"noreferrer">berrange@redhat.com</a>&gt; =
ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Sep 08, 2021 at=
 06:28:01PM +0200, Paolo Bonzini wrote:<br>
&gt; On 08/09/21 18:08, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; &gt; Despite this difference, I was able migrate from a x86 guest usin=
g SGA<br>
&gt; &gt; to a guest using graphics=3Doff without errors being reported. So=
 it<br>
&gt; &gt; doesn&#39;t seem to change the migration data sections sent on th=
e wire<br>
&gt; &gt; at least.<br>
&gt; <br>
&gt; It would probably break with Windows XP/2003 guests on AMD processors,=
 as<br>
&gt; those are the ones that use kvmvapic.=C2=A0 On other guests and proces=
sors, it&#39;s<br>
&gt; a no-op.<br>
<br>
After running an incoming migrate, the target QEMU&#39;s=C2=A0 &#39;info mt=
ree&#39;<br>
changed to reflect what the src QEMU originally reported.=C2=A0 So whatever=
<br>
difference &#39;graphics=3Doff&#39; causes compared to -device sga initiall=
y,<br>
appears to have been eliminated by running the migrate. Not sure if<br>
that&#39;s true in the general case or not - I&#39;m just testing with a<br=
>
minimalist CLI and no real OS running<br>
<br>
=C2=A0qemu-system-x86_64 -nodefaults -display sdl -device VGA -serial stdio=
=C2=A0 -device sga<br>
<br>
vs<br>
<br>
=C2=A0qemu-system-x86_64 -nodefaults -display sdl -device VGA -serial stdio=
=C2=A0 -machine graphics=3Doff<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer noreferrer=
" target=3D"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =
=C2=A0 <a href=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferre=
r noreferrer noreferrer" target=3D"_blank">https://www.flickr.com/photos/db=
errange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer noreferrer"=
 target=3D"_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-o-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138=
.berrange.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">h=
ttps://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer nore=
ferrer" target=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=
=C2=A0 =C2=A0 <a href=3D"https://www.instagram.com/dberrange" rel=3D"norefe=
rrer noreferrer noreferrer" target=3D"_blank">https://www.instagram.com/dbe=
rrange</a> :|<br>
<br>
</blockquote></div>

--000000000000aed60105cb807c8b--


