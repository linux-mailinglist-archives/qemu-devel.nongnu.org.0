Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5815AD7ED
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 18:57:18 +0200 (CEST)
Received: from localhost ([::1]:60766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVFPR-0005WU-DZ
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 12:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVFNp-0003pw-MQ
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 12:55:37 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVFNm-0005sR-UB
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 12:55:37 -0400
Received: by mail-pl1-x62f.google.com with SMTP id t3so3901566ply.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 09:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date;
 bh=yUxlu2wZSezlJsgDjZw+5seVHYJjwA2Kukqd4BqTzHA=;
 b=JmSlxPTFALMnCf7IECvIzxYMt+6qYtO8Pytsp2jIQIUJ6OwoAFOxccCxy6ixGtMVZi
 GY6+Ic7NmmleD1U5wi59FjDdenW6pY3nETK56x0gDkygTw6plaS5C656A+Qzn8uqV2z3
 mC329QCTtF453MUgzwwVMhTBDjC8E6WoXk5ygnBMBmsGKAX1m6AH5dURPlk74Mk7KGFx
 LkpI3ot4ySoC1ArimYQsAOctDjvVSK95hTftNfpaEN7K5KX3tD+6USJtMhKf63RYOCN0
 oXfixrPsitUnQtAha+ZOzUKxLoCv27m1QOF+TB7LUxJypILeOF50pNHGhjllbHX6FVqo
 LSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=yUxlu2wZSezlJsgDjZw+5seVHYJjwA2Kukqd4BqTzHA=;
 b=QbpA4XBISrXpwoj1o3IFfWY6rBb3Hkto2tX3VPMlqXjgYVLuOJmJ0nqKiJW8tJntfy
 lt4XAmsyqxqKpxgu6OvxI3hefdB2awu+ReZKlqpTgjvt81qcB+g1rCcKr2Am5J5I8x/T
 aDdkbIQ3Gitve+RELxXMHdx66lTHNt9r48NnJcIdQ/ZBzfr06CTUhmUnuYUrdmETnZYc
 +GQywfbkSp+Cc5T+wbSqAGGVmtFH4hQ9dNmRvSi65EVOsjFNp3uMAS3ZRyDAVlVH52+u
 w+7+6MU1DlgQahgS3YGdscV6BqIqvJ6h5pfHUJwE6WQYwuK4O7oqekkJ9W9n+yyuOGWO
 MN1Q==
X-Gm-Message-State: ACgBeo1BYwgCzzAVOIjIg29V1mGPil1OkicUGoTOP5V0/j0VEaNHAq/v
 bmKlqIAmoTZY0iYFBWakHfIXpw==
X-Google-Smtp-Source: AA6agR5jdAjVzS3kMdzmzTbAJ+/eZ9yJZwaCT3uhfwImIz1raygh1bVUCMUUOtc9xn3O2yQTOu69gQ==
X-Received: by 2002:a17:902:bcc9:b0:16e:fde3:172f with SMTP id
 o9-20020a170902bcc900b0016efde3172fmr51407375pls.36.1662396932887; 
 Mon, 05 Sep 2022 09:55:32 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.134.171])
 by smtp.googlemail.com with ESMTPSA id
 y17-20020aa78f31000000b0053b2681b0e0sm8037290pfr.39.2022.09.05.09.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 09:55:32 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 5 Sep 2022 22:25:25 +0530 (IST)
To: Ani Sinha <ani@anisinha.ca>
cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org, 
 kkostiuk@redhat.com, yvugenfi@redhat.com, yiwei@redhat.com, 
 ybendito@redhat.com, jusual@redhat.com
Subject: Re: [RFC PATCH] hw/acpi: do not let OSPM set pcie native hotplug
 when acpi hotplug is enabled
In-Reply-To: <9e83cb29-98f6-02d-7f60-aed42a316930@anisinha.ca>
Message-ID: <971e9a8-f9a1-4280-3fc5-4b695d42698b@anisinha.ca>
References: <20220905072531.8059-1-ani@anisinha.ca>
 <20220905175225.74881174@redhat.com>
 <9e83cb29-98f6-02d-7f60-aed42a316930@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62f.google.com
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



On Mon, 5 Sep 2022, Ani Sinha wrote:

>
>

> > >
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index 0355bd3dda..3dc9379f27 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -1348,10 +1348,12 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
> > >  {
> > >      Aml *if_ctx;
> > >      Aml *if_ctx2;
> > > +    Aml *if_ctx3;
> > >      Aml *else_ctx;
> > >      Aml *method;
> > >      Aml *a_cwd1 = aml_name("CDW1");
> > >      Aml *a_ctrl = aml_local(0);
> > > +    Aml *a_pcie_nhp_ctl = aml_local(1);
> > >
> > >      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> > >      aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> > > @@ -1366,11 +1368,26 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
> > >      /*
> > >       * Always allow native PME, AER (no dependencies)
> > >       * Allow SHPC (PCI bridges can have SHPC controller)
> > > -     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
> > >       */
> > > -    aml_append(if_ctx, aml_and(a_ctrl,
> > > -        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
> > > +    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
> >
> > that makes us not actually mask any capabilities since you forgot to mask
> > bit 1 later under if_ctx3 context.
> >
> > So OSPM will see a permanent failure (_OSC failure bit in CWD1)
> > and will have no idea that PCI Hotplug is not supported since we return CWD3
> > with this bit still set whoever much it tries to negotiate.
>
> The failure is only returned when the OS requests/probes native hotplug
> capability in CWD1.

I meant CWD3.

