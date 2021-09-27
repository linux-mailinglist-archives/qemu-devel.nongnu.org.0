Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA05419FF8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 22:16:07 +0200 (CEST)
Received: from localhost ([::1]:53838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUx2j-0007u1-38
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 16:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUwzm-0005EX-00
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 16:13:02 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:46867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUwzj-0002kR-W5
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 16:13:01 -0400
Received: by mail-ua1-x92b.google.com with SMTP id x19so1792036uai.13
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 13:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tmuud6kHYligcrx9A8V2CiFbLKfbBExwiuzrHS9gKes=;
 b=as/QKe3QUIksWBmDdgdZfpOkXwqNEvBq4XUzcAsS7AdnTuaDscpMCbKqn2/2dDsZ2A
 RJZ1nClD/44911VAaQQqEbGBV+e6r+RWYXERO+nF4d5df9+TfFKKssVrQD9E0p2qSmjQ
 3+tVMLfAtb5Jtwq0i6LVpVzu7DdXx92UydTVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmuud6kHYligcrx9A8V2CiFbLKfbBExwiuzrHS9gKes=;
 b=r1L9w9hx4F0PIV3y+SGYD7U5+AVvZpBp1fDM8BCwQhnfkBhfRce0W3rF4nU7ldj802
 +a1qDzSvwvwatWSwut7LRO4vmP4xdRBdEjZncRl/OWcsvNJppL7MXDOk9nCxalPNpztt
 QJ8Un+310Wpv2JzUClTe5NeZakBlYm+tn1ygdiuM1Ul4y6NC2OKNjiJOUgG/0mB1spon
 nDmgEmw+FXO8O65WGyNkzXYuETIIbv3oIvEsIkKxWmz0wvhZ3bfjuyWIfT29CYH/FSu9
 EmooVxOKRls9wXfX4dcS1J0CxSBVjpSjtb3qWQUYhLDhucWx6vxIyLL08C85vEI1mIas
 HuSg==
X-Gm-Message-State: AOAM531G40IGi3qVvTiMzlw4pJmiPRkvpcoEA9bsmlcoB6RrH7sTGnAJ
 zt9s/e+lUL8x2WmjYRadUZhBxdfgl4fAXXD0lxhk5Q==
X-Google-Smtp-Source: ABdhPJwQuctSwLaKWyj6uoVUQtcByYqqITwQ9E56WMXwF5yaOvKvyrwjPqXCD80f0s3GEExldiUWjNNJziiwUbsfY/8=
X-Received: by 2002:ab0:4a19:: with SMTP id q25mr1926847uae.143.1632773577552; 
 Mon, 27 Sep 2021 13:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
 <CAPnjgZ2S7SXxHYd_bkcf+GcmmgEew3vpJkw+DRPqrpb44eLgcA@mail.gmail.com>
 <CAFEAcA-bk6PF_P3JOxQSCXo7Fh2K5AVygB9WwDUiK2fV9Fx5jw@mail.gmail.com>
In-Reply-To: <CAFEAcA-bk6PF_P3JOxQSCXo7Fh2K5AVygB9WwDUiK2fV9Fx5jw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 27 Sep 2021 14:12:46 -0600
Message-ID: <CAPnjgZ26gQVpzL6fYsGzDf=c+z4aG5SPkBf7yoDC9+ynxQi_9Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=sjg@google.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Mon, 27 Sept 2021 at 10:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 27 Sept 2021 at 17:04, Simon Glass <sjg@chromium.org> wrote:
> > On Mon, 27 Sept 2021 at 09:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > > My take is that this is u-boot doing weird custom things with
> > > the DTB that aren't "describe the hardware". You should be able
> > > to boot u-boot by putting those custom DTB extra things in a
> > > separate blob and having u-boot combine that with the
> > > actual DTB when it starts.
> >
> > Well this is how U-Boot works. Since it doesn't have a user-space
> > program to provide configuration / policy, nor a command line to
> > provide parameters (except with sandbox[1]), device tree is what it
> > uses. All of its driver model and configuration comes from there The
> > 'describe the hardware' thing has been discussed to death but U-Boot
> > needs board- and arch-specific policy information about the hardware
> > so it can actually boot successfully on real systems.
> >
> > It has been like this since U-Boot started using device tree, some 9
> > years ago! I can't imagine it changing.
>
> > As to a separate blob, isn't that what I am suggesting with this
> > patch? QEMU doesn't support passing two separate dtb blobs to U-Boot,
> > nor is there an API for that.
>
> You're suggesting "QEMU should have machinery for taking two
> blobs and combining them and passing one blob to the guest".
> I'm suggesting "the guest should combine them" (and the second
> blob could be provided via several different existing mechanisms
> that amount to 'QEMU provides some ways to load data into guest
> ROM or RAM'), because as far as I know no other guest has this
> "combine two different bits of dtb for me" requirement.

I think you are misunderstanding my patch and that may be the problem here.

Where QEMU is provided with a dtb (-dtb) it uses that and passes it
on. This is absolutely fine and I have tested that this works well
with U-Boot. No issues.

Where QEMU creates its own dtb on the fly the -dtb parameter is
actually ignored and there is no way to adjust what QEMU passes on,
without recompiling QEMU. It is quite inflexible, actually. Even just
creating a new device for development purposes is not possible. That
is the problem I am trying to solve.

There is certainly no intent to combine two bits of dtb with my patch.
We could easily do that externally to QEMU.

The only current working option is to just pass the U-Boot dtb through
and not use QEMU's on-the-fly-generated dtb at all. But I am assuming
there is a reason why QEMU generates that dtb, so that would not be
desirable?

>
> > Even if we did that it would require
> > code very early in U-Boot to process, which would make it infeasible
> > for anything other than QEMU. Ideally QEMU should work the same way as
> > other boards.
>
> Well, real hardware doesn't provide device tree blobs of any
> form to u-boot, right? u-boot is just compiled into flash, or
> perhaps launched from some other boot ROM, as I understand it.
> Where does it get its dtb from then ?

The dtb is compiled as part of the U-Boot build. but exists as a
separate file. The mechanism for providing the dtb to U-Boot at
runtime is somewhat board-specific and we are working on standardising
it more. On the rpi for example, it is provided by a FAT file system
and first-stage firmware loads that and passes it along to U-Boot.
Some systems use TF-A which does a similar thing. Some use U-Boot as a
first-stage loader in which case SPL may select a DTB (out of many
built by the build) to pass to U-Boot proper.

There is also a tool called binman which packages the firmware as it
is getting quite complicated:

https://u-boot.readthedocs.io/en/latest/develop/package/binman.html

>
> > As a related point, I am looking at how we pass things between
> > firmware components.  If we wanted to pass in some initiate state in
> > some sort of blob, is it possible to set that up in memory (along with
> > the binary) for when QEMU starts emulating? The code and RAM might be
> > quite a long way apart so using a single image would involve a lot of
> > zeroes.
>
> The generic-loader is quite good for this sort of thing:
> https://qemu-project.gitlab.io/qemu/system/generic-loader.html
> You can load raw data files to specific addresses; or you can
> load ELF files (which can have multiple segments which get loaded
> as the ELF header specifies). You can specify -device generic-loader,...
> as many times as you need to to load multiple blobs.

OK great, thank you, that looks very useful.

One more question...other than dtb, does QEMU typically add support
for data structures needed by particular projects or groups of
projects? It looks like dtb was supported for ARM Linux originally? I
am looking at supporting bloblist as a way of communicating
information between firmware (basically a simple way of packaging
multiple blobs).

https://github.com/ni/u-boot/blob/master/doc/README.bloblist

Regards,
Simon

