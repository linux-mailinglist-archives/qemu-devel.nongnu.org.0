Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5370A50B457
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:46:24 +0200 (CEST)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhprr-0003Sg-9C
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <renzhengeek@gmail.com>)
 id 1nhpfJ-00079v-06
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:33:26 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <renzhengeek@gmail.com>)
 id 1nhpfH-0006NO-8N
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:33:24 -0400
Received: by mail-pl1-x632.google.com with SMTP id j8so9619190pll.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EmlhKaC9QFi52IM/zqrre1bM76njwpig2OwWXL7Oiyg=;
 b=D1DZLv2/dhoUsvHfs/pHRD9F3/3BImsT4xMZOgSmvGN0ou86AxbiwPvE38yuRB2TDk
 Tn0Vp5ZLc4lGianE9l+SBjs5h19vKgvaaDJ+b2CzcJcpbW1NlwyXvodjqY9WHoVcUXRB
 ft0M2QzHL4PRQhNImX7GMR6lpopl9cnx9YrM/Bz7D6nDxXtqZeuB1P/FXRm6afbrAc1q
 6QZo7I/TN2O9VTMJbsmqmFv2cxrTRsjpIfnwvjYAQP1fU+sPqbIbF5jTCxjQpvDCTEFI
 mRK72esEd0+Jy4FYWUo86Vc8wMr3Jk0HtCOqWy5Zc04iGEeO5yjAOSAoHOcRRVojsu1q
 75lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EmlhKaC9QFi52IM/zqrre1bM76njwpig2OwWXL7Oiyg=;
 b=uwzPRsUe5RWa9+CFC6LQG9T/HRgZwum5CEPdpjx8LCkw6kkxD9Iojp4AiuY+KlCt6a
 pIRKdbw5Kx8sHty8Iwn5hC1RmhT2ENs+lZuM3MMjCymAz21/ED7KucvUYM232RxjhGE1
 0Fegxm2Vf/GkWaEisnqtWF4mLj7h8CtqFOsDi2F3H2rSUrf8CbQDfiJrEnISswVF3rh2
 ZAaN3Z10OSsTruWbGLDIgtVBvZkW7UC0kzLFQxnGT6UeOFwTuA/5GInwVp474kIfVhDF
 fdZkLOGlzCmqFew5VYgAv8IIDwqvlGyi9XsWFEG/GFAJdA4IdR58cCOxY1JEK+g5J58Q
 Xtzg==
X-Gm-Message-State: AOAM533r4gRJJFLjcrVn04MtzPZhD5Z0b06PVsUg2Kn/mkqHQdodAOpg
 kebutJWfD0zldiTDpfcirvbhHeaWxAlIGTHuCik=
X-Google-Smtp-Source: ABdhPJx1g/OrjKmDmKmsGeLMzoKMdCdD6F8vRZ4jNPeX2Q/qBSXDnlnKvdI5JUdH+aVHg+omaprqKtZtno+iz4AZuJE=
X-Received: by 2002:a17:902:7d81:b0:14f:e18b:2b9e with SMTP id
 a1-20020a1709027d8100b0014fe18b2b9emr3435121plm.160.1650620001025; Fri, 22
 Apr 2022 02:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAKM4Aewqpfy3AGFi3Y+roA4jDigYOEbW6oBb3XpsVyxFCYne7g@mail.gmail.com>
 <YmJnYCMxG1S9pt4U@redhat.com> <20220422105745.7a20256e@redhat.com>
In-Reply-To: <20220422105745.7a20256e@redhat.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Fri, 22 Apr 2022 17:33:08 +0800
Message-ID: <CAKM4AeydH7gAmZtR432uYw2jNqdokyJY4qpVvc+KN12bxtBggg@mail.gmail.com>
Subject: Re: Is it possible to support hotplug device to PXB bridge?
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=renzhengeek@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcel@redhat.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor, Daniel:

Thanks for the hints!

In the PXB doc (https://github.com/qemu/qemu/blob/master/docs/pci_expander_=
bridge.txt),
PXB device internally adds a pci bridge, according to the impl brief:

```
The PXB is composed by:
...
- PCIBridgeDev(TYPE_PCI_BRIDGE_DEV)
Created automatically as part of init sequence.
When adding a device to PXB it is attached to the bridge for two reasons:
- Using the bridge will **enable hotplug support**
- All the devices behind the bridge will use bridge's IO/MEM windows compac=
ting
the PCI address space.
```

A PXB device already takes 2 bus nr: 1 for the added root bus via host
bridge, 1 for the pci bridge.
If statically adding 1 more pci bridge, it takes 1 more pci bus...

Anyway, will try to figure out the reason why the doc says "Using the
bridge will enable hotplug support",
but in fact not :-)

The start point seemingly is, to generate correct ACPI SSDT table
having hotplug devices/methods for slots behind the PXB
internal pci bridge.

Regards,
Eric Ren

On Fri, 22 Apr 2022 at 16:57, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Fri, 22 Apr 2022 09:29:20 +0100
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>
> > On Fri, Apr 22, 2022 at 03:17:11PM +0800, Eric Ren wrote:
> > > Hi Marcel and all,
> > >
> > > It fails when I want to hotplug device to PXB bus. Then, I find this
> > > commit that explicitely declares the fact that PXB bus does not suppo=
rt
> > > hotplug device onto it.
> > >
> > > 7b346c742cd9 ("hw/pxb: declare pxb devices as not hot-pluggable")
> > >
> > > Could you please help confirm the possibility to make PXB bus hotplug=
gable,
> > > and the main work to achieve it if possible?
> >
> > Instead of trying to hotplug into the PXB, attach a 'pci-bridge' to the
> > PXB and then you can hotplug into the latter instead.
>
> there is no ACPI based hotplug for devices on pxb if I'm not mistaken, so
> you'll likely need to enable shpc on pci-bridge.
>
> > > Yes, pxb-pcie with Q35 do support hotplug, but we use i440 machine a =
long way,
> > > not  willing to change machine type to have it.
> >
> > With regards,
> > Daniel
>


--=20
- Eric Ren

