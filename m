Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5165B623E9B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 10:30:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot3rs-0002Om-4y; Thu, 10 Nov 2022 04:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot3rq-0002Oe-2s
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:29:02 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot3rm-0008HQ-RA
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:29:01 -0500
Received: by mail-pg1-x536.google.com with SMTP id s196so1259560pgs.3
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tdo36KjQn5981X064LxmF4x/YKppU+FsYaF9I5q1hDQ=;
 b=S9NxEcGknzkTetCwqHShHBQ6/h21p+st/tCUHOBrOGFW6FszscE3sNMpmN60XsZElS
 wElbm+u6WTEl346x4N2FZ0KBLUntv2uF6EdDZvOqado33yPIxLTIuVvuHeJHF3pFR9DK
 hOLvyeBzijbqUaGIPO+zlzBzhSblZtSVVUZ28pdpsk5oXNvHaTjsTYLeXGA0KoXzWbv2
 lAXEc1Wz9anYxH9fMlzPW5RVM1RjvQwV57ILxjEiWUXk/sv/z0RLhyPCG37j7u9c6/Mh
 h0O2P3GEbtEzXCgoxDya2ALRHQMnDlWr3hg9aOuzmT5RCOZd0Kn4E26D4NwtTtoquU5X
 whow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tdo36KjQn5981X064LxmF4x/YKppU+FsYaF9I5q1hDQ=;
 b=qZ+2OeCLJFosIAFhjMR4SfBI3u8Rm7QHvMmWTYbtmRDYWgACVmzO0QB+LKaQG2dTfR
 ahGSL594a8F8iJslFD4alDlVZsn1XQFNQTUuGBXVrod0x1RzcF+ow33AlK5nPutMOMRv
 5oR65YgkDKlXT51rRuSsgm/otjrv4QQ4zbOgsp9h6c/l27KBS6gxsB7oltkzts+iqZXa
 mrykkn7fq3fvgv5+r+7EwMFg247jU0jy7Zdy8t51HykyltD/kBdXBH1174ekvW7bjp+I
 pmeBQVF8MYseZOri4KsBjiqU43gemyMSR4HGuB2/Wgs4WhcUrjnlpIP0rgeKgw8cRczi
 vyqQ==
X-Gm-Message-State: ANoB5pnqtI2vSEFGOyLgLvsD7ygVEDcV9IsFXWgmmaib85yXrV6rwFjE
 RKnzw/GqcE8H99myovW1iu9ZKE5kgLq4w/sGSD+zDg==
X-Google-Smtp-Source: AA0mqf4zCcXBBxT9tc9j9BKCYW+9ymazBdOiId7OJLowRkeKbUQ5JjVIcWMBW45uHJON/KpOwI4DCCK1lNray/qgwiE=
X-Received: by 2002:a63:81c6:0:b0:470:537b:9afc with SMTP id
 t189-20020a6381c6000000b00470537b9afcmr21994163pgd.231.1668072536490; Thu, 10
 Nov 2022 01:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-45-mst@redhat.com>
 <e491b2fe-5959-4837-fce9-a7d2cb2448e6@redhat.com>
 <20221109162607-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221109162607-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 09:28:44 +0000
Message-ID: <CAFEAcA974tkv531hxgy8cWkOBcxP1WzzHAThAPxUomMbg6ymRg@mail.gmail.com>
Subject: Re: [PULL v4 44/83] acpi: pc: vga: use AcpiDevAmlIf interface to
 build VGA device descriptors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, 
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 9 Nov 2022 at 21:42, Michael S. Tsirkin <mst@redhat.com> wrote:

> > > diff --git a/hw/display/meson.build b/hw/display/meson.build
> > > index adc53dd8b6..7a725ed80e 100644
> > > --- a/hw/display/meson.build
> > > +++ b/hw/display/meson.build
> > > @@ -38,10 +38,21 @@ softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
> > >   specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
> > > +if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
> > > +    config_all_devices.has_key('CONFIG_VGA_PCI') or
> > > +    config_all_devices.has_key('CONFIG_VMWARE_VGA') or
> > > +    config_all_devices.has_key('CONFIG_ATI_VGA')
> > > +   )
> > > +  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> > > +                                      if_false: files('acpi-vga-stub.c'))
> > > +endif
>
> Igor what does  CONFIG_ACPI mean? It depends on the target but this
> library is target independent. Is this just always built then?

That kind of config symbol means "some machine we want to build needs
ACPI, so build it". So if you build at least one machine that needs
ACPI, CONFIG_ACPI gets defined, and the acpi-specific files are built.
If your QEMU configure line and possibly any custom config file
mean you're not building any ACPI machines, then CONFIG_ACPI is
not defined, and we don't need to build in the acpi-specifics,
which makes the binary smaller. For instance if you set
--target-list=or1k-softmmu then no machine wants ACPI and
CONFIG_ACPI won't get set. If you set --target-list=or1k-softmmu,x86_64-softmmu
then the PC machine types want ACPI and CONFIG_ACPI is set.

(Essentially we're opting to make the build faster by building the
object file once rather than per-target, at the cost of the
executables for the target architectures which don't use the
feature being a bit bigger with code they aren't going to use.)

Note that this means that for a machine type which does not use ACPI, it
may either:
 (1) be being built in the same build as a machine that does use
 ACPI, so be linked against the "real" ACPI source files
 (2) be being built in a build with no ACPI machines, so be
 linked against the stub files

and it also means that the code in the "real" ACPI source files
cannot assume that it's being used in a machine which is actually
using ACPI.

thanks
-- PMM

