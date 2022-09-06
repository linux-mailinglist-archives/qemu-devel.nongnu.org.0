Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659545AE197
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:51:47 +0200 (CEST)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTN3-0003Xk-CQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVTHP-0000Qd-M8
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:45:55 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVTHN-0005FI-Q9
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:45:55 -0400
Received: by mail-qv1-xf33.google.com with SMTP id d1so7800022qvs.0
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 00:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date;
 bh=YEdIo00bdpflZQsK1h7+KmhrgajDbMSFJb7Yotr723g=;
 b=4JnlgKGVFs2fuMDX6WlvAj6zlPIn4oc6MHlEnbXVwQLkBNQzSv6dNfXJjlslesCOkr
 MRlmnfmgxwSjx0DfptHtd1/i7pugmtU64K2Ey3gzaOlpKqVj386hQYrbWksyhENxACYe
 0y7yoMR5T2h5jNSZ3Jn1PRoSdYdtSq137+Dwbw4z54v11Ay3ZxYoiE4hAzHkDJ5FptgO
 UjB6Srrw/qtA14JX9Wm0OkfgQx3X5/BEw0xhGXFik9HXJVGRloevXRhEw6iP1abGobyw
 cAPpCuz7fUKTe6FiYr4i/2/q4qnwtdbak5GVpIlT7Ct+htruzCKxOmsrI6kaNbnfbB5O
 RF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=YEdIo00bdpflZQsK1h7+KmhrgajDbMSFJb7Yotr723g=;
 b=5WHgziQAsVg1CMKqZqhP9EzAoXRRGt+Ff33g07TiROmYERCEX/3F6QO0AlrK7RmS0y
 bLetndj06a/qYbvocUWxTPLyFsvDQj5kkPK3a4p9rLZ9iFI1sUSkXyl1hrw8ZXdBD68T
 XNZLBxjRRIlmPVz4hqxYzsbMoCrcQBWtQlE8loPVqS6Xd9SM/Z/VuJ/RB0bOys8l+dt1
 cquCprZ0u/ZgNKXdwyGvJZYUdmpgyiHgIFBBqxpINYDHx1DZwbz/pTETYjvzfawggh+T
 xP5GXMRw0vSUwvKyKah2njLzlSKzPzAPprQJPayc+hkyCKUCuaVTEgV38T2eVaWaf0zL
 EzwA==
X-Gm-Message-State: ACgBeo2qG0i3swO9CelRd11Ow/tutk8F2pPAl+MXBsVmZSl1YgCOtWUu
 OvAcnSFh/J5sawMSLEBOb1S8lg==
X-Google-Smtp-Source: AA6agR5+RLZ1FgWmA2IOVFNkT5x5MoBzqXVcRIzRkViwtFOzXuwWrq1DH5XDJngd1dyNi6DyPWI4eg==
X-Received: by 2002:a05:6214:e69:b0:499:1b4b:a7e8 with SMTP id
 jz9-20020a0562140e6900b004991b4ba7e8mr26027712qvb.12.1662450351918; 
 Tue, 06 Sep 2022 00:45:51 -0700 (PDT)
Received: from [135.244.34.217] ([135.245.48.252])
 by smtp.googlemail.com with ESMTPSA id
 j25-20020ac85519000000b0034308283775sm8879390qtq.21.2022.09.06.00.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:45:51 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 6 Sep 2022 13:15:42 +0530 (IST)
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
In-Reply-To: <20220906093952.736ca756@redhat.com>
Message-ID: <229fdbbc-6d5a-3d73-c293-74d7a9e166ff@anisinha.ca>
References: <20220905072531.8059-1-ani@anisinha.ca>
 <20220905175225.74881174@redhat.com>
 <9e83cb29-98f6-02d-7f60-aed42a316930@anisinha.ca>
 <971e9a8-f9a1-4280-3fc5-4b695d42698b@anisinha.ca>
 <20220906093952.736ca756@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::f33;
 envelope-from=ani@anisinha.ca; helo=mail-qv1-xf33.google.com
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



On Tue, 6 Sep 2022, Igor Mammedov wrote:

> On Mon, 5 Sep 2022 22:25:25 +0530 (IST)
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Mon, 5 Sep 2022, Ani Sinha wrote:
> >
> > >
> > >
> >
> > > > >
> > > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > > index 0355bd3dda..3dc9379f27 100644
> > > > > --- a/hw/i386/acpi-build.c
> > > > > +++ b/hw/i386/acpi-build.c
> > > > > @@ -1348,10 +1348,12 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
> > > > >  {
> > > > >      Aml *if_ctx;
> > > > >      Aml *if_ctx2;
> > > > > +    Aml *if_ctx3;
> > > > >      Aml *else_ctx;
> > > > >      Aml *method;
> > > > >      Aml *a_cwd1 = aml_name("CDW1");
> > > > >      Aml *a_ctrl = aml_local(0);
> > > > > +    Aml *a_pcie_nhp_ctl = aml_local(1);
> > > > >
> > > > >      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> > > > >      aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> > > > > @@ -1366,11 +1368,26 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
> > > > >      /*
> > > > >       * Always allow native PME, AER (no dependencies)
> > > > >       * Allow SHPC (PCI bridges can have SHPC controller)
> > > > > -     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
> > > > >       */
> > > > > -    aml_append(if_ctx, aml_and(a_ctrl,
> > > > > -        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
> > > > > +    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
> > > >
> > > > that makes us not actually mask any capabilities since you forgot to mask
> > > > bit 1 later under if_ctx3 context.
> > > >
> > > > So OSPM will see a permanent failure (_OSC failure bit in CWD1)
> > > > and will have no idea that PCI Hotplug is not supported since we return CWD3
> > > > with this bit still set whoever much it tries to negotiate.
> > >
> > > The failure is only returned when the OS requests/probes native hotplug
> > > capability in CWD1.
> >
> > I meant CWD3.
> For OSPM to know which features are denied by platform, the later must mask
> them in returned bitmask, how otherwise you would see above behavior.

In that case, mst's idea does not work, sadly.

> (or alternatively OSPM might ignore _OSC results and resort to workarounds/probing
> as result enabling native hotplug in which case you would see ATS
> detected).
>
> To verify which hotplug is used, you can just trace acpi_pci_* in QEMU and observe
> if it's used for unplug or not.
>
>

