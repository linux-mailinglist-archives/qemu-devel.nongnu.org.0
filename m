Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539EE584309
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:25:27 +0200 (CEST)
Received: from localhost ([::1]:60488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5OA-0007P0-Hv
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH553-0004bq-St
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:05:41 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:33734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH551-0003x0-5u
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:05:40 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31e47ac84daso22961047b3.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 08:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5YWdvZYkK7KX/mswlX25uaW5Iut/iGSNImCYSafBoN8=;
 b=yzgpQ2oaxerB4JJmUeCL4c4O0g6R9irK+9aSD1d8HqIWJ3KVzzBsS1M3ZxtizuxbXQ
 Gbw8xNJ1p6oZ4y4sJJJC16ZUj/3RycWn+HolF6JNrN8K6USm31kCWUGdFkBl6YBwmSTu
 PkcjZ27lYanlmIWCFoPTb0G2eL3uY1G//b+xXU7eucJVOrhD1nfeqnbYMSK+PVNKjXdk
 +kmoy0CbgmJ27qFMHW2zyP9ZasnegVvdQ9bBPWXOs/nmpM6eO8Iqp4T3YE8ccYSx1HHF
 6NWCdrGjeh2RUGxBTdZ+NRXm7CtbGwHDW416Lvia5j+bwNvJVTqKIi/HsqnQlcYGSlpD
 4F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5YWdvZYkK7KX/mswlX25uaW5Iut/iGSNImCYSafBoN8=;
 b=2mRoCD849tosA4aYMU8MyNO+JxTrGBgAwm5e7EZ3b15etajV7tCOX4B7khUTMt7up6
 LKdHp8cHZR+Ilt/g8cUSEN8sdujPsmOUrXXkdkUqta95zzTydw6jkNQsyDMW4bHC1Kvw
 kgNB0TmhIIMODUjqyN4UIYp4YiFk9V4kA2dVJRWZpw2hSv7tipXZrF4Rkyc0GbhuHjcD
 XiJ+YdYPMtGC/iOnWFAWBK+c+QKARGNaLamdzqPlJbFQOqLRzfs2f2cq+/McdQLkzwuU
 T67PfHXfAoUQ01i4ttVWGdEZsnU7aWQz/UwENs90Fo1Ci8UuZvKsNIvAelurE/EmS44c
 DdlA==
X-Gm-Message-State: AJIora+L0cbGFga8RY8pReEWHebrPAxZrOKFQphXIwbd0ORonoKoxt8a
 idnqtY+xtR7cVloKIAytRFkpPaOkjq3H3y+xYKPCAA==
X-Google-Smtp-Source: AGRyM1ux5gaS4AYLXFzICmbR+Srf7EwPjmZUAYk5kM9cm+zqK8MTzzjpgzi9Vx8Ehp2VC4tq/EsY1a9wz1hOLemJxsg=
X-Received: by 2002:a0d:cc0d:0:b0:31f:8a70:38e0 with SMTP id
 o13-20020a0dcc0d000000b0031f8a7038e0mr6318295ywd.347.1659020737987; Thu, 28
 Jul 2022 08:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <YuKgxM4IjAXh/goO@work-vm>
In-Reply-To: <YuKgxM4IjAXh/goO@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 16:04:58 +0100
Message-ID: <CAFEAcA-Bzbw6MY2kir5fWezQmet6BWD=B+qS6uetsxRvPbdyCQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, ani@anisinha.ca, 
 mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 28 Jul 2022 at 15:44, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Igor Mammedov (imammedo@redhat.com) wrote:
> > QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
> >   $ qemu-system-mips -monitor stdio
> >   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> >   Segmentation fault (core dumped)
> >
> > It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> > which are valid only for x86 and not for MIPS (as it requires ACPI
> > tables support which is not existent for ithe later)
> >
> > Issue was probably exposed by trying to cleanup/compile out unused
> > ACPI bits from MIPS target (but forgetting about migration bits).
> >
> > Disable compiled out features using compat properties as the least
> > risky way to deal with issue.
>
> Isn't the problem partially due to a 'stub' vmsd which isn't terminated?

Yes, but setting these properties causes that vmsd
(vmstate_acpi_pcihp_pci_status) to not be used:

 * it is used only in VMSTATE_PCI_HOTPLUG()
 * that macro is used only in hw/acpi/ich9.c (not relevant here) and
   hw/acpi/piix4.c
 * in piix4.c it is invoked passing it the test functions
   vmstate_test_use_acpi_hotplug_bridge and
   vmstate_test_migrate_acpi_index
 * setting the properties on the device as this patch does
   causes those test functions to return false, so the
   vmstate_acpi_pcihp_pci_status is never examined

-- PMM

