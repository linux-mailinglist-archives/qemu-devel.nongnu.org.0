Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D39A606C6E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 02:19:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olfkk-00027X-HE
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 20:19:10 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olfhW-0006R6-8e
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 20:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olfhF-0006GH-Vk
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 20:15:34 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olfhC-0000qL-FF
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 20:15:32 -0400
Received: by mail-io1-xd2d.google.com with SMTP id q196so1001146iod.8
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 17:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OInOlOWE1kd6p/LXGTN59d2zkwJPGCDpc12zPMZLyRI=;
 b=llxZRUFn3xg3IRcwmoRf3AI5thVLEoic5Ee8pqONGa/8SKxT30YT9uoAgyKODvCecq
 DKYYgKTy3xTV7ThDSnKq+en7x5KXb7m+qNQEMcIRwPLJZ0U2qWrUoo9BHZF5MrkBLTOx
 hUHSR5/3Bgj9zlwrrcCBZYdEu74dASjGK7/39VSkB68o4fUfBF3+wuo+YrZuidUaLcfb
 FuckOV51L9e4QLyPW01iXTHpVqua5Ld9hOmBzyg5v75InyXyVOqGbeyye9UpKzKvddtw
 i448YPgs7jpliXf/N2pXxvGKbnnRYJwz21YdUX1/Q0XdCIuQie5T7jQKRXrIeN50xfH1
 W8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OInOlOWE1kd6p/LXGTN59d2zkwJPGCDpc12zPMZLyRI=;
 b=y2/f74EggMCQ5fBaVG78/ZYXVyCR0sHnXnEXh62hLYGBsP6wxH/LIpqw1+gAMvr4Bb
 TqXbVQ8/qYsyviFaLoMYnjxl3o+1v/WK/9O+gaPhNLepNX+AiB9Mc3sE1RYX+VjvhqoQ
 Ge1XxlzJjfllgYMRjsaZv/YCq4J3G6UoCeJrxrvr36UWKOk+AqM9kdP2yjxB6RFFycEB
 iwej+Z2eet/hBXxS46wO1deyD/AimJfBYBPLo/uzmj+lZtSfUgHj9vqVRMRMSTqfKZsy
 daU7GFwVm88gn1fghKp0w1N4/EyuTi7dBDOJBo4E/4RvLu7WMXY5LmeJS5VWtgV9448X
 DAcw==
X-Gm-Message-State: ACrzQf2nv60SCGVukm9oCkdo1EP+vVhYnQpDEQbejvfs258Gx4yCqnLM
 T3khJGwtSIfwJL3n2GL+bw2BxfEVlO7Vbdp6GwouCw==
X-Google-Smtp-Source: AMsMyM7y/WZgJHbCsPQrSB8VZQ6OltIhk/qslOxBwNPc6ufyVubnqUdCINFIlGw11H3gr/3i5Al4gMsc5OraXP8vbgE=
X-Received: by 2002:a02:cc55:0:b0:364:ef:c546 with SMTP id
 i21-20020a02cc55000000b0036400efc546mr11489189jaq.265.1666311326527; 
 Thu, 20 Oct 2022 17:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
In-Reply-To: <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 21 Oct 2022 05:45:15 +0530
Message-ID: <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000b40e6405eb805666"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2d.google.com
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

--000000000000b40e6405eb805666
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 21, 2022 at 5:10 AM Ani Sinha <ani@anisinha.ca> wrote:

>
>
> On Fri, Oct 21, 2022 at 12:43 AM Michael S. Tsirkin <mst@redhat.com>
> wrote:
>
>> On Thu, Oct 20, 2022 at 06:20:20PM +0530, Ani Sinha wrote:
>> > On Thu, Oct 20, 2022 at 6:15 PM Michael S. Tsirkin <mst@redhat.com>
>> wrote:
>> > >
>> > > On Thu, Oct 20, 2022 at 06:12:10PM +0530, Ani Sinha wrote:
>> > > > On Thu, Oct 20, 2022 at 6:08 PM Michael S. Tsirkin <mst@redhat.com>
>> wrote:
>> > > > >
>> > > > > On Thu, Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha wrote:
>> > > > > >
>> > > > > >
>> > > > > > Changelog:
>> > > > > > v6:
>> > > > > >   - skip test when dependencies (xorriso for example) are not
>> installed.
>> > > > > >   - skip test when run on a platform other than x86_64.
>> > > > >
>> > > > > Hmm why is that btw?
>> > > >
>> > > > The bits binaries that generate the iso (grub-mkrescue etc) are
>> built
>> > > > for and are known to work only on x86_64 platform. They might also
>> > > > work on amd64 but I do not have one at my disposal at the moment to
>> > > > check.
>> > > > On other platforms, for example 32 bit x86 and non-x86, those
>> binaries
>> > > > will likely not work. The test will fail.
>> > >
>> > > confused. I thought we are distributing the iso?
>> >
>> > No, the test builds the iso after adding the modified test scripts and
>> > then spawns the vm with it. It is all part of the test itself.
>> > We need to do that so that the iso contains the newly added tests etc.
>>
>> It's good to have for people developing tests, but for most qemu
>> developers please just have a ready iso and have avocado fetch it.
>> It's important to make tests run on all platforms.
>
>
> This changes things a lot and goes down the path of where do we check in
> test code changes? Do we deal with multiple repos? Where do we keep iso?
> Etc. having a static iso limits us also.
>
> If we can think through and come up with a consensus, I can write a second
> test. Else let's just go with this first. If we are really keen on running
> tests on multiple platforms, we can have binaries built for those.
>

And have multiple platform specific branches in bits that have fixes for
those platforms so that bits can run there. Plus the existing test can be
enhanced to pull in binaries from those branches based on the platform on
which it is being run.

--000000000000b40e6405eb805666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 21, 2022 at 5:10 AM Ani Sinha &lt;<a href=3D"ma=
ilto:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 21, 2022 at 12:43 AM Michael S.=
 Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Oct 20,=
 2022 at 06:20:20PM +0530, Ani Sinha wrote:<br>
&gt; On Thu, Oct 20, 2022 at 6:15 PM Michael S. Tsirkin &lt;<a href=3D"mail=
to:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Oct 20, 2022 at 06:12:10PM +0530, Ani Sinha wrote:<br>
&gt; &gt; &gt; On Thu, Oct 20, 2022 at 6:08 PM Michael S. Tsirkin &lt;<a hr=
ef=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote=
:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha wro=
te:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Changelog:<br>
&gt; &gt; &gt; &gt; &gt; v6:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0- skip test when dependencies (xorriso=
 for example) are not installed.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0- skip test when run on a platform oth=
er than x86_64.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hmm why is that btw?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The bits binaries that generate the iso (grub-mkrescue etc) =
are built<br>
&gt; &gt; &gt; for and are known to work only on x86_64 platform. They migh=
t also<br>
&gt; &gt; &gt; work on amd64 but I do not have one at my disposal at the mo=
ment to<br>
&gt; &gt; &gt; check.<br>
&gt; &gt; &gt; On other platforms, for example 32 bit x86 and non-x86, thos=
e binaries<br>
&gt; &gt; &gt; will likely not work. The test will fail.<br>
&gt; &gt;<br>
&gt; &gt; confused. I thought we are distributing the iso?<br>
&gt; <br>
&gt; No, the test builds the iso after adding the modified test scripts and=
<br>
&gt; then spawns the vm with it. It is all part of the test itself.<br>
&gt; We need to do that so that the iso contains the newly added tests etc.=
<br>
<br>
It&#39;s good to have for people developing tests, but for most qemu<br>
developers please just have a ready iso and have avocado fetch it.<br>
It&#39;s important to make tests run on all platforms.</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">This changes things a lot and goes do=
wn the path of where do we check in test code changes? Do we deal with mult=
iple repos? Where do we keep iso? Etc. having a static iso limits us also.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">If we can think t=
hrough and come up with a consensus, I can write a second test. Else let&#3=
9;s just go with this first. If we are really keen on running tests on mult=
iple platforms, we can have binaries built for those.=C2=A0</div></div></di=
v></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">And have multi=
ple platform specific branches in bits that have fixes for those platforms =
so that bits can run there. Plus the existing test can be enhanced to pull =
in binaries from those branches based on the platform on which it is being =
run.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div></div></d=
iv>

--000000000000b40e6405eb805666--

