Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1989346D140
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 11:45:54 +0100 (CET)
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muuSO-0007d7-Kg
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 05:45:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1muuRJ-0006xy-1b
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 05:44:45 -0500
Received: from [2a00:1450:4864:20::535] (port=44868
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1muuRG-0004Oo-RM
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 05:44:44 -0500
Received: by mail-ed1-x535.google.com with SMTP id l25so6781744eda.11
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dpxl1KtEZ1tBRJF3MQ88M/2MoEzvNdALfVBGtFC5YWE=;
 b=ArOx8s87iNOBz7HCW3Zyo4QV1DiSuhio2YhgEymY4vk8CJNBQotcoRyY2rHJSNKaxg
 VSbOxFvV4qiz9FXuRaRz45v/nuNbXzjOLv6z7q1T8S5ZSiR2dPENMDNj3qePDo+x4076
 jmBt149Sqadl7M/QBZWDNUO9PzEGC3mkW47Xb9/xjvtn8T5nboPnExEtPbVnlSmtErCS
 +zRpCxeqd8vT3xdtu3SPFWOwl/fgqgjgCRo2Js3ReSI5liQeJ0o8VMa6iB7rrGKQV0jO
 M7K3jgLfvN9R6gfY+cNMuCxqgRX/h+H4RkG6J3bxikpLDAWf5QNsvCN22j6gZOsxm3Dg
 xXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dpxl1KtEZ1tBRJF3MQ88M/2MoEzvNdALfVBGtFC5YWE=;
 b=1/szPnx+pFkXedskRV0ecRsLwqdq0dxRE3TeQpgPXxNnjbKnoObYJSMDHV6Lq/pQWY
 MnComEQFWdjJC68SchuypEqTAh9fOlUKSlpN5CchWRXZlORAaSuRtkyBsklclK+2+OqL
 /6OFy2frGRj6IDddKbqBFlbwOiq4KVGmQuo12A1MnMJVvyfi+jLV4AWynK4xBS/isqds
 /CmNO2wovZK+4OF1p+ozGiOFhDkfNpBltZr4/MiO633i+U7LF4nNTX1NquSkAsn2rBLt
 5/GAKChRdX4WS7Yw63vDNKnbeIt9LwF6YaTJlcJpXfaYKIR+UR0eWDEUluFEwrWl17IO
 pBfw==
X-Gm-Message-State: AOAM533O0cuxM78CSwDWpqRTWvuvrz9Zf5xHgFFkvAuSWR20uaL9m5+k
 YtL4y7NYbwBf2OuQHqFK58mp35VadV9EWDitJZstGw==
X-Google-Smtp-Source: ABdhPJzhgwmoMHZUeBwWsmlQ32HKUcefjL4wEuiS4Lt6urjaOpzA9Y/XecxxASP5akK1mdl0dyMP6uGtAlj2In824qI=
X-Received: by 2002:a17:907:e8b:: with SMTP id
 ho11mr6781258ejc.430.1638960280628; 
 Wed, 08 Dec 2021 02:44:40 -0800 (PST)
MIME-Version: 1.0
References: <20211119090718.440793-1-lvivier@redhat.com>
 <20211119090718.440793-4-lvivier@redhat.com>
 <20211208023603-mutt-send-email-mst@kernel.org>
 <6764b29d-3885-ec0e-0b90-f0c05a544571@redhat.com>
In-Reply-To: <6764b29d-3885-ec0e-0b90-f0c05a544571@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 8 Dec 2021 16:14:29 +0530
Message-ID: <CAARzgwyux1QZVxu797L-p_GdNDHSDQ_e1OJ=2js0g1N2zUjyfQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] failover: fix unplug pending detection
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x535.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 8, 2021 at 1:20 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 08/12/2021 08.36, Michael S. Tsirkin wrote:
> > On Fri, Nov 19, 2021 at 10:07:17AM +0100, Laurent Vivier wrote:
> >> Failover needs to detect the end of the PCI unplug to start migration
> >> after the VFIO card has been unplugged.
> >>
> >> To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
> >> pcie_unplug_device().
> >>
> >> But since
> >>      17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
> >> we have switched to ACPI unplug and these functions are not called anymore
> >> and the flag not set. So failover migration is not able to detect if card
> >> is really unplugged and acts as it's done as soon as it's started. So it
> >> doesn't wait the end of the unplug to start the migration. We don't see any
> >> problem when we test that because ACPI unplug is faster than PCIe native
> >> hotplug and when the migration really starts the unplug operation is
> >> already done.
> >>
> >> See c000a9bd06ea ("pci: mark device having guest unplug request pending")
> >>      a99c4da9fc2a ("pci: mark devices partially unplugged")
> >>
> >> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> >
> > Hmm.  I think this one may be needed for this release actually.
> > Isolate from testing changes and repost?
>
> You merged it already here:
>
>   https://gitlab.com/qemu-project/qemu/-/commit/9323f892b39d133eb6

Yes I pointed this out in the other thread. Michael was not CC'd there
somehow ...

>
> so we should be fine :-)
>
>   Thomas
>

