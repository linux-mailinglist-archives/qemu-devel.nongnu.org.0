Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86673F5F50
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:36:59 +0200 (CEST)
Received: from localhost ([::1]:49068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWbq-0006Xr-6f
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIWYt-0001R8-8w
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:33:55 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIWYo-0003jN-Us
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:33:54 -0400
Received: by mail-pg1-x532.google.com with SMTP id s11so19798590pgr.11
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=dGJTAccv8D5DJ6lshBe9iZM+5lWOQ0dbdqmNoEcCeOU=;
 b=iu44TKebu0n/rwHWLnk5RBFdlW9+Ie1MuhxyxT4ywFF1UcB+1Y62wFrltdiVPA47NE
 RN1Zqvq00El38OzshN6IBO+TGLu+Nd9t2TLO0/BoMHIa8EieC7yp0VSN6K2fePjxKbTW
 YCaTsP3yP+43OVbDX2EW3VH6uGi9iLb11jMUg1/7JPJVwQZHFvIMDWRpwaiq71IFxKKQ
 9xYh3GYjAbj8fHw4btOhLmcqOjL89ymyZF2mJUcsZzy9NRY2CO9Df+4rI1MlYqcOvFvj
 ryeH2kIH2wHLkjYrHGjgCB2Zmm2VUeg1+7D+sLCTmFWIop2dvI4j+Cex6n/kdi2ML3Yh
 Z3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=dGJTAccv8D5DJ6lshBe9iZM+5lWOQ0dbdqmNoEcCeOU=;
 b=Ogpif3GGnP3wiwR3guk6xjQ5hej1xzAAwPpoMhtmso6r9NHnRBBg/sMTJ2fJava2oQ
 poqMtsol4EYF2j9y4OPVfsALaTl4RJlve8OzhsS3ixK6b7hVV3PKn/KPbvaGMLBvnDSt
 ner4glrvWBgXMVwq24OI4S5Ilt6Ac8Ya2KTj33lkQelKbAFPIQqYHe/JyDQDL5IU14l6
 LOk1eahnCxQEn1jOaQqRaAvY8URz0jIhS5plV3Y7tJMmxhQdud5PBKs0y5hop/+XE0cn
 zztgsONd5dYy+u9QDAT4q9cSjjBG+za/IE5C2z52FvtUYYrtY/hJ9eGXaGHWxUSCrhHx
 4sfA==
X-Gm-Message-State: AOAM532Sl3ldKhfu4gR6o+O8uO93aSp1fGkw1Poy0ICDhx8rVun5vZK0
 UkV4eJXDFlfvD+9aTishsb89eg==
X-Google-Smtp-Source: ABdhPJyU3NEMeV7DLoHfNJwMoX8WluJZu1xcAZ1AqGqGgMR/3b5g5aZCG4372w3n3vg7TXasxnkvfg==
X-Received: by 2002:a62:dd83:0:b029:30f:d69:895f with SMTP id
 w125-20020a62dd830000b029030f0d69895fmr39249227pff.17.1629812029381; 
 Tue, 24 Aug 2021 06:33:49 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.135.45])
 by smtp.googlemail.com with ESMTPSA id b20sm2598238pji.24.2021.08.24.06.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 06:33:48 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 24 Aug 2021 19:03:43 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/acpi/pcihp: validate bsel property of the bus before
 unplugging device
In-Reply-To: <e941472c-4dc0-d8ea-7c1b-540aefbbc70c@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2108241837450.894910@anisinha-lenovo>
References: <20210821150535.763541-1-ani@anisinha.ca>
 <20210823190444-mutt-send-email-mst@kernel.org>
 <20210824105614.2762541f@redhat.com>
 <alpine.DEB.2.22.394.2108241603590.891355@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108241636100.892262@anisinha-lenovo>
 <e941472c-4dc0-d8ea-7c1b-540aefbbc70c@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1407008270-1629812028=:894910"
Received-SPF: none client-ip=2607:f8b0:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x532.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1407008270-1629812028=:894910
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Tue, 24 Aug 2021, Philippe Mathieu-Daudé wrote:

> On 8/24/21 1:06 PM, Ani Sinha wrote:
> > On Tue, 24 Aug 2021, Ani Sinha wrote:
> >> On Tue, 24 Aug 2021, Igor Mammedov wrote:
> >>> On Mon, 23 Aug 2021 19:06:47 -0400
> >>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >>>
> >>>> On Sat, Aug 21, 2021 at 08:35:35PM +0530, Ani Sinha wrote:
> >>>>> Bsel property of the pci bus indicates whether the bus supports acpi hotplug.
> >>>>> We need to validate the presence of this property before performing any hotplug
> >>>>> related callback operations. Currently validation of the existence of this
> >>>>> property was absent from acpi_pcihp_device_unplug_cb() function but is present
> >>>>> in other hotplug/unplug callback functions. Hence, this change adds the missing
> >>>>> check for the above function.
> >>>>>
> >>>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> >>>>
> >>>> I queued this but I have a general question:
> >>> I convinced myself that this patch is wrong, pls drop it.
> >>>
> >>>> are all these errors logged with LOG_GUEST_ERROR?
> >>>> Because if not we have a security problem.
> >>>> I also note that bsel is an internal property,
> >>>> I am not sure we should be printing this to users,
> >>>> it might just confuse them.
> >>>>
> >>>> Same question for all the other places validating bsel.
> >>>
> >>> Commit message misses reproducer/explanation about
> >>> how it could be triggered?
> >>>
> >>> If it's actually reachable, from my point of view
> >>> putting checks all through out call chain is not robust
> >>> and it's easy to miss issues caused by invalid bsel.
> >>> Instead of putting check all over the code, I'd
> >>> check value on entry points (pci_read/pci_write)
> >>> if code there is broken.
> >>>
> >>>>
> >>>>> ---
> >>>>>  hw/acpi/pcihp.c | 10 ++++++++--
> >>>>>  1 file changed, 8 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> >>>>> index 0fd0c1d811..9982815a87 100644
> >>>>> --- a/hw/acpi/pcihp.c
> >>>>> +++ b/hw/acpi/pcihp.c
> >>>>> @@ -372,9 +372,15 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> >>>>>                                   DeviceState *dev, Error **errp)
> >>>>>  {
> >>>>>      PCIDevice *pdev = PCI_DEVICE(dev);
> >>>>> +    int bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
> >>>>> +
> >>>>> +    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn), bsel);
> >>>>>
> >>>>> -    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
> >>>>> -                          acpi_pcihp_get_bsel(pci_get_bus(pdev)));
> >>>>> +    if (bsel < 0) {
> >>>>> +        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
> >>>>> +                   ACPI_PCIHP_PROP_BSEL "' set");
> >>>>> +        return;
> >>>>> +    }
> >>>
> >>> 1st:
> >>>  Error here is useless. this path is triggered on guest
> >>>  MMIO write and there is no consumer for error whatsoever.
> >>>  If I recall correctly, in such cases we in PCIHP code we make
> >>>  such access a silent NOP. And tracing is there for a us
> >>>  to help figure out what's going on.
> >>>
> >>> 2nd:
> >>>  if it got this far, it means a device on a bus with bsel
> >>>  was found and we are completing cleanup. Error-ing out at
> >>>  this point will leak acpi_index.
> >>
> >> The above two points seems to apply in this case as well and so should we
> >> do this?
> >>
> >> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> >> index 0fd0c1d811..c7692f5d5f 100644
> >> --- a/hw/acpi/pcihp.c
> >> +++ b/hw/acpi/pcihp.c
> >> @@ -400,12 +400,6 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> >>
> >>      trace_acpi_pci_unplug_request(bsel, slot);
> >>
> >> -    if (bsel < 0) {
> >> -        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
> >> -                   ACPI_PCIHP_PROP_BSEL "' set");
> >> -        return;
> >> -    }
> >> -
> >>      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
> >>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
> >>  }
> >
> > or add g_assert() on both instead.
>
> 'git-blame' & read git history ('git-log -p hw/acpi/pcihp.c')
> often helps to understand how the code evolved and why it is
> not "symmetric".

Right, my mistake was not to dig through the history. Will do that next
time.

For example see:
>
> commit ec266f408882fd38475f72c4e864ed576228643b
> Author: David Hildenbrand <david@redhat.com>
> Date:   Wed Dec 12 10:16:17 2018 +0100
>
>     pci/pcihp: perform check for bus capability in pre_plug handler
>
>     Perform the check in the pre_plug handler. In addition, we need
>     the capability only if the device is actually hotplugged (and not
>     created during machine initialization). This is a preparation for
>     coldplugging pci devices via that hotplug handler.
>
> From here try to figure out what happened, why this changed was
> necessary, why there is no equivalent g_assert() as you noticed.
>

Actually this change isn't very insightful for unplug() callbacks. A more
interesting change is:

(a)
commit c97adf3ccfbfbe6885fd9de7293162489d293d44
Author: David Hildenbrand <david@redhat.com>
Date:   Wed Dec 12 10:16:19 2018 +0100

    pci/pcihp: perform unplug via the hotplug handler

which basically says that the original function
acpi_pcihp_device_unplug_cb() written by Igor got renamed to
acpi_pcihp_device_unplug_request_cb().

Now, in Igor's original version of acpi_pcihp_device_unplug_cb(), it did
have the check. See :

(b)
commit c24d5e0b91d138f8cc95f5694d4964de36a739d3
Author: Igor Mammedov <imammedo@redhat.com>
Date:   Wed Feb 5 16:36:49 2014 +0100

    acpi/piix4pm: convert ACPI PCI hotplug to use hotplug-handler API


Now because of (a) we see acpi_pcihp_device_unplug_request_cb() inherit
the bsel check from acpi_pcihp_device_unplug_cb() but the later no longer
gained it back.

Anyways maybe it is good enough to have the bsel check in the pre-unplug
handler. Still I would argue along the lines of the two points Igor
mentions above that if there is no one to catch the error, why have such
error messages printed on stderr anyway? A trace should be enough.



> Then try to convince the reviewers why in your commit description :)
>
> See:
> https://www.freecodecamp.org/news/writing-good-commit-messages-a-practical-guide/#how-to-write-good-commit-messages

Yes I am aware of this article. Lets have a culture where people are
encouraged to spend their unpaid spare time looking into Qemu/Libvirt and
send patches.
--2088271309-1407008270-1629812028=:894910--

