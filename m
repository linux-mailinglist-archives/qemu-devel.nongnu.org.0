Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEBD3D902C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 16:13:52 +0200 (CEST)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8kJj-0001jy-IC
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 10:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m8kIj-00014D-9f
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:12:49 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m8kIg-0005xr-7j
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:12:48 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso4330790pjo.1
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=d+FXGWPL9qq3D4ZFcJesLA54aMQo+5RH+k4/fDfg0/0=;
 b=gJ64OFeZBbPOnWum1QrKhwzk5N3QGcOSpYL4zvrkqS7J/PKu0IACawLmxyT8h28RmP
 uydHbtk7NJv91xqlK8NiidO1Udn9J26R47fQeem7asVdDrVw+qA7MUHikYyFardLyEcm
 kjvIHH6Bbitut14BwkEP11h3vOwvyRpqKskvs9Dlp76DyBXcVCzfkiQ21jPbE56HTZel
 9ZBYjdjoRM/GnpHlYmjSy0BchMdobvmlDdfpDTWIS3u4og/rR8i+au0ieh525Sv7XBN9
 x5BWvbtlTfRDfJxBZgrFXT/kBgNg7jYg8CvJMlmgrWNIkqa2zWJRM0jb6iZYnqT+w2ar
 yLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=d+FXGWPL9qq3D4ZFcJesLA54aMQo+5RH+k4/fDfg0/0=;
 b=nczzYC4SYlTnS98aapYy+AiJVHiXvvHKHb7PwoK8ISMf0flHN3AHzPT73Z4eLFixSE
 AuNpfk6xKbSKLMj7YxxHYKaY5tm12qMtb/LJ+bSdPL04nDD4PHDEK2hYcaqsuJTKYSmw
 k+00YJZwlxZadDQbqRsZYc5umF8djWWaC+3ooxwMG2dyktf+FcoMXha8EnZsNHgYb/6h
 XNdAi87ibo/s8jtwEdlNzYcGxByO9etB5yuDkryUWaB0yGQVNVp1pq/8w85Ki31H1fCk
 NioZ+sv2EWz9CyMxArb5UfwsQnznqvSQ4Xxk9IivndoiwOaClRMaat/09dF8hEiaKEHn
 gAng==
X-Gm-Message-State: AOAM531Vlze1DygKcAc9ps9JeKNBgu0OhD4Kg6rTf56Ya2SBbV/JPOXh
 i4zWUtXAOruaj/YkEHJMhsZXAg==
X-Google-Smtp-Source: ABdhPJw7dPpBObZ9/qNjGhb2ShLK27uAOfaXoLWuy1Y2bb3B4JIdMdcNGdzop1Gz0I++fMOzHRjjiw==
X-Received: by 2002:a17:90a:19db:: with SMTP id
 27mr10060779pjj.216.1627481563272; 
 Wed, 28 Jul 2021 07:12:43 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.109.28])
 by smtp.googlemail.com with ESMTPSA id l11sm6018574pjg.22.2021.07.28.07.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:12:42 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 28 Jul 2021 19:42:26 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
In-Reply-To: <20210728085437-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2107281940020.352775@anisinha-lenovo>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210728085437-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1031.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, jusual@redhat.com,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 28 Jul 2021, Michael S. Tsirkin wrote:

> On Mon, Jul 26, 2021 at 10:27:43PM +0530, Ani Sinha wrote:
> > All existing code using acpi_get_i386_pci_host() checks for a non-null
> > return value from this function call. Instead of returning early when the value
> > returned is NULL, assert instead. Since there are only two possible host buses
> > for i386 - q35 and i440fx, a null value return from the function does not make
> > sense in most cases and is likely an error situation.
>
> add "on i386"?
>
> > Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
>
> This that seems inappropriate, this is not a bugfix.
>
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
>
>
> Frankly I don't see this as a useful cleanup.
> assert is generally a last resort thing.
>

Igor pushed in the direction of assertion. Otherwise, see my v2.

> > ---
> >  hw/acpi/pcihp.c      |  8 ++++++++
> >  hw/i386/acpi-build.c | 15 ++++++---------
> >  2 files changed, 14 insertions(+), 9 deletions(-)
> >
> > changelog:
> > v1: initial patch
> > v2: removed comment addition - that can be sent as a separate patch.
> > v3: added assertion for null host values for all cases except one.
> >
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index f4d706e47d..054ee8cbc5 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -116,6 +116,12 @@ static void acpi_set_pci_info(void)
> >      bsel_is_set = true;
> >
> >      if (!host) {
> > +        /*
> > +         * This function can be eventually called from
> > +         * qemu_devices_reset() -> acpi_pcihp_reset() even
> > +         * for architectures other than i386. Hence, we need
>
> why call out i386 here? well because currently host
> is only non-null for q35 and i440fx which are both i386.
> all the above is not a given and we won't remember to update
> the comment if we change it. Generally graceful failure
> is the default or should be.

Hmm. there is much debate to be had about graceful and unfraceful
failures :-) Some might say ungraceful failures helps to catch issues
earlier before the state is messed up.


