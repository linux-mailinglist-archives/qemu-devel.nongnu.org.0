Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F8401976
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:07:13 +0200 (CEST)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBWy-0006od-93
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNBTY-0003gn-Pg
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:03:41 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNBTW-0005H3-UN
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:03:40 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 18so5241415pfh.9
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=qWRu7TMnlPhUrI07PqeO5jdTWrS5eCErLAi3aTmUiME=;
 b=AmmIVFJqivL2yF+CsnHIhzDaacrNNwJByRjX9Bgb8CE4O6iXohj+a82FTUjtZF5zzK
 lpPSg+xPITTMCkvOlgNh2BD/XW7cx2znlyMMOeZ9Y4KmZFF9uDCbKf/tklhz9cEwjs2i
 9Uw/dPuV6ux7CZsj9K0/Z3wh3uG/X7WVbupm7uxFqzVdyNyZg6ew6Bnmr3luIjNOuHf+
 uoESfKGwdk/vlaopFVovETGRyYgfb1AsKij8muo9M1oWUJ0jsefQYt1geQsMQWb5Lo/l
 T+FWlm02qUTDiGL659d6mk7shSpnLiUSCz4yOs+gWDyK0RGblhnwrCJ4XDxIT8oAZIg3
 bzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=qWRu7TMnlPhUrI07PqeO5jdTWrS5eCErLAi3aTmUiME=;
 b=c+dGnN99MelavK3ht24hjvcy+IDK6yRa1ND/HQyhVNfUHADewjGcY/UQV2ROHTBDHx
 6VnN+sA8AAl4JEKdaLDOe7b9ww3rKoXEg3rtBRY3RqYEFURHk5a/ysjTOyGYQeTQfpWt
 aYmehwM18Ij+vRehLxe57SOaKyxpORkOYmrxb0b7NY2cN9WjIzO0Ipedregdb2J6JVlw
 Q7bxhNSQdpOGrGWHNDm6F/1PO168PowvHkmzL08IfDyDq9zDuI8BvwYVsuDOma/asGQM
 V0EVoOMznN1LFhD9BdAESjwV1kA+m3BqelKdq7Vv8pmSEv3TR6P9fYXK3+rb07HF4wGs
 S4Rg==
X-Gm-Message-State: AOAM5301nGsX9Utz2Skmdsd1aWiM/CUw6V8MQ2L8WJ5eD2y+w51cnGr5
 3qOZFmMB4QCFlhZZOsYKgRAlFg==
X-Google-Smtp-Source: ABdhPJy8KFv7DNk4r/6KZUAO6ntC+ArPyUeJMNUA1jGN83Vv0IcmRqvb+ZVMbifjQtW3WPjow1qk6A==
X-Received: by 2002:aa7:900f:0:b0:414:c645:3d3 with SMTP id
 m15-20020aa7900f000000b00414c64503d3mr8013545pfo.51.1630922617129; 
 Mon, 06 Sep 2021 03:03:37 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.142.175])
 by smtp.googlemail.com with ESMTPSA id s5sm9101426pgp.81.2021.09.06.03.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 03:03:36 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 6 Sep 2021 15:33:31 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
In-Reply-To: <6a9c2fde-317d-bd31-5a8c-135446b881dc@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2109061531570.2070064@anisinha-lenovo>
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <6a9c2fde-317d-bd31-5a8c-135446b881dc@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1487622057-1630922616=:2070064"
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1487622057-1630922616=:2070064
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Mon, 6 Sep 2021, Philippe Mathieu-Daudé wrote:

> Hi Ani,
>
> On 9/4/21 11:36 PM, Michael S. Tsirkin wrote:
> > From: Ani Sinha <ani@anisinha.ca>
> >
> > Currently various acpi hotplug modules like cpu hotplug, memory hotplug, pci
> > hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is turned on.
> > This brings in support for whole lot of subsystems that some targets like
> > mips does not need. They are added just to satisfy symbol dependencies. This
> > is ugly and should be avoided. Targets should be able to pull in just what they
> > need and no more. For example, mips only needs support for PIIX4 and does not
> > need acpi pci hotplug support or cpu hotplug support or memory hotplug support
> > etc. This change is an effort to clean this up.
> > In this change, new config variables are added for various acpi hotplug
> > subsystems. Targets like mips can only enable PIIX4 support and not the rest
> > of all the other modules which were being previously pulled in as a part of
> > CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 needs but
> > are not required by mips (for example, symbols specific to pci hotplug etc)
> > are available to satisfy the dependencies.
> >
> > Currently, this change only addresses issues with mips malta targets. In future
> > we might be able to clean up other targets which are similarly pulling in lot
> > of unnecessary hotplug modules by enabling ACPI_X86.
> >
> > This change should also address issues such as the following:
> > https://gitlab.com/qemu-project/qemu/-/issues/221
> > https://gitlab.com/qemu-project/qemu/-/issues/193
>
> FYI per https://docs.gitlab.com/ee/administration/issue_closing_pattern.html
> this should have been:
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/193
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/221
>

Ah my apologies. Will do this next time.

> Can we close these issues manually?

Since both you and I have verified that those issues gets fixed with my
change, yes we can close them. I do not have a gitlab account. Should I
have one? Is there special permissions needed to handle these tickets?

>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > Message-Id: <20210812071409.492299-1-ani@anisinha.ca>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  configs/devices/mips-softmmu/common.mak |  5 +--
> >  hw/acpi/acpi-cpu-hotplug-stub.c         | 50 +++++++++++++++++++++++++
> >  hw/acpi/acpi-mem-hotplug-stub.c         | 35 +++++++++++++++++
> >  hw/acpi/acpi-nvdimm-stub.c              |  8 ++++
> >  hw/acpi/acpi-pci-hotplug-stub.c         | 47 +++++++++++++++++++++++
> >  hw/acpi/Kconfig                         | 10 +++++
> >  hw/acpi/meson.build                     | 14 +++++--
> >  7 files changed, 161 insertions(+), 8 deletions(-)
> >  create mode 100644 hw/acpi/acpi-cpu-hotplug-stub.c
> >  create mode 100644 hw/acpi/acpi-mem-hotplug-stub.c
> >  create mode 100644 hw/acpi/acpi-nvdimm-stub.c
> >  create mode 100644 hw/acpi/acpi-pci-hotplug-stub.c
>
>
--2088271309-1487622057-1630922616=:2070064--

