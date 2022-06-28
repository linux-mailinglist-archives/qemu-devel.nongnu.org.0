Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D07255E522
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:58:16 +0200 (CEST)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BjL-0002NZ-Hd
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o6Bf1-0006eb-8b
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:53:47 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o6Bez-0007og-0t
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:53:46 -0400
Received: by mail-ed1-x52b.google.com with SMTP id ej4so17692503edb.7
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HFsJxs9BNWQHudKr/kCHACvCzVH1R++EQnHWkrdk5M=;
 b=g8VqVFHh5CoMN1lQFr313v0GcRWFRMHQ8mOPvtWT5yOyM9u7BuaVFHBxTdVSU+BQuK
 DjAEjBwsh9+Dx+Mx770hahdB6uPAXOl4K/K5TfqI6OriGyaTAoBi4o/yuCo7nHymbWWp
 zcDStGeHRYqTEYzuSm0znj2scSBpBc3jx2jYOCdJ3/Fu9inrPaFVf/bLVTW/F1elHYYd
 OCMkrMl9m+0NKu9ap5dyF8HK31mmWzd5nQv1GWMWCIQDQdB/pEGQj+hGjSl8jcLXZi7u
 JoQv2X3LzXRGxFPS3L+V1yEiluDAuSvVg64c5Fn9sVuLSLK50OnfYuIuTnsnlT4/NN0A
 cQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HFsJxs9BNWQHudKr/kCHACvCzVH1R++EQnHWkrdk5M=;
 b=0Y8YPKChVScNIaWi66UCX5d/FsJjjTMuX/dXnzEJ7GPUWHb1wFBTb9LzHZ9zAN91pg
 VOz/MPGGmItf8UWBRycfwojMu5kE0TArKJkGqII1i4BP1PXIBzYD2Ga/N1nujdFF/i5J
 xx/tL69w32SvWAYxvxXGpoTJKzCL6xOdupdbqUtAGGsv0MFlRFkFoBtYBE2n+ENNNfT7
 LZzmFsp1sUy+z5BY/SiCzi0LZx6EaIdShgFLf1ELZDrjCGrv0xfNhMx3EplQdOuswml6
 fFYEiPBybjsAqipANFc0jrHDLbdlQ6rGH+l0tgb08RSAxHwFmYL07a48FnSQlJpx6UkC
 IRjw==
X-Gm-Message-State: AJIora/4kAgAGQov28QFDwF0YsxB4seVy+DJtBXAT7rvNnVF6UzcGmov
 E/ULnIpoG6hAbGid3Y7YxP6v3H6HUib/wVeVQqU/9g==
X-Google-Smtp-Source: AGRyM1s5iy7WUxg9PQD8TVL8VdnUNunD33RMinXIE43xOWVeF8Ee4Cf/PC02VJ/wgotpA9VscurlGWDRuDkcMhq/MfY=
X-Received: by 2002:a05:6402:2708:b0:435:da6f:3272 with SMTP id
 y8-20020a056402270800b00435da6f3272mr22783083edd.160.1656424423030; Tue, 28
 Jun 2022 06:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com> <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com> <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
 <Yrr6VDCuKpp8SqW9@redhat.com>
 <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
 <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
In-Reply-To: <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 19:23:32 +0530
Message-ID: <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005513a005e2825d3a"
Received-SPF: none client-ip=2a00:1450:4864:20::52b;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

--0000000000005513a005e2825d3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2022 at 19:15 Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 28 Jun 2022 at 14:23, Ani Sinha <ani@anisinha.ca> wrote:
> > On Tue, Jun 28, 2022 at 6:25 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> wrote:
> > > This proposed biosbits test also involves a considerable download.
> >
> > I do not think 50 MB is "considerable" . Last time I tried to run
> > avocado tests, my laptop ran out of disk space!
>
> I think 50MB is pretty big. It might be smaller than some other
> avocado tests, but it's not exactly the "no binary involved"
> that most qtests are.


Well bios-tables-test uses the binary blobs of the acpi tables. Only
difference is that in this case, we could maintain them within  the qemu
tree. In this case the blob in slightly larger and comes from a third
party. That is the difference.



>
> > > The test is said to be irrelevant for anyone except those working
> > > on a fairly narrow set of QEMU firmware related bits.
> >
> > Well ok that is just a bad argument. You can say the same thing for
> > most qtests. In fact, that is why most qtetes can run directly simply
> > by passing QTEST_QEMU_BINARY in the environment. No need to go through
> > make check. Same with the bits test. It can be run directly.
>
> 'make check' is generally the small, fast, no-binary-blobs tests.


See above.


> Very few 'make check' tests even run code in the guest.


So bits test is similar here. It runs code in the guest vm.


>
> > So by the same
> > > rationale we shouldn't impose that burden on everyone working on
> > > QEMU by having it in qtest.
> >
> > So why burden everyone by having bios-tables-test when it only affects
> > acpi/smbios developers?
>
> Because it's small and fast and doesn't have a binary blob to download.
>
> There are definitely some awkwardnesses with 'check-avocado',
> but we should work on fixing those, not use them as a reason
> to refuse to put tests into the avocado tests if that's where
> they fit best.


I think this test fits best in the qtrst not with the integration test
framework. Very few path developers will ever run it and wrote new tests
for it if we have it there. I would be terribly discouraged if that=E2=80=
=99s where
this test landed.


>
> -- PMM
>

--0000000000005513a005e2825d3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 28, 2022 at 19:15 Peter Maydell &lt;<a href=3D"=
mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Tue, 28 Jun 2022 at 14:23, Ani Sin=
ha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank">ani@anisinha.ca=
</a>&gt; wrote:<br>
&gt; On Tue, Jun 28, 2022 at 6:25 PM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt; =
wrote:<br>
&gt; &gt; This proposed biosbits test also involves a considerable download=
.<br>
&gt;<br>
&gt; I do not think 50 MB is &quot;considerable&quot; . Last time I tried t=
o run<br>
&gt; avocado tests, my laptop ran out of disk space!<br>
<br>
I think 50MB is pretty big. It might be smaller than some other<br>
avocado tests, but it&#39;s not exactly the &quot;no binary involved&quot;<=
br>
that most qtests are.</blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Well bios-tables-test uses the binary blobs of the acpi tables. Only d=
ifference is that in this case, we could maintain them within =C2=A0the qem=
u tree. In this case the blob in slightly larger and comes from a third par=
ty. That is the difference.=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; &gt; The test is said to be irrelevant for anyone except those working=
<br>
&gt; &gt; on a fairly narrow set of QEMU firmware related bits.<br>
&gt;<br>
&gt; Well ok that is just a bad argument. You can say the same thing for<br=
>
&gt; most qtests. In fact, that is why most qtetes can run directly simply<=
br>
&gt; by passing QTEST_QEMU_BINARY in the environment. No need to go through=
<br>
&gt; make check. Same with the bits test. It can be run directly.<br>
<br>
&#39;make check&#39; is generally the small, fast, no-binary-blobs tests.</=
blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">See above.</div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
Very few &#39;make check&#39; tests even run code in the guest.</blockquote=
><div dir=3D"auto"><br></div><div dir=3D"auto">So bits test is similar here=
. It runs code in the guest vm.</div><div dir=3D"auto"><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; So by the same<br>
&gt; &gt; rationale we shouldn&#39;t impose that burden on everyone working=
 on<br>
&gt; &gt; QEMU by having it in qtest.<br>
&gt;<br>
&gt; So why burden everyone by having bios-tables-test when it only affects=
<br>
&gt; acpi/smbios developers?<br>
<br>
Because it&#39;s small and fast and doesn&#39;t have a binary blob to downl=
oad.<br>
<br>
There are definitely some awkwardnesses with &#39;check-avocado&#39;,<br>
but we should work on fixing those, not use them as a reason<br>
to refuse to put tests into the avocado tests if that&#39;s where<br>
they fit best.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I =
think this test fits best in the qtrst not with the integration test framew=
ork. Very few path developers will ever run it and wrote new tests for it i=
f we have it there. I would be terribly discouraged if that=E2=80=99s where=
 this test landed.</div><div dir=3D"auto"><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex" dir=3D"auto"><br>
<br>
-- PMM<br>
</blockquote></div></div>

--0000000000005513a005e2825d3a--

