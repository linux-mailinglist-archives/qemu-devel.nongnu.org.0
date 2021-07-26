Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3E13D59F2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:58:30 +0200 (CEST)
Received: from localhost ([::1]:57082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m80Bh-0001Kq-NV
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m80A3-0008HV-NE
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:56:47 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m80A2-0005hE-1o
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:56:47 -0400
Received: by mail-pj1-x102f.google.com with SMTP id b6so12749287pji.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 05:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=d2PQlLfmZwzJiCQjJvx17rJ2OSylDhflruwU02Uuvfo=;
 b=ke7s9peSkvnmQtVc7w9gqNG8fMuhZrnlrRyPu5xwSTGGstFNqGHh1b11tog9kAVQMC
 C7pfrtvDU1J3B2ZdUXTPeCSyIzzm9FU++YDH6YV3xpM0/6HsrPcuzpefu7/k1KTxilZ3
 EmzxR4IvKzqJSKITV9QF9yTeEpot0q+ZnFg3SptXwLA+2wdGYTGRdTAXhigG+g9d1O9M
 dhQJFXfpcE7ZQS4P/t/hvBYpUGziQha1vEunoSCUbs3IocirlIpRwlcyYEm+KpVxIwaF
 zi0PT02IwgcmbSTZl8ycJgQagPREOClzjfNojHmk/S+jX3pTOvJeDOXBWXV5KqQ6nu1l
 LfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=d2PQlLfmZwzJiCQjJvx17rJ2OSylDhflruwU02Uuvfo=;
 b=UtuHH/+Uz3lkjHvl+DhHx4tRbWecf2khuCRRxqc9YM3KKfS7Z4oTxoHYEc+pAZTsqb
 HGzHtNikNgKtg1ryR0vZxcr2jm4ZHBmcOBHf2kIXb4T0FgA9Npl7IOlphMSZqoo9xhSU
 AXdAnX0sYc3dnEi5xeFS69Ndaj1gklus5xzlF2U7mS5AaX35yrrFyhVQu0fAoDZTftGs
 Bnjnob85CKOMjune/MHDRvq++0PaRTIiSlvWnyPh2kzKQvk9XbxsGPFoe5n9jBMAFblI
 2FnBgXON/iLWmc32IDGC8y2lUQHl6Z6tXIwWAqpoKmZ7PKbzJ/OujItPc4506CIiy6t8
 gzsA==
X-Gm-Message-State: AOAM530xyH99lPbbnXy+PlxUPcMKL9cdcENqQT2IQgVMX50jlJJB3EdP
 ASz/8BlskelKOBKYdn18/Tr/yA==
X-Google-Smtp-Source: ABdhPJz2Zqy5G4N+HYpZ2fuvB0owxbeqR7HT1TtAGKAsdKwotF7PQIzlTMp6ZfgGz786fQgWWapnYg==
X-Received: by 2002:a05:6a00:26e5:b029:330:be3:cacd with SMTP id
 p37-20020a056a0026e5b02903300be3cacdmr17958402pfw.78.1627304204002; 
 Mon, 26 Jul 2021 05:56:44 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.238.202])
 by smtp.googlemail.com with ESMTPSA id f3sm4757763pfe.123.2021.07.26.05.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 05:56:43 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 26 Jul 2021 18:26:28 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] hw/acpi: some cosmetic improvements to existing code
In-Reply-To: <20210726135949.6e55593b@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2107261823010.37646@anisinha-lenovo>
References: <20210721141610.139310-1-ani@anisinha.ca>
 <20210726135949.6e55593b@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, jusual@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 26 Jul 2021, Igor Mammedov wrote:

> On Wed, 21 Jul 2021 19:46:10 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > All existing code using acpi_get_i386_pci_host() checks for a non-null
> > return from this function call. This change brings the same check to
> > acpi_pcihp_disable_root_bus() function. Also adds a comment describing
> > why we unconditionally pass a truth value to the last argument when calling
> > acpi_pcihp_reset() from ich9 platform.
> >
> > Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  hw/acpi/ich9.c  | 1 +
> >  hw/acpi/pcihp.c | 5 +++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index 778e27b659..58d8430eb9 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -281,6 +281,7 @@ static void pm_reset(void *opaque)
> >      pm->smi_en_wmask = ~0;
> >
> >      if (pm->use_acpi_hotplug_bridge) {
> > +        /* on root PCIE bus, we always use native or SHPC based hotplug */
> I had an impression that root bus doesn't support hotplug at all,
> and to have hotplug there one should attach a root-port to root bus at
> start up time.

I think you are right. However, I will let others confirm this and update
the comment accordingly in a separate patch.


>
> >          acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
> >      }
> >
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index f4d706e47d..856c6e1b47 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -136,6 +136,11 @@ static void acpi_pcihp_disable_root_bus(void)
> >          return;
> >      }
> >
> > +    if (!host) {
> > +        root_hp_disabled = true;
> > +        return;
> > +    }
> It should be a separate patch,
> when this could return NULL?
> If it should never be null then assert here would be better.

I have sent a v2 without the comment addition. I left the code this way
because everywhere else, the code checking host for NULL value is similar.
I wanted to keep the symmetry. However, if you strongly feel about the
assertion, I will send a v3.


>
> > +
> >      bus = PCI_HOST_BRIDGE(host)->bus;
> >      if (bus) {
> >          /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
>
>

