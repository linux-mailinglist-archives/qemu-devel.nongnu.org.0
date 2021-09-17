Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7850A40FDC1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:19:15 +0200 (CEST)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGa2-00057o-G4
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRGMM-0006Lq-8U
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:05:06 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:36570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRGMJ-0007V6-Bh
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:05:05 -0400
Received: by mail-vs1-xe30.google.com with SMTP id 186so4712268vsi.3
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u2VSww9Enhc9+QxFAyhkk2313MgxXU4UY9401krIpec=;
 b=sVVV8nZJszLs188ML4VQvUWtrCNf0/dtr8OqcX/hhPEGma+I3GUKBg2dHg+R7pmD0r
 le1rzIKmjvNcqIghrk2e+BTNkCy+FHb+X2zhB76zHR4PTAkQVIGa0kw5ZZijOkjTGlVS
 6h6cMsUGQXgm2PNK4/oXrN6q3/3qsZV9U0Zc9fYo4KUTgrhThCcphuXsiMkhRxf3bV0m
 c4t1cO26iPdeahu2TKxHPfkkrBDKImAU1iybYCfHKcWsAP6i2aW16vhs51EjHBqNu6uw
 onMWU2ho7y+5Ff1uwcAEhFWetFztDuLRkil/fcrP9oMJCvj4QZvoLkeXxHXZsn+477D6
 LJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u2VSww9Enhc9+QxFAyhkk2313MgxXU4UY9401krIpec=;
 b=EjqVYbOu4NdWjHGoPhtkYu4kJLQkr70Y1qLqP+Ek18vc2zOvLOQ+Ke3Xylm20FZoDA
 a7zuTyPNOheWiRlG/lJAB5QuI/Az70vVI6XJcrUH0TuZR37JA1rdj//mS+wRKaC4Pz+b
 FX2pmOHxVlMqOcZXy9mTslT/0fN/klsnG2s59mT9udHaol4B/+Aa8IJEOdxWWrthMJI5
 3Etm200pQ9WE+I7i8Iu+MmnzARlLXth0DHRASmNkLljz98kRnKniagqzsKQhHfidgPqU
 NiMuLPYSN8MxwzvZGNqciPRYziHqal1vQ2ECtpJMR3lY90sown/4uC/YkRq3S57erEkN
 /icA==
X-Gm-Message-State: AOAM5310kKn1wk7l4ZY0UBtOe11pyYldONUrBq0QN+HBSepbjfYc7ApR
 h17+wAg8xXMHwJGNHENRG/4oME2MnetL7M/eClyzXw==
X-Google-Smtp-Source: ABdhPJyvWHmW3ZfytfMXH6ctYsZUhscNlAODBJVhg3jVV/mgS6bQRoiPvxCrKtaAeuCeyOeuNJU9PyfqkYM7cgtW09Y=
X-Received: by 2002:a05:6102:1161:: with SMTP id
 k1mr9343790vsg.6.1631894701494; 
 Fri, 17 Sep 2021 09:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <YURYvaOpya498Xx2@yekko> <YUR9RXXZ4lSRfcyB@redhat.com>
In-Reply-To: <YUR9RXXZ4lSRfcyB@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 17 Sep 2021 10:04:50 -0600
Message-ID: <CANCZdfoezvfO+wKgqwMf7oCO3dAgpJ28RGecnZs31_o3+iUdGA@mail.gmail.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fe61f805cc331711"
Received-SPF: none client-ip=2607:f8b0:4864:20::e30;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, slp@redhat.com, cohuck@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 sgarzare@redhat.com, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fe61f805cc331711
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 5:35 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Fri, Sep 17, 2021 at 06:58:37PM +1000, David Gibson wrote:
> > Hi all,
> >
> > At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> > whether Rust supported all the host/build platforms that qemu does,
> > which is obviously vital if we want to make Rust a non-optional
> > component of the build.
> >
> > I've added the information to our wiki at:
> >       https://wiki.qemu.org/RustInQemu
> >
> > TBH, the coverage is not as good as I expected.  Linux, macOS and
> > Windows are pretty much ok, with the exception of Linux on Sparc.
> > There are a lot of gaps in *BSD support, however.
>
> To me the coverage looks pretty much what I'd expect to need
> for QEMU - almost all boxes that I'd want to see green are
> green, except OpenBSD, possibly x86 32-bit for *BSD and
> sparc(64) on Linux.
>
> Mostly it highlights that we've never explicitly declared what
> our architecture coverage is intended to be. We do check host
> arches in configure, but we didn't distinguish this by OS and
> I think that's a mistake.
>
> In terms of our CI coverage, the only non-x86 testing we do
> is for Linux based systems.
>
> Although its possible people use non-x86 on non-Linux, I don't
> recall any discussions/bugs/patches targetting this situation,
> so if we do have users I doubt there's many.
>
> Would be interesting to hear input from anyone representing
> interests of the various *BSD platforms about their thoughts
> wrt non-x86 coverage.
>
> I think our first step is probably to make our architecture
> support explicit, regardless of our use of Rust.
>
> If we assume QEMU followed a similar 3 tier policy, on the QEMU
> side my interpretation of what we're implicitly targetting would
> be:
>
>  Linux:  all arches with a TCG target
>  macOS: x86_64
>  Windows: i686, x86_64
>  FreeBSD: x86_64  (maybe +i686 too)
>  NetBSD: x86_64  (maybe +i686 too)
>  OpenBSD: x86_64  (maybe +i686 too)
>
> with tier 1 vs 2 for the above depending on whether we run
> 'make check' in gating CI)
>

wrt FreeBSD:

The main focus of the project is on AMD64 (x86_64) and ARM64 (aarc64). With
ricsv64 being ascendant as well. i386 and armv7 are fading. ppc64 has
strong,
but episodic, interest as well. The rest are bit players.

i386 (i686 really), armv7 and riscv7 are the next tier of interest in
FreeBSD
land. i386 is confined to 32-bit VMs with only a few legacy hardware
deployments
still kicking. armv7 is more popular on embedded boards, some of which have
a need to run qemu. riscv64 has a rust port that's being upstreamed, but no=
t
there yet and there's likely interest to run qemu on it for research
projects.
riscv64 isn't widely deployed but has a lot of developer interest /
mindshare.
sparc64 was removed from FreeBSD 13 and has been irrelevant for years.
ppc 32 bit has some minor interest. mips has been fading fast and stands
an excellent chance of being removed before FreeBSD 14 (which is currently
slated for 2022). PowerPC 64 is hard to talk about... there's interest that
comes
and goes, but when it's around, it's quite intense. It's quite likely there
will
be interest to run qemu on ppc64 on FreeBSD, but that's much less certain.

So it all depends on what having rust means for those platforms that don't
have
it. Would it be a 'half a loaf' situation where the non-rust bits would be
buildable
but cool new drivers written in rust won't be? Or will it be so central
that rust is
table stakes to even start a qemu build? To be honest, I'm not sure this
difference
would greatly affect the above answer :).

Rust works really well on x86_64 and aarch64 (though there's more often a
lag
on the latter of a few weeks). I know of a rust riscv64 port, but that's
just getting
ready to upstream. No first-hand or second-hand clue on the rest.

FreeBSD tl;dr: x86_64 and aarch64 are must have. i386, armv7 and riscv64 ar=
e
really nice to have. ppc64 might also be in that list, but that's less
certain. The rest
have little to no relevance.

Warner

P.S I've been poking at people to get our QEMU aarch64 CI story in better
shape than it is today... I'll have to continue to prompt those
interested...

--000000000000fe61f805cc331711
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 5:35 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri, Sep 17, 2021 at 06:58:37PM +1000, David Gibson wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; At the qemu-in-rust BoF at KVM Forum, I volunteered to look into<br>
&gt; whether Rust supported all the host/build platforms that qemu does,<br=
>
&gt; which is obviously vital if we want to make Rust a non-optional<br>
&gt; component of the build.<br>
&gt; <br>
&gt; I&#39;ve added the information to our wiki at:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://wiki.qemu.org/RustInQemu"=
 rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/RustInQemu</a><=
br>
&gt; <br>
&gt; TBH, the coverage is not as good as I expected.=C2=A0 Linux, macOS and=
<br>
&gt; Windows are pretty much ok, with the exception of Linux on Sparc.<br>
&gt; There are a lot of gaps in *BSD support, however.<br>
<br>
To me the coverage looks pretty much what I&#39;d expect to need<br>
for QEMU - almost all boxes that I&#39;d want to see green are<br>
green, except OpenBSD, possibly x86 32-bit for *BSD and<br>
sparc(64) on Linux.<br>
<br>
Mostly it highlights that we&#39;ve never explicitly declared what<br>
our architecture coverage is intended to be. We do check host<br>
arches in configure, but we didn&#39;t distinguish this by OS and<br>
I think that&#39;s a mistake.<br>
<br>
In terms of our CI coverage, the only non-x86 testing we do<br>
is for Linux based systems.<br>
<br>
Although its possible people use non-x86 on non-Linux, I don&#39;t<br>
recall any discussions/bugs/patches targetting this situation,<br>
so if we do have users I doubt there&#39;s many.<br>
<br>
Would be interesting to hear input from anyone representing<br>
interests of the various *BSD platforms about their thoughts<br>
wrt non-x86 coverage.<br>
<br>
I think our first step is probably to make our architecture<br>
support explicit, regardless of our use of Rust.<br>
<br>
If we assume QEMU followed a similar 3 tier policy, on the QEMU<br>
side my interpretation of what we&#39;re implicitly targetting would<br>
be:<br>
<br>
=C2=A0Linux:=C2=A0 all arches with a TCG target<br>
=C2=A0macOS: x86_64<br>
=C2=A0Windows: i686, x86_64<br>
=C2=A0FreeBSD: x86_64=C2=A0 (maybe +i686 too)<br>
=C2=A0NetBSD: x86_64=C2=A0 (maybe +i686 too)<br>
=C2=A0OpenBSD: x86_64=C2=A0 (maybe +i686 too)<br>
<br>
with tier 1 vs 2 for the above depending on whether we run<br>
&#39;make check&#39; in gating CI)<br></blockquote><div><br></div><div>wrt =
FreeBSD:</div><div><br></div><div>The main focus of the project is on AMD64=
 (x86_64) and ARM64 (aarc64). With</div><div>ricsv64 being ascendant as wel=
l. i386 and armv7 are fading. ppc64 has strong,</div><div>but episodic, int=
erest as well. The rest are bit players.</div><div><br></div><div>i386 (i68=
6 really), armv7 and riscv7 are the next tier of interest in FreeBSD<br></d=
iv><div>land. i386 is confined to 32-bit VMs with only a few legacy hardwar=
e deployments</div><div>still kicking. armv7 is more popular on embedded bo=
ards, some of which have</div><div>a need to run qemu. riscv64 has a rust p=
ort that&#39;s being upstreamed, but not</div><div>there yet and there&#39;=
s likely interest to run qemu on it for research projects.</div><div>riscv6=
4 isn&#39;t widely deployed but has a lot of developer interest / mindshare=
.</div><div>sparc64 was removed from FreeBSD 13 and has been irrelevant for=
 years.</div><div>ppc 32 bit has some minor interest. mips has been fading =
fast and stands</div><div>an excellent chance of being removed before FreeB=
SD 14 (which is currently</div><div>slated for 2022). PowerPC 64 is hard to=
 talk about... there&#39;s interest that comes</div><div>and goes, but when=
 it&#39;s around, it&#39;s quite intense. It&#39;s quite likely there will<=
/div><div>be interest to run qemu on ppc64 on FreeBSD, but that&#39;s much =
less certain.</div><div><br></div><div>So it all depends on what having rus=
t means for those platforms that don&#39;t have</div><div>it. Would it be a=
 &#39;half a loaf&#39; situation where the non-rust bits would be buildable=
</div><div>but cool new drivers written in rust won&#39;t be? Or will it be=
 so central that rust is</div><div>table stakes to even start a qemu build?=
 To be honest, I&#39;m not sure this difference</div><div>would greatly aff=
ect the above answer :).</div><div><br></div><div>Rust works really well on=
 x86_64 and aarch64 (though there&#39;s more often a lag</div><div>on the l=
atter of a few weeks). I know of a rust riscv64 port, but that&#39;s just g=
etting</div><div>ready to upstream. No first-hand or second-hand clue on th=
e rest.</div><div><br></div><div>FreeBSD tl;dr: x86_64 and aarch64 are must=
 have. i386, armv7 and riscv64 are</div><div>really nice to have. ppc64 mig=
ht also be in that list, but that&#39;s less certain. The rest</div><div>ha=
ve little to no relevance.</div><div><br></div><div>Warner</div><div><br></=
div><div>P.S I&#39;ve been poking at people to get our QEMU aarch64 CI stor=
y in better</div><div>shape than it is today... I&#39;ll have to continue t=
o prompt those interested...</div><div><br></div></div></div>

--000000000000fe61f805cc331711--

