Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7225AD7E2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 18:53:05 +0200 (CEST)
Received: from localhost ([::1]:60184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVFLL-0003Tg-Qy
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 12:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVFJD-0001yo-Ly
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 12:50:51 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVFJB-0005CG-KW
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 12:50:51 -0400
Received: by mail-pl1-x632.google.com with SMTP id io18so269588plb.10
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date;
 bh=d37OlfJM/pIoduO5FEno5fs0HluRQhiT9l4UEkheMyU=;
 b=BhemM5NRIlq5ihzrPwkGKL2JDrFND0F0G63STeVheThi0a8dMD23VMqYTKShCD1fa/
 J71SNUaChzE0cNhEOqa7C1jmEnNiB0WgWS2WgAIhiRt2vWIwJgBGXKtTu5FpaZA2DHu3
 wRlpZ96G+iZTZeRa3P/X/Gjjj7GyaZV37tpUjb4GtGoUKdxcpWUDhjHl22UQPkuWTw7t
 HkJnMhJBqSXHA6WLqfkDjfCBTKEDijpc2eF1JMhTheFUUCfqpC0eORM8pLwKK7rHJZOX
 Fv9laDmdnGFYgzAzdEMpra4CmrDg7tRep7iVQUyG78sLX9rD11pnsul+PxF03+4ZNRMA
 obPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=d37OlfJM/pIoduO5FEno5fs0HluRQhiT9l4UEkheMyU=;
 b=C2yXOiM68X3Vg5LWW0T+XchiujrNOBIeiFG9dK06DAewfah9o3zsYe8uyb4RRM5Fgl
 uiDQ6txOaABYUW3yE6mvvkBrumN6BrqECZIxsPWsLVedM6DkhiBMPhBSV9jlk2E53b6c
 THrwuznvmOFJi3DDeC3pk4QUxjJfpVrwF+yYtjY/Pkv5c1xMGxgWZcpLiO3LfAyXRnuO
 oHZsAX5qcvJ34gwA07/Q+Njl37ptMB5n0vTKRhn15uyoVDcWVNdNiU6pc82jriQUvp2m
 H9gZFJE5tV/gDE13+l0wOpZSLlvXdsXw0Fw6HMeYNoUMApS7SKb4TnaPT3fHlwsbdItF
 HDBw==
X-Gm-Message-State: ACgBeo2hHCYt0LEIEMyi4qRkZHJ7ROVqO3MM6tgMEo4viBGD6Nkwsziu
 IIjn/KBJLj6EmqJFg/AaZ0rpcg==
X-Google-Smtp-Source: AA6agR6WYQXsKO+vex5gPqvICLy9ZxLCKobVZFin17ymKNynavFWd5O2JgoguRNfxQd2FaV/ufZ5pg==
X-Received: by 2002:a17:90b:4c91:b0:1fe:4836:3cb7 with SMTP id
 my17-20020a17090b4c9100b001fe48363cb7mr20015603pjb.20.1662396648010; 
 Mon, 05 Sep 2022 09:50:48 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.134.171])
 by smtp.googlemail.com with ESMTPSA id
 k62-20020a17090a4cc400b002004380686bsm3385878pjh.46.2022.09.05.09.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 09:50:47 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 5 Sep 2022 22:20:40 +0530 (IST)
To: Igor Mammedov <imammedo@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org, 
 kkostiuk@redhat.com, yvugenfi@redhat.com, yiwei@redhat.com, 
 ybendito@redhat.com, jusual@redhat.com
Subject: Re: [RFC PATCH] hw/acpi: do not let OSPM set pcie native hotplug
 when acpi hotplug is enabled
In-Reply-To: <20220905175225.74881174@redhat.com>
Message-ID: <9e83cb29-98f6-02d-7f60-aed42a316930@anisinha.ca>
References: <20220905072531.8059-1-ani@anisinha.ca>
 <20220905175225.74881174@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x632.google.com
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



On Mon, 5 Sep 2022, Igor Mammedov wrote:

> On Mon,  5 Sep 2022 12:55:31 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
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
>
> that makes us not actually mask any capabilities since you forgot to mask
> bit 1 later under if_ctx3 context.
>
> So OSPM will see a permanent failure (_OSC failure bit in CWD1)
> and will have no idea that PCI Hotplug is not supported since we return CWD3
> with this bit still set whoever much it tries to negotiate.

The failure is only returned when the OS requests/probes native hotplug
capability in CWD1.

Also maybe I was mistaken but in the offline thread, I thought MST
suggested we left the native hotplug bit as is without ever masking it.
I guess he was coming from the fact that experiments indicated that when
the native hotplug is off in OSC, Windows did not detect ATS.


> So if it boots at all, guest will probably not use any requested features
> since _OSC failed to confirm any without error.
>
> And even if we clear hotplug bit it still doesn't help.
>
> some more testing shows that ATS cap doesn't depended hard on native hotplug
> (i.e. run QEMU with native hotplug enabled but disable hotplug on root-port in question)
> To me it still looks like a bug in Windows' acpi hotplug impl
> (or perhaps it's no more properly maintained, so it doesn't account for new features).

Yeah I also think this is a Windows bug. ATS and native hotplug does not
seem to be related in anyway.

>
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
> > +        aml_append(if_ctx, if_ctx3);
> > +    }
> >      if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
> >      /* Unknown revision */
> >      aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
>
>

