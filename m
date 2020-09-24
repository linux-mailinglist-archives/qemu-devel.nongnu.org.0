Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA1276F1D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 12:56:26 +0200 (CEST)
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLOvJ-0001tb-KB
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 06:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kLOu8-00014U-5y
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 06:55:12 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kLOu6-00011k-63
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 06:55:11 -0400
Received: by mail-wm1-x342.google.com with SMTP id q9so3060865wmj.2
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 03:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zxe1VZ8qHXPjfPzjZqksD+WKb0tl9KAVcqEEYDz3VXM=;
 b=AkaG2Xmf5i9Gycb7WrxMMKJpVaCEGfnLqKomKOnFzRLb0BufFKQ0Z/Q97872L/K3lU
 E2Ix1kQeT/IEhHNU1Mp5R/tPdCOPVbtc8SfBPJpJ1ksPo3iP7h19GMhgS8G23C6sXW42
 7oarQlPQ7OZMfsZCYHIuIwIBTfXBgerv9o4NB0yyJ1e3XGa+jVkX6r1B0kdgk3vIKgcE
 /e7dNaOnY+6fzsdZzbAhvbtD6B8CffV/UKc58BkMJdFxWPH1M1RkzspM4UQnHAFOABaN
 QwipfAcK+CKlkppx/aogSYWxouUeu4JYKxlYggzDRcR4PtrH2DbRBtkbkKceXjOsOlr3
 7e4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zxe1VZ8qHXPjfPzjZqksD+WKb0tl9KAVcqEEYDz3VXM=;
 b=IMVAK2fjr5IfovP9LKqXHBUplyFJPJXTBrBXwKjqlVx4A6gcLdSd8DiYXvfAH1kyRm
 JRDzBzyuRqsrsnvygzYzy7kkx68UggeMllHaRIMt9R7x/JuI8U9zEgye/r9622HtP2Oi
 BBeFd1Uz1E+p1T1m8tabgPoMpjnFcD4hwlPVtAJpoJEAzjTt0H73PaiXhWO7F3BQuyxw
 oSbU714klqCmHEgjJ7O7S9HaQ3hxSdHqcyn5b1OfIi3ThwpH+M8bwD/PWwmNJn2BM/po
 wDZeRZsknOAkJAEjGFMOam08m7nboTXTQn16p6Ukon1n5UgdjMuEyD2X7c6hNcePZ1r1
 HcKQ==
X-Gm-Message-State: AOAM5317b3PTZOEHPplKXp3TzZ78qvYlcaS5GfkosBUl8NIUgsNSB66N
 c+H0upuyJ7BNd9IM0qty6St8w/3hZj2zbd6dDwMCDA==
X-Google-Smtp-Source: ABdhPJxVxhOFf+eUONx/ClkSIl6MgE0GHgM5agHTLc58z5q4A0mrzh/l/Ik81vjAWdEKgGKqAX0ByxeaEBlTN2HkAPA=
X-Received: by 2002:a1c:7405:: with SMTP id p5mr4109307wmc.35.1600944908576;
 Thu, 24 Sep 2020 03:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200924070013.165026-1-jusual@redhat.com>
 <20200924070013.165026-2-jusual@redhat.com>
In-Reply-To: <20200924070013.165026-2-jusual@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 24 Sep 2020 16:24:57 +0530
Message-ID: <CAARzgwyt4uK5cLo_+xHmM4RB+HsKRzY0D-8hR_C02vBXRoQ+BA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/7] hw/acpi/pcihp: Enhance
 acpi_pcihp_disable_root_bus() to support Q35
To: Julia Suvorova <jusual@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::342;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 24, 2020 at 12:30 PM Julia Suvorova <jusual@redhat.com> wrote:
>
> PCI Express does not allow hot-plug on pcie.0. Check for Q35 in
> acpi_pcihp_disable_root_bus() to be able to forbid hot-plug using the
> 'acpi-root-pci-hotplug' flag.

I think what this change is doing here is making
acpi_pcihp_disable_root_bus() function compatible with q35 as well.

>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  hw/acpi/pcihp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 39b1f74442..ff23104aea 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -107,13 +107,14 @@ static void acpi_set_pci_info(void)
>  static void acpi_pcihp_disable_root_bus(void)
>  {
>      static bool root_hp_disabled;
> +    Object *host = acpi_get_i386_pci_host();
>      PCIBus *bus;
>
>      if (root_hp_disabled) {
>          return;
>      }
>
> -    bus = find_i440fx();
> +    bus = PCI_HOST_BRIDGE(host)->bus;
>      if (bus) {
>          /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
>          qbus_set_hotplug_handler(BUS(bus), NULL);
> --
> 2.25.4
>

