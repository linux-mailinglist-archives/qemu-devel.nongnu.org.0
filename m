Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6FF3E49BD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 18:23:02 +0200 (CEST)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD83J-0007wm-U2
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 12:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mD827-0006hi-Et
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:21:47 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mD825-0002nJ-6e
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:21:47 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so26575119pjn.4
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=13sgw1F+9Rx3StcP8BChSBtfx01VfwVN8/iyiV/pZc4=;
 b=rm553TTUFSpx3fQOR0iESI36y1LdyUBrwJ86SXxlvL8WRxkXMD9guZsSuLi7yFcpyk
 ykPLpTHfdrPVg74cVi0oN40E0WhD4fjJIFa0H20NiYh8jJWZb0ZMdN3I3rBamKk4Pkfs
 9ScAn6qCfBhOo56h5TK7H1zlu2Y/IYrgcPw2XzR/cifoqY2nF088tDn24sVerTiiZv1o
 wBoyJYSxBOLcULbmbghWsqS36dQG3WcgXt9cf8/bNk205NIMeczHghGGsM3JeghrSnEV
 mC19Lp2Ny+aoXnRAGpBjXzb1ZIiiSPUTzH33DbwcBxKVfj8Emt92BMNh8eZ21bJpF+i1
 d+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=13sgw1F+9Rx3StcP8BChSBtfx01VfwVN8/iyiV/pZc4=;
 b=KFdiB6ctUdppdRzqHKQ6edjMYfhayBJbGtc3EhggYUsncUPFqhxczWV0B+XP3gUd58
 02C3BFnVkpDFkHi+EZJCVx4872EazwiohV7roUimfQDgvWCQ8n8S9N/AJraw4q6dVdzu
 ONG728ISDHttcdJqlJbarKl0JPlVgJhnaUohWrkwlaZcA/YBzKRhQIAyNfOqimBRTkmc
 wOxaEQMaPUWrDeSuWj6m+rW+HWIsBSkaTuCC75kzFqqys3SHj27bs1FkTqWjfpmZr8qJ
 GAmmxgQXxfjTO9USXMAzn273WkS7YkPVMyCDK590J5igQCCMEgj1tkYkDtMmU9nwAsxD
 QW1g==
X-Gm-Message-State: AOAM5319ShWu+y70lBfi9d3N3kB2W0VMzx/XcTjEZf2M+hMStos8uoFa
 jqE0IlQ3ZzFMjIJr01zntMJwkA==
X-Google-Smtp-Source: ABdhPJz88t2V383oQGExVXUl19BtET/CFG3ETn3UrWlCUox7piTPJ5wQj5hdUSvACL6yt+SNnPhItw==
X-Received: by 2002:a65:6894:: with SMTP id e20mr726134pgt.419.1628526102821; 
 Mon, 09 Aug 2021 09:21:42 -0700 (PDT)
Received: from [192.168.1.100] ([115.96.145.75])
 by smtp.googlemail.com with ESMTPSA id c13sm20538560pfi.71.2021.08.09.09.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 09:21:42 -0700 (PDT)
Date: Mon, 9 Aug 2021 21:51:35 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@ani-ubuntu
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
In-Reply-To: <8b936257-2091-d92f-95ba-e7f917750bcb@amsat.org>
Message-ID: <alpine.DEB.2.21.2108092150500.2512@ani-ubuntu>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210805111543.5fb99abf@redhat.com>
 <alpine.DEB.2.22.394.2108051705240.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051826190.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051938340.329433@anisinha-lenovo>
 <20210806123754.1a1fa8a8@redhat.com>
 <alpine.DEB.2.22.394.2108061618320.433849@anisinha-lenovo>
 <d95cb2ea-2cf1-83fb-03c2-3bff8c537cd8@amsat.org>
 <8b936257-2091-d92f-95ba-e7f917750bcb@amsat.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-243629342-1628526101=:2512"
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-243629342-1628526101=:2512
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 6 Aug 2021, Philippe Mathieu-Daudé wrote:

> On 8/6/21 4:01 PM, Philippe Mathieu-Daudé wrote:
> > On 8/6/21 12:52 PM, Ani Sinha wrote:
> >> On Fri, 6 Aug 2021, Igor Mammedov wrote:
> >>> On Thu, 5 Aug 2021 19:42:35 +0530 (IST)
> >>> Ani Sinha <ani@anisinha.ca> wrote:
> >>>> On Thu, 5 Aug 2021, Ani Sinha wrote:
> >>>>> On Thu, 5 Aug 2021, Ani Sinha wrote:
> >>>>>> On Thu, 5 Aug 2021, Igor Mammedov wrote:
> >>>>>>> On Mon, 26 Jul 2021 22:27:43 +0530
> >>>>>>> Ani Sinha <ani@anisinha.ca> wrote:
> >>>>>>>
> >>>>>>>> All existing code using acpi_get_i386_pci_host() checks for a non-null
> >>>>>>>> return value from this function call. Instead of returning early when the value
> >>>>>>>> returned is NULL, assert instead. Since there are only two possible host buses
> >>>>>>>> for i386 - q35 and i440fx, a null value return from the function does not make
> >>>>>>>> sense in most cases and is likely an error situation.
> >>>>>>>>
> >>>>>>>> Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> >>>>>>>>
> >>>>>>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> >>>>>>>> ---
> >>>>>>>>  hw/acpi/pcihp.c      |  8 ++++++++
> >>>>>>>>  hw/i386/acpi-build.c | 15 ++++++---------
> >>>>>>>>  2 files changed, 14 insertions(+), 9 deletions(-)
> >>>>>>>>
> >>>>>>>> changelog:
> >>>>>>>> v1: initial patch
> >>>>>>>> v2: removed comment addition - that can be sent as a separate patch.
> >>>>>>>> v3: added assertion for null host values for all cases except one.
> >>>>>>>>
> >>>>>>>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> >>>>>>>> index f4d706e47d..054ee8cbc5 100644
> >>>>>>>> --- a/hw/acpi/pcihp.c
> >>>>>>>> +++ b/hw/acpi/pcihp.c
> >>>>>>>> @@ -116,6 +116,12 @@ static void acpi_set_pci_info(void)
> >>>>>>>>      bsel_is_set = true;
> >>>>>>>>
> >>>>>>>>      if (!host) {
> >>>>>>>> +        /*
> >>>>>>>> +         * This function can be eventually called from
> >>>>>>>> +         * qemu_devices_reset() -> acpi_pcihp_reset() even
> >>>>>>>> +         * for architectures other than i386. Hence, we need
> >>>>>>>> +         * to ignore null values for host here.
> >>>>>>>> +         */
> >>>>>>>>          return;
> >>>>>>>>      }
> >>>>>>>
> >>>>>>> I suspect it's a MIPS target that call this code unnecessarily.
> >>>>>>> It would be better to get rid of this condition altogether.
> >>>>>>> Frr that I can suggest to make acpi_pcihp_reset() stub and
> >>>>>>> replace pcihp.c with stub (perhaps use acpi-x86-stub.c) when building
> >>>>>>> for MIPS.
> >>>>>>>
> >>>>>>> then a bunch of asserts/ifs won't be necessary,
> >>>>>>> just one in acpi_get_i386_pci_host() will be sufficient.
> >>>>>>>
> >>>>>>
> >>>>>> OK this is a good idea.
> >>>>>> I can see that mips-softmmu-config-devices.h has
> >>>>>> CONFIG_ACPI_X86 turned on for mips. This does not seem right.
> >>>>>>
> >>>>>> The issue here is:
> >>>>>>
> >>>>>> $ grep -R CONFIG_ACPI_X86 *
> >>>>>> devices/mips-softmmu/common.mak:CONFIG_ACPI_X86=y
> >>>>>>
> >>>>>> So after
> >>>>>>
> >>>>>> -CONFIG_ACPI_X86=y
> >>>>>> -CONFIG_PIIX4=y
> >>>>>>
> >>>>>> (the second one is needed because after removing first one we get:
> >>>>>>
> >>>>>> /usr/bin/ld: libcommon.fa.p/hw_isa_piix4.c.o: in function `piix4_create':
> >>>>>> /home/anisinha/workspace/qemu/build/../hw/isa/piix4.c:269: undefined
> >>>>>> reference to `piix4_pm_init'
> >>>>>>
> >>>>>> This is because in hw/acpi/meson.build, piix4.c is conditional on
> >>>>>> CONFIG_ACPI_X86. )
> >>>>>>
> >>>>>> /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_gt64xxx_pci.c.o: in
> >>>>>> function `gt64120_pci_set_irq':
> >>>>>> /home/anisinha/workspace/qemu/build/../hw/mips/gt64xxx_pci.c:1020:
> >>>>>> undefined reference to `piix4_dev'
> >>>>>> /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_malta.c.o: in function
> >>>>>> `mips_malta_init':
> >>>>>> /home/anisinha/workspace/qemu/build/../hw/mips/malta.c:1404: undefined
> >>>>>> reference to `piix4_create'
> >>>>>>
> >>>>>> So should mips be doing piix stuff anyway? Is Piix4 etc not x86 specific?
> >
> > PIIX, PIIX3 and PIIX4 are generic chipsets, not X86-specific.
> >
> > QEMU's PIIX3 is a Frankenstein to support virtualization to a chipset
> > not designed for it.
> > If you look at it, the X86 machine use a PIIX3 but the PIIX3 doesn't
> > even provide an ACPI function. It appeared in the PIIX4. The kludge is
> > to instanciate the PIIX4.acpi from the PIIX3 and X86 ppl are happy with
> > it, but it makes it ugly for the other architectures.
> >
> >>>>> Apparently this is by design:
> >>>>> https://qemu.readthedocs.io/en/stable/system/target-mips.html
> >
> > What do you mean "by design"? The Malta uses a PIIX4 chipset for its
> > southbridge indeed.
> >
> >>>>> which means mips malta will continue to use the x86 specific functions
> >>>>> like acpi_pcihp_reset(). Creating a stub for this with acpi-x86-stub.c
> >>>>> will result in a double symbol definition because CONFIG_PC is off for
> >>>>> mips.
> >>>>>
> >>>>
> >>>> Also to be noted that there is a stub for acpi_get_i386_pci_host() which
> >>>> simply returns NULL. This activates when CONFIG_PC is disabled. It is this
> >>>> stub that gets called for mips and hence the check for non-null host is
> >>>> needed in acpi_set_pci_info() function.
> >>> that were half measures to deal around code that shouldn't be called,
> >>> now with pcihp being used by both pc and q35 we don't have reason to
> >>> keep around null checks modulo mips calling code that shouldn't be
> >>> called there to begin with.
> >>
> >> So malta mips does not need ACPI hotplug? In that case, maybe we should
> >> not make pcihp.c dependent on CONFIG_ACPI_X86. Ideas welcome.
> >
> > Linux on Malta does use the ACPI features from the PIIX4.
> >
> > Please dig in the archives, Igor / myself already argued enough about
> > this topic 2 years ago. The consensus was "yes, it is badly implemented,
> > but it works and we don't have time to get it cleaner, pc machine is
> > way more used than the malta one, so let not break the pc machines."
> >
> > See:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg613194.html
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg690435.html
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg725504.html
>
> Also:
> https://gitlab.com/qemu-project/qemu/-/issues/193
> https://gitlab.com/qemu-project/qemu/-/issues/221

Thanks Phil for the contexts. I will go through them. For now, should we
simply go with my v2 then?

--8323329-243629342-1628526101=:2512--

