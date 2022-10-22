Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B856097F6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 03:50:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omiVp-0002rz-79
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1omHc7-0006eV-La
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:44:47 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1omHc5-0001xQ-S6
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:44:47 -0400
Received: by mail-il1-x136.google.com with SMTP id l6so3220585ilq.3
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZXyR2j/KAh6B2KjTPd1vBEKVLKutZZXXiy66Vua5dL0=;
 b=owew1MWuk03uoUnBklq0MTtGIMn1yL0sqiBcOJct87zCgLcTnzOj+vmSgWOfgdypf9
 14ZF1F13qZjCzaxgK4zVd/y24t3lH/nf8fNNUJH0aGrMffb8PM3NftKlSA9CuJ7hli9m
 ELwLKDPIO0K0QD1RbxRj1EuIVIB12FX3speN9CVlA8dMq/4m2O2kjb/LOsl9neKCgjoc
 DeYzGMQMeHiQ3eL25Vh57bexY9BFAmtoI2K6dJntQr30xG+hcaBII7kBMe3uQq4eHV1C
 mhz+toaPTlOsgI2pOXZ8JnIculk3Kbi+7I75fwNiNG9QPgYqYfvcjgVoDsZeYC4DchUP
 bjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZXyR2j/KAh6B2KjTPd1vBEKVLKutZZXXiy66Vua5dL0=;
 b=w6Wlik5ey0uyESxCsvBlYuHGTREITbkuqSe6VRYGqodrJJhzDLa2OjgjxXifdRFKAX
 5UgEZ80BYAF0x1eQyKghL1KzFPvTOZdUeWUBn63v4SqTIMyQlc1OndGQns8mHnlkbsUx
 MgrE+YtfjVZue2iiv9ZtCfsdpejKa2owiIMHaBqVWENqQJP4tg2rVd3PPY4Z40mItiVI
 aKlS41xZoq98uXIWCT9oXcqwMyhxaF3IdVGcFZoQeOhtQ/v1008SZ3R7Qx54pvvmhLHt
 Z0jsqfTgN97YzVfVvcKNRrOPxD0Ix/CHv5FVSDygLVadJMyuGppPDT3L2rZSd/1rLsMJ
 jLIQ==
X-Gm-Message-State: ACrzQf2EQDN1MRetOxq/xo5l+TLWn5hNnxDiL9Kh1YFt58QPkxHrseuq
 6yM8jKAkGHhHZixCQF+5kFuYJrng08vMLR1iVqDSaQ==
X-Google-Smtp-Source: AMsMyM7p7sGV7R6G7D2GNG9/rcGFrF3mWgTB9mPEtXVCkai2s0IqIL56An2sQUC9DpruFghRRLjjIXLSSaQY++xI2eA=
X-Received: by 2002:a05:6e02:dc6:b0:2f9:76bd:9f76 with SMTP id
 l6-20020a056e020dc600b002f976bd9f76mr17499496ilj.259.1666457083348; Sat, 22
 Oct 2022 09:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <20221021041731-mutt-send-email-mst@kernel.org>
 <CAARzgww8iQs7Czf0pCG-3JuaKTrf7qtx1buMf_U-J++f_FW1eg@mail.gmail.com>
 <20221022124008-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221022124008-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Sat, 22 Oct 2022 22:14:32 +0530
Message-ID: <CAARzgwxCw0bOJFSzeSwnipEJZW+y8UCK2bU1m8ZBaweW026qAw@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="0000000000007ca3c705eba246e5"
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x136.google.com
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

--0000000000007ca3c705eba246e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 22, 2022 at 22:11 Michael S. Tsirkin <mst@redhat.com> wrote:

> On Fri, Oct 21, 2022 at 05:12:07PM +0530, Ani Sinha wrote:
> >
> >
> > On Fri, Oct 21, 2022 at 13:50 Michael S. Tsirkin <mst@redhat.com> wrote=
:
> >
> >     On Fri, Oct 21, 2022 at 05:10:43AM +0530, Ani Sinha wrote:
> >     >
> >     >
> >     > On Fri, Oct 21, 2022 at 12:43 AM Michael S. Tsirkin <
> mst@redhat.com>
> >     wrote:
> >     >
> >     >     On Thu, Oct 20, 2022 at 06:20:20PM +0530, Ani Sinha wrote:
> >     >     > On Thu, Oct 20, 2022 at 6:15 PM Michael S. Tsirkin <
> mst@redhat.com>
> >     >     wrote:
> >     >     > >
> >     >     > > On Thu, Oct 20, 2022 at 06:12:10PM +0530, Ani Sinha wrote=
:
> >     >     > > > On Thu, Oct 20, 2022 at 6:08 PM Michael S. Tsirkin <
> >     mst@redhat.com>
> >     >     wrote:
> >     >     > > > >
> >     >     > > > > On Thu, Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha
> wrote:
> >     >     > > > > >
> >     >     > > > > >
> >     >     > > > > > Changelog:
> >     >     > > > > > v6:
> >     >     > > > > >   - skip test when dependencies (xorriso for
> example) are
> >     not
> >     >     installed.
> >     >     > > > > >   - skip test when run on a platform other than
> x86_64.
> >     >     > > > >
> >     >     > > > > Hmm why is that btw?
> >     >     > > >
> >     >     > > > The bits binaries that generate the iso (grub-mkrescue
> etc) are
> >     built
> >     >     > > > for and are known to work only on x86_64 platform. They
> might
> >     also
> >     >     > > > work on amd64 but I do not have one at my disposal at t=
he
> >     moment to
> >     >     > > > check.
> >     >     > > > On other platforms, for example 32 bit x86 and non-x86,
> those
> >     >     binaries
> >     >     > > > will likely not work. The test will fail.
> >     >     > >
> >     >     > > confused. I thought we are distributing the iso?
> >     >     >
> >     >     > No, the test builds the iso after adding the modified test
> scripts
> >     and
> >     >     > then spawns the vm with it. It is all part of the test
> itself.
> >     >     > We need to do that so that the iso contains the newly added
> tests
> >     etc.
> >     >
> >     >     It's good to have for people developing tests, but for most
> qemu
> >     >     developers please just have a ready iso and have avocado fetc=
h
> it.
> >     >     It's important to make tests run on all platforms.
> >     >
> >     >
> >     > This changes things a lot and goes down the path of where do we
> check in
> >     test
> >     > code changes? Do we deal with multiple repos? Where do we keep
> iso? Etc.
> >     having
> >     > a static iso limits us also.
> >
> >     It's the same as any firmware really. I don't see much of a
> difference.
> >
> >
> > Except that the iso is much larger than the current edk2 binaries and
> there are
> > serious objections to keeping them along with other bios binary blobs i=
n
> qemu
> > repo.
> >
>
> Right, I get that. So avocado was supposed to know how to download them
> automatically, no?


Yea that=E2=80=99s the reason why we are using CI artifacts and telling avo=
cado to
download them from a specific URL.


>
> --
> MST
>
>

--0000000000007ca3c705eba246e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Oct 22, 2022 at 22:11 Michael S. Tsirkin &lt;<a hre=
f=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">On Fri, Oct 21, 2022 at 05:12:07PM +0530, Ani Sinha wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Oct 21, 2022 at 13:50 Michael S. Tsirkin &lt;<a href=3D"mailto=
:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Fri, Oct 21, 2022 at 05:10:43AM +0530, Ani Sinha=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Fri, Oct 21, 2022 at 12:43 AM Michael S. Ts=
irkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Oct 20, 2022 at 06:=
20:20PM +0530, Ani Sinha wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Oct 20, 2022 a=
t 6:15 PM Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; On Thu, Oct 20, 2=
022 at 06:12:10PM +0530, Ani Sinha wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; On Thu, Oct =
20, 2022 at 6:08 PM Michael S. Tsirkin &lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:mst@redhat.com" target=3D"_blank"=
>mst@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; On Thu,=
 Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; Ch=
angelog:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; v6=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0- skip test when dependencies (xorriso for example) are<br>
&gt;=C2=A0 =C2=A0 =C2=A0not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0installed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0- skip test when run on a platform other than x86_64.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; Hmm why=
 is that btw?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; The bits bin=
aries that generate the iso (grub-mkrescue etc) are<br>
&gt;=C2=A0 =C2=A0 =C2=A0built<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; for and are =
known to work only on x86_64 platform. They might<br>
&gt;=C2=A0 =C2=A0 =C2=A0also<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; work on amd6=
4 but I do not have one at my disposal at the<br>
&gt;=C2=A0 =C2=A0 =C2=A0moment to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; check.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; On other pla=
tforms, for example 32 bit x86 and non-x86, those<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0binaries<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; will likely =
not work. The test will fail.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; confused. I thoug=
ht we are distributing the iso?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; No, the test builds th=
e iso after adding the modified test scripts<br>
&gt;=C2=A0 =C2=A0 =C2=A0and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; then spawns the vm wit=
h it. It is all part of the test itself.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; We need to do that so =
that the iso contains the newly added tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0etc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0It&#39;s good to have for p=
eople developing tests, but for most qemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0developers please just have=
 a ready iso and have avocado fetch it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0It&#39;s important to make =
tests run on all platforms.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This changes things a lot and goes down the pa=
th of where do we check in<br>
&gt;=C2=A0 =C2=A0 =C2=A0test<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; code changes? Do we deal with multiple repos? =
Where do we keep iso? Etc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0having<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; a static iso limits us also.=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It&#39;s the same as any firmware really. I don&#39=
;t see much of a difference.<br>
&gt; <br>
&gt; <br>
&gt; Except that the iso is much larger than the current edk2 binaries and =
there are<br>
&gt; serious objections to keeping them along with other bios binary blobs =
in qemu<br>
&gt; repo.<br>
&gt; <br>
<br>
Right, I get that. So avocado was supposed to know how to download them<br>
automatically, no?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">Yea that=E2=80=99s the reason why we are using CI artifacts and telling a=
vocado to download them from a specific URL.=C2=A0</div><div dir=3D"auto"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
-- <br>
MST<br>
<br>
</blockquote></div></div>

--0000000000007ca3c705eba246e5--

