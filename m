Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06945AD37A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:11:49 +0200 (CEST)
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBtE-0000pY-Tk
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVBfC-0001hQ-Fn
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:57:19 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:37515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVBf6-0001hp-HU
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:57:18 -0400
Received: by mail-pl1-x634.google.com with SMTP id m2so8478592pls.4
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date;
 bh=PTAlOOwAiIw5qV8xMhPN89Kv9ioYy1PQtd/BHvLLT4A=;
 b=pK3gVux3QiW9RHV0ruTsgFK6bs8fyjnMzGbdOmeUpO2UmWEHCzzr+lIwWpWgjIGhdK
 2G2ED5x/N7Zex3VvMCQKhUX/kiavJ1/q1nJrP/VHNCxRgMGyz8wpRHHHKd2KZklwZbWU
 aXkc4df9HHYDtlnqpy9dSm43VSNdAdmQDTG/tJazA5OlQdv5Dq31pVZI5QdUyDKYBZsy
 M9thpw/iNgEIeL/XmIUxMb8W/OMPsWNYWrvIaWhynYgwxBCcdG0sUbJAZc6+b6j5ZiZm
 E2jS7UL3UkMZw616CzlOfkNxmy0zXwPFMLzaF70Q2fpKJ2rOTOP2GtlwNYth8uWJEXsQ
 SE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=PTAlOOwAiIw5qV8xMhPN89Kv9ioYy1PQtd/BHvLLT4A=;
 b=79/MpIRWed7Ek2mYDA4QRbFGMvjkik5KcxsrgyKFruoLnWSfBDsL/yDybD0yoOzHfz
 QFh70tZNzQsBTkmz1JoPmEbBG07utyDLpofa5TLjcLA/MIr9eRVDnDsZmWJVtg7picLP
 EwN/yx15J0p/iehvfi7djArsNhIS+MaY7GVwSkZUjqE0xW959yo5Nj3MJ2cdByiB+Jzj
 OKmY4dBzfuseYydSxy3eveM1guX5PK0Y9EZUkLTtteWCUJzY9U74aXktaiOqLNW0pF6Y
 NT6t3DXyfUf3f/F5AZXP7LliBWZckS8nqzOD1R1wibrxPcGOl1xtTC/oxE4LZO3YveFE
 gHTQ==
X-Gm-Message-State: ACgBeo1enjgFL8wAiyE85RorLyStLdMHGcrEe8OgscegXnjrAcC8hBtk
 ME4QtgMzdK3HtiyzR3VX5fa8sA==
X-Google-Smtp-Source: AA6agR5Ii2oqHa8OIGx2oXuviawnRvUA1O98gpNXCuQN9Lx8mowIdRgbUet/49TceKOfJZrfuw3uww==
X-Received: by 2002:a17:90b:4a10:b0:1fb:2e77:a33 with SMTP id
 kk16-20020a17090b4a1000b001fb2e770a33mr19419397pjb.67.1662382630972; 
 Mon, 05 Sep 2022 05:57:10 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.134.171])
 by smtp.googlemail.com with ESMTPSA id
 w128-20020a626286000000b0053dc56afd3csm1961599pfb.219.2022.09.05.05.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 05:57:09 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 5 Sep 2022 18:27:02 +0530 (IST)
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org, 
 kkostiuk@redhat.com, yvugenfi@redhat.com, yiwei@redhat.com, 
 ybendito@redhat.com, jusual@redhat.com
Subject: Re: [RFC PATCH] hw/acpi: do not let OSPM set pcie native hotplug
 when acpi hotplug is enabled
In-Reply-To: <20220905064415-mutt-send-email-mst@kernel.org>
Message-ID: <d6958860-8155-ca83-955-cc36107831ea@anisinha.ca>
References: <20220905072531.8059-1-ani@anisinha.ca>
 <20220905064415-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Mon, 5 Sep 2022, Michael S. Tsirkin wrote:

> On Mon, Sep 05, 2022 at 12:55:31PM +0530, Ani Sinha wrote:
> > Possible fix for https://bugzilla.redhat.com/show_bug.cgi?id=2089545
> >
> > Change in AML:
> >
> > @@ -47,33 +47,39 @@
> >      Scope (_SB)
> >      {
> >          Device (PCI0)
> >          {
> >              Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
> >              Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
> >              Name (_ADR, Zero)  // _ADR: Address
> >              Name (_UID, Zero)  // _UID: Unique ID
> >              Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
> >              {
> >                  CreateDWordField (Arg3, Zero, CDW1)
> >                  If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
> >                  {
> >                      CreateDWordField (Arg3, 0x04, CDW2)
> >                      CreateDWordField (Arg3, 0x08, CDW3)
> >                      Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> > -                    Local0 &= 0x1E
> > +                    Local0 &= 0x1F
> > +                    Local1 = (CDW3 & One)
> > +                    If ((One == Local1))
> > +                    {
> > +                        CDW1 |= 0x12
> > +                    }
> > +
> >                      If ((Arg1 != One))
> >                      {
> >                          CDW1 |= 0x08
> >                      }
> >
> >                      If ((CDW3 != Local0))
> >                      {
> >                          CDW1 |= 0x10
> >                      }
> >
> >                      CDW3 = Local0
> >                  }
> >                  Else
> >                  {
> >                      CDW1 |= 0x04
> >                  }
> > **
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  hw/i386/acpi-build.c | 23 ++++++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 0355bd3dda..3dc9379f27 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1348,10 +1348,12 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
> >  {
> >      Aml *if_ctx;
> >      Aml *if_ctx2;
> > +    Aml *if_ctx3;
> >      Aml *else_ctx;
> >      Aml *method;
> >      Aml *a_cwd1 = aml_name("CDW1");
> >      Aml *a_ctrl = aml_local(0);
> > +    Aml *a_pcie_nhp_ctl = aml_local(1);
> >
> >      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> >      aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> > @@ -1366,11 +1368,26 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
> >      /*
> >       * Always allow native PME, AER (no dependencies)
> >       * Allow SHPC (PCI bridges can have SHPC controller)
> > -     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
> >       */
> > -    aml_append(if_ctx, aml_and(a_ctrl,
> > -        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
> > +    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
> >
> > +    /*
> > +     * if ACPI PCI Hot-plug is enabled, do not let OSPM set OSC PCIE
> > +     * Native hotplug ctrl bit.
> > +     */
> > +    if (!enable_native_pcie_hotplug) {
> > +        /* check if the ACPI native hotplug bit is set by the OS in DWORD3 */
> > +        aml_append(if_ctx, aml_and(aml_name("CDW3"),
> > +                                   aml_int(0x01), a_pcie_nhp_ctl));
> > +        if_ctx3 = aml_if(aml_equal(aml_int(1), a_pcie_nhp_ctl));
> > +        /*
> > +         * ACPI spec 5.1, section 6.2.11
> > +         * bit 1 in first DWORD - _OSC failure
> > +         * bit 4 in first DWORD - capabilities masked
> > +         */
> > +        aml_append(if_ctx3, aml_or(a_cwd1, aml_int(0x12), a_cwd1));
>
>
> 0x12 ->
>
>  ( 0x1 << 4 ) /* _OSC failure */ | ( 0x1 << 1) /* capabilities masked */
>
>
> > +        aml_append(if_ctx, if_ctx3);
> > +    }
> >      if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
> >      /* Unknown revision */
> >      aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
>
> Hmm wait a sec
>
>
>     if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
>     /* Capabilities bits were masked */
>     aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
>     aml_append(if_ctx, if_ctx2);
>
>
> this one seems subtly different ...

I guess what this code is trying to say is that if the requested
capabilities by the driver is not the same as the one we are returning, we
are masking some of the capabilities. This seems to be a superset of my
change above and does not break it. Unless I am reading this wrong ...

