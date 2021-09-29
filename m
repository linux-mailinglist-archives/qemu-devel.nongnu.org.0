Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D9A41C15F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:12:40 +0200 (CEST)
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVdn-0000eb-3P
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVVbz-0007OD-2e
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:10:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVVbu-0007CG-11
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:10:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id o19so1277688wms.1
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 02:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sSziG86OyoRTL66noHj0SwAN+2VckCYxnmfYy0a1Hug=;
 b=LZHtNIuH1mm00PvsA0j9z8/HAGnVLIkQHUqptjFSZEc1NTV0bvdHtMX1OCnX1qGWHI
 WvG1NphyvGDWzTAjyW9uw0V8BcvtJOaaLdfUOamu89KNQBoVHUwZiVMvvhGiznlSbodA
 m4fzPuoekeYuKWvovBMcz1cRaSDxl2Nvpz9zShqnUJIIVp9nh8sNbevtROXuZR2SlYO8
 fAbUF+oXFmNmv5zifvqGXqGk1+uAEcrTnC+i4R0qsYSUALrymeeBtAAzxXNvZ3L/CTB7
 XxqBd5ciBDkhwyEU/27Tpk8nsZP/Aqi9jXFXEor76qvIJ8SGz7HNhe0fJheI70UP/kHM
 iobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sSziG86OyoRTL66noHj0SwAN+2VckCYxnmfYy0a1Hug=;
 b=HLGZ6NXKK3FdNznvWSrGQ9pzWXThmDGc5rRTV//qsdGjSxL4wxzh0iXIT9Zbo96AlE
 Dxhi+PreQV3qSH8Q11ImYFLF8AICm+JA6VpFr+9pv05+tm63lYi6UMm2uHPPXvsHlige
 Zbt+pqtCOO5nhpRmlmkbGOG50tBCh1wqUbaBmDaJ/xlsbp44TQgbReyfDVukn2RkIhig
 3qPp8u1TW+oV7CWSn3bOxrAmTKlwnd5tQLZcB9XT+x7LfaQHTww/fVXO2vEiQWjSjrL8
 dLAKqP/ygzs0IeMtngQ9YJCrpP9tWcw8KzPrBp4K+Ck39xS+BT2MInjHUu1SKSPnEFyo
 ne4g==
X-Gm-Message-State: AOAM5315etxII60LkxFDvODHREDad2MaW+0/yFrk97orGZHQgD9sTp3/
 Fh+w0Dr29V1sTWdUJDVQixo5SY6OvjRJ1KZ1ZV8sUA==
X-Google-Smtp-Source: ABdhPJwuey3K2/IOrVbTWjqKUCvT8WEyM9mSqmx9fXRK0OrHrA/vyeAZpy4VA8fFZZ9gHlKs9SwU4weoiqrfmVX2WH8=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr9121925wmm.133.1632906639073; 
 Wed, 29 Sep 2021 02:10:39 -0700 (PDT)
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
 <CAPnjgZ0xMH+SSjQWGjynTLDDbg6tO=z+-eDbpDKV1gqo=bhqaQ@mail.gmail.com>
In-Reply-To: <CAPnjgZ0xMH+SSjQWGjynTLDDbg6tO=z+-eDbpDKV1gqo=bhqaQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Sep 2021 10:09:45 +0100
Message-ID: <CAFEAcA9y+sBpL-ncYwdqNkMx_oXkQ-pdhNcHOdgTxJmWBArzhA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 29 Sept 2021 at 04:01, Simon Glass <sjg@chromium.org> wrote:
> On Tue, 28 Sept 2021 at 03:21, Peter Maydell <peter.maydell@linaro.org> wrote:
> > So what *is* this patch doing? The subject says "Allow additions to
> > the generated device tree", and the patch adds an option to
> > "Merge a device tree binary (dtb) file into the generated device tree".
> > That sounds exactly like "combine two bits of dtb" -- the one the
> > user provides to the -dtbi option and the one QEMU generates
> > internally.
>
> Yes that's right, but as you say one of them is generated by QEMU. It
> is fixing a problem caused by QEMU's generation of the device tree,
> since it provides no wat to augment the device tree without my patch.

You can augment it in the guest if you need to add guest-specific stuff.

> > > The only current working option is to just pass the U-Boot dtb through
> > > and not use QEMU's on-the-fly-generated dtb at all. But I am assuming
> > > there is a reason why QEMU generates that dtb, so that would not be
> > > desirable?
> >
> > QEMU generates the dtb to tell the guest what hardware is
> > present and where it is. We don't guarantee that that hardware
> > arrangement is necessarily stable between QEMU versions (in
> > practice there are generally additions and not deletions or
> > moves, but in theory there might be). All the guest is supposed
> > to assume is the location of RAM and flash; everything else it
> > must look in the dtb to determine.
>
> Yes, so that is going to severely limit the usefulness of the virtio
> support, for example. But we can just ignore it for CI, I suppose,
> since we can use fixed parameters to QEMU, if you don't want to allow
> more control of the device tree.

virtio-mmio devices should already be correctly indicated in the
device tree. virtio-pci devices can be found by probing the PCI
bus in the usual way (and you can find out where the PCI controller
is by looking in the dtb).

> This patch is really just augmenting what QEMU is already doing and
> solving a problem that it has. I don't see it as creating a new boot
> mechanism or being a weird tweak. If anything, it puts the tweaking in
> the hands of the user. It seems like something you would be keen on,
> from that POV.

I absolutely see it as a weird tweak. It's something that
only u-boot seems to care about, and it's adding an extra
user-facing command line option that is basically
"if you need to boot u-boot you need this". The user should
not need to "control" the dtb, because QEMU should already
be creating a dtb which describes the hardware it is exposing
to the guest.

> > Guest software running on the "virt" board needs to know it is
> > running on the "virt" board and deal with the interface and
> > information that QEMU provides. (For instance, Arm Trusted
> > Firmware and UEFI both have done this.)
>
> Well unfortunately this is in conflict, based on what you have said in
> this thread. We can either have virtio support (use QEMU-generated
> device tree) or have U-Boot work correctly (use -dtb). Do you have any
> other ideas?

I've already suggested what I think you should do: have u-boot
combine the dtb it gets from QEMU with the dtb-extras stuff
it wants for its own purposes, with the latter supplied in
any of a bunch of workable ways (extra file loaded in memory,
concatenate the dtb blob with the u-boot binary at compile
time, whatever; rough analogy with however u-boot gets the
full dtb on hardware platforms where there is none).

-- PMM

