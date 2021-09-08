Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC28403D93
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:27:02 +0200 (CEST)
Received: from localhost ([::1]:38448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0Pd-00078f-BP
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mO0NT-00051L-E2
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:24:47 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mO0NQ-0007Nc-7K
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:24:46 -0400
Received: by mail-pl1-x634.google.com with SMTP id bb10so1651173plb.2
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=HnnoxkaaiUPv0iwRiW6NSmS4NDj4G2WaCLJSgQhEHrI=;
 b=AeI7OBXVihIpw4Zpxc0iuOOoLUeHaWov6G+sorb6OBHKbKht4IACQnk4jWvoQaYVEb
 nDhFMqcI2DW4ANDOUqWQeY0swFG9bUrDXWgUreFJLUBEkUyyZBlU3LVKSG0jiTHfVtsh
 +wCewWg21biqkTY+xH1Mx2v8gmOrxmPAgcrfW+/DDX/t4ePOouoQ/6d0Ez8FepAObg2f
 6FKA3JYSK9L9FPY3kl2aEAVrFqN7P94hibRVxqEui9Olb/sXPND6j6jyTgCLxXzV1tT/
 hJ6+HxKfnTC26CWimOkV9W6ICq1UANBq1q6S8NkSIQEAkdERK4NDaYaaPfFVKPjMrpqw
 58ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=HnnoxkaaiUPv0iwRiW6NSmS4NDj4G2WaCLJSgQhEHrI=;
 b=pa57RrOQlLwaiuw2qtGO6fdAthabaPWjp73c1xf7wdJmB1vnN6cKX19rC0L0w82rXw
 6E9IEKcMqMtgboBjf1gIx9kFbc0slUm3LZ+2IaxvHDOBpsYGT8WgjV2bLt97AGyjzd0q
 z49cCNdpRLLl0vgyOc4Nvob15gxDZ3c8V283nqtzlGVepsJ2xyh5gxW0LRqZ7SF6dWbt
 nJ+mny0fvUCMGsVd1PVfVp6l6LhA6ZdMyu3VZH/MTD6/pj02uI7Xx+UHE2CdzzYBPugy
 BR+YQx44NHBeSL2aCemcQAytwFetxAOUujgzMJcXcF7Qj2ifluY67tW1+bjsD3kDbLf0
 5KmQ==
X-Gm-Message-State: AOAM532CxgnKpJiG81F/M7zJnPlnk8P8AQjG0jQaqA6CPzalDry5P+wu
 8efgwAzarrO7de/QhGiX8YAetQ==
X-Google-Smtp-Source: ABdhPJxr2C/giraMvph/ug97WIt1UNvn9YqeQZ2IcGXpjbji6Vlq7qRe1HFyQ/PfHyTfWhXFidvYJA==
X-Received: by 2002:a17:903:31d6:b0:133:9932:6998 with SMTP id
 v22-20020a17090331d600b0013399326998mr3700063ple.45.1631118281451; 
 Wed, 08 Sep 2021 09:24:41 -0700 (PDT)
Received: from anisinha-lenovo ([203.212.242.77])
 by smtp.googlemail.com with ESMTPSA id q3sm3863764pgf.18.2021.09.08.09.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 09:24:40 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 8 Sep 2021 21:54:35 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi
 pci hotplug
In-Reply-To: <55495984-43ba-0b93-db74-e7f8602be178@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2109082150400.2561342@anisinha-lenovo>
References: <20210908041139.2219253-1-ani@anisinha.ca>
 <20210908084256.6077f7a3@redhat.com>
 <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
 <20210908104351.72d0bb19@redhat.com>
 <55495984-43ba-0b93-db74-e7f8602be178@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1139193803-1631118280=:2561342"
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x634.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1139193803-1631118280=:2561342
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 8 Sep 2021, Philippe Mathieu-Daudé wrote:

> On 9/8/21 10:43 AM, Igor Mammedov wrote:
> > On Wed, 8 Sep 2021 12:51:04 +0530 (IST)
> > Ani Sinha <ani@anisinha.ca> wrote:
> >
> >> On Wed, 8 Sep 2021, Igor Mammedov wrote:
> >>
> >>> On Wed,  8 Sep 2021 09:41:39 +0530
> >>> Ani Sinha <ani@anisinha.ca> wrote:
> >>>
> >>>> Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> >>>> selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
> >>>> starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that this address
> >>>> range was free and available. However, upon more testing, it seems this address
> >>>> range to be not available for some latest versions of windows.
> >>>
> >>> The range is something assigned by QEMU, and guest has no say where it should be.
> >>> but perhaps we failed to describe it properly or something similar, so one gets
> >>> 'no resource' error.
> >>
> >> OK dug deeper. The existing range of IO address conflicts with the CPU
> >> hotplug range.
> >>
> >> CPU hotplug range (ICH9_CPU_HOTPLUG_IO_BASE) is 0x0cd8 to 0x0ce3
> >>
> >> This intersects with range 0x0cc4 to 0x0cdb for ACPI_PCIHP_ADDR_ICH9 .
> >
> > Looking at 'info mtree' it's indeed wrong:
> >
> >     0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
> >     0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug
> >
> > which of them eventually handles IO request in intersection range?
>
> (qemu) info mtree -f
> FlatView #0
>  AS "I/O", root: io
>  Root memory region: io
>   0000000000000cc4-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
>   0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug
>
> >
> > Please, add to commit message your findings, so it would point out
> > where problem comes from and what it breaks(doesn't work as expect).
> >
> > Given it's broken to begin with (and possibly regression if it broke cpu hotplug),

right. I did some foresic analysis on this. So the value 0x0cc4 comes from
the original RFC patch unchanged that Julia posted:

https://patchew.org/QEMU/20200924070013.165026-1-jusual@redhat.com/20200924070013.165026-3-jusual@redhat.com/

Meanwhile, between the time that RFC patch was posted and when it was
actually pushed, you made the following change:
b32bd763a1ca9296 ("pci: introduce acpi-index property for PCI device")

This change did this:

-#define ACPI_PCIHP_SIZE 0x0014
+#define ACPI_PCIHP_SIZE 0x0018

So now the IO address ranges are no longer mutually exclusive :-)

--2088271309-1139193803-1631118280=:2561342--

