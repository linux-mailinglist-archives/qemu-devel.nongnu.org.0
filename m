Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EADA4094B2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:32:57 +0200 (CEST)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPn0y-0005q7-8u
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mPmsX-0003pl-OX
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:24:13 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mPmsU-00076z-C6
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:24:13 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so116577pjq.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=aM69fyP1zEq7kGW5vWfbCS9FfRiteunujnvq2JKzKfA=;
 b=ZtfHC7a77V2kx6oCG8uxeg6iw32N5+o1qFs1YhySfEZaO8QYLqo1my974uuwe/rMhA
 j17b5F/m3oywYLXkFyeQTL7MW3s902L3CIlJxBcbFFPKde7HtLiEU7JTwCgewcRZRbhT
 7Ie6/q+Vh1FGzYQ+To3n1RfstDPVNpPhRfRTGfMXmZN1YcSMGCVVROHEiAVShanRdwir
 zzIj9CTfSgLEqdoqrosDXkAXXiEnmVocK2RCWI2Ws7hgwVGlCqg1LAQeu6sHmsErC38D
 28C/cHKTTyG0Mj6vU387z8FcZx54wWiD2YZ61knxsgPW2xU81zo9qSIuUL8yZCE6acNs
 1JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=aM69fyP1zEq7kGW5vWfbCS9FfRiteunujnvq2JKzKfA=;
 b=2bAtf/a0Q0OcWI/m40EZurKjNu9hgOZXsEkIJE2k5lbZGOhWrpHqikX45VuOpFa4CE
 v4Xz4LbIc3RgFj1f1yNfO4Ti7LbS7lVM32ccn/k4pXftmXy6bZNKdSTHS1XhInaA1IL6
 Lv86RsvbOth0Qrcgd/TiMA/llrOIKNZwIVnOKdxGEbGYBonAtYWPhRle9Gy3OWKjXZX5
 ZWYCWiBbhnnWEfcI949pPj/Zo/dfK+i6mVn9tyWpRI7yN871rJhJ4kGnZ0+3s8YtkxzH
 dV9SMfp5aQR1U0+BP+dYMPD9Olo92H8QM5uLePpVLeiI+1U3qbKQ/ZR0NkebUBSNiU26
 Ab4A==
X-Gm-Message-State: AOAM533LG3oOlVmRh4mgUjAW40pdgcsNJhe9PJHoReJbhGKUKF5EmPNh
 T8EiVCunSk5jLZ3jjZ28mgABOQ==
X-Google-Smtp-Source: ABdhPJzbM0HabKVfK6/ml2gzlvxS2top2tUZEhhXb8eHlMu7B8XKLuVAwbU8p2GuFhF7KICPE4Vqlw==
X-Received: by 2002:a17:903:11c5:b0:138:ce68:68b6 with SMTP id
 q5-20020a17090311c500b00138ce6868b6mr10621215plh.35.1631543046383; 
 Mon, 13 Sep 2021 07:24:06 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.126.179])
 by smtp.googlemail.com with ESMTPSA id s26sm7248731pfw.5.2021.09.13.07.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 07:24:05 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 13 Sep 2021 19:53:59 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi
 pci hotplug
In-Reply-To: <20210908104351.72d0bb19@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2109131953001.3006962@anisinha-lenovo>
References: <20210908041139.2219253-1-ani@anisinha.ca>
 <20210908084256.6077f7a3@redhat.com>
 <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
 <20210908104351.72d0bb19@redhat.com>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 8 Sep 2021, Igor Mammedov wrote:

> On Wed, 8 Sep 2021 12:51:04 +0530 (IST)
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Wed, 8 Sep 2021, Igor Mammedov wrote:
> >
> > > On Wed,  8 Sep 2021 09:41:39 +0530
> > > Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > > Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> > > > selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
> > > > starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that this address
> > > > range was free and available. However, upon more testing, it seems this address
> > > > range to be not available for some latest versions of windows.
> > >
> > > The range is something assigned by QEMU, and guest has no say where it should be.
> > > but perhaps we failed to describe it properly or something similar, so one gets
> > > 'no resource' error.
> >
> > OK dug deeper. The existing range of IO address conflicts with the CPU
> > hotplug range.
> >
> > CPU hotplug range (ICH9_CPU_HOTPLUG_IO_BASE) is 0x0cd8 to 0x0ce3
> >
> > This intersects with range 0x0cc4 to 0x0cdb for ACPI_PCIHP_ADDR_ICH9 .
>
> Looking at 'info mtree' it's indeed wrong:
>
>     0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
>     0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug
>
> which of them eventually handles IO request in intersection range?
>
> Please, add to commit message your findings, so it would point out
> where problem comes from and what it breaks(doesn't work as expect).
>
> Given it's broken to begin with (and possibly regression if it broke cpu hotplug),
> I'm inclined to fix it without adding compat stuff.
> Michael, what do you think?
>

Michael, we would need your inputs on this one.

