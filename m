Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C5E419886
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:07:37 +0200 (CEST)
Received: from localhost ([::1]:45170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtAG-0007qj-92
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUt7C-0005Xs-Ih
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:04:26 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33]:41499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUt7A-0005Fr-HD
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:04:26 -0400
Received: by mail-vk1-xa33.google.com with SMTP id h132so7159382vke.8
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=86gAeL3dgvM6du55wK6RIpxb6dmdn7na3uRj0dt5YNY=;
 b=HzClwCdHLQ0P/54Lw/LL2jS4sPdwzqZ6o940q2K96pgWG0E7xjixJdKvPMTqoL+gCz
 H+nBOcaw3zOPr8/iYG5PxBSnjZnlL5xR2rNZc/1uKNvXXVl9ooWTUHMo4N6HjgWzCKld
 djeRQhVexPlNvsnaGH5j1xaDrLUc4cf63x1sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86gAeL3dgvM6du55wK6RIpxb6dmdn7na3uRj0dt5YNY=;
 b=D0lYKaiKqn+J9e01Jes8YSdCJNQwWv8Nb8nCFgBcCbPQsR/3A9cR/+e7terxHYqtKU
 D5OHBuLBHnN1d7Wek43FClP7JpezArxc6s/d2LuN764em10DCht9oSTqspvFmmEQWa2a
 wALWrthDVRttkWGriiKEzW6JdrD/R3neBuWw7qx3PfHBILXyfip4ZIhGQHNMqZx0gsJ9
 40yZPVEoJCL6pNG9i6omkQ/esrVEQu6PtZad9pLVzq9QKIy69/pTLUOeQV64mzbh1iSD
 uQ9iZG5cSLxoKkoT3r7X6Hs7FalCTyzXjtFM6WZWWA1J9RVNE0lTGa96cS+U6qnb3frk
 ehmg==
X-Gm-Message-State: AOAM530mjZW2aScoV8DKjSBEhc974dkCrL6ZniGvMb+U2sdmcMfpCK9w
 Rt8L/YEoddSWuirIQZSPQmWeBeSz2Qg6+3CvqKTjFA==
X-Google-Smtp-Source: ABdhPJze3U/i3zgkT4Jp12+zPKSDyJOm2DkZxDIfW+qkKtsPs8jQXAB3nbxVVl5fJF4VwYyfG1l0rdKrOFR1VW3c+Pc=
X-Received: by 2002:a05:6122:1681:: with SMTP id 1mr597411vkl.9.1632758661985; 
 Mon, 27 Sep 2021 09:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
In-Reply-To: <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 27 Sep 2021 10:04:10 -0600
Message-ID: <CAPnjgZ2S7SXxHYd_bkcf+GcmmgEew3vpJkw+DRPqrpb44eLgcA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=sjg@google.com; helo=mail-vk1-xa33.google.com
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

On Mon, 27 Sept 2021 at 09:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 27 Sept 2021 at 16:18, Simon Glass <sjg@chromium.org> wrote:
> > On Mon, 27 Sept 2021 at 02:48, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > So what is missing in the QEMU-provided DTB that it needs?
> >
> > Quite a lot. Here are some examples:
> >
> > U-Boot has limited pre-relocation memory so tries to avoid
> > binding/probing devices that are not used before relocation:
> >
> > https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.html#pre-relocation-support
>
> It's up to u-boot to decide what it wants to touch and
> what it does not. QEMU tells u-boot what all the available
> devices are; I don't think we should have extra stuff saying
> "and if you are u-boot, do something odd".

Do you have familiarity with U-Boot and the space constraints of
embedded systems?

>
> > There is a configuration node (which is likely to change form in
> > future releases, but will still be there)
> >
> > https://github.com/u-boot/u-boot/blob/master/doc/device-tree-bindings/config.txt
>
> I think u-boot should be storing this kind of thing somewhere
> else (e.g. as part of the binary blob that is u-boot itself,
> or stored in flash or RAM as a separate blob).
>
> > Then there are various features which put things in U-Boot's control
> > dtb, such as verified boot, which adds public keys during signing:
> >
> > https://github.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signature.txt#L135
> >
> > More generally, the U-Boot tree has hundreds of files which add
> > properties for each board, since we try to keep the U-Boot-specific
> > things out of the Linux tree:
> >
> > $ find . -name *u-boot.dtsi |wc -l
> > 398
>
> If any of this is actual information about the hardware then you
> should sort out getting the bindings documented officially
> (which I think is still in the Linux tree), and then QEMU can
> provide them.
>
> > Quite a bit of this is to do with SPL and so far it seems that QEMU
> > mostly runs U-Boot proper only, although I see that SPL is starting to
> > creep in too in the U-Boot CI.
> >
> > So at present QEMU is not able to support U-Boot fully.
>
> My take is that this is u-boot doing weird custom things with
> the DTB that aren't "describe the hardware". You should be able
> to boot u-boot by putting those custom DTB extra things in a
> separate blob and having u-boot combine that with the
> actual DTB when it starts.

Well this is how U-Boot works. Since it doesn't have a user-space
program to provide configuration / policy, nor a command line to
provide parameters (except with sandbox[1]), device tree is what it
uses. All of its driver model and configuration comes from there The
'describe the hardware' thing has been discussed to death but U-Boot
needs board- and arch-specific policy information about the hardware
so it can actually boot successfully on real systems.

It has been like this since U-Boot started using device tree, some 9
years ago! I can't imagine it changing.

As to a separate blob, isn't that what I am suggesting with this
patch? QEMU doesn't support passing two separate dtb blobs to U-Boot,
nor is there an API for that. Even if we did that it would require
code very early in U-Boot to process, which would make it infeasible
for anything other than QEMU. Ideally QEMU should work the same way as
other boards.

As a related point, I am looking at how we pass things between
firmware components.  If we wanted to pass in some initiate state in
some sort of blob, is it possible to set that up in memory (along with
the binary) for when QEMU starts emulating? The code and RAM might be
quite a long way apart so using a single image would involve a lot of
zeroes.

Regards,
Simon

[1] https://u-boot.readthedocs.io/en/latest/arch/sandbox.html

