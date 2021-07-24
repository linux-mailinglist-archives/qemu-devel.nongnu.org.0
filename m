Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07B83D446C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 04:40:15 +0200 (CEST)
Received: from localhost ([::1]:41848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m77aI-0004qG-8i
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 22:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmario@redhat.com>) id 1m76ix-0003Af-Da
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 21:45:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmario@redhat.com>) id 1m76iu-0005ie-Et
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 21:45:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627091102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mmHgQ5mfuDqIL1EMJ2m4xfjlsRwY+wQbFTdEI1DIcoQ=;
 b=cuYlYnjJxoRePE5mF6wZq40hHENSpTxp9c2ltzyKgBi/W2zj1OPE4CarKUxA9mzUPxTDPa
 /P3a54HaMg86DYxk8tdjru8jLjTW5qS7OLHcrm7XdGp/ENfAaBnV/lIGOE7qe8aeR9R/l3
 DoqQlMQO4kw4czvrHCrxisFULZyTf/I=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-6aVbs02vPQq-S_paaG8zhg-1; Fri, 23 Jul 2021 21:43:16 -0400
X-MC-Unique: 6aVbs02vPQq-S_paaG8zhg-1
Received: by mail-oo1-f70.google.com with SMTP id
 g3-20020a4ab0430000b02902677ea337a5so2203245oon.6
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 18:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JO5yHdkxKncj85yniALpHDCQgRT+H6QSB0SR0QNxUIo=;
 b=QHaaXqiBFK5JW0k/QN1hewyxKpskPB0xSC0CgoIqV9XwgthKgDLkxUKx/qQq2PNP1D
 Ebnl/net1NrDVmTiYE4LXJ4wGtVvhoETVNTWm1EexJ4dPAJgmtVX+5Cr8/NwUhKLaw9E
 q0oVu0QqgMgz7OFxrUE3zEOlH/nDv65CgGd0ujj6ZYuIBKI6QhkGqKHPjr1OlMGnjV5K
 C3LpwEn++aNgEu0GDnUwCOV0kVAzf2X9JD2abdafWhk5Bisoku7w7LPFne0kBwn+vYcc
 tyikWHigTJpqKRIIFjOTSK4sbjJX8Gdh1x8td1H6EXEN20vObDxdvQkXOjsFlq2r7fFk
 w+fw==
X-Gm-Message-State: AOAM530UEOdK6hAWPUGSp5AHa32faCFEjiekYThRWh9e4b4Z317sHCBQ
 6aaq0dyW3lVXlV6Fqqau3Y3RErAcBUdaK3/LFchINCMiQu4f2uKc6475EOK0OrYXnTw1b8xH9Cu
 is0M4lvlMPyMTxje37mDNuc2ma0ZUd7c=
X-Received: by 2002:aca:c402:: with SMTP id u2mr4751394oif.121.1627090996249; 
 Fri, 23 Jul 2021 18:43:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXVtu9IVSbZuMDCMekyqtNCPNo8doCTSJYYlPLLUtFGjl8vXzY67qVdnPqcbOn52PWaAGJjospW9Z301mI0hA=
X-Received: by 2002:aca:c402:: with SMTP id u2mr4751386oif.121.1627090996062; 
 Fri, 23 Jul 2021 18:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <YPlCJpMIOb2Umc+Z@work-vm>
 <092f9b8b-4a14-d059-49be-010b760828aa@linaro.org>
 <YPnDdT1VYANI0Wzw@work-vm>
In-Reply-To: <YPnDdT1VYANI0Wzw@work-vm>
From: Joe Mario <jmario@redhat.com>
Date: Fri, 23 Jul 2021 21:43:05 -0400
Message-ID: <CA+c1WK7XCgdYTbG5FK3q=x9S1t2p2vxcreEwtiZf5L=rsg0i6g@mail.gmail.com>
Subject: Re: Prefetches in buffer_zero_*
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jmario@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="000000000000d697c505c7d4a4eb"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jmario@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 23 Jul 2021 22:39:14 -0400
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d697c505c7d4a4eb
Content-Type: multipart/alternative; boundary="000000000000d697c305c7d4a4e9"

--000000000000d697c305c7d4a4e9
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 3:14 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> * Richard Henderson (richard.henderson@linaro.org) wrote:
> > On 7/22/21 12:02 AM, Dr. David Alan Gilbert wrote:
> > > Hi Richard,
> > >    I think you were the last person to fiddle with the prefetching
> > > in buffer_zero_avx2 and friends; Joe (cc'd) wondered if explicit
> > > prefetching still made sense on modern CPUs, and that their hardware
> > > generally figures stuff out better on simple increments.
> > >
> > >    What was your thinking on this, and did you actually measure
> > > any improvement?
> >
> > Ah, well, that was 5 years ago so I have no particular memory of this.
> It
> > wouldn't surprise me if you can't measure any improvement on modern
> > hardware.
> >
> > Do you now measure an improvement with the prefetches gone?
>
> Not tried, it just came from Joe's suggestion that it was generally a
> bad idea these days; I do remember that the behaviour of those functions
> is quite tricky because there performance is VERY data dependent - many
> VMs actually have pages that are quite dirty so you never iterate the
> loop, but then you hit others with big zero pages and you spend your
> entire life in the loop.
>
>
Dave, Richard:
My curiosity got the best of me.  So I created a small test program that
used the buffer_zero_avx2() routine from qemu's bufferiszero.c.

When I run it on an Intel Cascade Lake processor, the cost of calling
"__builtin_prefetch(p)" is in the noise range .  It's always "just
slightly" slower.  I doubt it could ever be measured in qemu.

Ironically, when I disabled the hardware prefetchers, the program slowed
down over 33%.  And the call to "__builtin_prefetch(p)" actually hurt
performance by over 3%.

My results are below, (only with the hardware prefetchers enabled).  The
program is attached.
Joe

# gcc -mavx buffer_zero_avx.c -O -DDO_PREFETCH ; for i in {1..5}; do
./a.out; done
TSC 356144 Kcycles.
TSC 356714 Kcycles.
TSC 356707 Kcycles.
TSC 356565 Kcycles.
TSC 356853 Kcycles.
# gcc -mavx buffer_zero_avx.c -O ; for i in {1..5}; do ./a.out; done
TSC 355520 Kcycles.
TSC 355961 Kcycles.
TSC 355872 Kcycles.
TSC 355948 Kcycles.
TSC 355918 Kcycles.

Dave
> >
> > r~
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>

--000000000000d697c305c7d4a4e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif;font-size:small"><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul =
22, 2021 at 3:14 PM Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@r=
edhat.com">dgilbert@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">* Richard Henderson (<a href=3D"mailto:richar=
d.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>)=
 wrote:<br>
&gt; On 7/22/21 12:02 AM, Dr. David Alan Gilbert wrote:<br>
&gt; &gt; Hi Richard,<br>
&gt; &gt;=C2=A0 =C2=A0 I think you were the last person to fiddle with the =
prefetching<br>
&gt; &gt; in buffer_zero_avx2 and friends; Joe (cc&#39;d) wondered if expli=
cit<br>
&gt; &gt; prefetching still made sense on modern CPUs, and that their hardw=
are<br>
&gt; &gt; generally figures stuff out better on simple increments.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 What was your thinking on this, and did you actually=
 measure<br>
&gt; &gt; any improvement?<br>
&gt; <br>
&gt; Ah, well, that was 5 years ago so I have no particular memory of this.=
=C2=A0 It<br>
&gt; wouldn&#39;t surprise me if you can&#39;t measure any improvement on m=
odern<br>
&gt; hardware.<br>
&gt; <br>
&gt; Do you now measure an improvement with the prefetches gone?<br>
<br>
Not tried, it just came from Joe&#39;s suggestion that it was generally a<b=
r>
bad idea these days; I do remember that the behaviour of those functions<br=
>
is quite tricky because there performance is VERY data dependent - many<br>
VMs actually have pages that are quite dirty so you never iterate the<br>
loop, but then you hit others with big zero pages and you spend your<br>
entire life in the loop.<br>
<br></blockquote><div><br></div><div><div style=3D"font-family:arial,helvet=
ica,sans-serif;font-size:small" class=3D"gmail_default">Dave, Richard:</div=
><div style=3D"font-family:arial,helvetica,sans-serif;font-size:small" clas=
s=3D"gmail_default">My curiosity got the best of me.=C2=A0 So I created a s=
mall test program that used the buffer_zero_avx2() routine from qemu&#39;s =
bufferiszero.c.</div><div style=3D"font-family:arial,helvetica,sans-serif;f=
ont-size:small" class=3D"gmail_default"><br></div><div style=3D"font-family=
:arial,helvetica,sans-serif;font-size:small" class=3D"gmail_default">When I=
 run it on an Intel Cascade Lake processor, the cost of calling &quot;__bui=
ltin_prefetch(p)&quot; is in the noise range .=C2=A0 It&#39;s always &quot;=
just slightly&quot; slower.=C2=A0 I doubt it could ever be measured in qemu=
.<br></div></div><div><br></div><div><div style=3D"font-family:arial,helvet=
ica,sans-serif;font-size:small" class=3D"gmail_default">Ironically, when I =
disabled the hardware prefetchers, the program slowed down over 33%.=C2=A0 =
And the call to &quot;__builtin_prefetch(p)&quot; actually hurt performance=
 by over 3%. <br></div><br></div><div><div style=3D"font-family:arial,helve=
tica,sans-serif;font-size:small" class=3D"gmail_default">My results are bel=
ow, (only with the hardware prefetchers enabled).=C2=A0 The program is atta=
ched.</div><div style=3D"font-family:arial,helvetica,sans-serif;font-size:s=
mall" class=3D"gmail_default">Joe</div><br></div><div style=3D"font-family:=
arial,helvetica,sans-serif;font-size:small" class=3D"gmail_default"># gcc -=
mavx buffer_zero_avx.c -O -DDO_PREFETCH ; for i in {1..5}; do ./a.out; done=
 <br>TSC 356144 Kcycles. <br>TSC 356714 Kcycles. <br>TSC 356707 Kcycles. <b=
r>TSC 356565 Kcycles. <br>TSC 356853 Kcycles. <br># gcc -mavx buffer_zero_a=
vx.c -O ; for i in {1..5}; do ./a.out; done <br>TSC 355520 Kcycles. <br>TSC=
 355961 Kcycles. <br>TSC 355872 Kcycles. <br>TSC 355948 Kcycles. <br>TSC 35=
5918 Kcycles. <br></div><div style=3D"font-family:arial,helvetica,sans-seri=
f;font-size:small" class=3D"gmail_default"><br></div><div style=3D"font-fam=
ily:arial,helvetica,sans-serif;font-size:small" class=3D"gmail_default"></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Dave<br>
&gt; <br>
&gt; r~<br>
&gt; <br>
-- <br>
Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" target=3D"_=
blank">dgilbert@redhat.com</a> / Manchester, UK<br>
<br>
</blockquote></div></div>

--000000000000d697c305c7d4a4e9--

--000000000000d697c505c7d4a4eb
Content-Type: text/x-csrc; charset="US-ASCII"; name="buffer_zero_avx.c"
Content-Disposition: attachment; filename="buffer_zero_avx.c"
Content-Transfer-Encoding: base64
Content-ID: <f_krh323f90>
X-Attachment-Id: f_krh323f90

LyoKICogU2ltcGxlIHByb2dyYW0gdG8gdGVzdCBpZiBhIHByZWZldGNoIGhlbHBzIG9yIGh1cnRz
IGJ1ZmZlcl96ZXJvX2F2eDIuCiAqCiAqIENvbXBpbGUgd2l0aCBlaXRoZXI6CiAqICBnY2MgLW1h
dnggYnVmZmVyX3plcm9fYXZ4LmMgLU8gCiAqIG9yCiAqICBnY2MgLW1hdnggYnVmZmVyX3plcm9f
YXZ4LmMgLU8gLURET19QUkVGRVRDSCAKICovCgojaW5jbHVkZSA8aW1taW50cmluLmg+CiNpbmNs
dWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDxzdGRkZWYuaD4KI2lu
Y2x1ZGUgPHN5cy9tbWFuLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KCiNkZWZpbmUgbGlrZWx5KHgp
ICAgICAgIF9fYnVpbHRpbl9leHBlY3QoKHgpLDEpCiNkZWZpbmUgdW5saWtlbHkoeCkgICAgIF9f
YnVpbHRpbl9leHBlY3QoKHgpLDApCgpzdGF0aWMgX19pbmxpbmVfXyB1X2ludDY0X3Qgc3RhcnRf
Y2xvY2soKTsKc3RhdGljIF9faW5saW5lX18gdV9pbnQ2NF90IHN0b3BfY2xvY2soKTsKc3RhdGlj
IGludCBidWZmZXJfemVyb19hdngyKGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbik7CgovKgog
KiBBbGxvY2F0ZSBhIGxhcmdlIGNodWNrIG9mIGFub24gbWVtb3J5LCB0b3VjaC96ZXJvIGl0LCAK
ICogYW5kIHRoZW4gdGltZSB0aGUgY2FsbCB0byBidWZmZXJfemVyb19hdngyKCkuCiAqLwppbnQg
bWFpbigpIAp7CiAgIGxvbmcgaTsKICAgc2l6ZV90IG1tYXBfbGVuID0gMlVMKjEwMjQqMTAyNCox
MDI0OwogICBjaGFyICpwdHIgPSBtbWFwKE5VTEwsIG1tYXBfbGVuLAogICAgICAgUFJPVF9SRUFE
IHwgUFJPVF9XUklURSwgTUFQX0FOT05ZTU9VUyB8IE1BUF9QUklWQVRFLCAtMSwgMEwpOwoKICAg
aWYgKHB0ciA9PSBNQVBfRkFJTEVEKSB7CiAgICAgICBwZXJyb3IoIiBtbWFwIik7CiAgICAgICBl
eGl0KDEpOwogICB9CgogICAvLyBUb3VjaCB0aGUgcGFnZXMgKHRoZXkncmUgYWxyZWFkeSBjbGVh
cmVkKQogICBtZW1zZXQocHRyLDB4MCxtbWFwX2xlbik7CgogICB1X2ludDY0X3Qgc3RhcnRfcmR0
c2MgPSBzdGFydF9jbG9jaygpOwoKICAgYnVmZmVyX3plcm9fYXZ4MihwdHIsIG1tYXBfbGVuKTsK
CiAgIHVfaW50NjRfdCBzdG9wX3JkdHNjID0gc3RvcF9jbG9jaygpOwogICB1X2ludDY0X3QgZGlm
ZiA9IHN0b3BfcmR0c2MgLSBzdGFydF9yZHRzYzsKCiAgIHByaW50ZigiVFNDICVsZCBLY3ljbGVz
LiBcbiIsIGRpZmYvMTAwMCk7Cgp9CgpzdGF0aWMgaW50IApidWZmZXJfemVyb19hdngyKGNvbnN0
IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbikKewogICAgLyogQmVnaW4gd2l0aCBhbiB1bmFsaWduZWQg
aGVhZCBvZiAzMiBieXRlcy4gICovCiAgICBfX20yNTZpIHQgPSBfbW0yNTZfbG9hZHVfc2kyNTYo
YnVmKTsKICAgIF9fbTI1NmkgKnAgPSAoX19tMjU2aSAqKSgoKHVpbnRwdHJfdClidWYgKyA1ICog
MzIpICYgLTMyKTsKICAgIF9fbTI1NmkgKmUgPSAoX19tMjU2aSAqKSgoKHVpbnRwdHJfdClidWYg
KyBsZW4pICYgLTMyKTsKCiAgICBpZiAobGlrZWx5KHAgPD0gZSkpIHsKICAgICAgICAvKiBMb29w
IG92ZXIgMzItYnl0ZSBhbGlnbmVkIGJsb2NrcyBvZiAxMjguICAqLwogICAgICAgIGRvIHsKI2lm
ZGVmIERPX1BSRUZFVENICiAgICAgICAgICAgICBfX2J1aWx0aW5fcHJlZmV0Y2gocCk7CiNlbmRp
ZgogICAgICAgICAgICBpZiAodW5saWtlbHkoIV9tbTI1Nl90ZXN0el9zaTI1Nih0LCB0KSkpIHsK
ICAgICAgICAgICAgICAgIHByaW50ZigiSW4gdW5saWtlbHkgYnVmZmVyX3plcm8sIHA6JWx4IFxu
IixwKTsKICAgICAgICAgICAgICAgIHJldHVybiAwOwogICAgICAgICAgICB9CiAgICAgICAgICAg
IHQgPSBwWy00XSB8IHBbLTNdIHwgcFstMl0gfCBwWy0xXTsKICAgICAgICAgICAgcCArPSA0Owog
ICAgICAgIH0gd2hpbGUgKHAgPD0gZSk7CiAgICB9IGVsc2UgewogICAgICAgIHQgfD0gX21tMjU2
X2xvYWR1X3NpMjU2KGJ1ZiArIDMyKTsKICAgICAgICBpZiAobGVuIDw9IDEyOCkgewogICAgICAg
ICAgICBnb3RvIGxhc3QyOwogICAgICAgIH0KICAgIH0KCiAgICAvKiBGaW5pc2ggdGhlIGxhc3Qg
YmxvY2sgb2YgMTI4IHVuYWxpZ25lZC4gICovCiAgICB0IHw9IF9tbTI1Nl9sb2FkdV9zaTI1Nihi
dWYgKyBsZW4gLSA0ICogMzIpOwogICAgdCB8PSBfbW0yNTZfbG9hZHVfc2kyNTYoYnVmICsgbGVu
IC0gMyAqIDMyKTsKbGFzdDI6CiAgICB0IHw9IF9tbTI1Nl9sb2FkdV9zaTI1NihidWYgKyBsZW4g
LSAyICogMzIpOwogICAgdCB8PSBfbW0yNTZfbG9hZHVfc2kyNTYoYnVmICsgbGVuIC0gMSAqIDMy
KTsKICAKICAgIC8vIHByaW50ZigiRW5kIG9mIGJ1ZmZlcl96ZXJvX2F2eDJcbiIpOwogICAgcmV0
dXJuIF9tbTI1Nl90ZXN0el9zaTI1Nih0LCB0KTsKfQoKc3RhdGljIF9faW5saW5lX18gdV9pbnQ2
NF90IApzdGFydF9jbG9jaygpIHsKICAgIC8vIFNlZTogSW50ZWwgRG9jICMzMjQyNjQsICJIb3cg
dG8gQmVuY2htYXJrIENvZGUgRXhlY3V0aW9uIFRpbWVzIG9uIEludGVsLi4uIiwKICAgIHVfaW50
MzJfdCBoaSwgbG87CiAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoCiAgICAgICAgIkNQVUlEXG5c
dCIKICAgICAgICAiUkRUU0Ncblx0IgogICAgICAgICJtb3YgJSVlZHgsICUwXG5cdCIKICAgICAg
ICAibW92ICUlZWF4LCAlMVxuXHQiOiAiPXIiIChoaSksICI9ciIgKGxvKTo6CiAgICAgICAgIiVy
YXgiLCAiJXJieCIsICIlcmN4IiwgIiVyZHgiKTsKICAgIHJldHVybiAoICh1X2ludDY0X3QpbG8p
IHwgKCAoKHVfaW50NjRfdCloaSkgPDwgMzIpOwp9CgpzdGF0aWMgX19pbmxpbmVfXyB1X2ludDY0
X3QgCnN0b3BfY2xvY2soKSB7CiAgICAvLyBTZWU6IEludGVsIERvYyAjMzI0MjY0LCAiSG93IHRv
IEJlbmNobWFyayBDb2RlIEV4ZWN1dGlvbiBUaW1lcyBvbiBJbnRlbC4uLiIsCiAgICB1X2ludDMy
X3QgaGksIGxvOwogICAgX19hc21fXyBfX3ZvbGF0aWxlX18oCiAgICAgICAgIlJEVFNDUFxuXHQi
CiAgICAgICAgIm1vdiAlJWVkeCwgJTBcblx0IgogICAgICAgICJtb3YgJSVlYXgsICUxXG5cdCIK
ICAgICAgICAiQ1BVSURcblx0IjogIj1yIiAoaGkpLCAiPXIiIChsbyk6OgogICAgICAgICIlcmF4
IiwgIiVyYngiLCAiJXJjeCIsICIlcmR4Iik7CiAgICByZXR1cm4gKCAodV9pbnQ2NF90KWxvKSB8
ICggKCh1X2ludDY0X3QpaGkpIDw8IDMyKTsKfQoKCg==
--000000000000d697c505c7d4a4eb--


