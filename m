Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66D7607676
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 13:49:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqX2-0002sJ-Gl
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:49:44 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqQL-00080c-K7
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olqQ0-0007nh-Ha
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 07:42:28 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olqPy-0002rO-9o
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 07:42:28 -0400
Received: by mail-il1-x12f.google.com with SMTP id l3so1458416ilg.13
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lq80FXX/W2kdR5/qyu1nWd3Sh7ywtol2Ikw6ohbMZbs=;
 b=z2hLdCOr1Q6aT8gkAJHUX+GxGrbv+g7KmvgiICD83/0WvwNExIo+9b9ioOGqfF3QBb
 J1qeKpp77xb9Te0rv5R+tXvJ5a/FzC/6kSNeFbz/kgRhLiFt8ceZVeD/ZH2E221rHW6m
 EuNSE6wwv5MDFSv0m0CVMhJnUev5lLpHQLl5xINwMEpVgWz8fRdLdoQmQLM9OK237XOM
 yywtNoELZ457SQkCL0FOaCN9jMTEgozAT66ZK8Duc1DJrZ5W/9TlJmmbCLpMdA3oQidm
 htBW10roRi0ShfiFQSE4HnrJm/y3hiQFypuQT3eot6oBvehb53iCqYM5tJ2xwDrUIVSM
 kD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lq80FXX/W2kdR5/qyu1nWd3Sh7ywtol2Ikw6ohbMZbs=;
 b=Ed/8l7iG561k3bvIOTAS5PUYV+4HH2XR3It4PRrvxHFR6LuUb2pyhw/chmXocVXvZm
 22wIwkR+DLxYGYt9egW1s1Qonv+/pTe5K3ijqn1AteVAF+2pTc9YQjo/zkSlNtyuBvRD
 5ZuYutHEd5GBVOcwOh5O23evy09FtEzR9jBFh+8Q7wLOZCoGXIrRRLa82g9CqaNk2OKw
 wWPyNt0pPwah1VyRsXRrL9G98AgqCUXTSyQdQCYT5b5i5AbjtnR+iXnL2E6ZgMl/qPOQ
 /r80bpKJELxDKb5l2Vo56Q4yAMVXIWt40mrvOJbGcvpF/5pVfsFeQmRBrz8EfBTkenGn
 2E6g==
X-Gm-Message-State: ACrzQf2xtlxqqCzYmC6F/fbgVG84oY24UYYIqdMn3ir81OlaSOsY8xl2
 fkF+95AY/sROBzAL9MHIF1LJp86I/CvB2tg8spEdDw==
X-Google-Smtp-Source: AMsMyM7+okT0M7hIdo8cjnwQ+eJteIwkEdPcjiJnOnljdePPHNqJChjvz4oAO1MhPhG816Vik5wyZh1p18omB5EsogY=
X-Received: by 2002:a05:6e02:dc6:b0:2f9:76bd:9f76 with SMTP id
 l6-20020a056e020dc600b002f976bd9f76mr14265690ilj.259.1666352538543; Fri, 21
 Oct 2022 04:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <20221021041731-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221021041731-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 21 Oct 2022 17:12:07 +0530
Message-ID: <CAARzgww8iQs7Czf0pCG-3JuaKTrf7qtx1buMf_U-J++f_FW1eg@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000021807305eb89efbc"
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--00000000000021807305eb89efbc
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 21, 2022 at 13:50 Michael S. Tsirkin <mst@redhat.com> wrote:

> On Fri, Oct 21, 2022 at 05:10:43AM +0530, Ani Sinha wrote:
> >
> >
> > On Fri, Oct 21, 2022 at 12:43 AM Michael S. Tsirkin <mst@redhat.com>
> wrote:
> >
> >     On Thu, Oct 20, 2022 at 06:20:20PM +0530, Ani Sinha wrote:
> >     > On Thu, Oct 20, 2022 at 6:15 PM Michael S. Tsirkin <mst@redhat.com
> >
> >     wrote:
> >     > >
> >     > > On Thu, Oct 20, 2022 at 06:12:10PM +0530, Ani Sinha wrote:
> >     > > > On Thu, Oct 20, 2022 at 6:08 PM Michael S. Tsirkin <
> mst@redhat.com>
> >     wrote:
> >     > > > >
> >     > > > > On Thu, Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha wrote:
> >     > > > > >
> >     > > > > >
> >     > > > > > Changelog:
> >     > > > > > v6:
> >     > > > > >   - skip test when dependencies (xorriso for example) are
> not
> >     installed.
> >     > > > > >   - skip test when run on a platform other than x86_64.
> >     > > > >
> >     > > > > Hmm why is that btw?
> >     > > >
> >     > > > The bits binaries that generate the iso (grub-mkrescue etc)
> are built
> >     > > > for and are known to work only on x86_64 platform. They might
> also
> >     > > > work on amd64 but I do not have one at my disposal at the
> moment to
> >     > > > check.
> >     > > > On other platforms, for example 32 bit x86 and non-x86, those
> >     binaries
> >     > > > will likely not work. The test will fail.
> >     > >
> >     > > confused. I thought we are distributing the iso?
> >     >
> >     > No, the test builds the iso after adding the modified test scripts
> and
> >     > then spawns the vm with it. It is all part of the test itself.
> >     > We need to do that so that the iso contains the newly added tests
> etc.
> >
> >     It's good to have for people developing tests, but for most qemu
> >     developers please just have a ready iso and have avocado fetch it.
> >     It's important to make tests run on all platforms.
> >
> >
> > This changes things a lot and goes down the path of where do we check in
> test
> > code changes? Do we deal with multiple repos? Where do we keep iso? Etc.
> having
> > a static iso limits us also.
>
> It's the same as any firmware really. I don't see much of a difference.


Except that the iso is much larger than the current edk2 binaries and there
are serious objections to keeping them along with other bios binary blobs
in qemu repo.

--00000000000021807305eb89efbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 21, 2022 at 13:50 Michael S. Tsirkin &lt;<a hre=
f=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Fri, Oct 21, 2022 at 05:10:43AM +0530, Ani Sinha =
wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Oct 21, 2022 at 12:43 AM Michael S. Tsirkin &lt;<a href=3D"mai=
lto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Oct 20, 2022 at 06:20:20PM +0530, Ani Sinha=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Oct 20, 2022 at 6:15 PM Michael S. Tsi=
rkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; On Thu, Oct 20, 2022 at 06:12:10PM +0530,=
 Ani Sinha wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; On Thu, Oct 20, 2022 at 6:08 PM Mich=
ael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@=
redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; On Thu, Oct 20, 2022 at 06:04:5=
6PM +0530, Ani Sinha wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; Changelog:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; v6:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0- skip test wh=
en dependencies (xorriso for example) are not<br>
&gt;=C2=A0 =C2=A0 =C2=A0installed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0- skip test wh=
en run on a platform other than x86_64.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; Hmm why is that btw?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; The bits binaries that generate the =
iso (grub-mkrescue etc) are built<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; for and are known to work only on x8=
6_64 platform. They might also<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; work on amd64 but I do not have one =
at my disposal at the moment to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; check.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; On other platforms, for example 32 b=
it x86 and non-x86, those<br>
&gt;=C2=A0 =C2=A0 =C2=A0binaries<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; will likely not work. The test will =
fail.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; confused. I thought we are distributing t=
he iso?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; No, the test builds the iso after adding the m=
odified test scripts and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; then spawns the vm with it. It is all part of =
the test itself.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; We need to do that so that the iso contains th=
e newly added tests etc.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It&#39;s good to have for people developing tests, =
but for most qemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0developers please just have a ready iso and have av=
ocado fetch it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0It&#39;s important to make tests run on all platfor=
ms.<br>
&gt; <br>
&gt; <br>
&gt; This changes things a lot and goes down the path of where do we check =
in test<br>
&gt; code changes? Do we deal with multiple repos? Where do we keep iso? Et=
c. having<br>
&gt; a static iso limits us also.=C2=A0<br>
<br>
It&#39;s the same as any firmware really. I don&#39;t see much of a differe=
nce.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Except that =
the iso is much larger than the current edk2 binaries and there are serious=
 objections to keeping them along with other bios binary blobs in qemu repo=
.</div><div dir=3D"auto"><br></div></div></div>

--00000000000021807305eb89efbc--

