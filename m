Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D95941BD22
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 05:13:20 +0200 (CEST)
Received: from localhost ([::1]:54922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVQ23-00072m-BP
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 23:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mVPr2-0001UR-Er
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 23:01:56 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:36732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mVPr0-0008Us-Ci
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 23:01:56 -0400
Received: by mail-ua1-x92c.google.com with SMTP id u11so525826uaw.3
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 20:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/I8lKACSpMIYGQb9ziUE8Xs96OLh4I5ighrTPRvHutQ=;
 b=oe1T3jjHOENjLYHIf6iv2rCO0lKDn55yh4+lOH/byQkgteGK+VkU3JI5iDRGc/I/u5
 YsFYIoOeVpDBxLT/H5D1T3FUH04zjS6gMSwiVSlnKjYT0ZNQ18A1JDzdwmauG1yWJJ6C
 vAIfLVX7Y/16R6SV19gswrWD5wNRNT2ueLurk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/I8lKACSpMIYGQb9ziUE8Xs96OLh4I5ighrTPRvHutQ=;
 b=y9AHmEg/c+7eIF6WaZG7Tc2cER6jVD6Tmf6rzBwLiGYfoCerH3G7TaFgzZjUJWbfAQ
 o5K+IsThHTx0gSxYLSv9zjZwQpeX6HjTd/GChivO3s5WMpb6IpdI38LeyBlUx3dkSOQT
 Dg5dozzIRj9Bo2UGv8eXq0ZLWM6Z8XNg8s6YGcFCbjEB1L+/uaxrLNuKPjjMGl778OR3
 0MZMfyEswF5kRrxAaAR12rFYgCbAB+0YbkkhDs7WZ4/9nZySNuiU62mMBnk+bo2vMU+M
 VUrADoy3ecqhWptF8kfpCsHeMO9KZMRsybqBYnmOXA93JPh5Px1vEYiTjCYMu0TxzqJU
 b+XA==
X-Gm-Message-State: AOAM532FEGY7o3IdXNckYcYNhPqZLEJH2a9j2KJSIYAQNysd0Y3u6C7p
 zzEvoOV+xSQn9+agElniWXnjxybDu7lyKtaGm/NIQA==
X-Google-Smtp-Source: ABdhPJz4e0++A5pc/W6y3+EEcDCf4Ob+xsryRvSFfvKPKGW3nqjg/VAEactxPhVBtsy8rNtA5hU8Sw3IuUBd3myIzG0=
X-Received: by 2002:ab0:4a19:: with SMTP id q25mr8419074uae.143.1632884511970; 
 Tue, 28 Sep 2021 20:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
 <CAPnjgZ2S7SXxHYd_bkcf+GcmmgEew3vpJkw+DRPqrpb44eLgcA@mail.gmail.com>
 <CAFEAcA-bk6PF_P3JOxQSCXo7Fh2K5AVygB9WwDUiK2fV9Fx5jw@mail.gmail.com>
 <CAPnjgZ26gQVpzL6fYsGzDf=c+z4aG5SPkBf7yoDC9+ynxQi_9Q@mail.gmail.com>
 <CAFEAcA_QNcAHtdxUPLpmyzMYgb9YzhcE0-zyh=N8rqm4vOcGZA@mail.gmail.com>
In-Reply-To: <CAFEAcA_QNcAHtdxUPLpmyzMYgb9YzhcE0-zyh=N8rqm4vOcGZA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 28 Sep 2021 21:01:40 -0600
Message-ID: <CAPnjgZ0xMH+SSjQWGjynTLDDbg6tO=z+-eDbpDKV1gqo=bhqaQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=sjg@google.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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

On Tue, 28 Sept 2021 at 03:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 27 Sept 2021 at 21:12, Simon Glass <sjg@chromium.org> wrote:
> > I think you are misunderstanding my patch and that may be the problem here.
> >
> > Where QEMU is provided with a dtb (-dtb) it uses that and passes it
> > on. This is absolutely fine and I have tested that this works well
> > with U-Boot. No issues.
> >
> > Where QEMU creates its own dtb on the fly the -dtb parameter is
> > actually ignored and there is no way to adjust what QEMU passes on,
> > without recompiling QEMU. It is quite inflexible, actually. Even just
> > creating a new device for development purposes is not possible. That
> > is the problem I am trying to solve.
> >
> > There is certainly no intent to combine two bits of dtb with my patch.
> > We could easily do that externally to QEMU.
>
> So what *is* this patch doing? The subject says "Allow additions to
> the generated device tree", and the patch adds an option to
> "Merge a device tree binary (dtb) file into the generated device tree".
> That sounds exactly like "combine two bits of dtb" -- the one the
> user provides to the -dtbi option and the one QEMU generates
> internally.

Yes that's right, but as you say one of them is generated by QEMU. It
is fixing a problem caused by QEMU's generation of the device tree,
since it provides no wat to augment the device tree without my patch.

>
> > The only current working option is to just pass the U-Boot dtb through
> > and not use QEMU's on-the-fly-generated dtb at all. But I am assuming
> > there is a reason why QEMU generates that dtb, so that would not be
> > desirable?
>
> QEMU generates the dtb to tell the guest what hardware is
> present and where it is. We don't guarantee that that hardware
> arrangement is necessarily stable between QEMU versions (in
> practice there are generally additions and not deletions or
> moves, but in theory there might be). All the guest is supposed
> to assume is the location of RAM and flash; everything else it
> must look in the dtb to determine.

Yes, so that is going to severely limit the usefulness of the virtio
support, for example. But we can just ignore it for CI, I suppose,
since we can use fixed parameters to QEMU, if you don't want to allow
more control of the device tree.

>
> > One more question...other than dtb, does QEMU typically add support
> > for data structures needed by particular projects or groups of
> > projects? It looks like dtb was supported for ARM Linux originally? I
> > am looking at supporting bloblist as a way of communicating
> > information between firmware (basically a simple way of packaging
> > multiple blobs).
>
> The answer here is essentially "no, as far as possible". We
> ideally would not have special case support for any particular
> guest code. We do have special handling for "directly boot the
> Linux kernel" for a combination of historical reasons (we've
> always supported it) and it being a massive use case. But even
> that is painful to maintain (it starts off seeming easy but
> gradually requires more weird tweaks and handling as CPU
> architectures evolve). I really strongly don't want to add
> additional categories of guests that QEMU has special case
> support for, which is the main driver behind why I'm so negative
> about this patchset.

This patch is really just augmenting what QEMU is already doing and
solving a problem that it has. I don't see it as creating a new boot
mechanism or being a weird tweak. If anything, it puts the tweaking in
the hands of the user. It seems like something you would be keen on,
from that POV.

>
> Guest software running on the "virt" board needs to know it is
> running on the "virt" board and deal with the interface and
> information that QEMU provides. (For instance, Arm Trusted
> Firmware and UEFI both have done this.)

Well unfortunately this is in conflict, based on what you have said in
this thread. We can either have virtio support (use QEMU-generated
device tree) or have U-Boot work correctly (use -dtb). Do you have any
other ideas?

Regards,
Simon

